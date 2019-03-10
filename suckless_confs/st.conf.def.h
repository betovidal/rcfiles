Last working version: 0.8.1

Order:
1. https://st.suckless.org/patches/fix_keyboard_input/ (apply from parent folder, the one that contains st/)
2. https://st.suckless.org/patches/scrollback/
3. Scrollback for mouse (same URL as above)
4. https://st.suckless.org/patches/dracula/ <-- By hand
5. https://st.suckless.org/patches/hidecursor/ <-- By hand


Note: Delete config.h and st (executable) every time you want to test.

My own changes for working in VIM:

char font[] = "Terminus:pixelsize=18";

	/* { XK_BackSpace,    ShiftMask,                      "\033[127;2u", 0,  0,  0}, */
	/* { XK_Tab,          ControlMask,                    "\033[9;5u",   0,  0,  0}, */
	/* { XK_6,            ControlMask,                    "\033[54;5u",  0,  0,  0}, */
	/* { XK_space,        ShiftMask,                      "\033[32;2u",  0,  0,  0}, */

//Add to bottom of that list
	/* My own additional key combinations */
	{ XK_space,        ControlMask,                    "\033[23~",    0,  0},
	{ XK_ISO_Left_Tab, ControlMask|ShiftMask,          "\033[20~",    0,  0},
	{ XK_Tab,          ControlMask,                    "\033[21~",    0,  0},

Install with: $sudo make clean install
