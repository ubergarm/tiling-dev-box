Config {
       font = "xft:SourceCodePro-Medium:pixelsize=11",
       -- font = "xft:Monospace:pixelsize=11",
       lowerOnStart = False,
       commands = [
                -- Charlottesville, VA
                Run Weather "KCHO" ["-t","CHO <tempF>F ","-L","64","-H","77","--normal","green","--high","red","--low","lightblue"] 36000,
                Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10,
                Run Memory ["-t","Mem: <usedratio>%"] 10,
                Run Swap [] 10,
                Run Date "%a %b %_d %l:%M" "date" 10,
                Run Network "eth0" [] 10,
                Run StdinReader
                ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %eth0% | %cpu% | %memory% * %swap%    <fc=#ee9a00>%date%</fc> | %KCHO%"
       }
