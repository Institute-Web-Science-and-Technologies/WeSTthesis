#LaTeX document class for bachelor and master theses written at the Institute for Web Science and Technologies
The document class "WeSTthesis.cls" is based on "cgBA.cls" which was provided by the [Research Group Mueller](http://www.uni-koblenz-landau.de/koblenz/fb4/institute/icv/agmueller). It is oriented at the style guides provided by the examination board of the [Faculty of Computer Science](http://www.uni-koblenz-landau.de/campus-koblenz/fb4) at the [University of Koblenz-Landau](http://www.uni-koblenz-landau.de/). The document class provides a cover sheet template, a statement on source usage and publication, and some basic text formatting. The file [example.tex](example.tex) contains some of the most important LaTeX packages for writing a bachelor or master thesis.

#Usage
The following command is used to include the document class in the .tex document.

    \documentclass[<options>]{WeSTthesis}

The following options are supported:

- f|m|fm          - gender used in the title: female, male, or both (required)
- bachelor|master - bachelor or master thesis (required)
- group           - prints two statements after the cover page (optional)
- times|palatino	- used font (only one can be applied at the same time, the default font is "Computer Modern") (optional)
- twoside         - layout for two-sided print (optional)
- binding         - adds 8mm on the left/right side for binding (optional)
- frames          - prints additional frames to check the document layout (optional)

If the option `twoside` is activated, there are blank pages inserted after the cover page and its following statement(s).

The following commands are used to format the cover sheet template. They are used before `\begin{document}`.

    \title{thesis title}
    \author{author(s) name(s)}

    \degreecourse{degree course}

    \firstreviewer{Name of the first reviewer (incl. academic title)}
    \firstreviewerinfo{institute/research group}

    \secondreviewer{Name of the second reviewer (incl. academic title)}
    \secondreveiwerinfo{insititute/research group or external institution}

The following commands are used after the `\begin{document}` statement.

    \maketitle  % prints the cover page and a statement about used sources and publication

	  \selectlanguage{english}  % optional: change document language from ngerman to english

    \varclearpage  % \cleardoublepage if twoside is set and \clearpage if not (useful for switching between two-side and single-side)

#Example
For an example see [example.tex](example.tex). The output should look like [example.pdf](example.pdf).

