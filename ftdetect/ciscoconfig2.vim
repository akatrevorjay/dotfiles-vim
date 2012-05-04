
if did_filetype()	" filetype already set..
	finish			" ..don't do these checks
elseif getline(1) =~ '#sh run$'
	setfiletype ciscoconfig
elseif getline(1) =~ '^Building configuration...$'
	setfiletype ciscoconfig
elseif getline(1) =~ '^Current configuration : .* bytes$'
	setfiletype ciscoconfig
elseif getline(2) =~ '^! Last configuration change at .* by'
	setfiletype ciscoconfig
endif

