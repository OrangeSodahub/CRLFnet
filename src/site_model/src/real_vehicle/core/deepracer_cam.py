import time
import numpy as np
import cv2
import ssl
from urllib.request import urlopen, Request
from threading import Thread, Lock

# =================================================================================
#
def wait_until(closure, timeout=30, static_sleep=0, check_interval=1, **kwargs):
    deadline = time.time() + timeout
    if static_sleep > 0:
        time.sleep(static_sleep)

    # Wait until the closure return True
    while time.time() < deadline:
        r = closure(**kwargs)
        if r is not None or r is True:
            return r
        time.sleep(check_interval)
    return r


class DeepracerCam(Thread):
    def __init__(self, client):
        super().__init__()
        self.daemon = True
        self.client = client

        self._data = None
        self._data_lock = Lock()

    def _data_set(self, data):
        self._data_lock.acquire(True)
        self._data = data
        self._data_lock.release()

    def _get_data(self):
        self._data_lock.acquire(True)
        data = self._data
        self._data_lock.release()
        return data

    def get_image(self, timeout=2):
        return wait_until(self._get_image, timeout=timeout)

    def _get_image(self):
        data = self._get_data()

        if data is None:
            return None

        img = cv2.imdecode(np.fromstring(data, dtype=np.uint8), cv2.IMREAD_COLOR)
        return img

    def run(self):
        r = self.client.get_raw_video_stream()
        if r.status_code != 200:
            raise RuntimeError(
                "Can't get the video stream with status_code={}, text={}".format(
                    r.status_code, r.text
                )
            )

        buf = bytes()
        for chunk in r.iter_content(chunk_size=1024):
            buf += chunk
            a = buf.find(b"\xff\xd8")
            b = buf.find(b"\xff\xd9")
            if a != -1 and b != -1:
                self._data_set(buf[a : b + 2])
                buf = buf[b + 2 :]
