
"au BufRead,BufNewFile *.cisco		set filetype=ciscoconfig
"au BufRead,BufNewFile *.config      set filetype=ciscoconfig

"if did_filetype()	" filetype already set
"    finish
"elseif getline(1) =~ '#sh run$'
"    setfiletype ciscoconfig
"elseif getline(1) =~ '^Building configuration...$'
"    setfiletype ciscoconfig
"elseif getline(1) =~ '^Current configuration : .* bytes$'
"    setfiletype ciscoconfig
"elseif getline(2) =~ '^! Last configuration change at .* by'
"    setfiletype ciscoconfig
"endif

