-- lots of custom config here: http://projects.haskell.org/xmobar/
Config {
       font = "xft:SourceCodePro-Medium:=12",
       -- font = "xft:Monospace:pixelsize=11",
       lowerOnStart = False,
       commands = [
                -- Charlottesville, VA
                Run Weather "KCHO" ["-t","CHO <tempF>F ","-L","64","-H","77","--normal","green","--high","red","--low","lightblue"] 36000,
                Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10,
                Run Memory ["-t","Mem: <usedratio>%"] 10,
                Run Swap [] 10,
                Run Date "%a %b %_d %l:%M" "date" 10,
                Run Network "wlan0" [] 10,
                -- Run Battery ["-t","Batt: %","-L","25","-H","75","--low","#FF0000","--normal","#F9FF00","--high","#00FF00"] 600,
                -- Run Volume "default" "Master" [] 10,
                Run StdinReader
                ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %wlan0% | %cpu% | %memory% | %swap% | <fc=#ee9a00>%date%</fc> | %KCHO%"
       -- , template = "%StdinReader% }{ %wlan0% | %cpu% | %memory% * %swap% * %battery% %default:Master%  <fc=#ee9a00>%date%</fc> | %KCHO%"
       -- , template = "%StdinReader% }{ %wlan0% | %cpu% | %memory% * %swap% %volume%  <fc=#ee9a00>%date%</fc> | %KCHO%"
       }
