from ..aiot.awsiot import mqtt
import sys
import threading
from uuid import uuid4
import time
import cv2
import numpy as np

# This sample uses the Message Broker for AWS IoT to send and receive messages
# through an MQTT connection. On startup, the device connects to the server,
# subscribes to a topic, and begins publishing messages to that topic.
# The device should receive those same messages back from the message broker,
# since it is subscribed to that same topic.

# python3 aws-iot-device-sdk-python-v2/samples/pubsub.py 
# --endpoint a1bzo7baf8mrhu-ats.iot.us-east-1.amazonaws.com 
# --ca_file root-CA.crt 
# --cert dhk_pc.cert.pem 
# --key dhk_pc.private.key 
# --client_id basicPubSub 
# --topic sdk/test/Python 
# --count 0

# Parse arguments
from ..aiot.samples import command_line_utils

cmdUtils = command_line_utils.CommandLineUtils("PubSub - Send and recieve messages through an MQTT connection.")
cmdUtils.add_common_mqtt_commands()
cmdUtils.add_common_topic_message_commands()
cmdUtils.add_common_proxy_commands()
cmdUtils.add_common_logging_commands()
cmdUtils.register_command("key", "<path>", "Path to your key in PEM format.", True, str)
cmdUtils.register_command("cert", "<path>", "Path to your client certificate in PEM format.", True, str)
cmdUtils.register_command("port", "<int>", "Connection port. AWS IoT supports 443 and 8883 (optional, default=auto).", type=int)
cmdUtils.register_command("client_id", "<str>", "Client ID to use for MQTT connection (optional, default='test-*').", default="test-" + str(uuid4()))
cmdUtils.register_command("count", "<int>", "The number of messages to send (optional, default='10').", default=10, type=int)
cmdUtils.register_command("is_ci", "<str>", "If present the sample will run in CI mode (optional, default='None')")
# Needs to be called so the command utils parse the commands
cmdUtils.get_args()

raw_img = None
received_count = 0
received_all_event = threading.Event()
is_ci = cmdUtils.get_command("is_ci", None) != None


# Callback when connection is accidentally lost.
def on_connection_interrupted(connection, error, **kwargs):
    print("Connection interrupted. error: {}".format(error))


# Callback when an interrupted connection is re-established.
def on_connection_resumed(connection, return_code, session_present, **kwargs):
    print("Connection resumed. return_code: {} session_present: {}".format(return_code, session_present))

    if return_code == mqtt.ConnectReturnCode.ACCEPTED and not session_present:
        print("Session did not persist. Resubscribing to existing topics...")
        resubscribe_future, _ = connection.resubscribe_existing_topics()

        # Cannot synchronously wait for resubscribe result because we're on the connection's event-loop thread,
        # evaluate result with a callback instead.
        resubscribe_future.add_done_callback(on_resubscribe_complete)


def on_resubscribe_complete(resubscribe_future):
        resubscribe_results = resubscribe_future.result()
        print("Resubscribe results: {}".format(resubscribe_results))

        for topic, qos in resubscribe_results['topics']:
            if qos is None:
                sys.exit("Server rejected resubscribe to topic: {}".format(topic))


# Callback when the subscribed topic receives a message
def on_message_received_camera(topic, payload, dup, qos, retain, **kwargs):
    # print("Received message from topic '{}': {}".format(topic, payload))
    print("Received message from topic '{}'".format(topic), end='\r')
    global received_count, raw_img
    raw_img = payload
    nparr = np.frombuffer(raw_img, np.uint8)
    frame = cv2.imdecode(nparr, 1)
    cv2.imshow('camera', frame)
    cv2.waitKey(1)
    
    received_count += 1
    if received_count == cmdUtils.get_command("count"):
        received_all_event.set()

if __name__ == '__main__':

    mqtt_connection = cmdUtils.build_mqtt_connection(on_connection_interrupted, on_connection_resumed)

    if is_ci == False:
        print("Connecting to {} with client ID '{}'...".format(
            cmdUtils.get_command(cmdUtils.m_cmd_endpoint), cmdUtils.get_command("client_id")))
    else:
        print("Connecting to endpoint with client ID")
    connect_future = mqtt_connection.connect()

    # Future.result() waits until a result is available
    connect_future.result()
    print("Connected!")

    message_count = cmdUtils.get_command("count")
    message_topic = cmdUtils.get_command(cmdUtils.m_cmd_topic)
    message_string = cmdUtils.get_command(cmdUtils.m_cmd_message)

    # Subscribe
    print("Subscribing to topic '{}'...".format("deepracer1/camera"))
    subscribe_future, packet_id = mqtt_connection.subscribe(
        topic="deepracer1/camera",
        qos=mqtt.QoS.AT_LEAST_ONCE,
        callback=on_message_received_camera)

    subscribe_result = subscribe_future.result()
    print("Subscribed with {}".format(str(subscribe_result['qos'])))

    # Publish message to server desired number of times.
    # This step is skipped if message is blank.
    # This step loops forever if count was set to 0.
    if message_string:
        if message_count == 0:
            print ("Sending and Receiving messages until program killed")
        else:
            print ("Sending {} message(s)".format(message_count))

        publish_count = 1
        try:
            while (publish_count <= message_count) or (message_count == 0):
                print("running.  ", end='\r')
                time.sleep(0.3)
                print("running.. ", end='\r')
                time.sleep(0.3)
                print("running...", end='\r')
                time.sleep(0.4)

        except KeyboardInterrupt:
            # Disconnect
            print("Disconnecting...")
            disconnect_future = mqtt_connection.disconnect()
            disconnect_future.result()
            print("Disconnected!")
