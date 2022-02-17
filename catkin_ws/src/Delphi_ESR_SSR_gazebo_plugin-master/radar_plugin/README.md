## Package for Delphi ESR and SRR radar plugins for Gazebo

##### Details:
The Delphi ESR and SRR radars have been modelled using logical cameras, since these radars try to return the centroids of obstacles. Logical cameras return the centroid of any object whose collision bounding box intersects with the frustum of the logical camera's view. The ESR uses 2 logical cameras, and the SRR uses 1 logical camera.

The specifications of each radar have been kept as close to the original as possible:
1. ESR: Range       - Minimum 1m, Mid-range max 60m, Long-range max 174m<br />
        FOV         - Horizontal +-45 degrees for mid-range, +-10 degrees<br />
                      Vertical 4.5 degrees<br />
        Mass        - 575g<br />
        Max objects - 64<br />
        Update rate - 50 ms<br />

2. SRR: Range       - Minimum 0.5m, Max range 80m<br />
        FOV         - Horizontal +-75 degrees<br />
                      Vertical 10 degrees<br />
        Mass        - 380g<br />
        Max objects - 64<br />
        Update rate - 50 ms<br />

To model the radars as accurately as possible, the plugins have a feature for checking occlusion. The value of occlusion parameter set determines how much percentage of an object can be blocked from view by any other obstacle before the object is not detected by the radar. For this feature, a number of points on the object are sampled and ray-traced from the sensor origin to check if any obstacles are blocking it.

The radar plugin also contains a function to add Gaussian noise to the measurements, whose parameters can be set as required.

##### To install:
1. Clone the package in a catkin workspace
2. Build

To add a radar to a robot, simply include the xacro of the corresponding radar. Specify the origin of the joint, the parent link and the radar parameters.

##### Parameters:
1. name         --> For ESR, the names can be "ESRFront", "ESRRight", "ESRLeft". For SRR, the names can be "SRRRight", "SRRLeft".
2. radarTopic   --> Default topic name to publish the data is "/radar_obstacles" if using only one radar. If using all/multiple radars, set the following topic names for each radar: "/esr_front_obstacles", "/esr_left_obstacles", "/esr_right_obstacles", "/srr_right_obstacles", "/srr_left_obstacles", and run radarMsgCombiner node.
3. velTopic     --> The topic name for the velocity of the parent vehicle. Default set to sim_car/vel_of_car
4. occlusion    --> Value from 0 to 1, to define the percentage of occlusion allowed
5. samplePoints --> The square of this number is the number of points that are ray-traced for checking occlusion
6. noiseDev     --> The standard deviation for the Gaussian noise model

##### Issues:
1. Using multiple radars in a highly complex world slows down the simulation as it becomes too computationally heavy. It works well in less detailed worlds.
2. The frustum of a logical camera is a pyramid and not a spherical sector. Hence, for larger angles, the model has a larger range than the real-life radar.
3. The occlusion function at times does not work as expected due to the Gazebo message queue limit being reached while requesting model states.