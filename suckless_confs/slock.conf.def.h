static const char *colorname[NUMCOLS] = {
	[INIT] =   "#FFFFFF",     /* after initialization */
	[INPUT] =  "#E5EFFF",   /* during input */
	[FAILED] = "#FFF3E5",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;
