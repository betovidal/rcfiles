static const char *fonts[]          = { "Terminus:pixelsize=16" };
static const char dmenufont[]       = "Terminus:pixelsize=16";

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ NULL,       NULL,       NULL,       0,            0,           -1 },
};

........................


/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *prev_track[] = { "cmus-remote", "-r", NULL };
static const char *next_track[] = { "cmus-remote", "-n", NULL };
static const char *play_track[] = { "cmus-remote", "-p", NULL };
static const char *pause_track[] = { "cmus-remote", "-u", NULL };
static const char *stop_track[] = { "cmus-remote", "-s", NULL };
static const char *seek_f_track[] = { "cmus-remote", "-k", "+5", NULL };
static const char *seek_b_track[] = { "cmus-remote", "-k", "-5", NULL };
static const char *vol_up[] = { "amixer", "-q", "sset", "Master", "5%+", NULL };
static const char *vol_down[] = { "amixer", "-q", "sset", "Master", "5%-", NULL };
static const char *scrot_whole[] = { "scrot", "-e", "mv $f ~/Pictures/caps/", NULL };
static const char *scrot_rect[] = { "scrot", "-s", "-e", "mv $f ~/Pictures/caps/", NULL };
static const char *dmenucmd[]  = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]   = { "st", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	/* My own key bindings START */
	/* XK_KP_Subtract      */
	/* XK_KP_Add           */
	/* XK_plus             */
	/* XK_minus            */
	{ 0,                            XK_Print,  spawn,          {.v = scrot_whole } },
	{ MODKEY,                       XK_Print,  spawn,          {.v = scrot_rect } },
	{ MODKEY,                       XK_Print,  spawn,          {.v = scrot_rect } },
	{ MODKEY,                       XK_plus,   spawn,          {.v = vol_up } },
	{ MODKEY,                       XK_KP_Add, spawn,          {.v = vol_up } },
	{ MODKEY,                       XK_minus,  spawn,          {.v = vol_down } },
	{ MODKEY,                       XK_KP_Subtract, spawn,     {.v = vol_down } },
	{ MODKEY|ControlMask,           XK_z,      spawn,          {.v = prev_track } },
	{ MODKEY|ControlMask,           XK_b,      spawn,          {.v = next_track } },
	{ MODKEY|ControlMask,           XK_x,      spawn,          {.v = play_track } },
	{ MODKEY|ControlMask,           XK_c,      spawn,          {.v = pause_track } },
	{ MODKEY|ControlMask,           XK_v,      spawn,          {.v = stop_track } },
	{ MODKEY|ControlMask,           XK_Right,  spawn,          {.v = seek_f_track } },
	{ MODKEY|ControlMask,           XK_Left,   spawn,          {.v = seek_b_track } },
	/* My own key bindings END */
