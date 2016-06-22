#LaTeX document class for seminar papers, proposals, bachelor's theses, and master's theses written at the Institute for Web Science and Technologies
The document class "WeSTthesis.cls" is based on "cgBA.cls" which was provided by the [Research Group Mueller](http://www.uni-koblenz-landau.de/koblenz/fb4/institute/icv/agmueller). It is oriented at the style guides provided by the examination board of the [Faculty of Computer Science](http://www.uni-koblenz-landau.de/campus-koblenz/fb4) at the [University of Koblenz-Landau](http://www.uni-koblenz-landau.de/). The document class provides a cover page template, a statement on source usage and publication, and some basic text formatting. The file [example.tex](example.tex) contains a template for creating documents using this document class.

##Usage
The following command is used to include the document class in the .tex document.

    \documentclass[<options>]{WeSTthesis}

The following options are supported:

- `f|m|fm`                            - gender used in the title: female, male, or both (required)
- `seminar|proposal|bachelor|master`  - seminar paper, proposal, bachelor's thesis, or master's thesis (required)
- `scrreprt`                          - use the scrreprt documentclass (optional, default: article class)
- `group`                             - prints two statements after the cover page (optional, default: one statement)
- `date`                              - prints the exact date (optional, default: month and year)
- `times|palatino`	                  - used font (optional, default: Computer Modern)
- `twoside`                           - layout for two-sided print (optional, default: one-sided)
- `binding`                           - adds 8mm on the left/right side for binding (optional, default: no binding)
- `codegpl`                           - lists in the that the source code is available via a GNU General Public License (optional, default: CC license)
- `frames`                            - prints additional frames to check the document layout (optional, default: no frames)

If the option `twoside` is activated, there are blank pages inserted after the cover page and its following statement(s).

The following commands are used to format the cover page. They are used before `\begin{document}`.

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

    \varclearpage  % \cleardoublepage if twoside is set and the current page number is odd. \clearpage otherwise (useful for switching between two-side and single-side layout)


##Example
For an example see [example.tex](example.tex). The output should look like [example.pdf](example.pdf).

##Additional tips
You can add the WeSTthesis folder to `~/texmf/tex/latex/` to make WeSTthesis globally available on Linux systems.
