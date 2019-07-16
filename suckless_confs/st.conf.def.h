Last working version: 0.8.1

Order:
1. https://st.suckless.org/patches/fix_keyboard_input/ (apply from parent folder, the one that contains st/)
2. https://st.suckless.org/patches/scrollback/
3. Scrollback for mouse (same URL as above)
4. https://st.suckless.org/patches/dracula/ <-- By hand
5. https://st.suckless.org/patches/hidecursor/ <-- By hand

/* gruvbox-dark colorscheme START */
/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
	"#282828", /* hard contrast: #1d2021 / soft contrast: #32302f */
	"#cc241d",
	"#98971a",
	"#d79921",
	"#458588",
	"#b16286",
	"#689d6a",
	"#a89984",
	"#928374",
	"#fb4934",
	"#b8bb26",
	"#fabd2f",
	"#83a598",
	"#d3869b",
	"#8ec07c",
	"#ebdbb2",
};
unsigned int defaultfg = 15;
unsigned int defaultbg = 0;
unsigned int defaultcs = 15;
unsigned int defaultrcs = 15;
/* gruvbox-dark colorscheme FINISH */


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
