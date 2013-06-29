.*----------------------------------------------------------------------------*
.* Converted by HTML2IPF from contents.html at 4 Jul 2011, 3:30pm       *
.*----------------------------------------------------------------------------*
:userdoc.
:title.eFTE/2
:docprof toc=12345.
.* Source filename: contents.html
:h1 res=1.eFTE/2
:font facename=default size=0x0.
:p.
:sl compact.
:li.:link reftype=hd res=2.About eFTE:elink.
:li.:link reftype=hd res=5.Configuration Files:elink.
:li.:link reftype=hd res=4.Command Line Options:elink.
:li.:link reftype=hd res=11.Configuration of Syntax Highlighting:elink.
:li.:link reftype=hd res=12.Colors:elink.
:li.:link reftype=hd res=13.Macro Commands:elink.
:li.:link reftype=hd res=7.Event Bindings:elink.
:li.:link reftype=hd res=6.Global Configuration:elink.
:li.:link reftype=hd res=3.Installation:elink.
:li.:link reftype=hd res=8.Mode Configuration:elink.
:li.:link reftype=hd res=14.Performace Tips:elink.
:li.:link reftype=hd res=9.Regular Expressions:elink.
:li.:link reftype=hd res=10.Status Line:elink.
:esl.

.* Source filename: about.html
:h2 res=2.About eFTE/2
:font facename=default size=0x0.
:p.
:lines align=center.
.br
:font facename='Helv' size=20x12.
.br
eFTE/2:font facename=default size=0x0.
.br
.br
Version :hp2.2&per.00 eFTE/2:ehp2.
.br
(c) Copyright 2011 Gregg Young
.br
Version :hp2.1&per.1 eFTE:ehp2.   
.br
(c) Copyright 2008-2009 by eFTE SF Group.
.br
Version :hp2.0&per.50 FTE:ehp2.
.br
(c) Copyright 1998-2010 Zdenek Kabelac
.br
Version :hp2.0&per.46 FTE:ehp2.
.br
(c) Copyright 1995-1998 Marko Macek
.br
:elines.
:p.The latest version can be always downloaded from&colon.
:link reftype=hd res=15.:hp2.http&colon.//hobbes.nmsu.edu/h-search.php?key=efte&amp.pushbutton=Search:ehp2.:elink.
:p.Please send comments/suggestions/bug reports to&colon.
:hp2.ygk@qwest.net:ehp2. or better yet submit a ticket at :hp2.http&colon.//svn.netlabs.org/efte:ehp2.
:p.Original author is :hp2.Marko&per.Macek@snet&per.fri&per.uni-lj&per.si:ehp2. or :hp2.mark@hermes&per.si:ehp2.
:p.See file :link reftype=launch  object='e.exe'  data='README'.README:elink. for last minute notes&per.
:p.See file :link reftype=launch  object='e.exe'  data='HISTORY'.HISTORY:elink. for recent changes and updates&per.

.* Source filename: cfgfiles.html
:h2 res=5.Configuration Files
:font facename=default size=0x0.
:p.
While the original FTE configuration files were version specific, and required recompilation,
eFTE uses the configuration files without precompiling them. Basicly the compiler code has been 
incoportated into eFTE/2 so the configuration is recompiled each time you start eFTE/2. 

:p.On startup, the editor will attempt to load the configuration starting from 
:font facename='System VIO' size=14x8.mymain&per.fte:font facename=default size=0x0..
:ul.
:lp.We look for :font facename='System VIO' size=14x8.mymain&per.fte:font facename=default size=0x0.
in several standard places including&colon.
:font facename='System VIO' size=14x8.
:li.efte "eFTE/2 install directory" (can be named anything)
:li.efte\config
:li.efte\local :font facename=default size=0x0.
:lp.and for these under the "Program Files" and "HOME" directories from your environment. If you want the 
configuration files somewhere else or if eFTE/2 is having trouble finding mymain.fte, you
can use :font facename='System VIO' size=14x8.SET EFTEDIR=MYPATH:font facename=default size=0x0..
eFTE/2 will look in that directory and in a config and/or local subdirectory. If you have 
several sets of configuration files use :font facename='System VIO' size=14x8.SET EFTEDIR
:font facename=default size=0x0.in a script to switch between them.  
:lp.eFTE/2 has a direct way to switch between configurations using the -c command line switch
followed by the fullpath to the alternate configuration file. eFTE/2 also has a default 
configuration, edefault.fte, which should be kept in eFTE/2's install directory.
:eul.
:p.The advantage of not having to compile the configuration each time is you only need to edit 
the configuration file(s) then close and reopen eFTE/2 and your new configuration is ready.
The one downside is if you make a syntax error eFTE/2 won't open until it is fixed. For this 
reason I recommend using the "efte -!..." string from the error message which will open the problem
file at the problem line using the default configuration or leave eFTE/2 open after editing and open 
a second instance to test the changes. If it fails you can easily edit/backout the changes in the first instance.

.br
:font facename='Helv' size=32x20.
.br
Configuration file syntax:font facename=default size=0x0.
.br
.br
:p. Comments start with a :font facename='System VIO' size=14x8.#:font facename=default size=0x0. character and last 
until the end of that line&per.
:p. Three compiler directives are defined to conditionally include or exclude parts of the cofiguration. The directives
are :font facename='System VIO' size=14x8.%if, %endif and %define:font
facename=default size=0x0.. They behave as expected and the :font facename='System VIO' size=14x8.!:font 
facename=default size=0x0."not character" can be used in the %defines. Do not try to put comments (or anything else) 
on these lines. As this will result in a syntax error. Note white space is tolerated. 
:p. Strings can be specified using any of :font facename='System VIO' size=14x8.' " /:font facename=default size=0x0. 
characters&per.

:p. Single quoted strings perform no substitution&per. To enter  :font facename='System VIO' size=14x8.':font facename=default size=0x0.
or :font facename='System VIO' size=14x8.\:font facename=default size=0x0. into a string precede it with a backslash. 

:p. Double quoted strings perform the following substitutions&colon.
:cgraphic.
    \t  ->  ^I, tab character
    \r  ->  ^M, CR 
    \n  ->  ^J, LF
    \e  ->  ^[, escape character
    \v  ->  ^L, vertical tab
    \b  ->  ^H, backspace
    \a  ->  ^G, bell
:ecgraphic.
:p. Strings started by :font facename='System VIO' size=14x8./:font facename=default size=0x0. character require no 
escaping (except for '/'). Mostly useful for specifying :link reftype=hd res=9.regular
expressions:elink. without double backslashes that are necessary in single and double quoted strings&per. 

.* Source filename: cmdopt.html
:h2 res=4.Command Line Options
:font facename=default size=0x0.
:p.
The FTE command line syntax is&colon.
:p.
:font facename='System VIO' size=14x8.fte [[options] [files] &per.&per.&per.]:font facename=default size=0x0.
.br
:font facename='Helv' size=32x20.
.br
Options:font facename=default size=0x0.
.br
.br
:dl compact break=all.
:dt.:font facename='System VIO' size=14x8.:hp2.-l:ehp2.line[,column]:font facename=default size=0x0.
:dd.Go to line (and column) in next file specified on command line
:dt.:font facename='System VIO' size=14x8.:hp2.-m:ehp2.[MODE]:font facename=default size=0x0.
:dd.Use mode :font facename='System VIO' size=14x8.MODE:font facename=default size=0x0. for remaining files&per. 
If no argument is specified, mode override is cancelled.
:dt.:font facename='System VIO' size=14x8.:hp2.-C or -!:ehp2.[file]:font facename=default size=0x0.
:dd.Use specified configuration file (must be fullpath name). If no argument is specified, the default 
configuration, edefault.fte, is used.
:dt.:font facename='System VIO' size=14x8.:hp2.-d:ehp2.[DEFINETERM]:font facename=default size=0x0.
:dd.Use this:font facename='System VIO' size=14x8.DEFINETERM:font facename=default size=0x0.for %if() statements
in the config files. You can add your own to customize the configuration for individual projects. Currently eFTE
includes FM2, LINUXKERNEL, OS2DDK and GNU. These change the indent style used at startup. Setting these in environment
has the same effect.
:dt.:font facename='System VIO' size=14x8.:hp2.-D:ehp2.[file&per.dsk]:font facename=default size=0x0.
:dd.Load/save desktop from file :font facename='System VIO' size=14x8.file&per.dsk:font facename=default size=0x0.&per. If no argument is specified, desktop loading/saving
is disabled&per.
:dt.:font facename='System VIO' size=14x8.:hp2.-H:ehp2.[file&per.his]:font facename=default size=0x0.
:dd.Load/save history from file <&per.his>&per. If no argument, disable history load/save&per.
:dt.:font facename='System VIO' size=14x8.:hp2.-T:ehp2.tags:font facename=default size=0x0.
:dd.Load tags file :font facename='System VIO' size=14x8.tags:font facename=default size=0x0.&per. 
The file must be in the format generated by the :hp2.ctags:ehp2. program&per.
:dt.:font facename='System VIO' size=14x8.:hp2.-t:ehp2.tag:font facename=default size=0x0.
:dd.Lookup tag :font facename='System VIO' size=14x8.tag:font facename=default size=0x0. and display file containing it.
:dt.:font facename='System VIO' size=14x8.:hp2.--:ehp2.:font facename=default size=0x0.
:dd.The rest of the arguments are not options, but filenames&per.
:dt.:font facename='System VIO' size=14x8.:hp2.-+:ehp2.:font facename=default size=0x0.
:dd.The next argument is not an option even if starting with a '-'&per.
:dt.:font facename='System VIO' size=14x8.:hp2.--help -h or -?:ehp2.:font facename=default size=0x0.
:dd.This show a usage dialog.
:dt.:font facename='System VIO' size=14x8.:hp2.--debug --debugclean:ehp2.:font facename=default size=0x0.
:dd.These start logging -- debug appends efte.log debugclean creates a new one.
:dt.:font facename='System VIO' size=14x8.:hp2.--version:ehp2.:font facename=default size=0x0.
:dd.Provides some version information.
:edl.

:p.
Optional arguments are marked by [ and ] brackets.
:p.
There should not be any delimiter between option and its arguments.
:p.
.br
:font facename='Helv' size=32x20.
.br
Examples:font facename=default size=0x0.
.br
.br
:dl compact break=all.
:dt.:font facename='System VIO' size=14x8.efte[pm] -mBIN efte&per.exe:font facename=default size=0x0.
:dd.load efte[pm]&per.exe in BIN mode
:dt.:font facename='System VIO' size=14x8.efte[pm] -l100,30 win&per.c:font facename=default size=0x0.
:dd.go to (100,30) in win&per.c
:dt.:font facename='System VIO' size=14x8.efte[pm] -! -l100,30 mymain.fte:font facename=default size=0x0.
:dd.use the default configuration and go to (100,30) in mymain.fte
:dt.:font facename='System VIO' size=14x8.efte[pm] window&per.cpp:font facename=default size=0x0.
:dd.load file window&per.cpp
:dt.:font facename='System VIO' size=14x8.efte[pm] -dGNU window&per.cpp:font facename=default size=0x0.
:dd.load file window&per.cpp using the GNU indent style.
:dt.:font facename='System VIO' size=14x8.efte[pm] --debug window&per.cpp:font facename=default size=0x0.
:dd.load file window&per.cpp with logging enabled in append mode.
:dt.:font facename='System VIO' size=14x8.efte[pm] -mBIN efte&per.exe -m fte&per.cpp:font facename=default size=0x0.
:dd.load efte[pm]&per.exe in binary mode, window&per.cpp in default mode (C/C++)
:dt.:font facename='System VIO' size=14x8.efte[pm] -mBIN -+ -bla-:font facename=default size=0x0.
:dd.load file -bla- in BIN mode
:dt.:font facename='System VIO' size=14x8.efte[pm] -- -1 -2 -3 -4 -5 -6:font facename=default size=0x0.
:dd.load files -1, -2, -3, -4, -5, -6
:dt.:font facename='System VIO' size=14x8.efte[pm] -D -H efte&per.dsk efte&per.his:font facename=default size=0x0.
:dd.Disable desktop and history loading and saving and load files
:font facename='System VIO' size=14x8.efte&per.dsk:font facename=default size=0x0. and 
:font facename='System VIO' size=14x8.efte&per.his:font facename=default size=0x0.&per.
:edl.


:p.Under OS/2,NT and DOS default history and desktop files are
named :font facename='System VIO' size=14x8.eFTE&per.DSK:font facename=default size=0x0. and 
:font facename='System VIO' size=14x8.eFTE&per.HIS:font facename=default size=0x0. respectively&per. Under Unix they
are named :font facename='System VIO' size=14x8.&per.efte-desktop:font facename=default size=0x0. and 
:font facename='System VIO' size=14x8.&per.efte-history:font facename=default size=0x0.&per. The global
desktop and history files will be searched in program directory under
OS/2 and in user home directory under Unix&per.


.* Source filename: colorize.html
:h2 res=11.Configuration of Syntax Highlighting
:font facename=default size=0x0.
:p.
Syntax&colon.
:cgraphic.
    :hp2.colorize:ehp2. :hp1.Mode:ehp1.[:hp2.&colon.:ehp2.:hp1.Parent:ehp1.] :hp2.{:ehp2. :hp1.Settings:ehp1. :hp2.}:ehp2.
:ecgraphic.

.br
:font facename='Helv' size=32x20.
.br
Settings:font facename=default size=0x0.
.br
.br

:ul compact.
:li.SyntaxParser
:p.Syntax&colon.
:cgraphic.
    :hp2.SyntaxParser = ":ehp2.:hp1.Parser:ehp1.:hp2.";:ehp2.
:ecgraphic.

:lp.Activates the specified syntax parser for highlighting mode&per.
Value of :font facename='System VIO' size=14x8.:hp1.Parser:ehp1.:font facename=default size=0x0. can be chosen from&colon.
:p.
:eul.
:dl compact break=fit.
:dt.PLAIN
:dd.No syntax parser, only keyword highlighting is available&per.
:dt.SIMPLE
:dd.User configurable syntax parser will be defined&per.
:dt.C
:dt.REXX
:dt.HTML
:dt.PERL
:dt.MAKE
:dd.For editing :hp2.make files:ehp2..
:dt.DIFF
:dd.For viewing output of :hp2.diff:ehp2.&per.
:dt.MERGE
:dd.For editing output of :hp2.rcsmerge:ehp2. (RCS, CVS)&per.
:dt.IPF
:dd.For editing :hp2.OS2 help file:ehp2. sources.
:dt.Ada
:dt.MSG
:dd.For editing E-Mail,
:dt.SH
:dt.PASCAL
:dt.TEX
:dt.FTE
:dt.CATBS
:dd.For :hp2.VIEWING ONLY:ehp2. of :hp2.nroff:ehp2. formatted man-pages (formatted with backspaces)&per.
:edl.
:p.
:ul.
:li.Keywords
:p.Syntax&colon.
:cgraphic.
    :hp2.keyword ":ehp2.:link reftype=hd res=12.:hp1.color_specification:ehp1.:elink.:hp2." {
        ":ehp2.:hp1.keyword:ehp1.:hp2.":ehp2., &per.&per.&per.
    :hp2.};:ehp2.
:ecgraphic.
Multiple keyword sets with different colors can be defined&per.
:p.
:li.Colors
:lp.Syntax&colon.
:cgraphic.
    :hp2.color {
        ":ehp2.:hp1.color_name:ehp1.:hp2.", ":ehp2.:link reftype=hd res=12.:hp1.color_specification:ehp1.:elink.:hp2.":ehp2.
        &per.&per.&per.
    :hp2.};:ehp2.
:ecgraphic.

:lp. The following color-names are available, which ones
will actually be used depends on the SyntaxParser setting used&colon.
:p.
:ul compact.
:li.TODO&colon. make color names dynamic at least for user defined parsers&per.
:eul.

:eul.

.br
:font facename='Helv' size=32x20.
.br
Configurable Syntax Parser:font facename=default size=0x0.
.br
.br

:hp2.This is not fully stabilized yet&per. Might change in the future&per.:ehp2.
:p.
When :hp2.SyntaxParser:ehp2. is set to "SIMPLE", the following commands
can be used to configure the state machine used for parsing the
text&per.

:dl compact break=all.
:dt.:hp2.h_state:ehp2.
:dd.Defines a new state for the state machine
:p.
:cgraphic.
:hp2.h_state:ehp2. :hp1.state_number:ehp1. :hp2.{:ehp2.
    :hp2.":ehp2.:hp1.default_color_name:ehp1.:hp2.":ehp2.
:hp2.}:ehp2.
:ecgraphic.

:hp2.h_state:ehp2. command takes the following parameters&colon.
:p.
:dl compact break=all.
:dt.:font facename='System VIO' size=14x8.:hp1.state_number:ehp1.:font facename=default size=0x0.
:dd.States must be numbered sequentially from 0 without skipping any
number&per.

:dt.:font facename='System VIO' size=14x8.:hp1.default_color_name:ehp1.:font facename=default size=0x0.
:dd.Contains the name of default color used for characters that are not
matched by any transition string or keyword&per.

:edl.

:p.
:dt.:hp2.h_wtype:ehp2.
:dd.Specifies the keyword matching parameters for current
state&per. There can be only one :hp2.h_wtype:ehp2. keyword per state&per.

:cgraphic.
:hp2.h_wtype {:ehp2.
    :hp1.next_state_if_matched:ehp1.:hp2.,:ehp2.
    :hp1.next_state_if_not_matched:ehp1.:hp2.,:ehp2.
    :hp1.next_state_if_no_keyword:ehp1.:hp2.,:ehp2.
    :hp2.":ehp2.:hp1.state_flags:ehp1.:hp2.",:ehp2.
    :hp2.":ehp2.:hp1.keyword_charset:ehp1.:hp2.":ehp2.
:hp2.}:ehp2.
:ecgraphic.

:hp2.h_wtype:ehp2. takes the following arguments&colon.
:p.
:dl compact break=all.
:dt.:font facename='System VIO' size=14x8.:hp1.next_state_if_matched:ehp1.:font facename=default size=0x0.
:dd.The number of the next state if any keyword is matched&per. Can
be -1 to keep current state&per.

:dt.:font facename='System VIO' size=14x8.:hp1.next_state_if_not_matched:ehp1.:font facename=default size=0x0.
:dd.The number of the next state if no keyword is matched&per. Can
be -1 to keep current state&per.

:dt.:font facename='System VIO' size=14x8.:hp1.next_state_if_no_keyword:ehp1.:font facename=default size=0x0.
:dd.The number of next state if no keyword is found at all&per. Can
be -1 to keep current state&per.

:dt.:font facename='System VIO' size=14x8.:hp1.state_flags:ehp1.:font facename=default size=0x0.
:dd.String containing zero or more of the following characters&colon.
:p.
:dl compact break=all.
:dt.:hp2.i:ehp2.
:dd.Keyword matching is performed case-insensitively&per.
:edl.

:edl.

:p.
:dt.:hp2.h_trans:ehp2.
:dd.Defines a new state transition for current state&per.

:cgraphic.
:hp2.h_trans {:ehp2.
    :hp1.next_state:ehp1.:hp2.,:ehp2.
    :hp1.trans_flags:ehp1.:hp2.,:ehp2.
    :hp1.trans_match:ehp1.:hp2.,:ehp2.
    :hp1.color_name:ehp1.
:hp2.}:ehp2.
:ecgraphic.
:p.
:hp2.h_trans:ehp2. command takes the following parameters&colon.
:p.
:dl compact break=all.
:dt.:font facename='System VIO' size=14x8.:hp1.next_state:ehp1.:font facename=default size=0x0.
:dd.The number of next state to go if a match is successful&per.

:dt.:font facename='System VIO' size=14x8.:hp1.trans_flags:ehp1.:font facename=default size=0x0.
:dd.Determines options for matching&per. Can contain zero or more of the
following characters&colon.
:p.
:dl compact break=all.
:dt.:hp2.^:ehp2.
:dd.Matches only at the beginning of the line&per.
:dt.:hp2.$:ehp2.
:dd.Matches only at the end of the line&per.
:dt.:hp2.i:ehp2.
:dd.Match is case-insensitive&per.
:dt.:hp2.s:ehp2.
:dd.:font facename='System VIO' size=14x8.:hp1.trans_match:ehp1.:font facename=default size=0x0. is a character set&per. Matches only if the
next character is part of the set&per.
:dt.:hp2.S:ehp2.
:dd.Same as 's' but next character must not be part of the set&per.
:dt.:hp2.x:ehp2.
:dd.:font facename='System VIO' size=14x8.:hp1.trans_match:ehp1.:font facename=default size=0x0. is a regular expression&per. If some part of expression
is enclosed in parentheses, pointer is advanced up to the start of parenthesized
match (WARNING&colon. this can cause infinite loops)&per.
:dt.:hp2.-:ehp2.
:dd.After successfull match, the pointer is not advanced, matching
will resume at the same position in next state&per. (WARNING&colon. this
can cause infinite loops)&per.
:dt.:hp2.<:ehp2.
:dd.The matched character(s) are tagged with current state number&per.
This is important for proper operation of :hp2.:link reftype=hd res=13.MatchBracket:elink.:ehp2. command&per.
MatchBracket will only match braces tagged with same state number&per.
:dt.:hp2.>:ehp2.
:dd.The matched character(s) are tagged with next state number&per.
:dt.:hp2.q:ehp2.
:dd.On successful match quote the next character (the next character
is not used for matching)&per.
:dt.:hp2.Q:ehp2.
:dd.On successful match quote the end of line (the end of line
is not used for matching)&per.
:edl.


:dt.:font facename='System VIO' size=14x8.:hp1.trans_match:ehp1.:font facename=default size=0x0.
:dd.When :hp2.S:ehp2. or :hp2.s:ehp2. option is used, a character set to be matched&per. When
:hp2.S:ehp2. or :hp2.s:ehp2. options are not used, a string to be matched&per.

:edl.

:p.
:dt.:hp2.h_words:ehp2.
:dd.Specifies the set of keywords to match in this state&per. All
characters in keywords must be part of the :font facename='System VIO' size=14x8.:hp1.keyword_charset:ehp1.:font facename=default size=0x0.
in :hp2.h_wtype:ehp2. command for this mode&per.

:p.
:cgraphic.
    :hp2.h_words ":ehp2.:link reftype=hd res=12.color_specification:elink.:hp2." {:ehp2.
        :hp2.":ehp2.:hp1.keyword:ehp1.:hp2.",:ehp2. &per.&per.&per.
    :hp2.}:ehp2.
:ecgraphic.

:p. Works the same way as the :hp2.keyword:ehp2. but keywords
are for current state only&per.

:p. Multiple keyword sets with different colors can be defined&per.
:p. '-' can be used for color specifier do use the default keyword
color specified in global settings&per.
:edl.



.* Source filename: colors.html
:h2 res=12.Colors
:font facename=default size=0x0.
:p.

Colors are configured in COLOR&per.FTE file&per.
:p.
Syntax for color settings is&colon.
:p.:hp2.color:ehp2. { { 'name', 'value' } &per.&per.&per. }
:p.Value is the PC character attribute first char is background color,
the second is foreground color&per.
:p.Colors are as follows&colon.
:cgraphic.
        0        Black
        1        Dark Blue
        2        Dark Green 
        3        Dark Cyan
        4        Dark Red
        5        Dark Magenta
        6        Orange
        7        Pale Gray
        8        Dark Gray
        9        Blue
        A        Green
        B        Cyan
        C        Red
        D        Magenta
        E        Yellow
        F        White
:ecgraphic.


.* Source filename: command.html
:h2 res=13.Macro Commands
:font facename=default size=0x0.
:p.
:ul compact.
:li.Cursor Movement
:li.Deleting Text
:li.Line Commands
:li.Block Commands
:li.Text Editing and Insertion
:li.Folding Text
:li.Bookmarks
:li.Character Translation
:li.File Commands
:li.Directory Commands
:li.Search and Replace
:li.Window Commands
:li.Compiler Support
:li.CVS Support
:li.SVN Support
:li.TAGS Commands
:li.Option commands
:li.Other commands
:eul.

:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Cursor Movement:font facename=default size=0x0.
.br
.br
:ul compact.
:li.MoveDown
:li.MoveUp
:li.MoveLeft
:li.MoveRight
:li.MovePrev
:li.MoveNext
:li.MoveWordLeft
:li.MoveWordRight
:li.MoveWordPrev
:li.MoveWordNext
:li.MoveWordEndLeft
:li.MoveWordEndRight
:li.MoveWordEndPrev
:li.MoveWordEndNext
:li.MoveWordOrCapLeft
:li.MoveWordOrCapRight
:li.MoveWordOrCapPrev
:li.MoveWordOrCapNext
:li.MoveWordOrCapEndLeft
:li.MoveWordOrCapEndRight
:li.MoveWordOrCapEndPrev
:li.MoveWordOrCapEndNext
:li.MoveLineStart
:li.MoveLineEnd
:li.MovePageStart
:li.MovePageEnd
:li.MovePageUp
:li.MovePageDown
:li.MoveFileStart
:li.MoveFileEnd
:li.MovePageLeft
:li.MovePageRight
:li.MoveBlockStart
:li.MoveBlockEnd
:li.MoveFirstNonWhite
:li.MoveLastNonWhite
:li.MovePrevEqualIndent
:li.MoveNextEqualIndent
:li.MovePrevTab
:li.MoveNextTab
:li.MoveTabStart
:li.MoveTabEnd
:li.MoveLineTop
:li.MoveLineCenter
:li.MoveLineBottom
:li.ScrollLeft
:li.ScrollRight
:li.ScrollDown
:li.ScrollUp
:li.MoveFoldTop
:li.MoveFoldPrev
:li.MoveFoldNext
:li.MoveBeginOrNonWhite
:li.MoveBeginLinePageFile
:li.MoveEndLinePageFile
:li.MoveToLine
:li.MoveToColumn
:li.MoveSavedPosCol
:li.MoveSavedPosRow
:li.MoveSavedPos
:li.SavePos
:li.MovePrevPos
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
:link reftype=hd res=8.CursorTroughTabs:elink., Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window
Commands, Compiler Support, CVS Support, SVN Support, TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveDown:font facename=default size=0x0.
.br
.br
Move cursor to next line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveUp:font facename=default size=0x0.
.br
.br
Move cursor to previous line
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveLeft:font facename=default size=0x0.
.br
.br
Move cursor to previous column&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveRight:font facename=default size=0x0.
.br
.br
Move cursor to next column&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePrev:font facename=default size=0x0.
.br
.br
Move cursor to previous character&per. Moves to end of the previous
line if cursor is at the beginning of line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveNext:font facename=default size=0x0.
.br
.br
Move cursor to next character&per. Moves to the beginning of next
line if cursor is at the end of line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordLeft:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the word on the left&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordRight:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the word on the right&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordPrev:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the previous word&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordNext:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the next word&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordEndLeft:font facename=default size=0x0.
.br
.br
Move cursor to the end of the previous word&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordEndRight:font facename=default size=0x0.
.br
.br
Move cursor to the end of the word on the right&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordEndPrev:font facename=default size=0x0.
.br
.br
Move cursor to the end of the previous word&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordEndNext:font facename=default size=0x0.
.br
.br
Move cursor to the end of the next word&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapLeft:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the word or capital letter on the right&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapRight:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the word or capital letter on the left&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapPrev:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the previous word or to previous
capital letter&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapNext:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of the next word or to next capital letter&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapEndLeft:font facename=default size=0x0.
.br
.br
Move cursor to the end of the word or capitals on the left&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapEndRight:font facename=default size=0x0.
.br
.br
Move cursor to the end of the word or capitals on the right&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapEndPrev:font facename=default size=0x0.
.br
.br
Move cursor to the end of the previous word or capitals&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveWordOrCapEndNext:font facename=default size=0x0.
.br
.br
Move cursor to the end of the next word or capitals&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveLineStart:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveLineEnd:font facename=default size=0x0.
.br
.br
Move cursor to the end of line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePageStart:font facename=default size=0x0.
.br
.br
Move cursor to the first line on current page&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePageEnd:font facename=default size=0x0.
.br
.br
Move cursor to the last line on currently page&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePageUp:font facename=default size=0x0.
.br
.br
Display previous page&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePageDown:font facename=default size=0x0.
.br
.br
Display next page&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFileStart:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of file&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFileEnd:font facename=default size=0x0.
.br
.br
Move cursor to the end of file&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePageLeft:font facename=default size=0x0.
.br
.br
Scroll horizontally to display page on the left&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePageRight:font facename=default size=0x0.
.br
.br
Scroll horizontally to display page on the right&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveBlockStart:font facename=default size=0x0.
.br
.br
Move cursor to the beginning of block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveBlockEnd:font facename=default size=0x0.
.br
.br
Move cursor to end beginning of block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFirstNonWhite:font facename=default size=0x0.
.br
.br
Move cursor to the first non-blank character on line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveLastNonWhite:font facename=default size=0x0.
.br
.br
Move cursor to the last non-blank character on line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePrevEqualIndent:font facename=default size=0x0.
.br
.br
Move cursor to the previous line with equal indentation&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveNextEqualIndent:font facename=default size=0x0.
.br
.br
Move cursor to the next line with equal indentation&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePrevTab:font facename=default size=0x0.
.br
.br
Move cursor to the previous tab position&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveNextTab:font facename=default size=0x0.
.br
.br
Move cursor to the next tab position&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveTabStart:font facename=default size=0x0.
.br
.br
When cursor is on the tab characters, moves it to the beginning
of the tab&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveTabEnd:font facename=default size=0x0.
.br
.br
When cursor is on the tab characters, moves it to the end
of the tab&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveLineTop:font facename=default size=0x0.
.br
.br
Scroll the file to make the current line appear on the top of the window&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveLineCenter:font facename=default size=0x0.
.br
.br
Scroll the file to make the current line appear on the center of the window&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveLineBottom:font facename=default size=0x0.
.br
.br
Scroll the file to make the current line appear on the bottom of the window&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ScrollLeft:font facename=default size=0x0.
.br
.br
Scroll screen left&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ScrollRight:font facename=default size=0x0.
.br
.br
Scroll screen right&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ScrollDown:font facename=default size=0x0.
.br
.br
Scroll screen down&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ScrollUp:font facename=default size=0x0.
.br
.br
Scroll screen up&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFoldTop:font facename=default size=0x0.
.br
.br
Move to the beginning of current fold&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFoldPrev:font facename=default size=0x0.
.br
.br
Move to the beginning of previous fold&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFoldNext:font facename=default size=0x0.
.br
.br
Move to the beginning of next fold&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveBeginOrNonWhite:font facename=default size=0x0.
.br
.br
Move to beginning of line, or to first non blank character
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveBeginLinePageFile:font facename=default size=0x0.
.br
.br
Move to the beginning of line&per. If there already, move to the beginning
page&per. If there already, move to the beginning of file&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveEndLinePageFile:font facename=default size=0x0.
.br
.br
Move to the end of line&per. If there already, move to the end
page&per. If there already, move to the end of file&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveToLine:font facename=default size=0x0.
.br
.br
Move to line number given as argument
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveToColumn:font facename=default size=0x0.
.br
.br
Move to column given as argument
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveSavedPosCol:font facename=default size=0x0.
.br
.br
Move to column from saved position
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveSavedPosRow:font facename=default size=0x0.
.br
.br
Move to line from saved position
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveSavedPos:font facename=default size=0x0.
.br
.br
Move to saved position
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SavePos:font facename=default size=0x0.
.br
.br
Save current cursor position
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MovePrevPos:font facename=default size=0x0.
.br
.br
Move to last cursor position
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Deleting Text:font facename=default size=0x0.
.br
.br
:ul compact.
:li.KillLine
:li.KillChar
:li.KillCharPrev
:li.KillWord
:li.KillWordPrev
:li.KillWordOrCap
:li.KillWordOrCapPrev
:li.KillToLineStart
:li.KillToLineEnd
:li.KillBlock
:li.KillBlockOrChar
:li.KillBlockOrCharPrev
:li.Delete
:li.BackSpace
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillLine:font facename=default size=0x0.
.br
.br
Delete current line&per. If the line is the last line in the file,
only the text is deleted&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillChar:font facename=default size=0x0.
.br
.br
Delete character under (after) cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillCharPrev:font facename=default size=0x0.
.br
.br
Delete character before cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillWord:font facename=default size=0x0.
.br
.br
Delete the word after cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillWordPrev:font facename=default size=0x0.
.br
.br
Delete the word before cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillWordOrCap:font facename=default size=0x0.
.br
.br
Delete word or capitals after cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillWordOrCapPrev:font facename=default size=0x0.
.br
.br
Delete word or capitals before cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillToLineStart:font facename=default size=0x0.
.br
.br
Delete characters to the beginning of line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillToLineEnd:font facename=default size=0x0.
.br
.br
Delete characters to the end of line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillBlock:font facename=default size=0x0.
.br
.br
Delete block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillBlockOrChar:font facename=default size=0x0.
.br
.br
If block is marked, delete it, otherwise delete character under cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
KillBlockOrCharPrev:font facename=default size=0x0.
.br
.br
If block is marked, delete it, otherwise delete character before cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Delete:font facename=default size=0x0.
.br
.br
Delete character under (after) cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
:link reftype=hd res=8.DeleteKillTab:elink., :link reftype=hd res=8.DeleteKillBlock:elink., Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BackSpace:font facename=default size=0x0.
.br
.br
Delete character before cursor&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
:link reftype=hd res=8.BackSpKillTab:elink., :link reftype=hd res=8.BackSpKillBlock:elink., Deleting Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Line Commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.LineInsert
:li.LineAdd
:li.LineSplit
:li.LineJoin
:li.LineNew
:li.LineIndent
:li.LineTrim
:li.LineDuplicate
:li.LineCenter
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineInsert:font facename=default size=0x0.
.br
.br
Insert a new line before the current one&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineAdd:font facename=default size=0x0.
.br
.br
Add a new line after the current one&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineSplit:font facename=default size=0x0.
.br
.br
Split current line after cursor position
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineJoin:font facename=default size=0x0.
.br
.br
Join current line with next one&per. If cursor is positioned beyond
the end of line, the current line is first padded with whitespace&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineNew:font facename=default size=0x0.
.br
.br
Append a new line and move to the beginning of new line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineIndent:font facename=default size=0x0.
.br
.br
Reindent current line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineTrim:font facename=default size=0x0.
.br
.br
Trim whitespace at the end of current line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineDuplicate:font facename=default size=0x0.
.br
.br
Duplicate the current line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineCenter:font facename=default size=0x0.
.br
.br
Center the current line
:p.:hp2.SEE ALSO&colon.:ehp2.
Line Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Block Commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.BlockBegin
:li.BlockEnd
:li.BlockUnmark
:li.BlockCut
:li.BlockCopy
:li.BlockCutAppend
:li.BlockCopyAppend
:li.BlockClear
:li.BlockPaste
:li.BlockKill
:li.BlockIndent
:li.BlockUnindent
:li.BlockMarkStream
:li.BlockMarkLine
:li.BlockMarkColumn
:li.BlockExtendBegin
:li.BlockExtendEnd
:li.BlockReIndent
:li.BlockSelectWord
:li.BlockSelectLine
:li.BlockSelectPara
:li.BlockPasteStream
:li.BlockPasteLine
:li.BlockPasteColumn
:li.BlockPrint
:li.BlockRead
:li.BlockReadStream
:li.BlockReadLine
:li.BlockReadColumn
:li.BlockWrite
:li.BlockSort
:li.BlockSortReverse
:li.BlockUnTab
:li.BlockEnTab
:li.BlockMarkFunction
:li.BlockTrim
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockBegin:font facename=default size=0x0.
.br
.br
Set block beginning to current position&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockEnd:font facename=default size=0x0.
.br
.br
Set block end to current position&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockUnmark:font facename=default size=0x0.
.br
.br
Unmark block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockCut:font facename=default size=0x0.
.br
.br
Cut selected block to clipboard&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockCopy:font facename=default size=0x0.
.br
.br
Copy selected block to clipboard&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockCutAppend:font facename=default size=0x0.
.br
.br
Cut selected block and append it to clipboard&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockCopyAppend:font facename=default size=0x0.
.br
.br
Append selected block to clipboard&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockClear:font facename=default size=0x0.
.br
.br
Clear selected block
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockPaste:font facename=default size=0x0.
.br
.br
Paste clipboard to current position&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockKill:font facename=default size=0x0.
.br
.br
Delete selected text&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockIndent:font facename=default size=0x0.
.br
.br
Indent block by 1 character&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockUnindent:font facename=default size=0x0.
.br
.br
Unindent block by 1 character&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockMarkStream:font facename=default size=0x0.
.br
.br
Start/stop marking stream block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockMarkLine:font facename=default size=0x0.
.br
.br
Start/stop marking line block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockMarkColumn:font facename=default size=0x0.
.br
.br
Start/stop marking column block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockExtendBegin:font facename=default size=0x0.
.br
.br
Start extending selected block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockExtendEnd:font facename=default size=0x0.
.br
.br
Stop extending selected block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockReIndent:font facename=default size=0x0.
.br
.br
Reindent entire block (C/REXX mode)
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockSelectWord:font facename=default size=0x0.
.br
.br
Select word under cursor as block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockSelectLine:font facename=default size=0x0.
.br
.br
Select current line as block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockSelectPara:font facename=default size=0x0.
.br
.br
Select current paragraph (delimited by blank lines) as block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockPasteStream:font facename=default size=0x0.
.br
.br
Paste clipboard to current position as stream block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockPasteLine:font facename=default size=0x0.
.br
.br
Paste clipboard to current position as line block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockPasteColumn:font facename=default size=0x0.
.br
.br
Paste clipboard to current position as column block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockPrint:font facename=default size=0x0.
.br
.br
Print a block to configured device&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockRead:font facename=default size=0x0.
.br
.br
Read block from file&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockReadStream:font facename=default size=0x0.
.br
.br
Read block from file as stream block
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockReadLine:font facename=default size=0x0.
.br
.br
Read block from file as line block
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockReadColumn:font facename=default size=0x0.
.br
.br
Read block from file as column block
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockWrite:font facename=default size=0x0.
.br
.br
Write marked block to file&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockSort:font facename=default size=0x0.
.br
.br
Sorts the marked block in ascending order&per.
If mode setting MatchCase is set, characters will be compared case
sensitively&per.
When block is marked in :link reftype=hd res=8.
Stream:elink. or Line mode,
the entire lines in marked block will be compared&per.
When block is marked in Column
mode, only characters within marked columns will be compared&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockSortReverse:font facename=default size=0x0.
.br
.br
Sorts the marked block in descending order&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockUnTab:font facename=default size=0x0.
.br
.br
Remove tabs from marked lines&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockEnTab:font facename=default size=0x0.
.br
.br
Generate and optimize tabs in marked lines&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockMarkFunction:font facename=default size=0x0.
.br
.br
Mark current function as block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockTrim:font facename=default size=0x0.
.br
.br
Trim end-of-line whitespace
:p.:hp2.SEE ALSO&colon.:ehp2.
Block Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Text Editing and Insertion:font facename=default size=0x0.
.br
.br
:ul compact.
:li.Undo
:li.Redo
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Undo:font facename=default size=0x0.
.br
.br
Undo last operation
:p.:hp2.SEE ALSO&colon.:ehp2.
Text Editing and Insertion&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Redo:font facename=default size=0x0.
.br
.br
Redo last undone operation&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Text Editing and Insertion&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Folding Text:font facename=default size=0x0.
.br
.br
:ul compact.
:li.FoldCreate
:li.FoldCreateByRegexp
:li.FoldCreateAtRoutines
:li.FoldDestroy
:li.FoldDestroyAll
:li.FoldPromote
:li.FoldDemote
:li.FoldOpen
:li.FoldOpenNested
:li.FoldClose
:li.FoldOpenAll
:li.FoldCloseAll
:li.FoldToggleOpenClose
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldCreate:font facename=default size=0x0.
.br
.br
Create fold
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldCreateByRegexp:font facename=default size=0x0.
.br
.br
Create folds at lines matching a regular expression
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldCreateAtRoutines:font facename=default size=0x0.
.br
.br
Create folds at lines matching RoutineRx
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldDestroy:font facename=default size=0x0.
.br
.br
Destroy fold at current line
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldDestroyAll:font facename=default size=0x0.
.br
.br
Destroy all folds in the file
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldPromote:font facename=default size=0x0.
.br
.br
Promote fold to outer level
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldDemote:font facename=default size=0x0.
.br
.br
Demote fold to inner level
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldOpen:font facename=default size=0x0.
.br
.br
Open fold at current line
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldOpenNested:font facename=default size=0x0.
.br
.br
Open fold and nested folds
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldClose:font facename=default size=0x0.
.br
.br
Close current fold
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldOpenAll:font facename=default size=0x0.
.br
.br
Open all folds in the file
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldCloseAll:font facename=default size=0x0.
.br
.br
Close all folds in the file
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FoldToggleOpenClose:font facename=default size=0x0.
.br
.br
Toggle open/close current fold&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Folding Text&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Bookmarks:font facename=default size=0x0.
.br
.br
:ul compact.
:li.PlaceBookmark
:li.RemoveBookmark
:li.GotoBookmark
:li.PlaceGlobalBookmark
:li.RemoveGlobalBookmark
:li.GotoGlobalBookmark
:li.PushGlobalBookmark
:li.PopGlobalBookmark
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
PlaceBookmark:font facename=default size=0x0.
.br
.br
Place a file-local bookmark&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RemoveBookmark:font facename=default size=0x0.
.br
.br
Place a file-local bookmark&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
GotoBookmark:font facename=default size=0x0.
.br
.br
Go to file-local bookmark location&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
PlaceGlobalBookmark:font facename=default size=0x0.
.br
.br
Place global (persistent) bookmark&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RemoveGlobalBookmark:font facename=default size=0x0.
.br
.br
Remove global bookmark&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
GotoGlobalBookmark:font facename=default size=0x0.
.br
.br
Go to global bookmark location&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
PushGlobalBookmark:font facename=default size=0x0.
.br
.br
Push global bookmark (named as #<num>) to stack&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
PopGlobalBookmark:font facename=default size=0x0.
.br
.br
Pop global bookmark from stack&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Bookmarks&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Character Translation:font facename=default size=0x0.
.br
.br
:ul compact.
:li.CharCaseUp
:li.CharCaseDown
:li.CharCaseToggle
:li.CharTrans
:li.LineCaseUp
:li.LineCaseDown
:li.LineCaseToggle
:li.LineTrans
:li.BlockCaseUp
:li.BlockCaseDown
:li.BlockCaseToggle
:li.BlockTrans
:li.InsertString
:li.InsertSpace
:li.InsertChar
:li.TypeChar
:li.InsertTab
:li.InsertSpacesToTab
:li.SelfInsert
:li.WrapPara
:li.InsPrevLineChar
:li.InsPrevLineToEol
:li.CompleteWord
:li.FilePrev
:li.FileNext
:li.FileLast
:li.SwitchTo
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CharCaseUp:font facename=default size=0x0.
.br
.br
Convert current character to uppercase
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CharCaseDown:font facename=default size=0x0.
.br
.br
Convert current character to lowercase
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CharCaseToggle:font facename=default size=0x0.
.br
.br
Toggle case of current character
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CharTrans:font facename=default size=0x0.
.br
.br
Translate current character (like perl/sed)
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineCaseUp:font facename=default size=0x0.
.br
.br
Convert current line to uppercase
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineCaseDown:font facename=default size=0x0.
.br
.br
Convert current line to lowercase
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineCaseToggle:font facename=default size=0x0.
.br
.br
Toggle case of current line
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LineTrans:font facename=default size=0x0.
.br
.br
Translate characters on current line
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockCaseUp:font facename=default size=0x0.
.br
.br
Convert characters in selected block to uppercase
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockCaseDown:font facename=default size=0x0.
.br
.br
Convert characters in selected block to lowercase
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockCaseToggle:font facename=default size=0x0.
.br
.br
Toggle case of characters in selected block
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BlockTrans:font facename=default size=0x0.
.br
.br
Translate characters in selected block&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsertString:font facename=default size=0x0.
.br
.br
Insert argument string at cursor position
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsertSpace:font facename=default size=0x0.
.br
.br
Insert space
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsertChar:font facename=default size=0x0.
.br
.br
Insert character argument at cursor position
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TypeChar:font facename=default size=0x0.
.br
.br
Insert character at cursor position (expanding abbreviations)
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsertTab:font facename=default size=0x0.
.br
.br
Insert tab character at cursor position
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsertSpacesToTab:font facename=default size=0x0.
.br
.br
Insert appropriate number of spaces to simulate a tab&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SelfInsert:font facename=default size=0x0.
.br
.br
Insert typed character
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WrapPara:font facename=default size=0x0.
.br
.br
Wrap current paragraph
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsPrevLineChar:font facename=default size=0x0.
.br
.br
Insert character in previous line above cursor
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsPrevLineToEol:font facename=default size=0x0.
.br
.br
Insert previous line from cursor to end of line
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CompleteWord:font facename=default size=0x0.
.br
.br
Complete current word to last word starting with the
same prefix&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FilePrev:font facename=default size=0x0.
.br
.br
Switch to previous file in ring&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileNext:font facename=default size=0x0.
.br
.br
Switch to next file in ring&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileLast:font facename=default size=0x0.
.br
.br
Exchange last two files in ring&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SwitchTo:font facename=default size=0x0.
.br
.br
Switch to numbered buffer given as argument
:p.:hp2.SEE ALSO&colon.:ehp2.
Character Translation&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
File Commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.FileOpen
:li.FileOpenInMode
:li.FileReload
:li.FileSave
:li.FileSaveAll
:li.FileSaveAs
:li.FileWriteTo
:li.FilePrint
:li.FileClose
:li.FileCloseAll
:li.FileTrim
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileOpen:font facename=default size=0x0.
.br
.br
Open file
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileOpenInMode:font facename=default size=0x0.
.br
.br
Open file in specified mode
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileReload:font facename=default size=0x0.
.br
.br
Reload current file
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileSave:font facename=default size=0x0.
.br
.br
Save current file
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileSaveAll:font facename=default size=0x0.
.br
.br
Save all modified files
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileSaveAs:font facename=default size=0x0.
.br
.br
Rename Save current file
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileWriteTo:font facename=default size=0x0.
.br
.br
Write current file into another file
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FilePrint:font facename=default size=0x0.
.br
.br
Print current file
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileClose:font facename=default size=0x0.
.br
.br
Close current file
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileCloseAll:font facename=default size=0x0.
.br
.br
Close all open files
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FileTrim:font facename=default size=0x0.
.br
.br
Trim end-of-line whitespace
:p.:hp2.SEE ALSO&colon.:ehp2.
File Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Directory Commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.DirOpen
:li.DirGoUp
:li.DirGoDown
:li.DirGoRoot
:li.DirGoto
:li.DirSearchCancel
:li.DirSearchNext
:li.DirSearchPrev
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirOpen:font facename=default size=0x0.
.br
.br
Open directory browser
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirGoUp:font facename=default size=0x0.
.br
.br
Change to parent directory
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirGoDown:font facename=default size=0x0.
.br
.br
Change to currently selected directory
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirGoRoot:font facename=default size=0x0.
.br
.br
Change to root directory
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirGoto:font facename=default size=0x0.
.br
.br
Change to directory given as argument
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirSearchCancel:font facename=default size=0x0.
.br
.br
Cancel search
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirSearchNext:font facename=default size=0x0.
.br
.br
Find next matching file
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DirSearchPrev:font facename=default size=0x0.
.br
.br
Find previous matching file
:p.:hp2.SEE ALSO&colon.:ehp2.
Directory Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Search and Replace:font facename=default size=0x0.
.br
.br
:ul compact.
:li.IncrementalSearch
:li.Find
:li.FindReplace
:li.FindRepeat
:li.FindRepeatOnce
:li.FindRepeatReverse
:li.MatchBracket
:li.HilitWord
:li.SearchWordPrev
:li.SearchWordNext
:li.HilitMatchBracket
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
IncrementalSearch:font facename=default size=0x0.
.br
.br
Incremental search
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Find:font facename=default size=0x0.
.br
.br
Find
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FindReplace:font facename=default size=0x0.
.br
.br
Find and replace
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FindRepeat:font facename=default size=0x0.
.br
.br
Repeat last find/replace operation
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FindRepeatOnce:font facename=default size=0x0.
.br
.br
Repeat last find/replace operation only once
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FindRepeatReverse:font facename=default size=0x0.
.br
.br
Repeat last find/replace operation in reverse
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MatchBracket:font facename=default size=0x0.
.br
.br
Find matching bracket ([{<>}])
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
HilitWord:font facename=default size=0x0.
.br
.br
Highlight current word everywhere in the file
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SearchWordPrev:font facename=default size=0x0.
.br
.br
Search for previous occurence of word under cursor
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SearchWordNext:font facename=default size=0x0.
.br
.br
Search for next occurence of word under cursor
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
HilitMatchBracket:font facename=default size=0x0.
.br
.br
Highlight matching bracket
:p.:hp2.SEE ALSO&colon.:ehp2.
Search and Replace&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Window Commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.WinHSplit
:li.WinNext
:li.WinPrev
:li.WinClose
:li.WinZoom
:li.WinResize
:li.ViewBuffers
:li.ListRoutines
:li.ExitEditor
:li.ShowEntryScreen
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WinHSplit:font facename=default size=0x0.
.br
.br
Split window horizontally
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WinNext:font facename=default size=0x0.
.br
.br
Switch to next (bottom) window
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WinPrev:font facename=default size=0x0.
.br
.br
Switcn to previous (top) window&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WinClose:font facename=default size=0x0.
.br
.br
Close current window
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WinZoom:font facename=default size=0x0.
.br
.br
Delete all windows except for current one
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WinResize:font facename=default size=0x0.
.br
.br
Resize current window (+n,-n given as argument)
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewBuffers:font facename=default size=0x0.
.br
.br
View currently open buffers
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ListRoutines:font facename=default size=0x0.
.br
.br
Display routines in current source file
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ExitEditor:font facename=default size=0x0.
.br
.br
Exit FTE&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ShowEntryScreen:font facename=default size=0x0.
.br
.br
View external program output if available
:p.:hp2.SEE ALSO&colon.:ehp2.
Window Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Compiler Support:font facename=default size=0x0.
.br
.br
:ul compact.
:li.Compile
:li.RunCompiler
:li.ViewMessages
:li.CompileNextError
:li.CompilePrevError
:li.RunProgram
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Compile:font facename=default size=0x0.
.br
.br
Ask for compile command and run compiler
:p.:hp2.SEE ALSO&colon.:ehp2.
Compiler Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunCompiler:font facename=default size=0x0.
.br
.br
Run configured compile command
:p.:hp2.SEE ALSO&colon.:ehp2.
Compiler Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewMessages:font facename=default size=0x0.
.br
.br
View compiler output
:p.:hp2.SEE ALSO&colon.:ehp2.
Compiler Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CompileNextError:font facename=default size=0x0.
.br
.br
Switch to next compiler error
:p.:hp2.SEE ALSO&colon.:ehp2.
Compiler Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CompilePrevError:font facename=default size=0x0.
.br
.br
Switch to previous compiler error
:p.:hp2.SEE ALSO&colon.:ehp2.
Compiler Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunProgram:font facename=default size=0x0.
.br
.br
Run external program
:p.:hp2.SEE ALSO&colon.:ehp2.
Compiler Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
CVS Support:font facename=default size=0x0.
.br
.br
:ul compact.
:li.Cvs
:li.RunCvs
:li.ViewCvs
:li.ClearCvsMessages
:li.CvsDiff
:li.RunCvsDiff
:li.ViewCvsDiff
:li.CvsCommit
:li.RunCvsCommit
:li.ViewCvsLog
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Cvs:font facename=default size=0x0.
.br
.br
Ask for CVS options and run CVS
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunCvs:font facename=default size=0x0.
.br
.br
Run configured CVS command
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewCvs:font facename=default size=0x0.
.br
.br
View CVS output
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ClearCvsMessages:font facename=default size=0x0.
.br
.br
Clear CVS messages
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CvsDiff:font facename=default size=0x0.
.br
.br
Ask for CVS diff options and run CVS
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunCvsDiff:font facename=default size=0x0.
.br
.br
Run configured CVS diff command
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewCvsDiff:font facename=default size=0x0.
.br
.br
View CVS diff output
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CvsCommit:font facename=default size=0x0.
.br
.br
Ask for CVS commit options and run CVS
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunCvsCommit:font facename=default size=0x0.
.br
.br
Run configured CVS commit command
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewCvsLog:font facename=default size=0x0.
.br
.br
View CVS log
:p.:hp2.SEE ALSO&colon.:ehp2.
CVS Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
SVN Support:font facename=default size=0x0.
.br
.br
:ul compact.
:li.Svn
:li.RunSvn
:li.ViewSvn
:li.ClearSvnMessages
:li.SvnDiff
:li.RunSvnDiff
:li.ViewSvnDiff
:li.SvnCommit
:li.RunSvnCommit
:li.ViewSvnLog
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Svn:font facename=default size=0x0.
.br
.br
Ask for SVN options and run SVN
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunSvn:font facename=default size=0x0.
.br
.br
Run configured SVN command
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewSvn:font facename=default size=0x0.
.br
.br
View SVN output
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ClearSvnMessages:font facename=default size=0x0.
.br
.br
Clear SVN messages
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SvnDiff:font facename=default size=0x0.
.br
.br
Ask for SVN diff options and run SVN
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunSvnDiff:font facename=default size=0x0.
.br
.br
Run configured SVN diff command
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewSvnDiff:font facename=default size=0x0.
.br
.br
View SVN diff output
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SvnCommit:font facename=default size=0x0.
.br
.br
Ask for SVN commit options and run SVN
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
RunSvnCommit:font facename=default size=0x0.
.br
.br
Run configured SVN commit command
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewSvnLog:font facename=default size=0x0.
.br
.br
View SVN log
:p.:hp2.SEE ALSO&colon.:ehp2.
SVN Support&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
TAGS Commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.TagFind
:li.TagFindWord
:li.TagNext
:li.TagPrev
:li.TagPop
:li.TagLoad
:li.TagClear
:li.TagGoto
:eul.

fte supports TAGS files generated by programs like ctags&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagFind:font facename=default size=0x0.
.br
.br
Find word argumen in tag files&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagFindWord:font facename=default size=0x0.
.br
.br
Find word under cursor in tag files&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagNext:font facename=default size=0x0.
.br
.br
Switch to next occurance of tag
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagPrev:font facename=default size=0x0.
.br
.br
Switch to previous occurance of tag
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagPop:font facename=default size=0x0.
.br
.br
Pop saved position from tag stack
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagLoad:font facename=default size=0x0.
.br
.br
Load tag file and merge with current tags
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagClear:font facename=default size=0x0.
.br
.br
Clear loaded tags
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
TagGoto:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
TAGS Commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Option commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.ToggleAutoIndent
:li.ToggleInsert
:li.ToggleExpandTabs
:li.ToggleShowTabs
:li.ToggleUndo
:li.ToggleReadOnly
:li.ToggleKeepBackups
:li.ToggleMatchCase
:li.ToggleBackSpKillTab
:li.ToggleDeleteKillTab
:li.ToggleSpaceTabs
:li.ToggleIndentWithTabs
:li.ToggleBackSpUnindents
:li.ToggleWordWrap
:li.ToggleTrim
:li.ToggleShowMarkers
:li.ToggleHilitTags
:li.ToggleShowBookmarks
:li.ToggleMakeBackups
:li.SetLeftMargin
:li.SetRightMargin
:li.ToggleSysClipboard
:li.SetPrintDevice
:li.ChangeTabSize
:li.ChangeLeftMargin
:li.ChangeRightMargin
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleAutoIndent:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleInsert:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleExpandTabs:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleShowTabs:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleUndo:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleReadOnly:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleKeepBackups:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleMatchCase:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleBackSpKillTab:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleDeleteKillTab:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleSpaceTabs:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleIndentWithTabs:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleBackSpUnindents:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleWordWrap:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleTrim:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleShowMarkers:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleHilitTags:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleShowBookmarks:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleMakeBackups:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SetLeftMargin:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SetRightMargin:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ToggleSysClipboard:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SetPrintDevice:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ChangeTabSize:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ChangeLeftMargin:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ChangeRightMargin:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Option commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
.br
Other commands:font facename=default size=0x0.
.br
.br
:ul compact.
:li.ShowPosition
:li.ShowVersion
:li.ShowKey
:li.WinRefresh
:li.MainMenu
:li.ShowMenu
:li.LocalMenu
:li.ChangeMode
:li.ChangeKeys
:li.ChangeFlags
:li.Cancel
:li.Activate
:li.Rescan
:li.CloseActivate
:li.ActivateInOtherWindow
:li.DeleteFile
:li.ASCIITable
:li.DesktopSave
:li.ClipClear
:li.DesktopSaveAs
:li.ChildClose
:li.BufListFileSave
:li.BufListFileClose
:li.BufListSearchCancel
:li.BufListSearchNext
:li.BufListSearchPrev
:li.ViewModeMap
:li.ClearMessages
:li.IndentFunction
:li.MoveFunctionPrev
:li.MoveFunctionNext
:li.InsertDate
:li.InsertUid
:li.FrameNew
:li.FrameClose
:li.FrameNext
:li.FramePrev
:li.BufferViewNext
:li.BufferViewPrev
:li.ShowHelpWord
:li.ShowHelp
:li.ConfigRecompile
:li.SetCIndentStyle
:li.SetIndentWithTabs
:li.ListMark
:li.ListUnmark
:li.ListToggleMark
:li.ListMarkAll
:li.ListUnmarkAll
:li.ListToggleMarkAll
:eul.

:p.:hp2.SEE ALSO&colon.:ehp2.
Cursor Movement, Deleting Text, Line Commands, Block Commands, Text Editing and Insertion, Folding Text, Bookmarks, Character Translation, File Commands, Directory Commands, Search and Replace, Window Commands, Compiler Support, CVS Support, SVN Support, 
TAGS Commands, Option commands, Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ShowPosition:font facename=default size=0x0.
.br
.br
Show internal position information on status line
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ShowVersion:font facename=default size=0x0.
.br
.br
Show editor version information
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ShowKey:font facename=default size=0x0.
.br
.br
Wait for keypress and display modifiers+key pressed
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
WinRefresh:font facename=default size=0x0.
.br
.br
Refresh display
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MainMenu:font facename=default size=0x0.
.br
.br
Activate main menu
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ShowMenu:font facename=default size=0x0.
.br
.br
Popup menu specified as argument
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
LocalMenu:font facename=default size=0x0.
.br
.br
Popup context menu
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ChangeMode:font facename=default size=0x0.
.br
.br
Change active mode for current buffer
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ChangeKeys:font facename=default size=0x0.
.br
.br
Change keybindings for current buffer
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ChangeFlags:font facename=default size=0x0.
.br
.br
Change option flags for current buffer
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Cancel:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Activate:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Rescan:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
CloseActivate:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ActivateInOtherWindow:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DeleteFile:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ASCIITable:font facename=default size=0x0.
.br
.br
Display ASCII selector in status line&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DesktopSave:font facename=default size=0x0.
.br
.br
Save desktop
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ClipClear:font facename=default size=0x0.
.br
.br
Clear clipboard
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
DesktopSaveAs:font facename=default size=0x0.
.br
.br
Save desktop under a new name
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ChildClose:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BufListFileSave:font facename=default size=0x0.
.br
.br
Save currently selected file in buffer list
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BufListFileClose:font facename=default size=0x0.
.br
.br
Close currently selected file in buffer list
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BufListSearchCancel:font facename=default size=0x0.
.br
.br
Cancel search
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BufListSearchNext:font facename=default size=0x0.
.br
.br
Next match in search
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BufListSearchPrev:font facename=default size=0x0.
.br
.br
Previous match in search
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ViewModeMap:font facename=default size=0x0.
.br
.br
View current mode keybindings
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ClearMessages:font facename=default size=0x0.
.br
.br
Clear compiler messages
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
IndentFunction:font facename=default size=0x0.
.br
.br
Indent current function
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFunctionPrev:font facename=default size=0x0.
.br
.br
Move cursor to previous function
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
MoveFunctionNext:font facename=default size=0x0.
.br
.br
Move cursor to next function
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsertDate:font facename=default size=0x0.
.br
.br
Insert date at cursor
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
InsertUid:font facename=default size=0x0.
.br
.br
Insert user name at cursor
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FrameNew:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FrameClose:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FrameNext:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
FramePrev:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BufferViewNext:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
BufferViewPrev:font facename=default size=0x0.
.br
.br
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ShowHelpWord:font facename=default size=0x0.
.br
.br
Show context help on keyword&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ShowHelp:font facename=default size=0x0.
.br
.br
Show help for FTE&per.
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ConfigRecompile:font facename=default size=0x0.
.br
.br
Recompile editor configuration
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SetCIndentStyle:font facename=default size=0x0.
.br
.br
Set C indentation style parameters
Has the following parameters&colon.
C_Indent = 4;
C_BraceOfs = 0;
C_ParenDelta = -1;
C_CaseOfs = 0;
C_CaseDelta = 4;
C_ClassOfs = 0;
C_ClassDelta = 4;
C_ColonOfs = -4;
C_CommentOfs = 0;
C_CommentDelta = 1;
C_FirstLevelWidth = -1;
C_FirstLevelIndent = 4;
C_Continuation = 4;
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
SetIndentWithTabs:font facename=default size=0x0.
.br
.br
Set value of indent-with-tabs to argument
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ListMark:font facename=default size=0x0.
.br
.br
Mark single line in list
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ListUnmark:font facename=default size=0x0.
.br
.br
Unmark single line in list
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ListToggleMark:font facename=default size=0x0.
.br
.br
Toggle marking of single line in list
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ListMarkAll:font facename=default size=0x0.
.br
.br
Mark all lines in list
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ListUnmarkAll:font facename=default size=0x0.
.br
.br
Unmark all lines in list
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
ListToggleMarkAll:font facename=default size=0x0.
.br
.br
Toggle marking of all lines in list
Delete content's of selection and paste clipboard to current position
:p.:hp2.SEE ALSO&colon.:ehp2.
Other commands&per.
.* Source filename: events.html
:h2 res=7.Event Bindings
:font facename=default size=0x0.
:p.

eventmap section is used to bind editor commands to user events&per.

.br
:font facename='Helv' size=32x20.
.br
Keybindings:font facename=default size=0x0.
.br
.br
:p.
Keybindings are inherited from parent modes unless overriden&per.
:p.
Here are some examples of key specifiactions&colon.
:dl compact break=all.
:dt.[A]
:dd.Uppercase a
:dt.[a]
:dd.Lowercase a 
:dt.[;]
:dd.Semicolon
:dt.[A+A]
:dd.Alt+A
:dt.[C+B]
:dd.Ctrl+B
:dt.[A+C+F1]
:dd.Alt+Ctrl+F1
:dt.[A+C+S+F1]
:dd.Alt+Ctrl+Shift+F1
:dt.[A+Space]
:dd.Alt+Space
:dt.[C+K_C+B]
:dd.Ctrl+K and then Ctrl+B (two keys)
:dt.[C+A_C+B_C+C]
:dd.Ctrl+A Ctrl+B Ctrl+C must be pressed in sequence&per.
:dt.[G+-]
:dd.Gray -
:dt.[G++]
:dd.Gray +
:dt.[C-S-X]
:dd.X, ignore the state of Ctrl and Shift keys&per.
:dt.[C+\\]
:dd.Ctrl+Backslash
:dt.[C+\[]
:dd.Ctrl+[
:dt.[C+G-Left]
:dd.Ctrl+Left, ignore difference between the two Left keys&per.
:dt.[C+A-A]
:dd.Ctrl+A, ignore the state of Alt key&per.
:edl.

:p.The following special keys are available (case sensitive)&colon.
:p.:hp2.F1-F12 Home End PgUp PgDn Insert Delete Up Down Left Right 
Enter Esc BackSp Space Tab Center:ehp2.
:p.Keyname can be preceeded by modifiers :hp2.(A, C, G, S):ehp2.&per. If modifier is followed
by a :hp2.+:ehp2. (plus), the modifier key must be pressed to match the key 
specification&per. If the modifier key is followed by :hp2.-:ehp2. (minus), the state
of the modifier key is ignored&per.
:p.Multiple-key combinations can be specified by separating
them with :hp2._:ehp2. (underline)
:p.Keys are bound using the :hp2.key:ehp2. command&colon.
:p.:hp2.key:ehp2. :hp2.[keyspec]:ehp2. { :link reftype=hd res=13.editor commands:elink. }
:p.ASCII characters >= 32 are bound to TypeChar by default&per.
:p.Any number of commands can be bound to a key combination or menu item&per.
They are executed in sequence until one of them fails&per.
:p.See :hp1.ui_fte&per.fte:ehp1. configuration file for examples and default
configuration&per.

.br
:font facename='Helv' size=32x20.
.br
Abbreviations:font facename=default size=0x0.
.br
.br

Abbreviations are used to automatically replace some text or run an
editor macro when some word is typed in&per. When a non-word character is
entered, the previous word is searched for in the list of
abbreviations&per. When it is found, it is either replaced with a new
string or a macro is executed&per.
:p.
Syntax&colon.

:cgraphic.
abbrev 'old-word' 'new-string'

abbrev 'old-word' { Macro }
:ecgraphic.

:p. Some examples of abbreviations&colon.

:cgraphic.
    abbrev 'wcsw' 'WinCreateStdWindow';
    
    abbrev 'ifx' {
        KillWordPrev; InsertString 'if () {'; LineIndent; LineNew; 
        InsertString '}'; LineIndent; 
        MoveUp; MoveLineEnd; 3&colon.MoveLeft; 
        Fail; # do not insert typed character
    }
:ecgraphic.
:p.
The first one defines a replacement string, while the second one defines
an editor macro to be run&per.
:p.
For abbreviations to work, setting
:link reftype=hd res=8.Abbreviations:elink. must be set to 1 for
active mode&per.

.br
:font facename='Helv' size=32x20.
.br
EventMap Settings:font facename=default size=0x0.
.br
.br

.br
:font facename='Helv' size=20x12.
.br
MainMenu:font facename=default size=0x0.
.br
.br
"menu"
:p.Main menu displayed when editing in this mode&per.

.br
:font facename='Helv' size=20x12.
.br
LocalMenu:font facename=default size=0x0.
.br
.br
"menu"
:p.Local menu used when editing in this mode&per.


.* Source filename: global.html
:h2 res=6.Global Configuration
:font facename=default size=0x0.
:p.

.br
:font facename='Helv' size=32x20.
.br
Global Settings:font facename=default size=0x0.
.br
.br
The following settings can be used in the :hp2.GLOBAL:ehp2. section of the
configuration file&per. Some of the options are platform specific (to be fixed)&per.

.br
:font facename='Helv' size=20x12.
.br
DefaultModeName:font facename=default size=0x0.
.br
.br
Default mode name for loading/editing files&per. If not set or invalid,
first mode in the configuration file will be used instead&per. By default
set to 'PLAIN'&per.

.br
:font facename='Helv' size=20x12.
.br
CompletionFilter:font facename=default size=0x0.
.br
.br
Files matching this regexp are ignored when doing filename completion&per.

.br
:font facename='Helv' size=20x12.
.br
CompileRx:font facename=default size=0x0.
.br
.br
Defines :link reftype=hd res=9.regular expressions:elink. and thers subpattern
indices to match when searching for errors and warnings in compilation
output&per. First number is an index of the subpattern that matches 
filename&per. The second must match the line number, the third parameter is
the regular expression to match to each line of the compiler output&per.

.br
:font facename='Helv' size=20x12.
.br
OpenAfterClose:font facename=default size=0x0.
.br
.br
If set to 1, editor will prompt for another file when all files are
closed&per.

.br
:font facename='Helv' size=20x12.
.br
SysClipboard:font facename=default size=0x0.
.br
.br
When set to 1, editor will use external (PM, X11) clipboard instead of
internal one&per.

.br
:font facename='Helv' size=20x12.
.br
ScreenSizeX:font facename=default size=0x0.
.br
.br
Number of columns visible on screen or window

.br
:font facename='Helv' size=20x12.
.br
ScreenSizeY:font facename=default size=0x0.
.br
.br
Number of lines visible on screen or window

.br
:font facename='Helv' size=20x12.
.br
CursorInsertStart:font facename=default size=0x0.
.br
.br
Starting percentage of cursor size (from top) when in insert mode&per.

.br
:font facename='Helv' size=20x12.
.br
CursorInsertEnd:font facename=default size=0x0.
.br
.br
Ending percentage of cursor size when in insert mode&per.

.br
:font facename='Helv' size=20x12.
.br
CursorOverStart:font facename=default size=0x0.
.br
.br
Starting percentage of cursor size when in overstrike mode

.br
:font facename='Helv' size=20x12.
.br
CursorOverEnd:font facename=default size=0x0.
.br
.br
Ending percentage of cursor size when in overstrike mode&per.

.br
:font facename='Helv' size=20x12.
.br
SelectPathname:font facename=default size=0x0.
.br
.br
If set to 1, pathname will be selected by default when prompting for a
file in :link reftype=hd res=13.FileOpen:elink. function&per. If set to 0,
pathname will not be selected, this allows you to quickly type a new
filename, without erasing an entire entryfield&per.

.br
:font facename='Helv' size=20x12.
.br
ShowMenuBar:font facename=default size=0x0.
.br
.br
If set to 1, main menu bar will be visible&per.

.br
:font facename='Helv' size=20x12.
.br
ShowVScroll:font facename=default size=0x0.
.br
.br
If set to 1, scroll bar will be visible&per.

.br
:font facename='Helv' size=20x12.
.br
ShowHScroll:font facename=default size=0x0.
.br
.br
If set to 1, scroll bar will be visible&per.

.br
:font facename='Helv' size=20x12.
.br
KeepHistory:font facename=default size=0x0.
.br
.br
If set to 1, last file position and imput prompt history will
be loaded on startup and saved on exit&per. Can be overriden
with command line option '-h'&per.

.br
:font facename='Helv' size=20x12.
.br
LoadDesktopOnEntry:font facename=default size=0x0.
.br
.br
If set to 1, all files listed in FTE&per.DSK in current directory or
FTE&per.EXE directory will be loaded into FTE&per. The desktop file can
be overriden with command line option '-d'&per.
:p.
If set to 2, desktop is only loaded (and saved) if there are no
files specified on the command line&per.

.br
:font facename='Helv' size=20x12.
.br
SaveDesktopOnExit:font facename=default size=0x0.
.br
.br
If set to 1, desktop will be automatically saved when ExitEditor command is issued&per.

.br
:font facename='Helv' size=20x12.
.br
KeepMessages:font facename=default size=0x0.
.br
.br
If set to 1, compiler messages will be kept until deleted by user&per.

.br
:font facename='Helv' size=20x12.
.br
ScrollBorderX:font facename=default size=0x0.
.br
.br
Horizontal offset to the border before window starts scrolling&per.

.br
:font facename='Helv' size=20x12.
.br
ScrollBorderY:font facename=default size=0x0.
.br
.br
Vertical offset to the border before window starts scrolling&per.

.br
:font facename='Helv' size=20x12.
.br
ScrollJumpX:font facename=default size=0x0.
.br
.br
Scroll window by this many columns when cursor reaches scrolling border&per.

.br
:font facename='Helv' size=20x12.
.br
ScrollJumpY:font facename=default size=0x0.
.br
.br
Scroll window by this many lines when cursor reaches scrolling border&per.

.br
:font facename='Helv' size=20x12.
.br
C_*:font facename=default size=0x0.
.br
.br
Define the C mode smart indentation parameters

:p. See section on configuring C mode indentation&per.

.br
:font facename='Helv' size=20x12.
.br
REXX_Indent:font facename=default size=0x0.
.br
.br
Defines the REXX basic indentation level

.br
:font facename='Helv' size=32x20.
.br
CMode Smart Indentation:font facename=default size=0x0.
.br
.br

:hp2.Settings for CMode smart indentation:ehp2.
:p.
:dl compact break=all.
:dt.:hp2.C_Indent:ehp2.
:dd.Basic C indentation level
:dt.:hp2.C_BraceOfs:ehp2.
:dd.Brace '{' offset
:dt.:hp2.C_CaseOfs:ehp2.
:dd.Offset of case and default statements
:dt.:hp2.C_CaseDelta:ehp2.
:dd.Offsets of statements following case/default&per.
:dt.:hp2.C_ClassOfs:ehp2.
:dd.Offset of public, private and protected
:dt.:hp2.C_ClassDelta:ehp2.
:dd.Offset of statements following public, private, protected
:dt.:hp2.C_ColonOfs:ehp2.
:dd.Offset of labels
:dt.:hp2.C_CommentOfs:ehp2.
:dd.Offset of comments
:dt.:hp2.C_CommentDelta:ehp2.
:dd.Offset of second line of comments
:dt.:hp2.C_FirstLevelWidth:ehp2.
:dd.Width of the first indentation level (indent of '{' in the function start)&per.
:dt.:hp2.C_FirstLevelIndent:ehp2.
:dd.Indentation of statements in the first indentation level&per.
:dt.:hp2.C_ParenDelta:ehp2.
:dd.When >= 0, offset of continued text after '('&per. When set to -1, the offset is equal to position of '(' plus one&per.
:edl.

:p.
Example 1&colon.

:cgraphic.
class line {
public&colon.                   // C_ClassOfs = 0
    line();               // C_ClassDelta = 4
    ~line();
};

int main() {
    int x = 1;
    
    /*                    // C_CommentOfs = 0
     * check value        // C_CommentDelta = 1
     */
    
    puts("main");         // C_Indent = 4
    if (x)
    {                     // C_BraceOfs = 0
        switch (x) {
        case 1&colon.           // C_CaseOfs = 0
            puts("ok");   // C_CaseDelta = 4
            break;
        }
    }
end&colon.
    return 0;
}
:ecgraphic.

:p.
Example 2&colon.

:cgraphic.
class line {
  public&colon.                     // C_ClassOfs = 2
    line();                   // C_ClassDelta = 2
    ~line();
};

int main() {
    int x = 1;
    
      /*                      // C_CommentOfs = 2
      ** check value          // C_CommentDelta = 0
      */
    
    puts("main");             // C_Indent = 4
    if (x)
    {                         // C_BraceOfs = 0
        switch (x) {
            case 1&colon.           // C_CaseOfs = 4
                puts("ok");   // C_CaseDelta = 4
                break;
        }
    }
end&colon.
    return 0;
}
:ecgraphic.


.* Source filename: install.html
:h2 res=3.Installation 
:font facename=default size=0x0.
:p.
This section covers installation and configuration of editor&per.
.br
.br
:font facename='Helv' size=20x12.
.br
Required files:font facename=default size=0x0.
.br
.br
:p. The default configuration file provides a basic configuration primarily for editing broken configuration files
in the regular configuration. :font facename='System VIO' size=14x8.edefault&per.fte:font facename=default size=0x0.. 
This file should be place in eFTe's install directory.

:p. Place executable files somewhere on your :hp2.PATH:ehp2.&per. The
configuration files should be located in the same directory as executable or the config subdirectory. By default eFTE
and eFTEPM look for the file :font facename='System VIO' size=14x8.mymain&per.fte:font facename=default size=0x0.&per.
as the root configuration file. All the rest of the configuration files are "included" by earlier files. You can
name your "root" file something else but you will then need to use the :font facename='System VIO' size=14x8.-c 
:font facename=default size=0x0.&per.switch followed by the full pathname for that file. For example: 
.br
efte -cx&colon.\efte\config\mynewconfig.fte
.br
:p. To get the most out of eFTE/2, I suggest you install some additional packages and include various help files
in your HELP and/or BOOKSHELF paths in config.sys. Even if you are using open watcom and don't need the IBM OS/2
toolkit, you should install it and include the path to its help files in HELP. The same is true for your compiler
help files. 
.br
.br
:hp2.A list of packages which eFTE/2 is setup to work with if they are in the PATH&colon.:ehp2.
:p.
:dl compact break=all.
:dt.:hp2.Open watcom:ehp2.
:dd.Wmake and the C/C++ help files are available directly from the menus (Can easily be changed if you use something else)
:dt.:hp2.Grep:ehp2.
:dd.Called directly from the menu; You can click on the results to open the file at the found line.
:dt.:hp2.ispell:ehp2.
:dd.Provides reasonable spell checking.
:dt.:hp2.SVN and CVS:ehp2.
:dd.Direct access to the most commonly used commands for these versioning systems.
:dt.:hp2.HTML Tidy:ehp2.
:dd.Direct access via menu
:edl.
.br
:h3 res=17.List of Configuration Files
:p.This is a complete list of the config files that need to be installed on a clean install.
Updates are meant to be included in a file related to the file being update i.e. mym_html.fte 
for m_html.fte. In practice any one of them may get edited by the user. This means updating 
them will be difficult.
:p. If you wish to modify only a specific mode, add customizations to a my*.fte file
and "include" it at the end of file. To also modify all of the descendants,
"include" customizations right after the include statement for mode.

:dl compact break=all.
:dthd.Abreviation expansion for various mods:
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\ab_c.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ab_c_os2.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ab_java.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ab_perl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ab_rexx.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ab_sh.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.Character sets and conversion tools selectable from menus (Incomplete)
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\charset\ents.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\charset\jap.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\charset\latin.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\htmlchar.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\htmlconv.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.Color definitions and schemes for eFTE(PM)
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\color.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_b_kb.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_base.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_blk.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_blue.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_bluez.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_gray.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_nce.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\pal_wht.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.Experimental (incomplete) expansions of the UI (included as a base for 
further development)
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\Experimental\m_vi.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\Experimental\m_xp.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\Experimental\rgbcolor.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\Experimental\ui_k_joe.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\Experimental\ui_vi.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.Mode specific keyboard hot key definitions.
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_c.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_fte.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_groovy.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_html.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_java.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_perl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_rexx.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_rst.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\kbd\k_sgml.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.Mode specific text highlighting
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\m_4gl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_a51.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_ada.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_asm.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_asm370.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_basic.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_batch.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_bin.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_c.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_catbs.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_clario.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_cmake.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_cnfgs.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_css.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_diff.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_ebnf.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_eiffel.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_euphoria.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_falcon.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_fort90.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_fte.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_gawk.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_groovy.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_html.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_icon.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_idl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_ipf.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_java.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_ldsgml.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_lisaac.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_lua.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_make.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_markup.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_merge.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_mod3.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_msg.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_mvsasm.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_ocaml.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_pascal.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_perl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_php.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_plain.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_py.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_resdlg.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_rexx.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_rpm.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_rst.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_ruby.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_sgml.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_sh.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_siod.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_sl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_sml.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_source.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_sql.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_tcl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_tex.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_texi.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_text.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_unrealscript.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_vhdl.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_xml.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\m_xslt.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.Main/Global configuration
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\main.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\mymain.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\systemmain.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\global.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.English language menus (always installed as a fall back)
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\menu\m_c.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_css.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_groovy.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_html.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_html_t.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_ipf.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_make.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_rexx.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_rst.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\m_sgml.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_k_brf.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_k_fte.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_k_ne.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_k_ws.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_m_ew.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_m_fte.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_m_fte.fte~
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_m_ne.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu\ui_m_ws.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.Internationalized menus where xx is the country code
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_c.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_css.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_groovy.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_html.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_html_t.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_ipf.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_make.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_rexx.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_rst.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\m_sgml.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_k_brf.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_k_fte.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_k_ne.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_k_ws.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_m_ew.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_m_fte.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_m_fte.fte~
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_m_ne.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\menu_xx\ui_m_ws.fte
:dd.:font facename=default size=0x0.
:edl.
:dl compact break=all.
:dthd.User interface styles
:ddhd.
:dt.:font facename='System VIO' size=14x8.config\ui_brief.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ui_ew.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ui_fte.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ui_mixed.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ui_ne.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\ui_ws.fte
:dd.:font facename=default size=0x0.
:dt.:font facename='System VIO' size=14x8.config\uicstyle.fte
:dd.:font facename=default size=0x0.:edl.
.br
:cgraphic.___________________________________________________________________________:ecgraphic.
.br
.br
:font facename='Helv' size=32x20.
:h3 res=18.OS2:font facename=default size=0x0.
.br
.br

The following files are included in the archive&colon.
:dl compact break=all.
:dt.:font facename='System VIO' size=14x8.README2:font facename=default size=0x0.
:dd.Readme file&per.
:dt.:font facename='System VIO' size=14x8.efte.exe:font facename=default size=0x0.
:dd.VIO console-only executable
:dt.:font facename='System VIO' size=14x8.eftepm.exe:font facename=default size=0x0.
:dd.PM executable&per.
:dt.:font facename='System VIO' size=14x8.edefault&per.fte:font facename=default size=0x0.
:dd.Default configuration file
:dt.:font facename='System VIO' size=14x8.efte2&per.hlp:font facename=default size=0x0.
:dd.Reference manual
:dt.:font facename='System VIO' size=14x8.config\*&per.fte:font facename=default size=0x0.
:dd.Configuration files&per.
:dt.:font facename='System VIO' size=14x8.HISTORY:font facename=default size=0x0.
:dd.History of changes&per.
:dt.:font facename='System VIO' size=14x8.README.efte:font facename=default size=0x0.
:dd.efte readme file&per.
:dt.:font facename='System VIO' size=14x8.file_id&per.diz:font facename=default size=0x0.
:dd.Program description for BBS upload&per.
:dt.:font facename='System VIO' size=14x8.COPYING:font facename=default size=0x0.
:dd.GNU licence&per.
:dt.:font facename='System VIO' size=14x8.Artistic:font facename=default size=0x0.
:dd.Artistic licence&per.
:dt.:font facename='System VIO' size=14x8.AUTHORS:font facename=default size=0x0.
:dd.Contributor credits&per.
:edl.


:p. The default configuration files are in
:font facename='System VIO' size=14x8.edefault&per.fte:font facename=default size=0x0.&per. 
This file should be in the:font facename='System VIO' size=14x8. eFTE install directory
:font facename=default size=0x0.to be automatically loaded by eFTE(PM)&per. 

:p. Suggested installation directories&colon.
:cgraphic.
    %TOOLS%\eFTE\efte.exe
    %TOOLS%\eFTE\eftepm.exe
    %TOOLS%\eFTE\efte2.hlp
    %TOOLS%\eFTE\edefault.fte
    %TOOLS%\eFTE\config\*&per.fte
    %TOOLS%\eFTE\docs\README.efte
    %TOOLS%\eFTE\docs\HISTORY
    %TOOLS%\eFTE\docs\README2
    %TOOLS%\eFTE\docs\COPYING
    %TOOLS%\eFTE\docs\Artistic
    %TOOLS%\eFTE\docs\AUTHORS
:ecgraphic.

.* Source filename: modes.html
:h2 res=8.Mode Configuration
:font facename=default size=0x0.
:p.
fte allows each file extension to have a different editing mode&per. Mode
is a collection of editor settings such as keybindings, tab settings,
autoindent settings, syntax highlighting,&per.&per.&per.
:p.
Syntax of :hp2.mode:ehp2. command is
:p.
:cgraphic.
mode NAME { mode settings }
mode NAME&colon. PARENT { mode settings }
:ecgraphic.

:p. Mode with name :hp1.NAME:ehp1.inherits settings from mode :hp1.PARENT:ehp1.
if parent mode is specified at mode declaration&per.

:p. When editor is searching for a mode to use for a file it will
first check if the mode has been overriden by a FileOpenInMode command or a command line
option (:hp2.-m:ehp2.)&per.

:p. Then it will check if the file name matches FileNameRx defined in mode declarations&per. 

:p. If the mode has still not been found, it will read the first line
(max 80 chars) of the file, and attempt to match the FirstLineRx with the first line&per. 

:p. If this fails, the editor will use mode specified by
:hp2.:link reftype=hd res=6.DefaultModeName:elink.:ehp2. global
setting to load a file&per. If that mode does not exist, first mode defined
in the configuration file will be used&per.

:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Mode Settings:font facename=default size=0x0.
.br
.br
:p.
The following settings can be specified for each mode&colon.
.br
:font facename='Tms Rmn' size=18x10.
.br
ExpandTabs:font facename=default size=0x0.
.br
.br
{0,1}
:p.
Should be set to 1 if tabs are to be expanded when displayed&per. Use
:link reftype=hd res=13.ToggleExpandTabs:elink. command to toggle
during editing&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
TabSize:font facename=default size=0x0.
.br
.br
{1-32}
:p.Tab size when tabs are shown expanded on display&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
AutoIndent:font facename=default size=0x0.
.br
.br
{0,1}
:p.Should be set to 1 if autoindent is to be used&per. Use
:link reftype=hd res=13.ToggleAutoIndent:elink. command
to toggle it on/off during editing&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
Insert:font facename=default size=0x0.
.br
.br

{0,1}
:p.
If set to :hp2.1:ehp2., Insert mode is active by default&per.
If set to :hp2.0:ehp2., Overwrite mode is active by default&per.
:p. Use :link reftype=hd res=13.ToggleInsert:elink. command
to toggle it on/off during editing&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
StripChar:font facename=default size=0x0.
.br
.br
{ASCII code/-1}

:p.This characted will be stripped if it is found the end of any line
when the file is being loaded&per. If it is set to :hp2.-1:ehp2., no characted
will be stripped&per.
:p.Usually used to strip 13 (CR) characters from DOS text files&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
LineChar:font facename=default size=0x0.
.br
.br
{ASCII code/-1}

:p.This character is used as a line separator when loading a file&per.
If set to :hp2.-1:ehp2., there is no line separator&per. (:hp2.WARNING&colon. File will
be loaded as one line if LineChar is set to -1:ehp2.)&per.
:p.Usually set to 10 (LF) as standard text file line separator&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
AddCR:font facename=default size=0x0.
.br
.br
{0,1}

:p.If set to :hp2.1:ehp2., CR (13, \r) character will be added to end of
line when saving&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
AddLF:font facename=default size=0x0.
.br
.br

{0,1}
:p.If set to :hp2.1:ehp2., LF (10, \n) characted will be added to end if line when saving&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
ForceNewLine:font facename=default size=0x0.
.br
.br
{0,1}
:p.Normally, when saving, the last line is saved without any CR/LF
characters&per. This setting will override that behaviour&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
Hilit:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to :hp2.1:ehp2., syntax highliting will be active&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
ShowTabs:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to :hp2.1:ehp2., tabs will be visible as circles (EPM-like)&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
IndentMode:font facename=default size=0x0.
.br
.br
{PLAIN,C,REXX}
:p.Activates the specified smart indent mode&per. (PLAIN mode specifies
no smart audoindenting, just normal autoindent)&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
Colorizer:font facename=default size=0x0.
.br
.br
Specifies a previously declared colorize mode to use for syntax
highlighting in this editing mode&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
EventMap:font facename=default size=0x0.
.br
.br
Specify the name of existing eventmap to use for current mode&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
UndoLimit:font facename=default size=0x0.
.br
.br
{Number}
:p.Limit undo to this many recent commands (-1 = unlimited)

.br
:font facename='Tms Rmn' size=18x10.
.br
UndoMoves:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, all cursor movements will be recorded on undo stack&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
KeepBackups:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to :hp2.0:ehp2., backup files will be deleted after a successful
save operation&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
MatchCase:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to :hp2.0:ehp2., searches will be case insensitive&per. This can be
toggled via :link reftype=hd res=13.ToggleMatchCase:elink. command when editor
is running&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
BackSpKillTab:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, :link reftype=hd res=13.BackSpace:elink. will kill entire tabs instead of converting them to spaces&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
DeleteKillTab:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, :link reftype=hd res=13.Delete:elink. will kill entire tabs instead of converting them to spaces&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
BackSpUnindents:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, :link reftype=hd res=13.BackSpace:elink. will unindent to previous indentation level if issued on beginning of line&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
SpaceTabs:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, :link reftype=hd res=13.InsertTab:elink. command will insert spaces instead of tabs&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
IndentWithTabs:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, indentation will be done using tabs instead of spaces&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
WordWrap:font facename=default size=0x0.
.br
.br
{0,1,2}
:p.If set to 1, editor wrap current line when right margin is reached&per.
If set to 2, editor will wrap current paragraph continously&per. Paragraphs
as recognised by :link reftype=hd res=13.WrapPara:elink. command must be
separated by blank lines&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
LeftMargin:font facename=default size=0x0.
.br
.br
{1-xx}
:p.Left margin for word wrap (:link reftype=hd res=13.WrapPara:elink. command)&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
RightMargin:font facename=default size=0x0.
.br
.br
{1-xx}
:p.Right margin for word wrap (:link reftype=hd res=13.WrapPara:elink. command)&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
Trim:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, spaces on the end of line will be trimmed when editing&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
ShowMarkers:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, end of line and end of file markers will be shown&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
CursorTroughTabs:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, editor will allow cursor to be positioned inside tabs&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
DefFindOpt:font facename=default size=0x0.
.br
.br
'options'
:p.Default search options for :link reftype=hd res=13.Find:elink. command&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
DefFindReplaceOpt:font facename=default size=0x0.
.br
.br
'options'
:p.Default search/replace options for :link reftype=hd res=13.FindReplace:elink. command&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
SaveFolds:font facename=default size=0x0.
.br
.br
{0,1,2}
:p.If 0, folds are not saved&per. If 1, folds are saved at beginning of
line, if 2 folds are saved at end of line&per.
:p.Folds are saved as comments in source files, depending on active
editing mode&per.
:p. See mode settings CommentStart and
CommentEnd for configuration of fold
comments&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
CommentStart:font facename=default size=0x0.
.br
.br
"comment-start-string"
:p.String that starts comments (for saving folds)

.br
:font facename='Tms Rmn' size=18x10.
.br
CommentEnd:font facename=default size=0x0.
.br
.br
"comment-end-string"
:p.String that ends comments

.br
:font facename='Tms Rmn' size=18x10.
.br
AutoHilitParen:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to :hp2.1:ehp2., editor will automatically highlight the
matching bracket if it is visible on screen&per. This is equivalent
to executing :link reftype=hd res=13.HilitMatchBracket:elink. command&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
Abbreviations:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, abbreviation expansion will be
active in this mode&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
BackSpKillBlock:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, :link reftype=hd res=13.BackSpace:elink. command will
delete block if it is marked, otherwise it will delete the previous
character&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
DeleteKillBlock:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, :link reftype=hd res=13.Delete:elink. command will delete
block if marked, instead of deleting the character below cursor&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
PersistentBlocks:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, blocks will stay marked even if cursor
is moved in the file, if set to 0, block is unmarked as soon
as the cursor is moved&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
InsertKillBlock:font facename=default size=0x0.
.br
.br
{0,1}
:p.If set to 1, the marked block is deleted when a new character
is typed&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
FileNameRx:font facename=default size=0x0.
.br
.br
"regexp"
:p.Must be set to regexp that matches names of files that should
be edited in this mode&per. Has priority over FirstLineRx

.br
:font facename='Tms Rmn' size=18x10.
.br
FirstLineRx:font facename=default size=0x0.
.br
.br
"regexp"
:p.Must be set to regex that matches the first line of files that
should be edited in this mode&per. This is checked only if no
FileNameRx matches the filename&per.

.br
:font facename='Tms Rmn' size=18x10.
.br
RoutineRegexp:font facename=default size=0x0.
.br
.br
"regexp"
:p. Regular expression that matches function header&per.
:p. Used by editor commands&colon.
:link reftype=hd res=13.ListRoutines:elink.,
:link reftype=hd res=13.MoveFunctionPrev:elink.,
:link reftype=hd res=13.MoveFunctionNext:elink.,
:link reftype=hd res=13.BlockMarkFunction:elink.,
:link reftype=hd res=13.IndentFunction:elink.&per.

:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Loading files in various formats:font facename=default size=0x0.
.br
.br
:p.
Here are settings for loading files in various formats&colon.
:p.
:dl compact break=all.
:dt.DOS/Win/OS2/NT text files (CR/LF delimited)&colon.
:dd.
:cgraphic.
StripChar      13
          LineChar       10
          AddCR          1
          AddLF          1
:ecgraphic.
.br
:dt.Unix text files (LF delimited)&colon.
:dd.
:cgraphic.
StripChar      -1
          LineChar       10
          AddCR          0
          AddLF          1
:ecgraphic.
:dt.MAC text files (CR delimited)&colon.
:dd.
:cgraphic.
StripChar      -1
          LineChar       13
          AddCR          1
          AddLF          0
:ecgraphic.
:dt.Binary files (fixed record length)&colon.
:dd.
:cgraphic.
StripChar      -1
          LineChar       -1
          AddCR          0
          AddLF          0
          LoadMargin     64
          ForceNewLine   0
:ecgraphic.          
:edl.


:cgraphic.컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴:ecgraphic.
.br
.br
:font facename='Helv' size=20x12.
.br
Configuration of Tab options:font facename=default size=0x0.
.br
.br


.* Source filename: perftips.html
:h2 res=14.Performance Tips
:font facename=default size=0x0.
:p.
If you want to achieve top performance (necessary for 
some text editing tasks), here are some tips&colon.
:ul compact.
:li.Use PLAIN hilit mode
:li.Disable Tab Expansion
:li.Disable ShowMarkers
:li.Disable Undo
:li.Disable AutoHilitBracket
:li.Disable Abbreviations&per.
:eul.


.* Source filename: regexp.html
:h2 res=9.Regular Expressions
:font facename=default size=0x0.
:p.
Regular expressions are a way to specify text patterns when searching for
a text in a buffer&per. Regular expressions consist of normal characters
and special operator characters with a special meanings&per. Operators
allow you to anchor matches, match classes of characters, match given
pattern several times or match alternate patterns&per. Operators can be
also used to group patterns&per.
.br
:font facename='Helv' size=32x20.
.br
Search/Match Operators:font facename=default size=0x0.
.br
.br
:dl compact break=all.
:dt.:hp2.\:ehp2.
:dd.Quotes the following character&per. If the following character is not
alphanumeric, it will lost it's special meaning, otherwise it will
gain a special meaning as described below&per.
:dt.:hp2.\n:ehp2.
:dd.Matches a 0x0A (LF) character&per.
:dt.:hp2.\r:ehp2.
:dd.Matches a 0x0D (CR) character&per.
:dt.:hp2.\t:ehp2.
:dd.Matches a 0x09 (TAB) character&per.
:dt.:hp2.\e:ehp2.
:dd.Matches an escape character (0x1B)
:dt.:hp2.\s:ehp2.
:dd.Matches whitespace (CR, LF, TAB, SPACE) characters&per.
:dt.:hp2.\S:ehp2.
:dd.Matches non-whitespace (the reverse of \s)
:dt.:hp2.\w:ehp2.
:dd.Matches word character [a-zA-Z0-9]
:dt.:hp2.\W:ehp2.
:dd.Matches non-word character
:dt.:hp2.\d:ehp2.
:dd.Matches a digit [0-9]&per.
:dt.:hp2.\D:ehp2.
:dd.Matches a non-digit&per.
:dt.:hp2.\U:ehp2.
:dd.Matches uppercase characters (A-Z)
:dt.:hp2.\L:ehp2.
:dd.Matches lowercase characters (a-z)
:dt.:hp2.\x##:ehp2.
:dd.Matches specified hex value (\x0A, \x0D, \x09, etc&per.)
:dt.:hp2.\o###:ehp2.
:dd.Matches specified octal value (\o000, \o015, etc&per.)
:dt.:hp2.\N###:ehp2.
:dd.Matches specified decimal value (\N000, \N013, \N009, etc&per.)
:dt.:hp2.\C:ehp2.
:dd.Starts case sensitive matching&per.
:dt.:hp2.\c:ehp2.
:dd.Starts case insensitive matching&per.
:dt.:hp2.^:ehp2.
:dd.Match a beginning of line&per.
:dt.:hp2.$:ehp2.
:dd.Match an end of line&per.
:dt.:hp2.&per.:ehp2.
:dd.Match any character&per.
:dt.:hp2.<:ehp2.
:dd.Match beginning of word (word consists of [A-Za-z0-9])&per.
:dt.:hp2.>:ehp2.
:dd.Match end of word&per.
:dt.:hp2.[ ]:ehp2.
:dd.Specifies a class of characters ([abc123], [\]\x10], etc)&per.
:dt.:hp2.[ - ]:ehp2.
:dd.Specified a range of characters ([0-9a-zA-Z_], [0-9], etc)
:dt.:hp2.[^ ]:ehp2.
:dd.Specifies complement class ([^a-z], [^\-], etc)
:dt.:hp2.?:ehp2.
:dd.Matches preceeding pattern optionally (a?bc, filename\&per.?, $?, etc)
:dt.:hp2.|:ehp2.
:dd.Matches preceeding or next pattern (a|b, c|d, abc|d)&per. Only one
character will be used as pattern unless grouped together using {} or
()&per.
:dt.:hp2.*:ehp2.
:dd.Match zero or more occurances of preceeding pattern&per. Matching is
greedy and will match as much as possible&per.
:dt.:hp2.+:ehp2.
:dd.Match one or more occurances of preceeding pattern&per. Match is
greedy&per.
:dt.:hp2.@:ehp2.
:dd.Match zero or more occurances of preceeding pattern&per. Matching is
non-greedy and will match as little as possible without causing the
rest of the pattern match to fail&per.
:dt.:hp2.#:ehp2.
:dd.Match one or more occurances of preceeding pattern&per. Matching is
non-greedy&per.
:dt.:hp2.{ }:ehp2.
:dd.Group patterns together to form complex pattern&per. ( {abc},
{abc}|{cde}, {abc}?, {word}?)
:dt.:hp2.( ):ehp2.
:dd.Group patterns together to form complex pattern&per. Also used to save
the matched substring into the register which can be used for
substitution operation&per. Up to 9 registers can be used&per.
:edl.

.br
:font facename='Helv' size=32x20.
.br
Replacement Operators:font facename=default size=0x0.
.br
.br
:dl compact break=all.
:dt.:hp2.\:ehp2.
:dd.Causes the next character to lose it's special meaning&per.
:dt.:hp2.\n:ehp2.
:dd.Inserts a 0x0A (LF) character&per.
:dt.:hp2.\r:ehp2.
:dd.Inserts a 0x0D (CR) character&per.
:dt.:hp2.\t:ehp2.
:dd.Inserts a 0x09 (TAB) character&per.
:dt.:hp2.\1 to \9:ehp2.
:dd.Recalls stored substrings from registers (\1, \2, \3, to \9)&per.
:dt.:hp2.\0:ehp2.
:dd.Recalls entire matched pattern&per.
:dt.:hp2.\u:ehp2.
:dd.Convert next character to uppercase
:dt.:hp2.\l:ehp2.
:dd.Convert next character to lowercase
:dt.:hp2.\U:ehp2.
:dd.Convert to uppercase till \E or \e
:dt.:hp2.\L:ehp2.
:dd.Convert to lowercase till \E or \e
:edl.


.* Source filename: status.html
:h2 res=10.Status Line
:font facename=default size=0x0.
:p.
:p.Status line displays the following status information&colon.
:p.:hp2.position|flags|mode|curchar|mod? filename|winno:ehp2.
:p.:hp2.position:ehp2. = line&colon.column
:p.:hp2.flags:ehp2.
:dl compact break=all.
:dt.I
:dd.Insert
:dt.A
:dd.Autoindent
:dt.C
:dd.Matches are case sensitive
:dt.SLC
:dd.Stream, Line, Column block-mode
:dt.wW
:dd.Automatic word wrap active (w = line, W = paragraph)&per.
:edl.

:p.:hp2.mode:ehp2.      = Mode name as specified in configuration file
:p.:hp2.curchar:ehp2.   = Decimal ASCII code of character under cursor, or EOL/EOF
:p.:hp2.mod?:ehp2.      = :hp2.*:ehp2. if file was modified, :hp2.%:ehp2. if file is read-only

:h1.External links
:font facename=default size=0x0.
:p.This chapter contains all external links referenced in this book -
either link is an Unified Resource Locator (URL) or simply to a
local file which is not a part of this book.
:h2 res=15.http&colon.//svn.netlabs.org/efte
:p.:lines align=center.
The link you selected points to an external resource&per. 
.br
Click the URL below to launch your default web browser
:font facename='System VIO' size=24x14.
http&colon.//svn.netlabs.org/efte.
:elines.
:h2 res=16.mailto&colon.ygk@qwest.net
:p.:lines align=center.
The link you selected points to an external resource&per. 
.br
Click the URL below to launch your default mail program
:font facename='System VIO' size=24x14.
mailto&colon.ygk@qwest.net.
:elines.
:euserdoc.
