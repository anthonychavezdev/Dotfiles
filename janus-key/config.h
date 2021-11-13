// Backup config.h file for
// https://github.com/pietroiusti/janus-key
// Clone the repo, paste this file in the
// directory, and compile it with
// gcc `pkg-config --cflags libevdev` `pkg-config --libs libevdev` janus-key.c -o janus-key
// Run with sudo ./janus-key /dev/input/event<NUMBER>
#include "./janus-key.h"

janus_key janus_map[] = {
    // key                1st function     2nd function
    {  KEY_CAPSLOCK,      KEY_CAPSLOCK,         KEY_LEFTCTRL     }, // Change both CAPS' primary and secondary function
    {  KEY_ENTER,         0,               0    }, // Do not change ENTER's primary function
    {  KEY_ESC,           0  }  // Do not change ESC's primary function
};

// Delay in milliseconds.
unsigned int max_delay = 300; // If a key is held down for a time
			      // greater than max_delay, then, when
			      // released, it will not send its
			      // primary function
