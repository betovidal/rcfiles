/* Read: "Additional alsa configuration" note for volume. */

static const char unknown_str[] = "?";

/* static const char iname[] = "wlp2s0"; */
static const char iname[] = "enp3s0";
static const struct arg args[] = {
	/* function format          argument */
	{ run_command, "| vol: %2s%% ", "/bin/bash -c \"amixer get Master | awk '\\$0~/%/{print \\$4}' | tr -d '[]%'\""},
	{ netspeed_tx, "| ▲ %8s ", iname},
	{ netspeed_rx, "| ▼ %8s ", iname},
	{ ram_perc, "| ram: %2s%% ", NULL},
	{ cpu_perc, "| CPU: %2s%% ", NULL},
	{ ipv4, "| %s ", iname},
	{ datetime, "%s",           "| %F | %a | %T |" },
};
