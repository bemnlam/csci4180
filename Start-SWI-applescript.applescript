on run
	set prolog to "/opt/local/bin/swipl"
	set dir to POSIX path of (choose folder with prompt "Where do you keep your Prolog programs?")
	tell application "Terminal"
		activate
		do script "cd \"" & dir & "\"; " & prolog in window 1
	end tell
end run

on open (flist)
	set thefile to item 1 of flist
	set filestr to POSIX path of thefile
	set prolog to "/opt/local/bin/swipl"
	tell application "Finder" to set dir to POSIX path of ((container of thefile) as alias)
	tell application "Terminal"
		activate
		do script "cd \"" & dir & "\"; " & prolog & " -f  \"" & filestr & "\"" in window 1
	end tell
end open