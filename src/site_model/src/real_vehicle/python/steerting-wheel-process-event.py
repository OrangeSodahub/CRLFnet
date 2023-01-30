# joystick events updates the global steer, drive, done values
def process_event(event):
    global done, drive, steer, max_speed
    # quit
    if event.type == pygame.QUIT: # If user clicked close.
        done = True # Flag that we are done so we exit this loop.
    # convert event to steer and drive value
    if get_os == "Windows":
        if event.type == pygame.JOYAXISMOTION and event.axis == 0: #stering_angle
            if event.value < -1:
                    event.value = -1
            else:
                steer = event.value
                drive = drive
                max_speed = max_speed

        if event.type == pygame.JOYBUTTONDOWN and event.button == 12: # D1

            max_speed = 0.25
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 13: # D2
            max_speed = 0.3
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 14: # D3
            max_speed = 0.45
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 15: # D4
            max_speed = 0.60
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 16: # D5
            max_speed = 0.75
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 17: # D6
            max_speed = 1.0
            print(max_speed)             
        elif event.type == pygame.JOYAXISMOTION and event.axis == 1 and event.value > -1:#throttle
            if event.value == 1.0:
                event.value = 0
            elif event.value > 0:
                event.value = -0.1
            drive = event.value      
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 4: # + button hold it to back 
            drive *= -1                              
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 5: # - button hold it to back 
            drive *= -1        
        elif event.type == pygame.JOYAXISMOTION and event.axis == 2: # break to parking
            drive = 0
        elif event.type == pygame.JOYAXISMOTION and event.axis == 3 and event.value > -1: #clutch to back
            if event.value == 1.0:
                event.value = 0
            elif event.value > 0:
                event.value = -0.1
            drive = event.value 
            drive *= -1 
    elif get_os == "Darwin":
        if event.type == pygame.JOYAXISMOTION and event.axis == 0: #stering_angle
            if event.value < -1:
                    event.value = -1
            else:
                steer = event.value
                drive = drive
                max_speed = max_speed
                
        # print('\t', event.ev_type, event.code, event.state)
        if event.type == pygame.JOYBUTTONDOWN and event.button == 12: # D1
            
            max_speed = 0.25
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 13: # D2
            max_speed = 0.3
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 14: # D3
            max_speed = 0.45
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 15: # D4
            max_speed = 0.60
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 16: # D5
            max_speed = 0.75
            print(max_speed)
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 17: # D6
            max_speed = 1.0
            print(max_speed)             
        elif event.type == pygame.JOYAXISMOTION and event.axis == 2 and event.value > -1: # throttle to go
            if event.value == 1.0:
                event.value = 0
            elif event.value > 0:
                event.value = -0.1
            drive = event.value      
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 4:# + button hold it to back
            drive *= -1                              
        elif event.type == pygame.JOYBUTTONDOWN and event.button == 5: # - button hold it to back
            drive *= -1        
        elif event.type == pygame.JOYAXISMOTION and event.axis == 3: # break to parking
            drive = 0
        elif event.type == pygame.JOYAXISMOTION and event.axis == 1 and event.value > -1: #clutch to back
            if event.value == 1.0:
                event.value = 0
            elif event.value > 0:
                event.value = -0.1
            drive = event.value 
            drive *= -1