source [file join [file dirname [info script]] theme dark.tcl]

option add *tearOff 0

proc set_theme {mode} {
	if {$mode == "dark"} {
		ttk::style theme use "sun-valley-dark"

		array set colors {
		    -fg             "#0000FF"
		    -bg             "#0e0e0f"
		    -disabledfg     "#0000FF"
		    -selectfg       "#0000FF"
		    -selectbg       "#003b50"
		}
        
        ttk::style configure . \
            -background $colors(-bg) \
            -foreground $colors(-fg) \
            -troughcolor $colors(-bg) \
            -focuscolor $colors(-selectbg) \
            -selectbackground $colors(-selectbg) \
            -selectforeground $colors(-selectfg) \
            -insertwidth 0 \
            -insertcolor $colors(-fg) \
            -fieldbackground $colors(-selectbg) \
            -font {"Century Gothic" 10} \
            -borderwidth 0 \
            -relief flat

        tk_setPalette \
        	background [ttk::style lookup . -background] \
            foreground [ttk::style lookup . -foreground] \
            highlightColor [ttk::style lookup . -focuscolor] \
            selectBackground [ttk::style lookup . -selectbackground] \
            selectForeground [ttk::style lookup . -selectforeground] \
            activeBackground [ttk::style lookup . -selectbackground] \
            activeForeground [ttk::style lookup . -selectforeground]
        
        ttk::style map . -foreground [list disabled $colors(-disabledfg)]

        option add *font [ttk::style lookup . -font]
        option add *Menu.selectcolor $colors(-fg)
        option add *Menu.background #0e0e0f
	}
}
