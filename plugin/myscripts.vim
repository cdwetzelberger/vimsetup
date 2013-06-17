
function! CDWXSLTElementConverterFunction()
    "silent!  %s/<xs:element\s\+(?:name|ref)="\(\w\+\)".*/out += "\\n  <\1>#{xmlenc(item.\1)}<\/\1>" if item.\1 != nil /
     %s/<xs:element\s\+\(name\|ref\)="\(\w\+\)".*/out += "\\n  <\2>#{xmlenc(item.\2)}<\/\2>" if item.\2 != nil /
endfunction

command! CDWXSLTtoString call CDWXSLTElementConverterFunction()

function! CDWXSLTConverterFunction()
    silent!  %s/<xs:element\s\+name="\(\w\+\)".*/<\1>string<\/\1>/
endfunction

command! CDWXSLTtoXML call CDWXSLTConverterFunction()

function! CDWMongoToXSDConverterFunction()
      %s/field\s\+:\(\w\+\),\s\+type:\s\+\(\w\+\).*$/<xs:element name="\1" type="\2" \/>/gc
endfunction
command! CDWMongoToXSDConverter call CDWMongoToXSDConverterFunction()

" This is a comment.
function! CDWCleanUpFunction()
  silent! %s/^<\w\+>/\1/g
  silent! %s/^<\w\+>.*/\1/g
  silent! %s/^\(<\w\+>\).*/\1/g
  silent! % !sort -u
endfunction

function! CDWCleanUpFunction2()
  silent! %s/^<\w\+>/\1/g
  silent! %s/^<\w\+>.*/\1/g
  silent! %s/^\(<\w\+>\).*/\1/g
  silent! % !sort -u
endfunction

function! CDWSayHiFunction()
   echom "Hi, Craig"
   echom "Here is some more text"
   echom "even more text."
endfunction

function! CDWAlignAssignmentsFunction ()
    "Patterns needed to locate assignment operators...
    let ASSIGN_OP   = '[-+*/%|&]\?=\@<!=[=~]\@!'
    let ASSIGN_LINE = '^\(.\{-}\)\s*\(' . ASSIGN_OP . '\)'

    "Locate block of code to be considered (same indentation, no blanks)
    let indent_pat = '^' . matchstr(getline('.'), '^\s*') . '\S'
    let firstline  = search('^\%('. indent_pat . '\)\@!','bnW') + 1
    let lastline   = search('^\%('. indent_pat . '\)\@!', 'nW') - 1
    if lastline < 0
        let lastline = line('$')
    endif

    "Find the column at which the operators should be aligned...
    let max_align_col = 0
    let max_op_width  = 0
    for linetext in getline(firstline, lastline)
        "Does this line have an assignment in it?
        let left_width = match(linetext, '\s*' . ASSIGN_OP)

        "If so, track the maximal assignment column and operator width...
        if left_width >= 0
            let max_align_col = max([max_align_col, left_width])

            let op_width      = strlen(matchstr(linetext, ASSIGN_OP))
            let max_op_width  = max([max_op_width, op_width+1])
         endif
    endfor

    "Code needed to reformat lines so as to align operators...
    let FORMATTER = '\=printf("%-*s%*s", max_align_col, submatch(1),
    \                                    max_op_width,  submatch(2))'

    " Reformat lines with operators aligned in the appropriate column...
    for linenum in range(firstline, lastline)
        let oldline = getline(linenum)
        let newline = substitute(oldline, ASSIGN_LINE, FORMATTER, "")
        call setline(linenum, newline)
    endfor
endfunction

command! CDWCleanUp call CDWCleanUpFunction()
command! CDWCleanUp2 call CDWCleanUpFunction()
command! CDWAlignAssignments call CDWAlignAssignmentsFunction()


