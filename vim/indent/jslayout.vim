" Vim indent file for jslayout.
" Maintainer:   Bram Moolenaar
" Last Change:  2014 Jul 04
"
" This file is Vim script only and attempts to indent the same way as jslfmt
" does.  It depends on the HTML indent script to do most of the work.
" jslayout specific indenting is done here.
"
" There is also template/prototemplate/tools/vim/indent/jslayout.vim.  That
" one uses Python and is rather aggressive.

" Bail out if an indent script was loaded earlier.
if exists("b:did_indent")
  finish
endif

" Use the HTML indenter as a base.  Set variables to make it behave mostly
" like to jslfmt.
let b:html_indent_inctags = 'jsl'
let b:html_indent_style1 = 'inc'
let b:html_indent_script1 = 'inc'
let b:html_indent_string_names = ['jslayoutVariableListValue', 'jslayoutVariableName', 'jslayoutExpr']
" let b:html_indent_tag_names = []

" We rely on syntax highlighting to figure out the basic structure.  But
" don't use the official comment style, they show up wrong.
let g:html_wrong_comments = 1

if !exists("*s:InitJslayoutIndent") || exists('g:force_reload_jslayout')
  func! s:InitJslayoutIndent()
    " Define a jslayout-specific function for indenting inside tag attribute
    " strings.  Can only be done after defining the function.
    let b:html_indent_tag_string_func = function('s:InsideTagString')
  endfunc
endif

" Max number of lines to search for an item that causes tags before it not to
" be indented.  There can be a long <style> section.
let b:html_indent_line_limit = 400

" Loading html.vim also sets b:did_indent.  Do not use ":runtime", the
" Google-filetypes plugin has an empty html indenter :-(.
let s:fname = glob("<sfile>:p:h/html.vim")
if s:fname != ''
  exe 'source ' . s:fname
else
  source $VIMRUNTIME/indent/html.vim
endif

" overrule the html indenting with ours
setlocal indentexpr=JslayoutIndent()

" less aggressive reindenting
setlocal indentkeys=o,O,<Return>,<>>,}

" use b;undo_indent from html indent

" Load the following only once, unless forced.
if exists("*JslayoutIndent") && !exists('g:force_reload_jslayout')
  call s:InitJslayoutIndent()
  finish
endif

func! JslayoutIndent()
  let indent = HtmlIndent()
  let curtext = getline(v:lnum)

  " Apply jslayout specific rules.  But not when we are inside a comment, it's
  " possible to commment-out any HTML, thus check this first.  Start of a
  " comment does need checking.
  if synIDattr(synID(v:lnum, 1, 1), 'name') =~ 'htmlComment'
        \ && curtext !~ '^ *<!--'
    return indent
  endif

  " Below there is no rule to increase indent, so bail out if it can't get
  " lower.
  if indent == 0
    return 0
  endif

  " Pass the result of the outermost check around, it's expensive.
  " -1 means not checked yet, 0 means not outermost, 1 means outermost tag
  let outermost = [-1]

  " <body, <head and <html do not have indent and the outermost "jstemplate"
  " has no indent.
  if s:NoIndentItem(v:lnum, outermost)
    return 0
  endif

  " </body, </head and </html also don't have indent.
  if curtext =~ '^\s*</\(body\|head\|html\)'
    return 0
  endif

  " Above items that have no indent, toplevel tags are not indented.
  " However, tags inside the toplevel tags are indented, thus we need to
  " figure out where we are.
  let idx = matchend(getline(v:lnum), '^ *<\ze\(!--\|\w\)')
  if idx > 0
    " First see if an item without indent may be following.
    call cursor(v:lnum, 1)
    let endlnum = search('^\s*<\(html\|head\|body\)\| jstemplate=', 'W', v:lnum + b:html_indent_line_limit)
echomsg 'endlnum: ' endlnum
    if endlnum > 0
      let lnum = v:lnum
      while 1
        " place the cursor on the "<", find the matching end.
        call cursor(lnum, idx)
        call HtmlIndent_FindTagEnd()
        if line('.') == lnum && col('.') == idx
          " can't find the end, bail out
echomsg 'cant find the end'
          break
        endif

        " search for a following start or end tag
        let lnum = search('<[/a-zA-Z0-9]', 'W')
        if lnum == 0
          " can't find another tag start or end, bail out
          break
        endif
        if lnum > endlnum
          " skipped over the end?  Probably endlnum was in a nested tag, do
          " use indent.
          return indent
        endif
        let col = col('.')
        if s:NoIndentItem(lnum, outermost)  " may move the cursor!
          " found what we were looking for
          return 0
        endif
        let text = getline(lnum)
        if text[col] == '/'
          " found a closing tag, so we are inside another tag, can't have
          " zero indent.
          break
        endif

        " nothing interesting, continue skipping over this tag
        let idx = col
      endwhile

    endif
  endif

  " Ugly style: <head> at the end of the previous line: Tag at start of
  " current line gets one shiftwidt.
  if curtext =~ '^\s*<'
    let text = getline(v:lnum - 1)
    if text =~ '<\(body\|head\|html\)'
      return shiftwidth()
    endif
  endif


  return indent
endfunc

" Return 1 if "lnum" is an item that has no indent.
" These are <body>, <head> and <html> tags, and a tag with a jstemplate
" attribute.
func! s:NoIndentItem(lnum, outermost)
  let text = getline(a:lnum)
  if text =~ '^\s*<\(body\|head\|html\)'
    return 1
  endif

  " The outermost tag with a "jstemplate" attribute has no indent.
  let idx = matchend(text, '^ *<\ze\w')
  if idx > 0
    call cursor(a:lnum, idx + 2)
    " Find the matching tag end >.
    let endlnum = search('\S>', 'W', a:lnum + b:html_indent_line_limit)
    if endlnum > 0
      call cursor(a:lnum, 1)
      if search(' jstemplate=', '', endlnum) > 0
        if a:outermost[0] < 0
          " Check that this is an outermost tag, starting at the current line.
          call cursor(v:lnum, 1)
          while 1
            let prevtaglnum = search('<\([!/]\|\w\)', 'bW', max([v:lnum - 50, 1]))
            if prevtaglnum <= 0
              let a:outermost[0] = 1
              break
            else
              let tagname = matchstr(getline('.')[col('.'):], '/\=\w\+')
              if match(tagname, 'body\|html\|head') >= 0
                    \ || getline('.') =~ ' jsimport='
                let a:outermost[0] = 1
                break
              endif
              if tagname[0] != '/' && HtmlIndent_IsOpenTag(tagname)
                " unmatched start tag, we are not outermost
                let a:outermost[0] = 0
                break
              endif
              if tagname[0] == '/'
                " skip back to matching start tag
                if HtmlIndent_FindStartTag() == 0
                  " can't find it, guess we are at the toplevel
                  let a:outermost[0] = 1
                  break
                endif
              endif
            endif
          endwhile
        endif
        return a:outermost[0]
      endif
    endif
  endif
  return 0
endfunc

" Assuming to be inside a string in a tag, return the indent.
" This function is given to the HTML indenter.
func! s:InsideTagString(lnum)
  let lnum = a:lnum
  if exists('*shiftwidth')
    let shiftwidth = shiftwidth()
  else
    let shiftwidth = &shiftwidth
  endif

  " If the previous line has an unmatched "(" or "{" add indent.
  let text = getline(lnum)
  if stridx(text, "(") >= 0 || stridx(text, "{") >= 0
    let brace_counts = HtmlIndent_CountBraces(lnum)
    if brace_counts.p_open > 0 || brace_counts.c_open > 0
      " Yes, found unmatched "(" or "{".
      let mend = matchend(text, '^\s*\(<\w\+ \+\)\=\w\+="')
      if mend > 0
        " Found the start of the attribute " <tag foo=" or " foo=",
        " align with that.
        return mend + shiftwidth
      endif
      return indent(lnum) + shiftwidth
    endif
  endif

  " Some template systems use "key: value" pairs. If it looks like
  " the current line starts with "key:" align with a previous line
  " that starts with "key:".
  let key_pattern = '[_a-zA-Z0-9-]\+\(:\| if\)\( \|$\)'
  if getline(v:lnum) =~ '^\s*' . key_pattern
    while lnum >= 1
      let text = getline(lnum)
      let [lnum, text] = s:SkipParens(lnum, text)
      if text =~ '^\s*' . key_pattern
        " Found another "key: value" pair, align with it.
        return indent(lnum)
      endif
      let mend = matchend(text, '^\s*\(<\w\+ \+\)\=\w\+="')
      if mend > 0
        " Found the start of the attribute " <tag foo=" or " foo=".
        return mend
      endif
      if text =~ '^\s*<\w'
        " Found start of the tag, bail out.
        break
      endif
      let lnum -= 1
    endwhile
  endif

  " Find out if the current line is a continuation of the previous line.
  " Detected by the current line starting with the ":" of "a ? b : c", or
  " the previous line not being finished.
  let curtext = getline(v:lnum)
  let prev_lnum = v:lnum - 1
  let prev_text = getline(prev_lnum)
  let extra = 0
  let continuation_pat = '^\s*[:+] '
  let cur_continuation = curtext =~ continuation_pat
  let prev_continuation = prev_text =~ continuation_pat
  let prev_unfinished = s:Unfinished(prev_text)
  let prev_unfinishedMore = s:UnfinishedMore(prev_text)
  let prev_unfinishedNoMore = s:UnfinishedNoMore(prev_text)
  if prev_unfinished || cur_continuation
    " Previous line is unfinished or the current line is a continuation
    " line, probably need to add a shiftwidth.
    let extra = shiftwidth
  endif

  " Skip back over matched parens to find the line to align with.
  let [align_lnum, text] = s:SkipParens(prev_lnum, prev_text)

  " TODO: This assumes there is one attribute per line.
  let attrEnd = matchend(text, '^\s*\(<\w\+ \+\)\=\w\+="')
  if attrEnd >= 0
    " Found start of attribute in the form of " attr=" or
    " "  <div asdf=", align with the character after the first double
    " quote.
    return attrEnd + extra
  endif

  " Check the end of the previous line and the one before that to decide
  " what indent to use for the current line, relative to the alignment line
  " (align_lnum).  First some specific situations.
  let align_prev_text = getline(align_lnum - 1)
  if cur_continuation && text =~ continuation_pat
    "    : something
    "    : no extra indent here
    let extra = 0
  elseif cur_continuation && align_prev_text =~ '\s?\s*$'
    "    something ?
    "      something
    "    : negative indent here
    let extra = -shiftwidth
  elseif align_prev_text =~ ',\s*$' && prev_text =~ '\<\w\+:\s*$'
    "    something,
    "    .*key:
    "      extra indent here
    let extra = shiftwidth
  elseif align_prev_text =~ '^\s*\w\+:\s*$' && prev_text =~ '\s?\s*$'
    "    key:
    "      something ?
    "      no extra indent here
    let extra = 0
  elseif align_prev_text =~ '^\s*\w\+:\s*$' && prev_text =~ '\(||\|&&\)\s*$'
    "    key:
    "      something ||
    "        extra indent here
    let extra = shiftwidth
  elseif align_prev_text =~ '\(||\|&&\)\s*$' && prev_text =~ '\s?\s*$'
    "    something ||
    "      something ?
    "    negative indent here
    let extra = -shiftwidth
  elseif align_lnum > 2 && (!prev_unfinishedMore
          \ || (prev_unfinishedNoMore && s:UnfinishedNoMore(align_prev_text)))
          \ && (s:Unfinished(align_prev_text) || prev_continuation)
    " Must be another continuation line, align with it.  Do not add extra
    " indent if the line before it is also an unfinished line.
    " Reduce indent if it ends in "!=", "==", etc., but not for two lines in
    " a row.
    if (prev_unfinished || cur_continuation)
          \ && !(!prev_unfinishedMore && s:UnfinishedMore(align_prev_text))
      let extra = 0
    else
      if !prev_unfinished && s:UnfinishedMore(align_prev_text)
        " finished line below line ending in "==" or "!=", must go another
        " step back
        let extra = 2 * -shiftwidth
      else
        let extra = -shiftwidth
      endif
    endif
  endif

  let indent = indent(align_lnum) + extra

  " Don't use indent less than the key=" line
  call cursor(v:lnum, 1)
  if search('^\s*\(<\w\+\s\+\)\=\w\+="', 'bW') > 0
    let attrEnd = matchend(getline('.'), '^\s*\(<\w\+\s\+\)\=\w\+="')
    if indent < attrEnd
      let indent = attrEnd
    endif
  endif
  return indent
endfunc

" Skip backwards over ().  Returns possibly updated lnum and text.
func! s:SkipParens(lnum, text)
  let matchidx = match(a:text, '[^(])[^)]*$')
  if matchidx >= 0
    " The previous line ends in ')' or ');', move back to the starting '('
    call cursor(a:lnum, matchidx - 1)
    let matchlnum = searchpair('(', '', ')', 'bW')
    if matchlnum > 0
      return [matchlnum, getline(matchlnum)]
    endif
  endif
  return [a:lnum, a:text]
endfunc

" Return non-zero if "text" is an unfinished line.
func! s:Unfinished(text)
  return a:text =~ '\(\<if\| [><+-]\| ||\| &&\| !=\| ==\|[(?:,]\)$'
endfunc

" Return non-zero if "text" is an unfinished line, where two consecutive
" unfinished lines are also indented more, e.g. ending in "==".
func! s:UnfinishedMore(text)
  return a:text =~ '\( !=\| ==\| [?:]\)$'
endfunc

" Return non-zero when making an exception to indenting more for two
" consecutive lines: Trinary operator.
func! s:UnfinishedNoMore(text)
  return a:text =~ ' [?:]$'
endfunc

" Now we can use the s:InsideTagString function.
call s:InitJslayoutIndent()

" vim: sw=2 tw=78
