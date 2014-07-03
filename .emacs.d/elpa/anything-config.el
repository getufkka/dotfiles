<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: anything-config.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=anything-config.el" /><link type="text/css" rel="stylesheet" href="/css/emacs.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: anything-config.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything-config.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for anything-config.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything-config.el" />
<script type="text/javascript" src="/outliner.0.5.0.62-toc.js"></script>
<script type="text/javascript">

  function addOnloadEvent(fnc) {
    if ( typeof window.addEventListener != "undefined" )
      window.addEventListener( "load", fnc, false );
    else if ( typeof window.attachEvent != "undefined" ) {
      window.attachEvent( "onload", fnc );
    }
    else {
      if ( window.onload != null ) {
	var oldOnload = window.onload;
	window.onload = function ( e ) {
	  oldOnload( e );
	  window[fnc]();
	};
      }
      else
	window.onload = fnc;
    }
  }

  var initToc=function() {

    var outline = HTML5Outline(document.body);
    if (outline.sections.length == 1) {
      outline.sections = outline.sections[0].sections;
    }

    if (outline.sections.length > 1
	|| outline.sections.length == 1
           && outline.sections[0].sections.length > 0) {

      var toc = document.getElementById('toc');

      if (!toc) {
	var divs = document.getElementsByTagName('div');
	for (var i = 0; i < divs.length; i++) {
	  if (divs[i].getAttribute('class') == 'toc') {
	    toc = divs[i];
	    break;
	  }
	}
      }

      if (!toc) {
	var h2 = document.getElementsByTagName('h2')[0];
	if (h2) {
	  toc = document.createElement('div');
	  toc.setAttribute('class', 'toc');
	  h2.parentNode.insertBefore(toc, h2);
	}
      }

      if (toc) {
        var html = outline.asHTML(true);
        toc.innerHTML = html;
      }
    }
  }

  addOnloadEvent(initToc);
  </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22anything-config.el%22">anything-config.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/anything-config.el">Download</a></p><pre class="code"><span class="linecomment">;;; anything-config.el --- Applications libary for `anything.el'</span>

<span class="linecomment">;; Filename: anything-config.el</span>

<span class="linecomment">;; Description: Applications libary for `anything.el'</span>

<span class="linecomment">;; Author: Tassilo Horn &lt;tassilo@member.fsf.org&gt;</span>

<span class="linecomment">;; Maintainer: Tassilo Horn &lt;tassilo@member.fsf.org&gt;</span>
<span class="linecomment">;;             rubikitch    &lt;rubikitch@ruby-lang.org&gt;</span>
<span class="linecomment">;;             Thierry Volpiatto &lt;thierry.volpiatto@gmail.com&gt;</span>
<span class="linecomment">;; Copyright (C) 2007 ~ 2011, Tassilo Horn, all rights reserved.</span>
<span class="linecomment">;; Copyright (C) 2009, Andy Stewart, all rights reserved.</span>
<span class="linecomment">;; Copyright (C) 2009 ~ 2012, rubikitch, all rights reserved.</span>
<span class="linecomment">;; Copyright (C) 2009 ~ 2012, Thierry Volpiatto, all rights reserved.</span>

<span class="linecomment">;; Created: 2009-02-16 21:38:23</span>

<span class="linecomment">;; X-URL: &lt;http://repo.or.cz/w/anything-config.git&gt;</span>

<span class="linecomment">;; MailingList: &lt;https://groups.google.com/group/emacs-anything?hl=en&gt;</span>

<span class="linecomment">;; Keywords: anything, anything-config</span>

<span class="linecomment">;; Compatibility: GNU Emacs 22 ~ 24</span>

<span class="linecomment">;; Dependencies: `anything.el', `anything-match-plugin.el'.</span>

<span class="linecomment">;;; This file is NOT part of GNU Emacs</span>

<span class="linecomment">;;; License</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This program is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 3, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This program is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with this program; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth</span>
<span class="linecomment">;; Floor, Boston, MA 02110-1301, USA.</span>

<span class="linecomment">;;; Commentary:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Predefined configurations for `anything.el'</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; For quick start, try `anything-for-files' to open files.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; To configure anything you should define anything command</span>
<span class="linecomment">;; with your favorite sources, like below:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (defun my-anything ()</span>
<span class="linecomment">;;   (interactive)</span>
<span class="linecomment">;;   (anything-other-buffer</span>
<span class="linecomment">;;    '(anything-c-source-buffers</span>
<span class="linecomment">;;      anything-c-source-file-name-history</span>
<span class="linecomment">;;      anything-c-source-info-pages</span>
<span class="linecomment">;;      anything-c-source-info-elisp</span>
<span class="linecomment">;;      anything-c-source-man-pages</span>
<span class="linecomment">;;      anything-c-source-locate</span>
<span class="linecomment">;;      anything-c-source-emacs-commands)</span>
<span class="linecomment">;;    " *my-anything*"))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Then type M-x my-anything to use sources.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Defining own command is better than setup `anything-sources'</span>
<span class="linecomment">;; directly, because you can define multiple anything commands with</span>
<span class="linecomment">;; different sources. Each anything command should have own anything</span>
<span class="linecomment">;; buffer, because M-x anything-resume revives anything command.</span>

<span class="linecomment">;; NOTE: What you find on Emacswiki is mostly deprecated and not maintained,</span>
<span class="linecomment">;;       don't complain if you use such code or configuration and something</span>
<span class="linecomment">;;       doesn't work.</span>

 
<span class="linecomment">;;; Autodoc documentation:</span>
<span class="linecomment">;;  ---------------------</span>

<span class="linecomment">;;  * Commands defined here are:</span>
<span class="linecomment">;; [EVAL] (autodoc-document-lisp-buffer :type 'command :prefix "anything-" :docstring t)</span>
<span class="linecomment">;; `anything-configuration'</span>
<span class="linecomment">;; Customize `anything'.</span>
<span class="linecomment">;; `anything-c-buffer-help'</span>
<span class="linecomment">;; Help command for anything buffers.</span>
<span class="linecomment">;; `anything-ff-help'</span>
<span class="linecomment">;; Help command for `anything-find-files'.</span>
<span class="linecomment">;; `anything-read-file-name-help'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-generic-file-help'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-grep-help'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-pdfgrep-help'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-etags-help'</span>
<span class="linecomment">;; The help function for etags.</span>
<span class="linecomment">;; `anything-c-ucs-help'</span>
<span class="linecomment">;; Help command for `anything-ucs'.</span>
<span class="linecomment">;; `anything-c-bookmark-help'</span>
<span class="linecomment">;; Help command for bookmarks.</span>
<span class="linecomment">;; `anything-show-this-source-only'</span>
<span class="linecomment">;; Show all candidates of this source.</span>
<span class="linecomment">;; `anything-test-sources'</span>
<span class="linecomment">;; List all anything sources for test.</span>
<span class="linecomment">;; `anything-select-source'</span>
<span class="linecomment">;; [OBSOLETE] Select source.</span>
<span class="linecomment">;; `anything-insert-buffer-name'</span>
<span class="linecomment">;; Insert buffer name.</span>
<span class="linecomment">;; `anything-quit-and-find-file'</span>
<span class="linecomment">;; Drop into `anything-find-files' from `anything'.</span>
<span class="linecomment">;; `anything-mark-all'</span>
<span class="linecomment">;; Mark all visible unmarked candidates in current source.</span>
<span class="linecomment">;; `anything-unmark-all'</span>
<span class="linecomment">;; Unmark all candidates in all sources of current anything session.</span>
<span class="linecomment">;; `anything-toggle-all-marks'</span>
<span class="linecomment">;; Toggle all marks.</span>
<span class="linecomment">;; `anything-buffer-diff-persistent'</span>
<span class="linecomment">;; Toggle diff buffer without quitting anything.</span>
<span class="linecomment">;; `anything-buffer-revert-persistent'</span>
<span class="linecomment">;; Revert buffer without quitting anything.</span>
<span class="linecomment">;; `anything-buffer-save-persistent'</span>
<span class="linecomment">;; Save buffer without quitting anything.</span>
<span class="linecomment">;; `anything-buffer-run-kill-buffers'</span>
<span class="linecomment">;; Run kill buffer action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-run-grep'</span>
<span class="linecomment">;; Run Grep action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-run-zgrep'</span>
<span class="linecomment">;; Run Grep action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-run-query-replace-regexp'</span>
<span class="linecomment">;; Run Query replace regexp action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-run-query-replace'</span>
<span class="linecomment">;; Run Query replace action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-switch-other-window'</span>
<span class="linecomment">;; Run switch to other window action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-switch-other-frame'</span>
<span class="linecomment">;; Run switch to other frame action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-switch-to-elscreen'</span>
<span class="linecomment">;; Run switch to elscreen  action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-run-ediff'</span>
<span class="linecomment">;; Run ediff action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-buffer-run-ediff-merge'</span>
<span class="linecomment">;; Run ediff action from `anything-c-source-buffers-list'.</span>
<span class="linecomment">;; `anything-ff-run-toggle-auto-update'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-ff-run-switch-to-history'</span>
<span class="linecomment">;; Run Switch to history action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-grep'</span>
<span class="linecomment">;; Run Grep action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-pdfgrep'</span>
<span class="linecomment">;; Run Pdfgrep action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-zgrep'</span>
<span class="linecomment">;; Run Grep action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-copy-file'</span>
<span class="linecomment">;; Run Copy file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-rename-file'</span>
<span class="linecomment">;; Run Rename file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-byte-compile-file'</span>
<span class="linecomment">;; Run Byte compile file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-load-file'</span>
<span class="linecomment">;; Run Load file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-eshell-command-on-file'</span>
<span class="linecomment">;; Run eshell command on file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-ediff-file'</span>
<span class="linecomment">;; Run Ediff file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-ediff-merge-file'</span>
<span class="linecomment">;; Run Ediff merge file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-symlink-file'</span>
<span class="linecomment">;; Run Symlink file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-hardlink-file'</span>
<span class="linecomment">;; Run Hardlink file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-delete-file'</span>
<span class="linecomment">;; Run Delete file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-complete-fn-at-point'</span>
<span class="linecomment">;; Run complete file name action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-switch-to-eshell'</span>
<span class="linecomment">;; Run switch to eshell action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-switch-other-window'</span>
<span class="linecomment">;; Run switch to other window action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-switch-other-frame'</span>
<span class="linecomment">;; Run switch to other frame action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-open-file-externally'</span>
<span class="linecomment">;; Run open file externally command action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-locate'</span>
<span class="linecomment">;; Run locate action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-gnus-attach-files'</span>
<span class="linecomment">;; Run gnus attach files command action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-etags'</span>
<span class="linecomment">;; Run Etags command action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-print-file'</span>
<span class="linecomment">;; Run Print file action from `anything-c-source-find-files'.</span>
<span class="linecomment">;; `anything-ff-run-toggle-basename'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-find-files-down-one-level'</span>
<span class="linecomment">;; Go down one level like unix command `cd ..'.</span>
<span class="linecomment">;; `anything-ff-properties-persistent'</span>
<span class="linecomment">;; Show properties without quitting anything.</span>
<span class="linecomment">;; `anything-ff-persistent-delete'</span>
<span class="linecomment">;; Delete current candidate without quitting.</span>
<span class="linecomment">;; `anything-ff-run-kill-buffer-persistent'</span>
<span class="linecomment">;; Execute `anything-ff-kill-buffer-fname' whitout quitting.</span>
<span class="linecomment">;; `anything-ff-rotate-left-persistent'</span>
<span class="linecomment">;; Rotate image left without quitting anything.</span>
<span class="linecomment">;; `anything-ff-rotate-right-persistent'</span>
<span class="linecomment">;; Rotate image right without quitting anything.</span>
<span class="linecomment">;; `anything-c-goto-precedent-file'</span>
<span class="linecomment">;; Go to precedent file in anything grep/etags buffers.</span>
<span class="linecomment">;; `anything-c-goto-next-file'</span>
<span class="linecomment">;; Go to precedent file in anything grep/etags buffers.</span>
<span class="linecomment">;; `anything-c-grep-run-persistent-action'</span>
<span class="linecomment">;; Run grep persistent action from `anything-do-grep-1'.</span>
<span class="linecomment">;; `anything-c-grep-run-default-action'</span>
<span class="linecomment">;; Run grep default action from `anything-do-grep-1'.</span>
<span class="linecomment">;; `anything-c-grep-run-other-window-action'</span>
<span class="linecomment">;; Run grep goto other window action from `anything-do-grep-1'.</span>
<span class="linecomment">;; `anything-c-grep-run-save-buffer'</span>
<span class="linecomment">;; Run grep save results action from `anything-do-grep-1'.</span>
<span class="linecomment">;; `anything-yank-text-at-point'</span>
<span class="linecomment">;; Yank text at point in minibuffer.</span>
<span class="linecomment">;; `anything-c-bookmark-run-jump-other-window'</span>
<span class="linecomment">;; Jump to bookmark from keyboard.</span>
<span class="linecomment">;; `anything-c-bookmark-run-delete'</span>
<span class="linecomment">;; Delete bookmark from keyboard.</span>
<span class="linecomment">;; `anything-c-bmkext-run-edit'</span>
<span class="linecomment">;; Run `bmkext-edit-bookmark' from keyboard.</span>
<span class="linecomment">;; `anything-yaoddmuse-cache-pages'</span>
<span class="linecomment">;; Fetch the list of files on emacswiki and create cache file.</span>
<span class="linecomment">;; `anything-eval-new-line-and-indent'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-call-source-from-anything'</span>
<span class="linecomment">;; Call anything source within `anything' session.</span>
<span class="linecomment">;; `anything-create-from-anything'</span>
<span class="linecomment">;; Run `anything-create' from `anything' as a fallback.</span>
<span class="linecomment">;; `anything-c-ucs-persistent-insert'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-c-ucs-persistent-forward'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-c-ucs-persistent-backward'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-c-ucs-persistent-delete'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-lisp-completion-at-point'</span>
<span class="linecomment">;; Anything lisp symbol completion at point.</span>
<span class="linecomment">;; `anything-c-complete-file-name-at-point'</span>
<span class="linecomment">;; Complete file name at point.</span>
<span class="linecomment">;; `anything-lisp-completion-at-point-or-indent'</span>
<span class="linecomment">;; First call indent and second call complete lisp symbol.</span>
<span class="linecomment">;; `anything-lisp-completion-or-file-name-at-point'</span>
<span class="linecomment">;; Complete lisp symbol or filename at point.</span>
<span class="linecomment">;; `anything-w32-shell-execute-open-file'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-c-set-variable'</span>
<span class="linecomment">;; Set value to VAR interactively.</span>
<span class="linecomment">;; `anything-c-adaptive-save-history'</span>
<span class="linecomment">;; Save history information to file given by `anything-c-adaptive-history-file'.</span>
<span class="linecomment">;; `anything-c-reset-adaptative-history'</span>
<span class="linecomment">;; Delete all `anything-c-adaptive-history' and his file.</span>
<span class="linecomment">;; `anything-mini'</span>
<span class="linecomment">;; Preconfigured `anything' lightweight version (buffer -&gt; recentf).</span>
<span class="linecomment">;; `anything-for-files'</span>
<span class="linecomment">;; Preconfigured `anything' for opening files.</span>
<span class="linecomment">;; `anything-recentf'</span>
<span class="linecomment">;; Preconfigured `anything' for `recentf'.</span>
<span class="linecomment">;; `anything-info-at-point'</span>
<span class="linecomment">;; Preconfigured `anything' for searching info at point.</span>
<span class="linecomment">;; `anything-show-kill-ring'</span>
<span class="linecomment">;; Preconfigured `anything' for `kill-ring'.</span>
<span class="linecomment">;; `anything-minibuffer-history'</span>
<span class="linecomment">;; Preconfigured `anything' for `minibuffer-history'.</span>
<span class="linecomment">;; `anything-gentoo'</span>
<span class="linecomment">;; Preconfigured `anything' for gentoo linux.</span>
<span class="linecomment">;; `anything-imenu'</span>
<span class="linecomment">;; Preconfigured `anything' for `imenu'.</span>
<span class="linecomment">;; `anything-google-suggest'</span>
<span class="linecomment">;; Preconfigured `anything' for google search with google suggest.</span>
<span class="linecomment">;; `anything-yahoo-suggest'</span>
<span class="linecomment">;; Preconfigured `anything' for Yahoo searching with Yahoo suggest.</span>
<span class="linecomment">;; `anything-for-buffers'</span>
<span class="linecomment">;; Preconfigured `anything' for buffers.</span>
<span class="linecomment">;; `anything-buffers-list'</span>
<span class="linecomment">;; Preconfigured `anything' to list buffers.</span>
<span class="linecomment">;; `anything-bbdb'</span>
<span class="linecomment">;; Preconfigured `anything' for BBDB.</span>
<span class="linecomment">;; `anything-locate'</span>
<span class="linecomment">;; Preconfigured `anything' for Locate.</span>
<span class="linecomment">;; `anything-w3m-bookmarks'</span>
<span class="linecomment">;; Preconfigured `anything' for w3m bookmark.</span>
<span class="linecomment">;; `anything-firefox-bookmarks'</span>
<span class="linecomment">;; Preconfigured `anything' for firefox bookmark.</span>
<span class="linecomment">;; `anything-colors'</span>
<span class="linecomment">;; Preconfigured `anything' for color.</span>
<span class="linecomment">;; `anything-bookmarks'</span>
<span class="linecomment">;; Preconfigured `anything' for bookmarks.</span>
<span class="linecomment">;; `anything-c-pp-bookmarks'</span>
<span class="linecomment">;; Preconfigured `anything' for bookmarks	(pretty-printed).</span>
<span class="linecomment">;; `anything-c-insert-latex-math'</span>
<span class="linecomment">;; Preconfigured anything for latex math symbols completion.</span>
<span class="linecomment">;; `anything-register'</span>
<span class="linecomment">;; Preconfigured `anything' for Emacs registers.</span>
<span class="linecomment">;; `anything-man-woman'</span>
<span class="linecomment">;; Preconfigured `anything' for Man and Woman pages.</span>
<span class="linecomment">;; `anything-org-keywords'</span>
<span class="linecomment">;; Preconfigured `anything' for org keywords.</span>
<span class="linecomment">;; `anything-emms'</span>
<span class="linecomment">;; Preconfigured `anything' for emms sources.</span>
<span class="linecomment">;; `anything-eev-anchors'</span>
<span class="linecomment">;; Preconfigured `anything' for eev anchors.</span>
<span class="linecomment">;; `anything-bm-list'</span>
<span class="linecomment">;; Preconfigured `anything' for visible bookmarks.</span>
<span class="linecomment">;; `anything-timers'</span>
<span class="linecomment">;; Preconfigured `anything' for timers.</span>
<span class="linecomment">;; `anything-list-emacs-process'</span>
<span class="linecomment">;; Preconfigured `anything' for emacs process.</span>
<span class="linecomment">;; `anything-occur'</span>
<span class="linecomment">;; Preconfigured Anything for Occur source.</span>
<span class="linecomment">;; `anything-browse-code'</span>
<span class="linecomment">;; Preconfigured anything to browse code.</span>
<span class="linecomment">;; `anything-org-headlines'</span>
<span class="linecomment">;; Preconfigured anything to show org headlines.</span>
<span class="linecomment">;; `anything-regexp'</span>
<span class="linecomment">;; Preconfigured anything to build regexps.</span>
<span class="linecomment">;; `anything-c-copy-files-async'</span>
<span class="linecomment">;; Preconfigured anything to copy file list FLIST to DEST asynchronously.</span>
<span class="linecomment">;; `anything-find-files'</span>
<span class="linecomment">;; Preconfigured `anything' for anything implementation of `find-file'.</span>
<span class="linecomment">;; `anything-write-file'</span>
<span class="linecomment">;; Preconfigured `anything' providing completion for `write-file'.</span>
<span class="linecomment">;; `anything-insert-file'</span>
<span class="linecomment">;; Preconfigured `anything' providing completion for `insert-file'.</span>
<span class="linecomment">;; `anything-dired-rename-file'</span>
<span class="linecomment">;; Preconfigured `anything' to rename files from dired.</span>
<span class="linecomment">;; `anything-dired-copy-file'</span>
<span class="linecomment">;; Preconfigured `anything' to copy files from dired.</span>
<span class="linecomment">;; `anything-dired-symlink-file'</span>
<span class="linecomment">;; Preconfigured `anything' to symlink files from dired.</span>
<span class="linecomment">;; `anything-dired-hardlink-file'</span>
<span class="linecomment">;; Preconfigured `anything' to hardlink files from dired.</span>
<span class="linecomment">;; `anything-do-grep'</span>
<span class="linecomment">;; Preconfigured anything for grep.</span>
<span class="linecomment">;; `anything-do-pdfgrep'</span>
<span class="linecomment">;; Preconfigured anything for pdfgrep.</span>
<span class="linecomment">;; `anything-c-etags-select'</span>
<span class="linecomment">;; Preconfigured anything for etags.</span>
<span class="linecomment">;; `anything-filelist'</span>
<span class="linecomment">;; Preconfigured `anything' to open files instantly.</span>
<span class="linecomment">;; `anything-filelist+'</span>
<span class="linecomment">;; Preconfigured `anything' to open files/buffers/bookmarks instantly.</span>
<span class="linecomment">;; `anything-M-x'</span>
<span class="linecomment">;; Preconfigured `anything' for Emacs commands.</span>
<span class="linecomment">;; `anything-manage-advice'</span>
<span class="linecomment">;; Preconfigured `anything' to disable/enable function advices.</span>
<span class="linecomment">;; `anything-bookmark-ext'</span>
<span class="linecomment">;; Preconfigured `anything' for bookmark-extensions sources.</span>
<span class="linecomment">;; `anything-simple-call-tree'</span>
<span class="linecomment">;; Preconfigured `anything' for simple-call-tree. List function relationships.</span>
<span class="linecomment">;; `anything-mark-ring'</span>
<span class="linecomment">;; Preconfigured `anything' for `anything-c-source-mark-ring'.</span>
<span class="linecomment">;; `anything-global-mark-ring'</span>
<span class="linecomment">;; Preconfigured `anything' for `anything-c-source-global-mark-ring'.</span>
<span class="linecomment">;; `anything-all-mark-rings'</span>
<span class="linecomment">;; Preconfigured `anything' for `anything-c-source-global-mark-ring' and `anything-c-source-mark-ring'.</span>
<span class="linecomment">;; `anything-yaoddmuse-emacswiki-edit-or-view'</span>
<span class="linecomment">;; Preconfigured `anything' to edit or view EmacsWiki page.</span>
<span class="linecomment">;; `anything-yaoddmuse-emacswiki-post-library'</span>
<span class="linecomment">;; Preconfigured `anything' to post library to EmacsWiki.</span>
<span class="linecomment">;; `anything-eval-expression'</span>
<span class="linecomment">;; Preconfigured anything for `anything-c-source-evaluation-result'.</span>
<span class="linecomment">;; `anything-eval-expression-with-eldoc'</span>
<span class="linecomment">;; Preconfigured anything for `anything-c-source-evaluation-result' with `eldoc' support. </span>
<span class="linecomment">;; `anything-calcul-expression'</span>
<span class="linecomment">;; Preconfigured anything for `anything-c-source-calculation-result'.</span>
<span class="linecomment">;; `anything-surfraw'</span>
<span class="linecomment">;; Preconfigured `anything' to search PATTERN with search ENGINE.</span>
<span class="linecomment">;; `anything-call-source'</span>
<span class="linecomment">;; Preconfigured `anything' to call anything source.</span>
<span class="linecomment">;; `anything-execute-anything-command'</span>
<span class="linecomment">;; Preconfigured `anything' to execute preconfigured `anything'.</span>
<span class="linecomment">;; `anything-create'</span>
<span class="linecomment">;; Preconfigured `anything' to do many create actions from STRING.</span>
<span class="linecomment">;; `anything-top'</span>
<span class="linecomment">;; Preconfigured `anything' for top command.</span>
<span class="linecomment">;; `anything-select-xfont'</span>
<span class="linecomment">;; Preconfigured `anything' to select Xfont.</span>
<span class="linecomment">;; `anything-world-time'</span>
<span class="linecomment">;; Preconfigured `anything' to show world time.</span>
<span class="linecomment">;; `anything-apt'</span>
<span class="linecomment">;; Preconfigured `anything' : frontend of APT package manager.</span>
<span class="linecomment">;; `anything-esh-pcomplete'</span>
<span class="linecomment">;; Preconfigured anything to provide anything completion in eshell.</span>
<span class="linecomment">;; `anything-eshell-history'</span>
<span class="linecomment">;; Preconfigured anything for eshell history.</span>
<span class="linecomment">;; `anything-c-run-external-command'</span>
<span class="linecomment">;; Preconfigured `anything' to run External PROGRAM asyncronously from Emacs.</span>
<span class="linecomment">;; `anything-ratpoison-commands'</span>
<span class="linecomment">;; Preconfigured `anything' to execute ratpoison commands.</span>
<span class="linecomment">;; `anything-ucs'</span>
<span class="linecomment">;; Preconfigured anything for `ucs-names' math symbols.</span>
<span class="linecomment">;; `anything-c-apropos'</span>
<span class="linecomment">;; Preconfigured anything to describe commands, functions, variables and faces.</span>
<span class="linecomment">;; `anything-xrandr-set'</span>
<span class="linecomment">;; Not documented.</span>

<span class="linecomment">;;  * User variables defined here:</span>
<span class="linecomment">;; [EVAL] (autodoc-document-lisp-buffer :type 'user-variable :prefix "anything-" :var-value t)</span>
<span class="linecomment">;; `anything-c-adaptive-history-file'</span>
<span class="linecomment">;; Default Value: "~/.emacs.d/anything-c-adaptive-history"</span>
<span class="linecomment">;; `anything-c-adaptive-history-length'</span>
<span class="linecomment">;; Default Value: 50</span>
<span class="linecomment">;; `anything-c-google-suggest-url'</span>
<span class="linecomment">;; Default Value: "http://google.com/complete/search?output=toolbar&q="</span>
<span class="linecomment">;; `anything-c-google-suggest-search-url'</span>
<span class="linecomment">;; Default Value: "http://www.google.com/search?ie=utf-8&oe=utf-8&q="</span>
<span class="linecomment">;; `anything-google-suggest-use-curl-p'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-c-yahoo-suggest-url'</span>
<span class="linecomment">;; Default Value: "http://search.yahooapis.com/WebSearchService/V1/relatedSuggestion?appid=G [...]</span>
<span class="linecomment">;; `anything-c-yahoo-suggest-search-url'</span>
<span class="linecomment">;; Default Value: "http://search.yahoo.com/search?&ei=UTF-8&fr&h=c&p="</span>
<span class="linecomment">;; `anything-c-boring-buffer-regexp'</span>
<span class="linecomment">;; Default Value: "\\	(\\` \\)\\|\\*anything\\|\\*ac-mode\\| \\*Echo Area\\| \\*Minibuf"</span>
<span class="linecomment">;; `anything-c-boring-file-regexp'</span>
<span class="linecomment">;; Default Value: "/\\	(?:\\(?:\\.\\(?:git\\|hg\\|svn\\)\\|CVS\\|_darcs\\)\\)\\(?:/\\|$\\)\\| [...]</span>
<span class="linecomment">;; `anything-kill-ring-threshold'</span>
<span class="linecomment">;; Default Value: 10</span>
<span class="linecomment">;; `anything-c-kill-ring-max-lines-number'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-su-or-sudo'</span>
<span class="linecomment">;; Default Value: "su"</span>
<span class="linecomment">;; `anything-for-files-prefered-list'</span>
<span class="linecomment">;; Default Value:	(anything-c-source-ffap-line anything-c-source-ffap-guesser anything-c-sou [...]</span>
<span class="linecomment">;; `anything-create--actions-private'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-allow-skipping-current-buffer'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-c-enable-eval-defun-hack'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-tramp-verbose'</span>
<span class="linecomment">;; Default Value: 0</span>
<span class="linecomment">;; `anything-raise-command'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-command-map-prefix-key'</span>
<span class="linecomment">;; Default Value: "&lt;f5&gt; a"</span>
<span class="linecomment">;; `anything-c-browse-code-regexp-lisp'</span>
<span class="linecomment">;; Default Value: "^ *	(def\\(un\\|subst\\|macro\\|face\\|alias\\|advice\\|struct\\|type\\|th [...]</span>
<span class="linecomment">;; `anything-c-browse-code-regexp-python'</span>
<span class="linecomment">;; Default Value: "\\&lt;def\\&gt;\\|\\&lt;class\\&gt;"</span>
<span class="linecomment">;; `anything-c-browse-code-regexp-alist'</span>
<span class="linecomment">;; Default Value:	((lisp-interaction-mode . "^ *(def\\(un\\|subst\\|macro\\|face\\|alias\\|a [...]</span>
<span class="linecomment">;; `anything-c-external-programs-associations'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-ff-auto-update-initial-value'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-c-copy-async-prefered-emacs'</span>
<span class="linecomment">;; Default Value: "emacs"</span>
<span class="linecomment">;; `anything-ff-lynx-style-map'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-ff-history-max-length'</span>
<span class="linecomment">;; Default Value: 100</span>
<span class="linecomment">;; `anything-ff-smart-completion'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-ff-default-kbsize'</span>
<span class="linecomment">;; Default Value: 1024.0</span>
<span class="linecomment">;; `anything-ff-tramp-not-fancy'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-ff-exif-data-program'</span>
<span class="linecomment">;; Default Value: "exiftran"</span>
<span class="linecomment">;; `anything-ff-exif-data-program-args'</span>
<span class="linecomment">;; Default Value: "-d"</span>
<span class="linecomment">;; `anything-c-grep-use-ioccur-style-keys'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-c-pdfgrep-default-read-command'</span>
<span class="linecomment">;; Default Value: "xpdf '%f' %p"</span>
<span class="linecomment">;; `anything-c-etags-tag-file-name'</span>
<span class="linecomment">;; Default Value: "TAGS"</span>
<span class="linecomment">;; `anything-c-etags-tag-file-search-limit'</span>
<span class="linecomment">;; Default Value: 10</span>
<span class="linecomment">;; `anything-c-etags-use-regexp-search'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-c-etags-search-regexp'</span>
<span class="linecomment">;; Default Value: "^.+: .+ \\&lt;%s"</span>
<span class="linecomment">;; `anything-c-filelist-file-name'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-c-eldoc-in-minibuffer-show-fn'</span>
<span class="linecomment">;; Default Value: anything-c-show-info-in-mode-line</span>
<span class="linecomment">;; `anything-c-turn-on-show-completion'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-c-show-completion-use-special-display'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-c-show-completion-min-window-height'</span>
<span class="linecomment">;; Default Value: 7</span>
<span class="linecomment">;; `anything-lisp-completion-or-indent-delay'</span>
<span class="linecomment">;; Default Value: 0.6</span>
<span class="linecomment">;; `anything-c-default-external-file-browser'</span>
<span class="linecomment">;; Default Value: "nautilus"</span>
<span class="linecomment">;; `anything-c-use-adaptative-sorting'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-ff-newfile-prompt-p'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-ff-avfs-directory'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-ff-file-compressed-list'</span>
<span class="linecomment">;; Default Value:	("gz" "bz2" "zip" "7z") </span>
<span class="linecomment">;; `anything-locate-db-file-regexp'</span>
<span class="linecomment">;; Default Value: "m?locate.db$"</span>
<span class="linecomment">;; `anything-c-locate-command'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-c-show-info-in-mode-line-delay'</span>
<span class="linecomment">;; Default Value: 12</span>
<span class="linecomment">;; `anything-c-copy-files-async-log-file'</span>
<span class="linecomment">;; Default Value: "/tmp/dired.log"</span>
<span class="linecomment">;; `anything-ff-printer-list'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-ff-transformer-show-only-basename'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-ff-quick-delete-dont-prompt-for-deletion'</span>
<span class="linecomment">;; Default Value: nil</span>
<span class="linecomment">;; `anything-ff-signal-error-on-dot-files'</span>
<span class="linecomment">;; Default Value: t</span>
<span class="linecomment">;; `anything-completing-read-handlers-alist'</span>
<span class="linecomment">;; Default Value:	((describe-function . anything-completing-read-symbols)  (describe-variabl [...]</span>

<span class="linecomment">;;  * Anything sources defined here:</span>
<span class="linecomment">;; [EVAL] (autodoc-document-lisp-buffer :type 'anything-source :prefix "anything-" :any-sname t)</span>
<span class="linecomment">;; `anything-c-source-regexp'					(Regexp Builder)</span>
<span class="linecomment">;; `anything-c-source-buffers'					(Buffers)</span>
<span class="linecomment">;; `anything-c-source-buffer-not-found'				(Create buffer)</span>
<span class="linecomment">;; `anything-c-source-buffers-list'				(Buffers)</span>
<span class="linecomment">;; `anything-c-source-file-name-history'			(File Name History)</span>
<span class="linecomment">;; `anything-c-source-files-in-current-dir'			(Files from Current Directory)</span>
<span class="linecomment">;; `anything-c-source-files-in-current-dir+'			(Files from Current Directory)</span>
<span class="linecomment">;; `anything-c-source-find-files'				(Find Files)</span>
<span class="linecomment">;; `anything-c-source-write-file'				(Write File)</span>
<span class="linecomment">;; `anything-c-source-insert-file'				(Insert File)</span>
<span class="linecomment">;; `anything-c-source-copy-files'				(Copy Files)</span>
<span class="linecomment">;; `anything-c-source-symlink-files'				(Symlink Files)</span>
<span class="linecomment">;; `anything-c-source-hardlink-files'				(Hardlink Files)</span>
<span class="linecomment">;; `anything-c-source-file-cache'				(File Cache)</span>
<span class="linecomment">;; `anything-c-source-locate'					(Locate)</span>
<span class="linecomment">;; `anything-c-source-recentf'					(Recentf)</span>
<span class="linecomment">;; `anything-c-source-ffap-guesser'				(File at point)</span>
<span class="linecomment">;; `anything-c-source-ffap-line'				(File/Lineno at point)</span>
<span class="linecomment">;; `anything-c-source-files-in-all-dired'			(Files in all dired buffer.)</span>
<span class="linecomment">;; `anything-c-source-filelist'					(FileList)</span>
<span class="linecomment">;; `anything-c-source-info-pages'				(Info Pages)</span>
<span class="linecomment">;; `anything-c-source-man-pages'				(Manual Pages)</span>
<span class="linecomment">;; `anything-c-source-complex-command-history'			(Complex Command History)</span>
<span class="linecomment">;; `anything-c-source-extended-command-history'			(Emacs Commands History)</span>
<span class="linecomment">;; `anything-c-source-emacs-commands'				(Emacs Commands)</span>
<span class="linecomment">;; `anything-c-source-emacs-functions'				(Emacs Functions)</span>
<span class="linecomment">;; `anything-c-source-emacs-functions-with-abbrevs'		(Emacs Functions)</span>
<span class="linecomment">;; `anything-c-source-advice'					(Function Advice)</span>
<span class="linecomment">;; `anything-c-source-emacs-variables'				(Emacs Variables)</span>
<span class="linecomment">;; `anything-c-source-lacarte'					(Lacarte)</span>
<span class="linecomment">;; `anything-c-source-bookmarks'				(Bookmarks)</span>
<span class="linecomment">;; `anything-c-source-bookmark-set'				(Set Bookmark)</span>
<span class="linecomment">;; `anything-c-source-bm'					(Visible Bookmarks)</span>
<span class="linecomment">;; `anything-c-source-bookmarks-ssh'				(Bookmarks-ssh)</span>
<span class="linecomment">;; `anything-c-source-bookmarks-su'				(Bookmarks-root)</span>
<span class="linecomment">;; `anything-c-source-bookmarks-local'				(Bookmarks-Local)</span>
<span class="linecomment">;; `anything-c-source-bmkext-addressbook'			(Bookmark Addressbook)</span>
<span class="linecomment">;; `anything-c-source-bookmark-w3m'				(Bookmark W3m)</span>
<span class="linecomment">;; `anything-c-source-bookmark-images'				(Bookmark Images)</span>
<span class="linecomment">;; `anything-c-source-bookmark-man'				(Bookmark Woman&Man)</span>
<span class="linecomment">;; `anything-c-source-bookmark-gnus'				(Bookmark Gnus)</span>
<span class="linecomment">;; `anything-c-source-bookmark-info'				(Bookmark Info)</span>
<span class="linecomment">;; `anything-c-source-bookmark-files&dirs'			(Bookmark Files&Directories)</span>
<span class="linecomment">;; `anything-c-source-bookmark-su-files&dirs'			(Bookmark Root-Files&Directories)</span>
<span class="linecomment">;; `anything-c-source-bookmark-ssh-files&dirs'			(Bookmark Ssh-Files&Directories)</span>
<span class="linecomment">;; `anything-c-source-firefox-bookmarks'			(Firefox Bookmarks)</span>
<span class="linecomment">;; `anything-c-source-w3m-bookmarks'				(W3m Bookmarks)</span>
<span class="linecomment">;; `anything-c-source-elisp-library-scan'			(Elisp libraries (Scan))</span>
<span class="linecomment">;; `anything-c-source-imenu'					(Imenu)</span>
<span class="linecomment">;; `anything-c-source-ctags'					(Exuberant ctags)</span>
<span class="linecomment">;; `anything-c-source-etags-select'				(Etags)</span>
<span class="linecomment">;; `anything-c-source-semantic'					(Semantic Tags)</span>
<span class="linecomment">;; `anything-c-source-simple-call-tree-functions-callers'	(Function is called by)</span>
<span class="linecomment">;; `anything-c-source-simple-call-tree-callers-functions'	(Function calls)</span>
<span class="linecomment">;; `anything-c-source-commands-and-options-in-file'		(Commands/Options in file)</span>
<span class="linecomment">;; `anything-c-source-customize-face'				(Customize Face)</span>
<span class="linecomment">;; `anything-c-source-colors'					(Colors)</span>
<span class="linecomment">;; `anything-c-source-tracker-search'				(Tracker Search)</span>
<span class="linecomment">;; `anything-c-source-mac-spotlight'				(mdfind)</span>
<span class="linecomment">;; `anything-c-source-picklist'					(Picklist)</span>
<span class="linecomment">;; `anything-c-source-kill-ring'				(Kill Ring)</span>
<span class="linecomment">;; `anything-c-source-mark-ring'				(mark-ring)</span>
<span class="linecomment">;; `anything-c-source-global-mark-ring'				(global-mark-ring)</span>
<span class="linecomment">;; `anything-c-source-register'					(Registers)</span>
<span class="linecomment">;; `anything-c-source-latex-math'				(Latex Math Menu)</span>
<span class="linecomment">;; `anything-c-source-fixme'					(TODO/FIXME/DRY comments)</span>
<span class="linecomment">;; `anything-c-source-rd-headline'				(RD HeadLine)</span>
<span class="linecomment">;; `anything-c-source-oddmuse-headline'				(Oddmuse HeadLine)</span>
<span class="linecomment">;; `anything-c-source-emacs-source-defun'			(Emacs Source DEFUN)</span>
<span class="linecomment">;; `anything-c-source-emacs-lisp-expectations'			(Emacs Lisp Expectations)</span>
<span class="linecomment">;; `anything-c-source-emacs-lisp-toplevels'			(Emacs Lisp Toplevel / Level 4 Comment / Linkd Star)</span>
<span class="linecomment">;; `anything-c-source-yaoddmuse-emacswiki-edit-or-view'		(Yaoddmuse Edit or View (EmacsWiki))</span>
<span class="linecomment">;; `anything-c-source-yaoddmuse-emacswiki-post-library'		(Yaoddmuse Post library (EmacsWiki))</span>
<span class="linecomment">;; `anything-c-source-eev-anchor'				(Anchors)</span>
<span class="linecomment">;; `anything-c-source-org-headline'				(Org HeadLine)</span>
<span class="linecomment">;; `anything-c-source-org-keywords'				(Org Keywords)</span>
<span class="linecomment">;; `anything-c-source-bbdb'					(BBDB)</span>
<span class="linecomment">;; `anything-c-source-evaluation-result'			(Evaluation Result)</span>
<span class="linecomment">;; `anything-c-source-calculation-result'			(Calculation Result)</span>
<span class="linecomment">;; `anything-c-source-google-suggest'				(Google Suggest)</span>
<span class="linecomment">;; `anything-c-source-yahoo-suggest'				(Yahoo Suggest)</span>
<span class="linecomment">;; `anything-c-source-emms-streams'				(Emms Streams)</span>
<span class="linecomment">;; `anything-c-source-emms-dired'				(Music Directory)</span>
<span class="linecomment">;; `anything-c-source-emms-files'				(Emms files)</span>
<span class="linecomment">;; `anything-c-source-jabber-contacts'				(Jabber Contacts)</span>
<span class="linecomment">;; `anything-c-source-call-source'				(Call anything source)</span>
<span class="linecomment">;; `anything-c-source-anything-commands'			(Preconfigured Anything)</span>
<span class="linecomment">;; `anything-c-source-occur'					(Occur)</span>
<span class="linecomment">;; `anything-c-source-browse-code'				(Browse code)</span>
<span class="linecomment">;; `anything-c-source-create'					(Create)</span>
<span class="linecomment">;; `anything-c-source-minibuffer-history'			(Minibuffer History)</span>
<span class="linecomment">;; `anything-c-source-elscreen'					(Elscreen)</span>
<span class="linecomment">;; `anything-c-source-top'					(Top (Press C-c C-u to refresh))</span>
<span class="linecomment">;; `anything-c-source-absolute-time-timers'			(Absolute Time Timers)</span>
<span class="linecomment">;; `anything-c-source-idle-time-timers'				(Idle Time Timers)</span>
<span class="linecomment">;; `anything-c-source-xrandr-change-resolution'			(Change Resolution)</span>
<span class="linecomment">;; `anything-c-source-xfonts'					(X Fonts)</span>
<span class="linecomment">;; `anything-c-source-ucs'					(Ucs names)</span>
<span class="linecomment">;; `anything-c-source-emacs-process'				(Emacs Process)</span>
<span class="linecomment">;; `anything-c-source-time-world'				(Time World List)</span>
<span class="linecomment">;; `anything-c-source-apt'					(APT)</span>
<span class="linecomment">;; `anything-c-source-gentoo'					(Portage sources)</span>
<span class="linecomment">;; `anything-c-source-use-flags'				(Use Flags)</span>
<span class="linecomment">;; `anything-c-source-ratpoison-commands'			(Ratpoison Commands)</span>
<span class="linecomment">;; `anything-c-source-esh'					(Eshell completions)</span>
<span class="linecomment">;; `anything-c-source-eshell-history'				(Eshell history)</span>

<span class="linecomment">;;  *** END auto-documentation</span>

<span class="linecomment">;;; For Maintainers:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Install developer-tools/autodoc.el and</span>
<span class="linecomment">;; Evaluate (autodoc-update-all) before commit or run it interactively.</span>
<span class="linecomment">;; This function generates anything-c-source-* / functions / options list.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (autodoc-update-all)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Please write details documentation about function, then others will</span>
<span class="linecomment">;; read code more easier.   -- Andy Stewart</span>
<span class="linecomment">;;</span>

 
<span class="linecomment">;;; Change log:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Change log of this file is found at</span>
<span class="linecomment">;;  http://repo.or.cz/w/anything-config.git/history/master:/anything-config.el</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Change log of this project is found at</span>
<span class="linecomment">;;  http://repo.or.cz/w/anything-config.git?a=shortlog</span>

<span class="linecomment">;;; Contributors:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;     Tamas Patrovics</span>
<span class="linecomment">;;     Tassilo Horn &lt;tassilo@member.fsf.org&gt;</span>
<span class="linecomment">;;     Vagn Johansen &lt;gonz808@hotmail.com&gt;</span>
<span class="linecomment">;;     Mathias Dahl &lt;mathias.dahl@gmail.com&gt;</span>
<span class="linecomment">;;     Bill Clementson &lt;billclem@gmail.com&gt;</span>
<span class="linecomment">;;     Stefan Kamphausen (see http://www.skamphausen.de for more informations)</span>
<span class="linecomment">;;     Drew Adams &lt;drew.adams@oracle.com&gt;</span>
<span class="linecomment">;;     Jason McBrayer &lt;jmcbray@carcosa.net&gt;</span>
<span class="linecomment">;;     Andy Stewart &lt;lazycat.manatee@gmail.com&gt;</span>
<span class="linecomment">;;     Thierry Volpiatto &lt;thierry.volpiatto@gmail.com&gt;</span>
<span class="linecomment">;;     rubikitch &lt;rubikitch@ruby-lang.org&gt;</span>
<span class="linecomment">;;     Scott Vokes &lt;vokes.s@gmail.com&gt;</span>
<span class="linecomment">;;     Kenichirou Oyama &lt;k1lowxb@gmail.com&gt;</span>


<span class="linecomment">;;; TODO</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; - Fix documentation, now many functions haven't documentations.</span>
<span class="linecomment">;;</span>

 
<span class="linecomment">;;; Code:</span>

<span class="linecomment">;;; Require</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(require 'anything)
(require 'thingatpt)
(require 'ffap)
(require 'cl)
(eval-when-compile (require 'dired))
(require 'dired-aux)
(require 'dired-x)
(require 'tramp)
(require 'grep)
(require 'url)
(require 'xml)
(eval-when-compile (require 'org)) <span class="linecomment">; Shut up byte compiler about org-directory.</span>
(eval-when-compile (require 'semantic nil t))
(require 'anything-match-plugin)


 
<span class="linecomment">;;; Declare external functions</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(declare-function gnus-dired-attach "<span class="quote">ext:gnus-dired.el</span>" (files-to-attach))
(declare-function image-dired-display-image "<span class="quote">image-dired.el</span>" (file &optional original-size))
(declare-function image-dired-update-property "<span class="quote">image-dired.el</span>" (prop value))
(declare-function woman-file-name-all-completions "<span class="quote">woman.el</span>" (topic))
(declare-function Man-getpage-in-background "<span class="quote">man.el</span>" (topic))
(declare-function simple-call-tree-analyze "<span class="quote">ext:simple-call-tree.el</span>" (&optional test))
(declare-function yaoddmuse-update-pagename "<span class="quote">ext:yaoddmuse.el</span>" (&optional unforced))
(declare-function yaoddmuse-get-library-list "<span class="quote">ext:yaoddmuse.el</span>" (&optional dirs string))
(declare-function org-get-current-options "<span class="quote">ext:org-exp.el</span>")
(declare-function emms-streams "<span class="quote">ext:emms-streams</span>")
(declare-function emms-stream-delete-bookmark "<span class="quote">ext:emms-streams</span>")
(declare-function emms-stream-add-bookmark "<span class="quote">ext:emms-streams</span>" (name url fd type))
(declare-function emms-stream-save-bookmarks-file "<span class="quote">ext:emms-streams</span>")
(declare-function emms-stream-quit "<span class="quote">ext:emms-streams</span>")
(declare-function with-current-emms-playlist "<span class="quote">ext:emms</span>" (&rest body))
(declare-function emms-playlist-tracks-in-region "<span class="quote">ext:emms</span>" (beg end))
(declare-function emms-playlist-first "<span class="quote">ext:emms</span>")
(declare-function emms-playlist-mode-play-smart "<span class="quote">ext:emms-playlist-mode</span>")
(declare-function term-line-mode "<span class="quote">term</span>")
(declare-function term-char-mode "<span class="quote">term</span>")
(declare-function term-send-input "<span class="quote">term</span>")
(declare-function term-send-eof "<span class="quote">term</span>")
(declare-function Info-index-nodes "<span class="quote">info</span>" (&optional file))
(declare-function Info-goto-node "<span class="quote">info</span>" (&optional fork))
(declare-function Info-find-node "<span class="quote">info.el</span>" (filename nodename &optional no-going-back))
(declare-function elscreen-find-screen-by-buffer "<span class="quote">ext:elscreen.el</span>" (buffer &optional create))
(declare-function elscreen-find-file "<span class="quote">ext:elscreen.el</span>" (filename))
(declare-function elscreen-goto "<span class="quote">ext:elscreen.el</span>" (screen))
(declare-function semantic-format-tag-summarize "<span class="quote">ext:format.el</span>" (tag &optional parent color) t)
(declare-function semantic-tag-components "<span class="quote">ext:tag.el</span>" (tag) t)
(declare-function semantic-go-to-tag "<span class="quote">ext:tag-file.el</span>" (tag) t)
(declare-function semantic-tag-type "<span class="quote">ext:tag-file.el</span>" (tag) t)
(declare-function semantic-tag-class "<span class="quote">ext:tag-file.el</span>" (tag) t)
(declare-function bbdb "<span class="quote">ext:bbdb-com</span>")
(declare-function bbdb-current-record "<span class="quote">ext:bbdb-com</span>")
(declare-function bbdb-redisplay-one-record "<span class="quote">ext:bbdb-com</span>")
(declare-function bbdb-record-net "<span class="quote">ext:bbdb-com</span>" (string) t)
(declare-function bbdb-current-record "<span class="quote">ext:bbdb-com</span>")
(declare-function bbdb-dwim-net-address "<span class="quote">ext:bbdb-com</span>")
(declare-function bbdb-records "<span class="quote">ext:bbdb-com</span>"
                  (&optional dont-check-disk already-in-db-buffer))
(declare-function eshell-read-aliases-list "<span class="quote">em-alias</span>")
(declare-function eshell-send-input "<span class="quote">esh-mode</span>" (&optional use-region queue-p no-newline))
(declare-function eshell-bol "<span class="quote">esh-mode</span>")
(declare-function eldoc-current-symbol "<span class="quote">eldoc</span>")
(declare-function eldoc-get-fnsym-args-string "<span class="quote">eldoc</span>" (sym &optional index))
(declare-function eldoc-get-var-docstring "<span class="quote">eldoc</span>" (sym))
(declare-function eldoc-fnsym-in-current-sexp "<span class="quote">eldoc</span>")
(declare-function find-library-name "<span class="quote">find-func.el</span>" (library))
(declare-function adoc-construct "<span class="quote">ext:auto-document.el</span>" (buf))
(declare-function adoc-first-line "<span class="quote">ext:auto-document.el</span>" (str))
(declare-function adoc-prin1-to-string "<span class="quote">ext:auto-document.el</span>" (object))
(declare-function secure-hash "<span class="quote">ext:fns.c</span>" (algorithm object &optional start end binary))
(declare-function w32-shell-execute "<span class="quote">ext:w32fns.c</span>" (operation document &optional parameters show-flag))
(declare-function undo-tree-restore-state-from-register "<span class="quote">ext:undo-tree.el</span>" (register))

 
<span class="linecomment">;;; compatibility</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(unless (fboundp 'window-system)
  (defun window-system (&optional arg)
    window-system))

(unless (fboundp 'make-composed-keymap)
  (defun make-composed-keymap (maps &optional parent)
    "<span class="quote">Construct a new keymap composed of MAPS and inheriting from PARENT.
When looking up a key in the returned map, the key is looked in each
keymap of MAPS in turn until a binding is found.
If no binding is found in MAPS, the lookup continues in PARENT, if non-nil.
As always with keymap inheritance, a nil binding in MAPS overrides
any corresponding binding in PARENT, but it does not override corresponding
bindings in other keymaps of MAPS.
MAPS can be a list of keymaps or a single keymap.
PARENT if non-nil should be a keymap.</span>"
    `(keymap
      ,@(if (keymapp maps) (list maps) maps)
      ,@parent)))

(unless (fboundp 'apply-partially)
  (defun apply-partially (fun &rest args)
    "<span class="quote">Return a function that is a partial application of FUN to ARGS.
ARGS is a list of the first N arguments to pass to FUN.
The result is a new function which does the same as FUN, except that
the first N arguments are fixed at the values with which this function
was called.</span>"
    (lexical-let ((fun fun) (args1 args))
      (lambda (&rest args2) (apply fun (append args1 args2))))))

 
<span class="linecomment">;;; Customize</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defgroup anything-config nil
  "<span class="quote">Predefined configurations for `anything.el'.</span>"
  :group 'anything)

(defcustom anything-c-adaptive-history-file
  "<span class="quote">~/.emacs.d/anything-c-adaptive-history</span>"
  "<span class="quote">Path of file where history information is stored.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-adaptive-history-length 50
  "<span class="quote">Maximum number of candidates stored for a source.</span>"
  :type 'number
  :group 'anything-config)

(defcustom anything-c-google-suggest-url
  "<span class="quote">http://google.com/complete/search?output=toolbar&q=</span>"
  "<span class="quote">URL used for looking up Google suggestions.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-google-suggest-search-url
  "<span class="quote">http://www.google.com/search?ie=utf-8&oe=utf-8&q=</span>"
  "<span class="quote">URL used for Google searching.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-google-suggest-use-curl-p nil
  "<span class="quote">When non--nil use CURL to get info from `anything-c-google-suggest-url'.
Otherwise `url-retrieve-synchronously' is used.</span>"
  :type 'boolean
  :group 'anything-config)

(defcustom anything-c-yahoo-suggest-url
  "<span class="quote">http://search.yahooapis.com/WebSearchService/V1/relatedSuggestion?appid=Generic&query=</span>"
  "<span class="quote">Url used for looking up Yahoo suggestions.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-yahoo-suggest-search-url
  "<span class="quote">http://search.yahoo.com/search?&ei=UTF-8&fr&h=c&p=</span>"
  "<span class="quote">Url used for Yahoo searching.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-boring-buffer-regexp
  (rx (or
       (group bos  "<span class="quote"> </span>")
       <span class="linecomment">;; anything-buffers</span>
       "<span class="quote">*anything</span>" "<span class="quote">*ac-mode</span>"
       <span class="linecomment">;; echo area</span>
       "<span class="quote"> *Echo Area</span>" "<span class="quote"> *Minibuf</span>"))
  "<span class="quote">The regexp that match boring buffers.
Buffer candidates matching this regular expression will be
filtered from the list of candidates if the
`anything-c-skip-boring-buffers' candidate transformer is used, or
they will be displayed with face `file-name-shadow' if
`anything-c-shadow-boring-buffers' is used.</span>"
  :type 'string
  :group 'anything-config)
<span class="linecomment">;; (string-match anything-c-boring-buffer-regexp "buf")</span>
<span class="linecomment">;; (string-match anything-c-boring-buffer-regexp " hidden")</span>
<span class="linecomment">;; (string-match anything-c-boring-buffer-regexp " *Minibuf-1*")</span>

(defcustom anything-c-boring-file-regexp
  (rx (or
       <span class="linecomment">;; Boring directories</span>
       (and "<span class="quote">/</span>" (or "<span class="quote">.svn</span>" "<span class="quote">CVS</span>" "<span class="quote">_darcs</span>" "<span class="quote">.git</span>" "<span class="quote">.hg</span>") (or "<span class="quote">/</span>" eol))
       <span class="linecomment">;; Boring files</span>
       (and line-start  "<span class="quote">.#</span>")
       (and (or "<span class="quote">.class</span>" "<span class="quote">.la</span>" "<span class="quote">.o</span>" "<span class="quote">~</span>") eol)))
  "<span class="quote">The regexp that match boring files.
File candidates matching this regular expression will be
filtered from the list of candidates if the
`anything-c-skip-boring-files' candidate transformer is used, or
they will be displayed with face `file-name-shadow' if
`anything-c-shadow-boring-files' is used.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-kill-ring-threshold 10
  "<span class="quote">Minimum length to be listed by `anything-c-source-kill-ring'.</span>"
  :type 'integer
  :group 'anything-config)

(defcustom anything-c-kill-ring-max-lines-number nil
  "<span class="quote">Max number of lines displayed per candidate in kill-ring browser.
If nil or zero, don't truncate candidate, show all.</span>"
  :type 'integer
  :group 'anything-config)

(defcustom anything-su-or-sudo "<span class="quote">su</span>"
  "<span class="quote">What command to use for root access.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-for-files-prefered-list
  '(anything-c-source-ffap-line
    anything-c-source-ffap-guesser
    anything-c-source-buffers-list
    anything-c-source-recentf
    anything-c-source-bookmarks
    anything-c-source-file-cache
    anything-c-source-files-in-current-dir+
    anything-c-source-locate)
  "<span class="quote">Your prefered sources to find files.</span>"
  :type 'list
  :group 'anything-config)

(defcustom anything-create--actions-private nil
  "<span class="quote">User defined actions for `anything-create' / `anything-c-source-create'.
It is a list of (DISPLAY . FUNCTION) pairs like `action'
attribute of `anything-sources'.

It is prepended to predefined pairs.</span>"
  :type 'list
  :group 'anything-config)

(defcustom anything-allow-skipping-current-buffer nil
  "<span class="quote">Show current buffer or not in anything buffer</span>"
  :type 'boolean
  :group 'anything-config)

(defcustom anything-c-enable-eval-defun-hack t
  "<span class="quote">If non-nil, execute `anything' using the source at point when C-M-x is pressed.
This hack is invoked when pressing C-M-x in the form \
 (defvar anything-c-source-XXX ...) or (setq anything-c-source-XXX ...).</span>"
  :type 'boolean
  :group 'anything-config)

(defcustom anything-tramp-verbose 0
  "<span class="quote">Just like `tramp-verbose' but specific to anything.
When set to 0 don't show tramp messages in anything.
If you want to have the default tramp messages set it to 3.</span>"
  :type 'integer
  :group 'anything-config)

(defcustom anything-raise-command nil
  "<span class="quote">A shell command to jump to a window running specific program.
Need external program wmctrl.
This will be use with `format', so use something like \"wmctrl -xa %s\".</span>"
  :type 'string
  :group 'anything-config)

(defun anything-set-anything-command-map-prefix-key (var key)
  "<span class="quote">The customize set function for `anything-command-map-prefix-key'.</span>"
  (when (boundp var)
    (define-key global-map (read-kbd-macro (symbol-value var)) nil))
  (set var key)
  (define-key global-map
      (read-kbd-macro (symbol-value var)) 'anything-command-map))

(defcustom anything-command-map-prefix-key "<span class="quote">C-x c</span>"
  "<span class="quote">The prefix key for all `anything-command-map' commands.</span>"
  :type  'string
  :set   'anything-set-anything-command-map-prefix-key
  :group 'anything-config)

(defcustom anything-c-browse-code-regexp-lisp
  "<span class="quote">^ *\(def\\(un\\|subst\\|macro\\|face\\|alias\\|advice\\|struct\\|\
type\\|theme\\|var\\|group\\|custom\\|const\\|method\\|class\\)</span>"
  "<span class="quote">Regexp used to parse lisp buffer when browsing code.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-browse-code-regexp-python
  "<span class="quote">\\&lt;def\\&gt;\\|\\&lt;class\\&gt;</span>"
  "<span class="quote">Regexp used to parse python buffer when browsing code.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-browse-code-regexp-alist
  `((lisp-interaction-mode . ,anything-c-browse-code-regexp-lisp)
    (emacs-lisp-mode . ,anything-c-browse-code-regexp-lisp)
    (lisp-mode . ,anything-c-browse-code-regexp-lisp)
    (python-mode . ,anything-c-browse-code-regexp-python))
  "<span class="quote">Alist to store regexps for browsing code corresponding \
to a specific `major-mode'.</span>"
  :type 'list
  :group 'anything-config)

(defcustom anything-c-external-programs-associations nil
  "<span class="quote">Alist to store externals programs associated with file extension.
This variable overhide setting in .mailcap file.
e.g : '\(\(\"jpg\" . \"gqview\"\) (\"pdf\" . \"xpdf\"\)\) </span>"
  :type 'list
  :group 'anything-config)

(defcustom anything-ff-auto-update-initial-value t
  "<span class="quote">Auto update when only one candidate directory is matched.
This is the default value when starting `anything-find-files'.</span>"
  :group 'anything-config
  :type  'boolean)

(defcustom anything-c-copy-async-prefered-emacs "<span class="quote">emacs</span>"
  "<span class="quote">Path to the emacs you want to use for copying async.
Emacs versions &lt; 24 fail to copy directory due to a bug not fixed
in `copy-directory'.</span>"
  :group 'anything-config
  :type 'string)

(defcustom anything-ff-lynx-style-map t
  "<span class="quote">Use arrow keys to navigate with `anything-find-files'.
You will have to restart Emacs or reeval `anything-find-files-map'
and `anything-c-read-file-map' for this take effect.</span>"
  :group 'anything-config
  :type 'boolean)

(defcustom anything-ff-history-max-length 100
  "<span class="quote">Number of elements shown in `anything-find-files' history.</span>"
  :group 'anything-config
  :type 'integer)

(defcustom anything-ff-smart-completion t
  "<span class="quote">Try to complete filenames smarter when non--nil.
See `anything-ff-transform-fname-for-completion' for more info.</span>"
  :group 'anything-config
  :type 'boolean)

(defcustom anything-ff-default-kbsize 1024.0
  "<span class="quote">Default Kbsize to use for showing files size.
It is a float, usually 1024.0 but could be 1000.0 on some systems.</span>"
  :group 'anything-config
  :type 'float)

(defcustom anything-ff-tramp-not-fancy t
  "<span class="quote">No colors when listing remote files when set to non--nil.
This make listing much faster, specially on slow machines.</span>"
  :group 'anything-config
  :type  'boolean)

(defcustom anything-ff-exif-data-program "<span class="quote">exiftran</span>"
  "<span class="quote">Program used to extract exif data of an image file.</span>"
  :group 'anything-config
  :type 'string)

(defcustom anything-ff-exif-data-program-args "<span class="quote">-d</span>"
  "<span class="quote">*Arguments used for `anything-ff-exif-data-program'.</span>"
  :group 'anything-config
  :type 'string)

(defcustom anything-c-grep-use-ioccur-style-keys t
  "<span class="quote">Use Arrow keys to jump to occurences.</span>"
  :group 'anything-config
  :type  'boolean)

(defcustom anything-c-pdfgrep-default-read-command "<span class="quote">xpdf '%f' %p</span>"
  "<span class="quote">Default command to read pdf files from pdfgrep.
Where '%f' format spec is filename and '%p' is page number</span>"
  :group 'anything-config
  :type  'string)

(defcustom anything-c-etags-tag-file-name "<span class="quote">TAGS</span>"
  "<span class="quote">Etags tag file name.</span>"
  :type  'string
  :group 'anything-config)

(defcustom anything-c-etags-tag-file-search-limit 10
  "<span class="quote">The limit level of directory to search tag file.
Don't search tag file deeply if outside this value.</span>"
  :type  'number
  :group 'anything-config)

(defcustom anything-c-etags-use-regexp-search nil
  "<span class="quote">When non--nil search etags candidates by regexp.
This disable anything-match-plugin when enabled.
When nil search is performed directly on patter and *match-plugin is used
if available.  You can customize `anything-c-etags-search-regexp'.</span>"
  :group 'anything-config
  :type  'boolean)

(defcustom anything-c-etags-search-regexp "<span class="quote">^.+: .+ \\&lt;%s</span>"
  "<span class="quote">Regexp that match tags in an anything etags buffer.
The format spec is replaced by pattern.
This regexp have no effect when `anything-c-etags-use-regexp-search'
is nil.</span>"
  :group 'anything-config
  :type  'regexp)

(defcustom anything-c-filelist-file-name nil
  "<span class="quote">Filename of file list.
Accept a list of string for multiple files.

This file tend to be very large \(&gt; 100MB\) and recommend to be in ramdisk for speed.
File list is created by make-filelist.rb script.

Usage:
  ruby make-filelist.rb &gt; /tmp/all.filelist

Then
 ;; Assume that /tmp is ramdisk or tmpfs
 \(setq anything-grep-candidates-fast-directory-regexp \"^/tmp/\"\)
 \(setq anything-c-filelist-file-name \"/tmp/all.filelist\"\)
</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-eldoc-in-minibuffer-show-fn
  'anything-c-show-info-in-mode-line
  "<span class="quote">A function to display eldoc info.
Should take one arg: the string to display.</span>"
  :group 'anything-config
  :type  'symbol)

(defcustom anything-c-turn-on-show-completion t
  "<span class="quote">Display candidate in buffer while moving selection when non--nil.</span>"
  :group 'anything-config
  :type  'boolean)

(defcustom anything-c-show-completion-use-special-display t
  "<span class="quote">A special display will be used in lisp completion if non--nil.
All functions that are wrapped in macro `with-anything-show-completion'
will be affected.</span>"
  :group 'anything-config
  :type  'boolean)

(defcustom anything-c-show-completion-min-window-height 7
  "<span class="quote">Minimum completion window height used in show completion.
This is used in macro `with-anything-show-completion'.</span>"
  :group 'anything-config
  :type  'integer)

(defcustom anything-lisp-completion-or-indent-delay 0.6
  "<span class="quote">After this delay `anything-lisp-completion-counter' is reset to 0.
This allow to indent again without completing lisp symbol after this delay.
Default is 0.6 seconds.</span>"
  :group 'anything-config
  :type  'number)

(defcustom anything-c-default-external-file-browser "<span class="quote">nautilus</span>"
  "<span class="quote">Default external file browser for your system.
Directories will be opened externally with it when
opening file externally in `anything-find-files'.
Set to nil if you do not have external file browser
or do not want to use it.
Windows users should set that to \"explorer.exe\".</span>"
  :group 'anything-config
  :type  'string)

(defcustom anything-c-use-adaptative-sorting nil
  "<span class="quote">Wheter to use or not adaptative sorting.
Even if a source use it, it will have no effect when set to nil.</span>"
  :type 'boolean
  :group 'anything-config)

(defcustom anything-ff-newfile-prompt-p t
  "<span class="quote">Whether Prompt or not when creating new file.
This set `ffap-newfile-prompt'.</span>"
  :type  'boolean
  :group 'anything-config)


(defcustom anything-ff-avfs-directory nil
  "<span class="quote">The default avfs directory, usually '.avfs'.
When this is set you will be able to expand archive filenames with `C-z'
inside an avfs directory mounted with mountavfs.
See &lt;http://sourceforge.net/projects/avf/&gt;.</span>"
  :type  'boolean
  :group 'anything-config)

(defcustom anything-ff-file-compressed-list '("<span class="quote">gz</span>" "<span class="quote">bz2</span>" "<span class="quote">zip</span>" "<span class="quote">7z</span>")
  "<span class="quote">Minimal list of compressed files extension.</span>"
  :type  'list
  :group 'anything-config)

(defcustom anything-locate-db-file-regexp "<span class="quote">m?locate\.db$</span>"
  "<span class="quote">Default regexp to match locate database.
If nil Search in all files.</span>"
  :type  'string
  :group 'anything-config)

(defcustom anything-ff-locate-db-filename "<span class="quote">locate.db</span>"
  "<span class="quote">The basename of the locatedb file you use locally in your directories.
When this is set and `anything' find such a file in the directory from
where you launch locate, it will use this file and will not prompt you
for a db file.
Note that this happen only when locate is launched with a prefix arg.</span>"
  :group 'anything-config
  :type 'string)

(defcustom anything-c-locate-command nil
  "<span class="quote">A list of arguments for locate program.
If nil it will be calculated when `anything-locate' startup
with these default values for different systems:

Gnu/linux: \"locate -i -r %s\"
berkeley-unix: \"locate -i %s\"
windows-nt: \"es -i -r %s\"
Others: \"locate %s\"

This string will be passed to format so it should end with `%s'.
The \"-r\" option must be the last option.</span>"
  :type 'string
  :group 'anything-config)

(defcustom anything-c-show-info-in-mode-line-delay 12
  "<span class="quote">Eldoc will show info in mode-line during this delay if user is idle.</span>"
  :type  'integer
  :group 'anything-config)

(defcustom anything-c-copy-files-async-log-file "<span class="quote">/tmp/dired.log</span>"
  "<span class="quote">The file used to communicate with two emacs when copying files async.</span>"
  :type  'string
  :group 'anything-config)

(defcustom anything-ff-printer-list nil
  "<span class="quote">A list of available printers on your system.
When non--nil let you choose a printer to print file.
Otherwise when nil the variable `printer-name' will be used.
On Unix based systems (lpstat command needed) you don't need to set this,
`anything-ff-find-printers' will find a list of available printers for you.</span>"
  :type 'list
  :group 'anything-config)

(defcustom anything-ff-transformer-show-only-basename nil
  "<span class="quote">Show only basename of candidates in `anything-find-files'.
This can be toggled at anytime from `anything-find-files' with \
\\&lt;anything-find-files-map&gt;0\\[anything-ff-run-toggle-basename].</span>"
  :type 'boolean
  :group 'anything-config)

(defcustom anything-ff-quick-delete-dont-prompt-for-deletion nil
  "<span class="quote">Don't ask in persistent deletion of files when non--nil.</span>"
  :group 'anything-config
  :type 'boolean)

(defcustom anything-ff-signal-error-on-dot-files t
  "<span class="quote">Signal error when file is `.' or `..' on file deletion when non--nil.
Default is non--nil.
WARNING: Setting this to nil is unsafe and can cause deletion of a whole tree.</span>"
  :group 'anything-config
  :type 'boolean)

(defcustom anything-completing-read-handlers-alist
  '((describe-function . anything-completing-read-symbols)
    (describe-variable . anything-completing-read-symbols)
    (debug-on-entry . anything-completing-read-symbols)
    (find-function . anything-completing-read-symbols)
    (trace-function . anything-completing-read-symbols)
    (trace-function-background . anything-completing-read-symbols)
    (find-tag . anything-completing-read-with-cands-in-buffer)
    (ffap-alternate-file . nil))
  "<span class="quote">Alist of handlers to replace `completing-read', `read-file-name' in `ac-mode'.
Each entry is a cons cell like \(emacs_command . completing-read_handler\)
where key and value are symbols.

Each key is an Emacs command that use originaly `completing-read'.

Each value maybe an anything function that take same arguments as
`completing-read' plus NAME and BUFFER, where NAME is the name of the new
anything source and BUFFER the name of the buffer we will use.
This function prefix name must start by \"anything\".

See `anything-completing-read-symbols' for example.

If the value of an entry is nil completion will fall back to
emacs vanilla behavior.
e.g If you want to disable anything completion for `describe-function':
\(describe-function . nil\).

Ido is also supported, you can use `ido-completing-read' and
`ido-read-file-name' as value of an entry or just 'ido.
e.g ido completion for `find-file':
\(find-file . ido\)
same as
\(find-file . ido-read-file-name\)
Note that you don't need to enable `ido-mode' for this to work.</span>"
  :group 'anything-config
  :type '(alist :key-type symbol :value-type symbol))

(defcustom anything-M-x-requires-pattern 2
  "<span class="quote">Value of requires-pattern for `anything-M-x'.
Set it to 0 to disable requires-pattern in `anything-M-x'.</span>"
  :group 'anything-config
  :type 'boolean)

<span class="linecomment">;;; Build info-index sources with info-index plug-in.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-build-info-index-command (name doc source buffer)
  "<span class="quote">Define an anything command NAME with documentation DOC.
Arg SOURCE will be an existing anything source named
`anything-c-source-info-&lt;NAME&gt;' and BUFFER a string buffer name.</span>"
  (eval (list 'defun name nil doc
              (list 'interactive)
              (list 'anything
                    :sources source
                    :buffer buffer
                    :candidate-number-limit 1000))))

(defun anything-c-define-info-index-sources (var-value &optional commands)
  "<span class="quote">Define anything sources named anything-c-source-info-&lt;NAME&gt;.
Sources are generated for all entries of `anything-c-default-info-index-list'.
If COMMANDS arg is non--nil build also commands named `anything-info&lt;NAME&gt;'.
Where NAME is one of `anything-c-default-info-index-list'.</span>"
  (loop with symbols = (loop for str in var-value
                             collect
                             (intern (concat "<span class="quote">anything-c-source-info-</span>" str)))
        for sym in symbols
        for str in var-value
        do (set sym (list (cons 'name (format "<span class="quote">Info index: %s</span>" str))
                          (cons 'info-index str)))
        when commands
        do (let ((com (intern (concat "<span class="quote">anything-info-</span>" str))))
	     (anything-c-build-info-index-command com
               (format "<span class="quote">Predefined anything for %s info.</span>" str) sym
               (format "<span class="quote">*anything info %s*</span>" str)))))

(defun anything-info-index-set (var value)
  (set var value)
  (anything-c-define-info-index-sources value t))

(defcustom anything-c-default-info-index-list
  '("<span class="quote">elisp</span>" "<span class="quote">cl</span>" "<span class="quote">org</span>" "<span class="quote">gnus</span>" "<span class="quote">tramp</span>" "<span class="quote">ratpoison</span>"
    "<span class="quote">zsh</span>" "<span class="quote">bash</span>" "<span class="quote">coreutils</span>" "<span class="quote">fileutils</span>"
    "<span class="quote">find</span>" "<span class="quote">sh-utils</span>" "<span class="quote">textutils</span>" "<span class="quote">libc</span>"
    "<span class="quote">make</span>" "<span class="quote">automake</span>" "<span class="quote">autoconf</span>" "<span class="quote">emacs-lisp-intro</span>"
    "<span class="quote">emacs</span>" "<span class="quote">elib</span>" "<span class="quote">eieio</span>" "<span class="quote">gauche-refe</span>" "<span class="quote">guile</span>"
    "<span class="quote">guile-tut</span>" "<span class="quote">goops</span>" "<span class="quote">screen</span>" "<span class="quote">latex</span>" "<span class="quote">gawk</span>"
    "<span class="quote">sed</span>" "<span class="quote">m4</span>" "<span class="quote">wget</span>" "<span class="quote">binutils</span>" "<span class="quote">as</span>" "<span class="quote">bfd</span>" "<span class="quote">gprof</span>"
    "<span class="quote">ld</span>" "<span class="quote">diff</span>" "<span class="quote">flex</span>" "<span class="quote">grep</span>" "<span class="quote">gzip</span>" "<span class="quote">libtool</span>"
    "<span class="quote">texinfo</span>" "<span class="quote">info</span>" "<span class="quote">gdb</span>" "<span class="quote">stabs</span>" "<span class="quote">cvsbook</span>" "<span class="quote">cvs</span>"
    "<span class="quote">bison</span>" "<span class="quote">id-utils</span>" "<span class="quote">global</span>")
  "<span class="quote">Info Manual entries to use for building anything info index commands.</span>"
  :group 'anything-config
  :type 'list
  :set 'anything-info-index-set)

(defcustom anything-c-register-max-offset 160
  "<span class="quote">Max size of string register entries before truncating.</span>"
  :group 'anything-config
  :type 'integer)

 
<span class="linecomment">;;; General internal variables</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Some internals variable that need to be loaded</span>
<span class="linecomment">;; here to avoid compiler warnings.</span>
(defvar anything-c-external-commands-list nil
  "<span class="quote">A list of all external commands the user can execute.  If this
variable is not set by the user, it will be calculated
automatically.</span>")

(defvar anything-c-show-completion-overlay nil)


 
<span class="linecomment">;;; Faces</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defface anything-buffer-saved-out
    '((t (:foreground "<span class="quote">red</span>")))
  "<span class="quote">*Face used for buffer files modified outside of emacs.</span>"
  :group 'anything-config)

(defface anything-buffer-not-saved
    '((t (:foreground "<span class="quote">Indianred2</span>")))
  "<span class="quote">*Face used for buffer files not already saved on disk.</span>"
  :group 'anything-config)

(defface anything-ff-prefix
    '((t (:background "<span class="quote">yellow</span>" :foreground "<span class="quote">black</span>")))
  "<span class="quote">*Face used to prefix new file or url paths in `anything-find-files'.</span>"
  :group 'anything-config)

(defface anything-ff-executable
    '((t (:foreground "<span class="quote">green</span>")))
  "<span class="quote">*Face used for executable files in `anything-find-files'.</span>"
  :group 'anything-config)

(defface anything-ff-directory
    '((t (:foreground "<span class="quote">DarkRed</span>" :background "<span class="quote">LightGray</span>")))
  "<span class="quote">*Face used for directories in `anything-find-files'.</span>"
  :group 'anything-config)

(defface anything-ff-symlink
    '((t (:foreground "<span class="quote">DarkOrange</span>")))
  "<span class="quote">*Face used for symlinks in `anything-find-files'.</span>"
  :group 'anything-config)

(defface anything-ff-invalid-symlink
    '((t (:foreground "<span class="quote">black</span>" :background "<span class="quote">red</span>")))
  "<span class="quote">*Face used for invalid symlinks in `anything-find-files'.</span>"
  :group 'anything-config)

(defface anything-ff-file
    '((t (:foreground "<span class="quote">CadetBlue</span>" :underline t)))
  "<span class="quote">*Face used for file names in `anything-find-files'.</span>"
  :group 'anything-config)

(defface anything-grep-match
    '((t (:inherit match)))
  "<span class="quote">Face used to highlight grep matches.</span>"
  :group 'anything-config)

(defface anything-grep-file
    '((t (:foreground "<span class="quote">BlueViolet</span>" :underline t)))
  "<span class="quote">Face used to highlight grep results filenames.</span>"
  :group 'anything-config)

(defface anything-grep-lineno
    '((t (:foreground "<span class="quote">Darkorange1</span>")))
  "<span class="quote">Face used to highlight grep number lines.</span>"
  :group 'anything-config)

(defface anything-grep-running
    '((t (:foreground "<span class="quote">Red</span>")))
  "<span class="quote">Face used in mode line when grep is running.</span>"
  :group 'anything-config)

(defface anything-grep-finish
    '((t (:foreground "<span class="quote">Green</span>")))
  "<span class="quote">Face used in mode line when grep is finish.</span>"
  :group 'anything-config)

(defface anything-M-x-key-face '((t (:foreground "<span class="quote">orange</span>" :underline t)))
  "<span class="quote">*Face used in anything-M-x to show keybinding.</span>"
  :group 'anything)

(defface anything-bmkext-info
    '((t (:foreground "<span class="quote">green</span>")))
  "<span class="quote">*Face used for W3m Emacs bookmarks (not w3m bookmarks).</span>"
  :group 'anything)

(defface anything-bmkext-w3m
    '((t (:foreground "<span class="quote">yellow</span>")))
  "<span class="quote">*Face used for W3m Emacs bookmarks (not w3m bookmarks).</span>"
  :group 'anything)

(defface anything-bmkext-gnus
    '((t (:foreground "<span class="quote">magenta</span>")))
  "<span class="quote">*Face used for Gnus bookmarks.</span>"
  :group 'anything)

(defface anything-bmkext-man
    '((t (:foreground "<span class="quote">Orange4</span>")))
  "<span class="quote">*Face used for Woman/man bookmarks.</span>"
  :group 'anything)

(defface anything-bmkext-no--file
    '((t (:foreground "<span class="quote">grey</span>")))
  "<span class="quote">*Face used for non--file bookmarks.</span>"
  :group 'anything)

(defface anything-bmkext-file
    '((t (:foreground "<span class="quote">Deepskyblue2</span>")))
  "<span class="quote">*Face used for non--file bookmarks.</span>"
  :group 'anything)

(defface anything-bookmarks-su-face '((t (:foreground "<span class="quote">red</span>")))
  "<span class="quote">Face for su/sudo bookmarks.</span>"
  :group 'anything)

(defface anything-w3m-bookmarks-face '((t (:foreground "<span class="quote">cyan1</span>" :underline t)))
  "<span class="quote">Face for w3m bookmarks</span>" :group 'anything)

(defface anything-emms-playlist
    '((t (:foreground "<span class="quote">Springgreen4</span>" :underline t)))
  "<span class="quote">*Face used for tracks in current emms playlist.</span>"
  :group 'anything)

(defface anything-apt-installed
    '((t (:foreground "<span class="quote">green</span>")))
  "<span class="quote">*Face used for apt installed candidates.</span>"
  :group 'anything)

(defface anything-apt-deinstalled
    '((t (:foreground "<span class="quote">DimGray</span>")))
  "<span class="quote">*Face used for apt deinstalled candidates.</span>"
  :group 'anything)

(defface anything-gentoo-match-face '((t (:foreground "<span class="quote">red</span>")))
  "<span class="quote">Face for anything-gentoo installed packages.</span>"
  :group 'traverse-faces)

(defface anything-lisp-show-completion
    '((t (:background "<span class="quote">DarkSlateGray</span>")))
  "<span class="quote">*Face used for showing candidates in `anything-lisp-completion'.</span>"
  :group 'anything-config)

(defface anything-lisp-completion-info
    '((t (:foreground "<span class="quote">red</span>")))
  "<span class="quote">*Face used for showing info in `anything-lisp-completion'.</span>"
  :group 'anything-config)

(defface anything-overlay-line-face '((t (:background "<span class="quote">IndianRed4</span>" :underline t)))
  "<span class="quote">Face for source header in the anything buffer.</span>" :group 'anything)

<span class="linecomment">;;;###autoload</span>
(defun anything-configuration ()
  "<span class="quote">Customize `anything'.</span>"
  (interactive)
  (customize-group "<span class="quote">anything-config</span>"))


 
<span class="linecomment">;;; Anything-command-map</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defvar anything-command-map)
(define-prefix-command 'anything-command-map)


(define-key anything-command-map (kbd "<span class="quote">&lt;SPC&gt;</span>")     'anything-execute-anything-command)
(define-key anything-command-map (kbd "<span class="quote">a</span>")         'anything-c-apropos)
(define-key anything-command-map (kbd "<span class="quote">e</span>")         'anything-c-etags-select)
(define-key anything-command-map (kbd "<span class="quote">l</span>")         'anything-locate)
(define-key anything-command-map (kbd "<span class="quote">s</span>")         'anything-surfraw)
(define-key anything-command-map (kbd "<span class="quote">r</span>")         'anything-regexp)
(define-key anything-command-map (kbd "<span class="quote">w</span>")         'anything-w3m-bookmarks)
(define-key anything-command-map (kbd "<span class="quote">x</span>")         'anything-firefox-bookmarks)
(define-key anything-command-map (kbd "<span class="quote">#</span>")         'anything-emms)
(define-key anything-command-map (kbd "<span class="quote">m</span>")         'anything-man-woman)
(define-key anything-command-map (kbd "<span class="quote">t</span>")         'anything-top)
(define-key anything-command-map (kbd "<span class="quote">i</span>")         'anything-imenu)
(define-key anything-command-map (kbd "<span class="quote">&lt;tab&gt;</span>")     'anything-lisp-completion-at-point)
(define-key anything-command-map (kbd "<span class="quote">p</span>")         'anything-list-emacs-process)
(define-key anything-command-map (kbd "<span class="quote">C-x r b</span>")   'anything-c-pp-bookmarks)
(define-key anything-command-map (kbd "<span class="quote">M-y</span>")       'anything-show-kill-ring)
(define-key anything-command-map (kbd "<span class="quote">C-c &lt;SPC&gt;</span>") 'anything-all-mark-rings)
(define-key anything-command-map (kbd "<span class="quote">C-x C-f</span>")   'anything-find-files)
(define-key anything-command-map (kbd "<span class="quote">f</span>")         'anything-for-files)
(define-key anything-command-map (kbd "<span class="quote">C-:</span>")       'anything-eval-expression-with-eldoc)
(define-key anything-command-map (kbd "<span class="quote">C-,</span>")       'anything-calcul-expression)
(define-key anything-command-map (kbd "<span class="quote">M-x</span>")       'anything-M-x)
(define-key anything-command-map (kbd "<span class="quote">C-x C-w</span>")   'anything-write-file)
(define-key anything-command-map (kbd "<span class="quote">C-x i</span>")     'anything-insert-file)
(define-key anything-command-map (kbd "<span class="quote">M-s o</span>")     'anything-occur)
(define-key anything-command-map (kbd "<span class="quote">M-g s</span>")     'anything-do-grep)
(define-key anything-command-map (kbd "<span class="quote">c</span>")         'anything-colors)
(define-key anything-command-map (kbd "<span class="quote">F</span>")         'anything-select-xfont)
(define-key anything-command-map (kbd "<span class="quote">C-c f</span>")     'anything-recentf)
(define-key anything-command-map (kbd "<span class="quote">C-c g</span>")     'anything-google-suggest)
(define-key anything-command-map (kbd "<span class="quote">h i</span>")       'anything-info-at-point)
(define-key anything-command-map (kbd "<span class="quote">h r</span>")       'anything-info-emacs)
(define-key anything-command-map (kbd "<span class="quote">h g</span>")       'anything-info-gnus)
(define-key anything-command-map (kbd "<span class="quote">C-x C-b</span>")   'anything-buffers-list)
(define-key anything-command-map (kbd "<span class="quote">C-c C-b</span>")   'anything-browse-code)
(define-key anything-command-map (kbd "<span class="quote">C-x r i</span>")   'anything-register)
(define-key anything-command-map (kbd "<span class="quote">C-c C-x</span>")   'anything-c-run-external-command)

<span class="linecomment">;; In Emacs 23.1.50, minibuffer-local-must-match-filename-map was renamed to</span>
<span class="linecomment">;; minibuffer-local-filename-must-match-map.</span>
(defvar minibuffer-local-filename-must-match-map (make-sparse-keymap)) <span class="linecomment">;; Emacs 23.1.+</span>
(defvar minibuffer-local-must-match-filename-map (make-sparse-keymap)) <span class="linecomment">;; Older Emacsen</span>
(defvar minibuffer-inactive-mode-map (make-sparse-keymap))
(dolist (map (list minibuffer-local-filename-completion-map
                   minibuffer-local-completion-map
                   minibuffer-local-must-match-filename-map
                   minibuffer-local-filename-must-match-map
                   minibuffer-local-map
                   minibuffer-local-isearch-map
                   minibuffer-local-must-match-map
                   minibuffer-local-ns-map
                   minibuffer-inactive-mode-map
                   minibuffer-local-shell-command-map))
  (define-key map "<span class="quote">\C-r</span>" 'anything-minibuffer-history))


 
<span class="linecomment">;;; Menu</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(easy-menu-define nil global-map
  "<span class="quote">`anything' menu</span>"
  '("<span class="quote">Anything</span>"
    ["<span class="quote">All anything commands</span>" anything-execute-anything-command t]
    ["<span class="quote">Find any Files/Buffers</span>" anything-for-files t]
    ["<span class="quote">Anything Everywhere (Toggle)</span>" ac-mode t]
    "<span class="quote">----</span>"
    ("<span class="quote">Files:</span>"
     ["<span class="quote">Find files</span>" anything-find-files t]
     ["<span class="quote">Recent Files</span>" anything-recentf t]
     ["<span class="quote">Locate</span>" anything-locate t]
     ["<span class="quote">Bookmarks</span>" anything-c-pp-bookmarks t])
    ("<span class="quote">Buffers:</span>"
     ["<span class="quote">Find buffers</span>" anything-buffers-list t])
    ("<span class="quote">Commands:</span>"
     ["<span class="quote">Emacs Commands</span>" anything-M-x t]
     ["<span class="quote">Externals Commands</span>" anything-c-run-external-command t])
    ("<span class="quote">Help:</span>"
     ["<span class="quote">Anything Apropos</span>" anything-c-apropos t])
    ("<span class="quote">Info:</span>"
     ["<span class="quote">Info at point</span>" anything-info-at-point t]
     ["<span class="quote">Emacs Manual index</span>" anything-info-emacs t]
     ["<span class="quote">Gnus Manual index</span>" anything-info-gnus t])
    ("<span class="quote">Org:</span>"
     ["<span class="quote">Org keywords</span>" anything-org-keywords t]
     ["<span class="quote">Org headlines</span>" anything-org-headlines t])
    ("<span class="quote">Tools:</span>"
     ["<span class="quote">Occur</span>" anything-occur t]
     ["<span class="quote">Grep</span>" anything-do-grep t]
     ["<span class="quote">Etags</span>" anything-c-etags-select t]
     ["<span class="quote">Lisp complete at point</span>" anything-lisp-completion-at-point t]
     ["<span class="quote">Browse Kill ring</span>" anything-show-kill-ring t]
     ["<span class="quote">Browse register</span>" anything-register t]
     ["<span class="quote">Browse code</span>" anything-browse-code t]
     ["<span class="quote">Mark Ring</span>" anything-all-mark-rings t]
     ["<span class="quote">Regexp handler</span>" anything-regexp t]
     ["<span class="quote">Colors & Faces</span>" anything-colors t]
     ["<span class="quote">Show xfonts</span>" anything-select-xfont t]
     ["<span class="quote">Ucs Symbols</span>" anything-ucs t]
     ["<span class="quote">Imenu</span>" anything-imenu t]
     ["<span class="quote">Google Suggest</span>" anything-google-suggest t]
     ["<span class="quote">Eval expression</span>" anything-eval-expression-with-eldoc t]
     ["<span class="quote">Calcul expression</span>" anything-calcul-expression t]
     ["<span class="quote">Man pages</span>" anything-man-woman t]
     ["<span class="quote">Top externals process</span>" anything-top t]
     ["<span class="quote">Emacs internals process</span>" anything-list-emacs-process t])
    "<span class="quote">----</span>"
    ["<span class="quote">Prefered Options</span>" anything-configuration t]))

<span class="linecomment">;;; Anything map add ons</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(define-key anything-map (kbd "<span class="quote">C-x C-f</span>") 'anything-quit-and-find-file)
(define-key anything-map (kbd "<span class="quote">M-m</span>")     'anything-toggle-all-marks)
(define-key anything-map (kbd "<span class="quote">C-w</span>")     'anything-yank-text-at-point)

 
<span class="linecomment">;;; Specialized keymaps</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-make-child-map (parent)
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map parent)
    map))

(defvar anything-c-buffer-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">C-c ?</span>")     'anything-c-buffer-help)
    <span class="linecomment">;; No need to have separate command for grep and zgrep</span>
    <span class="linecomment">;; as we don't use recursivity for buffers.</span>
    <span class="linecomment">;; So use zgrep for both as it is capable to handle non--compressed files.</span>
    (define-key map (kbd "<span class="quote">M-g s</span>")     'anything-buffer-run-zgrep)
    (define-key map (kbd "<span class="quote">C-c o</span>")     'anything-buffer-switch-other-window)
    (define-key map (kbd "<span class="quote">C-c C-o</span>")   'anything-buffer-switch-other-frame)
    (define-key map (kbd "<span class="quote">C-c =</span>")     'anything-buffer-run-ediff)
    (define-key map (kbd "<span class="quote">M-=</span>")       'anything-buffer-run-ediff-merge)
    (define-key map (kbd "<span class="quote">C-=</span>")       'anything-buffer-diff-persistent)
    (define-key map (kbd "<span class="quote">M-U</span>")       'anything-buffer-revert-persistent)
    (define-key map (kbd "<span class="quote">M-D</span>")       'anything-buffer-run-kill-buffers)
    (define-key map (kbd "<span class="quote">C-x C-s</span>")   'anything-buffer-save-persistent)
    (define-key map (kbd "<span class="quote">C-M-%</span>")     'anything-buffer-run-query-replace-regexp)
    (define-key map (kbd "<span class="quote">M-%</span>")       'anything-buffer-run-query-replace)
    (define-key map (kbd "<span class="quote">M-m</span>")       'anything-toggle-all-marks)
    (define-key map (kbd "<span class="quote">M-a</span>")       'anything-mark-all)
    (when (locate-library "<span class="quote">elscreen</span>")
      (define-key map (kbd "<span class="quote">&lt;C-tab&gt;</span>") 'anything-buffer-switch-to-elscreen))
    (delq nil map))
  "<span class="quote">Keymap for buffer sources in anything.</span>")

(defvar anything-find-files-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">C-]</span>")           'anything-ff-run-toggle-basename)
    (define-key map (kbd "<span class="quote">C-x C-f</span>")       'anything-ff-run-locate)
    (define-key map (kbd "<span class="quote">M-g s</span>")         'anything-ff-run-grep)
    (define-key map (kbd "<span class="quote">M-g p</span>")         'anything-ff-run-pdfgrep)
    (define-key map (kbd "<span class="quote">M-g z</span>")         'anything-ff-run-zgrep)
    (define-key map (kbd "<span class="quote">M-.</span>")           'anything-ff-run-etags)
    (define-key map (kbd "<span class="quote">M-R</span>")           'anything-ff-run-rename-file)
    (define-key map (kbd "<span class="quote">M-C</span>")           'anything-ff-run-copy-file)
    (define-key map (kbd "<span class="quote">M-B</span>")           'anything-ff-run-byte-compile-file)
    (define-key map (kbd "<span class="quote">M-L</span>")           'anything-ff-run-load-file)
    (define-key map (kbd "<span class="quote">M-S</span>")           'anything-ff-run-symlink-file)
    (define-key map (kbd "<span class="quote">M-H</span>")           'anything-ff-run-hardlink-file)
    (define-key map (kbd "<span class="quote">M-D</span>")           'anything-ff-run-delete-file)
    (define-key map (kbd "<span class="quote">M-K</span>")           'anything-ff-run-kill-buffer-persistent)
    (define-key map (kbd "<span class="quote">C-d</span>")           'anything-ff-persistent-delete)
    (define-key map (kbd "<span class="quote">M-e</span>")           'anything-ff-run-switch-to-eshell)
    (define-key map (kbd "<span class="quote">&lt;M-tab&gt;</span>")       'anything-ff-run-complete-fn-at-point)
    (define-key map (kbd "<span class="quote">C-c o</span>")         'anything-ff-run-switch-other-window)
    (define-key map (kbd "<span class="quote">C-c C-o</span>")       'anything-ff-run-switch-other-frame)
    (define-key map (kbd "<span class="quote">C-c C-x</span>")       'anything-ff-run-open-file-externally)
    (define-key map (kbd "<span class="quote">M-!</span>")           'anything-ff-run-eshell-command-on-file)
    (define-key map (kbd "<span class="quote">C-=</span>")           'anything-ff-run-ediff-file)
    (define-key map (kbd "<span class="quote">C-c =</span>")         'anything-ff-run-ediff-merge-file)
    (define-key map (kbd "<span class="quote">M-p</span>")           'anything-ff-run-switch-to-history)
    (define-key map (kbd "<span class="quote">M-i</span>")           'anything-ff-properties-persistent)
    (define-key map (kbd "<span class="quote">C-c ?</span>")         'anything-ff-help)
    (define-key map (kbd "<span class="quote">C-}</span>")           'anything-narrow-window)
    (define-key map (kbd "<span class="quote">C-{</span>")           'anything-enlarge-window)
    (define-key map (kbd "<span class="quote">C-&lt;backspace&gt;</span>") 'anything-ff-run-toggle-auto-update)
    (define-key map (kbd "<span class="quote">M-a</span>")           'anything-mark-all)
    (define-key map (kbd "<span class="quote">M-m</span>")           'anything-toggle-all-marks)
    (define-key map (kbd "<span class="quote">M-u</span>")           'anything-unmark-all)
    (define-key map (kbd "<span class="quote">C-c C-a</span>")       'anything-ff-run-gnus-attach-files)
    (define-key map (kbd "<span class="quote">C-c p</span>")         'anything-ff-run-print-file)
    <span class="linecomment">;; Next 2 have no effect if candidate is not an image file.</span>
    (define-key map (kbd "<span class="quote">M-l</span>")           'anything-ff-rotate-left-persistent)
    (define-key map (kbd "<span class="quote">M-r</span>")           'anything-ff-rotate-right-persistent)
    (define-key map (kbd "<span class="quote">C-.</span>")           'anything-find-files-down-one-level)
    (define-key map (kbd "<span class="quote">C-l</span>")           'anything-find-files-down-one-level)
    (define-key map (kbd "<span class="quote">C-h C-b</span>")       'anything-send-bug-report-from-anything)
    (define-key map (kbd "<span class="quote">C-h C-d</span>")       'anything-debug-output)
    (when anything-ff-lynx-style-map
      (define-key map (kbd "<span class="quote">&lt;left&gt;</span>")      'anything-find-files-down-one-level)
      (define-key map (kbd "<span class="quote">&lt;right&gt;</span>")     'anything-execute-persistent-action))
    (delq nil map))
  "<span class="quote">Keymap for `anything-find-files'.</span>")

(defvar anything-c-read-file-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">C-]</span>")           'anything-ff-run-toggle-basename)
    (define-key map (kbd "<span class="quote">C-.</span>")           'anything-find-files-down-one-level)
    (define-key map (kbd "<span class="quote">C-l</span>")           'anything-find-files-down-one-level)
    (define-key map (kbd "<span class="quote">C-&lt;backspace&gt;</span>") 'anything-ff-run-toggle-auto-update)
    (define-key map (kbd "<span class="quote">C-c ?</span>")         'anything-read-file-name-help)
    (when anything-ff-lynx-style-map
      (define-key map (kbd "<span class="quote">&lt;left&gt;</span>")      'anything-find-files-down-one-level)
      (define-key map (kbd "<span class="quote">&lt;right&gt;</span>")     'anything-execute-persistent-action)
      (define-key map (kbd "<span class="quote">C-o</span>")         nil)
      (define-key map (kbd "<span class="quote">&lt;M-left&gt;</span>")    'anything-previous-source)
      (define-key map (kbd "<span class="quote">&lt;M-right&gt;</span>")   'anything-next-source))
    (delq nil map))
  "<span class="quote">Keymap for `anything-c-read-file-name'.</span>")

(defvar anything-generic-files-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">M-g s</span>")   'anything-ff-run-grep)
    (define-key map (kbd "<span class="quote">M-g z</span>")   'anything-ff-run-zgrep)
    (define-key map (kbd "<span class="quote">M-g p</span>")   'anything-ff-run-pdfgrep)
    (define-key map (kbd "<span class="quote">M-D</span>")     'anything-ff-run-delete-file)
    (define-key map (kbd "<span class="quote">C-=</span>")     'anything-ff-run-ediff-file)
    (define-key map (kbd "<span class="quote">C-c =</span>")   'anything-ff-run-ediff-merge-file)
    (define-key map (kbd "<span class="quote">C-c o</span>")   'anything-ff-run-switch-other-window)
    (define-key map (kbd "<span class="quote">M-i</span>")     'anything-ff-properties-persistent)
    (define-key map (kbd "<span class="quote">C-c C-x</span>") 'anything-ff-run-open-file-externally)
    (define-key map (kbd "<span class="quote">C-w</span>")     'anything-yank-text-at-point)
    (define-key map (kbd "<span class="quote">C-c ?</span>")   'anything-generic-file-help)
    map)
  "<span class="quote">Generic Keymap for files.</span>")

(defvar anything-c-grep-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">M-&lt;down&gt;</span>") 'anything-c-goto-next-file)
    (define-key map (kbd "<span class="quote">M-&lt;up&gt;</span>")   'anything-c-goto-precedent-file)
    (define-key map (kbd "<span class="quote">C-c o</span>")    'anything-c-grep-run-other-window-action)
    (define-key map (kbd "<span class="quote">C-w</span>")      'anything-yank-text-at-point)
    (define-key map (kbd "<span class="quote">C-x C-s</span>")  'anything-c-grep-run-save-buffer)
    (when anything-c-grep-use-ioccur-style-keys
      (define-key map (kbd "<span class="quote">&lt;right&gt;</span>")  'anything-c-grep-run-persistent-action)
      (define-key map (kbd "<span class="quote">&lt;left&gt;</span>")  'anything-c-grep-run-default-action))
    (define-key map (kbd "<span class="quote">C-c ?</span>")    'anything-grep-help)
    (delq nil map))
  "<span class="quote">Keymap used in Grep sources.</span>")

(defvar anything-c-pdfgrep-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">M-&lt;down&gt;</span>") 'anything-c-goto-next-file)
    (define-key map (kbd "<span class="quote">M-&lt;up&gt;</span>")   'anything-c-goto-precedent-file)
    (define-key map (kbd "<span class="quote">C-w</span>")      'anything-yank-text-at-point)
    (define-key map (kbd "<span class="quote">C-c ?</span>")    'anything-pdfgrep-help)
    map)
  "<span class="quote">Keymap used in pdfgrep.</span>")

(defvar anything-c-etags-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">M-&lt;down&gt;</span>") 'anything-c-goto-next-file)
    (define-key map (kbd "<span class="quote">M-&lt;up&gt;</span>")   'anything-c-goto-precedent-file)
    (define-key map (kbd "<span class="quote">C-w</span>")      'anything-yank-text-at-point)
    (define-key map (kbd "<span class="quote">C-c ?</span>")    'anything-etags-help)
    map)
  "<span class="quote">Keymap used in Etags.</span>")

(defvar anything-eval-expression-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">&lt;C-return&gt;</span>") 'anything-eval-new-line-and-indent)
    (define-key map (kbd "<span class="quote">&lt;tab&gt;</span>")      'lisp-indent-line)
    (define-key map (kbd "<span class="quote">&lt;C-tab&gt;</span>")    'lisp-complete-symbol)
    (define-key map (kbd "<span class="quote">C-p</span>")        'previous-line)
    (define-key map (kbd "<span class="quote">C-n</span>")        'next-line)
    (define-key map (kbd "<span class="quote">&lt;up&gt;</span>")       'previous-line)
    (define-key map (kbd "<span class="quote">&lt;down&gt;</span>")     'next-line)
    (define-key map (kbd "<span class="quote">&lt;right&gt;</span>")    'forward-char)
    (define-key map (kbd "<span class="quote">&lt;left&gt;</span>")     'backward-char)
    map))

(defvar anything-c-ucs-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">&lt;C-backspace&gt;</span>") 'anything-c-ucs-persistent-delete)
    (define-key map (kbd "<span class="quote">&lt;C-left&gt;</span>")      'anything-c-ucs-persistent-backward)
    (define-key map (kbd "<span class="quote">&lt;C-right&gt;</span>")     'anything-c-ucs-persistent-forward)
    (define-key map (kbd "<span class="quote">&lt;C-return&gt;</span>")    'anything-c-ucs-persistent-insert)
    (define-key map (kbd "<span class="quote">C-c ?</span>")         'anything-c-ucs-help)
    map)
  "<span class="quote">Keymap for `anything-ucs'.</span>")

(defvar anything-c-bookmark-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">C-c o</span>") 'anything-c-bookmark-run-jump-other-window)
    (define-key map (kbd "<span class="quote">C-d</span>")   'anything-c-bookmark-run-delete)
    (when (locate-library "<span class="quote">bookmark-extensions</span>")
      (define-key map (kbd "<span class="quote">M-e</span>") 'anything-c-bmkext-run-edit))
    (define-key map (kbd "<span class="quote">C-c ?</span>") 'anything-c-bookmark-help)
    (delq nil map))
  "<span class="quote">Generic Keymap for emacs bookmark sources.</span>")

(defvar anything-esh-on-file-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">C-c ?</span>")    'anything-esh-help)
    map)
  "<span class="quote">Keymap for `anything-find-files-eshell-command-on-file'.</span>")

(defvar anything-eshell-history-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">M-p</span>") 'anything-next-line)
    map)
  "<span class="quote">Keymap for `anything-eshell-history'.</span>")

(defvar anything-kill-ring-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">M-y</span>") 'anything-next-line)
    (define-key map (kbd "<span class="quote">M-u</span>") 'anything-previous-line)
    map)
  "<span class="quote">Keymap for `anything-show-kill-ring'.</span>")

(defvar anything-occur-map
  (let ((map (anything-c-make-child-map anything-map)))
    (define-key map (kbd "<span class="quote">C-M-%</span>") 'anything-occur-run-query-replace-regexp)
    map)
  "<span class="quote">Keymap for `anything-occur'.</span>")

 
<span class="linecomment">;;; Embeded documentation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-list-preconfigured-anything ()
  "<span class="quote">Collect preconfigured anything functions in this file.</span>"
  (loop with doc
        with sym
        for entry in (cdr (assoc
                           (file-truename (locate-library "<span class="quote">anything-config</span>"))
                           load-history))
        if (and (consp entry)
                (eq (car entry) 'defun)
                (string-match "<span class="quote">^Preconfigured.+$</span>"
                              (setq doc (or (documentation (setq sym (cdr entry)))
                                            "<span class="quote"></span>"))))
        collect (cons sym (match-string 0 doc))))

(defun anything-c-format-preconfigured-anything ()
  (mapcar (lambda (x) (format "<span class="quote">\\[%s] : %s\n</span>" (car x) (cdr x)))
          (anything-c-list-preconfigured-anything)))

<span class="linecomment">;;; Global help message - Used by `anything-help'</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(setq anything-help-message
      (lambda ()
        (concat
         "<span class="quote">\\&lt;anything-map&gt;</span>"
         "<span class="quote">`anything' is QuickSilver-like candidate-selection framework.

Narrow the list by typing some pattern,
Multiple patterns are allowed by splitting by space.
Select with natural Emacs operations, choose with RET.

If you have any problems, press C-c C-x C-b!!
Feel free to send bug reports. I'll fix them.
The steps are described in the beginning of anything.el file.

== Basic Operations ==
C-p, Up: Previous Line
C-n, Down : Next Line
M-v, PageUp : Previous Page
C-v, PageDown : Next Page
Enter : Execute first (default) action / Select
M-&lt; : First Line
M-&gt; : Last Line
M-PageUp, C-M-S-v, C-M-y : Previous Page (other-window)
M-PageDown, C-M-v : Next Page (other-window)

Tab, C-i : Show action list
Left : Previous Source
Right, C-o : Next Source
C-k : Delete pattern
C-z : Persistent Action (Execute action with anything session kept)
C-c C-x C-b: Send a bug report

== Shortcuts For 2nd/3rd Action ==
\\[anything-select-2nd-action-or-end-of-line] : Execute 2nd Action (if the minibuffer cursor is at end of line)
\\[anything-select-3rd-action] : Execute 3rd Action

== Visible Marks ==
Visible marks store candidate. Some actions uses marked candidates.

\\[anything-toggle-visible-mark] : Toggle Visible Mark
\\[anything-prev-visible-mark] : Previous Mark
\\[anything-next-visible-mark] : Next Mark

== Miscellaneous Commands ==
\\[anything-toggle-resplit-window] : Toggle vertical/horizontal split anything window
\\[anything-quit-and-find-file] : Drop into `find-file'
\\[anything-delete-current-selection] : Delete Selected Item (visually)
\\[anything-kill-selection-and-quit] : Set Item Into the kill-ring And Quit
\\[anything-yank-selection] : Yank Selected Item Into Pattern
\\[anything-follow-mode] : Toggle Automatical Execution Of Persistent Action
\\[anything-force-update] : Recalculate And Redisplay Candidates

== Global Commands ==
\\&lt;global-map&gt;\\[anything-resume] revives last `anything' session.
It is very useful, so you should bind any key.

Single source is executed by \\[anything-call-source].

== Preconfigured `anything' ==
Preconfigured `anything' is commands that uses `anything' interface.
You can use them without configuration.

</span>"
         (apply 'concat (anything-c-format-preconfigured-anything))
         "<span class="quote">
Enjoy!</span>")))

<span class="linecomment">;;; `anything-buffer-list' help</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-buffer-help-message
  "<span class="quote">== Anything Buffer ==
\nTips:
You can enter a partial name of major-mode (e.g lisp, sh) to narrow down buffers.
Enter then a space and a pattern to narrow down to buffers matching this pattern. 
\nSpecific commands for `anything-buffers-list':
\\&lt;anything-c-buffer-map&gt;
\\[anything-buffer-run-zgrep]\t\t-&gt;Grep Buffer(s) works as zgrep too. (C-u grep all buffers but non--file buffers).
\\[anything-buffer-switch-other-window]\t\t-&gt;Switch other window.
\\[anything-buffer-switch-other-frame]\t\t-&gt;Switch other frame.
\\[anything-buffer-run-query-replace-regexp]\t\t-&gt;Query replace regexp in marked buffers.
\\[anything-buffer-run-query-replace]\t\t-&gt;Query replace in marked buffers.
\\[anything-buffer-switch-to-elscreen]\t\t-&gt;Find buffer in Elscreen.
\\[anything-buffer-run-ediff]\t\t-&gt;Ediff current buffer with candidate.  If two marked buffers ediff those buffers.
\\[anything-buffer-run-ediff-merge]\t\t-&gt;Ediff merge current buffer with candidate.  If two marked buffers ediff merge those buffers.
\\[anything-buffer-diff-persistent]\t\t-&gt;Toggle Diff buffer with saved file without quitting.
\\[anything-buffer-revert-persistent]\t\t-&gt;Revert buffer without quitting.
\\[anything-buffer-save-persistent]\t\t-&gt;Save buffer without quitting.
\\[anything-buffer-run-kill-buffers]\t\t-&gt;Delete marked buffers and quit.
\\[anything-toggle-all-marks]\t\t-&gt;Toggle all marks.
\\[anything-mark-all]\t\t-&gt;Mark all.
\\[anything-c-buffer-help]\t\t-&gt;Display this help.
\n== Anything Map ==
\\{anything-map}</span>")

<span class="linecomment">;;;###autoload</span>
(defun anything-c-buffer-help ()
  "<span class="quote">Help command for anything buffers.</span>"
  (interactive)
  (let ((anything-help-message anything-c-buffer-help-message))
    (anything-help)))

<span class="linecomment">;;; Find files help (`anything-find-files')</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-ff-help-message
  "<span class="quote">== Anything Find Files ==
\nTips:
\n- Enter `~/' at end of pattern to quickly reach home directory.
- Enter `/' at end of pattern to quickly reach root of your file system.
- Enter `./' at end of pattern to quickly reach `default-directory' (initial start of session).
- You can complete with partial basename \(e.g \"fb\" will complete \"foobar\"\).
- Use `C-u C-z' to watch an image.
- To browse images directories turn on `anything-follow-mode' and navigate with arrow keys.
- When entered ediff, hitting `C-g' will ask you to use locate to find the file to ediff with.
 
\nSpecific commands for `anything-find-files':
\\&lt;anything-find-files-map&gt;
\\[anything-ff-run-locate]\t\t-&gt;Run Locate on basename of candidate (C-u to specify locate db).
\\[anything-ff-run-grep]\t\t-&gt;Run Grep (C-u Recursive).
\\[anything-ff-run-pdfgrep]\t\t-&gt;Run Pdfgrep on marked files.
\\[anything-ff-run-zgrep]\t\t-&gt;Run zgrep (C-u Recursive).
\\[anything-ff-run-etags]\t\t-&gt;Run Etags (C-u use thing-at-point `C-u C-u' reload cache)
\\[anything-ff-run-rename-file]\t\t-&gt;Rename File (C-u Follow).
\\[anything-ff-run-copy-file]\t\t-&gt;Copy File (C-u Follow).
\\[anything-ff-run-byte-compile-file]\t\t-&gt;Byte Compile File (C-u Load).
\\[anything-ff-run-load-file]\t\t-&gt;Load File.
\\[anything-ff-run-symlink-file]\t\t-&gt;Symlink File.
\\[anything-ff-run-hardlink-file]\t\t-&gt;Hardlink file.
\\[anything-ff-run-delete-file]\t\t-&gt;Delete File.
\\[anything-ff-run-kill-buffer-persistent]\t\t-&gt;Kill buffer candidate without quitting.
\\[anything-ff-persistent-delete]\t\t-&gt;Delete file without quitting.
\\[anything-ff-run-switch-to-eshell]\t\t-&gt;Switch to Eshell.
\\[anything-ff-run-eshell-command-on-file]\t\t-&gt;Eshell command on file (C-u Run on all marked files at once).
\\[anything-ff-run-ediff-file]\t\t-&gt;Ediff file.
\\[anything-ff-run-ediff-merge-file]\t\t-&gt;Ediff merge file.
\\[anything-ff-run-complete-fn-at-point]\t\t-&gt;Complete file name at point.
\\[anything-ff-run-switch-other-window]\t\t-&gt;Switch other window.
\\[anything-ff-run-switch-other-frame]\t\t-&gt;Switch other frame.
\\[anything-ff-run-open-file-externally]\t\t-&gt;Open file with external program (C-u to choose).
\\[anything-ff-rotate-left-persistent]\t\t-&gt;Rotate Image Left.
\\[anything-ff-rotate-right-persistent]\t\t-&gt;Rotate Image Right.
\\[anything-find-files-down-one-level]\t\t-&gt;Go down precedent directory.
\\[anything-ff-run-switch-to-history]\t\t-&gt;Switch to anything find-files history.
\\[anything-ff-properties-persistent]\t\t-&gt;Show file properties in a tooltip.
\\[anything-mark-all]\t\t-&gt;Mark all visibles candidates.
\\[anything-ff-run-toggle-auto-update]\t-&gt;Toggle auto expansion of directories.
\\[anything-unmark-all]\t\t-&gt;Unmark all candidates, visibles and invisibles.
\\[anything-ff-run-gnus-attach-files]\t\t-&gt;Gnus attach files to message buffer.
\\[anything-ff-run-print-file]\t\t-&gt;Print file, (C-u to refresh printers list).
\\[anything-enlarge-window]\t\t-&gt;Enlarge anything window.
\\[anything-narrow-window]\t\t-&gt;Narrow anything window.
\\[anything-ff-run-toggle-basename]\t\t-&gt;Toggle basename/fullpath.
\\[anything-send-bug-report-from-anything]\t\t-&gt;Send Bug report.
\\[anything-ff-help]\t\t-&gt;Display this help info.
\n== Anything Map ==
\\{anything-map}</span>")

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-help ()
  "<span class="quote">Help command for `anything-find-files'.</span>"
  (interactive)
  (let ((anything-help-message anything-ff-help-message))
    (anything-help)))

<span class="linecomment">;;; Help for `anything-c-read-file-name'</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-read-file-name-help-message
  "<span class="quote">== Anything read file name Map ==\
\nSpecific commands for anything-c-read-file-name:
\\&lt;anything-c-read-file-map&gt;
\\[anything-find-files-down-one-level]\t\t-&gt;Go down precedent directory.
\\[anything-ff-run-toggle-auto-update]\t-&gt;Toggle auto expansion of directories.
\\[anything-next-source]\t-&gt;Goto next source.
\\[anything-previous-source]\t-&gt;Goto previous source.
\\[anything-read-file-name-help]\t\t-&gt;Display this help info.
\n== Anything Map ==
\\{anything-map}</span>")
  
<span class="linecomment">;;;###autoload</span>
(defun anything-read-file-name-help ()
  (interactive)
  (let ((anything-help-message anything-read-file-name-help-message))
    (anything-help)))

<span class="linecomment">;;; Generic file help - Used by locate.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-generic-file-help-message
  "<span class="quote">== Anything Generic files Map ==\
\nSpecific commands for anything locate and others files sources:
\\&lt;anything-generic-files-map&gt;
\\[anything-ff-run-grep]\t\t-&gt;Run grep (C-u recurse).
\\[anything-ff-run-pdfgrep]\t\t-&gt;Run Pdfgrep on marked files.
\\[anything-ff-run-delete-file]\t\t-&gt;Delete file.
\\[anything-ff-run-ediff-file]\t\t-&gt;Ediff file.
\\[anything-ff-run-ediff-merge-file]\t\t-&gt;Ediff merge file.
\\[anything-ff-run-switch-other-window]\t\t-&gt;Switch other window.
\\[anything-ff-properties-persistent]\t\t-&gt;Show file properties.
\\[anything-yank-text-at-point]\t\t-&gt;Yank text at point.
\\[anything-ff-run-open-file-externally]\t\t-&gt;Open file with external program (C-u to choose).
\nLocate tips:
You can add after writing search pattern any of the locate command line options.
e.g -b, -e, -n &lt;number&gt;...etc.
See Man locate for more infos.
\n== Anything Map ==
\\{anything-map}</span>")

<span class="linecomment">;;;###autoload</span>
(defun anything-generic-file-help ()
  (interactive)
  (let ((anything-help-message anything-generic-file-help-message))
    (anything-help)))

<span class="linecomment">;;; Grep help</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-grep-help-message
  "<span class="quote">== Anything Grep Map ==\
\nAnything Grep tips:
You can start grep with a prefix arg to recurse in subdirectories.
You can use wild card when selecting files (e.g *.el)
You can grep in many differents directories by marking files or wild cards.
You can save your results in a grep-mode buffer, see below.

\nSpecific commands for Anything Grep:
\\&lt;anything-c-grep-map&gt;
\\[anything-c-goto-next-file]\t-&gt;Next File.
\\[anything-c-goto-precedent-file]\t\t-&gt;Precedent File.
\\[anything-yank-text-at-point]\t\t-&gt;Yank Text at point in minibuffer.
\\[anything-c-grep-run-other-window-action]\t\t-&gt;Jump other window.
\\[anything-c-grep-run-persistent-action]\t\t-&gt;Run persistent action (Same as `C-z').
\\[anything-c-grep-run-default-action]\t\t-&gt;Run default action (Same as RET).
\\[anything-c-grep-run-save-buffer]\t\t-&gt;Save to a `grep-mode' enabled buffer.
\\[anything-grep-help]\t\t-&gt;Show this help.
\n== Anything Map ==
\\{anything-map}</span>")
  
<span class="linecomment">;;;###autoload</span>
(defun anything-grep-help ()
  (interactive)
  (let ((anything-help-message anything-grep-help-message))
    (anything-help)))

<span class="linecomment">;;; Pdf grep help</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-pdfgrep-help-message
  "<span class="quote">== Anything PdfGrep Map ==\
\nSpecific commands for Pdf Grep:
\\&lt;anything-c-pdfgrep-map&gt;
\\[anything-c-goto-next-file]\t-&gt;Next File.
\\[anything-c-goto-precedent-file]\t\t-&gt;Precedent File.
\\[anything-yank-text-at-point]\t\t-&gt;Yank Text at point in minibuffer.
\\[anything-pdfgrep-help]\t\t-&gt;Show this help.
\n== Anything Map ==
\\{anything-map}</span>")
  
<span class="linecomment">;;;###autoload</span>
(defun anything-pdfgrep-help ()
  (interactive)
  (let ((anything-help-message anything-pdfgrep-help-message))
    (anything-help)))

<span class="linecomment">;;; Etags help</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-etags-help-message
  "<span class="quote">== Anything Etags Map ==\
\nSpecific commands for Etags:
\\&lt;anything-c-etags-map&gt;
\\[anything-c-goto-next-file]\t-&gt;Next File.
\\[anything-c-goto-precedent-file]\t\t-&gt;Precedent File.
\\[anything-yank-text-at-point]\t\t-&gt;Yank Text at point in minibuffer.
\\[anything-etags-help]\t\t-&gt;Show this help.
\n== Anything Map ==
\\{anything-map}</span>")

<span class="linecomment">;;;###autoload</span>
(defun anything-etags-help ()
  "<span class="quote">The help function for etags.</span>"
  (interactive)
  (let ((anything-help-message anything-etags-help-message))
    (anything-help)))

<span class="linecomment">;;; Ucs help</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-ucs-help-message
  "<span class="quote">== Anything Ucs ==
\nSpecific commands for `anything-ucs':
\\&lt;anything-c-ucs-map&gt;
\\[anything-c-ucs-persistent-insert]\t-&gt;Insert char.
\\[anything-c-ucs-persistent-forward]\t-&gt;Forward char.
\\[anything-c-ucs-persistent-backward]\t-&gt;Backward char.
\\[anything-c-ucs-persistent-delete]\t-&gt;Delete char backward.
\\[anything-c-ucs-help]\t\t-&gt;Show this help.

\n== Anything Map ==
\\{anything-map}</span>")
  
(defun anything-c-ucs-help ()
  "<span class="quote">Help command for `anything-ucs'.</span>"
  (interactive)
  (let ((anything-help-message anything-c-ucs-help-message))
    (anything-help)))

<span class="linecomment">;;; Bookmark help</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-bookmark-help-message
  "<span class="quote">== Anything bookmark name Map ==\
\nSpecific commands for bookmarks:
\\&lt;anything-c-bookmark-map&gt;
\\[anything-c-bookmark-run-jump-other-window]\t\t-&gt;Jump other window.
\\[anything-c-bookmark-run-delete]\t\t-&gt;Delete bookmark.
\\[anything-c-bmkext-run-edit]\t\t-&gt;Edit bookmark (only for bmkext).
\\[anything-c-bookmark-help]\t\t-&gt;Run this help.
\n== Anything Map ==
\\{anything-map}</span>")

(defun anything-c-bookmark-help ()
  "<span class="quote">Help command for bookmarks.</span>"
  (interactive)
  (let ((anything-help-message anything-bookmark-help-message))
    (anything-help)))

<span class="linecomment">;;; Eshell command on file help</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-esh-help-message
  "<span class="quote">== Anything eshell on file ==
\nTips:

- Passing extra args after filename:

Normally your command or alias will be called with file as argument.

e.g &lt;command&gt; 'candidate_file'

But you can also pass an argument or more after 'candidate_file' like this:

&lt;command&gt; %s [extra_args]\n

'candidate_file' will be inserted at '%s' and your command will look at this:

&lt;command&gt; 'candidate_file' [args]

- Specify many files as args (marked files):

e.g &lt;command&gt; file1 file2 ...

Please restart and use a prefix arg to call `anything-find-files-eshell-command-on-file'.
Otherwise your command will be called many times like this:

&lt;command&gt; file1 &lt;command&gt; file2 etc...

\nSpecific commands for `anything-find-files-eshell-command-on-file':
\\&lt;anything-esh-on-file-map&gt;
\\[anything-esh-help]\t\t-&gt;Display this help.
\n== Anything Map ==
\\{anything-map}</span>")

(defun anything-esh-help ()
  "<span class="quote">Help command for `anything-find-files-eshell-command-on-file'.</span>"
  (interactive)
  (let ((anything-help-message anything-c-esh-help-message))
    (anything-help)))

 
<span class="linecomment">;;; Mode line strings</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-buffer-mode-line-string
  '("<span class="quote">Buffer(s)</span>"
    "<span class="quote">\\&lt;anything-c-buffer-map&gt;\
\\[anything-c-buffer-help]:Help, \
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct,\
\\[anything-send-bug-report-from-anything]:BugReport.</span>"
    "<span class="quote">String displayed in mode-line in `anything-c-source-buffers-list'</span>"))

(defvar anything-ff-mode-line-string
  "<span class="quote">\\&lt;anything-find-files-map&gt;\
\\[anything-ff-help]:Help, \
\\[anything-send-bug-report-from-anything]:BugReport, \
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts, \
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct</span>"
  "<span class="quote">String displayed in mode-line in `anything-c-source-find-files'</span>")

(defvar anything-read-file-name-mode-line-string
  "<span class="quote">\\&lt;anything-c-read-file-map&gt;\
\\[anything-read-file-name-help]:Help, \
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct</span>"
  "<span class="quote">String displayed in mode-line in `anything-c-source-find-files'</span>")

(defvar anything-generic-file-mode-line-string
  "<span class="quote">\\&lt;anything-generic-files-map&gt;\
\\[anything-generic-file-help]:Help, \
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct,\
\\[anything-send-bug-report-from-anything]:BugReport.</span>"
  "<span class="quote">String displayed in mode-line in Locate.</span>")

(defvar anything-grep-mode-line-string
  "<span class="quote">\\&lt;anything-c-grep-map&gt;\
\\[anything-grep-help]:Help,\
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct,\
\\[anything-send-bug-report-from-anything]:BugReport.</span>"
  "<span class="quote">String displayed in mode-line in `anything-do-grep'.</span>")

(defvar anything-pdfgrep-mode-line-string
  "<span class="quote">\\&lt;anything-c-pdfgrep-map&gt;\
\\[anything-pdfgrep-help]:Help,\
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct,\
\\[anything-send-bug-report-from-anything]:BugReport.</span>"
  "<span class="quote">String displayed in mode-line in `anything-do-pdfgrep'.</span>")

(defvar anything-etags-mode-line-string
  "<span class="quote">\\&lt;anything-c-etags-map&gt;\
\\[anything-etags-help]:Help,\
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct,\
\\[anything-send-bug-report-from-anything]:BugReport.</span>"
  "<span class="quote">String displayed in mode-line in `anything-c-etags-select'.</span>")


(defvar anything-c-ucs-mode-line-string
  "<span class="quote">\\&lt;anything-c-ucs-map&gt;\
\\[anything-c-ucs-help]:Help, \
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct.</span>"
  "<span class="quote">String displayed in mode-line in `anything-ucs'.</span>")

(defvar anything-bookmark-mode-line-string
  '("<span class="quote">Bookmark(s)</span>"
    "<span class="quote">\\&lt;anything-c-bookmark-map&gt;\
\\[anything-c-bookmark-help]:Help, \
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct,\
\\[anything-send-bug-report-from-anything]:BugReport.</span>"
    "<span class="quote">String displayed in mode-line in `anything-c-source-buffers-list'</span>"))

(defvar anything-occur-mode-line
  "<span class="quote">\\&lt;anything-map&gt;\
\\[anything-help]:Help,\
\\&lt;anything-occur-map&gt;\
\\[anything-occur-run-query-replace-regexp]:Query replace regexp,\
\\&lt;anything-map&gt;\
\\[anything-select-action]:Acts,\
\\[anything-exit-minibuffer]/\\[anything-select-2nd-action-or-end-of-line]/\
\\[anything-select-3rd-action]:NthAct,\
\\[anything-send-bug-report-from-anything]:BugReport.</span>")

 
<span class="linecomment">;;; Utilities Functions</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-ff-find-printers ()
  "<span class="quote">Return a list of available printers on Unix systems.</span>"
  (when (executable-find "<span class="quote">lpstat</span>")
    (let ((printer-list (with-temp-buffer
                          (call-process "<span class="quote">lpstat</span>" nil t nil "<span class="quote">-a</span>")
                          (split-string (buffer-string) "<span class="quote">\n</span>"))))
      (loop for p in printer-list
            for printer = (car (split-string p))
            when printer
            collect printer))))

<span class="linecomment">;; Shut up byte compiler in emacs24*.</span>
(defun anything-c-switch-to-buffer (buffer-or-name)
  "<span class="quote">Same as `switch-to-buffer' whithout warnings at compile time.</span>"
  (with-no-warnings
    (switch-to-buffer buffer-or-name)))

(defun* anything-c-position (item seq &key (test 'eq) all)
  "<span class="quote">A simple and faster replacement of CL `position'.
Return position of first occurence of ITEM found in SEQ.
Argument SEQ can be a string, in this case ITEM have to be a char.
Argument ALL, if non--nil specify to return a list of positions of
all ITEM found in SEQ.</span>"
  (let ((key (if (stringp seq) 'across 'in)))
    (eval
     `(loop for c ,key seq
            for index from 0
            when (funcall test c item)
            if all collect index into ls
            else return index
            finally return ls))))

(defun anything-c-get-pid-from-process-name (process-name)
  "<span class="quote">Get pid from running process PROCESS-NAME.</span>"
  (loop with process-list = (list-system-processes)
        for pid in process-list
        for process = (assoc-default 'comm (process-attributes pid))
        when (and process (string-match process-name process))
        return pid))

(defun* anything-current-buffer-narrowed-p (&optional
                                            (buffer anything-current-buffer))
  "<span class="quote">Check if BUFFER is narrowed.
Default is `anything-current-buffer'.</span>"
  (with-current-buffer buffer
    (let ((beg (point-min))
          (end (point-max))
          (total (buffer-size)))
      (or (/= beg 1) (/= end (1+ total))))))

(defun anything-region-active-p ()
  (and transient-mark-mode mark-active (/= (mark) (point))))

(defun anything-goto-char (loc)
  "<span class="quote">Go to char, revealing if necessary.</span>"
  (goto-char loc)
  (when (or (eq major-mode 'org-mode)
            (and (boundp 'outline-minor-mode)
                 outline-minor-mode))
    (require 'org) <span class="linecomment">; On some old Emacs versions org may not be loaded.</span>
    (org-reveal)))

(defun anything-goto-line (lineno &optional noanim show-top)
  "<span class="quote">Goto LINENO opening only outline headline if needed.
Animation is used unless NOANIM is non--nil.</span>"
  (goto-char (point-min))
  (anything-goto-char (point-at-bol lineno))
  (when show-top
    (set-window-start (get-buffer-window) (point)))
  (unless noanim
    (anything-match-line-color-current-line)
    (sit-for 0.3)
    (anything-match-line-cleanup)))

(defun anything-show-this-source-only ()
  "<span class="quote">Show all candidates of this source.</span>"
  (interactive)
  (let (anything-candidate-number-limit)
    (anything-set-source-filter
     (list (assoc-default 'name (anything-get-current-source))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-test-sources ()
  "<span class="quote">List all anything sources for test.
The output is sexps which are evaluated by \\[eval-last-sexp].</span>"
  (interactive)
  (with-output-to-temp-buffer "<span class="quote">*Anything Test Sources*</span>"
    (mapc (lambda (s) (princ (format "<span class="quote">;; (anything '%s)\n</span>" s)))
          (apropos-internal "<span class="quote">^anything-c-source</span>" #'boundp))
    (pop-to-buffer standard-output)))

(defun anything-displaying-source-names ()
  "<span class="quote">Display sources name.</span>"
  (with-current-buffer anything-buffer
    (goto-char (point-min))
    (loop with pos
          while (setq pos (next-single-property-change (point) 'anything-header))
          do (goto-char pos)
          collect (buffer-substring-no-properties (point-at-bol)(point-at-eol))
          do (forward-line 1))))

<span class="linecomment">;; [Obsolete]</span>
(defun anything-select-source ()
  "<span class="quote">[OBSOLETE] Select source.</span>"
  (interactive)
  (let ((default (assoc-default 'name (anything-get-current-source)))
        (source-names (anything-displaying-source-names))
        (all-source-names (mapcar (lambda (s) (assoc-default 'name s))
                                  (anything-get-sources))))
    (setq anything-candidate-number-limit 9999)
    (anything-aif
        (let (anything-source-filter)
          (anything-nest '(((name . "<span class="quote">Anything Source</span>")
                            (candidates . source-names)
                            (action . identity))
                           ((name . "<span class="quote">Anything Source (ALL)</span>")
                            (candidates . all-source-names)
                            (action . identity)))
                         nil "<span class="quote">Source: </span>" nil
                         default "<span class="quote">*anything select source*</span>"))
        (anything-set-source-filter (list it))
      (anything-set-source-filter nil))))

(defun anything-insert-string (str)
  "<span class="quote">Insert STR.</span>"
  (anything-set-pattern str 'noupdate))

<span class="linecomment">;;;###autoload</span>
(defun anything-insert-buffer-name ()
  "<span class="quote">Insert buffer name.</span>"
  (interactive)
  (anything-set-pattern
   (with-anything-current-buffer
     (if buffer-file-name (file-name-nondirectory buffer-file-name)
       (buffer-name)))))

(defalias 'anything-insert-symbol 'next-history-element)
(defalias 'anything-insert-selection 'anything-yank-selection)

(defun anything-c-match-on-file-name (candidate)
  "<span class="quote">Return non-nil if `anything-pattern' match basename of filename CANDIDATE.</span>"
  (string-match anything-pattern (file-name-nondirectory candidate)))

(defun anything-c-match-on-directory-name (candidate)
  "<span class="quote">Return non-nil if `anything-pattern' match directory part of CANDIDATE.</span>"
  (anything-aif (file-name-directory candidate)
      (string-match anything-pattern it)))

(defun anything-c-match-on-basename (candidate)
  "<span class="quote">Return non-nil if `anything-pattern' match basename of filename CANDIDATE.</span>"
  (string-match anything-pattern (anything-c-basename candidate)))

(defun anything-c-string-match (candidate)
  "<span class="quote">Return non-nil if `anything-pattern' match CANDIDATE.
The match is done with `string-match'.</span>"
  (string-match anything-pattern candidate))

(defun anything-c-skip-entries (list regexp)
  "<span class="quote">Remove entries which matches REGEXP from LIST.</span>"
  (remove-if (lambda (x) (and (stringp x) (string-match regexp x)))
             list))

(defun anything-c-shadow-entries (list regexp)
  "<span class="quote">Display elements of LIST matching REGEXP with the `file-name-shadow' face.</span>"
  (mapcar (lambda (file)
            <span class="linecomment">;; Add shadow face property to boring files.</span>
            (let ((face (if (facep 'file-name-shadow)
                            'file-name-shadow
                            <span class="linecomment">;; fall back to default on XEmacs</span>
                            'default)))
              (if (string-match regexp file)
                  (setq file (propertize file 'face face))))
            file)
          list))

(defsubst anything-c-stringify (str-or-sym)
  "<span class="quote">Get string of STR-OR-SYM.</span>"
  (if (stringp str-or-sym)
      str-or-sym
      (symbol-name str-or-sym)))

(defsubst anything-c-symbolify (str-or-sym)
  "<span class="quote">Get symbol of STR-OR-SYM.</span>"
  (if (symbolp str-or-sym)
      str-or-sym
      (intern str-or-sym)))

(defun anything-c-describe-function (func)
  "<span class="quote">FUNC is symbol or string.</span>"
  (describe-function (anything-c-symbolify func)))

(defun anything-c-describe-variable (var)
  "<span class="quote">VAR is symbol or string.</span>"
  (describe-variable (anything-c-symbolify var)))

(defun anything-c-find-function (func)
  "<span class="quote">FUNC is symbol or string.</span>"
  (find-function (anything-c-symbolify func)))

(defun anything-c-find-variable (var)
  "<span class="quote">VAR is symbol or string.</span>"
  (find-variable (anything-c-symbolify var)))

(defun anything-c-kill-new (candidate &optional replace)
  "<span class="quote">CANDIDATE is symbol or string.
See `kill-new' for argument REPLACE.</span>"
  (kill-new (anything-c-stringify candidate) replace))

(defun* anything-fast-remove-dups (seq &key (test 'eq))
  "<span class="quote">Remove duplicates elements in list SEQ.
This is same as `remove-duplicates' but with memoisation.
It is much faster, especially in large lists.
A test function can be provided with TEST argument key.
Default is `eq'.</span>"
  (loop with cont = (make-hash-table :test test)
        for elm in seq
        unless (gethash elm cont)
        do (puthash elm elm cont)
        finally return
        (loop for i being the hash-values in cont collect i)))

(defadvice eval-defun (after anything-source-hack activate)
  "<span class="quote">Allow immediate execution of anything source when evaling it.
See `anything-c-enable-eval-defun-hack'.</span>"
  (when anything-c-enable-eval-defun-hack
    (let ((varsym (save-excursion
                    (beginning-of-defun)
                    (forward-char 1)
                    (when (memq (read (current-buffer)) '(defvar setq))
                      (read (current-buffer))))))
      (when (string-match "<span class="quote">^anything-c-source-</span>" (symbol-name varsym))
        (anything varsym)))))
<span class="linecomment">;; (progn (ad-disable-advice 'eval-defun 'after 'anything-source-hack) (ad-update 'eval-defun))</span>


<span class="linecomment">;; Move this function from anything.el and redefine here</span>
<span class="linecomment">;; to avoid an unneeded defadvice.</span>
(defun anything-quit-and-find-file ()
  "<span class="quote">Drop into `anything-find-files' from `anything'.
If current selection is a buffer or a file, `anything-find-files'
from its directory.</span>"
  (interactive)
  (anything-run-after-quit
   (lambda (f)
     (if (file-exists-p f)
         (anything-find-files-1 (file-name-directory f)
                                (if anything-ff-transformer-show-only-basename
                                    (anything-c-basename f) f))
         (anything-find-files-1 f)))
   (anything-aif (get-buffer (anything-get-selection))
       (or (buffer-file-name it)
           (car (rassoc it dired-buffers))
           (and (with-current-buffer it
                  (eq major-mode 'org-agenda-mode))
                org-directory
                (expand-file-name org-directory))
           default-directory)
     (let ((sel (anything-get-selection)))
       (cond ((or (file-remote-p sel)
                  (file-exists-p sel))
              (expand-file-name sel))
             ((string-match ffap-url-regexp sel)
              sel)
             (t default-directory))))))


(defmacro* anything-c-walk-directory (directory &key path (directories t) match)
  "<span class="quote">Walk through DIRECTORY tree.
PATH can be one of basename, relative, or full.
DIRECTORIES when non--nil (default) return also directories names, otherwise
skip directories names.
MATCH match only filenames matching regexp MATCH.</span>"
  `(let (result
         (fn (case ,path
               (basename 'file-name-nondirectory)
               (relative 'file-relative-name)
               (full     'identity)
               (t        'file-name-nondirectory))))
     (labels ((ls-R (dir)
                (loop with ls = (directory-files dir t directory-files-no-dot-files-regexp)
                      for f in ls
                      if (file-directory-p f)
                      do (progn (when ,directories
                                  (push (funcall fn f) result))
                                <span class="linecomment">;; Don't recurse in directory symlink.</span>
                                (unless (file-symlink-p f)
                                  (ls-R f)))
                      else do 
                      (unless (and ,match (not (string-match ,match (file-name-nondirectory f))))
                        (push (funcall fn f) result)))))
       (ls-R ,directory)
       (nreverse result))))

<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Anything Applications ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

<span class="linecomment">;;; Anything regexp.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-build-regexp-history nil)
(defun anything-c-query-replace-regexp (candidate)
  "<span class="quote">Query replace regexp from `anything-regexp'.
With a prefix arg replace only matches surrounded by word boundaries,
i.e Don't replace inside a word, regexp is surrounded with \\bregexp\\b.</span>"
  (let ((regexp (funcall (anything-attr 'regexp))))
    (apply 'query-replace-regexp
           (anything-c-query-replace-args regexp))))

(defun anything-c-kill-regexp-as-sexp (candidate)
  "<span class="quote">Kill regexp in a format usable in lisp code.</span>"
  (anything-c-regexp-kill-new
   (prin1-to-string (funcall (anything-attr 'regexp)))))

(defun anything-c-kill-regexp (candidate)
  "<span class="quote">Kill regexp as it is in `anything-pattern'.</span>"
  (anything-c-regexp-kill-new (funcall (anything-attr 'regexp))))

(defun anything-c-query-replace-args (regexp)
  "<span class="quote">create arguments of `query-replace-regexp' action in `anything-regexp'.</span>"
  (let ((region-only (anything-region-active-p)))
    (list
     regexp
     (query-replace-read-to regexp
                            (format "<span class="quote">Query replace %sregexp %s</span>"
                                    (if anything-current-prefix-arg "<span class="quote">word </span>" "<span class="quote"></span>")
                                    (if region-only "<span class="quote">in region </span>" "<span class="quote"></span>"))
                            t)
     anything-current-prefix-arg
     (when region-only (region-beginning))
     (when region-only (region-end)))))

(defvar anything-c-source-regexp
  '((name . "<span class="quote">Regexp Builder</span>")
    (init . (lambda ()
              (anything-candidate-buffer anything-current-buffer)))
    (candidates-in-buffer)
    (get-line . anything-c-regexp-get-line)
    (persistent-action . anything-c-regexp-persistent-action)
    (persistent-help . "<span class="quote">Show this line</span>")
    (multiline)
    (delayed)
    (requires-pattern . 2)
    (mode-line . "<span class="quote">Press TAB to select action.</span>")
    (regexp . (lambda () anything-input))
    (action . (("<span class="quote">Kill Regexp as sexp</span>" . anything-c-kill-regexp-as-sexp)
               ("<span class="quote">Query Replace Regexp (C-u Not inside word.)</span>"
                . anything-c-query-replace-regexp)
               ("<span class="quote">Kill Regexp</span>" . anything-c-kill-regexp)))))

(defun anything-c-regexp-get-line (s e)
  (propertize
   (apply 'concat
          <span class="linecomment">;; Line contents</span>
          (format "<span class="quote">%5d: %s</span>" (line-number-at-pos (1- s)) (buffer-substring s e))
          <span class="linecomment">;; subexps</span>
          (loop for i from 0 to (1- (/ (length (match-data)) 2))
                collect (format "<span class="quote">\n         %s'%s'</span>"
                                (if (zerop i) "<span class="quote">Group 0: </span>" (format "<span class="quote">Group %d: </span>" i))
                                (match-string i))))
   <span class="linecomment">;; match beginning</span>
   <span class="linecomment">;; KLUDGE: point of anything-candidate-buffer is +1 than that of anything-current-buffer.</span>
   <span class="linecomment">;; It is implementation problem of candidates-in-buffer.</span>
   'anything-realvalue
   (1- s)))

(defun anything-c-regexp-persistent-action (pt)
  (anything-goto-char pt)
  (anything-persistent-highlight-point))

(defun anything-c-regexp-kill-new (input)
  (kill-new input)
  (message "<span class="quote">Killed: %s</span>" input))

(defun anything-quote-whitespace (candidate)
  "<span class="quote">Quote whitespace, if some, in string CANDIDATE.</span>"
  (replace-regexp-in-string "<span class="quote"> </span>" "<span class="quote">\\\\ </span>" candidate))

 
<span class="linecomment">;;; Toggle all marks.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun anything-mark-all ()
  "<span class="quote">Mark all visible unmarked candidates in current source.</span>"
  (interactive)
  (with-anything-window
    (save-excursion
      (goto-char (anything-get-previous-header-pos))
      (anything-next-line)
      (let* ((next-head (anything-get-next-header-pos))
             (end       (and next-head
                             (save-excursion
                               (goto-char next-head)
                               (forward-line -1)
                               (point))))
             (maxpoint  (or end (point-max))))
        (while (&lt; (point) maxpoint)
          (anything-mark-current-line)
          (let* ((prefix (get-text-property (point-at-bol) 'display))
                 (cand   (anything-get-selection))
                 (bn     (and (anything-file-completion-source-p)
                              (anything-c-basename cand)))
                 (src    (assoc-default 'name (anything-get-current-source))))
            (when (and (not (anything-this-visible-mark))
                       (not (or (string= prefix "<span class="quote">[?]</span>")
                                (string= prefix "<span class="quote">[@]</span>"))))
              <span class="linecomment">;; Don't mark possibles directories ending with . or ..</span>
              <span class="linecomment">;; autosave files/links and non--existent file.</span>
              (unless
                  (and (or (anything-file-completion-source-p)
                           (equal src "<span class="quote">Files from Current Directory</span>"))
                       (or (string-match "<span class="quote">^\\.#.*\\|^#.*#$\\|\\.$</span>" bn)
                           <span class="linecomment">;; We need to test here when not using a transformer</span>
                           <span class="linecomment">;; that tag prefix (i.e on tramp)</span>
                           (not (file-exists-p cand))))
                (anything-make-visible-mark))))
          (forward-line 1) (end-of-line))))
    (anything-mark-current-line)
    (message "<span class="quote">%s candidates marked</span>" (length anything-marked-candidates))))

<span class="linecomment">;;;###autoload</span>
(defun anything-unmark-all ()
  "<span class="quote">Unmark all candidates in all sources of current anything session.</span>"
  (interactive)
  (with-anything-window
    (let ((len (length anything-marked-candidates)))
      (save-excursion
        (anything-clear-visible-mark))
      (setq anything-marked-candidates nil)
      (anything-mark-current-line)
      (message "<span class="quote">%s candidates unmarked</span>" len))))

<span class="linecomment">;;;###autoload</span>
(defun anything-toggle-all-marks ()
  "<span class="quote">Toggle all marks.
Mark all visible candidates of current source or unmark all candidates
visible or invisible in all sources of current anything session</span>"
  (interactive)
  (let ((marked (anything-marked-candidates)))
    (if (and (&gt;= (length marked) 1)
             (with-anything-window anything-visible-mark-overlays))
        (anything-unmark-all)
        (anything-mark-all))))


 
<span class="linecomment">;;; Buffers</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-buffer-list ()
  "<span class="quote">Return a list of buffer names.
The first buffer in the list will be the last recently used
buffer that is not the current buffer unless
`anything-allow-skipping-current-buffer' is nil.</span>"
  (let ((buffers (mapcar 'buffer-name (buffer-list))))
    (if anything-allow-skipping-current-buffer
        (progn
          (setq buffers (remove (buffer-name anything-current-buffer) buffers))
          (append (cdr buffers) (list (car buffers))))
        buffers)))

(defvar anything-c-source-buffers
  '((name . "<span class="quote">Buffers</span>")
    (candidates . anything-c-buffer-list)
    (type . buffer)))

(defvar anything-c-source-buffer-not-found
  `((name . "<span class="quote">Create buffer</span>")
    (dummy)
    (filtered-candidate-transformer (lambda (cands source)
                                      (list anything-pattern)))
    (keymap . ,anything-map)
    (action . (lambda (candidate)
                (anything-c-switch-to-buffer (get-buffer-create candidate))))))

<span class="linecomment">;;; Buffers-list (was buffers+)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-highlight-buffers (buffers)
  "<span class="quote">Transformer function to highlight BUFFERS list.
Should be called after others transformers i.e (boring buffers).</span>"
  (loop with buflist = (if anything-allow-skipping-current-buffer
                           buffers
                           (cons (pop (cdr buffers)) buffers))
        for i in buflist
        for buf = (get-buffer i)
        for bfname = (buffer-file-name buf)
        collect
        (cond (<span class="linecomment">;; A dired buffer.</span>
               (rassoc buf dired-buffers)
               (propertize i 'face 'anything-ff-directory
                           'help-echo (car (rassoc buf dired-buffers))))
              <span class="linecomment">;; A buffer file modified somewhere outside of emacs.</span>
              ((and bfname (not (file-remote-p bfname))
                    (file-exists-p bfname)
                    (not (verify-visited-file-modtime buf)))
               (propertize i 'face 'anything-buffer-saved-out
                           'help-echo bfname))
              <span class="linecomment">;; A new buffer file not already saved on disk.</span>
              ((and bfname (not (file-remote-p bfname))
                    (not (verify-visited-file-modtime buf)))
               (propertize i 'face 'anything-buffer-not-saved
                           'help-echo bfname))
              <span class="linecomment">;; A Remote buffer file modified and not saved on disk.</span>
              ((and bfname (file-remote-p bfname) (buffer-modified-p buf))
               (let ((prefix (propertize
                              "<span class="quote"> </span>" 'display
                              (propertize "<span class="quote">@ </span>" 'face 'anything-ff-prefix))))
                 (cons (concat prefix (propertize i 'face 'anything-ff-symlink
                                                  'help-echo bfname)) i)))
              <span class="linecomment">;; A buffer file modified and not saved on disk.</span>
              ((and bfname (buffer-modified-p buf))
               (propertize i 'face 'anything-ff-symlink
                           'help-echo bfname))
              <span class="linecomment">;; A remote buffer file not modified and saved on disk.</span>
              ((and bfname (file-remote-p bfname))
               (let ((prefix (propertize
                              "<span class="quote"> </span>" 'display
                              (propertize "<span class="quote">@ </span>" 'face 'anything-ff-prefix))))
                 (cons (concat prefix (propertize i 'face 'font-lock-type-face
                                                  'help-echo bfname)) i)))
              <span class="linecomment">;; A buffer file not modified and saved on disk.</span>
              (bfname
               (propertize i 'face 'font-lock-type-face
                           'help-echo bfname))
              <span class="linecomment">;; Any non--file buffer.</span>
              (t (propertize i 'face 'italic)))))


(defvar anything-c-source-buffers-list
  `((name . "<span class="quote">Buffers</span>")
    (candidates . anything-c-buffer-list)
    (type . buffer)
    (match anything-c-buffer-match-major-mode)
    (candidate-transformer anything-c-skip-boring-buffers
                           anything-c-highlight-buffers)
    (persistent-action . anything-c-buffers-list-persistent-action)
    (keymap . ,anything-c-buffer-map)
    (volatile)
    (mode-line . anything-buffer-mode-line-string)
    (persistent-help . "<span class="quote">Show this buffer / C-u \\[anything-execute-persistent-action]: Kill this buffer</span>")))

(defvaralias 'anything-c-source-buffers+ 'anything-c-source-buffers-list)

(defun anything-c-buffer-match-major-mode (candidate)
  "<span class="quote">Match maybe buffer by major-mode.
If you give a major-mode or partial major-mode,
it will list all buffers of this major-mode and/or buffers with name
matching this major-mode.
If you add a space after major-mode and then a space,
it will match all buffers of the major-mode
before space matching pattern after space.
If you give a pattern which doesn't match a major-mode, it will search buffer
with name matching pattern.</span>"
  (let* ((cand (replace-regexp-in-string "<span class="quote">^\\s-\\{1\\}</span>" "<span class="quote"></span>" candidate))
         (buf  (get-buffer cand)))
    (when buf
      (with-current-buffer buf
        (let ((mjm   (symbol-name major-mode))
              (split (split-string anything-pattern)))
          (cond ((string-match "<span class="quote">\\s-$</span>" anything-pattern)
                 (string-match (car split) mjm))
                ((string-match "<span class="quote">\\s-</span>" anything-pattern)
                 (and (string-match (car split) mjm)
                      (string-match (cadr split) cand)))
                (t (or (string-match anything-pattern mjm)
                       (string-match anything-pattern cand)))))))))

(defun anything-c-buffer-query-replace-1 (&optional regexp-flag)
  "<span class="quote">Query replace in marked buffers.
If REGEXP-FLAG is given use `query-replace-regexp'.</span>"
  (let ((fn     (if regexp-flag 'query-replace-regexp 'query-replace))
        (prompt (if regexp-flag "<span class="quote">Query replace regexp</span>" "<span class="quote">Query replace</span>"))
        (bufs   (anything-marked-candidates)))
    (loop 
          with replace = (query-replace-read-from prompt regexp-flag)
          with tostring = (unless (consp replace)
                            (query-replace-read-to
                             replace prompt regexp-flag))
          for buf in bufs
          do
          (save-window-excursion
            (anything-c-switch-to-buffer buf)
            (save-excursion
              (let ((case-fold-search t))
                (goto-char (point-min))
                (if (consp replace)
                    (apply fn (list (car replace) (cdr replace)))
                    (apply fn (list replace tostring)))))))))

(defun anything-c-buffer-query-replace-regexp (candidate)
  (anything-c-buffer-query-replace-1 'regexp))

(defun anything-c-buffer-query-replace (candidate)
  (anything-c-buffer-query-replace-1))

(defun anything-buffer-toggle-diff (candidate)
  "<span class="quote">Toggle diff buffer CANDIDATE with it's file.</span>"
  (if (get-buffer-window "<span class="quote">*Diff*</span>")
      (kill-buffer "<span class="quote">*Diff*</span>")
      (diff-buffer-with-file (get-buffer candidate))))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-diff-persistent ()
  "<span class="quote">Toggle diff buffer without quitting anything.</span>"
  (interactive)
  (anything-attrset 'diff-action 'anything-buffer-toggle-diff)
  (anything-execute-persistent-action 'diff-action))

(defun anything-buffer-revert-and-update (candidate)
  (let ((marked (anything-marked-candidates)))
    (loop for buf in marked do (anything-revert-buffer buf))
    (anything-force-update candidate)))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-revert-persistent ()
  "<span class="quote">Revert buffer without quitting anything.</span>"
  (interactive)
  (anything-attrset 'revert-action 'anything-buffer-revert-and-update)
  (anything-execute-persistent-action 'revert-action 'onewindow))

(defun anything-buffer-save-and-update (candidate)
  (let ((marked (anything-marked-candidates))
        (enable-recursive-minibuffers t))
    (loop for buf in marked do
          (with-current-buffer (get-buffer buf)
            (save-buffer)))
    (anything-force-update candidate)))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-save-persistent ()
  "<span class="quote">Save buffer without quitting anything.</span>"
  (interactive)
  (anything-attrset 'save-action 'anything-buffer-save-and-update)
  (anything-execute-persistent-action 'save-action 'onewindow))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-run-kill-buffers ()
  "<span class="quote">Run kill buffer action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-kill-marked-buffers))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-run-grep ()
  "<span class="quote">Run Grep action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-c-grep-buffers))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-run-zgrep ()
  "<span class="quote">Run Grep action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-c-zgrep-buffers))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-run-query-replace-regexp ()
  "<span class="quote">Run Query replace regexp action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-c-buffer-query-replace-regexp))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-run-query-replace ()
  "<span class="quote">Run Query replace action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-c-buffer-query-replace))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-switch-other-window ()
  "<span class="quote">Run switch to other window action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'switch-to-buffer-other-window))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-switch-other-frame ()
  "<span class="quote">Run switch to other frame action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'switch-to-buffer-other-frame))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-switch-to-elscreen ()
  "<span class="quote">Run switch to elscreen  action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-find-buffer-on-elscreen))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffer-run-ediff ()
  "<span class="quote">Run ediff action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-ediff-marked-buffers))

(defun anything-buffer-run-ediff-merge ()
  "<span class="quote">Run ediff action from `anything-c-source-buffers-list'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-ediff-marked-buffers-merge))

(defun anything-c-buffers-persistent-kill (buffer)
  "<span class="quote">Persistent action to kill buffer.</span>"
  (with-current-buffer (get-buffer buffer)
    (if (and (buffer-modified-p)
             (buffer-file-name (current-buffer)))
        (progn
          (save-buffer)
          (kill-buffer buffer))
        (kill-buffer buffer)))
  (anything-delete-current-selection))

(defun anything-c-buffers-list-persistent-action (candidate)
  (if current-prefix-arg
      (anything-c-buffers-persistent-kill candidate)
      (anything-c-switch-to-buffer candidate)))

 
<span class="linecomment">;;;; &lt;File&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; File name history</span>
(defvar anything-c-source-file-name-history
  '((name . "<span class="quote">File Name History</span>")
    (candidates . file-name-history)
    (match anything-c-match-on-basename)
    (type . file)))

<span class="linecomment">;;; Files in current dir</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-files-in-current-dir
  '((name . "<span class="quote">Files from Current Directory</span>")
    (candidates . (lambda ()
                    (with-anything-current-buffer
                      (directory-files (anything-c-current-directory)))))
    <span class="linecomment">;; volatile is not needed, I think.</span>
    (type . file)))

(defun anything-c-highlight-files (files)
  (loop for i in files
        if (file-directory-p i)
        collect (propertize (file-name-nondirectory i)
                            'face 'anything-ff-directory
                            'help-echo (expand-file-name i))
        else
        collect (propertize (file-name-nondirectory i)
                            'face 'anything-ff-file
                            'help-echo (expand-file-name i))))

(defvar anything-c-source-files-in-current-dir+
  `((name . "<span class="quote">Files from Current Directory</span>")
    (candidates . (lambda ()
                    (with-anything-current-buffer
                      (directory-files (anything-c-current-directory) t))))
    (keymap . ,anything-generic-files-map)
    (help-message . anything-generic-file-help-message)
    (mode-line . anything-generic-file-mode-line-string)
    (candidate-transformer anything-c-highlight-files)
    <span class="linecomment">;; volatile is not needed, I think.</span>
    (type . file)))


 
<span class="linecomment">;;; Anything-find-files - The anything files browser.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Internal.</span>
(defvar anything-c-find-files-doc-header "<span class="quote"> (`C-l': Go to precedent level)</span>"
  "<span class="quote">*The doc that is inserted in the Name header of a find-files or dired source.</span>")
(defvar anything-ff-auto-update-flag nil
  "<span class="quote">Internal, flag to turn on/off auto-update in `anything-find-files'.
Don't set it directly, use instead `anything-ff-auto-update-initial-value'.</span>")
(defvar anything-ff-last-expanded nil
  "<span class="quote">Store last expanded directory or file.</span>")
(defvar anything-ff-default-directory nil)
(defvar anything-ff-history nil)
(defvar anything-ff-cand-to-mark nil)
(defvar anything-ff-url-regexp
  "<span class="quote">\\`\\(news\\(post\\)?:\\|nntp:\\|mailto:\\|file:\\|\\(ftp\\|https?\\|telnet\\|gopher\\|www\\|wais\\):/?/?\\).*</span>"
  "<span class="quote">Same as `ffap-url-regexp' but match earlier possible url.</span>")

(defvar anything-c-source-find-files
  `((name . "<span class="quote">Find Files</span>")
    (header-name . (lambda (name)
                     (concat name anything-c-find-files-doc-header)))
    <span class="linecomment">;; It is needed for filenames with capital letters</span>
    (disable-shortcuts)
    (init . (lambda ()
              (setq anything-ff-auto-update-flag
                    anything-ff-auto-update-initial-value)))
    (candidates . anything-find-files-get-candidates)
    (filtered-candidate-transformer anything-c-find-files-transformer)
    (persistent-action . anything-find-files-persistent-action)
    (persistent-help . "<span class="quote">Hit1 Expand Candidate, Hit2 or (C-u) Find file</span>")
    (mode-line . anything-ff-mode-line-string)
    (volatile)
    (candidate-number-limit . 9999)
    (action-transformer . anything-find-files-action-transformer)
    (action
     . ,(delq
         nil
         `(("<span class="quote">Find File</span>" . anything-c-find-file-or-marked)
           ("<span class="quote">Find file in Dired</span>" . anything-c-point-file-in-dired)
           ,(and (locate-library "<span class="quote">elscreen</span>")
                 '("<span class="quote">Find file in Elscreen</span>"  . anything-elscreen-find-file))
           ,(and (locate-library "<span class="quote">popwin</span>")
                 '("<span class="quote">Find file in popup window</span>" . popwin:find-file))
           ("<span class="quote">Checksum File</span>" . anything-ff-checksum)
           ("<span class="quote">Complete at point `M-tab'</span>"
            . anything-c-insert-file-name-completion-at-point)
           ("<span class="quote">Open file externally `C-c C-x, C-u to choose'</span>"
            . anything-c-open-file-externally)
           ("<span class="quote">Grep File(s) `M-g s, C-u Recurse'</span>" . anything-find-files-grep)
           ("<span class="quote">Zgrep File(s) `M-g z, C-u Recurse'</span>" . anything-ff-zgrep)
           ("<span class="quote">Switch to Eshell `M-e'</span>" . anything-ff-switch-to-eshell)
           ("<span class="quote">Etags `M-., C-u tap, C-u C-u reload tag file'</span>" . anything-ff-etags-select)
           ("<span class="quote">Eshell command on file(s) `M-!, C-u run on all marked at once.'</span>"
            . anything-find-files-eshell-command-on-file)
           ("<span class="quote">Find file as root</span>" . anything-find-file-as-root)
           ("<span class="quote">Find file in hex dump</span>" . hexl-find-file)
           ("<span class="quote">Ediff File `C-='</span>" . anything-find-files-ediff-files)
           ("<span class="quote">Ediff Merge File `C-c ='</span>" . anything-find-files-ediff-merge-files)
           ("<span class="quote">Delete File(s) `M-D'</span>" . anything-delete-marked-files)
           ("<span class="quote">Copy file(s) `M-C, C-u to follow'</span>" . anything-find-files-copy)
           ("<span class="quote">Copy file(s) Async</span>" . anything-ff-copy-async)
           ("<span class="quote">Rename file(s) `M-R, C-u to follow'</span>" . anything-find-files-rename)
           ("<span class="quote">Serial rename files</span>" . anything-ff-serial-rename)
           ("<span class="quote">Serial rename by symlinking files</span>" . anything-ff-serial-rename-by-symlink)
           ("<span class="quote">Serial rename by copying files</span>" . anything-ff-serial-rename-by-copying)
           ("<span class="quote">Symlink files(s) `M-S, C-u to follow'</span>" . anything-find-files-symlink)
           ("<span class="quote">Relsymlink file(s) `C-u to follow'</span>" . anything-find-files-relsymlink)
           ("<span class="quote">Hardlink file(s) `M-H, C-u to follow'</span>" . anything-find-files-hardlink)
           ("<span class="quote">Find file other window `C-o'</span>" . find-file-other-window)
           ("<span class="quote">Switch to history `M-p'</span>" . anything-find-files-switch-to-hist)
           ("<span class="quote">Find file other frame `C-c C-o'</span>" . find-file-other-frame)
           ("<span class="quote">Print File `C-c p, C-u to refresh'</span>" . anything-ff-print)
           ("<span class="quote">Locate `C-x C-f, C-u to specify locate db'</span>" . anything-ff-locate))))))

(defun anything-find-files-set-prompt-for-action (action files)
  "<span class="quote">Set prompt for action ACTION for FILES.</span>"
  (let ((len (length files)))
    (format "<span class="quote">%s *%s File(s)\n%s to: </span>"
            action len
            (mapconcat (lambda (f)
                         (format "<span class="quote">- %s\n</span>" f)) files "<span class="quote"></span>"))))

(defun anything-dwim-target-directory ()
  "<span class="quote">Return value of `default-directory' of buffer in other window.
If there is only one window return the value ot `default-directory'
for current buffer.</span>"
  (with-anything-current-buffer
    (let ((num-windows (length (window-list))))
      (if (&gt; num-windows 1)
          (save-selected-window
            (other-window 1)
            default-directory)
          (car anything-ff-history)))))

(defun anything-find-files-do-action (action)
  "<span class="quote">Generic function for creating action from `anything-c-source-find-files'.
ACTION must be an action supported by `anything-dired-action'.</span>"
  (let* ((ifiles (mapcar 'expand-file-name <span class="linecomment">; Allow modify '/foo/.' -&gt; '/foo'</span>
                         (anything-marked-candidates)))
         (cand   (anything-get-selection)) <span class="linecomment">; Target</span>
         (prompt (anything-find-files-set-prompt-for-action
                  (capitalize (symbol-name action)) ifiles))
         (parg   anything-current-prefix-arg)
         (dest   (anything-c-read-file-name
                  prompt
                  :preselect (if anything-ff-transformer-show-only-basename
                                 (anything-c-basename cand) cand)
                  :initial-input (anything-dwim-target-directory)
                  :history (anything-find-files-history :comp-read nil))))
    (anything-dired-action
     dest :files ifiles :action action :follow parg)))

(defun anything-find-files-copy (candidate)
  "<span class="quote">Copy files from `anything-find-files'.</span>"
  (anything-find-files-do-action 'copy))

(defun anything-find-files-rename (candidate)
  "<span class="quote">Rename files from `anything-find-files'.</span>"
  (anything-find-files-do-action 'rename))

(defun anything-find-files-symlink (candidate)
  "<span class="quote">Symlink files from `anything-find-files'.</span>"
  (anything-find-files-do-action 'symlink))

(defun anything-find-files-relsymlink (candidate)
  "<span class="quote">Relsymlink files from `anything-find-files'.</span>"
  (anything-find-files-do-action 'relsymlink))

(defun anything-find-files-hardlink (candidate)
  "<span class="quote">Hardlink files from `anything-find-files'.</span>"
  (anything-find-files-do-action 'hardlink))

(defun anything-find-files-byte-compile (candidate)
  "<span class="quote">Byte compile elisp files from `anything-find-files'.</span>"
  (let ((files    (anything-marked-candidates))
        (parg     anything-current-prefix-arg))
    (loop for fname in files
          do (byte-compile-file fname parg))))

(defun anything-find-files-load-files (candidate)
  "<span class="quote">Load elisp files from `anything-find-files'.</span>"
  (let ((files    (anything-marked-candidates)))
    (loop for fname in files
          do (load fname))))

(defun anything-find-files-ediff-files-1 (candidate &optional merge)
  "<span class="quote">Generic function to ediff/merge files in `anything-find-files'.</span>"
  (let ((bname  (anything-c-basename candidate))
        (prompt (if merge "<span class="quote">Ediff Merge `%s' With File: </span>"
                    "<span class="quote">Ediff `%s' With File: </span>"))
        (fun    (if merge 'ediff-merge-files 'ediff-files))) 
    (funcall fun
             candidate
             (condition-case quit
                 (anything-c-read-file-name
                  (format prompt bname))
               (quit <span class="linecomment">;; Hit C-g ask user to fallback to locate.</span>
                (if (y-or-n-p "<span class="quote">Search file for ediff with locate? </span>")
                    (anything-c-locate-read-file-name
                     (format prompt bname)
                     <span class="linecomment">;; Check if -b option is available.</span>
                     (if (and (eq system-type 'windows-nt)
                              (string-match "<span class="quote">^es</span>" anything-c-locate-command))
                         bname
                         (concat bname "<span class="quote"> -b</span>")))
                    (error "<span class="quote">Error: Ediff Operation aborted</span>")))))))

(defun anything-find-files-ediff-files (candidate)
  (anything-find-files-ediff-files-1 candidate))

(defun anything-find-files-ediff-merge-files (candidate)
  (anything-find-files-ediff-files-1 candidate 'merge))

(defun anything-find-files-grep (candidate)
  "<span class="quote">Default action to grep files from `anything-find-files'.</span>"
  (anything-do-grep-1 (anything-marked-candidates)
                      anything-current-prefix-arg))

(defun anything-ff-zgrep (candidate)
  "<span class="quote">Default action to zgrep files from `anything-find-files'.</span>"
  (let ((prefarg anything-current-prefix-arg)
        (ls      (anything-marked-candidates)))
    (anything-ff-zgrep-1 ls prefarg)))

(defun anything-ff-pdfgrep (candidate)
  "<span class="quote">Default action to pdfgrep files from `anything-find-files'.</span>"
  (let ((cands (loop for file in (anything-marked-candidates)
                     if (or (string= (file-name-extension file) "<span class="quote">pdf</span>")
                            (string= (file-name-extension file) "<span class="quote">PDF</span>"))
                     collect file))
        (anything-c-pdfgrep-default-function 'anything-c-pdfgrep-init))
    (when cands
      (anything-do-pdfgrep-1 cands))))

(defun anything-ff-etags-select (candidate)
  "<span class="quote">Default action to jump to etags from `anything-find-files'.</span>"
  (when (get-buffer anything-action-buffer)
    (kill-buffer anything-action-buffer))
  (let ((default-directory anything-ff-default-directory))
    (anything-c-etags-select anything-current-prefix-arg)))

(defun anything-find-files-switch-to-hist (candidate)
  "<span class="quote">Switch to anything-find-files history.</span>"
  (anything-find-files t))

<span class="linecomment">;;; Asynchronous copy of files.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-copy-files-async-1 (flist dest)
  "<span class="quote">Copy a list of Files FLIST to DEST asynchronously.
It use another emacs process to do the job.
Communication with background emacs is done with temp file
`anything-c-copy-files-async-log-file'.</span>"
  (start-file-process "<span class="quote">emacs-batch</span>" nil anything-c-copy-async-prefered-emacs
                      "<span class="quote">-Q</span>" "<span class="quote">--batch</span>" "<span class="quote">--eval</span>"
                      (format "<span class="quote">(progn
  (require 'dired) (require 'cl)
  (let ((dired-recursive-copies 'always)
        failures success
        (ovw-count 0)
        (cpf-count 0))
    (dolist (f '%S)
       (condition-case err
             (let ((file-exists (file-exists-p
                                 (expand-file-name
                                  (file-name-nondirectory (directory-file-name f))
                                   (file-name-directory
                                     (file-name-as-directory \"%s\"))))))
                (dired-copy-file f \"%s\" t)
                (if file-exists
                    (progn (push (cons \"Overwriting\" f) success)
                           (incf ovw-count))
                    (push (cons \"Copying\" f) success)
                    (incf cpf-count)))
          (file-error
           (push (dired-make-relative
                   (expand-file-name
                     (file-name-nondirectory (directory-file-name f))
                     (file-name-directory \"%s\")))
                 failures))))
    (with-current-buffer (find-file-noselect \"%s\")
       (erase-buffer)
       (when failures
         (dolist (fail (reverse failures))
           (insert (concat \"Failed to copy \" fail \"\n\"))))
       (when success
         (loop for (a . s) in (reverse success) do
           (insert (concat a \" \" s  \" to %s done\n\"))))
       (and (/= cpf-count 0) (insert (concat (int-to-string cpf-count) \" File(s) Copied\n\")))
       (and (/= ovw-count 0) (insert (concat (int-to-string ovw-count) \" File(s) Overwrited\n\")))
       (and failures (insert (concat (int-to-string (length failures)) \" File(s) Failed to copy\n\")))
       (save-buffer))))</span>"
                              flist dest dest dest anything-c-copy-files-async-log-file dest)))

(defun anything-c-copy-async-with-log (flist dest)
  "<span class="quote">Copy file list FLIST to DEST showing log.
Log is send to `anything-c-copy-files-async-log-file'.
Copying is done asynchronously with `anything-c-copy-files-async-1'.</span>"
  (declare (special auto-revert-interval))
  (pop-to-buffer (find-file-noselect anything-c-copy-files-async-log-file))
  (set (make-local-variable 'auto-revert-interval) 1)
  (erase-buffer)
  (insert "<span class="quote">Wait copying files...\n</span>")
  (sit-for 0.5) (save-buffer)
  (goto-char (point-max))
  (auto-revert-mode 1)
  (anything-c-copy-files-async-1 flist dest))

(defun anything-ff-copy-async (candidate)
  "<span class="quote">Anything find files action to copy files async.
Copying is done asynchronously with `anything-c-copy-files-async-1'.</span>"
  (let* ((flist (anything-marked-candidates))
         (dest  (anything-c-read-file-name
                 (anything-find-files-set-prompt-for-action
                  "<span class="quote">Copy Async</span>" flist)
                 :preselect candidate
                 :initial-input (car anything-ff-history)
                 :history (anything-find-files-history :comp-read nil))))
    (anything-c-copy-async-with-log flist dest)))

(defvar eshell-command-aliases-list nil)
(defvar anything-eshell-command-on-file-input-history nil)
(defun anything-find-files-eshell-command-on-file-1 (candidate &optional map)
  "<span class="quote">Run `eshell-command' on CANDIDATE or marked candidates.
This is done possibly with an eshell alias, if no alias found, you can type in
an eshell command.

Basename of CANDIDATE can be a wild-card.
e.g you can do \"eshell-command command *.el\"
Where \"*.el\" is the CANDIDATE.

It is possible to do eshell-command command &lt;CANDIDATE&gt; &lt;some more args&gt;
like this: \"command %s some more args\".

If MAP is given run `eshell-command' on all marked files at once,
Otherwise, run `eshell-command' on each marked files.
In other terms, with a prefix arg do on the three marked files
\"foo\" \"bar\" \"baz\":

\"eshell-command command foo bar baz\"

otherwise do

\"eshell-command command foo\"
\"eshell-command command bar\"
\"eshell-command command baz\"

Note:
If `eshell' or `eshell-command' have not been run once,
or if you have no eshell aliases `eshell-command-aliases-list'
will not be loaded first time you use this.</span>"
  (when (or eshell-command-aliases-list
            (y-or-n-p "<span class="quote">Eshell is not loaded, run eshell-command without alias anyway? </span>"))
    (and eshell-command-aliases-list (eshell-read-aliases-list))
    (let* ((cand-list (anything-marked-candidates))
           (default-directory (or anything-ff-default-directory
                                  <span class="linecomment">;; If candidate is an url *-ff-default-directory is nil</span>
                                  <span class="linecomment">;; so keep value of default-directory.</span>
                                  default-directory))
           (command (anything-comp-read
                     "<span class="quote">Command: </span>"
                     (loop for (a . c) in eshell-command-aliases-list
                           when (string-match "<span class="quote">\\(\\$1\\|\\$\\*\\)$</span>" (car c))
                           collect (propertize a 'help-echo (car c)) into ls
                           finally return (sort ls 'string&lt;))
                     :buffer "<span class="quote">*esh command on file*</span>"
                     :name "<span class="quote">Eshell command</span>"
                     :keymap anything-esh-on-file-map
                     :mode-line
                     '("<span class="quote">Eshell alias</span>"
                       "<span class="quote">C-c ?: Help, \\[universal-argument]: Insert output at point</span>")
                     :input-history
                     'anything-eshell-command-on-file-input-history))
           (alias-value (car (assoc-default command eshell-command-aliases-list))))
      (when (and (= (length cand-list) 1)
                 (string-match "<span class="quote">[*]</span>" (anything-c-basename (car cand-list))))
        (setq cand-list (file-expand-wildcards (car cand-list) t)))
      <span class="linecomment">;; Be sure output don't go in current buffer</span>
      <span class="linecomment">;; but allow sending output to current buffer</span>
      <span class="linecomment">;; if a prefix arg have been passed during the</span>
      <span class="linecomment">;; `anything-comp-read' call.</span>
      (setq current-prefix-arg anything-current-prefix-arg)
      <span class="linecomment">;; MAP have been set before calling `anything-comp-read' </span>
      <span class="linecomment">;; by `anything-current-prefix-arg'.</span>
      (if (and (or map <span class="linecomment">; prefix-arg</span>
                   (and alias-value
                        <span class="linecomment">;; If command is an alias be sure it accept</span>
                        <span class="linecomment">;; more than one arg i.e $*.</span>
                        (string-match "<span class="quote">\\$\\*$</span>" alias-value)))
               (&gt; (length cand-list) 1))
          
          <span class="linecomment">;; Run eshell-command with ALL marked files as arguments.</span>
          (let ((mapfiles (mapconcat 'shell-quote-argument cand-list "<span class="quote"> </span>")))
            (if (string-match "<span class="quote">'%s'\\|\"%s\"\\|%s</span>" command)
                (eshell-command (format command mapfiles)) <span class="linecomment">; See [1]</span>
                (eshell-command (format "<span class="quote">%s %s</span>" command mapfiles))))
          
          <span class="linecomment">;; Run eshell-command on EACH marked files.</span>
          (loop for i in cand-list
                for bn = (anything-c-basename i)
                for files = (format "<span class="quote">'%s'</span>" i)
                for com = (if (string-match "<span class="quote">'%s'\\|\"%s\"\\|%s</span>" command)
                              <span class="linecomment">;; [1] This allow to enter other args AFTER filename</span>
                              <span class="linecomment">;; i.e &lt;command %s some_more_args&gt;</span>
                              (format command files)
                              (format "<span class="quote">%s %s</span>" command files))
                do (eshell-command com))))))

(defun anything-find-files-eshell-command-on-file (candidate)
  "<span class="quote">Run `eshell-command' on CANDIDATE or marked candidates.
See `anything-find-files-eshell-command-on-file-1' for more info.</span>"
  (anything-find-files-eshell-command-on-file-1
   candidate anything-current-prefix-arg))

(defun anything-ff-switch-to-eshell (candidate)
  "<span class="quote">Switch to eshell and cd to `anything-ff-default-directory'.</span>"
  (flet ((cd-eshell ()
           (goto-char (point-max))
           (insert
            (format "<span class="quote">cd '%s'</span>" anything-ff-default-directory))
           (eshell-send-input)))
    (if (get-buffer "<span class="quote">*eshell*</span>")
        (progn
          (anything-c-switch-to-buffer "<span class="quote">*eshell*</span>")
          (cd-eshell))
        (call-interactively 'eshell)
        (cd-eshell))))

(defun anything-ff-serial-rename-action (method)
  "<span class="quote">Rename all marked files to `anything-ff-default-directory' with METHOD.
See `anything-ff-serial-rename-1'.</span>"
  (let* ((cands     (anything-marked-candidates))
         (def-name  (car cands))
         (name      (read-string "<span class="quote">NewName: </span>"
                                 (replace-regexp-in-string
                                  "<span class="quote">[0-9]+$</span>" "<span class="quote"></span>"
                                  (anything-c-basename
                                   def-name
                                   (file-name-extension def-name)))))
         (start     (read-number "<span class="quote">StartAtNumber: </span>"))
         (extension (read-string "<span class="quote">Extension: </span>"
                                 (file-name-extension (car cands))))
         (dir       (expand-file-name
                     (anything-c-read-file-name
                      "<span class="quote">Serial Rename to directory: </span>"
                      :initial-input
                      (expand-file-name anything-ff-default-directory)
                      :test 'file-directory-p
                      :must-match t)))
         (res       (loop for f in cands
                          for bn = (anything-c-basename f)
                          for count from start
                          concat (format "<span class="quote">%s &lt;-&gt; %s%s.%s\n</span>"
                                         bn name count extension))))
    (if (y-or-n-p
         (format "<span class="quote">Result:\n %sRename like this to &lt;%s&gt; ? </span>" res dir))
        (progn
          (anything-ff-serial-rename-1
           dir cands name start extension :method method)
          (message nil)
          (anything-find-files-1 dir))
        (message "<span class="quote">Operation aborted</span>"))))

(defun anything-ff-member-directory-p (file directory)
  (let ((dir-file (expand-file-name
                   (file-name-as-directory (file-name-directory file))))
        (cur-dir  (expand-file-name (file-name-as-directory directory))))
    (string= dir-file cur-dir)))

(defun* anything-ff-serial-rename-1
    (directory collection new-name start-at-num extension &key (method 'rename))
  "<span class="quote">rename files in COLLECTION to DIRECTORY with the prefix name NEW-NAME.
Rename start at number START-AT-NUM - ex: prefixname-01.jpg.
EXTENSION is the file extension to use, in empty prompt,
reuse the original extension of file.
METHOD can be one of rename, copy or symlink.
Files will be renamed if they are files of current directory, otherwise they
will be treated with METHOD.
Default METHOD is rename.</span>"
  <span class="linecomment">;; Maybe remove directories selected by error in collection.</span>
  (setq collection (remove-if 'file-directory-p collection))
  (flet ((symlink-file (file dest)
           (let ((flist (list file)))
             (anything-dired-action
              dest :action 'symlink :files flist))))

    (let* ((tmp-dir  (file-name-as-directory
                      (concat (file-name-as-directory directory)
                              (symbol-name (gensym "<span class="quote">tmp</span>")))))
           (fn       (case method
                       (copy    'copy-file)
                       (symlink 'symlink-file)
                       (rename  'rename-file)
                       (t (error "<span class="quote">Error: Unknow method %s</span>" method)))))
      (make-directory tmp-dir)
      (unwind-protect
           (progn
             <span class="linecomment">;; Rename all files to tmp-dir with new-name.</span>
             <span class="linecomment">;; If files are not from start directory, use method</span>
             <span class="linecomment">;; to move files to tmp-dir.</span>
             (loop for i in collection
                   for count from start-at-num
                   for fnum = (if (&lt; count 10) "<span class="quote">0%s</span>" "<span class="quote">%s</span>")
                   for nname = (concat tmp-dir new-name (format fnum count)
                                       (if (not (string= extension "<span class="quote"></span>"))
                                           (format "<span class="quote">.%s</span>" (replace-regexp-in-string
                                                          "<span class="quote">[.]</span>" "<span class="quote"></span>" extension))
                                           (file-name-extension i 'dot)))
                   do (if (anything-ff-member-directory-p i directory)
                          (rename-file i nname)
                          (funcall fn i nname)))
             <span class="linecomment">;; Now move all from tmp-dir to destination.</span>
             (loop with dirlist = (directory-files
                                   tmp-dir t directory-files-no-dot-files-regexp)
                   for f in dirlist do
                   (if (file-symlink-p f)
                       (symlink-file (file-truename f)
                                     (concat (file-name-as-directory directory)
                                             (anything-c-basename f)))
                       (rename-file f directory))))
        (delete-directory tmp-dir t)))))

(defun anything-ff-serial-rename (candidate)
  "<span class="quote">Serial rename all marked files to `anything-ff-default-directory'.
Rename only file of current directory, and symlink files coming from
other directories.
See `anything-ff-serial-rename-1'.</span>"
  (anything-ff-serial-rename-action 'rename))

(defun anything-ff-serial-rename-by-symlink (candidate)
  "<span class="quote">Serial rename all marked files to `anything-ff-default-directory'.
Rename only file of current directory, and symlink files coming from
other directories.
See `anything-ff-serial-rename-1'.</span>"
  (anything-ff-serial-rename-action 'symlink))

(defun anything-ff-serial-rename-by-copying (candidate)
  "<span class="quote">Serial rename all marked files to `anything-ff-default-directory'.
Rename only file of current directory, and copy files coming from
other directories.
See `anything-ff-serial-rename-1'.</span>"
  (anything-ff-serial-rename-action 'copy))

(defun anything-c-quit-and-execute-action (action)
  "<span class="quote">Quit current anything session and execute ACTION.</span>" 
  (setq anything-saved-action action)
  (anything-exit-minibuffer))

(defun anything-ff-toggle-auto-update (candidate)
  (setq anything-ff-auto-update-flag (not anything-ff-auto-update-flag))
  (message "<span class="quote">[Auto expansion %s]</span>"
           (if anything-ff-auto-update-flag "<span class="quote">enabled</span>" "<span class="quote">disabled</span>")))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-toggle-auto-update ()
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-attrset 'toggle-auto-update 'anything-ff-toggle-auto-update)
    (anything-execute-persistent-action 'toggle-auto-update)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-switch-to-history ()
  "<span class="quote">Run Switch to history action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-switch-to-hist)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-grep ()
  "<span class="quote">Run Grep action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-grep)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-pdfgrep ()
  "<span class="quote">Run Pdfgrep action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-ff-pdfgrep)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-zgrep ()
  "<span class="quote">Run Grep action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-ff-zgrep)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-copy-file ()
  "<span class="quote">Run Copy file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-copy)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-rename-file ()
  "<span class="quote">Run Rename file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-rename)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-byte-compile-file ()
  "<span class="quote">Run Byte compile file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-byte-compile)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-load-file ()
  "<span class="quote">Run Load file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-load-files)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-eshell-command-on-file ()
  "<span class="quote">Run eshell command on file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action
     'anything-find-files-eshell-command-on-file)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-ediff-file ()
  "<span class="quote">Run Ediff file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-ediff-files)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-ediff-merge-file ()
  "<span class="quote">Run Ediff merge file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action
     'anything-find-files-ediff-merge-files)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-symlink-file ()
  "<span class="quote">Run Symlink file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-symlink)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-hardlink-file ()
  "<span class="quote">Run Hardlink file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-find-files-hardlink)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-delete-file ()
  "<span class="quote">Run Delete file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-delete-marked-files)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-complete-fn-at-point ()
  "<span class="quote">Run complete file name action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action
     'anything-c-insert-file-name-completion-at-point)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-switch-to-eshell ()
  "<span class="quote">Run switch to eshell action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-ff-switch-to-eshell)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-switch-other-window ()
  "<span class="quote">Run switch to other window action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'find-file-other-window)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-switch-other-frame ()
  "<span class="quote">Run switch to other frame action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'find-file-other-frame)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-open-file-externally ()
  "<span class="quote">Run open file externally command action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-c-open-file-externally)))

(defun anything-ff-locate (candidate)
  "<span class="quote">Locate action function for `anything-find-files'.</span>"
  (let ((input (concat (anything-c-basename
                        (expand-file-name
                         candidate
                         anything-ff-default-directory))
                       <span class="linecomment">;; The locate '-b' option doesn't exists</span>
                       <span class="linecomment">;; in everything.</span>
                       (unless (and (eq system-type 'windows-nt)
                                    (string-match "<span class="quote">^es</span>" anything-c-locate-command))
                         "<span class="quote"> -b</span>")))
        (anything-mp-highlight-delay 0.7))
    (anything-locate-1 anything-current-prefix-arg input 'from-ff)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-locate ()
  "<span class="quote">Run locate action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-ff-locate)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-gnus-attach-files ()
  "<span class="quote">Run gnus attach files command action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-ff-gnus-attach-files)))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-etags ()
  "<span class="quote">Run Etags command action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-ff-etags-select)))

(defun anything-ff-print (candidate)
  "<span class="quote">Print marked files.
You have to set in order
variables `lpr-command',`lpr-switches' and/or `printer-name'.

e.g:
\(setq lpr-command \"gtklp\"\)
\(setq lpr-switches '(\"-P\")\)
\(setq printer-name \"Epson-Stylus-Photo-R265\"\)

Same as `dired-do-print' but for anything.</span>"
  (when (or anything-current-prefix-arg
            (not anything-ff-printer-list))
    (setq anything-ff-printer-list
          (anything-ff-find-printers)))
  (let* ((file-list (anything-marked-candidates))
         (len (length file-list))
         (printer-name (if anything-ff-printer-list
                           (anything-comp-read
                            "<span class="quote">Printer: </span>" anything-ff-printer-list)
                           printer-name))
	 (command (read-string
                   (format "<span class="quote">Print *%s File(s):\n%s with: </span>"
                           len
                           (mapconcat
                            (lambda (f) (format "<span class="quote">- %s\n</span>" f))
                            file-list "<span class="quote"></span>"))
                   (when (and lpr-command
                              (or lpr-switches
                                  printer-name))
                     (mapconcat 'identity
                                (cons lpr-command
                                      (append (if (stringp lpr-switches)
                                                  (list lpr-switches)
                                                  lpr-switches)
                                              (list printer-name)))
                                "<span class="quote"> </span>"))))
         (file-args (mapconcat #'(lambda (x)
                                   (format "<span class="quote">'%s'</span>" x))
                               file-list "<span class="quote"> </span>"))
         (cmd-line (concat command "<span class="quote"> </span>" file-args)))
    (if command
        (start-process-shell-command "<span class="quote">anything-print</span>" nil cmd-line)
        (error "<span class="quote">Error: Please verify your printer settings in Emacs.</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-print-file ()
  "<span class="quote">Run Print file action from `anything-c-source-find-files'.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-c-quit-and-execute-action 'anything-ff-print)))

(defun anything-ff-checksum (file)
  "<span class="quote">Calculate the checksum of FILE.
Provide completion on different algorithms to use on Emacs24.
On Emacs23 only 'sha1' is available.
The checksum is copied to kill-ring.</span>"
  (let ((algo-list (and (fboundp 'secure-hash)
                        '(md5 sha1 sha224 sha256 sha384 sha512))))
    (kill-new
     (if algo-list
         (secure-hash (intern
                       (anything-comp-read
                        "<span class="quote">Algorithm: </span>" algo-list))
                      file)
         (sha1 (with-temp-buffer
                 (insert-file-contents file)
                 (buffer-string)))))
    (message "<span class="quote">Checksum copied to kill-ring.</span>")))

(defun anything-ff-toggle-basename (candidate)
  (setq anything-ff-transformer-show-only-basename
        (not anything-ff-transformer-show-only-basename))
  (let ((target (if anything-ff-transformer-show-only-basename
                    (anything-c-basename candidate) candidate)))
    (anything-force-update target)))

(defun anything-ff-run-toggle-basename ()
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-attrset 'toggle-basename 'anything-ff-toggle-basename)
    (anything-execute-persistent-action 'toggle-basename)))

(defun* anything-reduce-file-name (fname level &key unix-close expand)
  "<span class="quote">Reduce FNAME by LEVEL from end or beginning depending LEVEL value.
If LEVEL is positive reduce from end else from beginning.
If UNIX-CLOSE is non--nil close filename with /.
If EXPAND is non--nil expand-file-name.</span>"
  (let* ((exp-fname  (expand-file-name fname))
         (fname-list (split-string (if (or (string= fname "<span class="quote">~/</span>") expand)
                                       exp-fname fname) "<span class="quote">/</span>" t))
         (len        (length fname-list))
         (pop-list   (if (&lt; level 0)
                         (subseq fname-list (* level -1))
                         (subseq fname-list 0 (- len level))))
         (result     (mapconcat 'identity pop-list "<span class="quote">/</span>"))
         (empty      (string= result "<span class="quote"></span>")))
    (when unix-close (setq result (concat result "<span class="quote">/</span>")))
    (if (string-match "<span class="quote">^~</span>" result)
        (if (string= result "<span class="quote">~/</span>") "<span class="quote">~/</span>" result)
        (if (&lt; level 0)
            (if empty "<span class="quote">../</span>" (concat "<span class="quote">../</span>" result))
            (cond ((eq system-type 'windows-nt)
                   (if empty (expand-file-name "<span class="quote">/</span>") <span class="linecomment">; Expand to "/" or "c:/".</span>
                       result))
                  (empty "<span class="quote">/</span>")
                  (t
                   (concat "<span class="quote">/</span>" result)))))))

<span class="linecomment">;; Internal</span>
(defvar anything-file-completion-sources
  '("<span class="quote">Find Files</span>" "<span class="quote">Read File Name</span>"
    "<span class="quote">Read File Name History</span>" "<span class="quote">Copy Files</span>"
    "<span class="quote">Rename Files</span>" "<span class="quote">Symlink Files</span>"
    "<span class="quote">Hardlink Files</span>" "<span class="quote">Write File</span>" "<span class="quote">Insert File</span>")
  "<span class="quote">Sources that use the *find-files mechanism can be added here.
Sources generated by `ac-mode' don't need to be added here, it will
be done automatically.
You should not modify this yourself unless you know what you do.</span>")

(defun anything-file-completion-source-p ()
  "<span class="quote">Return non--nil if current source is a file completion source.
A source is a file completion source if it is
one of `anything-file-completion-sources'.
Return nil if anything is not running.</span>"
  (let ((cur-source (cdr (assoc 'name (anything-get-current-source)))))
    (loop for i in anything-file-completion-sources
          thereis (string= cur-source i))))

(defun anything-find-files-down-one-level (arg)
  "<span class="quote">Go down one level like unix command `cd ..'.
If prefix numeric arg is given go ARG level down.</span>"
  (interactive "<span class="quote">p</span>")
  (when (and (anything-file-completion-source-p)
             (not (anything-ff-invalid-tramp-name-p)))
    (with-anything-window
      (setq anything-follow-mode nil))
    <span class="linecomment">;; When going to precedent level we want to be at the line</span>
    <span class="linecomment">;; corresponding to actual directory, so store this info</span>
    <span class="linecomment">;; in `anything-ff-last-expanded'.</span>
    (if (and (not (file-directory-p anything-pattern))
             (file-exists-p anything-pattern))
        (setq anything-ff-last-expanded anything-pattern)
        (setq anything-ff-last-expanded anything-ff-default-directory))
    (let ((new-pattern (anything-reduce-file-name anything-pattern arg
                                                  :unix-close t :expand t)))
      (anything-set-pattern new-pattern))))

(defun anything-ff-retrieve-last-expanded ()
  "<span class="quote">Move overlay to last visited directory `anything-ff-last-expanded'.
This happen after using `anything-find-files-down-one-level',
or hitting C-z on \"..\".</span>"
  (when (and anything-ff-last-expanded
             (anything-file-completion-source-p))
    (let ((presel (if anything-ff-transformer-show-only-basename
                       (anything-c-basename
                        (directory-file-name anything-ff-last-expanded))
                       (directory-file-name anything-ff-last-expanded))))
      (with-anything-window
        (when (re-search-forward
               (concat "<span class="quote">^</span>" (regexp-quote presel) "<span class="quote">$</span>") nil t)
          (forward-line 0)
          (anything-mark-current-line)))
      (setq anything-ff-last-expanded nil))))
(add-hook 'anything-after-update-hook 'anything-ff-retrieve-last-expanded)

<span class="linecomment">;; Auto-update - anything-find-files auto expansion of directories.</span>
<span class="linecomment">;;</span>
(defun anything-ff-update-when-only-one-matched ()
  "<span class="quote">Expand to directory when sole completion.
When only one candidate is remaining and it is a directory,
expand to this directory.</span>"
  (when (and anything-ff-auto-update-flag
             (anything-file-completion-source-p)
             (not (anything-ff-invalid-tramp-name-p)))
    (let* ((history-p   (string= (assoc-default
                                  'name (anything-get-current-source))
                                 "<span class="quote">Read File Name History</span>"))
           (pat         (if (string-match tramp-file-name-regexp
                                          anything-pattern)
                            (anything-create-tramp-name anything-pattern)
                            anything-pattern))
           (completed-p (string= (file-name-as-directory pat)
                                 anything-ff-default-directory)))
      (when (and (or
                  <span class="linecomment">;; Only one candidate remaining</span>
                  <span class="linecomment">;; and at least 2 char in basename.</span>
                  (and (&lt;= (anything-approximate-candidate-number) 2)
                       (&gt;= (length (anything-c-basename anything-pattern)) 2))
                  <span class="linecomment">;; Already completed.</span>
                  completed-p)
                 (not history-p)) <span class="linecomment">; Don't try to auto complete in history.</span>
        (with-anything-window
          (let ((cur-cand (prog2
                              (unless completed-p
                                <span class="linecomment">;; Only one non--existing candidate</span>
                                <span class="linecomment">;; and one directory candidate, move to it.</span>
                                (anything-next-line))
                              (anything-get-selection))))
            (when (and (stringp cur-cand) (file-directory-p cur-cand))
              (if (and (not (string-match "<span class="quote">^.*[.]\\{1,2\\}$</span>" cur-cand)) <span class="linecomment">; [1]</span>
                       <span class="linecomment">;; Maybe we are here because completed-p is true</span>
                       <span class="linecomment">;; but check this again to be sure. (Windows fix)</span>
                       (&lt;= (anything-approximate-candidate-number) 2)) <span class="linecomment">; [2]</span>
                  <span class="linecomment">;; If after going to next line the candidate</span>
                  <span class="linecomment">;; is not one of "." or ".." [1]</span>
                  <span class="linecomment">;; and only one candidate is remaining [2],</span>
                  <span class="linecomment">;; assume candidate is a new directory to expand, and do it.</span>
                  (anything-set-pattern (file-name-as-directory cur-cand))
                  <span class="linecomment">;; The candidate is one of "." or ".."</span>
                  <span class="linecomment">;; that mean we have entered the last letter of the directory name</span>
                  <span class="linecomment">;; in prompt, so expansion is already done, just add the "/" at end</span>
                  <span class="linecomment">;; of name unless anything-pattern ends with "."</span>
                  <span class="linecomment">;; (i.e we are writing something starting with ".")</span>
                  (unless (string-match "<span class="quote">^.*[.]\\{1\\}$</span>" anything-pattern)
                    (anything-set-pattern
                     <span class="linecomment">;; Need to expand-file-name to avoid e.g /ssh:host:./ in prompt.</span>
                     (expand-file-name (file-name-as-directory anything-pattern)))))
              (anything-check-minibuffer-input-1))))))))
(add-hook 'anything-after-update-hook 'anything-ff-update-when-only-one-matched)

<span class="linecomment">;; Allow expanding to home directory or root</span>
<span class="linecomment">;; when entering respectively "~/" or "//" at end of pattern.</span>
<span class="linecomment">;; e.g /home/thierry/labo/anything-config-qp/~/</span>
<span class="linecomment">;; will expand to "~/"</span>
<span class="linecomment">;; and /home/thierry/labo/anything-config-qp//</span>
<span class="linecomment">;; will expand to "/"</span>
(defun anything-ff-auto-expand-to-home-or-root ()
  "<span class="quote">Goto home, root or default directory when pattern ends with ~/, /, or ./.
This happen only in function using sources that are
`anything-file-completion-source-p' compliant.</span>"
  (when (and (anything-file-completion-source-p)
             (string-match "<span class="quote">.*\\(/~/\\|/\\{2\\}\\|/[.]\\{1\\}/\\)$</span>"
                           anything-pattern)
             (not (string-match anything-ff-url-regexp anything-pattern)))
    (let ((match (match-string 1 anything-pattern)))
      (cond ((string= match "<span class="quote">//</span>")
             <span class="linecomment">;; Expand to "/" or "c:/"</span>
             (setq anything-pattern (expand-file-name "<span class="quote">/</span>")))
            ((string= match "<span class="quote">/~/</span>")
             (if (eq system-type 'windows-nt)
                 (setq anything-pattern (file-name-as-directory (getenv "<span class="quote">HOME</span>")))
                 (setq anything-pattern "<span class="quote">~/</span>")))
            ((string= match "<span class="quote">/./</span>")
             (setq anything-pattern
                   (with-anything-current-buffer
                     (expand-file-name default-directory))))))
    (setq anything-ff-default-directory anything-pattern)
    <span class="linecomment">;; For some reasons, i must use here with-current-buffer =&gt; mini buffer</span>
    <span class="linecomment">;; and not `anything-set-pattern' that use with-selected-window =&gt; mini win.</span>
    (with-current-buffer (window-buffer (minibuffer-window))
      (delete-minibuffer-contents)
      (insert anything-pattern))))

(add-hook 'anything-after-update-hook 'anything-ff-auto-expand-to-home-or-root)

(defun anything-c-point-file-in-dired (file)
  "<span class="quote">Put point on filename FILE in dired buffer.</span>"
  (dired (file-name-directory file))
  (dired-goto-file file))

(defun anything-create-tramp-name (fname)
  "<span class="quote">Build filename for `anything-pattern' like /su:: or /sudo::.</span>"
  (apply #'tramp-make-tramp-file-name
         (loop with v = (tramp-dissect-file-name fname)
               for i across v collect i)))

(defun* anything-ff-tramp-hostnames (&optional (pattern anything-pattern))
  "<span class="quote">Get a list of hosts for tramp method found in `anything-pattern'.
Argument PATTERN default to `anything-pattern', it is here only for debugging
purpose.</span>"
  (when (string-match tramp-file-name-regexp pattern)
    (let ((method      (match-string 1 pattern))
          (tn          (match-string 0 pattern))
          (all-methods (mapcar 'car tramp-methods)))
      (anything-fast-remove-dups
       (loop for (f . h) in (tramp-get-completion-function method)
             append (loop for e in (funcall f (car h))
                          for host = (and (consp e) (cadr e))
                          when (and host (not (member host all-methods)))
                          collect (concat tn host)))
       :test 'equal))))

(defun anything-ff-before-action-hook-fn ()
  "<span class="quote">Exit anything when user try to execute action on an invalid tramp fname.</span>"
  (let ((cand (anything-get-selection)))
    (when (and (anything-file-completion-source-p)
               (anything-ff-invalid-tramp-name-p cand) <span class="linecomment">; Check candidate.</span>
               (anything-ff-invalid-tramp-name-p)) <span class="linecomment">; check anything-pattern.</span>
      (error "<span class="quote">Error: Unknow file or directory `%s'</span>" cand))))
(add-hook 'anything-before-action-hook 'anything-ff-before-action-hook-fn)

(defun* anything-ff-invalid-tramp-name-p (&optional (pattern anything-pattern))
  "<span class="quote">Return non--nil when PATTERN is an invalid tramp filename.</span>"
  (string= (anything-ff-set-pattern pattern)
           "<span class="quote">Invalid tramp file name</span>"))

(defun anything-ff-set-pattern (pattern)
  "<span class="quote">Handle tramp filenames in `anything-pattern'.</span>"
  (let ((methods (mapcar 'car tramp-methods))
        (reg "<span class="quote">\\`/\\([^[/:]+\\|[^/]+]\\):.*:</span>")
        cur-method tramp-name)
    (cond ((string= pattern "<span class="quote"></span>") "<span class="quote"></span>")
          ((string-match "<span class="quote">.*\\(~?/?[.]\\{1\\}/\\)$</span>" pattern)
           (with-anything-current-buffer
             (expand-file-name default-directory)))
          ((and (string-match "<span class="quote">.*\\(~//\\|//\\)$</span>" pattern)
                (not (string-match anything-ff-url-regexp anything-pattern)))
           (expand-file-name "<span class="quote">/</span>") <span class="linecomment">; Expand to "/" or "c:/"</span>
           )
          ((string-match "<span class="quote">^~\\|.*/~/$</span>" pattern)
           (let* ((home (expand-file-name (getenv "<span class="quote">HOME</span>"))))
             (replace-match home nil t pattern)))
          <span class="linecomment">;; Match "/method:maybe_hostname:"</span>
          ((and (string-match reg pattern)
                (setq cur-method (match-string 1 pattern))
                (member cur-method methods))
           (setq tramp-name (anything-create-tramp-name
                             (match-string 0 pattern)))
           (replace-match tramp-name nil t pattern))
          <span class="linecomment">;; Match "/hostname:"</span>
          ((and (string-match  tramp-file-name-regexp pattern)
                (setq cur-method (match-string 1 pattern))
                (and cur-method (not (member cur-method methods))))
           (setq tramp-name (anything-create-tramp-name
                             (match-string 0 pattern)))
           (replace-match tramp-name nil t pattern))
          <span class="linecomment">;; Match "/method:" in this case don't try to connect.</span>
          ((and (not (string-match reg pattern))
                (string-match tramp-file-name-regexp pattern)
                (member (match-string 1 pattern) methods))
           "<span class="quote">Invalid tramp file name</span>")   <span class="linecomment">; Write in anything-buffer.</span>
          <span class="linecomment">;; PATTERN is a directory, end it with "/".</span>
          <span class="linecomment">;; This will make PATTERN not ending yet with "/"</span>
          <span class="linecomment">;; candidate for `anything-ff-default-directory',</span>
          <span class="linecomment">;; allowing `anything-ff-retrieve-last-expanded' to retrieve it</span>
          <span class="linecomment">;; when descending level.</span>
          ((file-directory-p pattern)
           (file-name-as-directory pattern))
          <span class="linecomment">;; Return PATTERN unchanged.</span>
          (t pattern))))

(defun anything-find-files-get-candidates (&optional require-match)
  "<span class="quote">Create candidate list for `anything-c-source-find-files'.</span>"
  (let* ((path          (anything-ff-set-pattern anything-pattern))
         (path-name-dir (if (file-directory-p path)
                            (file-name-as-directory path)
                            (file-name-directory path)))
         (tramp-verbose anything-tramp-verbose)) <span class="linecomment">; No tramp message when 0.</span>
    (set-text-properties 0 (length path) nil path)
    <span class="linecomment">;; Don't set now `anything-pattern' if `path' == "Invalid tramp file name"</span>
    <span class="linecomment">;; like that the actual value (e.g /ssh:) is passed to</span>
    <span class="linecomment">;; `anything-ff-tramp-hostnames'.</span>
    (unless (string= path "<span class="quote">Invalid tramp file name</span>")
      (setq anything-pattern (anything-ff-transform-fname-for-completion path)))
    (setq anything-ff-default-directory
          (if (string= anything-pattern "<span class="quote"></span>")
              (expand-file-name "<span class="quote">/</span>") <span class="linecomment">; Expand to "/" or "c:/"</span>
              <span class="linecomment">;; If path is an url *default-directory have to be nil.</span>
              (unless (or (string-match anything-ff-url-regexp path)
                          (string-match ffap-url-regexp path))
                path-name-dir)))
    (cond ((string= path "<span class="quote">Invalid tramp file name</span>")
           (or (anything-ff-tramp-hostnames) <span class="linecomment">; Hostnames completion.</span>
               (prog2
                   <span class="linecomment">;; `anything-pattern' have not been modified yet.</span>
                   <span class="linecomment">;; Set it here to the value of `path' that should be now</span>
                   <span class="linecomment">;; "Invalid tramp file name" and set the candidates list</span>
                   <span class="linecomment">;; to ("Invalid tramp file name") to make `anything-pattern'</span>
                   <span class="linecomment">;; match single candidate "Invalid tramp file name".</span>
                   (setq anything-pattern path)
                   <span class="linecomment">;; "Invalid tramp file name" is now printed</span>
                   <span class="linecomment">;; in `anything-buffer'.</span>
                   (list path))))
          ((or (file-regular-p path)
               <span class="linecomment">;; `ffap-url-regexp' don't match until url is complete.</span>
               (string-match anything-ff-url-regexp path)
               (and (not (file-exists-p path)) (string-match "<span class="quote">/$</span>" path))
               (and ffap-url-regexp (string-match ffap-url-regexp path)))
           (list path))
          ((string= path "<span class="quote"></span>") (anything-ff-directory-files "<span class="quote">/</span>" t))
          ((and (file-directory-p path) (not (file-readable-p path)))
           (list (format "<span class="quote">Opening directory: access denied, `%s'</span>" path)))
          ((file-directory-p path) (anything-ff-directory-files path t))
          (t
           (append (list path) <span class="linecomment">; No need to check for must-match.</span>
                   (anything-ff-directory-files path-name-dir t))))))

(defun anything-ff-directory-files (directory &optional full)
  "<span class="quote">List contents of DIRECTORY.
Argument FULL mean absolute path.
It is same as `directory-files' but always returns the
dotted filename '.' and '..' on root directories on Windows
systems.</span>"
  (setq directory (expand-file-name directory))
  (let ((ls (directory-files directory full))
        dot dot2 lsdir)
    (if (or
         <span class="linecomment">;; A windows volume.</span>
         (string-match "<span class="quote">^[a-zA-Z]\\{1\\}:/$</span>" directory)
         <span class="linecomment">;; Empty directories on ftp hosts may have no dot dirs.</span>
         (and (file-remote-p directory)
              (string-match "<span class="quote">^/ftp:</span>" directory)))
        (progn (setq dot (concat directory "<span class="quote">.</span>"))
               (setq dot2 (concat directory "<span class="quote">..</span>"))
               (setq lsdir (remove dot2 (remove dot ls)))
               (append (list dot dot2) lsdir))
        ls)))

(defun anything-ff-transform-fname-for-completion (fname)
  "<span class="quote">Return FNAME with it's basename modified as a regexp.
e.g foo =&gt; f.*o.*o .
If basename contain one or more space or FNAME is a valid directory name
return FNAME unchanged.</span>"
  (let ((bn (anything-c-basename fname)))
    (if (or (not anything-ff-smart-completion)
            (string-match "<span class="quote">\\s-</span>" bn)
            (string-match "<span class="quote">/$</span>" fname) <span class="linecomment">; Allow mkdir.</span>
            (file-directory-p fname)
            (string-match anything-ff-url-regexp fname))
        fname <span class="linecomment">; Fall back to match-plugin.</span>
        (setq bn (if (&gt; (length bn) 2) <span class="linecomment">; Normal completion on first 2 char.</span>
                     (mapconcat 'identity (split-string bn "<span class="quote"></span>" t) "<span class="quote">.*</span>") bn))
        (concat (file-name-directory fname) bn))))

(defun anything-ff-save-history ()
  "<span class="quote">Store the last value of `anything-ff-default-directory' \
in `anything-ff-history'.</span>"
  (when (and anything-ff-default-directory
             (anything-file-completion-source-p))
    (push anything-ff-default-directory anything-ff-history)))
(add-hook 'anything-cleanup-hook 'anything-ff-save-history)

(defun anything-ff-valid-symlink-p (file)
  (file-exists-p (file-truename file)))

(defun anything-ff-properties (candidate)
  "<span class="quote">Show file properties of CANDIDATE in a tooltip or message.</span>"
  (let ((type       (anything-ff-attributes candidate :type t))
        (dired-line (anything-ff-attributes candidate :dired t :human-size t)))
    (if (window-system)
        (tooltip-show
         (concat
          (anything-c-basename candidate) "<span class="quote">\n</span>"
          "<span class="quote">Type: </span>" type "<span class="quote">\n</span>"
          (when (string= type "<span class="quote">symlink</span>")
            (format "<span class="quote">True name: '%s'\n</span>"
                    (cond ((string-match "<span class="quote">^\.#</span>" (anything-c-basename candidate))
                           "<span class="quote">Autosave symlink</span>")
                          ((anything-ff-valid-symlink-p candidate)
                           (file-truename candidate))
                          (t "<span class="quote">Invalid Symlink</span>"))))
          dired-line))
        (message dired-line) (sit-for 5))))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-properties-persistent ()
  "<span class="quote">Show properties without quitting anything.</span>"
  (interactive)
  (anything-attrset 'properties-action 'anything-ff-properties)
  (anything-execute-persistent-action 'properties-action))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-persistent-delete ()
  "<span class="quote">Delete current candidate without quitting.</span>"
  (interactive)
  (anything-attrset 'quick-delete 'anything-ff-quick-delete)
  (anything-execute-persistent-action 'quick-delete))

(defun anything-ff-dot-file-p (file)
  "<span class="quote">Check if FILE is `.' or `..'.</span>"
  (member (anything-c-basename file) '("<span class="quote">.</span>" "<span class="quote">..</span>")))

(defun anything-ff-quick-delete (candidate)
  "<span class="quote">Delete file CANDIDATE without quitting.</span>"
  (let ((presel (prog1 (save-excursion
                         (let (sel)
                           (anything-next-line)
                           (setq sel (anything-get-selection))
                           (if (string= sel candidate)
                               (progn (anything-previous-line)
                                      (anything-get-selection))
                               sel)))
                  (anything-mark-current-line))))
    (setq presel (if (and anything-ff-transformer-show-only-basename
                          (not (anything-ff-dot-file-p presel)))
                     (anything-c-basename presel) presel))
    (if anything-ff-quick-delete-dont-prompt-for-deletion
        (anything-c-delete-file candidate
                                anything-ff-signal-error-on-dot-files)
        (save-selected-window
          (when (y-or-n-p (format "<span class="quote">Really Delete file `%s'? </span>" candidate))
            (anything-c-delete-file candidate
                                    anything-ff-signal-error-on-dot-files)
            (message nil))))
    (anything-force-update presel)))

(defun anything-ff-kill-buffer-fname (candidate)
  (let* ((buf (get-file-buffer candidate))
         (buf-name (buffer-name buf)))
    (if buf
        (progn
          (kill-buffer buf) (message "<span class="quote">Buffer `%s' killed</span>" buf))
        (message "<span class="quote">No buffer to kill</span>"))))

(defun anything-ff-kill-or-find-buffer-fname (candidate)
  "<span class="quote">Find file CANDIDATE or kill it's buffer if it is visible.
Never kill `anything-current-buffer'.
Never kill buffer modified.
This is called normally on third hit of \
\\&lt;anything-map&gt;\\[anything-execute-persistent-action]
in `anything-find-files-persistent-action'.</span>"
  (let* ((buf      (get-file-buffer candidate))
         (buf-name (buffer-name buf)))
    (if (and buf (get-buffer-window buf)
             (not (eq buf (get-buffer anything-current-buffer)))
             (not (buffer-modified-p buf)))
        (progn
          (kill-buffer buf) (message "<span class="quote">Buffer `%s' killed</span>" buf-name))
        (find-file candidate))))

<span class="linecomment">;;;###autoload</span>
(defun anything-ff-run-kill-buffer-persistent ()
  "<span class="quote">Execute `anything-ff-kill-buffer-fname' whitout quitting.</span>"
  (interactive)
  (when (anything-file-completion-source-p)
    (anything-attrset 'kill-buffer-fname 'anything-ff-kill-buffer-fname)  
    (anything-execute-persistent-action 'kill-buffer-fname)))

(defun anything-ff-human-size (size)
  "<span class="quote">Return a string showing SIZE of a file in human readable form.
SIZE can be an integer or a float depending it's value.
`file-attributes' will take care of that to avoid overflow error.
KBSIZE if a floating point number, default value is 1024.0.</span>"
  (let ((M (cons "<span class="quote">M</span>" (/ size (expt anything-ff-default-kbsize 2))))
        (G (cons "<span class="quote">G</span>" (/ size (expt anything-ff-default-kbsize 3))))
        (K (cons "<span class="quote">K</span>" (/ size anything-ff-default-kbsize)))
        (B (cons "<span class="quote">B</span>" size)))
    (loop with result = B
          for (a . b) in
          (loop for (x . y) in (list M G K B)
                unless (&lt; y 1) collect (cons x y))
          when (&lt; b (cdr result)) do (setq result (cons a b))
          finally return (if (string= (car result) "<span class="quote">B</span>")
                             (format "<span class="quote">%s</span>" size)
                             (format "<span class="quote">%.1f%s</span>" (cdr result) (car result))))))

(defun* anything-ff-attributes
    (file &key type links uid gid access-time modif-time
          status size mode gid-change inode device-num dired human-size)
  "<span class="quote">Easy interface for `file-attributes'.</span>"
  (let ((all (destructuring-bind
                   (type links uid gid access-time modif-time
                         status size mode gid-change inode device-num)
                 (file-attributes file 'string)
               (list :type        type
                     :links       links
                     :uid         uid
                     :gid         gid
                     :access-time access-time
                     :modif-time  modif-time
                     :status      status
                     :size        size
                     :mode        mode
                     :gid-change  gid-change
                     :inode       inode
                     :device-num  device-num))))
    (cond (type
           (let ((result (getf all :type)))
             (cond ((stringp result)
                    "<span class="quote">symlink</span>")
                   (result "<span class="quote">directory</span>")
                   (t "<span class="quote">file</span>"))))
          (links (getf all :links))
          (uid   (getf all :uid))
          (gid   (getf all :gid))
          (access-time
           (format-time-string "<span class="quote">%Y-%m-%d %R</span>" (getf all :access-time)))
          (modif-time
           (format-time-string "<span class="quote">%Y-%m-%d %R</span>" (getf all :modif-time)))
          (status
           (format-time-string "<span class="quote">%Y-%m-%d %R</span>" (getf all :status)))
          (size (if human-size (anything-ff-human-size (getf all :size))
                    (getf all :size)))
          (mode (getf all :mode))
          (gid-change (getf all :gid-change))
          (inode (getf all :inode))
          (device-num (getf all :device-num))
          (dired
           (concat
            (getf all :mode) "<span class="quote"> </span>"
            (number-to-string (getf all :links)) "<span class="quote"> </span>"
            (getf all :uid) "<span class="quote">:</span>"
            (getf all :gid) "<span class="quote"> </span>"
            (if human-size (anything-ff-human-size (getf all :size))
                (int-to-string (getf all :size))) "<span class="quote"> </span>"
                (format-time-string "<span class="quote">%Y-%m-%d %R</span>" (getf all :modif-time))))
          (t all))))

(defun anything-ff-prefix-filename (fname &optional file-or-symlinkp new-file)
  "<span class="quote">Return filename FNAME maybe prefixed with [?] or [@].
If FILE-OR-SYMLINKP is non--nil this mean we assume FNAME is an
existing filename or valid symlink and there is no need to test it.
NEW-FILE when non--nil mean FNAME is a non existing file and
return FNAME prefixed with [?].</span>"
  (let* ((prefix-new (propertize
                      "<span class="quote"> </span>" 'display
                      (propertize "<span class="quote">[?]</span>" 'face 'anything-ff-prefix)))
         (prefix-url (propertize
                      "<span class="quote"> </span>" 'display
                      (propertize "<span class="quote">[@]</span>" 'face 'anything-ff-prefix))))
    (cond ((or file-or-symlinkp (file-exists-p fname)) fname)
          ((or (string-match anything-ff-url-regexp fname)
               (string-match ffap-url-regexp fname))
           (concat prefix-url "<span class="quote"> </span>" fname))
          ((or new-file (not (file-exists-p fname)))
           (concat prefix-new "<span class="quote"> </span>" fname)))))

(defun anything-c-find-files-transformer (files sources)
  "<span class="quote">Transformer for `anything-c-source-find-files'.
Tramp files are not highlighted unless `anything-ff-tramp-not-fancy'
is non--nil.</span>"
  (if (and (string-match tramp-file-name-regexp anything-pattern)
           anything-ff-tramp-not-fancy)
      (if anything-ff-transformer-show-only-basename
          (loop for i in files collect 
                (if (string-match "<span class="quote">[.]\\{1,2\\}$</span>" i)
                    i (cons (anything-c-basename i) i)))
          files)
      (anything-ff-highlight-files files sources)))

(defun anything-ff-highlight-files (files sources)
  "<span class="quote">Candidate transformer for `anything-c-source-find-files' without icons.</span>"
  (loop for i in files
        for disp = (if (and anything-ff-transformer-show-only-basename
                            (not (string-match "<span class="quote">[.]\\{1,2\\}$</span>" i))
                            (not (string-match ffap-url-regexp i))
                            (not (string-match anything-ff-url-regexp i)))
                       (anything-c-basename i) i)
        collect
        (cond ((and (stringp (car (file-attributes i)))
                    (not (anything-ff-valid-symlink-p i))
                    (not (string-match "<span class="quote">^\.#</span>" (anything-c-basename i))))
               (cons (anything-ff-prefix-filename
                      (propertize disp 'face 'anything-ff-invalid-symlink) t)
                     i))
              ((stringp (car (file-attributes i)))
               (cons (anything-ff-prefix-filename
                      (propertize disp 'face 'anything-ff-symlink) t)
                     i))
              ((eq t (car (file-attributes i)))
               (cons (anything-ff-prefix-filename
                      (propertize disp 'face 'anything-ff-directory) t)
                     i))
              ((file-executable-p i)
               (cons (anything-ff-prefix-filename
                      (propertize disp 'face 'anything-ff-executable) t)
                     i))
              ((file-exists-p i)
               (cons (anything-ff-prefix-filename
                      (propertize disp 'face 'anything-ff-file) t)
                     i))
              (t
               (cons (anything-ff-prefix-filename
                      (propertize disp 'face 'anything-ff-file) nil 'new-file)
                     i)))))

(defun anything-find-files-action-transformer (actions candidate)
  "<span class="quote">Action transformer for `anything-c-source-find-files'.</span>"
  (cond ((with-anything-current-buffer
           (eq major-mode 'message-mode))
         (append (subseq actions 0 4)
                 '(("<span class="quote">Gnus attach file(s)</span>" . anything-ff-gnus-attach-files))
                 (subseq actions 4)))
        ((string-match (image-file-name-regexp) candidate)
         (append (subseq actions 0 4)
                 '(("<span class="quote">Rotate image right `M-r'</span>" . anything-ff-rotate-image-right)
                   ("<span class="quote">Rotate image left `M-l'</span>" . anything-ff-rotate-image-left))
                 (subseq actions 4)))
        ((string-match "<span class="quote">\.el$</span>" (anything-aif (anything-marked-candidates)
                                   (car it) candidate))
         (append (subseq actions 0 4)
                 '(("<span class="quote">Byte compile lisp file(s) `M-B, C-u to load'</span>"
                    . anything-find-files-byte-compile)
                   ("<span class="quote">Load File(s) `M-L'</span>" . anything-find-files-load-files))
                 (subseq actions 4)))
        ((and (string-match "<span class="quote">\.html?$</span>" candidate)
              (file-exists-p candidate))
         (append (subseq actions 0 4)
                 '(("<span class="quote">Browse url file</span>" . browse-url-of-file))
                 (subseq actions 5)))
        ((or (string= (file-name-extension candidate) "<span class="quote">pdf</span>")
             (string= (file-name-extension candidate) "<span class="quote">PDF</span>"))
         (append (subseq actions 0 4)
                 '(("<span class="quote">Pdfgrep File(s)</span>" . anything-ff-pdfgrep))
                 (subseq actions 5)))
        (t actions)))

(defun anything-ff-gnus-attach-files (candidate)
  "<span class="quote">Run `gnus-dired-attach' on `anything-marked-candidates' or CANDIDATE.</span>"
  (let ((flist (anything-marked-candidates)))
    (gnus-dired-attach flist)))

(defun anything-ff-rotate-current-image-1 (file &optional num-arg)
  "<span class="quote">Rotate current image at NUM-ARG degrees.
This is a destructive operation on FILE made by external tool mogrify.</span>"
  (declare (special image-dired-display-image-buffer))
  (setq file (file-truename file)) <span class="linecomment">; For symlinked images.</span>
  <span class="linecomment">;; When FILE is not an image-file, do nothing.</span>
  (when (string-match (image-file-name-regexp) file)
    (if (executable-find "<span class="quote">mogrify</span>")
        (progn
          (shell-command (format "<span class="quote">mogrify -rotate %s %s</span>"
                                 (or num-arg 90)
                                 (shell-quote-argument file)))
          (when (buffer-live-p image-dired-display-image-buffer)
            (kill-buffer image-dired-display-image-buffer))
          (image-dired-display-image file)
          (message nil)
          (display-buffer (get-buffer image-dired-display-image-buffer)))
        (error "<span class="quote">mogrify not found</span>"))))

(defun anything-ff-rotate-image-left (candidate)
  "<span class="quote">Rotate image file CANDIDATE left.
This affect directly file CANDIDATE.</span>"
  (anything-ff-rotate-current-image-1 candidate -90))

(defun anything-ff-rotate-image-right (candidate)
  "<span class="quote">Rotate image file CANDIDATE right.
This affect directly file CANDIDATE.</span>"
  (anything-ff-rotate-current-image-1 candidate))

(defun anything-ff-rotate-left-persistent ()
  "<span class="quote">Rotate image left without quitting anything.</span>"
  (interactive)
  (anything-attrset 'image-action1 'anything-ff-rotate-image-left)
  (anything-execute-persistent-action 'image-action1))

(defun anything-ff-rotate-right-persistent ()
  "<span class="quote">Rotate image right without quitting anything.</span>"
  (interactive)
  (anything-attrset 'image-action2 'anything-ff-rotate-image-right)
  (anything-execute-persistent-action 'image-action2))

(defun anything-ff-exif-data (candidate)
  "<span class="quote">Extract exif data from file CANDIDATE using `anything-ff-exif-data-program'.</span>"
  (if (and anything-ff-exif-data-program
           (executable-find anything-ff-exif-data-program))
      (shell-command-to-string (format "<span class="quote">%s %s %s</span>"
                                       anything-ff-exif-data-program
                                       anything-ff-exif-data-program-args
                                       candidate))
      (format "<span class="quote">No program %s found to extract exif</span>"
              anything-ff-exif-data-program)))

(defun anything-find-files-persistent-action (candidate)
  "<span class="quote">Open subtree CANDIDATE without quitting anything.
If CANDIDATE is not a directory expand CANDIDATE filename.
If CANDIDATE is alone, open file CANDIDATE filename.
That's mean:
First hit on C-z expand CANDIDATE second hit open file.
If a prefix arg is given or `anything-follow-mode' is on open file.</span>"
  (let ((follow        (buffer-local-value
                        'anything-follow-mode
                        (get-buffer-create anything-buffer)))
        (new-pattern   (anything-get-selection))
        (num-lines-buf (with-current-buffer anything-buffer
                         (count-lines (point-min) (point-max)))))
    (flet ((insert-in-minibuffer (fname)
             (with-selected-window (minibuffer-window)
               (unless follow
                 (delete-minibuffer-contents)
                 (set-text-properties 0 (length fname) nil fname)
                 (insert fname)))))
      (cond ((and (string= (anything-ff-set-pattern anything-pattern)
                           "<span class="quote">Invalid tramp file name</span>")
                  (string-match tramp-file-name-regexp candidate))
             <span class="linecomment">;; First hit insert hostname and</span>
             <span class="linecomment">;; second hit insert ":" and expand.</span>
             (if (string= candidate anything-pattern)
                 (insert-in-minibuffer (concat candidate "<span class="quote">:</span>"))
                 (insert-in-minibuffer candidate)))
            (<span class="linecomment">;; A symlink directory, expand it's truename.</span>
             (and (file-directory-p candidate) (file-symlink-p candidate))
             (insert-in-minibuffer (file-name-as-directory
                                    (file-truename
                                     (expand-file-name candidate)))))
            <span class="linecomment">;; A directory, open it.</span>
            ((file-directory-p candidate)
             (when (string= (anything-c-basename candidate) "<span class="quote">..</span>")
               (setq anything-ff-last-expanded anything-ff-default-directory))
             (insert-in-minibuffer (file-name-as-directory
                                    (expand-file-name candidate))))
            <span class="linecomment">;; A symlink file, expand to it's true name. (first hit)</span>
            ((and (file-symlink-p candidate) (not current-prefix-arg) (not follow))
             (insert-in-minibuffer (file-truename candidate)))
            <span class="linecomment">;; A regular file, expand it, (first hit)</span>
            ((and (&gt;= num-lines-buf 3) (not current-prefix-arg) (not follow))
             (insert-in-minibuffer new-pattern))
            <span class="linecomment">;; An image file and it is the second hit on C-z,</span>
            <span class="linecomment">;; show the file in `image-dired'.</span>
            ((string-match (image-file-name-regexp) candidate)
             (when (buffer-live-p image-dired-display-image-buffer)
               (kill-buffer image-dired-display-image-buffer))
             (image-dired-display-image candidate)
             (message nil)
             (anything-c-switch-to-buffer image-dired-display-image-buffer)
             (with-current-buffer image-dired-display-image-buffer
               (let ((exif-data (anything-ff-exif-data candidate)))
                 (image-dired-update-property 'help-echo exif-data))))
            <span class="linecomment">;; Allow browsing archive on avfs fs.</span>
            <span class="linecomment">;; Assume volume is already mounted with mountavfs.</span>
            ((and anything-ff-avfs-directory
                  (string-match
                   (regexp-quote (expand-file-name anything-ff-avfs-directory))
                   (file-name-directory candidate))
                  (anything-ff-file-compressed-p candidate))
             (insert-in-minibuffer (concat candidate "<span class="quote">#</span>")))
            <span class="linecomment">;; On second hit we open file.</span>
            <span class="linecomment">;; On Third hit we kill it's buffer maybe.</span>
            (t
             (anything-ff-kill-or-find-buffer-fname candidate))))))

(defun anything-ff-file-compressed-p (candidate)
  "<span class="quote">Whether CANDIDATE is a compressed file or not.</span>"
  (member (file-name-extension candidate)
          anything-ff-file-compressed-list))

(defun anything-c-insert-file-name-completion-at-point (candidate)
  "<span class="quote">Insert file name completion at point.</span>"
  (with-anything-current-buffer
    (if buffer-read-only
        (error "<span class="quote">Error: Buffer `%s' is read-only</span>" (buffer-name))
        (let* ((end         (point))
               (guess       (substring-no-properties (thing-at-point 'filename)))
               (beg         (- (point) (length guess)))
               (full-path-p (or (string-match-p (concat "<span class="quote">^</span>" (getenv "<span class="quote">HOME</span>")) guess)
                                (string-match-p "<span class="quote">^[^\~]</span>" guess))))
          (set-text-properties 0 (length candidate) nil candidate)
          (if (and guess (not (string= guess "<span class="quote"></span>"))
                   (string-match-p "<span class="quote">^~\\|/.*</span>" guess))
              (progn
                (delete-region beg end)
                (insert (if full-path-p
                            (expand-file-name candidate)
                            (abbreviate-file-name candidate))))
              (error "<span class="quote">Aborting completion: No valid file name at point</span>"))))))

(defun* anything-find-files-history (&key (comp-read t))
  "<span class="quote">The `anything-find-files' history.
Show the first `anything-ff-history-max-length' elements of
`anything-ff-history' in an `anything-comp-read'.</span>"
  (let ((history (when anything-ff-history
                   (anything-fast-remove-dups anything-ff-history
                                              :test 'equal))))
    (when history
      (setq anything-ff-history
            (if (&gt;= (length history) anything-ff-history-max-length)
                (subseq history 0 anything-ff-history-max-length)
                history))
      (if comp-read
          (anything-comp-read
           "<span class="quote">Switch to Directory: </span>"
           anything-ff-history
           :name "<span class="quote">Anything Find Files History</span>"
           :must-match t)
          anything-ff-history))))

(defun anything-find-files-1 (fname &optional preselect)
  "<span class="quote">Find FNAME with `anything' completion.
Like `find-file' but with `anything' support.
Use it for non--interactive calls of `anything-find-files'.</span>"
  (when (get-buffer anything-action-buffer)
    (kill-buffer anything-action-buffer))
  (let ((anything-mp-highlight-delay nil)
        <span class="linecomment">;; Be sure we don't erase the precedent minibuffer if some.</span>
        (anything-ff-auto-update-initial-value
         (and anything-ff-auto-update-initial-value
              (not (minibuffer-window-active-p (minibuffer-window)))))
        anything-samewindow)
    (anything :sources 'anything-c-source-find-files
              :input fname
              :preselect preselect
              :keymap anything-find-files-map
              :prompt "<span class="quote">Find Files or Url: </span>"
              :buffer "<span class="quote">*Anything Find Files*</span>")))


(defun anything-find-files-initial-input (&optional input)
  "<span class="quote">Return INPUT if present, otherwise try to guess it.</span>"
  (or (and input (or (and (file-remote-p input) input)
                     (expand-file-name input)))
      (anything-find-files-input
       (ffap-guesser)
       (thing-at-point 'filename))))

(defun anything-find-files-input (fap tap)
  "<span class="quote">Default input of `anything-find-files'.</span>"
  (let* ((def-dir (anything-c-current-directory))
         (lib     (anything-find-library-at-point))
         (url     (anything-ff-find-url-at-point))
         (remp    (and fap (file-remote-p fap)))
         (file-p  (and (not remp)
                       fap
                       (not (string= fap "<span class="quote"></span>"))
                       (file-exists-p fap)
                       tap (not (string= tap "<span class="quote"></span>"))
                       (file-exists-p
                        (file-name-directory (expand-file-name tap def-dir))))))
    (cond (lib) <span class="linecomment">; e.g we are inside a require sexp.</span>
          (url) <span class="linecomment">; String at point is an hyperlink.</span>
          (remp fap)
          (file-p (expand-file-name tap def-dir))
          (t (and (not (string= fap "<span class="quote"></span>")) fap)))))

(defun anything-c-current-directory ()
  "<span class="quote">Return current-directory name at point.
Useful in dired buffers when there is inserted subdirs.</span>"
  (if (eq major-mode 'dired-mode)
      (dired-current-directory)
      default-directory))

(defun anything-ff-find-url-at-point ()
  "<span class="quote">Try to find link to an url in text-property at point.</span>"
  (let* ((he      (get-text-property (point) 'help-echo))
         (ov      (overlays-at (point)))
         (ov-he   (and ov (overlay-get
                           (car (overlays-at (point))) 'help-echo)))
         (w3m-l   (get-text-property (point) 'w3m-href-anchor))
         (nt-prop (get-text-property (point) 'nt-link)))
    <span class="linecomment">;; Org link.</span>
    (when (and (stringp he) (string-match "<span class="quote">^LINK: </span>" he))
      (setq he (replace-match "<span class="quote"></span>" t t he)))
    (loop for i in (list he ov-he w3m-l nt-prop)
          thereis (and (stringp i) (string-match ffap-url-regexp i) i))))

(defun anything-find-library-at-point ()
  "<span class="quote">Try to find library path at point.
Find inside `require' and `declare-function' sexp.</span>"
  (require 'find-func)
  (let* ((beg-sexp (save-excursion (search-backward "<span class="quote">(</span>" (point-at-bol) t)))
         (end-sexp (save-excursion (search-forward "<span class="quote">)</span>" (point-at-eol) t)))
         (sexp     (and beg-sexp end-sexp
                        (buffer-substring-no-properties
                         (1+ beg-sexp) (1- end-sexp)))))
    (ignore-errors
      (cond ((and sexp (string-match "<span class="quote">require \'.+[^)]</span>" sexp))
             (find-library-name
              (replace-regexp-in-string
               "<span class="quote">'\\|\)\\|\(</span>" "<span class="quote"></span>"
               <span class="linecomment">;; If require use third arg, ignore it,</span>
               <span class="linecomment">;; always use library path found in `load-path'.</span>
               (second (split-string (match-string 0 sexp))))))
            ((and sexp (string-match-p "<span class="quote">^declare-function</span>" sexp))
             (find-library-name
              (replace-regexp-in-string
               "<span class="quote">\"\\|ext:</span>" "<span class="quote"></span>"
               (third (split-string sexp)))))
            (t nil)))))

<span class="linecomment">;;; Anything completion for `write-file'.==&gt; C-x C-w</span>
(defvar anything-c-source-write-file
  `((name . "<span class="quote">Write File</span>")
    (header-name . (lambda (name)
                     (concat name anything-c-find-files-doc-header)))
    <span class="linecomment">;; It is needed for filenames with capital letters</span>
    (disable-shortcuts)
    (candidates . anything-find-files-get-candidates)
    (filtered-candidate-transformer anything-c-find-files-transformer)
    (persistent-action . anything-find-files-persistent-action)
    (persistent-help . "<span class="quote">Expand Candidate</span>")
    (volatile)
    (action .
            (("<span class="quote">Write File</span>" . (lambda (candidate)
                               (write-file candidate 'confirm)))))))

<span class="linecomment">;;; Anything completion for `insert-file'.==&gt; C-x i</span>
(defvar anything-c-source-insert-file
  `((name . "<span class="quote">Insert File</span>")
    (header-name . (lambda (name)
                     (concat name anything-c-find-files-doc-header)))
    <span class="linecomment">;; It is needed for filenames with capital letters</span>
    (disable-shortcuts)
    (candidates . anything-find-files-get-candidates)
    (filtered-candidate-transformer anything-c-find-files-transformer)
    (persistent-action . anything-find-files-persistent-action)
    (persistent-help . "<span class="quote">Expand Candidate</span>")
    (volatile)
    (action .
            (("<span class="quote">Insert File</span>" . (lambda (candidate)
                                (when (y-or-n-p (format "<span class="quote">Really insert %s in %s </span>"
                                                        candidate anything-current-buffer))
                                  (insert-file-contents candidate))))))))

<span class="linecomment">;;; Anything completion for copy, rename and (rel)sym/hard/link files from dired.</span>
(defvar anything-c-source-copy-files
  `((name . "<span class="quote">Copy Files</span>")
    (header-name . (lambda (name)
                     (concat name anything-c-find-files-doc-header)))
    <span class="linecomment">;; It is needed for filenames with capital letters</span>
    (disable-shortcuts)
    (candidates . anything-find-files-get-candidates)
    (filtered-candidate-transformer anything-c-find-files-transformer)
    (persistent-action . anything-find-files-persistent-action)
    (persistent-help . "<span class="quote">Expand Candidate</span>")
    (volatile)
    (action .
            (("<span class="quote">Copy File</span>"
              . (lambda (candidate)
                  (anything-dired-action candidate :action 'copy)))
             ("<span class="quote">Copy and Follow</span>"
              . (lambda (candidate)
                  (anything-dired-action candidate :action 'copy :follow t)))))))


(defvar  anything-c-source-rename-files
  `((name . "<span class="quote">Rename Files</span>")
    (header-name . (lambda (name)
                     (concat name anything-c-find-files-doc-header)))
    <span class="linecomment">;; It is needed for filenames with capital letters</span>
    (disable-shortcuts)
    (candidates . anything-find-files-get-candidates)
    (filtered-candidate-transformer anything-c-find-files-transformer)
    (persistent-action . anything-find-files-persistent-action)
    (persistent-help . "<span class="quote">Expand Candidate</span>")
    (volatile)
    (action .
            (("<span class="quote">Rename File</span>"
              . (lambda (candidate)
                  (anything-dired-action candidate :action 'rename)))
             ("<span class="quote">Rename and Follow</span>"
              . (lambda (candidate)
                  (anything-dired-action candidate :action 'rename :follow t)))))))

(defvar anything-c-source-symlink-files
  `((name . "<span class="quote">Symlink Files</span>")
    (header-name . (lambda (name)
                     (concat name anything-c-find-files-doc-header)))
    <span class="linecomment">;; It is needed for filenames with capital letters</span>
    (disable-shortcuts)
    (candidates . anything-find-files-get-candidates)
    (filtered-candidate-transformer anything-c-find-files-transformer)
    (persistent-action . anything-find-files-persistent-action)
    (persistent-help . "<span class="quote">Expand Candidate</span>")
    (volatile)
    (action
     . (("<span class="quote">Symlink File</span>"
         . (lambda (candidate)
             (anything-dired-action candidate :action 'symlink)))
        ("<span class="quote">RelSymlink File</span>"
         . (lambda (candidate)
             (anything-dired-action candidate :action 'relsymlink)))))))


(defvar anything-c-source-hardlink-files
  `((name . "<span class="quote">Hardlink Files</span>")
    (header-name . (lambda (name)
                     (concat name anything-c-find-files-doc-header)))
    <span class="linecomment">;; It is needed for filenames with capital letters</span>
    (disable-shortcuts)
    (candidates . anything-find-files-get-candidates)
    (filtered-candidate-transformer anything-c-find-files-transformer)
    (persistent-action . anything-find-files-persistent-action)
    (persistent-help . "<span class="quote">Expand Candidate</span>")
    (volatile)
    (action
     . (("<span class="quote">Hardlink File</span>"
         . (lambda (candidate)
             (anything-dired-action candidate :action 'hardlink)))))))

(defun* anything-dired-action (candidate &key action follow (files (dired-get-marked-files)))
  "<span class="quote">Copy, rename or symlink file at point or marked files in dired to CANDIDATE.
ACTION is a key that can be one of 'copy, 'rename, 'symlink, 'relsymlink.</span>"
  (when (get-buffer dired-log-buffer) (kill-buffer dired-log-buffer))
  (let ((fn     (case action
                  ('copy       'dired-copy-file)
                  ('rename     'dired-rename-file)
                  ('symlink    'make-symbolic-link)
                  ('relsymlink 'dired-make-relative-symlink)
                  ('hardlink   'dired-hardlink)))
        (marker (case action
                  ((copy rename)   dired-keep-marker-copy)
                  ('symlink        dired-keep-marker-symlink)
                  ('relsymlink     dired-keep-marker-relsymlink)
                  ('hardlink       dired-keep-marker-hardlink)))
        (dirflag (and (= (length files) 1)
                      (file-directory-p (car files))
                      (not (file-directory-p candidate)))))
    (dired-create-files
     fn (symbol-name action) files
     <span class="linecomment">;; CANDIDATE is the destination.</span>
     (if (file-directory-p candidate)
         <span class="linecomment">;; When CANDIDATE is a directory, build file-name in this directory.</span>
         <span class="linecomment">;; Else we use CANDIDATE.</span>
         #'(lambda (from)
             (expand-file-name (file-name-nondirectory from) candidate))
         #'(lambda (from) candidate))
     marker)
    (push (file-name-as-directory
           (if (file-directory-p candidate)
               (expand-file-name candidate)
               (file-name-directory candidate)))
           anything-ff-history)
    (when (and follow (not (get-buffer dired-log-buffer)))
      (let ((target (directory-file-name candidate)))
        (unwind-protect
             (progn
               (setq anything-ff-cand-to-mark
                     (anything-get-dest-fnames-from-list files candidate dirflag))
               (if (and dirflag (eq action 'rename))
                   (anything-find-files-1 (file-name-directory target)
                                          (if anything-ff-transformer-show-only-basename
                                              (anything-c-basename target) target))
                   (anything-find-files-1 (expand-file-name candidate))))
          (setq anything-ff-cand-to-mark nil))))))

(defun anything-c-basename (fname &optional ext)
  "<span class="quote">Print FNAME  with any  leading directory  components removed.
If specified, also remove filename extension EXT.</span>"
  (if (and ext (or (string= (file-name-extension fname) ext)
                   (string= (file-name-extension fname t) ext))
           (not (file-directory-p fname)))
      (file-name-sans-extension (file-name-nondirectory fname))
      (file-name-nondirectory (directory-file-name fname))))

(defun anything-get-dest-fnames-from-list (flist dest-cand rename-dir-flag)
  "<span class="quote">Transform filenames of FLIST to abs of DEST-CAND.
If RENAME-DIR-FLAG is non--nil collect the `directory-file-name' of transformed
members of FLIST.</span>"
  <span class="linecomment">;; At this point files have been renamed/copied at destination.</span>
  <span class="linecomment">;; That's mean DEST-CAND exists.</span>
  (loop
        with dest = (expand-file-name dest-cand)
        for src in flist
        for basename-src = (anything-c-basename src)
        for fname = (cond (rename-dir-flag (directory-file-name dest))
                          ((file-directory-p dest)
                           (concat (file-name-as-directory dest) basename-src))
                          (t dest))
        when (file-exists-p fname)
        collect fname into tmp-list
        finally return (sort tmp-list 'string&lt;)))

(defun anything-ff-maybe-mark-candidates ()
  "<span class="quote">Mark all candidates of list `anything-ff-cand-to-mark'.</span>"
  (when (and (string= (assoc-default 'name (anything-get-current-source))
                      (assoc-default 'name anything-c-source-find-files))
             anything-ff-cand-to-mark)
    (with-anything-window
      (while anything-ff-cand-to-mark
        (if (string= (car anything-ff-cand-to-mark) (anything-get-selection))
            (progn
              (anything-make-visible-mark)
              (anything-next-line)
              (setq anything-ff-cand-to-mark (cdr anything-ff-cand-to-mark)))
            (anything-next-line)))
      (unless (anything-this-visible-mark)
        (anything-prev-visible-mark)))))

(add-hook 'anything-after-update-hook #'anything-ff-maybe-mark-candidates)

(defun* anything-dired-do-action-on-file (&key action)
  (let* ((files     (dired-get-marked-files))
         (len       (length files))
         (fname     (if (&gt; len 1)
                        (format "<span class="quote">* %d Files</span>" len)
                        (car files)))
         (source    (case action
                      ('copy     'anything-c-source-copy-files)
                      ('rename   'anything-c-source-rename-files)
                      ('symlink  'anything-c-source-symlink-files)
                      ('hardlink 'anything-c-source-hardlink-files)))
         (prompt-fm (case action
                      ('copy     "<span class="quote">Copy %s to: </span>")
                      ('rename   "<span class="quote">Rename %s to: </span>")
                      ('symlink  "<span class="quote">Symlink %s to: </span>")
                      ('hardlink "<span class="quote">Hardlink %s to: </span>")))
         (buffer    (case action
                      ('copy     "<span class="quote">*Anything Copy Files*</span>")
                      ('rename   "<span class="quote">*Anything Rename Files*</span>")
                      ('symlink  "<span class="quote">*Anything Symlink Files*</span>")
                      ('hardlink "<span class="quote">*Anything Hardlink Files*</span>")))
         (anything-mp-highlight-delay     nil))
    (anything :sources source
              :input (or (dired-dwim-target-directory)
                         (expand-file-name (anything-c-current-directory)))
              :preselect (dired-get-filename)
              :prompt (format prompt-fm fname)
              :keymap anything-c-read-file-map
              :buffer buffer)))

<span class="linecomment">;;;###autoload</span>
(define-minor-mode anything-dired-mode ()
  "<span class="quote">Enable anything completion in Dired functions.
Bindings affected are C, R, S, H.
This is deprecated for Emacs24+ users, use `ac-mode' instead.</span>"
  :group 'anything-config
  :global t
  (if anything-dired-mode
      (progn
        (substitute-key-definition
         'dired-do-copy 'anything-dired-copy-file dired-mode-map)
        (substitute-key-definition
         'dired-do-rename 'anything-dired-rename-file dired-mode-map)
        (substitute-key-definition
         'dired-do-symlink 'anything-dired-symlink-file dired-mode-map)
        (substitute-key-definition
         'dired-do-hardlink 'anything-dired-hardlink-file dired-mode-map))
      (substitute-key-definition
       'anything-dired-copy-file 'dired-do-copy dired-mode-map)
      (substitute-key-definition
       'anything-dired-rename-file 'dired-do-rename dired-mode-map)
      (substitute-key-definition
       'anything-dired-symlink-file 'dired-do-symlink dired-mode-map)
      (substitute-key-definition
       'anything-dired-hardlink-file 'dired-do-hardlink dired-mode-map)))

(defalias 'anything-dired-bindings 'anything-dired-mode)

(defun* anything-c-read-file-name
    (prompt
     &key
     (name "<span class="quote">Read File Name</span>")
     (initial-input (expand-file-name default-directory))
     (buffer "<span class="quote">*Anything Completions*</span>")
     test
     (preselect nil)
     (history nil)
     must-match
     (marked-candidates nil)
     (alistp t)
     (persistent-action 'anything-find-files-persistent-action)
     (persistent-help "<span class="quote">Hit1 Expand Candidate, Hit2 or (C-u) Find file</span>"))
  "<span class="quote">Read a file name with anything completion.
It is anything `read-file-name' emulation.

Argument PROMPT is the default prompt to use.

Keys description:

- NAME: Source name, default to \"Read File Name\".

- INITIAL-INPUT: Where to start read file name, default to `default-directory'.

- BUFFER: `anything-buffer' name default to \"*Anything Completions*\".

- TEST: A predicate called with one arg 'candidate'.

- PRESELECT: anything preselection.

- HISTORY: Display HISTORY in a special source.

- MUST-MATCH: Can be 'confirm, nil, or t.

- MARKED-CANDIDATES: When non--nil return a list of marked candidates.

- ALISTP: Don't use `all-completions' in history (take effect only on history).

- PERSISTENT-ACTION: a persistent action function.

- PERSISTENT-HELP: persistent help message.</span>"
  (when (get-buffer anything-action-buffer)
    (kill-buffer anything-action-buffer))
  
  <span class="linecomment">;; Assume completion have been already required,</span>
  <span class="linecomment">;; so always use 'confirm.</span>
  (when (eq must-match 'confirm-after-completion)
    (setq must-match 'confirm))

  (flet ((action-fn (candidate)
           (if marked-candidates
               (anything-marked-candidates)
               (identity candidate))))
  
    (let* ((anything-mp-highlight-delay nil)
           <span class="linecomment">;; Be sure we don't erase the underlying minibuffer if some.</span>
           (anything-ff-auto-update-initial-value
            (and anything-ff-auto-update-initial-value
                 (not (minibuffer-window-active-p (minibuffer-window)))))
           anything-same-window
           (hist (and history (anything-comp-read-get-candidates
                               history nil nil alistp)))
           (minibuffer-completion-confirm must-match)
           (must-match-map (when must-match
                             (let ((map (make-sparse-keymap)))
                               (define-key map (kbd "<span class="quote">RET</span>")
                                 'anything-confirm-and-exit-minibuffer)
                               map)))
           (anything-map (if must-match-map
                             (make-composed-keymap
                              must-match-map anything-c-read-file-map)
                             anything-c-read-file-map)))
      
      (or (anything
           :sources
           `(((name . ,(format "<span class="quote">%s History</span>" name))
              (header-name . (lambda (name)
                               (concat name anything-c-find-files-doc-header)))
              (disable-shortcuts)
              (mode-line . anything-read-file-name-mode-line-string)
              (candidates . hist)
              (persistent-action . ,persistent-action)
              (persistent-help . ,persistent-help)
              (action . ,'action-fn))
             ((name . ,name)
              (header-name . (lambda (name)
                               (concat name anything-c-find-files-doc-header)))
              (init . (lambda ()
                        (setq anything-ff-auto-update-flag
                              anything-ff-auto-update-initial-value)))
              <span class="linecomment">;; It is needed for filenames with capital letters</span>
              (disable-shortcuts)
              (mode-line . anything-read-file-name-mode-line-string)
              (candidates
               . (lambda ()
                   (if test
                       (loop with hn = (anything-ff-tramp-hostnames)
                             for i in (anything-find-files-get-candidates
                                       must-match)
                             when (or (member i hn)            <span class="linecomment">; A tramp host</span>
                                      (funcall test i)         <span class="linecomment">; Test ok</span>
                                      (not (file-exists-p i))) <span class="linecomment">; A new file.</span>
                             collect i)
                       (anything-find-files-get-candidates must-match))))
              (filtered-candidate-transformer anything-c-find-files-transformer)
              (persistent-action . ,persistent-action)
              (candidate-number-limit . 9999)
              (toggle-auto-update . anything-ff-toggle-auto-update)
              (persistent-help . ,persistent-help)
              (volatile)
              (action . ,'action-fn)))
           :input initial-input
           :prompt prompt
           :resume 'noresume
           :buffer buffer
           :preselect preselect)
          (when (and (not (string= anything-pattern "<span class="quote"></span>"))
                     (eq anything-exit-status 0)
                     (eq must-match 'confirm))
            (identity anything-pattern))
          (keyboard-quit)))))

 
<span class="linecomment">;;; File Cache</span>
(defvar anything-c-file-cache-initialized-p nil)

(defvar anything-c-file-cache-files nil)

(defvar anything-c-source-file-cache
  `((name . "<span class="quote">File Cache</span>")
    (init
     . (lambda ()
         (require 'filecache nil t)
         (unless anything-c-file-cache-initialized-p
           (setq anything-c-file-cache-files
                 (loop for item in file-cache-alist append
                       (destructuring-bind (base &rest dirs) item
                         (loop for dir in dirs collect
                               (concat dir base)))))
           (defadvice file-cache-add-file (after file-cache-list activate)
             (add-to-list 'anything-c-file-cache-files (expand-file-name file)))
           (setq anything-c-file-cache-initialized-p t))))
    (keymap . ,anything-generic-files-map)
    (help-message . anything-generic-file-help-message)
    (mode-line . anything-generic-file-mode-line-string)
    (candidates . anything-c-file-cache-files)
    (match anything-c-match-on-basename)
    (type . file)))

 
<span class="linecomment">;;; Locate</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; NOTE for WINDOZE users:</span>
<span class="linecomment">;; You have to install Everything with his command line interface here:</span>
<span class="linecomment">;; http://www.voidtools.com/download.php</span>

(defun anything-ff-find-locatedb (&optional from-ff)
  "<span class="quote">Try to find if a local locatedb file is available.
The search is done in `anything-ff-default-directory' or
fall back to `default-directory' if FROM-FF is nil.</span>"
  (when anything-ff-locate-db-filename
    (cond ((and anything-ff-default-directory
                from-ff
                (file-exists-p (expand-file-name
                                anything-ff-locate-db-filename
                                anything-ff-default-directory))
                (expand-file-name
                 anything-ff-locate-db-filename
                 anything-ff-default-directory)))
          ((and (not from-ff)
                (file-exists-p (expand-file-name
                                anything-ff-locate-db-filename
                                default-directory))
                (expand-file-name
                 anything-ff-locate-db-filename
                 default-directory))))))

(defun anything-locate-1 (&optional localdb init from-ff)
  "<span class="quote">Generic function to run Locate.
if LOCALDB is non--nil search and use a local locate db file.
INIT is a string to use as initial input in prompt.
See `anything-locate-with-db' and `anything-locate'.</span>"
  (anything-locate-with-db
   (and localdb
        (or (anything-ff-find-locatedb from-ff)
            (anything-c-read-file-name
             "<span class="quote">LocateDBFiles: </span>"
             :initial-input (or anything-ff-default-directory
                                default-directory)
             :marked-candidates t
             :preselect anything-locate-db-file-regexp
             :test #'(lambda (x)
                       (if anything-locate-db-file-regexp
                           <span class="linecomment">;; Select only locate db files and directories</span>
                           <span class="linecomment">;; to allow navigation.</span>
                           (or (string-match
                                anything-locate-db-file-regexp x)
                               (file-directory-p x))
                           x)))))
   init))
<span class="linecomment">;; (anything-locate-1 t)</span>

(defun anything-locate-with-db (&optional db initial-input)
  "<span class="quote">Run locate -d DB.
If DB is not given or nil use locate without -d option.
Argument DB can be given as a string or list of db files.
Argument INITIAL-INPUT is a string to use as initial-input.
See also `anything-locate'.</span>"
  (when (and db (stringp db)) (setq db (list db)))
  (unless anything-c-locate-command
    (setq anything-c-locate-command
          (case system-type
            ('gnu/linux "<span class="quote">locate -i -r %s</span>")
            ('berkeley-unix "<span class="quote">locate -i %s</span>")
            ('windows-nt "<span class="quote">es -i -r %s</span>")
            (t "<span class="quote">locate %s</span>"))))  
  (let ((anything-c-locate-command
         (if db
             (replace-regexp-in-string
              "<span class="quote">locate</span>"
              (format "<span class="quote">locate -d %s</span>"
                      (mapconcat 'identity
                                 <span class="linecomment">;; Remove eventually</span>
                                 <span class="linecomment">;; marked directories by error.</span>
                                 (loop for i in db
                                       unless (file-directory-p i)
                                       collect i) "<span class="quote">:</span>"))
              anything-c-locate-command)
             anything-c-locate-command)))
    (anything :sources 'anything-c-source-locate
              :buffer "<span class="quote">*anything locate*</span>"
              :input initial-input
              :keymap anything-generic-files-map)))
<span class="linecomment">;; (anything-locate-with-db "~/locate.db")</span>

(defun anything-c-locate-init ()
  "<span class="quote">Initialize async locate process for `anything-c-source-locate'.</span>"
  (setq mode-line-format
        '("<span class="quote"> </span>" mode-line-buffer-identification "<span class="quote"> </span>"
          (line-number-mode "<span class="quote">%l</span>") "<span class="quote"> </span>"
          (:eval (propertize "<span class="quote">(Locate Process Running) </span>"
                  'face '((:foreground "<span class="quote">red</span>"))))))
  (prog1
      (start-process-shell-command "<span class="quote">locate-process</span>" nil
                                   (format anything-c-locate-command
                                           anything-pattern))
    (set-process-sentinel (get-process "<span class="quote">locate-process</span>")
                          #'(lambda (process event)
                              (when (string= event "<span class="quote">finished\n</span>")
                                (with-anything-window
                                  (force-mode-line-update nil)
                                  (anything-update-move-first-line)))))))

(defvar anything-c-source-locate
  `((name . "<span class="quote">Locate</span>")
    (candidates . anything-c-locate-init)
    (type . file)
    (requires-pattern . 3)
    (keymap . ,anything-generic-files-map)
    (help-message . anything-generic-file-help-message)
    (candidate-number-limit . 9999)
    (mode-line . anything-generic-file-mode-line-string)
    (delayed))
  "<span class="quote">Find files matching the current input pattern with locate.</span>")

(defun anything-c-locate-read-file-name (prompt &optional init)
  "<span class="quote">Search a file with locate and return it's filename.
Use argument PROMPT and INIT for `anything' arguments
prompt and input.</span>"
  (anything :sources
            '((name . "<span class="quote">Locate</span>")
              (candidates . anything-c-locate-init)
              (action . identity)
              (requires-pattern . 3)
              (candidate-number-limit . 9999)
              (mode-line . anything-generic-file-mode-line-string)
              (delayed))
            :prompt prompt
            :input init
            :buffer "<span class="quote">*anything locate rfn*</span>"))


 
<span class="linecomment">;;; Anything Incremental Grep.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Allow to grep incrementally with anything interface.</span>
<span class="linecomment">;; It allow also to Grep files recursively without using 'find' shell command.</span>
<span class="linecomment">;; On Windows you will need at least Grep version 2.5.4 of Gnuwin32.</span>
(defvar anything-c-grep-default-command
  "<span class="quote">grep -d skip %e -niH -e %p %f</span>"
  "<span class="quote">Default grep format command for `anything-do-grep-1'.
Where:
'%e' format spec is for --exclude or --include grep options.
'%p' format spec is for pattern.
'%f' format spec is for filenames.</span>")

(defvar anything-c-grep-default-recurse-command
  "<span class="quote">grep -d recurse %e -niH -e %p %f</span>"
  "<span class="quote">Default recursive grep format command for `anything-do-grep-1'.
See `anything-c-grep-default-command' for format specs.</span>")

(defvar anything-c-default-zgrep-command "<span class="quote">zgrep -niH -e %p %f</span>")

(defvar anything-c-rzgrep-cache (make-hash-table :test 'equal))

(defvar anything-c-grep-default-function 'anything-c-grep-init)

(defvar anything-c-grep-debug-command-line nil
  "<span class="quote">Turn on anything grep command-line debugging when non--nil.</span>")

(defvar anything-c-zgrep-recurse-flag nil)

(defvar anything-c-grep-history nil)

(defvar anything-c-grep-max-length-history 100
  "<span class="quote">*Max number of elements to save in `anything-c-grep-history'.</span>")

(defun anything-c-grep-prepare-candidates (candidates)
  "<span class="quote">Prepare filenames and directories CANDIDATES for grep command line.</span>"
  <span class="linecomment">;; If one or more candidate is a directory, search in all files</span>
  <span class="linecomment">;; of this candidate (e.g /home/user/directory/*).</span>
  <span class="linecomment">;; If r option is enabled search also in subdidrectories.</span>
  <span class="linecomment">;; We need here to expand wildcards to support crap windows filenames</span>
  <span class="linecomment">;; as grep doesn't accept quoted wildcards (e.g "dir/*.el").</span>
  (if anything-c-zgrep-recurse-flag
      (mapconcat 'shell-quote-argument candidates "<span class="quote"> </span>")
      (loop for i in candidates append
            (cond ( <span class="linecomment">;; Candidate is a directory and we use recursion.</span>
                   (and (file-directory-p i)
                        (anything-c-grep-recurse-p))
                   (list (expand-file-name i)))
                  <span class="linecomment">;; Candidate is a directory, search in all files.</span>
                  ((file-directory-p i)
                   (file-expand-wildcards
                    (concat (file-name-as-directory (expand-file-name i)) "<span class="quote">*</span>") t))
                  <span class="linecomment">;; Candidate is a file or wildcard and we use recursion, use the</span>
                  <span class="linecomment">;; current directory instead of candidate.</span>
                  ((and (or (file-exists-p i) (string-match "<span class="quote">\*</span>" i))
                        (anything-c-grep-recurse-p))
                   (list (expand-file-name
                          (directory-file-name <span class="linecomment">; Needed for windoze.</span>
                           (file-name-directory (directory-file-name i))))))
                  <span class="linecomment">;; Candidate use wildcard.</span>
                  ((string-match "<span class="quote">^\*</span>" (anything-c-basename i))
                   (file-expand-wildcards i t))
                  <span class="linecomment">;; Else should be one or more file.</span>
                  (t (list i))) into all-files
            finally return
            (mapconcat 'shell-quote-argument all-files "<span class="quote"> </span>"))))

(defun anything-c-grep-recurse-p ()
  "<span class="quote">Check if `anything-do-grep-1' have switched to recursive.</span>"
  (let ((args (replace-regexp-in-string
               "<span class="quote">grep</span>" "<span class="quote"></span>" anything-c-grep-default-command)))
    (string-match-p "<span class="quote">r\\|recurse</span>" args)))

(defun anything-c-grep-init (only-files &optional include zgrep)
  "<span class="quote">Start an asynchronous grep process in ONLY-FILES list.</span>"
  (let* ((fnargs        (anything-c-grep-prepare-candidates
                         (if (file-remote-p anything-ff-default-directory)
                             (mapcar #'(lambda (x)
                                         (file-remote-p x 'localname))
                                     only-files)
                             only-files)))
         (ignored-files (mapconcat
                         #'(lambda (x)
                             (concat "<span class="quote">--exclude=</span>" (shell-quote-argument x)))
                         grep-find-ignored-files "<span class="quote"> </span>"))
         (ignored-dirs  (mapconcat
                         <span class="linecomment">;; Need grep version &gt;=2.5.4 of Gnuwin32 on windoze.</span>
                         #'(lambda (x)
                             (concat "<span class="quote">--exclude-dir=</span>" (shell-quote-argument x)))
                         grep-find-ignored-directories "<span class="quote"> </span>"))
         (exclude       (if (anything-c-grep-recurse-p)
                            (concat (or include ignored-files) "<span class="quote"> </span>" ignored-dirs)
                            ignored-files))
         (cmd-line      (format-spec
                         anything-c-grep-default-command
                         (delq nil
                               (list (unless zgrep (cons ?e exclude))
                                     (cons ?p (shell-quote-argument anything-pattern))
                                     (cons ?f fnargs))))))
    (when anything-c-grep-debug-command-line
      (with-current-buffer (get-buffer-create "<span class="quote">*any grep debug*</span>")
        (goto-char (point-max))
        (insert (concat "<span class="quote">&gt;&gt;&gt; </span>" cmd-line "<span class="quote">\n\n</span>"))))
    (setq mode-line-format
          '("<span class="quote"> </span>" mode-line-buffer-identification "<span class="quote"> </span>"
            (line-number-mode "<span class="quote">%l</span>") "<span class="quote"> </span>"
            (:eval (when (get-process "<span class="quote">grep-process</span>")
                     (propertize "<span class="quote">[Grep Process Running] </span>"
                                 'face 'anything-grep-running)))))
    (force-mode-line-update nil)
    (prog1
        (let ((default-directory anything-ff-default-directory))
          (start-file-process-shell-command "<span class="quote">grep-process</span>" nil cmd-line))
      (message nil)
      (set-process-sentinel
       (get-process "<span class="quote">grep-process</span>")
       #'(lambda (process event)
           (when (string= event "<span class="quote">finished\n</span>")
             (with-anything-window
               (anything-update-move-first-line)
               (setq mode-line-format
                     '("<span class="quote"> </span>" mode-line-buffer-identification "<span class="quote"> </span>"
                       (line-number-mode "<span class="quote">%l</span>") "<span class="quote"> </span>"
                       (:eval (propertize
                               (format "<span class="quote">[Grep Process Finished - (%s results)] </span>"
                                       (let ((nlines (1- (count-lines
                                                          (point-min)
                                                          (point-max)))))
                                         (if (&gt; nlines 0) nlines 0)))
                               'face 'anything-grep-finish))))
               (force-mode-line-update nil))))))))

(defun anything-c-grep-action (candidate &optional where mark)
  "<span class="quote">Define a default action for `anything-do-grep' on CANDIDATE.
WHERE can be one of other-window, elscreen, other-frame.</span>"
  (let* ((split        (anything-c-grep-split-line candidate))
         (lineno       (string-to-number (nth 1 split)))
         (loc-fname    (car split))
         (tramp-method (file-remote-p anything-ff-default-directory 'method))
         (tramp-host   (file-remote-p anything-ff-default-directory 'host))
         (tramp-prefix (concat "<span class="quote">/</span>" tramp-method "<span class="quote">:</span>" tramp-host "<span class="quote">:</span>"))
         (fname        (if tramp-host
                           (concat tramp-prefix loc-fname) loc-fname)))
    (case where
      (other-window (find-file-other-window fname))
      (elscreen     (anything-elscreen-find-file fname))
      (other-frame  (find-file-other-frame fname))
      (grep         (anything-c-grep-save-results-1))
      (t (find-file fname)))
    (unless (eq where 'grep)
      (anything-goto-line lineno))
    (when mark
      (set-marker (mark-marker) (point))
      (push-mark (point) 'nomsg))
    <span class="linecomment">;; Save history</span>
    (unless (or anything-in-persistent-action
                (string= anything-pattern "<span class="quote"></span>"))
      (setq anything-c-grep-history
            (cons anything-pattern
                  (delete anything-pattern anything-c-grep-history)))
      (when (&gt; (length anything-c-grep-history)
               anything-c-grep-max-length-history)
        (setq anything-c-grep-history
              (delete (car (last anything-c-grep-history))
                      anything-c-grep-history))))))

(defun anything-c-grep-other-window (candidate)
  "<span class="quote">Jump to result in other window from anything grep.</span>"
  (anything-c-grep-action candidate 'other-window))

(defun anything-c-grep-other-frame (candidate)
  "<span class="quote">Jump to result in other frame from anything grep.</span>"
  (anything-c-grep-action candidate 'other-frame))

(defun anything-c-grep-jump-elscreen (candidate)
  "<span class="quote">Jump to result in elscreen from anything grep.</span>"
  (anything-c-grep-action candidate 'elscreen))

(defun anything-c-grep-save-results (_candidate)
  (anything-c-grep-action _candidate 'grep))

(defun anything-c-grep-save-results-1 ()
  "<span class="quote">Save anything grep result in a `grep-mode' buffer.</span>"
  (let ((buf "<span class="quote">*grep*</span>")
        new-buf)
    (when (get-buffer buf)
      (setq new-buf (read-string "<span class="quote">GrepBufferName: </span>" buf))
      (loop for b in (anything-c-buffer-list)
            when (and (string= new-buf b)
                      (not (y-or-n-p
                            (format "<span class="quote">Buffer `%s' already exists overwrite? </span>"
                                    new-buf))))
            do (setq new-buf (read-string "<span class="quote">GrepBufferName: </span>" "<span class="quote">*grep </span>")))
      (setq buf new-buf))
    (with-current-buffer (get-buffer-create buf)
      (let ((inhibit-read-only t))
        (erase-buffer)
        (insert "<span class="quote">-*- mode: grep -*-\n\n</span>"
                (format "<span class="quote">Grep Results for `%s':\n\n</span>" anything-pattern))
        (save-excursion
          (insert (with-current-buffer anything-buffer
                    (goto-char (point-min)) (forward-line 1)
                    (buffer-substring (point) (point-max))))
          (grep-mode))))
    (message "<span class="quote">Anything Grep Results saved in `%s' buffer</span>" buf)))

(defun anything-c-grep-persistent-action (candidate)
  "<span class="quote">Persistent action for `anything-do-grep'.
With a prefix arg record CANDIDATE in `mark-ring'.</span>"
  (if current-prefix-arg
      (anything-c-grep-action candidate nil 'mark)
      (anything-c-grep-action candidate))
  (anything-match-line-color-current-line))

(defun anything-c-grep-guess-extensions (files)
  "<span class="quote">Try to guess file extensions in FILES list when using grep recurse.
These extensions will be added to command line with --include arg of grep.</span>"
  (loop
        with glob-list = nil
        with lst = (if (file-directory-p (car files))
                       (directory-files
                        (car files) nil
                        directory-files-no-dot-files-regexp)
                       files)
        for i in lst
        for ext = (file-name-extension i t)
        for glob = (and ext (not (string= ext "<span class="quote"></span>"))
                        (concat "<span class="quote">*</span>" ext))
        unless (or (not glob)
                   (member glob glob-list)
                   (member glob grep-find-ignored-files))
        collect glob into glob-list
        finally return glob-list))

(defun anything-do-grep-1 (only &optional recurse zgrep)
  "<span class="quote">Launch grep with a list of ONLY files.
When RECURSE is given use -r option of grep and prompt user
to set the --include args of grep.
You can give more than one arg separated by space.
e.g *.el *.py *.tex.
If it's empty --exclude `grep-find-ignored-files' is used instead.</span>"
  (let* ((anything-compile-source-functions
          <span class="linecomment">;; rule out anything-match-plugin because the input is one regexp.</span>
          (delq 'anything-compile-source--match-plugin
                (copy-sequence anything-compile-source-functions)))
         (exts (anything-c-grep-guess-extensions only))
         (globs (and (not zgrep) (mapconcat 'identity exts "<span class="quote"> </span>")))
         (include-files (and recurse (not zgrep)
                             (read-string "<span class="quote">OnlyExt(*.[ext]): </span>"
                                          globs)))
         <span class="linecomment">;; Set `minibuffer-history' AFTER includes-files</span>
         <span class="linecomment">;; to avoid storing wild-cards here.</span>
         (minibuffer-history anything-c-grep-history)
         (anything-c-grep-default-command (cond ((and recurse zgrep) anything-c-default-zgrep-command)
                                                (recurse anything-c-grep-default-recurse-command)
                                                (zgrep anything-c-default-zgrep-command)
                                                (t anything-c-grep-default-command)))
         <span class="linecomment">;; Disable match-plugin and use here own highlighting.</span>
         (anything-mp-highlight-delay     nil))
    (when include-files
      (setq include-files
            (and (not (string= include-files "<span class="quote"></span>"))
                 (mapconcat #'(lambda (x)
                                (concat "<span class="quote">--include=</span>" (shell-quote-argument x)))
                            (split-string include-files) "<span class="quote"> </span>"))))
    <span class="linecomment">;; When called as action from an other source e.g *-find-files</span>
    <span class="linecomment">;; we have to kill action buffer.</span>
    (when (get-buffer anything-action-buffer)
      (kill-buffer anything-action-buffer))
    <span class="linecomment">;; `anything-find-files' haven't already started,</span>
    <span class="linecomment">;; give a default value to `anything-ff-default-directory'.</span>
    (setq anything-ff-default-directory (or anything-ff-default-directory
                                            default-directory))
    (anything
     :sources
     `(((name . "<span class="quote">Grep</span>")
        (header-name . (lambda (name)
                         (concat name "<span class="quote">(C-c ? Help)</span>")))
        (candidates
         . (lambda ()
             (funcall anything-c-grep-default-function only include-files zgrep)))
        (filtered-candidate-transformer anything-c-grep-cand-transformer)
        (candidate-number-limit . 9999)
        (mode-line . anything-grep-mode-line-string)
        (keymap . ,anything-c-grep-map)
        (action . ,(delq
                    nil
                    `(("<span class="quote">Find File</span>" . anything-c-grep-action)
                      ("<span class="quote">Find file other frame</span>" . anything-c-grep-other-frame)
                      ,(and (locate-library "<span class="quote">elscreen</span>")
                            '("<span class="quote">Find file in Elscreen</span>"
                              . anything-c-grep-jump-elscreen))
                      ("<span class="quote">Save results in grep buffer</span>" . anything-c-grep-save-results)
                      ("<span class="quote">Find file other window</span>" . anything-c-grep-other-window))))
        (persistent-action . anything-c-grep-persistent-action)
        (persistent-help . "<span class="quote">Jump to line (`C-u' Record in mark ring)</span>")
        (requires-pattern . 3)
        (delayed)))
     :buffer "<span class="quote">*anything grep*</span>")))

(defun anything-ff-zgrep-1 (flist recursive)
  (unwind-protect
       (let* ((def-dir (or anything-ff-default-directory
                           default-directory))
              (only    (if recursive
                           (or (gethash def-dir anything-c-rzgrep-cache)
                               (puthash
                                def-dir
                                (anything-c-walk-directory
                                 def-dir
                                 :directories nil
                                 :path 'full
                                 :match "<span class="quote">.*\\(\.gz\\|\.bz\\|\.xz\\|\.lzma\\)$</span>")
                                anything-c-rzgrep-cache))
                           flist)))
         (when recursive (setq anything-c-zgrep-recurse-flag t))
         (anything-do-grep-1 only recursive 'zgrep))
    (setq anything-c-zgrep-recurse-flag nil)))

(defun anything-c-grep-split-line (line)
  "<span class="quote">Split a grep output line.</span>"
  (let (beg fname lineno str)
    <span class="linecomment">;; Don't print until grep line is valid.</span>
    (when (string-match "<span class="quote">\\(.*\\)\\(:[0-9]+:\\)\\(.*\\)</span>" line)
      (with-temp-buffer
        (insert line)
        (goto-char (point-min))
        (setq beg (point))
        (forward-char 2)
        (re-search-forward "<span class="quote">:</span>" nil t)
        (setq fname (buffer-substring-no-properties beg (1- (point))))
        (setq beg (point))
        (re-search-forward "<span class="quote">:</span>" nil t)
        (setq lineno (buffer-substring-no-properties beg (1- (point))))
        (setq str (buffer-substring-no-properties (point) (point-at-eol))))
      (list fname lineno str))))

(defun anything-c-grep-cand-transformer (candidates sources)
  "<span class="quote">Filtered candidate transformer function for `anything-do-grep'.</span>"
  (loop for i in candidates
        for split  = (and i (anything-c-grep-split-line i))
        for fname  = (car split)
        for lineno = (nth 1 split)
        for str    = (nth 2 split)
        when (and fname lineno str)
        collect
        (cons (concat (propertize (file-name-nondirectory fname)
                                  'face 'anything-grep-file
                                  'help-echo fname) "<span class="quote">:</span>"
                                  (propertize lineno 'face 'anything-grep-lineno) "<span class="quote">:</span>"
                                  (anything-c-grep-highlight-match str))
              i)))

(defun anything-c-grep-highlight-match (str)
  "<span class="quote">Highlight in string STR all occurences matching `anything-pattern'.</span>"
  (condition-case nil
      (with-temp-buffer
        (insert str)
        (goto-char (point-min))
        (while (and (re-search-forward anything-pattern nil t)
                    (&gt; (- (match-end 0) (match-beginning 0)) 0))
          (add-text-properties
           (match-beginning 0) (match-end 0)
           '(face anything-grep-match)))
        (buffer-string))
    (error nil)))

<span class="linecomment">;; Go to next or precedent file (common to etags and grep).</span>
(defun anything-c-goto-next-or-prec-file (n)
  "<span class="quote">Go to next or precedent candidate file in anything grep/etags buffers.
If N is positive go forward otherwise go backward.</span>"
  (with-anything-window
    (let* ((current-line-list  (split-string
                                (buffer-substring
                                 (point-at-bol)
                                 (point-at-eol)) "<span class="quote">:</span>"))
           (current-fname      (nth 0 current-line-list))
           (fn-b-o-f           (if (eq n 1) 'eobp 'bobp)))
      (catch 'break
        (while (not (funcall fn-b-o-f))
          (forward-line n) <span class="linecomment">; Go forward or backward depending of n value.</span>
          (unless (search-forward current-fname (point-at-eol) t)
            (anything-mark-current-line)
            (throw 'break nil))))
      (cond ((and (eq n 1) (eobp))
             (re-search-backward "<span class="quote">.</span>")
             (forward-line 0)
             (anything-mark-current-line))
            ((and (&lt; n 1) (bobp))
             (forward-line 1)
             (anything-mark-current-line))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-goto-precedent-file ()
  "<span class="quote">Go to precedent file in anything grep/etags buffers.</span>"
  (interactive)
  (anything-c-goto-next-or-prec-file -1))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-goto-next-file ()
  "<span class="quote">Go to precedent file in anything grep/etags buffers.</span>"
  (interactive)
  (anything-c-goto-next-or-prec-file 1))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-grep-run-persistent-action ()
  "<span class="quote">Run grep persistent action from `anything-do-grep-1'.</span>"
  (interactive)
  (anything-attrset 'jump-persistent 'anything-c-grep-persistent-action)
  (anything-execute-persistent-action 'jump-persistent))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-grep-run-default-action ()
  "<span class="quote">Run grep default action from `anything-do-grep-1'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-c-grep-action))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-grep-run-other-window-action ()
  "<span class="quote">Run grep goto other window action from `anything-do-grep-1'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-c-grep-other-window))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-grep-run-save-buffer ()
  "<span class="quote">Run grep save results action from `anything-do-grep-1'.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'anything-c-grep-save-results))

<span class="linecomment">;; Grep buffers</span>
(defun anything-c-grep-buffers-1 (candidate &optional zgrep)
  "<span class="quote">Run grep on all file--buffers or CANDIDATE if it is a file--buffer.
If one of selected buffers is not a file--buffer,
it is ignored and grep will run on all others file--buffers.
If only one candidate is selected and it is not a file--buffer,
switch to this buffer and run `anything-occur'.
If a prefix arg is given run grep on all buffers ignoring non--file-buffers.</span>"
  (let* ((prefarg (or current-prefix-arg anything-current-prefix-arg))
         (cands (if prefarg
                    (buffer-list)
                    (anything-marked-candidates)))
         (win-conf (current-window-configuration))
         <span class="linecomment">;; Non--fname buffers are ignored.</span>
         (bufs (loop for buf in cands
                     for fname = (buffer-file-name (get-buffer buf))
                     when fname
                     collect (expand-file-name fname))))
    (if bufs
        (if zgrep
            (anything-do-grep-1 bufs nil 'zgrep)
            (anything-do-grep-1 bufs))
        <span class="linecomment">;; bufs is empty, thats mean we have only CANDIDATE</span>
        <span class="linecomment">;; and it is not a buffer-filename, fallback to occur.</span>
        (anything-c-switch-to-buffer candidate)
        (when (get-buffer anything-action-buffer)
          (kill-buffer anything-action-buffer))
        (anything-occur)
        (when (eq anything-exit-status 1)
          (set-window-configuration win-conf)))))

(defun anything-c-grep-buffers (candidate)
  "<span class="quote">Action to grep buffers.</span>"
  (anything-c-grep-buffers-1 candidate))

(defun anything-c-zgrep-buffers (candidate)
  "<span class="quote">Action to zgrep buffers.</span>"
  (anything-c-grep-buffers-1 candidate 'zgrep))

 
<span class="linecomment">;;; Anything interface for pdfgrep</span>
<span class="linecomment">;;  pdfgrep program &lt;http://pdfgrep.sourceforge.net/&gt;</span>
<span class="linecomment">;;  and a pdf-reader (e.g xpdf) are needed.</span>
<span class="linecomment">;;</span>
(defvar anything-c-pdfgrep-default-command "<span class="quote">pdfgrep --color never -niH %s %s</span>")
(defvar anything-c-pdfgrep-default-function 'anything-c-pdfgrep-init)
(defvar anything-c-pdfgrep-debug-command-line nil)

(defun anything-c-pdfgrep-init (only-files)
  "<span class="quote">Start an asynchronous pdfgrep process in ONLY-FILES list.</span>"
  (let* ((fnargs   (anything-c-grep-prepare-candidates
                    (if (file-remote-p anything-ff-default-directory)
                        (mapcar #'(lambda (x)
                                    (file-remote-p x 'localname))
                                only-files)
                        only-files)))
         (cmd-line (format anything-c-pdfgrep-default-command
                           anything-pattern
                           fnargs)))
    (when anything-c-pdfgrep-debug-command-line
      (with-current-buffer (get-buffer-create "<span class="quote">*any pdfgrep debug*</span>")
        (goto-char (point-max))
        (insert (concat "<span class="quote">&gt;&gt;&gt; </span>" cmd-line "<span class="quote">\n\n</span>"))))
    (setq mode-line-format
          '("<span class="quote"> </span>" mode-line-buffer-identification "<span class="quote"> </span>"
            (line-number-mode "<span class="quote">%l</span>") "<span class="quote"> </span>"
            (:eval (propertize "<span class="quote">(Pdfgrep Process Running) </span>"
                    'face '((:foreground "<span class="quote">red</span>"))))))
    (prog1
        (let ((default-directory anything-ff-default-directory))
          (start-file-process-shell-command "<span class="quote">pdfgrep-process</span>" nil cmd-line))
      (message nil)
      (set-process-sentinel
       (get-process "<span class="quote">pdfgrep-process</span>")
       #'(lambda (process event)
           (when (string= event "<span class="quote">finished\n</span>")
             (with-anything-window
               (anything-update-move-first-line))
             (force-mode-line-update nil)))))))


(defun anything-do-pdfgrep-1 (only)
  "<span class="quote">Launch pdfgrep with a list of ONLY files.</span>"
  (unless (executable-find "<span class="quote">pdfgrep</span>")
    (error "<span class="quote">Error: No such program `pdfgrep'.</span>"))
  (let* ((anything-compile-source-functions
          <span class="linecomment">;; rule out anything-match-plugin because the input is one regexp.</span>
          (delq 'anything-compile-source--match-plugin
                (copy-sequence anything-compile-source-functions)))
         <span class="linecomment">;; Disable match-plugin and use here own highlighting.</span>
         (anything-mp-highlight-delay nil))
    <span class="linecomment">;; When called as action from an other source e.g *-find-files</span>
    <span class="linecomment">;; we have to kill action buffer.</span>
    (when (get-buffer anything-action-buffer)
      (kill-buffer anything-action-buffer))
    <span class="linecomment">;; If `anything-find-files' haven't already started,</span>
    <span class="linecomment">;; give a default value to `anything-ff-default-directory'.</span>
    (setq anything-ff-default-directory (or anything-ff-default-directory
                                            default-directory))
    (anything
     :sources
     `(((name . "<span class="quote">PdfGrep</span>")
        (candidates
         . (lambda ()
             (funcall anything-c-pdfgrep-default-function only)))
        (filtered-candidate-transformer anything-c-grep-cand-transformer)
        (candidate-number-limit . 9999)
        (mode-line . anything-pdfgrep-mode-line-string)
        (action . anything-c-pdfgrep-action)
        (persistent-help . "<span class="quote">Jump to PDF Page</span>")
        (requires-pattern . 3)
        (delayed)))
     :keymap anything-c-pdfgrep-map
     :buffer "<span class="quote">*anything grep*</span>")))


(defun anything-c-pdfgrep-action (candidate)
  (let* ((split  (anything-c-grep-split-line candidate))
         (pageno (nth 1 split))
         (fname  (car split)))
    (start-file-process-shell-command
     "<span class="quote">pdf-reader</span>" nil
     (format-spec anything-c-pdfgrep-default-read-command
                  (list (cons ?f fname) (cons ?p pageno))))))

 
<span class="linecomment">;; Yank text at point.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Internal</span>
(defvar anything-yank-point nil)

<span class="linecomment">;;;###autoload</span>
(defun anything-yank-text-at-point ()
  "<span class="quote">Yank text at point in minibuffer.</span>"
  (interactive)
  (let (input)
    (flet ((insert-in-minibuffer (word)
             (with-selected-window (minibuffer-window)
               (let ((str anything-pattern))
                 (delete-minibuffer-contents)
                 (set-text-properties 0 (length word) nil word)
                 (insert (concat str word))))))
      (with-anything-current-buffer
        <span class="linecomment">;; Start to initial point if C-w have never been hit.</span>
        (unless anything-yank-point (setq anything-yank-point (point)))
        (and anything-yank-point (goto-char anything-yank-point))
        (forward-word 1)
        (setq input (buffer-substring-no-properties anything-yank-point (point)))
        (setq anything-yank-point (point))) <span class="linecomment">; End of last forward-word</span>
      (insert-in-minibuffer input))))

(defun anything-reset-yank-point ()
  (setq anything-yank-point nil))

(add-hook 'anything-after-persistent-action-hook 'anything-reset-yank-point)
(add-hook 'anything-cleanup-hook 'anything-reset-yank-point)

 
<span class="linecomment">;;; Recentf files</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-recentf
  `((name . "<span class="quote">Recentf</span>")
    (init . (lambda ()
              (require 'recentf)
              (or recentf-mode (recentf-mode 1))))
    <span class="linecomment">;; Needed for filenames with capitals letters.</span>
    (disable-shortcuts)
    (candidates . recentf-list)
    (keymap . ,anything-generic-files-map)
    (help-message . anything-generic-file-help-message)
    (mode-line . anything-generic-file-mode-line-string)
    (match anything-c-match-on-basename)
    (type . file))
  "<span class="quote">See (info \"(emacs)File Conveniences\").
Set `recentf-max-saved-items' to a bigger value if default is too small.</span>")

<span class="linecomment">;;; ffap</span>
(eval-when-compile (require 'ffap))
(defvar anything-c-source-ffap-guesser
  `((name . "<span class="quote">File at point</span>")
    (init . (lambda () (require 'ffap)))
    (candidates . (lambda ()
                    (anything-aif
                        (with-anything-current-buffer
                          (ffap-guesser))
                        (list it))))
    (keymap . ,anything-generic-files-map)
    (help-message . anything-generic-file-help-message)
    (mode-line . anything-generic-file-mode-line-string)
    (type . file)))

<span class="linecomment">;;; ffap with line number</span>
(defun anything-c-ffap-file-line-at-point ()
  "<span class="quote">Get (FILENAME . LINENO) at point.</span>"
  (anything-aif (let (ffap-alist) (ffap-file-at-point))
      (save-excursion
        (beginning-of-line)
        (when (and (search-forward it nil t)
                   (looking-at "<span class="quote">:\\([0-9]+\\)</span>"))
          (cons it (string-to-number (match-string 1)))))))

(defun anything-c-ffap-line-candidates ()
  (with-anything-current-buffer
    (anything-attrset 'ffap-line-location (anything-c-ffap-file-line-at-point)))
  (anything-aif (anything-attr 'ffap-line-location)
    (destructuring-bind (file . line) it
      (list (cons (format "<span class="quote">%s (line %d)</span>" file line) file)))))

<span class="linecomment">;;; Goto line after opening file by `anything-c-source-ffap-line'.</span>
(defun anything-c-ffap-line-goto-line ()
  (when (car (anything-attr 'ffap-line-location))
    (unwind-protect
        (ignore-errors
          (with-selected-window
              (get-buffer-window
               (get-file-buffer (car (anything-attr 'ffap-line-location))))
            (anything-goto-line (cdr (anything-attr 'ffap-line-location)))))
      (anything-attrset 'ffap-line-location nil))))
(add-hook 'anything-after-action-hook 'anything-c-ffap-line-goto-line)
(add-hook 'anything-after-persistent-action-hook 'anything-c-ffap-line-goto-line)

(defvar anything-c-source-ffap-line
  `((name . "<span class="quote">File/Lineno at point</span>")
    (init . (lambda () (require 'ffap)))
    (candidates . anything-c-ffap-line-candidates)
    (keymap . ,anything-map)
    (type . file)))

<span class="linecomment">;;; list of files gleaned from every dired buffer</span>
(defun anything-c-files-in-all-dired-candidates ()
  (save-excursion
    (mapcan
     (lambda (dir)
       (cond ((listp dir)               <span class="linecomment">;filelist</span>
              dir)
             ((equal "<span class="quote"></span>" (file-name-nondirectory dir)) <span class="linecomment">;dir</span>
              (directory-files dir t))
             (t                         <span class="linecomment">;wildcard</span>
              (file-expand-wildcards dir t))))
     (delq nil
           (mapcar (lambda (buf)
                     (set-buffer buf)
                     (when (eq major-mode 'dired-mode)
                       (if (consp dired-directory)
                           (cdr dired-directory) <span class="linecomment">;filelist</span>
                           dired-directory))) <span class="linecomment">;dir or wildcard</span>
                   (buffer-list))))))
<span class="linecomment">;; (dired '("~/" "~/.emacs-custom.el" "~/.emacs.bmk"))</span>

(defvar anything-c-source-files-in-all-dired
  '((name . "<span class="quote">Files in all dired buffer.</span>")
    (candidates . anything-c-files-in-all-dired-candidates)
    (type . file)))

(defvar anything-c-source-filelist
  '((name . "<span class="quote">FileList</span>")
    (grep-candidates . anything-c-filelist-file-name)
    (candidate-number-limit . 200)
    (requires-pattern . 4)
    (type . file))
  "<span class="quote">Source to find files instantly.
See `anything-c-filelist-file-name' docstring for usage.</span>")

 
<span class="linecomment">;;;; &lt;info&gt;</span>
<span class="linecomment">;;; Info pages</span>
(defvar anything-c-info-pages nil
  "<span class="quote">All info pages on system.
Will be calculated the first time you invoke anything with this
source.</span>")

(defun anything-c-info-pages-init ()
  "<span class="quote">Collect candidates for initial Info node Top.</span>"
  (if anything-c-info-pages
      anything-c-info-pages
      (let ((info-topic-regexp "<span class="quote">\\* +\\([^:]+: ([^)]+)[^.]*\\)\\.</span>")
            topics)
        (require 'info)
        (with-temp-buffer
          (Info-find-node "<span class="quote">dir</span>" "<span class="quote">top</span>")
          (goto-char (point-min))
          (while (re-search-forward info-topic-regexp nil t)
            (push (match-string-no-properties 1) topics))
          (kill-buffer))
        (setq anything-c-info-pages topics))))

(defvar anything-c-source-info-pages
  `((name . "<span class="quote">Info Pages</span>")
    (init . anything-c-info-pages-init)
    (candidates . anything-c-info-pages)
    (action . (("<span class="quote">Show with Info</span>" .(lambda (node-str)
                                    (info (replace-regexp-in-string
                                           "<span class="quote">^[^:]+: </span>" "<span class="quote"></span>" node-str))))))
    (requires-pattern . 2)))

 
<span class="linecomment">;;; Man and woman UI</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-man-pages nil
  "<span class="quote">All man pages on system.
Will be calculated the first time you invoke anything with this
source.</span>")

(defun anything-c-man-default-action (candidate)
  "<span class="quote">Default action for jumping to a woman or man page from anything.</span>"
  (let ((wfiles (woman-file-name-all-completions candidate)))
    (condition-case err
        (if (&gt; (length wfiles) 1)
            (woman-find-file
             (anything-comp-read
              "<span class="quote">ManFile: </span>" wfiles :must-match t))
            (woman candidate))
      <span class="linecomment">;; If woman is unable to format correctly</span>
      <span class="linecomment">;; use man instead.</span>
      (error (kill-buffer) <span class="linecomment">; Kill woman buffer.</span>
             (let ((Man-notify-method 'meek))
               (Man-getpage-in-background candidate))))))

(defvar anything-c-source-man-pages
  `((name . "<span class="quote">Manual Pages</span>")
    (candidates . (lambda ()
                    (if anything-c-man-pages
                        anything-c-man-pages
                        <span class="linecomment">;; XEmacs doesn't have a woman :)</span>
                        (setq anything-c-man-pages
                              (ignore-errors
                                (require 'woman)
                                (woman-file-name "<span class="quote"></span>")
                                (sort (mapcar 'car woman-topic-all-completions)
                                      'string-lessp))))))
    (action  ("<span class="quote">Show with Woman</span>" . anything-c-man-default-action))
    <span class="linecomment">;; Woman does not work OS X</span>
    <span class="linecomment">;; http://xahlee.org/emacs/modernization_man_page.html</span>
    (action-transformer . (lambda (actions candidate)
                            (if (eq system-type 'darwin)
                                '(("<span class="quote">Show with Man</span>" . man))
                                actions)))
    (requires-pattern . 2)))

 
<span class="linecomment">;;;; &lt;Command&gt;</span>
<span class="linecomment">;;; Anything M-x - Enhanced M-x UI</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Another replacement of `M-x' that act exactly like the</span>
<span class="linecomment">;; vanilla Emacs one, no problem of windows configuration, prefix args</span>
<span class="linecomment">;; can be passed before calling `M-x' (e.g C-u M-x..) but also during</span>
<span class="linecomment">;; anything invocation.</span>
<span class="linecomment">;; Documentation of commands available without quitting,</span>
<span class="linecomment">;; Show keybindings of commands.</span>
<span class="linecomment">;; Show history.</span>
(defvar anything-M-x-input-history nil)

(defun* anything-M-x-get-major-mode-command-alist (mode-map)
  "<span class="quote">Return alist of MODE-MAP.</span>"
  (loop for key being the key-seqs of mode-map using (key-bindings com)
        for str-key  = (key-description key)
        for ismenu   = (string-match "<span class="quote">&lt;menu-bar&gt;</span>" str-key)
        unless ismenu collect (cons str-key com)))

(defun anything-get-mode-map-from-mode (mode)
  "<span class="quote">Guess the mode-map name according to MODE.
Some modes don't use conventional mode-map name
so we need to guess mode-map name. e.g python-mode ==&gt; py-mode-map.
Return nil if no mode-map found.</span>"
  (loop
        <span class="linecomment">;; Start with a conventional mode-map name.</span>
        with mode-map    = (intern-soft (format "<span class="quote">%s-map</span>" mode))
        with mode-string = (symbol-name mode)
        with mode-name   = (replace-regexp-in-string "<span class="quote">-mode</span>" "<span class="quote"></span>" mode-string)
        while (not mode-map)
        for count downfrom (length mode-name)
        <span class="linecomment">;; Return when no result after parsing entire string.</span>
        when (eq count 0) return nil
        for sub-name = (substring mode-name 0 count)
        do (setq mode-map (intern-soft (format "<span class="quote">%s-map</span>" (concat sub-name "<span class="quote">-mode</span>"))))
        finally return mode-map))

(defun anything-M-x-current-mode-map-alist ()
  "<span class="quote">Return mode-map alist of current `major-mode'.</span>"
  (let ((map (anything-get-mode-map-from-mode major-mode)))
    (when (and map (boundp map))
      (anything-M-x-get-major-mode-command-alist (symbol-value map)))))


(defun anything-M-x-transformer (candidates sources)
  "<span class="quote">filtered-candidate-transformer to show bindings in emacs commands.
Show global bindings and local bindings according to current `major-mode'.</span>"
  (with-anything-current-buffer
    (loop with local-map = (anything-M-x-current-mode-map-alist)
          for cand in candidates
          for local-key  = (car (rassq cand local-map))
          for key        = (substitute-command-keys (format "<span class="quote">\\[%s]</span>" cand))
          collect
          (cons (cond ((and (string-match "<span class="quote">^M-x</span>" key) local-key)
                       (format "<span class="quote">%s (%s)</span>"
                               cand (propertize
                                     local-key
                                     'face 'anything-M-x-key-face)))
                      ((string-match "<span class="quote">^M-x</span>" key) cand)
                      (t (format "<span class="quote">%s (%s)</span>"
                                 cand (propertize
                                       key
                                       'face 'anything-M-x-key-face))))
                cand) into ls
          finally return
          (sort ls #'(lambda (x y) (string-lessp (car x) (car y)))))))

 
<span class="linecomment">;;; Complex command history</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-complex-command-history
  '((name . "<span class="quote">Complex Command History</span>")
    (candidates . (lambda () (mapcar 'prin1-to-string command-history)))
    (type . sexp)))

<span class="linecomment">;;; M-x history (not related to `anything-M-x')</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-extended-command-history
  '((name . "<span class="quote">Emacs Commands History</span>")
    (candidates
     . (lambda ()
         (anything-fast-remove-dups extended-command-history :test 'equal)))
    (type . command)))

<span class="linecomment">;;; Emacs commands (Basic source for emacs commands)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-emacs-commands
  '((name . "<span class="quote">Emacs Commands</span>")
    (candidates . (lambda ()
                    (let (commands)
                      (mapatoms (lambda (a)
                                  (if (commandp a)
                                      (push (symbol-name a)
                                            commands))))
                      (sort commands 'string-lessp))))
    (type . command)
    (requires-pattern . 2))
  "<span class="quote">Source for completing and invoking Emacs commands.
A command is a function with interactive spec that can
be invoked with `M-x'.

To get non-interactive functions listed, use
`anything-c-source-emacs-functions'.</span>")

 
<span class="linecomment">;;;; &lt;Function&gt;</span>
<span class="linecomment">;;; Emacs functions</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-emacs-functions
  '((name . "<span class="quote">Emacs Functions</span>")
    (candidates . (lambda ()
                    (let (commands)
                      (mapatoms (lambda (a)
                                  (if (functionp a)
                                      (push (symbol-name a) commands))))
                      (sort commands 'string-lessp))))
    (type . function)
    (requires-pattern . 2))
  "<span class="quote">Source for completing Emacs functions.</span>")

<span class="linecomment">;;; With abbrev expansion</span>
<span class="linecomment">;;; Similar to my exec-abbrev-cmd.el</span>
<span class="linecomment">;;; See http://www.tsdh.de/cgi-bin/wiki.pl/exec-abbrev-cmd.el</span>
(defvar anything-c-function-abbrev-regexp nil
  "<span class="quote">The regexp for `anything-c-source-emacs-functions-with-abbrevs'.
Regexp built from the current `anything-pattern' interpreting it
as abbreviation.
Only for internal use.</span>")

(defun anything-c-match-function-by-abbrev (candidate)
  "<span class="quote">Return non-nil if `anything-pattern' is an abbreviation of the function CANDIDATE.

Abbreviations are made by taking the first character from each
word in the function's name, e.g. \"bb\" is an abbrev for
`bury-buffer', \"stb\" is an abbrev for `anything-c-switch-to-buffer'.</span>"
  (string-match anything-c-function-abbrev-regexp candidate))

(defvar anything-c-source-emacs-functions-with-abbrevs
  (append anything-c-source-emacs-functions
          '((match anything-c-match-function-by-abbrev
             anything-c-string-match))
          '((init
             . (lambda ()
                 (defadvice anything-update
                     (before anything-c-update-function-abbrev-regexp activate)
                   (let ((char-list (append anything-pattern nil))
                         (str "<span class="quote">^</span>"))
                     (dolist (c char-list)
                       (setq str (concat str (list c) "<span class="quote">[^-]*-</span>")))
                     (setq str (concat (substring str 0 (1- (length str))) "<span class="quote">$</span>"))
                     (setq anything-c-function-abbrev-regexp str))))))))

(defvar anything-c-source-advice
  '((name . "<span class="quote">Function Advice</span>")
    (candidates . anything-c-advice-candidates)
    (action ("<span class="quote">Toggle Enable/Disable</span>" . anything-c-advice-toggle))
    (persistent-action . anything-c-advice-persistent-action)
    (multiline)
    (persistent-help . "<span class="quote">Describe function / C-u C-z: Toggle advice</span>")))
<span class="linecomment">;; (let ((debug-on-signal t))(anything 'anything-c-source-advice))</span>
<span class="linecomment">;; (testadvice)</span>

(defun anything-c-advice-candidates ()
  (require 'advice)
  (loop for (fname) in ad-advised-functions
        for function = (intern fname)
        append
        (loop for class in ad-advice-classes append
              (loop for advice in (ad-get-advice-info-field function class)
                    for enabled = (ad-advice-enabled advice)
                    collect
                    (cons (format
                           "<span class="quote">%s %s %s</span>"
                           (if enabled "<span class="quote">Enabled </span>" "<span class="quote">Disabled</span>")
                           (propertize fname 'face 'font-lock-function-name-face)
                           (ad-make-single-advice-docstring advice class nil))
                          (list function class advice))))))

(defun anything-c-advice-persistent-action (func-class-advice)
  (if current-prefix-arg
      (anything-c-advice-toggle func-class-advice)
      (describe-function (car func-class-advice))))

(defun anything-c-advice-toggle (func-class-advice)
  (destructuring-bind (function class advice) func-class-advice
    (cond ((ad-advice-enabled advice)
           (ad-advice-set-enabled advice nil)
           (message "<span class="quote">Disabled</span>"))
          (t                            <span class="linecomment">;disabled</span>
           (ad-advice-set-enabled advice t)
           (message "<span class="quote">Enabled</span>")))
    (ad-activate function)
    (and anything-in-persistent-action
         (anything-c-advice-update-current-display-string))))

(defun anything-c-advice-update-current-display-string ()
  (anything-edit-current-selection
    (let ((newword (cond ((looking-at "<span class="quote">Disabled</span>") "<span class="quote">Enabled</span>")
                         ((looking-at "<span class="quote">Enabled</span>")  "<span class="quote">Disabled</span>")))
          realvalue)
      (when newword
        (delete-region (point) (progn (forward-word 1) (point)))
        (insert newword)))))

 
<span class="linecomment">;;;; &lt;Variable&gt;</span>
<span class="linecomment">;;; Emacs variables</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-emacs-variables
  '((name . "<span class="quote">Emacs Variables</span>")
    (candidates . (lambda ()
                    (sort (all-completions "<span class="quote"></span>" obarray 'boundp) 'string-lessp)))
    (type . variable)
    (requires-pattern . 2))
  "<span class="quote">Source for completing Emacs variables.</span>")

 
<span class="linecomment">;;; LaCarte</span>
(defvar anything-c-source-lacarte
  '((name . "<span class="quote">Lacarte</span>")
    (init . (lambda () (require 'lacarte )))
    (candidates . (lambda () (delete '(nil) (lacarte-get-overall-menu-item-alist))))
    (candidate-number-limit . 9999)
    (action . anything-c-call-interactively))
  "<span class="quote">Needs lacarte.el.

http://www.emacswiki.org/cgi-bin/wiki/download/lacarte.el</span>")

 
<span class="linecomment">;;; Bookmarks</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Bind some faces for bookmarks.</span>
(defvar anything-c-bookmarks-face1 'anything-ff-directory)
(defvar anything-c-bookmarks-face2 'anything-ff-file)
(defvar anything-c-bookmarks-face3 'anything-bookmarks-su-face)

(eval-when-compile (require 'bookmark))
(defvar anything-c-source-bookmarks
  `((name . "<span class="quote">Bookmarks</span>")
    (init . (lambda ()
              (require 'bookmark)))
    (candidates . bookmark-all-names)
    (type . bookmark))
  "<span class="quote">See (info \"(emacs)Bookmarks\").</span>")

<span class="linecomment">;;; bookmark-set</span>
(defvar anything-c-source-bookmark-set
  '((name . "<span class="quote">Set Bookmark</span>")
    (dummy)
    (action . bookmark-set))
  "<span class="quote">See (info \"(emacs)Bookmarks\").</span>")

<span class="linecomment">;;; Visible Bookmarks</span>
<span class="linecomment">;; (install-elisp "http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el")</span>


<span class="linecomment">;; http://d.hatena.ne.jp/grandVin/20080911/1221114327</span>
(defvar anything-c-source-bm
  '((name . "<span class="quote">Visible Bookmarks</span>")
    (init . anything-c-bm-init)
    (candidates-in-buffer)
    (type . line))
  "<span class="quote">Needs bm.el.

http://www.nongnu.org/bm/</span>")

(defun anything-c-bm-init ()
  "<span class="quote">Init function for `anything-c-source-bm'.</span>"
  (when (require 'bm nil t)
    (with-no-warnings
      (let ((bookmarks (bm-lists))
            (buf (anything-candidate-buffer 'global)))
        (dolist (bm (sort* (append (car bookmarks) (cdr bookmarks))
                           '&lt; :key 'overlay-start))
          (let ((start (overlay-start bm))
                (end (overlay-end bm))
                (annotation (or (overlay-get bm 'annotation) "<span class="quote"></span>")))
            (unless (&lt; (- end start) 1) <span class="linecomment">; org =&gt; (if (&lt; (- end start) 2)</span>
              (let ((str (format "<span class="quote">%5d: [%s]: %s\n</span>"
                                 (line-number-at-pos start)
                                 annotation
                                 (buffer-substring start (1- end)))))
                (with-current-buffer buf (insert str))))))))))

<span class="linecomment">;;; Special bookmarks</span>
(defvar anything-c-source-bookmarks-ssh
  '((name . "<span class="quote">Bookmarks-ssh</span>")
    (init . (lambda ()
              (require 'bookmark)))
    (candidates . (lambda () (anything-c-collect-bookmarks :ssh t)))
    (type . bookmark))
  "<span class="quote">See (info \"(emacs)Bookmarks\").</span>")

(defvar anything-c-source-bookmarks-su
  '((name . "<span class="quote">Bookmarks-root</span>")
    (init . (lambda ()
              (require 'bookmark)))
    (candidates . (lambda () (anything-c-collect-bookmarks :su t)))
    (filtered-candidate-transformer anything-c-highlight-bookmark-su)

    (type . bookmark))
  "<span class="quote">See (info \"(emacs)Bookmarks\").</span>")

(defvar anything-c-source-bookmarks-local
  '((name . "<span class="quote">Bookmarks-Local</span>")
    (init . (lambda ()
              (require 'bookmark)))
    (candidates . (lambda () (anything-c-collect-bookmarks :local t)))
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (type . bookmark))
  "<span class="quote">See (info \"(emacs)Bookmarks\").</span>")

(defun* anything-c-collect-bookmarks (&key local su sudo ssh)
  (let* ((lis-all (bookmark-all-names))
         (lis-loc (cond (local (loop for i in lis-all
                                     unless (string-match "<span class="quote">^(ssh)\\|^(su)</span>" i)
                                     collect i))
                        (su (loop for i in lis-all
                                  when (string-match "<span class="quote">^(su)</span>" i)
                                  collect i))
                        (sudo (loop for i in lis-all
                                    when (string-match "<span class="quote">^(sudo)</span>" i)
                                    collect i))
                        (ssh (loop for i in lis-all
                                   when (string-match "<span class="quote">^(ssh)</span>" i)
                                   collect i)))))
    (sort lis-loc 'string-lessp)))

(defun anything-c-bookmark-root-logged-p ()
  (catch 'break
    (dolist (i (mapcar #'buffer-name (buffer-list)))
      (when (string-match (format "<span class="quote">*tramp/%s .</span>" anything-su-or-sudo) i)
        (throw 'break t)))))

(defun anything-c-highlight-bookmark-su (files source)
  (if (anything-c-bookmark-root-logged-p)
      (anything-c-highlight-bookmark files source)
      (anything-c-highlight-not-logged files source)))

(defun anything-c-highlight-not-logged (files source)
  (loop for i in files
        collect (propertize i 'face anything-c-bookmarks-face3)))

(defun anything-c-highlight-bookmark (bookmarks source)
  "<span class="quote">Used as `candidate-transformer' to colorize bookmarks.
Work both with standard Emacs bookmarks and bookmark-extensions.el.</span>"
  (loop for i in bookmarks
        for isfile        = (bookmark-get-filename i)
        for bufp          = (and (fboundp 'bmkext-get-buffer-name)
                                 (bmkext-get-buffer-name i))
        for handlerp      = (and (fboundp 'bookmark-get-handler)
                                 (bookmark-get-handler i))
        for isw3m         = (and (fboundp 'bmkext-w3m-bookmark-p)
                                 (bmkext-w3m-bookmark-p i))
        for isgnus        = (and (fboundp 'bmkext-gnus-bookmark-p)
                                 (bmkext-gnus-bookmark-p i))
        for isman         = (and (fboundp 'bmkext-man-bookmark-p) <span class="linecomment">; Man</span>
                                 (bmkext-man-bookmark-p i))
        for iswoman       = (and (fboundp 'bmkext-woman-bookmark-p) <span class="linecomment">; Woman</span>
                                 (bmkext-woman-bookmark-p i))
        for handlerp      = (bookmark-get-handler i)
        for isannotation  = (bookmark-get-annotation i)
        for isabook       = (string= (bookmark-prop-get i 'type) "<span class="quote">addressbook</span>")
        for isinfo        = (eq handlerp 'Info-bookmark-jump)
        <span class="linecomment">;; Add a * if bookmark have annotation</span>
        if (and isannotation (not (string-equal isannotation "<span class="quote"></span>")))
        do (setq i (concat "<span class="quote">*</span>" i))
        collect (cond (<span class="linecomment">;; info buffers</span>
                       isinfo
                       (propertize i 'face 'anything-bmkext-info 'help-echo isfile))
                      (<span class="linecomment">;; w3m buffers</span>
                       isw3m
                       (propertize i 'face 'anything-bmkext-w3m 'help-echo isfile))
                      (<span class="linecomment">;; gnus buffers</span>
                       isgnus
                       (propertize i 'face 'anything-bmkext-gnus 'help-echo isfile))
                      (<span class="linecomment">;; Man Woman</span>
                       (or iswoman isman)
                       (propertize i 'face 'anything-bmkext-man 'help-echo isfile))
                      (<span class="linecomment">;; Addressbook</span>
                       isabook
                       (propertize i 'face '((:foreground "<span class="quote">Tomato</span>"))))
                      (<span class="linecomment">;; directories</span>
                       (and isfile (file-directory-p isfile))
                       (propertize i 'face anything-c-bookmarks-face1 'help-echo isfile))
                      (<span class="linecomment">;; regular files</span>
                       t
                       (propertize i 'face 'anything-bmkext-file 'help-echo isfile)))))

(defun anything-c-bookmark-jump (candidate)
  "<span class="quote">Jump to bookmark from keyboard.</span>"
  (let ((current-prefix-arg anything-current-prefix-arg))
    (bookmark-jump candidate)))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-bookmark-run-jump-other-window ()
  "<span class="quote">Jump to bookmark from keyboard.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'bookmark-jump-other-window))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-bookmark-run-delete ()
  "<span class="quote">Delete bookmark from keyboard.</span>"
  (interactive)
  (when (y-or-n-p "<span class="quote">Delete bookmark?</span>")
    (anything-c-quit-and-execute-action 'anything-delete-marked-bookmarks)))

 
<span class="linecomment">;;; Sources to filter bookmark-extensions bookmarks.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Dependency: http://mercurial.intuxication.org/hg/emacs-bookmark-extension</span>
<span class="linecomment">;; If you want to enable google-maps in addressbook you will need</span>
<span class="linecomment">;; Julien Danjou google-maps-el package available here:</span>
<span class="linecomment">;; http://julien.danjou.info/google-maps-el.html</span>

(defun anything-c-bmkext-filter-setup-alist (fn &rest args)
  "<span class="quote">Return a filtered `bookmark-alist' sorted alphabetically.</span>"
  (loop
        with alist = (if args
                         (apply #'(lambda (x) (funcall fn x)) args)
                         (funcall fn))
        for i in alist
        for b = (car i)
        collect b into sa
        finally return (sort sa 'string-lessp)))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-bmkext-run-edit ()
  "<span class="quote">Run `bmkext-edit-bookmark' from keyboard.</span>"
  (interactive)
  (anything-c-quit-and-execute-action 'bmkext-edit-bookmark))

<span class="linecomment">;;; Addressbook.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-bmkext-addressbook
  '((name . "<span class="quote">Bookmark Addressbook</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bmkext-addressbook-setup-alist)
    (persistent-action
     . (lambda (candidate)
         (let ((bmk (anything-bookmark-get-bookmark-from-name
                     candidate)))
           (bookmark--jump-via bmk 'pop-to-buffer))))
    (persistent-help . "<span class="quote">Show contact - Prefix with C-u to append</span>")
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (action . (("<span class="quote">Show Contact(s)</span>"
                . (lambda (candidate)
                    (let* ((contacts (anything-marked-candidates))
                           (current-prefix-arg (or anything-current-prefix-arg
                                                   (&gt; (length contacts) 1))))
                      (bookmark-jump
                       (anything-bookmark-get-bookmark-from-name (car contacts)))
                      (anything-aif (cdr contacts)
                          (loop for bmk in it do
                                (bookmark-jump
                                 (anything-bookmark-get-bookmark-from-name bmk)))))))
               ("<span class="quote">Send Mail</span>"
                . (lambda (candidate)
                    (let* ((contacts (anything-marked-candidates))
                           (bmk      (anything-bookmark-get-bookmark-from-name
                                      (car contacts)))
                           (append   (message-buffers)))
                      (if append
                          (addressbook-set-mail-buffer1 bmk 'append)
                          (addressbook-set-mail-buffer1 bmk))
                      (setq contacts (cdr contacts))
                      (when contacts
                        (loop for bmk in contacts do
                              (addressbook-set-mail-buffer1 bmk 'append))))))
               ("<span class="quote">Edit Bookmark</span>"
                . (lambda (candidate)
                    (let ((bmk (anything-bookmark-get-bookmark-from-name
                                candidate)))
                      (addressbook-bookmark-edit
                       (assoc bmk bookmark-alist)))))
               ("<span class="quote">Insert Email at point</span>"
                . (lambda (candidate)
                    (let* ((bmk   (anything-bookmark-get-bookmark-from-name
                                   candidate))
                           (mlist (split-string
                                   (assoc-default
                                    'email (assoc bmk bookmark-alist))
                                   "<span class="quote">, </span>")))
                      (insert
                       (if (&gt; (length mlist) 1)
                           (anything-comp-read
                            "<span class="quote">Insert Mail Address: </span>" mlist :must-match t)
                           (car mlist))))))
               ("<span class="quote">Show annotation</span>"
                . (lambda (candidate)
                    (let ((bmk (anything-bookmark-get-bookmark-from-name
                                candidate)))
                      (bookmark-show-annotation bmk))))
               ("<span class="quote">Edit annotation</span>"
                . (lambda (candidate)
                    (let ((bmk (anything-bookmark-get-bookmark-from-name
                                candidate)))
                      (bookmark-edit-annotation bmk))))
               ("<span class="quote">Show Google map</span>"
                . (lambda (candidate)
                    (let* ((bmk (anything-bookmark-get-bookmark-from-name
                                 candidate))
                           (full-bmk (assoc bmk bookmark-alist)))
                      (addressbook-google-map full-bmk))))))))


(defun anything-c-bmkext-addressbook-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks w3m.</span>"
  (anything-c-bmkext-filter-setup-alist 'bmkext-addressbook-alist-only))

<span class="linecomment">;; W3m bookmarks from bookmark-extensions.</span>
(defvar anything-c-source-bookmark-w3m
  '((name . "<span class="quote">Bookmark W3m</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-w3m-setup-alist)
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (type . bookmark)))

(defun anything-c-bookmark-w3m-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks w3m.</span>"
  (anything-c-bmkext-filter-setup-alist 'bmkext-w3m-alist-only))

<span class="linecomment">;; Images</span>
(defvar anything-c-source-bookmark-images
  '((name . "<span class="quote">Bookmark Images</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-images-setup-alist)
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (type . bookmark)))

(defun anything-c-bookmark-images-setup-alist ()
  "<span class="quote">Specialized filter function for images bookmarks.</span>"
  (anything-c-bmkext-filter-setup-alist 'bmkext-image-file-alist-only))

<span class="linecomment">;; Woman Man</span>
(defvar anything-c-source-bookmark-man
  '((name . "<span class="quote">Bookmark Woman&Man</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-man-setup-alist)
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (type . bookmark)))

(defun anything-c-bookmark-man-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks w3m.</span>"
  (append (anything-c-bmkext-filter-setup-alist 'bmkext-man-alist-only)
          (anything-c-bmkext-filter-setup-alist 'bmkext-woman-alist-only)))

<span class="linecomment">;; Gnus</span>
(defvar anything-c-source-bookmark-gnus
  '((name . "<span class="quote">Bookmark Gnus</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-gnus-setup-alist)
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (type . bookmark)))

(defun anything-c-bookmark-gnus-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks gnus.</span>"
  (anything-c-bmkext-filter-setup-alist 'bmkext-gnus-alist-only))

<span class="linecomment">;; Info</span>
(defvar anything-c-source-bookmark-info
  '((name . "<span class="quote">Bookmark Info</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-info-setup-alist)
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (type . bookmark)))

(defun anything-c-bookmark-info-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks info.</span>"
  (anything-c-bmkext-filter-setup-alist 'bmkext-info-alist-only))

<span class="linecomment">;; Local Files&directories</span>
(defvar anything-c-source-bookmark-files&dirs
  '((name . "<span class="quote">Bookmark Files&Directories</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-local-files-setup-alist)
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark)
    (type . bookmark)))

(defun anything-c-bookmark-local-files-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks locals files.</span>"
  (anything-c-bmkext-filter-setup-alist 'bmkext-local-file-alist-only))

<span class="linecomment">;; Su Files&directories</span>
(defvar anything-c-source-bookmark-su-files&dirs
  '((name . "<span class="quote">Bookmark Root-Files&Directories</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-su-files-setup-alist)
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-bookmark-su)
    (type . bookmark)))

(defun anything-c-bookmark-su-files-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks su/sudo files.</span>"
  (declare (special bmkext-su-or-sudo-regexp))
  (loop
        with l = (anything-c-bmkext-filter-setup-alist 'bmkext-remote-file-alist-only)
        for i in l
        for isfile = (bookmark-get-filename i)
        for istramp = (and isfile (boundp 'tramp-file-name-regexp)
                           (save-match-data
                             (string-match tramp-file-name-regexp isfile)))
        for issu = (and istramp
                        (string-match bmkext-su-or-sudo-regexp isfile))
        if issu
        collect i))

<span class="linecomment">;; Ssh Files&directories</span>
(defvar anything-c-source-bookmark-ssh-files&dirs
  '((name . "<span class="quote">Bookmark Ssh-Files&Directories</span>")
    (init . (lambda ()
              (require 'bookmark-extensions)
              (bookmark-maybe-load-default-file)))
    (candidates . anything-c-bookmark-ssh-files-setup-alist)
    (filtered-candidate-transformer . anything-c-adaptive-sort)
    (type . bookmark)))

(defun anything-c-bookmark-ssh-files-setup-alist ()
  "<span class="quote">Specialized filter function for bookmarks ssh files.</span>"
  (loop
        with l = (anything-c-bmkext-filter-setup-alist 'bmkext-remote-file-alist-only)
        for i in l
        for isfile = (bookmark-get-filename i)
        for istramp = (and isfile (boundp 'tramp-file-name-regexp)
                           (save-match-data
                             (string-match tramp-file-name-regexp isfile)))
        for isssh = (and istramp
                         (string-match "<span class="quote">/ssh:</span>" isfile))
        if isssh
        collect i))


 
<span class="linecomment">;;; Firefox bookmarks</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; You will have to set firefox to import bookmarks in his html file bookmarks.html.</span>
<span class="linecomment">;; (only for firefox versions &gt;=3)</span>
<span class="linecomment">;; To achieve that, open about:config in firefox and double click on this line to enable value</span>
<span class="linecomment">;; to true:</span>
<span class="linecomment">;; user_pref("browser.bookmarks.autoExportHTML", false);</span>
<span class="linecomment">;; You should have now:</span>
<span class="linecomment">;; user_pref("browser.bookmarks.autoExportHTML", true);</span>
<span class="linecomment">;; NOTE: This is also working in the same way for mozilla aka seamonkey.</span>

(defvar anything-firefox-bookmark-url-regexp "<span class="quote">\\(https\\|http\\|ftp\\|about\\|file\\)://[^ \"]*</span>")
(defvar anything-firefox-bookmarks-regexp "<span class="quote">&gt;\\([^&gt;&lt;]+.[^&lt;/a&gt;]\\)</span>")

(defun anything-get-firefox-user-init-dir ()
  "<span class="quote">Guess the default Firefox user directory name.</span>"
  (let* ((moz-dir (concat (getenv "<span class="quote">HOME</span>") "<span class="quote">/.mozilla/firefox/</span>"))
         (moz-user-dir
          (with-current-buffer (find-file-noselect (concat moz-dir "<span class="quote">profiles.ini</span>"))
            (goto-char (point-min))
            (prog1
                (when (search-forward "<span class="quote">Path=</span>" nil t)
                  (buffer-substring-no-properties (point) (point-at-eol)))
              (kill-buffer)))))
    (file-name-as-directory (concat moz-dir moz-user-dir))))

(defun anything-guess-firefox-bookmark-file ()
  "<span class="quote">Return the path of the Firefox bookmarks file.</span>"
  (concat (anything-get-firefox-user-init-dir) "<span class="quote">bookmarks.html</span>"))

(defun anything-html-bookmarks-to-alist (file url-regexp bmk-regexp)
  "<span class="quote">Parse html bookmark FILE and return an alist with (title . url) as elements.</span>"
  (let (bookmarks-alist url title)
    (with-temp-buffer
      (insert-file-contents file)
      (goto-char (point-min))
      (while (re-search-forward "<span class="quote">href=\\|^ *&lt;DT&gt;&lt;A HREF=</span>" nil t)
        (forward-line 0)
        (when (re-search-forward url-regexp nil t)
          (setq url (match-string 0)))
        (when (re-search-forward bmk-regexp nil t)
          (setq title (match-string 1)))
        (push (cons title url) bookmarks-alist)
        (forward-line)))
    (nreverse bookmarks-alist)))

(defvar anything-c-firefox-bookmarks-alist nil)
(defvar anything-c-source-firefox-bookmarks
  '((name . "<span class="quote">Firefox Bookmarks</span>")
    (init . (lambda ()
              (setq anything-c-firefox-bookmarks-alist
                    (anything-html-bookmarks-to-alist
                     (anything-guess-firefox-bookmark-file)
                     anything-firefox-bookmark-url-regexp
                     anything-firefox-bookmarks-regexp))))
    (candidates . (lambda ()
                    (mapcar #'car anything-c-firefox-bookmarks-alist)))
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-firefox-bookmarks)
    (action . (("<span class="quote">Browse Url</span>"
                . (lambda (candidate)
                    (anything-c-browse-url
                     (anything-c-firefox-bookmarks-get-value candidate))))
               ("<span class="quote">Copy Url</span>"
                . (lambda (elm)
                    (kill-new (anything-c-w3m-bookmarks-get-value elm))))))))


(defun anything-c-firefox-bookmarks-get-value (elm)
  (assoc-default elm anything-c-firefox-bookmarks-alist))

(defun anything-c-highlight-firefox-bookmarks (bookmarks source)
  (loop for i in bookmarks
        collect (propertize
                 i 'face '((:foreground "<span class="quote">YellowGreen</span>"))
                 'help-echo (anything-c-firefox-bookmarks-get-value i))))


 
<span class="linecomment">;;; W3m bookmark - anything interface.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Some users have the emacs-w3m library in load-path</span>
<span class="linecomment">;; without having the w3m executable :-;</span>
<span class="linecomment">;; So check if w3m program is present before trying to load</span>
<span class="linecomment">;; emacs-w3m.</span>
(eval-when-compile
  (when (executable-find "<span class="quote">w3m</span>")
    (require 'w3m-bookmark nil t)))

(defvar w3m-bookmark-file "<span class="quote">~/.w3m/bookmark.html</span>")
(defvar anything-w3m-bookmarks-regexp "<span class="quote">&gt;\\([^&gt;&lt;]+.[^&lt;/a&gt;]\\)</span>")
(defvar anything-w3m-bookmark-url-regexp "<span class="quote">\\(https\\|http\\|ftp\\|file\\)://[^&gt;]*</span>")
(defvar anything-c-w3m-bookmarks-alist nil)
(defvar anything-c-source-w3m-bookmarks
  '((name . "<span class="quote">W3m Bookmarks</span>")
    (init . (lambda ()
              (setq anything-c-w3m-bookmarks-alist
                    (anything-html-bookmarks-to-alist
                     w3m-bookmark-file
                     anything-w3m-bookmark-url-regexp
                     anything-w3m-bookmarks-regexp))))
    (candidates . (lambda ()
                    (mapcar #'car anything-c-w3m-bookmarks-alist)))
    (filtered-candidate-transformer
     anything-c-adaptive-sort
     anything-c-highlight-w3m-bookmarks)
    (action . (("<span class="quote">Browse Url</span>"
                . (lambda (candidate)
                    (anything-c-w3m-browse-bookmark candidate)))
               ("<span class="quote">Copy Url</span>"
                . (lambda (elm)
                    (kill-new (anything-c-w3m-bookmarks-get-value elm))))
               ("<span class="quote">Browse Url Externally</span>"
                . (lambda (candidate)
                    (anything-c-w3m-browse-bookmark candidate t)))
               ("<span class="quote">Delete Bookmark</span>"
                . (lambda (candidate)
                    (anything-c-w3m-delete-bookmark candidate)))
               ("<span class="quote">Rename Bookmark</span>"
                . (lambda (candidate)
                    (anything-c-w3m-rename-bookmark candidate)))))
    (persistent-action . (lambda (candidate)
                           (if current-prefix-arg
                               (anything-c-w3m-browse-bookmark candidate t)
                               (anything-c-w3m-browse-bookmark candidate nil t))))
    (persistent-help . "<span class="quote">Open URL with emacs-w3m in new tab / \
C-u \\[anything-execute-persistent-action]: Open URL with Firefox</span>"))
  "<span class="quote">Needs w3m and emacs-w3m.

http://w3m.sourceforge.net/
http://emacs-w3m.namazu.org/</span>")


(defun anything-c-w3m-bookmarks-get-value (elm)
  (replace-regexp-in-string
   "<span class="quote">\"</span>" "<span class="quote"></span>" (cdr (assoc elm anything-c-w3m-bookmarks-alist))))

(defun anything-c-w3m-browse-bookmark (elm &optional use-external new-tab)
  (let* ((fn  (if use-external 'anything-c-browse-url 'w3m-browse-url))
         (arg (and (eq fn 'w3m-browse-url) new-tab)))
    (funcall fn (anything-c-w3m-bookmarks-get-value elm) arg)))

(defun anything-c-highlight-w3m-bookmarks (bookmarks source)
  (loop for i in bookmarks
        collect (propertize
                 i 'face 'anything-w3m-bookmarks-face
                 'help-echo (anything-c-w3m-bookmarks-get-value i))))


(defun anything-c-w3m-delete-bookmark (elm)
  "<span class="quote">Delete w3m bookmark from `w3m-bookmark-file'.</span>"
  (with-current-buffer
      (find-file-literally w3m-bookmark-file)
    (goto-char (point-min))
    (when (re-search-forward elm nil t)
      (beginning-of-line)
      (delete-region (point)
                     (line-end-position))
      (delete-blank-lines))
    (save-buffer)
    (kill-buffer)))

(defun anything-c-w3m-rename-bookmark (elm)
  "<span class="quote">Rename w3m bookmark in `w3m-bookmark-file'.</span>"
  (let* ((old-title (replace-regexp-in-string "<span class="quote">&gt;</span>" "<span class="quote"></span>" elm))
         (new-title (read-string "<span class="quote">NewTitle: </span>" old-title)))
    (with-current-buffer
        (find-file-literally w3m-bookmark-file)
      (goto-char (point-min))
      (when (re-search-forward (concat elm "<span class="quote">&lt;</span>") nil t)
        (goto-char (1- (point)))
        (delete-char (- (length old-title)))
        (insert new-title))
      (save-buffer)
      (kill-buffer))))

 
<span class="linecomment">;;;; &lt;Library&gt;</span>
<span class="linecomment">;;; Elisp library scan</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-elisp-library-scan
  '((name . "<span class="quote">Elisp libraries (Scan)</span>")
    (init . (anything-c-elisp-library-scan-init))
    (candidates-in-buffer)
    (action ("<span class="quote">Find library</span>"
             . (lambda (candidate) (find-file (find-library-name candidate))))
     ("<span class="quote">Find library other window</span>"
      . (lambda (candidate)
          (find-file-other-window (find-library-name candidate))))
     ("<span class="quote">Load library</span>"
      . (lambda (candidate) (load-library candidate))))))

(defun anything-c-elisp-library-scan-init ()
  "<span class="quote">Init anything buffer status.</span>"
  (let ((anything-buffer (anything-candidate-buffer 'global))
        (library-list (anything-c-elisp-library-scan-list)))
    (with-current-buffer anything-buffer
      (dolist (library library-list)
        (insert (format "<span class="quote">%s\n</span>" library))))))

(defun anything-c-elisp-library-scan-list (&optional dirs string)
  "<span class="quote">Do completion for file names passed to `locate-file'.
DIRS is directory to search path.
STRING is string to match.</span>"
  <span class="linecomment">;; Use `load-path' as path when ignore `dirs'.</span>
  (or dirs (setq dirs load-path))
  <span class="linecomment">;; Init with blank when ignore `string'.</span>
  (or string (setq string "<span class="quote"></span>"))
  <span class="linecomment">;; Get library list.</span>
  (let ((string-dir (file-name-directory string))
        <span class="linecomment">;; File regexp that suffix match `load-file-rep-suffixes'.</span>
        (match-regexp (format "<span class="quote">^.*\\.el%s$</span>" (regexp-opt load-file-rep-suffixes)))
        name
        names)
    (dolist (dir dirs)
      (unless dir
        (setq dir default-directory))
      (if string-dir
          (setq dir (expand-file-name string-dir dir)))
      (when (file-directory-p dir)
        (dolist (file (file-name-all-completions
                       (file-name-nondirectory string) dir))
          <span class="linecomment">;; Suffixes match `load-file-rep-suffixes'.</span>
          (setq name (if string-dir (concat string-dir file) file))
          (if (string-match match-regexp name)
              (add-to-list 'names name)))))
    names))

 
<span class="linecomment">;;;; &lt;Programming&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>

<span class="linecomment">;;; Imenu</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-imenu-delimiter "<span class="quote"> / </span>")

(defvar anything-c-imenu-index-filter nil)
(make-variable-buffer-local 'anything-c-imenu-index-filter)

(defvar anything-c-cached-imenu-alist nil)
(make-variable-buffer-local 'anything-c-cached-imenu-alist)

(defvar anything-c-cached-imenu-candidates nil)
(make-variable-buffer-local 'anything-c-cached-imenu-candidates)

(defvar anything-c-cached-imenu-tick nil)
(make-variable-buffer-local 'anything-c-cached-imenu-tick)

(eval-when-compile (require 'imenu))
(setq imenu-auto-rescan t)

(defun anything-imenu-create-candidates (entry)
  "<span class="quote">Create candidates with ENTRY.</span>"
  (if (listp (cdr entry))
      (mapcan
       (lambda (sub)
         (if (consp (cdr sub))
             (mapcar
              (lambda (subentry)
                (concat (car entry) anything-c-imenu-delimiter subentry))
              (anything-imenu-create-candidates sub))
             (list (concat (car entry) anything-c-imenu-delimiter (car sub)))))
       (cdr entry))
      (list entry)))

(defvar anything-c-source-imenu
  '((name . "<span class="quote">Imenu</span>")
    (init . (lambda () (require 'imenu)))
    (candidates . anything-c-imenu-candidates)
    (persistent-action . (lambda (elm)
                           (anything-c-imenu-default-action elm)
                           (unless (fboundp 'semantic-imenu-tag-overlay)
                             (anything-match-line-color-current-line))))
    (persistent-help . "<span class="quote">Show this entry</span>")
    (action . anything-c-imenu-default-action))
  "<span class="quote">See (info \"(emacs)Imenu\")</span>")


(defun anything-c-imenu-candidates ()
  (with-anything-current-buffer
    (let ((tick (buffer-modified-tick)))
      (if (eq anything-c-cached-imenu-tick tick)
          anything-c-cached-imenu-candidates
          (setq imenu--index-alist nil)
          (setq anything-c-cached-imenu-tick tick
                anything-c-cached-imenu-candidates
                (ignore-errors
                  (mapcan
                   'anything-imenu-create-candidates
                   (setq anything-c-cached-imenu-alist
                         (let ((index (imenu--make-index-alist)))
                           (if anything-c-imenu-index-filter
                               (funcall anything-c-imenu-index-filter index)
                               index))))))
          (setq anything-c-cached-imenu-candidates
                (mapcar #'(lambda (x)
                            (if (stringp x)
                                x
                                (car x)))
                        anything-c-cached-imenu-candidates))))))

(setq imenu-default-goto-function 'imenu-default-goto-function)
(defun anything-c-imenu-default-action (elm)
  "<span class="quote">The default action for `anything-c-source-imenu'.</span>"
  (let ((path (split-string elm anything-c-imenu-delimiter))
        (alist anything-c-cached-imenu-alist))
    (dolist (elm path)
      (setq alist (assoc elm alist)))
    (imenu alist)))


 
<span class="linecomment">;;; Ctags</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-ctags-modes
  '( c-mode c++-mode awk-mode csharp-mode java-mode javascript-mode lua-mode
    makefile-mode pascal-mode perl-mode cperl-mode php-mode python-mode
    scheme-mode sh-mode slang-mode sql-mode tcl-mode ))

(defun anything-c-source-ctags-init ()
  (when (and buffer-file-name
             (memq major-mode anything-c-ctags-modes)
             (anything-current-buffer-is-modified))
    (with-current-buffer (anything-candidate-buffer 'local)
      (call-process-shell-command
       (if (string-match "<span class="quote">\\.el\\.gz$</span>" anything-buffer-file-name)
           (format "<span class="quote">ctags -e -u -f- --language-force=lisp --fields=n =(zcat %s) </span>"
                   anything-buffer-file-name)
           (format "<span class="quote">ctags -e -u -f- --fields=n %s </span>" anything-buffer-file-name))
       nil (current-buffer))
      (goto-char (point-min))
      (forward-line 2)
      (delete-region (point-min) (point))
      (loop while (and (not (eobp)) (search-forward "<span class="quote">\001</span>" (point-at-eol) t))
            for lineno-start = (point)
            for lineno = (buffer-substring
                          lineno-start
                          (1- (search-forward "<span class="quote">,</span>" (point-at-eol) t)))
            do
            (beginning-of-line)
            (insert (format "<span class="quote">%5s:</span>" lineno))
            (search-forward "<span class="quote">\177</span>" (point-at-eol) t)
            (delete-region (1- (point)) (point-at-eol))
            (forward-line 1)))))

(defvar anything-c-source-ctags
  '((name . "<span class="quote">Exuberant ctags</span>")
    (init . anything-c-source-ctags-init)
    (candidates-in-buffer)
    (adjust)
    (type . line))
  "<span class="quote">Needs Exuberant Ctags.

http://ctags.sourceforge.net/</span>")

 
<span class="linecomment">;;; Etags</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; anything-etags.el is deprecated, if this file is found,</span>
<span class="linecomment">;; warn user at compile time.</span>
(eval-when-compile
  (when (locate-library "<span class="quote">anything-etags.el</span>")
    (display-warning
     '(anything-config)
     "<span class="quote">You are using obsolete library `anything-etags.el' and should remove it.</span>"
     :warning)))

(defvar anything-c-etags-tag-file-dir nil
  "<span class="quote">Etags file directory.</span>")
(defvar anything-c-etags-mtime-alist nil
  "<span class="quote">Store the last modification time of etags files here.</span>")
(defvar anything-c-etags-cache (make-hash-table :test 'equal)
  "<span class="quote">Cache content of etags files used here for faster access.</span>")

(defun anything-c-etags-get-tag-file (&optional directory)
  "<span class="quote">Return the path of etags file if found.</span>"
  <span class="linecomment">;; Get tag file from `default-directory' or upper directory.</span>
  (let ((current-dir (anything-c-etags-find-tag-file-directory
                      (or directory default-directory))))
    <span class="linecomment">;; Return nil if not find tag file.</span>
    (when current-dir
      <span class="linecomment">;; Set tag file directory.</span>
      (setq anything-c-etags-tag-file-dir current-dir)
      (expand-file-name anything-c-etags-tag-file-name current-dir))))

(defun anything-c-etags-find-tag-file-directory (current-dir)
  "<span class="quote">Try to find the directory containing tag file.
If not found in CURRENT-DIR search in upper directory.</span>"
  (flet ((file-exists? (dir)
           (let ((tag-path (expand-file-name
                            anything-c-etags-tag-file-name dir)))
             (and (stringp tag-path)
                  (file-regular-p tag-path)
                  (file-readable-p tag-path)))))
    (loop with count = 0
          until (file-exists? current-dir)
          <span class="linecomment">;; Return nil if outside the value of</span>
          <span class="linecomment">;; `anything-c-etags-tag-file-search-limit'.</span>
          if (= count anything-c-etags-tag-file-search-limit)
          do (return nil)
          <span class="linecomment">;; Or search upper directories.</span>
          else
          do (incf count)
          (setq current-dir (expand-file-name (concat current-dir "<span class="quote">../</span>")))
          finally return current-dir)))

(defun anything-c-source-etags-header-name (x)
  "<span class="quote">Create header name for this anything etags session.</span>"
  (concat "<span class="quote">Etags in </span>"
          (with-anything-current-buffer
            (anything-c-etags-get-tag-file))))

(defmacro anything-c-etags-create-buffer (file)
  "<span class="quote">Create the `anything-buffer' based on contents of etags tag FILE.</span>"
  `(let* ((tag-fname ,file)
          max
          (split (with-current-buffer (find-file-noselect tag-fname)
                   (prog1
                       (split-string (buffer-string) "<span class="quote">\n</span>" 'omit-nulls)
                     (setq max (line-number-at-pos (point-max)))
                     (kill-buffer))))
          (progress-reporter (make-progress-reporter "<span class="quote">Loading tag file...</span>" 0 max)))
     (loop
           with fname
           with cand
           for i in split for count from 0
           for elm = (unless (string-match "<span class="quote">^\x0c</span>" i)
                       (anything-aif (string-match "<span class="quote">\177</span>" i)
                           (substring i 0 it)
                         i))
           do (cond ((and elm (string-match "<span class="quote">^\\(.+\\),[0-9]+</span>" elm))
                     (setq fname (match-string 1 elm)))
                    (elm (setq cand (concat fname "<span class="quote">: </span>" elm)))
                    (t (setq cand nil)))
           when cand do (progn
                          (insert (concat cand "<span class="quote">\n</span>"))
                          (progress-reporter-update progress-reporter count)))))

(defun anything-c-etags-init ()
  "<span class="quote">Feed `anything-buffer' using `anything-c-etags-cache' or tag file.
If no entry in cache, create one.</span>"
  (let ((tagfile (anything-c-etags-get-tag-file)))
    (when tagfile
      (with-current-buffer (anything-candidate-buffer 'global)
        (anything-aif (gethash tagfile anything-c-etags-cache)
            <span class="linecomment">;; An entry is present in cache, insert it.</span>
            (insert it)
          <span class="linecomment">;; No entry, create a new buffer using content of tag file (slower).</span>
          (anything-c-etags-create-buffer tagfile)
          <span class="linecomment">;; Store content of buffer in cache.</span>
          (puthash tagfile (buffer-string) anything-c-etags-cache)
          <span class="linecomment">;; Store or set the last modification of tag file.</span>
          (anything-aif (assoc tagfile anything-c-etags-mtime-alist)
              <span class="linecomment">;; If an entry exists modify it.</span>
              (setcdr it (anything-c-etags-mtime tagfile))
            <span class="linecomment">;; No entry create a new one.</span>
            (add-to-list 'anything-c-etags-mtime-alist
                         (cons tagfile (anything-c-etags-mtime tagfile)))))))))

(defvar anything-c-source-etags-select
  '((name . "<span class="quote">Etags</span>")
    (header-name . anything-c-source-etags-header-name)
    (init . anything-c-etags-init)
    (candidates-in-buffer)
    (search . (anything-c-etags-search-fn))
    (mode-line . anything-etags-mode-line-string)
    (action . anything-c-etags-default-action)
    (persistent-action . (lambda (candidate)
                           (anything-c-etags-default-action candidate)
                           (anything-match-line-color-current-line))))
  "<span class="quote">Anything source for Etags.</span>")

(defun anything-c-etags-search-fn (pattern)
  "<span class="quote">Search function for `anything-c-source-etags-select'.</span>"
  (re-search-forward
   (if anything-c-etags-use-regexp-search
       (format anything-c-etags-search-regexp pattern)
       pattern)
   nil t))

(defun anything-c-etags-default-action (candidate)
  "<span class="quote">Anything default action to jump to an etags entry.</span>"
  (let* ((split (split-string candidate "<span class="quote">: </span>"))
         (fname (expand-file-name
                 (car split) anything-c-etags-tag-file-dir))
         (elm   (cadr split)))
    (find-file fname)
    (goto-char (point-min))
    (search-forward elm nil t)
    (goto-char (match-beginning 0))))

(defun anything-c-etags-mtime (file)
  "<span class="quote">Last modification time of etags tag FILE.</span>"
  (cadr (nth 5 (file-attributes file))))

(defun anything-c-etags-file-modified-p (file)
  "<span class="quote">Check if tag FILE have been modified in this session.
If FILE is nil return nil.</span>"
  (let ((last-modif (and file
                         (assoc-default file anything-c-etags-mtime-alist))))
    (and last-modif
         (/= last-modif (anything-c-etags-mtime file)))))


 
<span class="linecomment">;;; Semantic</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; </span>
(defvar anything-semantic-candidates nil)

(defun anything-semantic-construct-candidates (tags depth)
  (when (require 'semantic nil t)
    (apply
     'append
     (mapcar
      (lambda (tag)
        (if (listp tag)
            (let ((type (semantic-tag-type tag))
                  (class (semantic-tag-class tag)))
              (if (or (and (stringp type)
                           (or (string= type "<span class="quote">class</span>")
                               (string= type "<span class="quote">namespace</span>")))
                      (eq class 'function)
                      (eq class 'variable))
                  (cons (cons (concat (make-string (* depth 2) ?\s)
                                      (semantic-format-tag-summarize tag nil t))
                              tag)
                        (anything-semantic-construct-candidates
                         (semantic-tag-components tag) (1+ depth)))))))
      tags))))

(defun anything-semantic-default-action (candidate)
  (let ((tag (cdr (assoc candidate anything-semantic-candidates))))
    (semantic-go-to-tag tag)))

(defvar anything-c-source-semantic
  '((name . "<span class="quote">Semantic Tags</span>")
    (init . (lambda ()
              (setq anything-semantic-candidates
                    (ignore-errors (anything-semantic-construct-candidates
                                    (semantic-fetch-tags) 0)))))
    (candidates . (lambda ()
                    (if anything-semantic-candidates
                        (mapcar 'car anything-semantic-candidates))))
    (persistent-action . (lambda (elm)
                           (anything-semantic-default-action elm)
                           (anything-match-line-color-current-line)))
    (persistent-help . "<span class="quote">Show this entry</span>")
    (action . anything-semantic-default-action)
    "<span class="quote">Needs semantic in CEDET.

http://cedet.sourceforge.net/semantic.shtml
http://cedet.sourceforge.net/</span>"))


 
<span class="linecomment">;;; Anything interface of `simple-call-tree.el'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; &lt;http://www.emacswiki.org/cgi-bin/wiki/download/simple-call-tree.el&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Function is called by</span>
(defvar anything-c-source-simple-call-tree-functions-callers
  '((name . "<span class="quote">Function is called by</span>")
    (init . anything-c-simple-call-tree-functions-callers-init)
    (multiline)
    (candidates . anything-c-simple-call-tree-candidates)
    (persistent-action . anything-c-simple-call-tree-persistent-action)
    (persistent-help . "<span class="quote">Show function definitions by rotation</span>")
    (action ("<span class="quote">Find definition selected by persistent-action</span>" .
             anything-c-simple-call-tree-find-definition)))
  "<span class="quote">Needs simple-call-tree.el.
http://www.emacswiki.org/cgi-bin/wiki/download/simple-call-tree.el</span>")

(defvar anything-c-simple-call-tree-tick nil)
(make-variable-buffer-local 'anything-c-simple-call-tree-tick)
(defun anything-c-simple-call-tree-analyze-maybe ()
  (unless (eq (buffer-chars-modified-tick) anything-c-simple-call-tree-tick)
    (simple-call-tree-analyze)
    (setq anything-c-simple-call-tree-tick (buffer-chars-modified-tick))))

(defun anything-c-simple-call-tree-init-base (function message)
  (require 'simple-call-tree)
  (with-no-warnings
    (when (anything-current-buffer-is-modified)
      (anything-c-simple-call-tree-analyze-maybe)
      (let ((list (funcall function simple-call-tree-alist)))
        (with-current-buffer (anything-candidate-buffer 'local)
          (dolist (entry list)
            (let ((funcs (concat "<span class="quote">  </span>" (mapconcat #'identity (cdr entry) "<span class="quote">\n  </span>"))))
              (insert (car entry) message
                      (if (string= funcs "<span class="quote">  </span>")
                          "<span class="quote">  no functions.</span>"
                          funcs)
                      "<span class="quote">\n\n</span>"))))))))

(defun anything-c-simple-call-tree-functions-callers-init ()
  (anything-c-simple-call-tree-init-base 'simple-call-tree-invert
                                         "<span class="quote"> is called by\n</span>"))

(defun anything-c-simple-call-tree-candidates ()
  (with-current-buffer (anything-candidate-buffer)
    (split-string (buffer-string) "<span class="quote">\n\n</span>")))

(defvar anything-c-simple-call-tree-related-functions nil)
(defvar anything-c-simple-call-tree-function-index 0)
(defun anything-c-simple-call-tree-persistent-action (candidate)
  (unless (eq last-command 'anything-execute-persistent-action)
    (setq anything-c-simple-call-tree-related-functions
          (delete "<span class="quote">no functions.</span>"
                  (split-string
                   (replace-regexp-in-string "<span class="quote">  \\| is called by\\| calls </span>"
                                             "<span class="quote"></span>" candidate)
                   "<span class="quote">\n</span>")))
    (setq anything-c-simple-call-tree-function-index -1))
  (incf anything-c-simple-call-tree-function-index)
  (anything-c-simple-call-tree-find-definition candidate))

(defun anything-c-simple-call-tree-find-definition (candidate)
  (find-function
   (intern
    (nth (mod anything-c-simple-call-tree-function-index
              (length anything-c-simple-call-tree-related-functions))
         anything-c-simple-call-tree-related-functions))))


<span class="linecomment">;;; Function calls</span>
(defvar anything-c-source-simple-call-tree-callers-functions
  '((name . "<span class="quote">Function calls</span>")
    (init . anything-c-simple-call-tree-callers-functions-init)
    (multiline)
    (candidates . anything-c-simple-call-tree-candidates)
    (persistent-action . anything-c-simple-call-tree-persistent-action)
    (persistent-help . "<span class="quote">Show function definitions by rotation</span>")
    (action ("<span class="quote">Find definition selected by persistent-action</span>" .
             anything-c-simple-call-tree-find-definition)))
  "<span class="quote">Needs simple-call-tree.el.
http://www.emacswiki.org/cgi-bin/wiki/download/simple-call-tree.el</span>")

(defun anything-c-simple-call-tree-callers-functions-init ()
  (anything-c-simple-call-tree-init-base 'identity "<span class="quote"> calls \n</span>"))



 
<span class="linecomment">;;; Anything UI of auto-document.el</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; &lt;http://www.emacswiki.org/cgi-bin/wiki/download/auto-document.el&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Commands/Options with doc</span>
(defvar anything-c-auto-document-data nil)
(make-variable-buffer-local 'anything-c-auto-document-data)
(defvar anything-c-source-commands-and-options-in-file
  '((name . "<span class="quote">Commands/Options in file</span>")
    (header-name
     . (lambda (x) (format "<span class="quote">Commands/Options in %s</span>"
                           (buffer-local-value 'buffer-file-name
                                               anything-current-buffer))))
    (candidates . anything-command-and-options-candidates)
    (multiline)
    (action . imenu))
  "<span class="quote">List Commands and Options with doc. It needs auto-document.el .

http://www.emacswiki.org/cgi-bin/wiki/download/auto-document.el</span>")

(eval-when-compile (require 'auto-document nil t))
(defun anything-command-and-options-candidates ()
  (with-anything-current-buffer
    (when (and (require 'auto-document nil t)
               (eq major-mode 'emacs-lisp-mode)
               (or (anything-current-buffer-is-modified)
                   (not anything-c-auto-document-data)))
      (or imenu--index-alist (imenu--make-index-alist t))
      (setq anything-c-auto-document-data
            (destructuring-bind (commands options)
                (adoc-construct anything-current-buffer)
              (append
               (loop for (command . doc) in commands
                     for cmdname = (symbol-name command)
                     collect
                     (cons
                      (format "<span class="quote">Command: %s\n %s</span>"
                              (propertize cmdname 'face font-lock-function-name-face)
                              (adoc-first-line doc))
                      (assoc cmdname imenu--index-alist)))
               (loop with var-alist = (cdr (assoc "<span class="quote">Variables</span>" imenu--index-alist))
                     for (option doc default) in options
                     for optname = (symbol-name option)
                     collect
                     (cons
                      (format "<span class="quote">Option: %s\n %s\n default = %s</span>"
                              (propertize optname 'face font-lock-variable-name-face)
                              (adoc-first-line doc)
                              (adoc-prin1-to-string default))
                      (assoc optname
                             var-alist)))))))
    anything-c-auto-document-data))


 
<span class="linecomment">;;;; &lt;Color and Face&gt;</span>
<span class="linecomment">;;</span>

<span class="linecomment">;;; Customize Face</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-customize-face
  '((name . "<span class="quote">Customize Face</span>")
    (init . (lambda ()
              (unless (anything-candidate-buffer)
                (save-selected-window
                  (list-faces-display))
                (anything-candidate-buffer (get-buffer "<span class="quote">*Faces*</span>")))))
    (candidates-in-buffer)
    (get-line . buffer-substring)
    (action . (lambda (line)
                (customize-face (intern (car (split-string line))))))
    (requires-pattern . 3))
  "<span class="quote">See (info \"(emacs)Faces\")</span>")

<span class="linecomment">;;; Colors browser</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-colors
  '((name . "<span class="quote">Colors</span>")
    (init . (lambda () (unless (anything-candidate-buffer)
                         (save-selected-window
                           (list-colors-display))
                         (anything-candidate-buffer (get-buffer "<span class="quote">*Colors*</span>")))))
    (candidates-in-buffer)
    (get-line . buffer-substring)
    (action
     ("<span class="quote">Copy Name</span>" . (lambda (candidate)
                      (kill-new (anything-c-colors-get-name candidate))))
     ("<span class="quote">Copy RGB</span>" . (lambda (candidate)
                     (kill-new (anything-c-colors-get-rgb candidate))))
     ("<span class="quote">Insert Name</span>" . (lambda (candidate)
                        (with-anything-current-buffer
                          (insert (anything-c-colors-get-name candidate)))))
     ("<span class="quote">Insert RGB</span>" . (lambda (candidate)
                       (with-anything-current-buffer
                         (insert (anything-c-colors-get-rgb candidate))))))))

(defun anything-c-colors-get-name (candidate)
  "<span class="quote">Get color name.</span>"
  (replace-regexp-in-string
   "<span class="quote"> </span>" "<span class="quote"></span>"
   (with-temp-buffer
     (insert (capitalize candidate))
     (goto-char (point-min))
     (search-forward-regexp "<span class="quote">\\s-\\{2,\\}</span>")
     (delete-region (point) (point-max))
     (buffer-string))))

(defun anything-c-colors-get-rgb (candidate)
  "<span class="quote">Get color RGB.</span>"
  (replace-regexp-in-string
   "<span class="quote"> </span>" "<span class="quote"></span>"
   (with-temp-buffer
     (insert (capitalize candidate))
     (goto-char (point-max))
     (search-backward-regexp "<span class="quote">\\s-\\{2,\\}</span>")
     (delete-region (point) (point-min))
     (buffer-string))))

 
<span class="linecomment">;;;; &lt;Search Engine&gt;</span>
<span class="linecomment">;;; Tracker desktop search</span>
(defvar anything-c-source-tracker-search
  '((name . "<span class="quote">Tracker Search</span>")
    (candidates . (lambda ()
                    (start-process "<span class="quote">tracker-search-process</span>" nil
                                   "<span class="quote">tracker-search</span>"
                                   anything-pattern)))
    (type . file)
    (requires-pattern . 3)
    (delayed))
  "<span class="quote">Source for retrieving files matching the current input pattern
with the tracker desktop search.</span>")

<span class="linecomment">;;; Spotlight (MacOS X desktop search)</span>
(defvar anything-c-source-mac-spotlight
  '((name . "<span class="quote">mdfind</span>")
    (candidates
     . (lambda () (start-process "<span class="quote">mdfind-process</span>" nil "<span class="quote">mdfind</span>" anything-pattern)))
    (type . file)
    (requires-pattern . 3)
    (delayed))
  "<span class="quote">Source for retrieving files via Spotlight's command line
utility mdfind.</span>")

<span class="linecomment">;;; Picklist</span>
(defvar anything-c-source-picklist
  '((name . "<span class="quote">Picklist</span>")
    (candidates . (lambda () (mapcar 'car picklist-list)))
    (type . file)))


 
<span class="linecomment">;;; Kill ring</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-kill-ring
  `((name . "<span class="quote">Kill Ring</span>")
    (init . (lambda () (anything-attrset 'last-command last-command)))
    (candidates . anything-c-kill-ring-candidates)
    (filtered-candidate-transformer anything-c-kill-ring-transformer)
    (action . anything-c-kill-ring-action)
    (keymap . ,anything-kill-ring-map)
    (last-command)
    (migemo)
    (multiline))
  "<span class="quote">Source for browse and insert contents of kill-ring.</span>")

(defun anything-c-kill-ring-candidates ()
  (loop for kill in (anything-fast-remove-dups kill-ring :test 'equal)
        unless (or (&lt; (length kill) anything-kill-ring-threshold)
                   (string-match "<span class="quote">^[\\s\\t]+$</span>" kill))
        collect kill))

(defun anything-c-kill-ring-transformer (candidates source)
  "<span class="quote">Display only the `anything-c-kill-ring-max-lines-number' lines of candidate.</span>"
  (loop for i in candidates
        for nlines = (with-temp-buffer (insert i) (count-lines (point-min) (point-max)))
        if (and anything-c-kill-ring-max-lines-number
                (&gt; nlines anything-c-kill-ring-max-lines-number))
        collect (cons
                 (with-temp-buffer
                   (insert i)
                   (goto-char (point-min))
                   (concat
                    (buffer-substring
                     (point-min)
                     (save-excursion
                       (forward-line anything-c-kill-ring-max-lines-number)
                       (point)))
                    "<span class="quote">[...]</span>")) i)
        else collect i))

(defun anything-c-kill-ring-action (str)
  "<span class="quote">Insert STR in `kill-ring' and set STR to the head.
If this action is executed just after `yank',
replace with STR as yanked string.</span>"
  (setq kill-ring (delete str kill-ring))
  (if (not (eq (anything-attr 'last-command) 'yank))
      (insert-for-yank str)
      <span class="linecomment">;; from `yank-pop'</span>
      (let ((inhibit-read-only t)
            (before (&lt; (point) (mark t))))
        (if before
            (funcall (or yank-undo-function 'delete-region) (point) (mark t))
            (funcall (or yank-undo-function 'delete-region) (mark t) (point)))
        (setq yank-undo-function nil)
        (set-marker (mark-marker) (point) (current-buffer))
        (insert-for-yank str)
        <span class="linecomment">;; Set the window start back where it was in the yank command,</span>
        <span class="linecomment">;; if possible.</span>
        (set-window-start (selected-window) yank-window-start t)
        (if before
            <span class="linecomment">;; This is like exchange-point-and-mark, but doesn't activate the mark.</span>
            <span class="linecomment">;; It is cleaner to avoid activation, even though the command</span>
            <span class="linecomment">;; loop would deactivate the mark because we inserted text.</span>
            (goto-char (prog1 (mark t)
                         (set-marker (mark-marker) (point) (current-buffer)))))))
  (kill-new str))


 
<span class="linecomment">;;;; &lt;Mark ring&gt;</span>
<span class="linecomment">;; DO NOT include these sources in `anything-sources' use</span>
<span class="linecomment">;; the commands `anything-mark-ring', `anything-global-mark-ring' or</span>
<span class="linecomment">;; `anything-all-mark-rings' instead.</span>

(defun anything-c-source-mark-ring-candidates ()
  (flet ((get-marks (pos)
           (save-excursion
             (goto-char pos)
             (beginning-of-line)
             (let ((line  (car (split-string (thing-at-point 'line) "<span class="quote">[\n\r]</span>"))))
               (when (string= "<span class="quote"></span>" line)
                 (setq line  "<span class="quote">&lt;EMPTY LINE&gt;</span>"))
               (format "<span class="quote">%7d: %s</span>" (line-number-at-pos) line)))))
    (with-anything-current-buffer
      (loop
            with marks = (if (mark) (cons (mark-marker) mark-ring) mark-ring)
            with recip = nil
            for i in marks
            for m = (get-marks i)
            unless (member m recip)
            collect m into recip
            finally return recip))))

(defvar anything-mark-ring-cache nil)
(defvar anything-c-source-mark-ring
  '((name . "<span class="quote">mark-ring</span>")
    (init . (lambda ()
              (setq anything-mark-ring-cache
                    (ignore-errors (anything-c-source-mark-ring-candidates)))))
    (candidates . (lambda ()
                    (anything-aif anything-mark-ring-cache
                        it)))
    (action . (("<span class="quote">Goto line</span>"
                . (lambda (candidate)
                    (anything-goto-line (string-to-number candidate))))))
    (persistent-action . (lambda (candidate)
                           (anything-goto-line (string-to-number candidate))
                           (anything-match-line-color-current-line)))
    (persistent-help . "<span class="quote">Show this line</span>")))


<span class="linecomment">;;; Global-mark-ring</span>
(defvar anything-c-source-global-mark-ring
  '((name . "<span class="quote">global-mark-ring</span>")
    (candidates . anything-c-source-global-mark-ring-candidates)
    (action . (("<span class="quote">Goto line</span>"
                . (lambda (candidate)
                    (let ((items (split-string candidate "<span class="quote">:</span>")))
                      (anything-c-switch-to-buffer (second items))
                      (anything-goto-line (string-to-number (car items))))))))
    (persistent-action . (lambda (candidate)
                           (let ((items (split-string candidate "<span class="quote">:</span>")))
                             (anything-c-switch-to-buffer (second items))
                             (anything-goto-line (string-to-number (car items)))
                             (anything-match-line-color-current-line))))
    (persistent-help . "<span class="quote">Show this line</span>")))

(defun anything-c-source-global-mark-ring-candidates ()
  (flet ((buf-fn (m)
           (with-current-buffer (marker-buffer m)
             (goto-char m)
             (beginning-of-line)
             (let (line)
               (if (string= "<span class="quote"></span>" line)
                   (setq line  "<span class="quote">&lt;EMPTY LINE&gt;</span>")
                   (setq line (car (split-string (thing-at-point 'line)
                                                 "<span class="quote">[\n\r]</span>"))))
               (format "<span class="quote">%7d:%s:    %s</span>"
                       (line-number-at-pos) (marker-buffer m) line)))))
    (loop
          with marks = global-mark-ring
          with recip = nil
          for i in marks
          for gm = (unless (or (string-match
                                "<span class="quote">^ </span>" (format "<span class="quote">%s</span>" (marker-buffer i)))
                               (null (marker-buffer i)))
                     (buf-fn i))
          when (and gm (not (member gm recip)))
          collect gm into recip
          finally return recip)))


 
<span class="linecomment">;;;; &lt;Register&gt;</span>
<span class="linecomment">;;; Insert from register</span>
(defvar anything-c-source-register
  '((name . "<span class="quote">Registers</span>")
    (candidates . anything-c-register-candidates)
    (action-transformer . anything-c-register-action-transformer)
    (multiline)
    (action))
  "<span class="quote">See (info \"(emacs)Registers\")</span>")

(defun anything-c-register-candidates ()
  "<span class="quote">Collecting register contents and appropriate commands.</span>"
  (loop for (char . val) in register-alist
        for key    = (single-key-description char)
        for string-actions =
        (cond
          ((numberp val)
           (list (int-to-string val)
                 'insert-register
                 'increment-register))
          ((markerp val)
           (let ((buf (marker-buffer val)))
             (if (null buf)
                 (list "<span class="quote">a marker in no buffer</span>")
                 (list (concat
                        "<span class="quote">a buffer position:</span>"
                        (buffer-name buf)
                        "<span class="quote">, position </span>"
                        (int-to-string (marker-position val)))
                       'jump-to-register
                       'insert-register))))
          ((and (consp val) (window-configuration-p (car val)))
           (list "<span class="quote">window configuration.</span>"
                 'jump-to-register))
          ((and (consp val) (frame-configuration-p (car val)))
           (list "<span class="quote">frame configuration.</span>"
                 'jump-to-register))
          ((and (consp val) (eq (car val) 'file))
           (list (concat "<span class="quote">file:</span>"
                         (prin1-to-string (cdr val))
                         "<span class="quote">.</span>")
                 'jump-to-register))
          ((and (consp val) (eq (car val) 'file-query))
           (list (concat "<span class="quote">file:a file-query reference: file </span>"
                         (car (cdr val))
                         "<span class="quote">, position </span>"
                         (int-to-string (car (cdr (cdr val))))
                         "<span class="quote">.</span>")
                 'jump-to-register))
          ((consp val)
           (let ((lines (format "<span class="quote">%4d</span>" (length val))))
             (list (format "<span class="quote">%s: %s\n</span>" lines
                           (truncate-string-to-width
                            (mapconcat 'identity (list (car val))
                                       "<span class="quote">^J</span>") (- (window-width) 15)))
                   'insert-register)))
          ((stringp val)
           (list
            <span class="linecomment">;; without properties</span>
            (concat (substring-no-properties
                     val 0 (min (length val) anything-c-register-max-offset))
                    (if (&gt; (length val) anything-c-register-max-offset)
                        "<span class="quote">[...]</span>" "<span class="quote"></span>"))
            'insert-register
            'append-to-register
            'prepend-to-register))
          ((vectorp val)
           (list
            "<span class="quote">Undo-tree entry.</span>"
            'undo-tree-restore-state-from-register))
          (t
           "<span class="quote">GARBAGE!</span>"))
        collect (cons (format "<span class="quote">register %3s: %s</span>" key (car string-actions))
                      (cons char (cdr string-actions)))))

(defun anything-c-register-action-transformer (actions register-and-functions)
  "<span class="quote">Decide actions by the contents of register.</span>"
  (loop with func-actions =
        '((insert-register
           "<span class="quote">Insert Register</span>" .
           (lambda (c) (insert-register (car c))))
          (jump-to-register
           "<span class="quote">Jump to Register</span>" .
           (lambda (c) (jump-to-register (car c))))
          (append-to-register
           "<span class="quote">Append Region to Register</span>" .
           (lambda (c) (append-to-register
                        (car c) (region-beginning) (region-end))))
          (prepend-to-register
           "<span class="quote">Prepend Region to Register</span>" .
           (lambda (c) (prepend-to-register
                        (car c) (region-beginning) (region-end))))
          (increment-register
           "<span class="quote">Increment Prefix Arg to Register</span>" .
           (lambda (c) (increment-register
                        anything-current-prefix-arg (car c))))
          (undo-tree-restore-state-from-register
           "<span class="quote">Restore Undo-tree register</span>"
           (lambda (c) (and (fboundp 'undo-tree-restore-state-from-register)
                            (undo-tree-restore-state-from-register (car c))))))
        for func in (cdr register-and-functions)
        for cell = (assq func func-actions)
        when cell
        collect (cdr cell)))


 
<span class="linecomment">;;; Latex completion</span>
(defun anything-c-latex-math-candidates ()
  "<span class="quote">Collect candidates for latex math completion.</span>"
  (declare (special LaTeX-math-menu))
  (loop for i in (cddr LaTeX-math-menu)
        for elm = (loop for s in i when (vectorp s)
                        collect (cons (aref s 0) (aref s 1)))
        append elm))

(defvar anything-c-source-latex-math
  '((name . "<span class="quote">Latex Math Menu</span>")
    (init . (lambda ()
              (with-anything-current-buffer
                (LaTeX-math-mode 1))))
    (candidate-number-limit . 9999)
    (candidates . anything-c-latex-math-candidates)
    (action . (lambda (candidate)
                (call-interactively candidate)))))

 
<span class="linecomment">;;;; &lt;Headline Extraction&gt;</span>
(defvar anything-c-source-fixme
  '((name . "<span class="quote">TODO/FIXME/DRY comments</span>")
    (headline . "<span class="quote">^.*\\&lt;\\(TODO\\|FIXME\\|DRY\\)\\&gt;.*$</span>")
    (adjust)
    (recenter))
  "<span class="quote">Show TODO/FIXME/DRY comments in current file.</span>")

(defvar anything-c-source-rd-headline
  '((name . "<span class="quote">RD HeadLine</span>")
    (headline  "<span class="quote">^= \\(.+\\)$</span>" "<span class="quote">^== \\(.+\\)$</span>" "<span class="quote">^=== \\(.+\\)$</span>" "<span class="quote">^==== \\(.+\\)$</span>")
    (condition . (memq major-mode '(rdgrep-mode rd-mode)))
    (migemo)
    (subexp . 1))
  "<span class="quote">Show RD headlines.

RD is Ruby's POD.
http://en.wikipedia.org/wiki/Ruby_Document_format</span>")

(defvar anything-c-source-oddmuse-headline
  '((name . "<span class="quote">Oddmuse HeadLine</span>")
    (headline  "<span class="quote">^= \\(.+\\) =$</span>" "<span class="quote">^== \\(.+\\) ==$</span>"
     "<span class="quote">^=== \\(.+\\) ===$</span>" "<span class="quote">^==== \\(.+\\) ====$</span>")
    (condition . (memq major-mode '(oddmuse-mode yaoddmuse-mode)))
    (migemo)
    (subexp . 1))
  "<span class="quote">Show Oddmuse headlines, such as EmacsWiki.</span>")

(defvar anything-c-source-emacs-source-defun
  '((name . "<span class="quote">Emacs Source DEFUN</span>")
    (headline . "<span class="quote">DEFUN\\|DEFVAR</span>")
    (condition . (string-match "<span class="quote">/emacs2[0-9].+/src/.+c$</span>"
                  (or buffer-file-name "<span class="quote"></span>"))))
  "<span class="quote">Show DEFUN/DEFVAR in Emacs C source file.</span>")

(defvar anything-c-source-emacs-lisp-expectations
  '((name . "<span class="quote">Emacs Lisp Expectations</span>")
    (headline . "<span class="quote">(desc[ ]\\|(expectations</span>")
    (condition . (eq major-mode 'emacs-lisp-mode)))
  "<span class="quote">Show descriptions (desc) in Emacs Lisp Expectations.

http://www.emacswiki.org/cgi-bin/wiki/download/el-expectations.el</span>")

(defvar anything-c-source-emacs-lisp-toplevels
  '((name . "<span class="quote">Emacs Lisp Toplevel / Level 4 Comment / Linkd Star</span>")
    (headline . "<span class="quote">^(\\|(@\\*\\|^;;;;</span>")
    (get-line . buffer-substring)
    (condition . (eq major-mode 'emacs-lisp-mode))
    (adjust))
  "<span class="quote">Show top-level forms, level 4 comments and linkd stars (optional) in Emacs Lisp.
linkd.el is optional because linkd stars are extracted by regexp.
http://www.emacswiki.org/cgi-bin/wiki/download/linkd.el</span>")

 
<span class="linecomment">;;; Anything yaoddmuse</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Be sure to have yaoddmuse.el installed</span>
<span class="linecomment">;; install-elisp may be required if you want to install elisp file from here.</span>
(defvar anything-yaoddmuse-use-cache-file nil)
(defvar anything-c-yaoddmuse-cache-file "<span class="quote">~/.emacs.d/yaoddmuse-cache.el</span>")
(defvar anything-c-yaoddmuse-ew-cache nil)

(defun anything-yaoddmuse-get-candidates ()
  (declare (special yaoddmuse-pages-hash))
  (if anything-yaoddmuse-use-cache-file
      (ignore-errors
        (unless anything-c-yaoddmuse-ew-cache
          (load anything-c-yaoddmuse-cache-file)
          (setq anything-c-yaoddmuse-ew-cache
                (gethash "<span class="quote">EmacsWiki</span>" yaoddmuse-pages-hash)))
        anything-c-yaoddmuse-ew-cache)
      (yaoddmuse-update-pagename t)
      (gethash "<span class="quote">EmacsWiki</span>" yaoddmuse-pages-hash)))

(defvar anything-c-source-yaoddmuse-emacswiki-edit-or-view
  '((name . "<span class="quote">Yaoddmuse Edit or View (EmacsWiki)</span>")
    (candidates . anything-yaoddmuse-get-candidates)
    (action . (("<span class="quote">Edit page</span>" . (lambda (candidate)
                                (yaoddmuse-edit "<span class="quote">EmacsWiki</span>" candidate)))
               ("<span class="quote">Browse page</span>"
                . (lambda (candidate)
                    (yaoddmuse-browse-page "<span class="quote">EmacsWiki</span>" candidate)))
               ("<span class="quote">Browse page other window</span>"
                . (lambda (candidate)
                    (if (one-window-p)
                        (split-window-vertically))
                    (yaoddmuse-browse-page "<span class="quote">EmacsWiki</span>" candidate)))
               ("<span class="quote">Browse diff</span>"
                . (lambda (candidate)
                    (yaoddmuse-browse-page-diff "<span class="quote">EmacsWiki</span>" candidate)))
               ("<span class="quote">Copy URL</span>"
                . (lambda (candidate)
                    (kill-new (yaoddmuse-url "<span class="quote">EmacsWiki</span>" candidate))
                    (message "<span class="quote">Have copy page %s's URL to yank.</span>" candidate)))
               ("<span class="quote">Create page</span>"
                . (lambda (candidate)
                    (yaoddmuse-edit "<span class="quote">EmacsWiki</span>" anything-input)))
               ("<span class="quote">Update cache</span>"
                . (lambda (candidate)
                    (if anything-yaoddmuse-use-cache-file
                        (progn
                          (anything-yaoddmuse-cache-pages t)
                          (setq anything-c-yaoddmuse-ew-cache
                                (gethash "<span class="quote">EmacsWiki</span>" yaoddmuse-pages-hash)))
                        (yaoddmuse-update-pagename))))))
    (action-transformer anything-c-yaoddmuse-action-transformer))
  "<span class="quote">Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el</span>")


(defvar anything-c-source-yaoddmuse-emacswiki-post-library
  '((name . "<span class="quote">Yaoddmuse Post library (EmacsWiki)</span>")
    (init . (anything-yaoddmuse-init))
    (candidates-in-buffer)
    (action . (("<span class="quote">Post library and Browse</span>"
                . (lambda (candidate)
                    (yaoddmuse-post-file
                     (find-library-name candidate)
                     "<span class="quote">EmacsWiki</span>"
                     (file-name-nondirectory (find-library-name candidate))
                     nil t)))
               ("<span class="quote">Post library</span>"
                . (lambda (candidate)
                    (yaoddmuse-post-file
                     (find-library-name candidate)
                     "<span class="quote">EmacsWiki</span>"
                     (file-name-nondirectory
                      (find-library-name candidate))))))))
  "<span class="quote">Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el</span>")


(defun anything-c-yaoddmuse-action-transformer (actions candidate)
  "<span class="quote">Allow the use of `install-elisp' only on elisp files.</span>"
  (if (string-match "<span class="quote">\.el$</span>" candidate)
      (append actions '(("<span class="quote">Install Elisp</span>"
                         . (lambda (elm)
                             (install-elisp-from-emacswiki elm)))))
      actions))

<span class="linecomment">;;;###autoload</span>
(defun anything-yaoddmuse-cache-pages (&optional load)
  "<span class="quote">Fetch the list of files on emacswiki and create cache file.
If load is non--nil load the file and feed `yaoddmuse-pages-hash'.</span>"
  (interactive)
  (declare (special yaoddmuse-pages-hash))
  (yaoddmuse-update-pagename)
  (save-excursion
    (find-file anything-c-yaoddmuse-cache-file)
    (erase-buffer)
    (insert "<span class="quote">(puthash \"EmacsWiki\" '(</span>")
    (loop for i in (gethash "<span class="quote">EmacsWiki</span>" yaoddmuse-pages-hash)
          do
          (insert (concat "<span class="quote">(\"</span>" (car i) "<span class="quote">\") </span>")))
    (insert "<span class="quote">) yaoddmuse-pages-hash)\n</span>")
    (save-buffer)
    (kill-buffer (current-buffer))
    (when (or current-prefix-arg
              load)
      (load anything-c-yaoddmuse-cache-file))))

(defun anything-yaoddmuse-init ()
  "<span class="quote">Init anything buffer status.</span>"
  (let ((anything-buffer (anything-candidate-buffer 'global))
        (library-list (yaoddmuse-get-library-list)))
    (with-current-buffer anything-buffer
      <span class="linecomment">;; Insert library name.</span>
      (dolist (library library-list)
        (insert (format "<span class="quote">%s\n</span>" library)))
      <span class="linecomment">;; Sort lines.</span>
      (sort-lines nil (point-min) (point-max)))))

 
<span class="linecomment">;;; Eev anchors</span>
(defvar anything-c-source-eev-anchor
  '((name . "<span class="quote">Anchors</span>")
    (candidates
     . (lambda ()
         (ignore-errors
           (with-anything-current-buffer
             (loop initially (goto-char (point-min))
                   while (re-search-forward
                          (format ee-anchor-format "<span class="quote">\\([^\.].+\\)</span>") nil t)
                   for anchor = (match-string-no-properties 1)
                   collect (cons (format "<span class="quote">%5d:%s</span>"
                                         (line-number-at-pos (match-beginning 0))
                                         (format ee-anchor-format anchor))
                                 anchor))))))
    (persistent-action . (lambda (item)
                           (ee-to item)
                           (anything-match-line-color-current-line)))
    (migemo)
    (persistent-help . "<span class="quote">Show this entry</span>")
    (action . (("<span class="quote">Goto link</span>" . ee-to)))))

 
<span class="linecomment">;;; Org headlines</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-org-headline
  `((name . "<span class="quote">Org HeadLine</span>")
    (headline
     ,@(mapcar
        (lambda (num)
          (format "<span class="quote">^\\*\\{%d\\} \\(.+?\\)\\([ \t]*:[a-zA-Z0-9_@:]+:\\)?[ \t]*$</span>"
                  num))
        (number-sequence 1 8)))
    (condition . (eq major-mode 'org-mode))
    (migemo)
    (subexp . 1)
    (persistent-action . (lambda (elm)
                           (anything-c-action-line-goto elm)
                           (org-cycle)))
    (action-transformer
     . (lambda (actions candidate)
         '(("<span class="quote">Go to Line</span>" . anything-c-action-line-goto)
           ("<span class="quote">Refile to this Headline</span>" . anything-c-org-headline-refile)
           ("<span class="quote">Insert Link to This Headline</span>"
            . anything-c-org-headline-insert-link-to-headline)))))
  "<span class="quote">Show Org headlines.
org-mode is very very much extended text-mode/outline-mode.

See (find-library \"org.el\")
See http://orgmode.org for the latest version.</span>")

(defun anything-c-org-headline-insert-link-to-headline (lineno-and-content)
  (insert
   (save-excursion
     (anything-goto-line (car lineno-and-content))
     (and (looking-at org-complex-heading-regexp)
          (org-make-link-string (concat "<span class="quote">*</span>" (match-string 4)))))))

(defun anything-c-org-headline-refile (lineno-and-content)
  "<span class="quote">Refile current org entry to LINENO-AND-CONTENT.</span>"
  (with-anything-current-buffer
    (org-cut-subtree)
    (anything-goto-line (car lineno-and-content))
    (org-end-of-subtree t t)
    (let ((org-yank-adjusted-subtrees t))
      (org-yank))))


<span class="linecomment">;;; Org keywords</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-org-keywords
  '((name . "<span class="quote">Org Keywords</span>")
    (init . anything-c-org-keywords-init)
    (candidates . anything-c-org-keywords-candidates)
    (action . anything-c-org-keywords-insert)
    (persistent-action . anything-c-org-keywords-show-help)
    (persistent-help . "<span class="quote">Show an example and info page to describe this keyword.</span>")
    (keywords-examples)
    (keywords)))

(defvar anything-c-org-keywords-info-location
  '(("<span class="quote">#+TITLE:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+AUTHOR:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+DATE:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+EMAIL:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+DESCRIPTION:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+KEYWORDS:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+LANGUAGE:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+TEXT:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+TEXT:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+OPTIONS:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+BIND:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+LINK_UP:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+LINK_HOME:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+LATEX_HEADER:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+EXPORT_SELECT_TAGS:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+EXPORT_EXCLUDE_TAGS:</span>" . "<span class="quote">(org)Export options</span>")
    ("<span class="quote">#+INFOJS_OPT</span>" . "<span class="quote">(org)Javascript support</span>")
    ("<span class="quote">#+BEGIN_HTML</span>" . "<span class="quote">(org)Quoting HTML tags</span>")
    ("<span class="quote">#+BEGIN_LaTeX</span>" . "<span class="quote">(org)Quoting LaTeX code</span>")
    ("<span class="quote">#+ORGTBL</span>" . "<span class="quote">(org)Radio tables</span>")
    ("<span class="quote">#+HTML:</span>" . "<span class="quote">(org)Quoting HTML tags</span>")
    ("<span class="quote">#+LaTeX:</span>" . "<span class="quote">(org)Quoting LaTeX code</span>")
    ("<span class="quote">#+BEGIN:</span>" . "<span class="quote">(org)Dynamic blocks</span>") <span class="linecomment">;clocktable columnview</span>
    ("<span class="quote">#+BEGIN_EXAMPLE</span>" . "<span class="quote">(org)Literal examples</span>")
    ("<span class="quote">#+BEGIN_QUOTE</span>" . "<span class="quote">(org)Paragraphs</span>")
    ("<span class="quote">#+BEGIN_VERSE</span>" . "<span class="quote">(org)Paragraphs</span>")
    ("<span class="quote">#+BEGIN_SRC</span>" . "<span class="quote">(org)Literal examples</span>")
    ("<span class="quote">#+CAPTION</span>" . "<span class="quote">(org)Tables in HTML export</span>")
    ("<span class="quote">#+LABEL</span>" . "<span class="quote">(org)Tables in LaTeX export</span>")
    ("<span class="quote">#+ATTR_HTML</span>" . "<span class="quote">(org)Links</span>")
    ("<span class="quote">#+ATTR_LaTeX</span>" . "<span class="quote">(org)Images in LaTeX export</span>")))

(defun anything-c-org-keywords-init ()
  (unless (anything-attr 'keywords-examples)
    (require 'org)
    (anything-attrset 'keywords-examples
                      (append
                       (mapcar
                        (lambda (x)
                          (string-match "<span class="quote">^#\\+\\(\\([A-Z_]+:?\\).*\\)</span>" x)
                          (cons (match-string 2 x) (match-string 1 x)))
                        (org-split-string (org-get-current-options) "<span class="quote">\n</span>"))
                       (mapcar 'list org-additional-option-like-keywords)))
    (anything-attrset 'keywords (mapcar 'car (anything-attr 'keywords-examples)))))

(defun anything-c-org-keywords-candidates ()
  (and (or (eq (buffer-local-value 'major-mode anything-current-buffer) 'org-mode)
           (eq (buffer-local-value 'major-mode anything-current-buffer) 'message-mode))
       (anything-attr 'keywords)))

(defun anything-c-org-keywords-insert (keyword)
  (cond ((and (string-match "<span class="quote">BEGIN</span>" keyword)
              (anything-region-active-p))
         (let ((beg (region-beginning))
               (end (region-end)))
           (goto-char end)
           (insert "<span class="quote">\n#+</span>" (replace-regexp-in-string
                           "<span class="quote">BEGIN</span>" "<span class="quote">END</span>" keyword) "<span class="quote">\n</span>")
           (goto-char beg)
           (insert "<span class="quote">#+</span>" keyword "<span class="quote"> </span>")
           (save-excursion (insert "<span class="quote">\n</span>"))))
        ((string-match "<span class="quote">BEGIN</span>" keyword)
         (insert "<span class="quote">#+</span>" keyword "<span class="quote"> </span>")
         (save-excursion
           (insert "<span class="quote">\n#+</span>" (replace-regexp-in-string
                           "<span class="quote">BEGIN</span>" "<span class="quote">END</span>" keyword) "<span class="quote">\n</span>")))
        (t (insert "<span class="quote">#+</span>" keyword "<span class="quote"> </span>"))))

(defun anything-c-org-keywords-show-help (keyword)
  (info (or (assoc-default (concat "<span class="quote">#+</span>" keyword) anything-c-org-keywords-info-location)
            "<span class="quote">(org)In-buffer settings</span>"))
  (search-forward (concat "<span class="quote">#+</span>" keyword) nil t)
  (anything-persistent-highlight-point)
  (message "<span class="quote">%s</span>" (or (cdr (assoc keyword (anything-attr 'keywords-examples))) "<span class="quote"></span>")))


 
<span class="linecomment">;;; bbdb</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar bbdb-records)
(defvar bbdb-buffer-name)

(defun anything-c-bbdb-candidates ()
  "<span class="quote">Return a list of all names in the bbdb database.  The format
is \"Firstname Lastname\".</span>"
  (mapcar (lambda (bbdb-record)
            (replace-regexp-in-string
             "<span class="quote">\\s-+$</span>" "<span class="quote"></span>"
             (concat (aref bbdb-record 0) "<span class="quote"> </span>" (aref bbdb-record 1))))
          (bbdb-records)))

(defun anything-c-bbdb-create-contact (actions candidate)
  "<span class="quote">Action transformer that returns only an entry to add the
current `anything-pattern' as new contact.  All other actions are
removed.</span>"
  (if (string= candidate "<span class="quote">*Add to contacts*</span>")
      '(("<span class="quote">Add to contacts</span>" . (lambda (actions)
                               (bbdb-create-internal
                                (read-from-minibuffer "<span class="quote">Name: </span>" anything-c-bbdb-name)
                                (read-from-minibuffer "<span class="quote">Company: </span>")
                                (read-from-minibuffer "<span class="quote">Email: </span>")
                                nil
                                nil
                                (read-from-minibuffer "<span class="quote">Note: </span>")))))
      actions))

(defun anything-c-bbdb-get-record (candidate)
  "<span class="quote">Return record that match CANDIDATE.</span>"
  (bbdb candidate nil)
  (set-buffer "<span class="quote">*BBDB*</span>")
  (bbdb-current-record))

(defvar anything-c-bbdb-name nil
  "<span class="quote">Only for internal use.</span>")

(defvar anything-c-source-bbdb
  '((name . "<span class="quote">BBDB</span>")
    (candidates . anything-c-bbdb-candidates)
    (action ("<span class="quote">Send a mail</span>" . anything-c-bbdb-compose-mail)
     ("<span class="quote">View person's data</span>" . anything-c-bbdb-view-person-action))
    (filtered-candidate-transformer . (lambda (candidates source)
                                        (setq anything-c-bbdb-name anything-pattern)
                                        (if (not candidates)
                                            (list "<span class="quote">*Add to contacts*</span>")
                                            candidates)))
    (action-transformer . (lambda (actions candidate)
                            (anything-c-bbdb-create-contact actions candidate))))
  "<span class="quote">Needs BBDB.

http://bbdb.sourceforge.net/</span>")

(defun anything-c-bbdb-view-person-action (candidate)
  "<span class="quote">View BBDB data of single CANDIDATE or marked candidates.</span>"
  (anything-aif (anything-marked-candidates)
      (let ((bbdb-append-records (length it)))
        (dolist (i it)
          (bbdb-redisplay-one-record (anything-c-bbdb-get-record i))))
    (bbdb-redisplay-one-record (anything-c-bbdb-get-record candidate))))

(defun anything-c-bbdb-collect-mail-addresses ()
  "<span class="quote">Return a list of all mail addresses of records in bbdb buffer.</span>"
  (with-current-buffer bbdb-buffer-name
    (loop for i in bbdb-records
          if (bbdb-record-net (car i))
          collect (bbdb-dwim-net-address (car i)))))

(defun anything-c-bbdb-compose-mail (candidate)
  "<span class="quote">Compose a mail with all records of bbdb buffer.</span>"
  (anything-c-bbdb-view-person-action candidate)
  (let* ((address-list (anything-c-bbdb-collect-mail-addresses))
         (address-str  (mapconcat 'identity address-list "<span class="quote">,\n    </span>")))
    (compose-mail address-str)))

 
<span class="linecomment">;;; Evaluation Result</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Internal</span>
(defvar anything-eldoc-active-minibuffers-list nil)
(defvar anything-eval-expression-input-history nil)

(defvar anything-c-source-evaluation-result
  '((name . "<span class="quote">Evaluation Result</span>")
    (disable-shortcuts)
    (dummy)
    (multiline)
    (mode-line . "<span class="quote">C-RET: nl-and-indent, tab: reindent, C-tab:complete, C-p/n: next/prec-line.</span>")
    (filtered-candidate-transformer . (lambda (candidates source)
                                        (list
                                         (condition-case nil
                                             (with-anything-current-buffer
                                               (pp-to-string
                                                (eval (read anything-pattern))))
                                           (error "<span class="quote">Error</span>")))))
    (action . (("<span class="quote">Copy result to kill-ring</span>" . (lambda (candidate)
                                               (with-current-buffer anything-buffer
                                                 (let ((end (save-excursion
                                                              (goto-char (point-max))
                                                              (search-backward "<span class="quote">\n</span>")
                                                              (point))))
                                                   (kill-region (point) end)))))
               ("<span class="quote">copy sexp to kill-ring</span>" . (lambda (candidate)
                                             (kill-new anything-input)))))))

(defun anything-eval-new-line-and-indent ()
  (interactive)
  (newline) (lisp-indent-line))

(defun anything-eldoc-store-minibuffer ()
  "<span class="quote">Store minibuffer buffer name in `anything-eldoc-active-minibuffers-list'.</span>"
  (with-selected-window (minibuffer-window)
    (push (buffer-name) anything-eldoc-active-minibuffers-list)))

(defun anything-eldoc-show-in-eval ()
  "<span class="quote">Return eldoc in mode-line for current minibuffer input.</span>"
  (let ((buf (with-selected-window (minibuffer-window)
               (buffer-name))))
    (when (member buf anything-eldoc-active-minibuffers-list)  
      (let* ((str-all (with-current-buffer buf
                        (minibuffer-completion-contents)))
             (sym     (when str-all
                        (with-temp-buffer
                          (insert str-all)
                          (goto-char (point-max))
                          (unless (looking-back "<span class="quote">)\\|\"</span>") (forward-char -1))
                          (eldoc-current-symbol))))
             (info-fn (eldoc-fnsym-in-current-sexp))
             (doc     (or (eldoc-get-var-docstring sym)
                          (eldoc-get-fnsym-args-string
                           (car info-fn) (cadr info-fn)))))
        (when doc (funcall anything-c-eldoc-in-minibuffer-show-fn doc))))))

(defun anything-c-show-info-in-mode-line (str)
  "<span class="quote">Display string STR in mode-line.</span>"
  (save-selected-window
    (with-current-buffer anything-buffer
      (let ((mode-line-format (concat "<span class="quote"> </span>" str)))
        (force-mode-line-update)
        (sit-for anything-c-show-info-in-mode-line-delay))
      (force-mode-line-update))))

<span class="linecomment">;;; Calculation Result</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-calculation-result
  '((name . "<span class="quote">Calculation Result</span>")
    (dummy)
    (filtered-candidate-transformer . (lambda (candidates source)
                                        (list
                                         (condition-case nil
                                             (calc-eval anything-pattern)
                                           (error "<span class="quote">error</span>")))))
    (action ("<span class="quote">Copy result to kill-ring</span>" . kill-new))))

 
<span class="linecomment">;;; Google Suggestions</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Internal</span>
(defvar anything-ggs-max-length-real-flag 0)
(defvar anything-ggs-max-length-num-flag 0)

(defun anything-c-google-suggest-fetch (input)
  "<span class="quote">Fetch suggestions for INPUT from XML buffer.
Return an alist with elements like (data . number_results).</span>"
  (setq anything-ggs-max-length-real-flag 0
        anything-ggs-max-length-num-flag 0)
  (let ((request (concat anything-c-google-suggest-url
                         (url-hexify-string input))))
    (flet ((fetch ()
             (loop
                   with result-alist = (xml-get-children
                                        (car (xml-parse-region
                                              (point-min) (point-max)))
                                        'CompleteSuggestion)
                   for i in result-alist
                   for data = (cdr (caadr (assoc 'suggestion i)))
                   for nqueries = (cdr (caadr (assoc 'num_queries i)))
                   for lqueries = (length (anything-c-ggs-set-number-result
                                           nqueries))
                   for ldata = (length data)
                   do
                   (progn
                     (when (&gt; ldata anything-ggs-max-length-real-flag)
                       (setq anything-ggs-max-length-real-flag ldata))
                     (when (&gt; lqueries anything-ggs-max-length-num-flag)
                       (setq anything-ggs-max-length-num-flag lqueries)))
                   collect (cons data nqueries) into cont
                   finally return cont)))
      (if anything-google-suggest-use-curl-p
          (with-temp-buffer
            (call-process "<span class="quote">curl</span>" nil t nil request)
            (fetch))
          (with-current-buffer
              (url-retrieve-synchronously request)
            (fetch))))))

(defun anything-c-google-suggest-set-candidates (&optional request-prefix)
  "<span class="quote">Set candidates with result and number of google results found.</span>"
  (let ((suggestions
         (loop with suggested-results = (anything-c-google-suggest-fetch
                                         (or (and request-prefix
                                                  (concat request-prefix
                                                          "<span class="quote"> </span>" anything-pattern))
                                             anything-pattern))
               for (real . numresult) in suggested-results
               <span class="linecomment">;; Prepare number of results with ","</span>
               for fnumresult = (anything-c-ggs-set-number-result numresult)
               <span class="linecomment">;; Calculate number of spaces to add before fnumresult</span>
               <span class="linecomment">;; if it is smaller than longest result</span>
               <span class="linecomment">;; `anything-ggs-max-length-num-flag'.</span>
               <span class="linecomment">;; e.g 1,234,567</span>
               <span class="linecomment">;;       345,678</span>
               <span class="linecomment">;; To be sure it is aligned properly.</span>
               for nspaces = (if (&lt; (length fnumresult)
                                    anything-ggs-max-length-num-flag)
                                 (- anything-ggs-max-length-num-flag
                                    (length fnumresult))
                                 0)
               <span class="linecomment">;; Add now the spaces before fnumresult.</span>
               for align-fnumresult = (concat (make-string nspaces ? )
                                              fnumresult)
               for interval = (- anything-ggs-max-length-real-flag
                                 (length real))
               for spaces   = (make-string (+ 2 interval) ? )
               for display = (format "<span class="quote">%s%s(%s results)</span>"
                                     real spaces align-fnumresult)
               collect (cons display real))))
    (if (loop for (disp . dat) in suggestions
              thereis (equal dat anything-pattern))
        suggestions
        <span class="linecomment">;; if there is no suggestion exactly matching the input then</span>
        <span class="linecomment">;; prepend a Search on Google item to the list</span>
        (append
         suggestions
         (list (cons (concat "<span class="quote">Search for </span>" "<span class="quote">'</span>" anything-input "<span class="quote">'</span>" "<span class="quote"> on Google</span>")
                     anything-input))))))

(defun anything-c-ggs-set-number-result (num)
  (if num
      (progn
        (and (numberp num) (setq num (number-to-string num)))
        (loop for i in (reverse (split-string num "<span class="quote"></span>" t))
              for count from 1
              append (list i) into C
              when (= count 3)
              append (list "<span class="quote">,</span>") into C
              and do (setq count 0)
              finally return
              (replace-regexp-in-string
               "<span class="quote">^,</span>" "<span class="quote"></span>" (mapconcat 'identity (reverse C) "<span class="quote"></span>"))))
      "<span class="quote">?</span>"))

(defvar anything-c-google-suggest-default-browser-function nil
  "<span class="quote">*The browse url function you prefer to use with google suggest.
When nil, use the first browser function available
See `anything-browse-url-default-browser-alist'.</span>")

(defun anything-c-google-suggest-action (candidate)
  "<span class="quote">Default action to jump to a google suggested candidate.</span>"
  (let ((arg (concat anything-c-google-suggest-search-url
                     (url-hexify-string candidate))))
    (anything-aif anything-c-google-suggest-default-browser-function
        (funcall it arg)
      (anything-c-browse-url arg))))

(defvar anything-c-google-suggest-default-function
  'anything-c-google-suggest-set-candidates
  "<span class="quote">Default function to use in anything google suggest.</span>")

(defvar anything-c-source-google-suggest
  '((name . "<span class="quote">Google Suggest</span>")
    (candidates . (lambda ()
                    (funcall anything-c-google-suggest-default-function)))
    (action . (("<span class="quote">Google Search</span>" . anything-c-google-suggest-action)))
    (volatile)
    (requires-pattern . 3)
    (delayed)))

(defun anything-c-google-suggest-emacs-lisp ()
  "<span class="quote">Try to emacs lisp complete with google suggestions.</span>"
  (anything-c-google-suggest-set-candidates "<span class="quote">emacs lisp</span>"))


<span class="linecomment">;;; Yahoo suggestions</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-yahoo-suggest-fetch (input)
  "<span class="quote">Fetch Yahoo suggestions for INPUT from XML buffer.
Return an alist with elements like (data . number_results).</span>"
  (let ((request (concat anything-c-yahoo-suggest-url
                         (url-hexify-string input))))
    (flet ((fetch ()
             (loop
                   with result-alist = (xml-get-children
                                        (car (xml-parse-region
                                              (point-min) (point-max)))
                                        'Result)
                   for i in result-alist
                   collect (caddr i))))
      (with-current-buffer
          (url-retrieve-synchronously request)
        (fetch)))))

(defun anything-c-yahoo-suggest-set-candidates ()
  "<span class="quote">Set candidates with Yahoo results found.</span>"
  (let ((suggestions (anything-c-yahoo-suggest-fetch anything-input)))
    (or suggestions
        (append
         suggestions
         (list (cons (concat "<span class="quote">Search for </span>" "<span class="quote">'</span>" anything-input "<span class="quote">'</span>" "<span class="quote"> on Yahoo</span>")
                     anything-input))))))

(defun anything-c-yahoo-suggest-action (candidate)
  "<span class="quote">Default action to jump to a Yahoo suggested candidate.</span>"
  (anything-c-browse-url (concat anything-c-yahoo-suggest-search-url
                                 (url-hexify-string candidate))))

(defvar anything-c-source-yahoo-suggest
  '((name . "<span class="quote">Yahoo Suggest</span>")
    (candidates . anything-c-yahoo-suggest-set-candidates)
    (action . (("<span class="quote">Yahoo Search</span>" . anything-c-yahoo-suggest-action)))
    (volatile)
    (requires-pattern . 3)
    (delayed)))


 
<span class="linecomment">;;; Web browser functions.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(require 'browse-url)
<span class="linecomment">;; If default setting of `w3m-command' is not</span>
<span class="linecomment">;; what you want you and you modify it, you will have to reeval</span>
<span class="linecomment">;; also `anything-browse-url-default-browser-alist'.</span>
(defvar w3m-command "<span class="quote">/usr/bin/w3m</span>")
(defvar anything-c-home-url "<span class="quote">http://www.google.fr</span>"
  "<span class="quote">*Default url to use as home url.</span>")

(defvar ac-browse-url-chromium-program "<span class="quote">chromium-browser</span>")
(defvar ac-browse-url-uzbl-program "<span class="quote">uzbl-browser</span>")
(defvar anything-browse-url-default-browser-alist
  `((,w3m-command . w3m-browse-url)
    (,browse-url-firefox-program . browse-url-firefox)
    (,ac-browse-url-chromium-program . ac-browse-url-chromium)
    (,ac-browse-url-uzbl-program . ac-browse-url-uzbl)
    (,browse-url-kde-program . browse-url-kde)
    (,browse-url-gnome-moz-program . browse-url-gnome-moz)
    (,browse-url-mozilla-program . browse-url-mozilla)
    (,browse-url-galeon-program . browse-url-galeon)
    (,browse-url-netscape-program . browse-url-netscape)
    (,browse-url-mosaic-program . browse-url-mosaic)
    (,browse-url-xterm-program . browse-url-text-xterm))
  "<span class="quote">*Alist of \(executable . function\) to try to find a suitable url browser.</span>")

(defun* anything-c-generic-browser (url name &rest args)
  "<span class="quote">Browse URL with NAME browser.</span>"
  (let ((proc (concat name "<span class="quote"> </span>" url)))
    (message "<span class="quote">Starting %s...</span>" name)
    (apply 'start-process proc nil name
           (append args (list url)))
    (set-process-sentinel
     (get-process proc)
     #'(lambda (process event)
         (when (string= event "<span class="quote">finished\n</span>")
           (message "<span class="quote">%s process %s</span>" process event))))))

(defun ac-browse-url-chromium (url)
  "<span class="quote">Browse URL with google chrome browser.</span>"
  (interactive "<span class="quote">sURL: </span>")
  (anything-c-generic-browser
   url ac-browse-url-chromium-program))

(defun ac-browse-url-uzbl (url &optional ignore)
  "<span class="quote">Browse URL with uzbl browser.</span>"
  (interactive "<span class="quote">sURL: </span>")
  (anything-c-generic-browser url ac-browse-url-uzbl-program "<span class="quote">-u</span>"))

(defun anything-browse-url-default-browser (url &rest args)
  "<span class="quote">Find the first available browser and ask it to load URL.</span>"
  (let ((default-browser-fn
         (loop for (exe . fn) in anything-browse-url-default-browser-alist
               thereis (and exe (executable-find exe) fn))))
    (if default-browser-fn
        (apply default-browser-fn url args)
        (error "<span class="quote">No usable browser found</span>"))))

(defun anything-c-browse-url (url &rest args)
  "<span class="quote">Default command to browse URL.</span>"
  (if browse-url-browser-function
      (browse-url url args)
      (anything-browse-url-default-browser url args)))

 
<span class="linecomment">;;; Surfraw</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Need external program surfraw.</span>
<span class="linecomment">;; &lt;http://surfraw.alioth.debian.org/&gt;</span>

(defvar anything-surfraw-default-browser-function nil
  "<span class="quote">*The browse url function you prefer to use with surfraw.
When nil, fallback to `browse-url-browser-function'.</span>")

<span class="linecomment">;; Internal</span>
(defvar anything-surfraw-engines-history nil)
(defvar anything-surfraw-input-history nil)

(defun anything-c-build-elvi-list ()
  "<span class="quote">Return list of all engines and descriptions handled by surfraw.</span>"
  (cdr
   (with-temp-buffer
     (call-process "<span class="quote">surfraw</span>" nil t nil
                   "<span class="quote">-elvi</span>")
     (split-string (buffer-string) "<span class="quote">\n</span>"))))

 
<span class="linecomment">;;; Emms</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-emms-stream-edit-bookmark (elm)
  "<span class="quote">Change the information of current emms-stream bookmark from anything.</span>"
  (declare (special emms-stream-list))
  (let* ((cur-buf anything-current-buffer)
         (bookmark (assoc elm emms-stream-list))
         (name     (read-from-minibuffer "<span class="quote">Description: </span>"
                                         (nth 0 bookmark)))
         (url      (read-from-minibuffer "<span class="quote">URL: </span>"
                                         (nth 1 bookmark)))
         (fd       (read-from-minibuffer "<span class="quote">Feed Descriptor: </span>"
                                         (int-to-string (nth 2 bookmark))))
         (type     (read-from-minibuffer "<span class="quote">Type (url, streamlist, or lastfm): </span>"
                                         (format "<span class="quote">%s</span>" (car (last bookmark))))))
    (save-window-excursion
      (emms-streams)
      (when (re-search-forward (concat "<span class="quote">^</span>" name) nil t)
        (beginning-of-line)
        (emms-stream-delete-bookmark)
        (emms-stream-add-bookmark name url (string-to-number fd) type)
        (emms-stream-save-bookmarks-file)
        (emms-stream-quit)
        (anything-c-switch-to-buffer cur-buf)))))

(defun anything-emms-stream-delete-bookmark (candidate)
  "<span class="quote">Delete emms-streams bookmarks from anything.</span>"
  (let* ((cands   (anything-marked-candidates))
         (bmks    (loop for bm in cands collect
                        (car (assoc bm emms-stream-list))))
         (bmk-reg (mapconcat 'regexp-quote bmks "<span class="quote">\\|^</span>")))
    (when (y-or-n-p (format "<span class="quote">Really delete radios\n -%s: ? </span>"
                            (mapconcat 'identity bmks "<span class="quote">\n -</span>")))
      (save-window-excursion
        (emms-streams)
        (goto-char (point-min))
        (loop while (re-search-forward bmk-reg nil t)
              do (progn (beginning-of-line)
                        (emms-stream-delete-bookmark))
              finally do (progn
                           (emms-stream-save-bookmarks-file)
                           (emms-stream-quit)))))))

(defvar anything-c-source-emms-streams
  '((name . "<span class="quote">Emms Streams</span>")
    (init . (lambda ()
              (emms-stream-init)))
    (candidates . (lambda ()
                    (declare (special emms-stream-list))
                    (mapcar 'car emms-stream-list)))
    (action . (("<span class="quote">Play</span>" . (lambda (elm)
                           (declare (special emms-stream-list))
                           (let* ((stream (assoc elm emms-stream-list))
                                  (fn (intern (concat "<span class="quote">emms-play-</span>" (symbol-name (car (last stream))))))
                                  (url (second stream)))
                             (funcall fn url))))
               ("<span class="quote">Delete</span>" . anything-emms-stream-delete-bookmark)
               ("<span class="quote">Edit</span>" . anything-emms-stream-edit-bookmark)))
    (filtered-candidate-transformer . anything-c-adaptive-sort)))

<span class="linecomment">;; Don't forget to set `emms-source-file-default-directory'</span>
(defvar anything-c-source-emms-dired
  '((name . "<span class="quote">Music Directory</span>")
    (candidates . (lambda ()
                    (cddr (directory-files emms-source-file-default-directory))))
    (action .
     (("<span class="quote">Play Directory</span>" . (lambda (item)
                            (emms-play-directory
                             (expand-file-name
                              item
                              emms-source-file-default-directory))))
      ("<span class="quote">Open dired in file's directory</span>" . (lambda (item)
                                            (anything-c-open-dired
                                             (expand-file-name
                                              item
                                              emms-source-file-default-directory))))))
    (filtered-candidate-transformer . anything-c-adaptive-sort)))


(defun anything-c-emms-files-modifier (candidates source)
  (let ((current-playlist (with-current-emms-playlist
                              (loop with cur-list = (emms-playlist-tracks-in-region
                                                     (point-min) (point-max))
                                    for i in cur-list
                                    for name = (assoc-default 'name i)
                                    when name
                                    collect name))))
    (loop for i in candidates
          if (member (cdr i) current-playlist)
          collect (cons (propertize (car i)
                                    'face 'anything-emms-playlist)
                        (cdr i)) into lis
          else collect i into lis
          finally return (reverse lis))))

(defun anything-c-emms-play-current-playlist ()
  "<span class="quote">Play current playlist.</span>"
  (with-current-emms-playlist
      (emms-playlist-first)
    (emms-playlist-mode-play-smart)))

(defvar anything-c-source-emms-files
  '((name . "<span class="quote">Emms files</span>")
    (candidates . (lambda ()
                    (loop for v being the hash-values in emms-cache-db
                          for name      = (assoc-default 'name v)
                          for artist    = (or (assoc-default 'info-artist v) "<span class="quote">unknown</span>")
                          for genre     = (or (assoc-default 'info-genre v) "<span class="quote">unknown</span>")
                          for tracknum  = (or (assoc-default 'info-tracknumber v) "<span class="quote">unknown</span>")
                          for song      = (or (assoc-default 'info-title v) "<span class="quote">unknown</span>")
                          for info      = (concat artist "<span class="quote"> - </span>" genre "<span class="quote"> - </span>" tracknum "<span class="quote">: </span>" song)
                          unless (string-match "<span class="quote">^\\(http\\|mms\\):</span>" name)
                          collect (cons info name))))
    (filtered-candidate-transformer . anything-c-emms-files-modifier)
    (candidate-number-limit . 9999)
    (action . (("<span class="quote">Play file</span>" . emms-play-file)
               ("<span class="quote">Add to Playlist and play (C-u clear current)</span>"
                . (lambda (candidate)
                    (when anything-current-prefix-arg
                      (emms-playlist-current-clear))
                    (emms-playlist-new)
                    (mapc 'emms-add-playlist-file (anything-marked-candidates))
                    (unless emms-player-playing-p
                      (anything-c-emms-play-current-playlist))))))))


 
<span class="linecomment">;;; Jabber Contacts (jabber.el)</span>
(defun anything-c-jabber-online-contacts ()
  "<span class="quote">List online Jabber contacts.</span>"
  (with-no-warnings
    (let (jids)
      (dolist (item (jabber-concat-rosters) jids)
        (when (get item 'connected)
          (push (if (get item 'name)
                    (cons (get item 'name) item)
                    (cons (symbol-name item) item)) jids))))))

(defvar anything-c-source-jabber-contacts
  '((name . "<span class="quote">Jabber Contacts</span>")
    (init . (lambda () (require 'jabber)))
    (candidates . (lambda () (mapcar 'car (anything-c-jabber-online-contacts))))
    (action . (lambda (x)
                (jabber-chat-with
                 (jabber-read-account)
                 (symbol-name
                  (cdr (assoc x (anything-c-jabber-online-contacts)))))))))


 
<span class="linecomment">;;; Call source.</span>
(defvar anything-source-select-buffer "<span class="quote">*anything source select*</span>")
(defvar anything-c-source-call-source
  `((name . "<span class="quote">Call anything source</span>")
    (candidate-number-limit)
    (candidates
     . (lambda ()
         (loop for vname in (all-completions "<span class="quote">anything-c-source-</span>" obarray)
               for var = (intern vname)
               for name = (ignore-errors (assoc-default 'name (symbol-value var)))
               if name collect
               (cons (format "<span class="quote">%s `%s'</span>"
                             name (propertize vname 'face 'font-lock-variable-name-face))
                     var))))
    (action
     . (("<span class="quote">Invoke anything with selected source</span>"
         .
         (lambda (candidate)
           (setq anything-candidate-number-limit 9999)
           (anything candidate nil nil nil nil
                     anything-source-select-buffer)))
        ("<span class="quote">Describe variable</span>" . describe-variable)
        ("<span class="quote">Find variable</span>" . find-variable)))
    (persistent-action . describe-variable)
    (persistent-help . "<span class="quote">Show description of this source</span>")))

(defun anything-call-source-from-anything ()
  "<span class="quote">Call anything source within `anything' session.</span>"
  (interactive)
  (setq anything-input-idle-delay 0)
  (anything-set-sources '(anything-c-source-call-source)))

<span class="linecomment">;;; Execute Preconfigured anything.</span>
(defvar anything-c-source-anything-commands
  '((name . "<span class="quote">Preconfigured Anything</span>")
    (candidates . anything-c-anything-commands-candidates)
    (type . command)
    (candidate-number-limit)))

(defun anything-c-anything-commands-candidates ()
  (loop for (cmd . desc) in (anything-c-list-preconfigured-anything)
        collect (cons (if (where-is-internal cmd nil t)
                          (substitute-command-keys (format "<span class="quote">M-x %s (\\[%s]) : %s</span>" cmd cmd desc))
                          (substitute-command-keys (format "<span class="quote">\\[%s] : %s</span>" cmd desc)))
                      cmd)))

 
<span class="linecomment">;;; Occur</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-occur-init ()
  "<span class="quote">Create the initial anything occur buffer.
If region is active use region as buffer contents
instead of whole buffer.</span>"
  (with-current-buffer (anything-candidate-buffer 'global)
    (erase-buffer)
    (let ((buf-contents
           (with-anything-current-buffer
             (if (anything-region-active-p)
                 (buffer-substring (region-beginning) (region-end))
                 (buffer-substring (point-min) (point-max))))))
      (insert buf-contents))))

(defun anything-c-occur-get-line (s e)
  (format "<span class="quote">%7d:%s</span>" (line-number-at-pos (1- s)) (buffer-substring s e)))

(defun anything-c-occur-query-replace-regexp (candidate)
  "<span class="quote">Query replace regexp starting from CANDIDATE.
If region is active ignore CANDIDATE and replace only in region.
With a prefix arg replace only matches surrounded by word boundaries,
i.e Don't replace inside a word, regexp is surrounded with \\bregexp\\b.</span>"
  (let ((regexp anything-input))
    (unless (anything-region-active-p)
      (anything-c-action-line-goto candidate))
    (apply 'query-replace-regexp
           (anything-c-query-replace-args regexp))))

(defun anything-occur-run-query-replace-regexp ()
  "<span class="quote">Run `query-replace-regexp' in anything occur from keymap.</span>"
  (interactive)
  (anything-c-quit-and-execute-action
   'anything-c-occur-query-replace-regexp))

(defvar anything-c-source-occur
  `((name . "<span class="quote">Occur</span>")
    (init . anything-c-occur-init)
    (candidates-in-buffer)
    (migemo)
    (get-line . anything-c-occur-get-line)
    (display-to-real . anything-c-display-to-real-line)
    (action . (("<span class="quote">Go to Line</span>" . anything-c-action-line-goto)
               ("<span class="quote">Query replace regexp (C-u Not inside word.)</span>"
                . anything-c-occur-query-replace-regexp)))
    (recenter)
    (mode-line . anything-occur-mode-line)
    (keymap . ,anything-occur-map)
    (requires-pattern . 1)
    (delayed)))

 
<span class="linecomment">;;; Anything browse code.</span>
(defun anything-c-browse-code-get-line (beg end)
  "<span class="quote">Select line if it match the regexp corresponding to current `major-mode'.
Line is parsed for BEG position to END position.</span>"
  (let ((str-line (buffer-substring beg end))
        (regexp   (assoc-default major-mode
                                 anything-c-browse-code-regexp-alist))
        (num-line (if (string= anything-pattern "<span class="quote"></span>") beg (1- beg))))
    (when (and regexp (string-match regexp str-line))
      (format "<span class="quote">%4d:%s</span>" (line-number-at-pos num-line) str-line))))


(defvar anything-c-source-browse-code
  '((name . "<span class="quote">Browse code</span>")
    (init . (lambda ()
              (anything-candidate-buffer anything-current-buffer)
              (with-anything-current-buffer
                (jit-lock-fontify-now))))
    (candidate-number-limit . 9999)
    (candidates-in-buffer)
    (get-line . anything-c-browse-code-get-line)
    (type . line)
    (recenter)))

 
<span class="linecomment">;; Do many actions for input</span>
(defvar anything-c-source-create
  '((name . "<span class="quote">Create</span>")
    (dummy)
    (action)
    (action-transformer . anything-create--actions))
  "<span class="quote">Do many create actions from `anything-pattern'.
See also `anything-create--actions'.</span>")

(defun anything-create-from-anything ()
  "<span class="quote">Run `anything-create' from `anything' as a fallback.</span>"
  (interactive)
  (anything-run-after-quit 'anything-create nil anything-pattern))

(defun anything-create--actions (&rest ignored)
  "<span class="quote">Default actions for `anything-create' / `anything-c-source-create'.</span>"
  (remove-if-not
   (lambda (pair) (and (consp pair) (functionp (cdr pair))))
   (append anything-create--actions-private
           '(("<span class="quote">find-file</span>" . find-file)
             ("<span class="quote">find-file other window</span>" . find-file-other-window)
             ("<span class="quote">New buffer</span>" . anything-c-switch-to-buffer)
             ("<span class="quote">New buffer other window</span>" . switch-to-buffer-other-window)
             ("<span class="quote">Bookmark Set</span>" . bookmark-set)
             ("<span class="quote">Set Register</span>" .
              (lambda (x) (set-register (read-char "<span class="quote">Register: </span>") x)))
             ("<span class="quote">Insert Linkd star</span>" . linkd-insert-star)
             ("<span class="quote">Insert Linkd Tag</span>" . linkd-insert-tag)
             ("<span class="quote">Insert Linkd Link</span>" . linkd-insert-link)
             ("<span class="quote">Insert Linkd Lisp</span>" . linkd-insert-lisp)
             ("<span class="quote">Insert Linkd Wiki</span>" . linkd-insert-wiki)
             ("<span class="quote">Google Search</span>" . google)))))

 
<span class="linecomment">;; Minibuffer History</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-minibuffer-history
  '((name . "<span class="quote">Minibuffer History</span>")
    (header-name . (lambda (name)
                     (format "<span class="quote">%s (%s)</span>" name minibuffer-history-variable)))
    (candidates
     . (lambda ()
         (let ((history (loop for i in
                              (symbol-value minibuffer-history-variable)
                              unless (string= "<span class="quote"></span>" i) collect i)))
           (if (consp (car history))
               (mapcar 'prin1-to-string history)
               history))))
    (migemo)
    (action . (lambda (candidate)
                (delete-minibuffer-contents)
                (insert candidate)))))

 
<span class="linecomment">;;; Elscreen</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-elscreen
  '((name . "<span class="quote">Elscreen</span>")
    (candidates
     . (lambda ()
         (if (cdr (elscreen-get-screen-to-name-alist))
             (sort
              (loop for sname in (elscreen-get-screen-to-name-alist)
                    append (list (format "<span class="quote">[%d] %s</span>" (car sname) (cdr sname))))
              #'(lambda (a b) (compare-strings a nil nil b nil nil))))))
    (action
     . (("<span class="quote">Change Screen</span>" .
                         (lambda (candidate)
                           (elscreen-goto (- (aref candidate 1) (aref "<span class="quote">0</span>" 0)))))
        ("<span class="quote">Kill Screen(s)</span>" .
                          (lambda (candidate)
                            (dolist (i (anything-marked-candidates))
                              (elscreen-goto (- (aref i 1) (aref "<span class="quote">0</span>" 0)))
                              (elscreen-kill))))
        ("<span class="quote">Only Screen</span>" .
                       (lambda (candidate)
                         (elscreen-goto (- (aref candidate 1) (aref "<span class="quote">0</span>" 0)))
                         (elscreen-kill-others)))))))

 
<span class="linecomment">;;;; &lt;System&gt;</span>

<span class="linecomment">;;; Top (process)</span>
(defvar anything-c-top-command "<span class="quote">COLUMNS=%s top -b -n 1</span>"
  "<span class="quote">Top command (batch mode). %s is replaced with `frame-width'.</span>")
(defvar anything-c-source-top
  '((name . "<span class="quote">Top (Press C-c C-u to refresh)</span>")
    (init . anything-c-top-init)
    (candidates-in-buffer)
    (display-to-real . anything-c-top-display-to-real)
    (persistent-action . anything-c-top-sh-persistent-action)
    (persistent-help . "<span class="quote">SIGTERM</span>")
    (action
     ("<span class="quote">kill (TERM)</span>" . (lambda (pid)
                        (anything-c-top-sh (format "<span class="quote">kill -TERM %s</span>" pid))))
     ("<span class="quote">kill (KILL)</span>" . (lambda (pid)
                        (anything-c-top-sh (format "<span class="quote">kill -KILL %s</span>" pid))))
     ("<span class="quote">Copy PID</span>" . (lambda (pid) (kill-new pid))))))

(defun anything-c-top-sh (cmd)
  (message "<span class="quote">Executed %s\n%s</span>" cmd (shell-command-to-string cmd)))

(defun anything-c-top-sh-persistent-action (pid)
  (delete-other-windows)
  (anything-c-top-sh (format "<span class="quote">kill -TERM %s</span>" pid))
  (anything-force-update))

(defun anything-c-top-init ()
  (with-current-buffer (anything-candidate-buffer 'global)
    (call-process-shell-command
     (format anything-c-top-command
             (- (frame-width) (if anything-enable-digit-shortcuts 4 0)))
     nil (current-buffer))))

(defun anything-c-top-display-to-real (line)
  (car (split-string line)))

<span class="linecomment">;;; Timers</span>
(defvar anything-c-source-absolute-time-timers
  '((name . "<span class="quote">Absolute Time Timers</span>")
    (candidates . timer-list)
    (type . timer)))

(defvar anything-c-source-idle-time-timers
  '((name . "<span class="quote">Idle Time Timers</span>")
    (candidates . timer-idle-list)
    (type . timer)))

(defun anything-c-timer-real-to-display (timer)
  (destructuring-bind (triggered t1 t2 t3 repeat-delay func args idle-delay)
      (append timer nil)                <span class="linecomment">;use `append' to convert vector-&gt;list</span>
    (format "<span class="quote">%s repeat=%5S %s(%s)</span>"
            (let ((time (list t1 t2 t3)))
              (if idle-delay
                  (format-time-string "<span class="quote">idle-for=%5s</span>" time)
                  (format-time-string "<span class="quote">%m/%d %T</span>" time)))
            repeat-delay
            func
            (mapconcat 'prin1-to-string args "<span class="quote"> </span>"))))

<span class="linecomment">;;; X RandR resolution change</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; FIXME I do not care multi-display.</span>

(defun anything-c-xrandr-info ()
  "<span class="quote">Return a pair with current X screen number and current X display name.</span>"
  (with-temp-buffer
    (call-process "<span class="quote">xrandr</span>" nil (current-buffer) nil
                  "<span class="quote">--current</span>")
    (let (screen output)
      (goto-char (point-min))
      (save-excursion
        (when (re-search-forward "<span class="quote">\\(^Screen \\)\\([0-9]\\):</span>" nil t)
          (setq screen (match-string 2))))
      (when (re-search-forward "<span class="quote">^\\(.*\\) connected</span>" nil t)
        (setq output (match-string 1)))
      (list screen output))))

(defun anything-c-xrandr-screen ()
  "<span class="quote">Return current X screen number.</span>"
  (car (anything-c-xrandr-info)))

(defun anything-c-xrandr-output ()
  "<span class="quote">Return current X display name.</span>"
  (cadr (anything-c-xrandr-info)))

(defvar anything-c-source-xrandr-change-resolution
  '((name . "<span class="quote">Change Resolution</span>")
    (candidates
     . (lambda ()
         (with-temp-buffer
           (call-process "<span class="quote">xrandr</span>" nil (current-buffer) nil
                         "<span class="quote">--screen</span>" (anything-c-xrandr-screen) "<span class="quote">-q</span>")
           (goto-char 1)
           (loop with modes = nil
                 while (re-search-forward "<span class="quote">   \\([0-9]+x[0-9]+\\)</span>" nil t)
                 for mode = (match-string 1)
                 unless (member mode modes)
                 collect mode into modes
                 finally return modes))))
    (action
     ("<span class="quote">Change Resolution</span>"
      . (lambda (mode)
          (call-process "<span class="quote">xrandr</span>" nil nil nil
                        "<span class="quote">--screen</span>" (anything-c-xrandr-screen)
                        "<span class="quote">--output</span>" (anything-c-xrandr-output)
                        "<span class="quote">--mode</span>" mode))))))

<span class="linecomment">;;; Xfont selection</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-persistent-xfont-action (elm)
  "<span class="quote">Show current font temporarily</span>"
  (let ((current-font (cdr (assoc 'font (frame-parameters))))
        (default-font elm))
    (unwind-protect
         (progn (set-frame-font default-font 'keep-size) (sit-for 2))
      (set-frame-font current-font))))

(defvar anything-c-xfonts-cache nil)
(defvar anything-c-source-xfonts
  '((name . "<span class="quote">X Fonts</span>")
    (init . (lambda ()
              (unless anything-c-xfonts-cache
                (setq anything-c-xfonts-cache
                      (x-list-fonts "<span class="quote">*</span>")))))
    (candidates . anything-c-xfonts-cache)
    (action . (("<span class="quote">Copy to kill ring</span>" . (lambda (elm)
                                        (kill-new elm)))
               ("<span class="quote">Set Font</span>" . (lambda (elm)
                               (kill-new elm)
                               (set-frame-font elm 'keep-size)
                               (message "<span class="quote">New font have been copied to kill ring</span>")))))
    (persistent-action . anything-c-persistent-xfont-action)
    (persistent-help . "<span class="quote">Switch to this font temporarily</span>")))

<span class="linecomment">;;; 𝕌𝕔𝕤 𝕊𝕪𝕞𝕓𝕠𝕝 𝕔𝕠𝕞𝕡𝕝𝕖𝕥𝕚𝕠𝕟</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-ucs-max-len 0)
(defun anything-c-calculate-ucs-max-len ()
  "<span class="quote">Calculate the length of longest `ucs-names' candidate.</span>"
  (loop with count = 0
        for (n . v) in (ucs-names)
        for len = (length n)
        if (&gt; len count)
        do (setq count len)
        finally return count))

(defun anything-c-ucs-init ()
  "<span class="quote">Initialize an anything buffer with ucs symbols.
Only math* symbols are collected.</span>"
  (unless (&gt; anything-c-ucs-max-len 0)
    (setq anything-c-ucs-max-len
          (anything-c-calculate-ucs-max-len)))
  (with-current-buffer (anything-candidate-buffer
                        (get-buffer-create "<span class="quote">*anything ucs*</span>"))
    <span class="linecomment">;; `ucs-names' fn will not run again, data is cached in</span>
    <span class="linecomment">;; var `ucs-names'.</span>
    (loop for (n . v) in (ucs-names)
          for len = (length n)
          for diff = (+ (- anything-c-ucs-max-len len) 2)
          unless (string= "<span class="quote"></span>" n)
          do (progn (insert (concat
                             n "<span class="quote">:</span>"
                             (make-string
                              diff ? )))
                    (ucs-insert v)
                    (insert "<span class="quote">\n</span>")))))

(defun anything-c-ucs-forward-char (candidate)
  (with-anything-current-buffer
    (forward-char 1)))

(defun anything-c-ucs-backward-char (candidate)
  (with-anything-current-buffer
    (forward-char -1)))

(defun anything-c-ucs-delete-backward (candidate)
  (with-anything-current-buffer
    (delete-char -1)))

(defun anything-c-ucs-insert-char (candidate)
  (with-anything-current-buffer
    (insert
     (replace-regexp-in-string
      "<span class="quote"> </span>" "<span class="quote"></span>"
      (cadr (split-string candidate "<span class="quote">:</span>"))))))

(defun anything-c-ucs-persistent-insert ()
  (interactive)
  (anything-attrset 'action-insert 'anything-c-ucs-insert-char)
  (anything-execute-persistent-action 'action-insert))

(defun anything-c-ucs-persistent-forward ()
  (interactive)
  (anything-attrset 'action-forward 'anything-c-ucs-forward-char)
  (anything-execute-persistent-action 'action-forward))

(defun anything-c-ucs-persistent-backward ()
  (interactive)
  (anything-attrset 'action-back 'anything-c-ucs-backward-char)
  (anything-execute-persistent-action 'action-back))

(defun anything-c-ucs-persistent-delete ()
  (interactive)
  (anything-attrset 'action-delete 'anything-c-ucs-delete-backward)
  (anything-execute-persistent-action 'action-delete))

(defvar anything-c-source-ucs
  '((name . "<span class="quote">Ucs names</span>")
    (init . anything-c-ucs-init)
    (candidate-number-limit . 9999)
    (candidates-in-buffer)
    (mode-line . anything-c-ucs-mode-line-string)
    (action . (("<span class="quote">Insert</span>" . anything-c-ucs-insert-char)
               ("<span class="quote">Forward char</span>" . anything-c-ucs-forward-char)
               ("<span class="quote">Backward char</span>" . anything-c-ucs-backward-char)
               ("<span class="quote">Delete char backward</span>" . anything-c-ucs-delete-backward))))
  "<span class="quote">Source for collecting `ucs-names' math symbols.</span>")


<span class="linecomment">;;; Emacs process</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-emacs-process
  '((name . "<span class="quote">Emacs Process</span>")
    (candidates . (lambda () (mapcar #'process-name (process-list))))
    (persistent-action . (lambda (elm)
                           (delete-process (get-process elm))
                           (anything-delete-current-selection)))
    (persistent-help . "<span class="quote">Kill Process</span>")
    (action ("<span class="quote">Kill Process</span>" . (lambda (elm)
                                (delete-process (get-process elm)))))))

<span class="linecomment">;;; World time</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-time-world
  '((name . "<span class="quote">Time World List</span>")
    (init . (lambda ()
              (let ((anything-buffer (anything-candidate-buffer 'global)))
                (with-current-buffer anything-buffer
                  (display-time-world-display display-time-world-list)))))
    (candidates-in-buffer)))


 
<span class="linecomment">;;; Anything interface for Debian/Ubuntu packages (apt-*)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-apt
  '((name . "<span class="quote">APT</span>")
    (init . anything-c-apt-init)
    (candidates-in-buffer)
    (candidate-transformer anything-c-apt-candidate-transformer)
    (display-to-real . anything-c-apt-display-to-real)
    (requires-pattern . 2)
    (update . anything-c-apt-refresh)
    (action
     ("<span class="quote">Show package description</span>" . anything-c-apt-cache-show)
     ("<span class="quote">Install package</span>" . anything-c-apt-install)
     ("<span class="quote">Reinstall package</span>" . anything-c-apt-reinstall)
     ("<span class="quote">Remove package</span>" . anything-c-apt-uninstall)
     ("<span class="quote">Purge package</span>" . anything-c-apt-purge))
    (persistent-action . anything-c-apt-persistent-action)
    (persistent-help . "<span class="quote">Show package description</span>")))

(defvar anything-c-apt-query "<span class="quote">emacs</span>")
(defvar anything-c-apt-search-command "<span class="quote">apt-cache search '%s'</span>")
(defvar anything-c-apt-show-command "<span class="quote">apt-cache show '%s'</span>")
(defvar anything-c-apt-installed-packages nil)
(defvar anything-c-apt-all-packages nil)
(defvar anything-c-apt-input-history nil)

(defun anything-c-apt-refresh ()
  "<span class="quote">Refresh installed candidates list.</span>"
  (setq anything-c-apt-installed-packages nil)
  (setq anything-c-apt-all-packages nil))

(defun anything-c-apt-persistent-action (candidate)
  "<span class="quote">Persistent action for APT source.</span>"
  (anything-c-apt-cache-show candidate))

(defun anything-c-apt-candidate-transformer (candidates)
  "<span class="quote">Show installed CANDIDATES and the ones to deinstall in a different color.</span>"
  (loop for cand in candidates
        for name = (anything-c-apt-display-to-real cand)
        collect (cond ((string= (assoc-default
                                 name anything-c-apt-installed-packages)
                                "<span class="quote">deinstall</span>")
                       (propertize cand 'face 'anything-apt-deinstalled))
                      ((string= (assoc-default
                                 name anything-c-apt-installed-packages)
                                "<span class="quote">install</span>")
                       (propertize cand 'face 'anything-apt-installed))
                      (t cand))))

(defun anything-c-apt-init ()
  "<span class="quote">Initialize list of debian packages.</span>"
  (let ((query "<span class="quote"></span>"))
    (unless (and anything-c-apt-installed-packages
                 anything-c-apt-all-packages)
      (message "<span class="quote">Loading package list...</span>")
      (setq anything-c-apt-installed-packages
            (with-temp-buffer
              (call-process-shell-command "<span class="quote">dpkg --get-selections</span>"
                                          nil (current-buffer))
              (loop for i in (split-string (buffer-string) "<span class="quote">\n</span>" t)
                    for p = (split-string i)
                    collect (cons (car p) (cadr p)))))
      (setq anything-c-apt-all-packages
            (with-current-buffer
                (anything-candidate-buffer
                 (get-buffer-create (format "<span class="quote">*anything-apt*</span>")))
              (erase-buffer)
              (call-process-shell-command
               (format anything-c-apt-search-command query)
               nil (current-buffer))))
      (message "<span class="quote">Loading package list done</span>")
      (sit-for 0.5))))

(defun anything-c-apt-display-to-real (line)
  "<span class="quote">Return only name of a debian package.
LINE is displayed like:
package name - description.</span>"
  (car (split-string line "<span class="quote"> - </span>")))

(defun anything-c-shell-command-if-needed (command)
  "<span class="quote">Run shell command COMMAND to describe package.
If a buffer named COMMAND already exists, just switch to it.</span>"
  (let ((buf (get-buffer command)))
    (anything-c-switch-to-buffer (get-buffer-create command))
    (unless buf (insert (shell-command-to-string command)))))

(defun anything-c-apt-cache-show (package)
  "<span class="quote">Show information on apt package PACKAGE.</span>"
  (anything-c-shell-command-if-needed
   (format anything-c-apt-show-command package)))

(defun anything-c-apt-install (package)
  "<span class="quote">Run 'apt-get install' shell command on PACKAGE.</span>"
  (anything-c-apt-generic-action :action 'install))

(defun anything-c-apt-reinstall (package)
  "<span class="quote">Run 'apt-get install --reinstall' shell command on PACKAGE.</span>"
  (anything-c-apt-generic-action :action 'reinstall))

(defun anything-c-apt-uninstall (package)
  "<span class="quote">Run 'apt-get remove' shell command on PACKAGE.</span>"
  (anything-c-apt-generic-action :action 'uninstall))

(defun anything-c-apt-purge (package)
  "<span class="quote">Run 'apt-get purge' shell command on PACKAGE.</span>"
  (anything-c-apt-generic-action :action 'purge))

(defun* anything-c-apt-generic-action (&key action)
  "<span class="quote">Run 'apt-get ACTION'.
Support install, remove and purge actions.</span>"
  (ansi-term (getenv "<span class="quote">SHELL</span>") "<span class="quote">anything apt</span>")
  (term-line-mode)
  (let ((command   (case action
                     ('install   "<span class="quote">sudo apt-get install </span>")
                     ('reinstall "<span class="quote">sudo apt-get install --reinstall </span>")
                     ('uninstall "<span class="quote">sudo apt-get remove </span>")
                     ('purge     "<span class="quote">sudo apt-get purge </span>")
                     (t          (error "<span class="quote">Unknow action</span>"))))
        (beg       (point))
        end
        (cand-list (mapconcat #'(lambda (x) (format "<span class="quote">'%s'</span>" x))
                              (anything-marked-candidates) "<span class="quote"> </span>")))
    (goto-char (point-max))
    (insert (concat command cand-list))
    (setq end (point))
    (if (y-or-n-p (format "<span class="quote">%s package</span>" (symbol-name action)))
        (progn
          (setq anything-c-external-commands-list nil)
          (setq anything-c-apt-installed-packages nil)
          (term-char-mode) (term-send-input))
        (delete-region beg end) (term-send-eof) (kill-buffer))))

<span class="linecomment">;; (anything-c-apt-install "jed")</span>

 
<span class="linecomment">;;; Anything UI for gentoo portage.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-gentoo-use-flags nil)
(defvar anything-c-gentoo-buffer "<span class="quote">*anything-gentoo-output*</span>")
(defvar anything-c-cache-gentoo nil)
(defvar anything-c-cache-world nil)
(defvar anything-c-source-gentoo
  '((name . "<span class="quote">Portage sources</span>")
    (init . (lambda ()
              (get-buffer-create anything-c-gentoo-buffer)
              (unless anything-c-cache-gentoo
                (anything-c-gentoo-setup-cache))
              (unless anything-c-cache-world
                (setq anything-c-cache-world (anything-c-gentoo-get-world)))
              (anything-c-gentoo-init-list)))
    (candidates-in-buffer)
    (match . identity)
    (candidate-transformer anything-c-highlight-world)
    (action . (("<span class="quote">Show package</span>" . (lambda (elm)
                                   (anything-c-gentoo-eshell-action elm "<span class="quote">eix</span>")))
               ("<span class="quote">Show history</span>" . (lambda (elm)
                                   (if (member elm anything-c-cache-world)
                                       (anything-c-gentoo-eshell-action elm "<span class="quote">genlop -qe</span>")
                                       (message "<span class="quote">No infos on packages not yet installed</span>"))))
               ("<span class="quote">Copy in kill-ring</span>" . kill-new)
               ("<span class="quote">insert at point</span>" . insert)
               ("<span class="quote">Browse HomePage</span>" . (lambda (elm)
                                      (let ((urls (anything-c-gentoo-get-url elm)))
                                        (browse-url (anything-comp-read "<span class="quote">Url: </span>" urls :must-match t)))))
               ("<span class="quote">Show extra infos</span>" . (lambda (elm)
                                       (if (member elm anything-c-cache-world)
                                           (anything-c-gentoo-eshell-action elm "<span class="quote">genlop -qi</span>")
                                           (message "<span class="quote">No infos on packages not yet installed</span>"))))
               ("<span class="quote">Show use flags</span>" . (lambda (elm)
                                     (anything-c-gentoo-default-action elm "<span class="quote">equery</span>" "<span class="quote">-C</span>" "<span class="quote">u</span>")
                                     (font-lock-add-keywords nil '(("<span class="quote">^\+.*</span>" . font-lock-variable-name-face)))
                                     (font-lock-mode 1)))
               ("<span class="quote">Run emerge pretend</span>" . (lambda (elm)
                                         (anything-c-gentoo-eshell-action elm "<span class="quote">emerge -p</span>")))
               ("<span class="quote">Emerge</span>" . (lambda (elm)
                             (anything-gentoo-install elm :action 'install)))
               ("<span class="quote">Unmerge</span>" . (lambda (elm)
                              (anything-gentoo-install elm :action 'uninstall)))
               ("<span class="quote">Show dependencies</span>" . (lambda (elm)
                                        (anything-c-gentoo-default-action elm "<span class="quote">equery</span>" "<span class="quote">-C</span>" "<span class="quote">d</span>")))
               ("<span class="quote">Show related files</span>" . (lambda (elm)
                                         (anything-c-gentoo-default-action elm "<span class="quote">equery</span>" "<span class="quote">files</span>")))
               ("<span class="quote">Refresh</span>" . (lambda (elm)
                              (anything-c-gentoo-setup-cache)
                              (setq anything-c-cache-world (anything-c-gentoo-get-world))))))))


(defun* anything-gentoo-install (candidate &key action)
  (setq anything-c-external-commands-list nil)
  (ansi-term (getenv "<span class="quote">SHELL</span>") "<span class="quote">Gentoo emerge</span>")
  (term-line-mode)
  (let ((command (case action
                   ('install "<span class="quote">sudo emerge -av </span>")
                   ('uninstall "<span class="quote">sudo emerge -avC </span>")
                   (t (error "<span class="quote">Unknow action</span>"))))
        (elms (mapconcat 'identity (anything-marked-candidates) "<span class="quote"> </span>"))
        (beg (point)) end)
    (goto-char (point-max))
    (insert (concat command elms))
    (setq end (point))
    (term-char-mode) (term-send-input)))

(defun anything-c-gentoo-default-action (elm command &rest args)
  "<span class="quote">Gentoo default action that use `anything-c-gentoo-buffer'.</span>"
  (if (member elm anything-c-cache-world)
      (progn
        (anything-c-switch-to-buffer anything-c-gentoo-buffer)
        (erase-buffer)
        (let ((com-list (append args (list elm))))
          (apply #'call-process command nil t nil
                 com-list)))
      (message "<span class="quote">No infos on packages not yet installed</span>")))

(defvar anything-c-source-use-flags
  '((name . "<span class="quote">Use Flags</span>")
    (init . (lambda ()
              (unless anything-c-gentoo-use-flags
                (anything-c-gentoo-setup-use-flags-cache))
              (anything-c-gentoo-get-use)))
    (candidates-in-buffer)
    (match . identity)
    (candidate-transformer anything-c-highlight-local-use)
    (action . (("<span class="quote">Description</span>"
                . (lambda (elm)
                    (anything-c-switch-to-buffer anything-c-gentoo-buffer)
                    (erase-buffer)
                    (apply #'call-process "<span class="quote">euse</span>" nil t nil
                           `("<span class="quote">-i</span>"
                             ,elm))
                    (font-lock-add-keywords nil `((,elm . font-lock-variable-name-face)))
                    (font-lock-mode 1)))
               ("<span class="quote">Enable</span>"
                . (lambda (elm)
                    (anything-c-gentoo-eshell-action elm "<span class="quote">*sudo -p Password: euse -E</span>")))
               ("<span class="quote">Disable</span>"
                . (lambda (elm)
                    (anything-c-gentoo-eshell-action elm "<span class="quote">*sudo -p Password: euse -D</span>")))
               ("<span class="quote">Remove</span>"
                . (lambda (elm)
                    (anything-c-gentoo-eshell-action elm "<span class="quote">*sudo -p Password: euse -P</span>")))
               ("<span class="quote">Show which dep use this flag</span>"
                . (lambda (elm)
                    (anything-c-switch-to-buffer anything-c-gentoo-buffer)
                    (erase-buffer)
                    (apply #'call-process "<span class="quote">equery</span>" nil t nil
                           `("<span class="quote">-C</span>"
                             "<span class="quote">h</span>"
                             ,elm))))))))



(defun anything-c-gentoo-init-list ()
  "<span class="quote">Initialize buffer with all packages in Portage.</span>"
  (let* ((portage-buf (get-buffer-create "<span class="quote">*anything-gentoo*</span>"))
         (buf (anything-candidate-buffer 'portage-buf)))
    (with-current-buffer buf
      (dolist (i anything-c-cache-gentoo)
        (insert (concat i "<span class="quote">\n</span>"))))))

(defun anything-c-gentoo-setup-cache ()
  "<span class="quote">Set up `anything-c-cache-gentoo'</span>"
  (setq anything-c-cache-gentoo
        (split-string (with-temp-buffer
                        (call-process "<span class="quote">eix</span>" nil t nil
                                      "<span class="quote">--only-names</span>")
                        (buffer-string)))))

(defun anything-c-gentoo-eshell-action (elm command)
  (when (get-buffer "<span class="quote">*EShell Command Output*</span>")
    (kill-buffer "<span class="quote">*EShell Command Output*</span>"))
  (message "<span class="quote">Wait searching...</span>")
  (let ((buf-fname (buffer-file-name anything-current-buffer)))
    (if (and buf-fname (string-match tramp-file-name-regexp buf-fname))
        (progn
          (save-window-excursion
            (pop-to-buffer "<span class="quote">*scratch*</span>")
            (eshell-command (format "<span class="quote">%s %s</span>" command elm)))
          (pop-to-buffer "<span class="quote">*EShell Command Output*</span>"))
        (eshell-command (format "<span class="quote">%s %s</span>" command elm)))))

(defun anything-c-gentoo-get-use ()
  "<span class="quote">Initialize buffer with all use flags.</span>"
  (let* ((use-buf (get-buffer-create "<span class="quote">*anything-gentoo-use*</span>"))
         (buf (anything-candidate-buffer 'use-buf)))
    (with-current-buffer buf
      (dolist (i anything-c-gentoo-use-flags)
        (insert (concat i "<span class="quote">\n</span>"))))))


(defun anything-c-gentoo-setup-use-flags-cache ()
  "<span class="quote">Setup `anything-c-gentoo-use-flags'</span>"
  (setq anything-c-gentoo-use-flags
        (split-string (with-temp-buffer
                        (call-process "<span class="quote">eix</span>" nil t nil
                                      "<span class="quote">--print-all-useflags</span>")
                        (buffer-string)))))

(defun anything-c-gentoo-get-url (elm)
  "<span class="quote">Return a list of urls from eix output.</span>"
  (loop
        with url-list = (split-string
                         (with-temp-buffer
                           (call-process "<span class="quote">eix</span>" nil t nil
                                         elm "<span class="quote">--format</span>" "<span class="quote">&lt;homepage&gt;\n</span>")
                           (buffer-string)))
        with all
        for i in url-list
        when (and (string-match "<span class="quote">^http://.*</span>" i)
                  (not (member i all)))
        collect i into all
        finally return all))

(defun anything-c-gentoo-get-world ()
  "<span class="quote">Return list of all installed package on your system.</span>"
  (split-string (with-temp-buffer
                  (call-process "<span class="quote">qlist</span>" nil t nil
                                "<span class="quote">-I</span>")
                  (buffer-string))))

(defun anything-c-gentoo-get-local-use ()
  (split-string (with-temp-buffer
                  (call-process "<span class="quote">portageq</span>" nil t nil
                                "<span class="quote">envvar</span>"
                                "<span class="quote">USE</span>")
                  (buffer-string))))


(defun anything-c-highlight-world (eix)
  "<span class="quote">Highlight all installed package.</span>"
  (loop for i in eix
        if (member i anything-c-cache-world)
        collect (propertize i 'face 'anything-gentoo-match-face)
        else
        collect i))

(defun anything-c-highlight-local-use (use-flags)
  (let ((local-uses (anything-c-gentoo-get-local-use)))
    (loop for i in use-flags
          if (member i local-uses)
          collect (propertize i 'face 'anything-gentoo-match-face)
          else
          collect i)))


 
<span class="linecomment">;;; Anything ratpoison UI</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-ratpoison-commands
  '((name . "<span class="quote">Ratpoison Commands</span>")
    (init . anything-c-ratpoison-commands-init)
    (candidates-in-buffer)
    (action ("<span class="quote">Execute the command</span>" . anything-c-ratpoison-commands-execute))
    (display-to-real . anything-c-ratpoison-commands-display-to-real)
    (candidate-number-limit)))

(defun anything-c-ratpoison-commands-init ()
  (unless (anything-candidate-buffer)
    (with-current-buffer (anything-candidate-buffer 'global)
      <span class="linecomment">;; with ratpoison prefix key</span>
      (save-excursion
        (call-process "<span class="quote">ratpoison</span>" nil (current-buffer) nil "<span class="quote">-c</span>" "<span class="quote">help</span>"))
      (while (re-search-forward "<span class="quote">^\\([^ ]+\\) \\(.+\\)$</span>" nil t)
        (replace-match "<span class="quote">&lt;ratpoison&gt; \\1: \\2</span>"))
      (goto-char (point-max))
      <span class="linecomment">;; direct binding</span>
      (save-excursion
        (call-process "<span class="quote">ratpoison</span>" nil (current-buffer) nil "<span class="quote">-c</span>" "<span class="quote">help top</span>"))
      (while (re-search-forward "<span class="quote">^\\([^ ]+\\) \\(.+\\)$</span>" nil t)
        (replace-match "<span class="quote">\\1: \\2</span>")))))

(defun anything-c-ratpoison-commands-display-to-real (display)
  (and (string-match "<span class="quote">: </span>" display)
       (substring display (match-end 0))))

(defun anything-c-ratpoison-commands-execute (candidate)
  (call-process "<span class="quote">ratpoison</span>" nil nil nil "<span class="quote">-ic</span>" candidate))


 
<span class="linecomment">;;; Anything `completing-read' replacement</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-comp-read-get-candidates (collection &optional test sort-fn alistp)
  "<span class="quote">Convert COLLECTION to list removing elements that don't match TEST.
See `anything-comp-read' about supported COLLECTION arguments.

SORT-FN is a predicate to sort COLLECTION.

ALISTP when non--nil will not use `all-completions' to collect
candidates because it doesn't handle alists correctly for anything.
i.e In `all-completions' the keys \(cars of elements\)
are the possible completions. In anything we want to use the cdr instead
like \(display . real\).

e.g

\(setq A '((a . 1) (b . 2) (c . 3)))
==&gt;((a . 1) (b . 2) (c . 3))
\(anything-comp-read \"test: \" A :alistp nil
                                  :exec-when-only-one t
                                  :initial-input \"a\")
==&gt;\"a\"
\(anything-comp-read \"test: \" A :alistp t
                                  :exec-when-only-one t
                                  :initial-input \"1\")
==&gt;\"1\"

See docstring of `all-completions' for more info.

If COLLECTION is an `obarray', a TEST should be needed. See `obarray'.</span>"
  (let ((cands
         (cond ((and (eq collection obarray) test)
                (all-completions "<span class="quote"></span>" collection test))
               ((and (vectorp collection) test)
                (loop for i across collection when (funcall test i) collect i))
               ((vectorp collection)
                (loop for i across collection collect i))
               ((and alistp test)
                (loop for i in collection when (funcall test i) collect i))
               ((and (symbolp collection) (boundp collection))
                (symbol-value collection))
               (alistp collection)
               ((and collection test)
                (all-completions "<span class="quote"></span>" collection test))
               (t (all-completions "<span class="quote"></span>" collection)))))
    (if sort-fn (sort cands sort-fn) cands)))

(defun anything-cr-default-transformer (candidates source)
  "<span class="quote">Default filter candidate function for `anything-comp-read'.
Do nothing, just return candidate list unmodified.</span>"
  candidates)

(defun* anything-comp-read (prompt collection
                                   &key
                                   test
                                   initial-input
                                   default
                                   preselect
                                   (buffer "<span class="quote">*Anything Completions*</span>")
                                   must-match
                                   (requires-pattern 0)
                                   (history nil)
                                   input-history
                                   (persistent-action nil)
                                   (persistent-help "<span class="quote">DoNothing</span>")
                                   (mode-line anything-mode-line-string)
                                   (keymap anything-map)
                                   (name "<span class="quote">Anything Completions</span>")
                                   candidates-in-buffer
                                   exec-when-only-one
                                   (volatile t)
                                   sort
                                   (fc-transformer 'anything-cr-default-transformer)
                                   (marked-candidates nil)
                                   (alistp t))
  "<span class="quote">Read a string in the minibuffer, with anything completion.

It is anything `completing-read' equivalent.

- PROMPT is the prompt name to use.

- COLLECTION can be a list, vector, obarray or hash-table.
  It can be also a function that receives three arguments:
  the values string, predicate and t. See `all-completions' for more details.

Keys description:

- TEST: A predicate called with one arg i.e candidate.

- INITIAL-INPUT: Same as input arg in `anything'.

- PRESELECT: See preselect arg of `anything'.

- DEFAULT: This option is used only for compatibility with regular
  Emacs `completing-read'.
 
- BUFFER: Name of anything-buffer.

- MUST-MATCH: Candidate selected must be one of COLLECTION.

- REQUIRES-PATTERN: Same as anything attribute, default is 0.

- HISTORY: A list containing specific history, default is nil.
  When it is non--nil, all elements of HISTORY are displayed in
  a special source before COLLECTION.

- INPUT-HISTORY: A symbol. the minibuffer input history will be
  stored there, if nil or not provided, `minibuffer-history'
  will be used instead.

- PERSISTENT-ACTION: A function called with one arg i.e candidate.

- PERSISTENT-HELP: A string to document PERSISTENT-ACTION.

- MODE-LINE: A string or list to display in mode line.
  (See `anything-mode-line-string')

- KEYMAP: A keymap to use in this `anything-comp-read'.
  (The keymap will be shared with history source)

- NAME: The name related to this local source.

- EXEC-WHEN-ONLY-ONE: Bound `anything-execute-action-at-once-if-one'
  to non--nil. (possibles values are t or nil).

- VOLATILE: Use volatile attribute \(enabled by default\).

- SORT: A predicate to give to `sort' e.g `string-lessp'.

- FC-TRANSFORMER: A `filtered-candidate-transformer' function.

- MARKED-CANDIDATES: If non--nil return candidate or marked candidates as a list.

- ALISTP: \(default is non--nil\) See `anything-comp-read-get-candidates'.

- CANDIDATES-IN-BUFFER: when non--nil use a source build with
  `anything-candidates-in-buffer' which is much faster.
  Argument VOLATILE have no effect when CANDIDATES-IN-BUFFER is non--nil.
 
Any prefix args passed during `anything-comp-read' invocation will be recorded
in `anything-current-prefix-arg', otherwise if prefix args were given before
`anything-comp-read' invocation, the value of `current-prefix-arg' will be used.
That's mean you can pass prefix args before or after calling a command
that use `anything-comp-read' See `anything-M-x' for example.</span>"
  (when (get-buffer anything-action-buffer)
    (kill-buffer anything-action-buffer))
  (flet ((action-fn (candidate)
           (if marked-candidates
               (anything-marked-candidates)
               (identity candidate))))
    <span class="linecomment">;; Assume completion have been already required,</span>
    <span class="linecomment">;; so always use 'confirm.</span>
    (when (eq must-match 'confirm-after-completion)
      (setq must-match 'confirm))
    (let* ((minibuffer-completion-confirm must-match)
           (must-match-map (when must-match
                             (let ((map (make-sparse-keymap)))
                               (define-key map (kbd "<span class="quote">RET</span>")
                                 'anything-confirm-and-exit-minibuffer)
                               map)))
           (anything-map (if must-match-map
                             (make-composed-keymap
                              must-match-map (or keymap anything-map))
                             (or keymap anything-map)))
           (src-hist `((name . ,(format "<span class="quote">%s History</span>" name))
                       (candidates
                        . (lambda ()
                            (let ((all (anything-comp-read-get-candidates
                                        history nil nil ,alistp)))
                              (delete
                               "<span class="quote"></span>"
                               (anything-fast-remove-dups
                                (if (and default (not (string= default "<span class="quote"></span>")))
                                    (delq nil (cons default
                                                    (delete default all)))
                                    all)
                                :test 'equal)))))
                       (filtered-candidate-transformer
                        . (lambda (candidates sources)
                            (loop for i in candidates
                                  do (set-text-properties 0 (length i) nil i)
                                  collect i)))
                       (persistent-action . ,persistent-action)
                       (persistent-help . ,persistent-help)
                       (mode-line . ,mode-line)
                       (action . ,'action-fn)))
           (src `((name . ,name)
                  (candidates
                   . (lambda ()
                       (let ((cands (anything-comp-read-get-candidates
                                     collection test sort alistp)))
                         (unless (or must-match (string= anything-pattern "<span class="quote"></span>"))
                           (setq cands (append (list anything-pattern) cands)))
                         (if (and default (not (string= default "<span class="quote"></span>")))
                             (delq nil (cons default (delete default cands)))
                             cands))))
                  (filtered-candidate-transformer ,fc-transformer)
                  (requires-pattern . ,requires-pattern)
                  (persistent-action . ,persistent-action)
                  (persistent-help . ,persistent-help)
                  (mode-line . ,mode-line)
                  (action . ,'action-fn)))
           (src-1 `((name . ,name)
                    (init
                     . (lambda ()
                         (let ((cands (anything-comp-read-get-candidates
                                       collection test sort alistp)))
                           (unless (or must-match (string= anything-pattern "<span class="quote"></span>"))
                             (setq cands (append (list anything-pattern) cands)))
                           (with-current-buffer (anything-candidate-buffer 'global)
                             (loop for i in
                                   (if (and default (not (string= default "<span class="quote"></span>")))
                                       (delq nil (cons default (delete default cands)))
                                       cands)
                                   do (insert (concat i "<span class="quote">\n</span>")))))))
                    (candidates-in-buffer)
                    (filtered-candidate-transformer ,fc-transformer)
                    (requires-pattern . ,requires-pattern)
                    (persistent-action . ,persistent-action)
                    (persistent-help . ,persistent-help)
                    (mode-line . ,mode-line)
                    (action . ,'action-fn)))
           (src-list (list src-hist
                           (if candidates-in-buffer
                               src-1
                               (if volatile
                                   (append src '((volatile)))
                                   src))))
           (anything-execute-action-at-once-if-one exec-when-only-one))
      (or
       (anything
        :sources src-list
        :input initial-input
        :default default
        :preselect preselect
        :prompt prompt
        :resume 'noresume
        :keymap anything-map
        :history (and (symbolp input-history) input-history)
        :buffer buffer)
       (when (and (eq anything-exit-status 0)
                  (eq must-match 'confirm))
         <span class="linecomment">;; Return empty string only if it is the DEFAULT</span>
         <span class="linecomment">;; value and anything-pattern is empty.</span>
         <span class="linecomment">;; otherwise return anything-pattern</span>
         (if (and (string= anything-pattern "<span class="quote"></span>") default)
             default (identity anything-pattern)))
       (unless (or (eq anything-exit-status 1)
                   must-match) <span class="linecomment">; FIXME this should not be needed now.</span>
         default)
       (keyboard-quit)))))

<span class="linecomment">;; Generic completing-read</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Support also function as collection.</span>
<span class="linecomment">;; e.g M-x man is supported.</span>
<span class="linecomment">;; Support hash-table and vectors as collection.</span>
<span class="linecomment">;; NOTE:</span>
<span class="linecomment">;; Some crap emacs functions may not be supported</span>
<span class="linecomment">;; like ffap-alternate-file (bad use of completing-read)</span>
<span class="linecomment">;; and maybe others.</span>
<span class="linecomment">;; Provide a mode `anything-completion-mode' which turn on</span>
<span class="linecomment">;; anything in all `completing-read' and `read-file-name' in Emacs.</span>
<span class="linecomment">;;</span>
(defvar anything-completion-mode-string "<span class="quote"> AC</span>")

(defvar anything-completion-mode-quit-message
  "<span class="quote">Anything completion disabled</span>")

(defvar anything-completion-mode-start-message
  "<span class="quote">Anything completion enabled</span>")

<span class="linecomment">;;; Specialized handlers</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-completing-read-symbols
    (prompt collection test require-match init
     hist default inherit-input-method name buffer)
  "<span class="quote">Specialized function for fast symbols completion in `ac-mode'.</span>"
  (or
   (anything
    :sources `((name . ,name)
               (init . (lambda ()
                         (with-current-buffer (anything-candidate-buffer 'global)
                           (goto-char (point-min))
                           (when (and default (stringp default)
                                      <span class="linecomment">;; Some defaults args result as</span>
                                      <span class="linecomment">;; (symbol-name nil) == "nil".</span>
                                      <span class="linecomment">;; e.g debug-on-entry.</span>
                                      (not (string= default "<span class="quote">nil</span>"))
                                      (not (string= default "<span class="quote"></span>")))
                             (insert (concat default "<span class="quote">\n</span>")))
                           (loop with all = (all-completions "<span class="quote"></span>" collection test)
                                 for sym in all
                                 unless (and default (eq sym default))
                                 do (insert (concat sym "<span class="quote">\n</span>"))))))
               (persistent-action . anything-lisp-completion-persistent-action)
               (persistent-help . "<span class="quote">Show brief doc in mode-line</span>")
               (candidates-in-buffer)
               (action . identity))
    :prompt prompt
    :buffer buffer
    :input init
    :history hist
    :resume 'noresume
    :default (or default "<span class="quote"></span>"))
   (keyboard-quit)))


<span class="linecomment">;;; Generic completing read</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-completing-read-default-1
    (prompt collection test require-match
     init hist default inherit-input-method
     name buffer &optional cands-in-buffer exec-when-only-one)
  "<span class="quote">Call `anything-comp-read' with same args as `completing-read'.
Extra optional arg CANDS-IN-BUFFER mean use `candidates-in-buffer'
method which is faster.
It should be used when candidate list don't need to rebuild dynamically.</span>"
  (let ((history (or (car-safe hist) hist)))
    (anything-comp-read
     prompt collection
     :test test
     :history history
     :input-history history
     :must-match require-match
     :alistp nil <span class="linecomment">; Be sure `all-completions' is used.</span>
     :name name
     :requires-pattern (if (and (string= default "<span class="quote"></span>")
                                (or (eq require-match 'confirm)
                                    (eq require-match
                                        'confirm-after-completion)))
                           1 0)
     :candidates-in-buffer cands-in-buffer
     :exec-when-only-one exec-when-only-one
     :buffer buffer
     <span class="linecomment">;; If DEF is not provided, fallback to empty string</span>
     <span class="linecomment">;; to avoid `thing-at-point' to be appended on top of list</span>
     :default (or default "<span class="quote"></span>")
     <span class="linecomment">;; Use `regexp-quote' to fix initial input</span>
     <span class="linecomment">;; with special characters (e.g nnimap+gmail:)</span>
     :initial-input (and (stringp init) (regexp-quote init)))))

(defun anything-completing-read-with-cands-in-buffer
    (prompt collection test require-match
     init hist default inherit-input-method
     name buffer)
  "<span class="quote">Same as `anything-completing-read-default-1' but use candidates-in-buffer.</span>"
  <span class="linecomment">;; Some commands like find-tag may use `read-file-name' from inside</span>
  <span class="linecomment">;; the calculation of collection. in this case it clash with</span>
  <span class="linecomment">;; candidates-in-buffer that reuse precedent data (files) which is wrong.</span>
  <span class="linecomment">;; So (re)calculate collection outside of main anything-session.</span>
  (let ((cands (all-completions "<span class="quote"></span>" collection)))
    (anything-completing-read-default-1 prompt cands test require-match
                                        init hist default inherit-input-method
                                        name buffer t)))

(defun* anything-completing-read-default
    (prompt collection &optional
            predicate require-match
            initial-input hist def
            inherit-input-method)
  "<span class="quote">An anything replacement of `completing-read'.
This function should be used only as a `completing-read-function'.
 
Don't use it directly, use instead `anything-comp-read' in your programs.

See documentation of `completing-read' and `all-completions' for details.</span>"
  (declare (special anything-completion-mode))
  (let* ((current-command this-command)
         (str-command     (symbol-name current-command))
         (buf-name        (format "<span class="quote">*ac-mode-%s*</span>" str-command))
         (entry           (assq current-command
                                anything-completing-read-handlers-alist))
         (def-com         (cdr-safe entry))
         (str-defcom      (and def-com (symbol-name def-com)))
         (def-args        (list prompt collection predicate require-match
                                initial-input hist def inherit-input-method))
         <span class="linecomment">;; Append the two extra args needed to set the buffer and source name</span>
         <span class="linecomment">;; in anything specialized functions.</span>
         (any-args        (append def-args (list str-command buf-name)))
         anything-completion-mode-start-message <span class="linecomment">; Be quiet</span>
         anything-completion-mode-quit-message
         (minibuffer-completion-table collection)
         (minibuffer-completion-predicate predicate)
         <span class="linecomment">;; Be sure this pesty *completion* buffer doesn't popup.</span>
         (minibuffer-setup-hook (remove 'minibuffer-completion-help
                                        minibuffer-setup-hook)))
    (when (eq def-com 'ido) (setq def-com 'ido-completing-read))
    (unless (or (not entry) def-com)
      <span class="linecomment">;; An entry in *read-handlers-alist exists but have</span>
      <span class="linecomment">;; a nil value, so we exit from here, disable `ac-mode'</span>
      <span class="linecomment">;; and run the command again with it original behavior.</span>
      <span class="linecomment">;; `ac-mode' will be restored on exit.</span>
      (return-from anything-completing-read-default
        (unwind-protect
             (progn
               (ac-mode -1)
               (apply completing-read-function def-args))
          (ac-mode 1))))
    <span class="linecomment">;; If we use now `completing-read' we MUST turn off `ac-mode'</span>
    <span class="linecomment">;; to avoid infinite recursion and CRASH. It will be reenabled on exit.</span>
    (when (or (eq def-com 'completing-read)
              <span class="linecomment">;; All specialized functions are prefixed by "anything"</span>
              (and (stringp str-defcom)
                   (not (string-match "<span class="quote">^anything</span>" str-defcom))))
      (ac-mode -1))
    (unwind-protect
         (cond (<span class="linecomment">;; An anything specialized function exists, run it.</span>
                (and def-com anything-completion-mode)
                (apply def-com any-args))
               (<span class="linecomment">;; Try to handle `ido-completing-read' everywhere.</span>
                (and def-com (eq def-com 'ido-completing-read))
                (setcar (memq collection def-args)
                        (all-completions "<span class="quote"></span>" collection predicate))
                (apply def-com def-args))
               (<span class="linecomment">;; User set explicitely `completing-read' or something similar</span>
                <span class="linecomment">;; in *read-handlers-alist, use this with exactly the same</span>
                <span class="linecomment">;; args as in `completing-read'.</span>
                <span class="linecomment">;; If we are here `anything-completion-mode' is now disabled.</span>
                def-com
                (apply def-com def-args))
               (t <span class="linecomment">; Fall back to classic `anything-comp-read'.</span>
                (anything-completing-read-default-1
                 prompt collection predicate require-match
                 initial-input hist def inherit-input-method
                 str-command buf-name)))
      (ac-mode 1)
      <span class="linecomment">;; When exiting minibuffer, `this-command' is set to</span>
      <span class="linecomment">;; `anything-exit-minibuffer', which is unwanted when starting</span>
      <span class="linecomment">;; on another `completing-read', so restore `this-command' to</span>
      <span class="linecomment">;; initial value when exiting.</span>
      (setq this-command current-command))))

(defun* anything-generic-read-file-name
    (prompt &optional dir default-filename mustmatch initial predicate)
  "<span class="quote">An anything replacement of `read-file-name'.</span>"
  (declare (special anything-completion-mode))
  (let* ((default (and default-filename
                       (if (listp default-filename)
                           (car default-filename)
                           default-filename)))
         (init (or default initial dir default-directory))
         (ini-input (and init (expand-file-name init)))
         (current-command this-command)
         (str-command (symbol-name current-command))
         (anything-file-completion-sources
          (cons str-command
                (remove str-command anything-file-completion-sources)))
         (buf-name (format "<span class="quote">*ac-mode-%s*</span>" str-command))
         (entry (assq current-command
                      anything-completing-read-handlers-alist))
         (def-com  (cdr-safe entry))
         (str-defcom (symbol-name def-com))
         (def-args (list prompt dir default-filename mustmatch initial predicate))
         <span class="linecomment">;; Append the two extra args needed to set the buffer and source name</span>
         <span class="linecomment">;; in anything specialized functions.</span>
         (any-args (append def-args (list str-command buf-name)))
         (ido-state ido-mode)
         anything-completion-mode-start-message <span class="linecomment">; Be quiet</span>
         anything-completion-mode-quit-message  <span class="linecomment">; Same here</span>
         fname)
    <span class="linecomment">;; Some functions that normally call `completing-read' can switch</span>
    <span class="linecomment">;; brutally to `read-file-name' (e.g find-tag), in this case</span>
    <span class="linecomment">;; the anything specialized function will fail because it is build</span>
    <span class="linecomment">;; for `completing-read', so set it to 'incompatible to be sure</span>
    <span class="linecomment">;; we switch to `anything-c-read-file-name' and don't try to call it</span>
    <span class="linecomment">;; with wrong number of args.</span>
    (when (and def-com (&gt; (length (help-function-arglist def-com)) 8))
      (setq def-com 'incompatible))
    (when (eq def-com 'ido) (setq def-com 'ido-read-file-name))
    (unless (or (not entry) def-com)
      (return-from anything-generic-read-file-name
        (unwind-protect
             (progn
               (ac-mode -1)
               (apply read-file-name-function def-args))
          (ac-mode 1))))
    <span class="linecomment">;; If we use now `read-file-name' we MUST turn off `ac-mode'</span>
    <span class="linecomment">;; to avoid infinite recursion and CRASH. It will be reenabled on exit.</span>
    (when (or (eq def-com 'read-file-name)
              (eq def-com 'ido-read-file-name)
              (and (stringp str-defcom)
                   (not (string-match "<span class="quote">^anything</span>" str-defcom))))
      (ac-mode -1))
    (unwind-protect
         (setq fname
               (cond (<span class="linecomment">;; A specialized function exists, run it</span>
                      <span class="linecomment">;; with the two extra args specific to anything..</span>
                      (and def-com anything-completion-mode
                           (not (eq def-com 'ido-read-file-name))
                           (not (eq def-com 'incompatible)))
                      (apply def-com any-args))
                     (<span class="linecomment">;; Def-com value is `ido-read-file-name'</span>
                      <span class="linecomment">;; run it with default args.</span>
                      (and def-com (eq def-com 'ido-read-file-name))
                      (ido-mode 1)
                      (apply def-com def-args))
                     (<span class="linecomment">;; Def-com value is `read-file-name'</span>
                      <span class="linecomment">;; run it with default args.</span>
                      (eq def-com 'read-file-name)
                      (apply def-com def-args))
                     (t <span class="linecomment">; Fall back to classic `anything-c-read-file-name'.</span>
                      (anything-c-read-file-name
                       prompt
                       :name str-command
                       :buffer buf-name
                       :initial-input (expand-file-name init dir)
                       :alistp nil
                       :must-match mustmatch
                       :test predicate))))
      (ac-mode 1)
      (ido-mode (if ido-state 1 -1))
      <span class="linecomment">;; Same comment as in `anything-completing-read-default'.</span>
      (setq this-command current-command))
    fname))

<span class="linecomment">;;;###autoload</span>
(define-minor-mode anything-completion-mode
    "<span class="quote">Toggle generic anything completion.

All functions in Emacs that use `completing-read'
or `read-file-name' and friends will use anything interface
when this mode is turned on.
However you can modify this behavior for functions of your choice
with `anything-completing-read-handlers-alist'.

Called with a positive arg, turn on unconditionally, with a
negative arg turn off.
You can turn it on with `ac-mode'.

Some crap emacs functions may not be supported,
e.g `ffap-alternate-file' and maybe others
You can add such functions to `anything-completing-read-handlers-alist'
with a nil value.

Note: This mode will work only partially on Emacs23.</span>"
  :group 'anything
  :global t
  :lighter anything-completion-mode-string
  (declare (special completing-read-function))
  (if anything-completion-mode
      (progn
        (setq completing-read-function 'anything-completing-read-default
              read-file-name-function  'anything-generic-read-file-name)
        (message anything-completion-mode-start-message))
      (setq completing-read-function (and (fboundp 'completing-read-default)
                                          'completing-read-default)
            read-file-name-function  (and (fboundp 'read-file-name-default)
                                          'read-file-name-default))
      (message anything-completion-mode-quit-message)))

(defalias 'ac-mode 'anything-completion-mode)


 
<span class="linecomment">;;; Eshell completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Enable like this in .emacs:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (add-hook 'eshell-mode-hook</span>
<span class="linecomment">;;           #'(lambda ()</span>
<span class="linecomment">;;               (define-key eshell-mode-map [remap pcomplete] 'anything-esh-pcomplete)))</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-esh
  '((name . "<span class="quote">Eshell completions</span>")
    (init . (lambda ()
              (setq pcomplete-current-completions nil
                    pcomplete-last-completion-raw nil)
              <span class="linecomment">;; Eshell-command add this hook in all minibuffers</span>
              <span class="linecomment">;; Remove it for the anything one. (Fixed in Emacs24)</span>
              (remove-hook 'minibuffer-setup-hook 'eshell-mode)))
    (candidates . anything-esh-get-candidates)
    (action . anything-ec-insert))
  "<span class="quote">Anything source for Eshell completion.</span>")

<span class="linecomment">;; Internal.</span>
(defvar anything-ec-target "<span class="quote"></span>")
(defun anything-ec-insert (candidate)
  "<span class="quote">Replace text at point with CANDIDATE.
The function that call this should set `anything-ec-target' to thing at point.
This is the same as `ac-insert', just inlined here for compatibility.</span>"
  (let ((pt (point)))
    (when (and anything-ec-target
               (search-backward anything-ec-target nil t)
               (string= (buffer-substring (point) pt) anything-ec-target))
      (delete-region (point) pt)))
  (insert (anything-quote-whitespace candidate)))

(defun anything-esh-get-candidates ()
  "<span class="quote">Get candidates for eshell completion using `pcomplete'.</span>"
  (catch 'pcompleted
    (let* ((pcomplete-stub)
           pcomplete-seen pcomplete-norm-func
           pcomplete-args pcomplete-last pcomplete-index
           (pcomplete-autolist pcomplete-autolist)
           (pcomplete-suffix-list pcomplete-suffix-list))
      (with-anything-current-buffer
        (loop with table  = (pcomplete-completions)
              with entry  = (condition-case nil
                                <span class="linecomment">;; On Emacs24 `try-completion' return</span>
                                <span class="linecomment">;; pattern when more than one result.</span>
                                <span class="linecomment">;; Otherwise Emacs23 return nil, which</span>
                                <span class="linecomment">;; is wrong, in this case use pattern</span>
                                <span class="linecomment">;; to behave like Emacs24.</span>
                                (or (try-completion anything-pattern
                                                    (pcomplete-entries))
                                    anything-pattern)
                              <span class="linecomment">;; In Emacs23 `pcomplete-entries' may fail</span>
                              <span class="linecomment">;; with error, so try this instead.</span>
                              (error
                               nil
                               (let ((fc (car (last
                                               (pcomplete-parse-arguments)))))
                                 <span class="linecomment">;; Check if last arg require fname completion.</span>
                                 (and (file-name-directory fc) fc))))
              for i in (all-completions pcomplete-stub table)
              for file-cand = (and entry
                                   (if (file-remote-p i) i
                                       (expand-file-name
                                        i (file-name-directory entry))))
              if (and file-cand (or (file-remote-p file-cand)
                                    (file-exists-p file-cand)))
              collect file-cand into ls
              else collect i into ls
              finally return
              (if (and entry (not (string= entry "<span class="quote"></span>")) (file-exists-p entry))
                  (append (list (expand-file-name entry default-directory)) ls)
                  ls))))))

<span class="linecomment">;;; Eshell history.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-c-source-eshell-history
  `((name . "<span class="quote">Eshell history</span>")
    (init . (lambda ()
              (let (eshell-hist-ignoredups)
                <span class="linecomment">;; Write the content's of ring to file.</span>
                (eshell-write-history eshell-history-file-name t)
                (with-current-buffer (anything-candidate-buffer 'global)
                  (insert-file-contents eshell-history-file-name)))
              <span class="linecomment">;; Same comment as in `anything-c-source-esh'</span>
              (remove-hook 'minibuffer-setup-hook 'eshell-mode)))
    (candidates-in-buffer)
    (keymap . ,anything-eshell-history-map)
    (filtered-candidate-transformer . (lambda (candidates sources)
                                        (reverse candidates)))
    (candidate-number-limit . 9999)
    (action . (lambda (candidate)
                (eshell-kill-input)
                (insert candidate))))
  "<span class="quote">Anything source for Eshell history.</span>")

 
<span class="linecomment">;;; Show completion - an alternative of anything-show-completion.el.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Provide show completion with macro `with-anything-show-completion'.</span>


<span class="linecomment">;; Called each time cursor move in anything-buffer.</span>
(defun anything-c-show-completion ()
  (with-anything-current-buffer
    (overlay-put anything-c-show-completion-overlay
                 'display (anything-get-selection))))

(defun anything-c-show-completion-init-overlay (beg end)
  (and anything-c-turn-on-show-completion
       (setq anything-c-show-completion-overlay (make-overlay beg end))
       (overlay-put anything-c-show-completion-overlay
                    'face 'anything-lisp-show-completion)))

(defun anything-c-show-completion-display-function (buffer)
  "<span class="quote">A special resized anything window is used depending on position in BUFFER.</span>"
  (with-selected-window (selected-window)
    (let* ((screen-size  (+ (count-screen-lines (window-start) (point) t)
                            1                             <span class="linecomment">; mode-line</span>
                            (if header-line-format 1 0))) <span class="linecomment">; header-line</span>
           (def-size     (- (window-height)
                            anything-c-show-completion-min-window-height))
           (upper-height (max window-min-height (min screen-size def-size)))
           split-window-keep-point)
      (recenter -1)
      (set-window-buffer (if (active-minibuffer-window)
                             (minibuffer-selected-window)
                             (split-window nil upper-height))
                         buffer))))

(defmacro with-anything-show-completion (beg end &rest body)
  "<span class="quote">Show anything candidate in an overlay at point.
BEG and END are the beginning and end position of the current completion
in `anything-current-buffer'.
BODY is an anything call where we want to enable show completion.
If `anything-c-turn-on-show-completion' is nil just do nothing.</span>"
  (declare (indent 2) (debug t))
  `(let ((anything-move-selection-after-hook
          (and anything-c-turn-on-show-completion
               (append (list 'anything-c-show-completion)
                       anything-move-selection-after-hook))))
     (unwind-protect
          (progn
            (anything-c-show-completion-init-overlay ,beg ,end)
            (let ((anything-display-function
                   (if anything-c-show-completion-use-special-display
                       'anything-c-show-completion-display-function
                       'anything-default-display-buffer)))
              ,@body))
       (and anything-c-turn-on-show-completion
            (delete-overlay anything-c-show-completion-overlay)))))

 
<span class="linecomment">;;; Lisp symbol completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun anything-lisp-completion-at-point ()
  "<span class="quote">Anything lisp symbol completion at point.</span>"
  (interactive)
  (let* ((data       (lisp-completion-at-point))
         (beg        (car data))
         (end        (point)) <span class="linecomment">; 'cadr data' is wrong when no space after point.</span>
         (plist      (nthcdr 3 data))
         (pred       (plist-get plist :predicate))
         (lgst-len   0)
         (target     (and beg end (buffer-substring-no-properties beg end)))
         (candidates (all-completions target (nth 2 data) pred))
         (anything-quit-if-no-candidate t)
         
         (anything-execute-action-at-once-if-one t)
         (anything-match-plugin-enabled
          (member 'anything-compile-source--match-plugin
                  anything-compile-source-functions)))
    (if candidates
        (with-anything-show-completion beg end
          <span class="linecomment">;; Overlay is initialized now in anything-current-buffer.</span>
          (anything
           :sources
           '((name . "<span class="quote">Lisp completion</span>")
             (init . (lambda ()
                       (with-current-buffer (anything-candidate-buffer 'global)
                         (loop for sym in candidates
                               for len = (length sym)
                               when (&gt; len lgst-len) do (setq lgst-len len)
                               do (insert (concat sym "<span class="quote">\n</span>"))))))
             (candidates-in-buffer)
             (persistent-action . anything-lisp-completion-persistent-action)
             (persistent-help . "<span class="quote">Show brief doc in mode-line</span>")
             (filtered-candidate-transformer anything-lisp-completion-transformer)
             (action . (lambda (candidate)
                         (delete-region beg end)
                         (insert candidate))))
           :input (if anything-match-plugin-enabled (concat target "<span class="quote"> </span>") target)))
        (message "<span class="quote">[No Match]</span>"))))

(defun anything-lisp-completion-persistent-action (candidate)
  (let ((cursor-in-echo-area t)
        mode-line-in-non-selected-windows)
    (anything-c-show-info-in-mode-line
     (propertize
      (anything-c-get-first-line-documentation
       (intern candidate))
      'face 'anything-lisp-completion-info))))

(defun anything-lisp-completion-transformer (candidates source)
  "<span class="quote">Anything candidates transformer for lisp completion.</span>"
  (declare (special lgst-len))
  (loop for c in candidates
        for sym = (intern c)
        for annot = (cond ((commandp sym) "<span class="quote"> (Com)</span>")
                          ((fboundp sym)  "<span class="quote"> (Fun)</span>")
                          ((boundp sym)   "<span class="quote"> (Var)</span>")
                          ((facep sym)    "<span class="quote"> (Face)</span>"))
        for spaces = (make-string (- lgst-len (length c)) ? )
        collect (cons (concat c spaces annot) c)))

(defun anything-c-get-first-line-documentation (sym)
  "<span class="quote">Return first line documentation of symbol SYM.
If SYM is not documented, return \"Not documented\".</span>"
  (let ((doc (cond ((fboundp sym)
                    (documentation sym t))
                   ((boundp sym)
                    (documentation-property sym 'variable-documentation t))
                   ((facep sym)
                    (face-documentation sym))
                   (t nil))))
    (if (and doc (not (string= doc "<span class="quote"></span>"))
             <span class="linecomment">;; `documentation' return "\n\n(args...)"</span>
             <span class="linecomment">;; for CL-style functions.</span>
             (not (string-match-p "<span class="quote">^\n\n</span>" doc)))
        (car (split-string doc "<span class="quote">\n</span>"))
        "<span class="quote">Not documented</span>")))

<span class="linecomment">;;; File completion.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Complete file name at point.</span>
(defun anything-c-thing-before-point ()
  "<span class="quote">Get symbol name before point.
Borrowed from anything-complete.el, inlined here for compatibility.</span>"
  (save-excursion
    (let ((beg (point)))
      <span class="linecomment">;; older regexp "\(\\|\\s-\\|^\\|\\_&lt;\\|\r\\|'\\|#'"</span>
      (when (re-search-backward
             "<span class="quote">\\_&lt;</span>" (field-beginning nil nil (point-at-bol)) t)
        (buffer-substring-no-properties beg (match-end 0))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-complete-file-name-at-point ()
  "<span class="quote">Complete file name at point.</span>"
  (interactive)
  (let* ((init (substring-no-properties (thing-at-point 'filename)))
         (end  (point))
         (beg  (- (point) (length init)))
         (anything-quit-if-no-candidate t)
         (anything-execute-action-at-once-if-one t)
         completion)
    (with-anything-show-completion beg end
      (setq completion (anything-c-read-file-name "<span class="quote">FileName: </span>"
                                                  :initial-input init)))
    (anything-c-insert-file-name-completion-at-point completion)))

<span class="linecomment">;; Internal</span>
(defvar anything-lisp-completion-counter 0)
<span class="linecomment">;;;###autoload</span>
(defun anything-lisp-completion-at-point-or-indent (arg)
  "<span class="quote">First call indent and second call complete lisp symbol.
The second call should happen before `anything-lisp-completion-or-indent-delay',
after this delay, next call will indent again.
After completion, next call is always indent.
See that like click and double mouse click.
One hit indent, two quick hits maybe indent and complete.</span>"
  (interactive "<span class="quote">P</span>")
  <span class="linecomment">;; Be sure `indent-for-tab-command' will not try</span>
  <span class="linecomment">;; to use `completion-at-point'.</span>
  (let ((tab-always-indent (if (eq tab-always-indent 'complete)
                               t tab-always-indent)))
    (incf anything-lisp-completion-counter)
    (unwind-protect
         (if (&gt; anything-lisp-completion-counter 1)
             (anything-lisp-completion-or-file-name-at-point)
             (indent-for-tab-command arg))
      <span class="linecomment">;; After `anything-lisp-completion-or-indent-delay' seconds</span>
      <span class="linecomment">;; reset to 0.</span>
      (run-with-timer anything-lisp-completion-or-indent-delay nil
                      #'(lambda ()
                          (setq anything-lisp-completion-counter 0)))
      <span class="linecomment">;; Always reset to 0 at second hit.</span>
      (when (eq anything-lisp-completion-counter 2)
        (setq anything-lisp-completion-counter 0)))))

<span class="linecomment">;;;###autoload</span>
(defun anything-lisp-completion-or-file-name-at-point ()
  "<span class="quote">Complete lisp symbol or filename at point.
Filename completion happen if filename is started in
or between double quotes.</span>"
  (interactive)
  (let ((tap (substring-no-properties (thing-at-point 'filename))))
    (if (and tap (string-match "<span class="quote">^\\(~/\\|/\\|[a-zA-Z]\:/\\).*</span>" tap)
             (save-excursion (search-backward "<span class="quote">\"</span>" (point-at-bol) t)))
        (anything-c-complete-file-name-at-point)
        (anything-lisp-completion-at-point))))

(defun anything-c-apropos-init (test default)
  "<span class="quote">Init candidates buffer for `anything-c-apropos' sources.</span>"
  (with-current-buffer (anything-candidate-buffer 'global)
    (goto-char (point-min))
    (when (and default (stringp default)
               <span class="linecomment">;; Some defaults args result as</span>
               <span class="linecomment">;; (symbol-name nil) == "nil".</span>
               <span class="linecomment">;; e.g debug-on-entry.</span>
               (not (string= default "<span class="quote">nil</span>"))
               (funcall test (intern default)))
      (insert (concat default "<span class="quote">\n</span>")))
    (loop with all = (all-completions "<span class="quote"></span>" obarray test)
          for sym in all
          unless (and default (eq sym default))
          do (insert (concat sym "<span class="quote">\n</span>")))))

 
<span class="linecomment">;;; Run Externals commands within Emacs with anything completion</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-external-command-history nil)

(defun anything-c-external-commands-list-1 (&optional sort)
  "<span class="quote">Returns a list of all external commands the user can execute.
If `anything-c-external-commands-list' is non-nil it will
return its contents.  Else it calculates all external commands
and sets `anything-c-external-commands-list'.</span>"
  (if anything-c-external-commands-list
      anything-c-external-commands-list
      (setq anything-c-external-commands-list
            (loop
                  with paths = (split-string (getenv "<span class="quote">PATH</span>") path-separator)
                  with completions = ()
                  for dir in paths
                  when (and (file-exists-p dir) (file-accessible-directory-p dir))
                  for lsdir = (loop for i in (directory-files dir t)
                                    for bn = (file-name-nondirectory i)
                                    when (and (not (member bn completions))
                                              (not (file-directory-p i))
                                              (file-executable-p i))
                                    collect bn)
                  append lsdir into completions
                  finally return (if sort (sort completions 'string-lessp) completions)))))

(defun anything-run-or-raise (exe &optional file)
  "<span class="quote">Generic command that run asynchronously EXE.
If EXE is already running just jump to his window if `anything-raise-command'
is non--nil.
When FILE argument is provided run EXE with FILE.
In this case EXE must be provided as \"EXE %s\".</span>"
  (lexical-let* ((real-com (car (split-string (replace-regexp-in-string
                                               "<span class="quote">%s</span>" "<span class="quote"></span>" exe))))
                 (proc     (if file (concat real-com "<span class="quote"> </span>" file) real-com)))
    (if (get-process proc)
        (if anything-raise-command
            (shell-command  (format anything-raise-command real-com))
            (error "<span class="quote">Error: %s is already running</span>" real-com))
        (when (loop for i in anything-c-external-commands-list thereis real-com)
          (message "<span class="quote">Starting %s...</span>" real-com)
          (if file
              (start-process-shell-command
               proc nil (format exe (shell-quote-argument
                                     (if (eq system-type 'windows-nt)
                                         (anything-w32-prepare-filename file)
                                         file))))
              (start-process-shell-command proc nil real-com))
          (set-process-sentinel
           (get-process proc)
           #'(lambda (process event)
               (when (and (string= event "<span class="quote">finished\n</span>")
                          anything-raise-command
                          (not (anything-c-get-pid-from-process-name real-com)))
                 (shell-command  (format anything-raise-command "<span class="quote">emacs</span>")))
               (message "<span class="quote">%s process...Finished.</span>" process))))
        (setq anything-c-external-commands-list
              (cons real-com
                    (delete real-com anything-c-external-commands-list))))))


 
<span class="linecomment">;;; Generic action functions</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun anything-c-file-buffers (filename)
  "<span class="quote">Returns a list of buffer names corresponding to FILENAME.</span>"
  (let ((name     (expand-file-name filename))
        (buf-list ()))
    (dolist (buf (buffer-list) buf-list)
      (let ((bfn (buffer-file-name buf)))
        (when (and bfn (string= name bfn))
          (push (buffer-name buf) buf-list))))))

(defun anything-revert-buffer (candidate)
  (with-current-buffer candidate
    (when (or (buffer-modified-p)
              (not (verify-visited-file-modtime
                    (get-buffer candidate))))
      (revert-buffer t t))))

(defun anything-revert-marked-buffers (ignore)
  (mapc 'anything-revert-buffer (anything-marked-candidates)))

(defun anything-kill-marked-buffers (ignore)
  (mapc 'kill-buffer (anything-marked-candidates)))

(defun anything-c-delete-file (file &optional error-if-dot-file-p)
  "<span class="quote">Delete the given file after querying the user.
Ask to kill buffers associated with that file, too.</span>"
  (when (and error-if-dot-file-p
             (anything-ff-dot-file-p file))
    (error "<span class="quote">Error: Cannot operate on `.' or `..'</span>"))
  (let ((buffers (anything-c-file-buffers file)))
    (if (&lt; emacs-major-version 24)
        <span class="linecomment">;; `dired-delete-file' in Emacs versions &lt; 24</span>
        <span class="linecomment">;; doesn't support delete-by-moving-to-trash</span>
        <span class="linecomment">;; so use `delete-directory' and `delete-file'</span>
        <span class="linecomment">;; that handle it.</span>
        (cond ((and (not (file-symlink-p file))
                    (file-directory-p file)
                    (directory-files file t dired-re-no-dot))
               (when (y-or-n-p (format "<span class="quote">Recursive delete of `%s'? </span>" file))
                 (delete-directory file 'recursive)))
              ((and (not (file-symlink-p file))
                    (file-directory-p file))
               (delete-directory file))
              (t (delete-file file)))
        (dired-delete-file
         file 'dired-recursive-deletes delete-by-moving-to-trash))
    (when buffers
      (dolist (buf buffers)
        (when (y-or-n-p (format "<span class="quote">Kill buffer %s, too? </span>" buf))
          (kill-buffer buf))))))

(defun anything-get-mailcap-for-file (filename)
  "<span class="quote">Get the command to use for FILENAME from mailcap files.
The command is like &lt;command %s&gt; and is meant to use with `format'.</span>"
  (mailcap-parse-mailcaps)
  (let* ((ext  (file-name-extension filename))
         (mime (when ext (mailcap-extension-to-mime ext)))
         (result (when mime (mailcap-mime-info mime))))
    <span class="linecomment">;; If elisp file have no associations in .mailcap</span>
    <span class="linecomment">;; `mailcap-maybe-eval' is returned, in this case just return nil.</span>
    (when (stringp result) result)))

(defun anything-get-default-program-for-file (filename)
  "<span class="quote">Try to find a default program to open FILENAME.
Try first in `anything-c-external-programs-associations' and then in mailcap file
if nothing found return nil.</span>"
  (let* ((ext      (file-name-extension filename))
         (def-prog (assoc-default ext anything-c-external-programs-associations)))
    (cond ((and def-prog (not (string= def-prog "<span class="quote"></span>")))
           (concat def-prog "<span class="quote"> %s</span>"))
          ((and anything-c-default-external-file-browser
                (file-directory-p filename))
           (concat anything-c-default-external-file-browser "<span class="quote"> %s</span>"))
          (t (anything-get-mailcap-for-file filename)))))

(defun anything-c-open-file-externally (file)
  "<span class="quote">Open FILE with an external program.
Try to guess which program to use with `anything-get-default-program-for-file'.
If not found or a prefix arg is given query the user which tool to use.</span>"
  (let* ((fname          (expand-file-name file))
         (collection     (anything-c-external-commands-list-1 'sort))
         (def-prog       (anything-get-default-program-for-file fname))
         (real-prog-name (if (or anything-current-prefix-arg (not def-prog))
                             <span class="linecomment">;; Prefix arg or no default program.</span>
                             (prog1
                                 (anything-comp-read
                                  "<span class="quote">Program: </span>" collection
                                  :must-match t
                                  :name "<span class="quote">Open file Externally</span>"
                                  :history anything-external-command-history)
                               <span class="linecomment">;; Always prompt to set this program as default.</span>
                               (setq def-prog nil))
                             <span class="linecomment">;; No prefix arg or default program exists.</span>
                             (replace-regexp-in-string "<span class="quote"> %s\\| '%s'</span>" "<span class="quote"></span>" def-prog)))
         (program        (concat real-prog-name "<span class="quote"> %s</span>")))
    (unless (or def-prog <span class="linecomment">; Association exists, no need to record it.</span>
                <span class="linecomment">;; Don't try to record non--filenames associations (e.g urls).</span>
                (not (file-exists-p fname)))
      (when
          (y-or-n-p
           (format
            "<span class="quote">Do you want to make `%s' the default program for this kind of files? </span>"
            real-prog-name))
        (anything-aif (assoc (file-name-extension fname)
                             anything-c-external-programs-associations)
            (setq anything-c-external-programs-associations
                  (delete it anything-c-external-programs-associations)))
        (push (cons (file-name-extension fname)
                    (read-string
                     "<span class="quote">Program (Add args maybe and confirm): </span>" real-prog-name))
              anything-c-external-programs-associations)
        (customize-save-variable 'anything-c-external-programs-associations
                                 anything-c-external-programs-associations)))
    (anything-run-or-raise program file)
    (setq anything-external-command-history
          (cons real-prog-name
                (delete real-prog-name
                        (loop for i in anything-external-command-history
                              when (executable-find i) collect i))))))

(defun anything-c-find-file-or-marked (candidate)
  "<span class="quote">Open file CANDIDATE or open anything marked files in background.</span>"
  (let ((marked (anything-marked-candidates))
        (ffap-newfile-prompt anything-ff-newfile-prompt-p)
        (find-file-wildcards nil))
    (if (&gt; (length marked) 1)
        <span class="linecomment">;; Open all marked files in background and display</span>
        <span class="linecomment">;; the first one.</span>
        (progn (mapc 'find-file-noselect (cdr marked))
               (find-file (car marked)))
        (if (and (not (file-exists-p candidate))
                 (and ffap-url-regexp
                      (not (string-match ffap-url-regexp candidate)))
                 (string-match "<span class="quote">/$</span>" candidate))
            <span class="linecomment">;; A a non--existing filename ending with /</span>
            <span class="linecomment">;; Create a directory and jump to it.</span>
            (when (y-or-n-p (format "<span class="quote">Create directory `%s'? </span>" candidate))
              (let ((dirfname (directory-file-name candidate)))
                (if (file-exists-p dirfname)
                    (error "<span class="quote">Mkdir: Unable to create directory `%s': file exists.</span>"
                           (anything-c-basename dirfname))
                    (make-directory candidate 'parent)))
              (anything-find-files-1 candidate))
            <span class="linecomment">;; A non--existing filename NOT ending with / or</span>
            <span class="linecomment">;; an existing filename, create or jump to it.</span>
            (find-file-at-point (car marked))))))

(defun anything-delete-marked-files (ignore)
  (let* ((files (anything-marked-candidates))
         (len (length files)))
    (if (not (y-or-n-p
              (format "<span class="quote">Delete *%s File(s):\n%s</span>"
                      len
                      (mapconcat (lambda (f) (format "<span class="quote">- %s\n</span>" f)) files "<span class="quote"></span>"))))
        (message "<span class="quote">(No deletions performed)</span>")
        (dolist (i files)
          (set-text-properties 0 (length i) nil i)
          (anything-c-delete-file i anything-ff-signal-error-on-dot-files))
        (message "<span class="quote">%s File(s) deleted</span>" len))))

(defun anything-ediff-marked-buffers (candidate &optional merge)
  "<span class="quote">Ediff 2 marked buffers or CANDIDATE and `anything-current-buffer'.
With optional arg MERGE call `ediff-merge-buffers'.</span>"
  (let ((lg-lst (length (anything-marked-candidates)))
        buf1 buf2)
    (case lg-lst
      (0
       (error "<span class="quote">Error:You have to mark at least 1 buffer</span>"))
      (1
       (setq buf1 anything-current-buffer
             buf2 (first (anything-marked-candidates))))
      (2
       (setq buf1 (first (anything-marked-candidates))
             buf2 (second (anything-marked-candidates))))
      (t
       (error "<span class="quote">Error:To much buffers marked!</span>")))
    (if merge
        (ediff-merge-buffers buf1 buf2)
        (ediff-buffers buf1 buf2))))

(defun anything-ediff-marked-buffers-merge (candidate)
  "<span class="quote">Ediff merge `anything-current-buffer' with CANDIDATE.
See `anything-ediff-marked-buffers'.</span>"
  (anything-ediff-marked-buffers candidate t))

(defun anything-bookmark-get-bookmark-from-name (bmk)
  "<span class="quote">Return bookmark name even if it is a bookmark with annotation.
e.g prepended with *.
Return nil if bmk is not a valid bookmark.</span>"
  (let ((bookmark (replace-regexp-in-string "<span class="quote">\*</span>" "<span class="quote"></span>" bmk)))
    (if (assoc bookmark bookmark-alist)
        bookmark
        (when (assoc bmk bookmark-alist)
          bmk))))

(defun anything-delete-marked-bookmarks (ignore)
  "<span class="quote">Delete this bookmark or all marked bookmarks.</span>"
  (dolist (i (anything-marked-candidates))
    (bookmark-delete (anything-bookmark-get-bookmark-from-name i)
                     'batch)))

(defun anything-require-or-error (feature function)
  (or (require feature nil t)
      (error "<span class="quote">Need %s to use `%s'.</span>" feature function)))

(defun anything-find-buffer-on-elscreen (candidate)
  "<span class="quote">Open buffer in new screen, if marked buffers open all in elscreens.</span>"
  (anything-require-or-error 'elscreen 'anything-find-buffer-on-elscreen)
  (anything-aif (anything-marked-candidates)
      (dolist (i it)
        (let ((target-screen (elscreen-find-screen-by-buffer
                              (get-buffer i) 'create)))
          (elscreen-goto target-screen)))
    (let ((target-screen (elscreen-find-screen-by-buffer
                          (get-buffer candidate) 'create)))
      (elscreen-goto target-screen))))

(defun anything-elscreen-find-file (file)
  (anything-require-or-error 'elscreen 'anything-elscreen-find-file)
  (elscreen-find-file file))

(defun anything-w32-prepare-filename (file)
  "<span class="quote">Convert filename FILE to something usable by external w32 executables.</span>"
  (replace-regexp-in-string <span class="linecomment">; For UNC paths</span>
   "<span class="quote">/</span>" "<span class="quote">\\</span>"
   (replace-regexp-in-string <span class="linecomment">; Strip cygdrive paths</span>
    "<span class="quote">/cygdrive/\\(.\\)</span>" "<span class="quote">\\1:</span>"
    file nil nil) nil t))

<span class="linecomment">;;;###autoload</span>
(defun anything-w32-shell-execute-open-file (file)
  (interactive "<span class="quote">fOpen file:</span>")
  (with-no-warnings
    (w32-shell-execute "<span class="quote">open</span>" (anything-w32-prepare-filename file))))

(defun anything-c-open-file-with-default-tool (file)
  "<span class="quote">Open FILE with the default tool on this platform.</span>"
  (if (eq system-type 'windows-nt)
      (anything-w32-shell-execute-open-file file)
      (start-process "<span class="quote">anything-c-open-file-with-default-tool</span>"
                     nil
                     (cond ((eq system-type 'gnu/linux)
                            "<span class="quote">xdg-open</span>")
                           ((or (eq system-type 'darwin) <span class="linecomment">;; Mac OS X</span>
                                (eq system-type 'macos)) <span class="linecomment">;; Mac OS 9</span>
                            "<span class="quote">open</span>"))
                     file)))

(defun anything-c-open-dired (file)
  "<span class="quote">Opens a dired buffer in FILE's directory.  If FILE is a
directory, open this directory.</span>"
  (if (file-directory-p file)
      (dired file)
      (dired (file-name-directory file))
      (dired-goto-file file)))

(defun anything-c-display-to-real-line (candidate)
  (if (string-match "<span class="quote">^ *\\([0-9]+\\):\\(.*\\)$</span>" candidate)
      (list (string-to-number (match-string 1 candidate)) (match-string 2 candidate))
      (error "<span class="quote">Line number not found</span>")))

(defun anything-c-action-line-goto (lineno-and-content)
  (apply #'anything-goto-file-line (anything-interpret-value (anything-attr 'target-file))
         (append lineno-and-content
                 (list (if (and (anything-attr-defined 'target-file)
                                (not anything-in-persistent-action))
                           'find-file-other-window
                           'find-file)))))

(defun* anything-c-action-file-line-goto (file-line-content &optional (find-file-function #'find-file))
  (apply #'anything-goto-file-line
         (if (stringp file-line-content)
             <span class="linecomment">;; Case: filtered-candidate-transformer is skipped</span>
             (cdr (anything-c-filtered-candidate-transformer-file-line-1 file-line-content))
             file-line-content)))

(require 'compile)
(defun anything-c-filtered-candidate-transformer-file-line (candidates source)
  (delq nil (mapcar 'anything-c-filtered-candidate-transformer-file-line-1 candidates)))

(defun anything-c-filtered-candidate-transformer-file-line-1 (candidate)
  (when (string-match "<span class="quote">^\\(.+?\\):\\([0-9]+\\):\\(.*\\)$</span>" candidate)
    (let ((filename (match-string 1 candidate))
          (lineno (match-string 2 candidate))
          (content (match-string 3 candidate)))
      (cons (format "<span class="quote">%s:%s\n %s</span>"
                    (propertize filename 'face compilation-info-face)
                    (propertize lineno 'face compilation-line-face)
                    content)
            (list (expand-file-name
                   filename
                   (or (anything-interpret-value (anything-attr 'default-directory))
                       (and (anything-candidate-buffer)
                            (buffer-local-value
                             'default-directory (anything-candidate-buffer)))))
                  (string-to-number lineno) content)))))

(defun* anything-goto-file-line (file lineno content &optional (find-file-function #'find-file))
  (anything-aif (anything-attr 'before-jump-hook)
      (funcall it))
  (when file (funcall find-file-function file))
  (if (anything-attr-defined 'adjust)
      (anything-c-goto-line-with-adjustment
       lineno content (not (anything-attr-defined 'recenter)))
    (anything-goto-line lineno nil (not (anything-attr-defined 'recenter))))
  (anything-aif (anything-attr 'after-jump-hook)
      (funcall it))
  (when anything-in-persistent-action
    (anything-match-line-color-current-line)))

(defun anything-find-file-as-root (candidate)
  (find-file (concat "<span class="quote">/</span>" anything-su-or-sudo "<span class="quote">::</span>" (expand-file-name candidate))))

(defun anything-find-many-files (ignore)
  (mapc 'find-file (anything-marked-candidates)))

<span class="linecomment">;; borrowed from etags.el</span>
<span class="linecomment">;; (anything-c-goto-line-with-adjustment (line-number-at-pos) ";; borrowed from etags.el")</span>
(defun anything-c-goto-line-with-adjustment (line line-content &optional show-top)
  (let ((startpos)
        offset found pat)
    <span class="linecomment">;; This constant is 1/2 the initial search window.</span>
    <span class="linecomment">;; There is no sense in making it too small,</span>
    <span class="linecomment">;; since just going around the loop once probably</span>
    <span class="linecomment">;; costs about as much as searching 2000 chars.</span>
    (setq offset 1000
          found nil
          pat (concat (if (eq selective-display t)
                          "<span class="quote">\\(^\\|\^m\\) *</span>" "<span class="quote">^ *</span>") <span class="linecomment">;allow indent</span>
                      (regexp-quote line-content)))
    <span class="linecomment">;; If no char pos was given, try the given line number.</span>
    (setq startpos (progn (anything-goto-line line nil show-top) (point)))
    (or startpos (setq startpos (point-min)))
    <span class="linecomment">;; First see if the tag is right at the specified location.</span>
    (goto-char startpos)
    (setq found (looking-at pat))
    (while (and (not found)
                (progn
                  (goto-char (- startpos offset))
                  (not (bobp))))
      (setq found
            (re-search-forward pat (+ startpos offset) t)
            offset (* 3 offset)))       <span class="linecomment">; expand search window</span>
    (or found
        (re-search-forward pat nil t)
        (error "<span class="quote">not found</span>")))
  <span class="linecomment">;; Position point at the right place</span>
  <span class="linecomment">;; if the search string matched an extra Ctrl-m at the beginning.</span>
  (and (eq selective-display t)
       (looking-at "<span class="quote">\^m</span>")
       (forward-char 1))
  (beginning-of-line))

(anything-document-attribute 'default-directory "<span class="quote">type . file-line</span>"
                             "<span class="quote">`default-directory' to interpret file.</span>")
(anything-document-attribute 'before-jump-hook "<span class="quote">type . file-line / line</span>"
                             "<span class="quote">Function to call before jumping to the target location.</span>")
(anything-document-attribute 'after-jump-hook "<span class="quote">type . file-line / line</span>"
                             "<span class="quote">Function to call after jumping to the target location.</span>")
(anything-document-attribute 'adjust "<span class="quote">type . file-line</span>"
                             "<span class="quote">Search around line matching line contents.</span>")
(anything-document-attribute 'recenter "<span class="quote">type . file-line / line</span>"
                             "<span class="quote">`recenter' after jumping.</span>")
(anything-document-attribute 'target-file "<span class="quote">type . line</span>"
                             "<span class="quote">Goto line of target-file.</span>")

<span class="linecomment">;;;###autoload</span>
(defun anything-c-call-interactively (cmd-or-name)
  "<span class="quote">Execute CMD-OR-NAME as Emacs command.
It is added to `extended-command-history'.
`anything-current-prefix-arg' is used as the command's prefix argument.</span>"
  (setq extended-command-history
        (cons (anything-c-stringify cmd-or-name)
              (delete (anything-c-stringify cmd-or-name) extended-command-history)))
  (let ((current-prefix-arg anything-current-prefix-arg)
        (cmd (anything-c-symbolify cmd-or-name)))
    (if (stringp (symbol-function cmd))
        (execute-kbd-macro (symbol-function cmd))
        (setq this-command cmd)
        (call-interactively cmd))))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-set-variable (var)
  "<span class="quote">Set value to VAR interactively.</span>"
  (interactive)
  (let ((sym (anything-c-symbolify var)))
    (set sym (eval-minibuffer (format "<span class="quote">Set %s: </span>" var)
                              (prin1-to-string (symbol-value sym))))))
<span class="linecomment">;; (setq hh 12)</span>
<span class="linecomment">;; (anything-c-set-variable 'hh)</span>


 
<span class="linecomment">;;; Persistent Action Helpers</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-match-line-overlay-face nil)
(defvar anything-match-line-overlay nil)

(defun anything-match-line-color-current-line (&optional start end buf face rec)
  "<span class="quote">Highlight and underline current position</span>"
  (let ((args (list (or start (line-beginning-position))
                    (or end (1+ (line-end-position)))
                    buf)))
    (if (not anything-match-line-overlay)
        (setq anything-match-line-overlay (apply 'make-overlay args))
        (apply 'move-overlay anything-match-line-overlay args)))
  (overlay-put anything-match-line-overlay
               'face (or face anything-match-line-overlay-face))
  (when rec
    (goto-char start)
    (recenter)))

(defalias 'anything-persistent-highlight-point 'anything-match-line-color-current-line)


(setq anything-match-line-overlay-face 'anything-overlay-line-face)

(defun anything-match-line-cleanup ()
  (when anything-match-line-overlay
    (delete-overlay anything-match-line-overlay)
    (setq anything-match-line-overlay nil)))

(defun anything-match-line-update ()
  (when anything-match-line-overlay
    (delete-overlay anything-match-line-overlay)
    (anything-match-line-color-current-line)))

(add-hook 'anything-cleanup-hook 'anything-match-line-cleanup)
(add-hook 'anything-after-persistent-action-hook 'anything-match-line-update)

 
<span class="linecomment">;;; Actions Transformers</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Files</span>
(defun anything-c-transform-file-load-el (actions candidate)
  "<span class="quote">Add action to load the file CANDIDATE if it is an emacs lisp
file.  Else return ACTIONS unmodified.</span>"
  (if (member (file-name-extension candidate) '("<span class="quote">el</span>" "<span class="quote">elc</span>"))
      (append actions '(("<span class="quote">Load Emacs Lisp File</span>" . load-file)))
      actions))

(defun anything-c-transform-file-browse-url (actions candidate)
  "<span class="quote">Add an action to browse the file CANDIDATE if it in a html
file or URL.  Else return ACTIONS unmodified.</span>"
  (let ((browse-action '("<span class="quote">Browse with Browser</span>" . browse-url)))
    (cond ((string-match "<span class="quote">^http\\|^ftp</span>" candidate)
           (cons browse-action actions))
          ((string-match "<span class="quote">\\.html?$</span>" candidate)
           (append actions (list browse-action)))
          (t actions))))

<span class="linecomment">;;; Function</span>
(defun anything-c-transform-function-call-interactively (actions candidate)
  "<span class="quote">Add an action to call the function CANDIDATE interactively if
it is a command.  Else return ACTIONS unmodified.</span>"
  (if (commandp (intern-soft candidate))
      (append actions '(("<span class="quote">Call Interactively</span>"
                         .
                         anything-c-call-interactively)))
      actions))

<span class="linecomment">;;;; S-Expressions</span>
(defun anything-c-transform-sexp-eval-command-sexp (actions candidate)
  "<span class="quote">If CANDIDATE's `car' is a command, then add an action to
evaluate it and put it onto the `command-history'.</span>"
  (if (commandp (car (read candidate)))
      <span class="linecomment">;; Make it first entry</span>
      (cons '("<span class="quote">Eval and put onto command-history</span>" .
              (lambda (sexp)
                (let ((sym (read sexp)))
                  (eval sym)
                  (setq command-history
                        (cons sym command-history)))))
            actions)
      actions))

 
<span class="linecomment">;;; Candidate Transformers</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Buffers</span>
(defun anything-c-skip-boring-buffers (buffers)
  (anything-c-skip-entries buffers anything-c-boring-buffer-regexp))

(defun anything-c-skip-current-buffer (buffers)
  "<span class="quote">[DEPRECATED] Skip current buffer in buffer lists.
This transformer should not be used as this is now handled directly
in `anything-c-buffer-list' and `anything-c-highlight-buffers'.</span>"
  (if anything-allow-skipping-current-buffer
      (remove (buffer-name anything-current-buffer) buffers)
      buffers))

(defun anything-c-shadow-boring-buffers (buffers)
  "<span class="quote">Buffers matching `anything-c-boring-buffer-regexp' will be
displayed with the `file-name-shadow' face if available.</span>"
  (anything-c-shadow-entries buffers anything-c-boring-buffer-regexp))

(defvar anything-c-buffer-display-string-functions
  '(anything-c-buffer-display-string--compilation
    anything-c-buffer-display-string--shell
    anything-c-buffer-display-string--eshell)
  "<span class="quote">Functions to setup display string for buffer.

Function has one argument, buffer name.
If it returns string, use it.
If it returns nil, display buffer name.
See `anything-c-buffer-display-string--compilation' for example.</span>")

(defun anything-c-transform-buffer-display-string (buffers)
  "<span class="quote">Setup display string for buffer candidates
using `anything-c-buffer-display-string-functions'.</span>"
  (loop for buf in buffers
        if (consp buf)
        collect buf
        else
        for disp = (progn (set-buffer buf)
                          (run-hook-with-args-until-success
                           'anything-c-buffer-display-string-functions buf))
        collect (if disp (cons disp buf) buf)))

(defun anything-c-buffer-display-string--compilation (buf)
  (anything-aif (car compilation-arguments)
      (format "<span class="quote">%s: %s [%s]</span>" buf it default-directory)))

(defun anything-c-buffer-display-string--eshell (buf)
  (declare (special eshell-history-ring))
  (when (eq major-mode 'eshell-mode)
    (format "<span class="quote">%s: %s [%s]</span>" buf
            (ignore-errors (ring-ref eshell-history-ring 0))
            default-directory)))

(defun anything-c-buffer-display-string--shell (buf)
  (when (eq major-mode 'shell-mode)
    (format "<span class="quote">%s: %s [%s]</span>" buf
            (ignore-errors (ring-ref comint-input-ring 0))
            default-directory)))

<span class="linecomment">;;; Files</span>
(defun anything-c-shadow-boring-files (files)
  "<span class="quote">Files matching `anything-c-boring-file-regexp' will be
displayed with the `file-name-shadow' face if available.</span>"
  (anything-c-shadow-entries files anything-c-boring-file-regexp))

(defun anything-c-skip-boring-files (files)
  "<span class="quote">Files matching `anything-c-boring-file-regexp' will be skipped.</span>"
  (anything-c-skip-entries files anything-c-boring-file-regexp))
<span class="linecomment">;; (anything-c-skip-boring-files '("README" "/src/.svn/hoge"))</span>

(defun anything-c-skip-current-file (files)
  "<span class="quote">Current file will be skipped.</span>"
  (remove (buffer-file-name anything-current-buffer) files))

(defun anything-c-w32-pathname-transformer (args)
  "<span class="quote">Change undesirable features of windows pathnames to ones more acceptable to
other candidate transformers.</span>"
  (if (eq system-type 'windows-nt)
      (anything-transform-mapcar
       (lambda (x)
         (replace-regexp-in-string
          "<span class="quote">/cygdrive/\\(.\\)</span>" "<span class="quote">\\1:</span>"
          (replace-regexp-in-string "<span class="quote">\\\\</span>" "<span class="quote">/</span>" x)))
       args)
    args))

(defun anything-c-shorten-home-path (files)
  "<span class="quote">Replaces /home/user with ~.</span>"
  (let ((home (replace-regexp-in-string "<span class="quote">\\\\</span>" "<span class="quote">/</span>" <span class="linecomment">; stupid Windows...</span>
                                        (getenv "<span class="quote">HOME</span>"))))
    (anything-transform-mapcar
     (lambda (file)
       (if (and (stringp file) (string-match home file))
           (replace-match "<span class="quote">~</span>" nil nil file)
         file))
     files)))

<span class="linecomment">;;; Functions</span>
(defun anything-c-mark-interactive-functions (functions)
  "<span class="quote">Mark interactive functions (commands) with (i) after the function name.</span>"
  (let (list)
    (loop for function in functions
          do (push (cons (concat function
                                 (when (commandp (intern-soft function)) "<span class="quote"> (i)</span>"))
                         function)
                   list)
          finally (return (nreverse list)))))

 
<span class="linecomment">;;; Adaptive Sorting of Candidates</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Internal</span>
(defvar anything-c-adaptive-done nil
  "<span class="quote">nil if history information is not yet stored for the current
selection.</span>")

(defvar anything-c-adaptive-history nil
  "<span class="quote">Contains the stored history information.
Format: ((SOURCE-NAME (SELECTED-CANDIDATE (PATTERN . NUMBER-OF-USE) ...) ...) ...)</span>")

<span class="linecomment">;; Should run at beginning of `anything-initial-setup'.</span>
(add-hook 'anything-before-initialize-hook #'(lambda ()
                                               (when anything-c-use-adaptative-sorting
                                                 (setq anything-c-adaptive-done nil))))

<span class="linecomment">;; Should run at beginning of `anything-exit-minibuffer'.</span>
(add-hook 'anything-before-action-hook #'(lambda ()
                                          (when anything-c-use-adaptative-sorting
                                            (anything-c-adaptive-store-selection))))

<span class="linecomment">;; Should run at beginning of `anything-select-action'.</span>
(add-hook 'anything-select-action-hook #'(lambda ()
                                           (when anything-c-use-adaptative-sorting
                                             (anything-c-adaptive-store-selection))))

(defun anything-c-source-use-adaptative-p (&optional source-name)
  "<span class="quote">Return current source only if it use adaptative history, nil otherwise.</span>"
  (when anything-c-use-adaptative-sorting
    (let* ((source (or source-name (anything-get-current-source)))
           (adapt-source (or (assoc-default 'filtered-candidate-transformer
                                            (assoc (assoc-default 'type source)
                                                   anything-type-attributes))
                             (assoc-default 'candidate-transformer
                                            (assoc (assoc-default 'type source)
                                                   anything-type-attributes))
                             (assoc-default 'filtered-candidate-transformer source)
                             (assoc-default 'candidate-transformer source))))
      (if (listp adapt-source)
          (when (member 'anything-c-adaptive-sort adapt-source) source)
          (when (eq adapt-source 'anything-c-adaptive-sort) source)))))

(defun anything-c-adaptive-store-selection ()
  "<span class="quote">Store history information for the selected candidate.</span>"
  (unless anything-c-adaptive-done
    (setq anything-c-adaptive-done t)
    (let ((source (anything-c-source-use-adaptative-p)))
      (when source
        (let* ((source-name (or (assoc-default 'type source)
                                (assoc-default 'name source)))
               (source-info (or (assoc source-name anything-c-adaptive-history)
                                (progn
                                  (push (list source-name) anything-c-adaptive-history)
                                  (car anything-c-adaptive-history))))
               (selection (anything-get-selection))
               (selection-info (progn
                                 (setcdr source-info
                                         (cons
                                          (let ((found (assoc selection (cdr source-info))))
                                            (if (not found)
                                                <span class="linecomment">;; new entry</span>
                                                (list selection)

                                                <span class="linecomment">;; move entry to the beginning of the</span>
                                                <span class="linecomment">;; list, so that it doesn't get</span>
                                                <span class="linecomment">;; trimmed when the history is</span>
                                                <span class="linecomment">;; truncated</span>
                                                (setcdr source-info
                                                        (delete found (cdr source-info)))
                                                found))
                                          (cdr source-info)))
                                 (cadr source-info)))
               (pattern-info (progn
                               (setcdr selection-info
                                       (cons
                                        (let ((found (assoc anything-pattern (cdr selection-info))))
                                          (if (not found)
                                              <span class="linecomment">;; new entry</span>
                                              (cons anything-pattern 0)

                                              <span class="linecomment">;; move entry to the beginning of the</span>
                                              <span class="linecomment">;; list, so if two patterns used the</span>
                                              <span class="linecomment">;; same number of times then the one</span>
                                              <span class="linecomment">;; used last appears first in the list</span>
                                              (setcdr selection-info
                                                      (delete found (cdr selection-info)))
                                              found))
                                        (cdr selection-info)))
                               (cadr selection-info))))

          <span class="linecomment">;; increase usage count</span>
          (setcdr pattern-info (1+ (cdr pattern-info)))

          <span class="linecomment">;; truncate history if needed</span>
          (if (&gt; (length (cdr selection-info)) anything-c-adaptive-history-length)
              (setcdr selection-info
                      (subseq (cdr selection-info) 0 anything-c-adaptive-history-length))))))))

(defun anything-c-adaptative-maybe-load-history ()
  (when (and anything-c-use-adaptative-sorting
             (file-readable-p anything-c-adaptive-history-file))
    (load-file anything-c-adaptive-history-file)))

(add-hook 'emacs-startup-hook 'anything-c-adaptative-maybe-load-history)
(add-hook 'kill-emacs-hook 'anything-c-adaptive-save-history)

(defun anything-c-adaptive-save-history (&optional arg)
  "<span class="quote">Save history information to file given by `anything-c-adaptive-history-file'.</span>"
  (interactive "<span class="quote">p</span>")
  (when anything-c-use-adaptative-sorting
    (with-temp-buffer
      (insert
       "<span class="quote">;; -*- mode: emacs-lisp -*-\n</span>"
       "<span class="quote">;; History entries used for anything adaptive display.\n</span>")
      (prin1 `(setq anything-c-adaptive-history ',anything-c-adaptive-history)
             (current-buffer))
      (insert ?\n)
      (write-region (point-min) (point-max) anything-c-adaptive-history-file nil
                    (unless arg 'quiet)))))

(defun anything-c-adaptive-sort (candidates source)
  "<span class="quote">Sort the CANDIDATES for SOURCE by usage frequency.
This is a filtered candidate transformer you can use for the
attribute `filtered-candidate-transformer' of a source in
`anything-sources' or a type in `anything-type-attributes'.</span>"
  (let* ((source-name (or (assoc-default 'type source)
                          (assoc-default 'name source)))
         (source-info (assoc source-name anything-c-adaptive-history)))
    (if source-info
        (let ((usage
               <span class="linecomment">;; ... assemble a list containing the (CANIDATE . USAGE-COUNT)</span>
               <span class="linecomment">;; pairs</span>
               (mapcar (lambda (candidate-info)
                         (let ((count 0))
                           (dolist (pattern-info (cdr candidate-info))
                             (if (not (equal (car pattern-info)
                                             anything-pattern))
                                 (incf count (cdr pattern-info))

                                 <span class="linecomment">;; if current pattern is equal to the previously</span>
                                 <span class="linecomment">;; used one then this candidate has priority</span>
                                 <span class="linecomment">;; (that's why its count is boosted by 10000) and</span>
                                 <span class="linecomment">;; it only has to compete with other candidates</span>
                                 <span class="linecomment">;; which were also selected with the same pattern</span>
                                 (setq count (+ 10000 (cdr pattern-info)))
                                 (return)))
                           (cons (car candidate-info) count)))
                       (cdr source-info)))
              sorted)
          (if (and usage (consp usage))
              <span class="linecomment">;; sort the list in descending order, so candidates with highest</span>
              <span class="linecomment">;; priorty come first</span>
              (progn
                (setq usage (sort usage (lambda (first second)
                                          (&gt; (cdr first) (cdr second)))))

                <span class="linecomment">;; put those candidates first which have the highest usage count</span>
                (dolist (info usage)
                  (when (member* (car info) candidates
                                 :test 'anything-c-adaptive-compare)
                    (push (car info) sorted)
                    (setq candidates (remove* (car info) candidates
                                              :test 'anything-c-adaptive-compare))))

                <span class="linecomment">;; and append the rest</span>
                (append (reverse sorted) candidates nil))
              (message "<span class="quote">Your `%s' is maybe corrupted or too old, \
you should reinitialize it with `anything-c-reset-adaptative-history'</span>"
                       anything-c-adaptive-history-file)
              (sit-for 1)
              candidates))
        <span class="linecomment">;; if there is no information stored for this source then do nothing</span>
        candidates)))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-reset-adaptative-history ()
  "<span class="quote">Delete all `anything-c-adaptive-history' and his file.
Useful when you have a old or corrupted `anything-c-adaptive-history-file'.</span>"
  (interactive)
  (when (y-or-n-p "<span class="quote">Really delete all your `anything-c-adaptive-history'? </span>")
    (setq anything-c-adaptive-history nil)
    (delete-file anything-c-adaptive-history-file)))

(defun anything-c-adaptive-compare (x y)
  "<span class="quote">Compare candidates X and Y taking into account that the
candidate can be in (DISPLAY . REAL) format.</span>"
  (equal (if (listp x)
             (cdr x)
             x)
         (if (listp y)
             (cdr y)
             y)))


 
<span class="linecomment">;;; Outliner</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-outline-goto-near-line-flag t)
(defvar anything-outline-using nil)
(defun anything-after-update-hook--outline ()
  (if (and (eq anything-outline-using t)
           (eq anything-outline-goto-near-line-flag t))
      (anything-outline-goto-near-line)))
(add-hook 'anything-after-update-hook 'anything-after-update-hook--outline)

(defun anything-outline-goto-near-line ()
  (with-anything-window
    <span class="linecomment">;; TODO need consideration whether to update position by every input.</span>
    (when t <span class="linecomment">; (equal anything-pattern "")</span>
      (anything-goto-line 2)
      (let ((lineno (with-anything-current-buffer
                      (line-number-at-pos (car anything-current-position)))))
        (block exit
          (while (&lt;= (progn (skip-chars-forward "<span class="quote"> </span>")
                            (or (number-at-point) lineno))
                     lineno)
            (forward-line 1)
            (when (eobp)
              (forward-line -1)
              (return-from exit))))
        (forward-line -1)
        (and (bobp) (forward-line 1))
        (and (anything-pos-header-line-p) (forward-line -2))
        (anything-mark-current-line)))))


 
<span class="linecomment">;;; Plug-in</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Plug-in: info-index</span>
(defun* anything-c-info-init (&optional (file (anything-attr 'info-file)))
  (let (result)
    (unless (anything-candidate-buffer)
      (save-window-excursion
        (info file)
        (let (Info-history
              (tobuf (anything-candidate-buffer 'global))
              (infobuf (current-buffer))
              s e)
          (dolist (node (or (anything-attr 'index-nodes) (Info-index-nodes)))
            (Info-goto-node node)
            (goto-char (point-min))
            (while (search-forward "<span class="quote">\n* </span>" nil t)
              (unless (search-forward "<span class="quote">Menu:\n</span>" (1+ (point-at-eol)) t)
                '(save-current-buffer (buffer-substring-no-properties (point-at-bol) (point-at-eol)) result)
                (setq s (point-at-bol)
                      e (point-at-eol))
                (with-current-buffer tobuf
                  (insert-buffer-substring infobuf s e)
                  (insert "<span class="quote">\n</span>"))))))))))

(defun anything-c-info-goto (node-line)
  (Info-goto-node (car node-line))
  (anything-goto-line (cdr node-line)))

(defun anything-c-info-display-to-real (line)
  (and (string-match
        <span class="linecomment">;; This regexp is stolen from Info-apropos-matches</span>
        "<span class="quote">\\* +\\([^\n]*.+[^\n]*\\):[ \t]+\\([^\n]*\\)\\.\\(?:[ \t\n]*(line +\\([0-9]+\\))\\)?</span>" line)
       (cons (format "<span class="quote">(%s)%s</span>" (anything-attr 'info-file) (match-string 2 line))
             (string-to-number (or (match-string 3 line) "<span class="quote">1</span>")))))

(defun anything-c-make-info-source (source file)
  `(,@source
    (name . ,(concat "<span class="quote">Info Index: </span>" file))
    (info-file . ,file)
    (init . anything-c-info-init)
    (display-to-real . anything-c-info-display-to-real)
    (get-line . buffer-substring)
    (candidates-in-buffer)
    (action ("<span class="quote">Goto node</span>" . anything-c-info-goto))))

(defun anything-compile-source--info-index (source)
  (anything-aif (anything-interpret-value (assoc-default 'info-index source))
      (anything-c-make-info-source source it)
    source))
(add-to-list 'anything-compile-source-functions 'anything-compile-source--info-index)

(anything-document-attribute 'info-index "<span class="quote">info-index plugin</span>"
                             "<span class="quote">Create a source of info index very easily.

ex. (defvar anything-c-source-info-wget '((info-index . \"wget\"))</span>")

(anything-document-attribute 'index-nodes "<span class="quote">info-index plugin (optional)</span>"
                             "<span class="quote">Index nodes of info file.

If it is omitted, `Info-index-nodes' is used to collect index nodes.
Some info files are missing index specification.

ex. See `anything-c-source-info-screen'.</span>")

<span class="linecomment">;; Plug-in: candidates-file</span>
(defun anything-compile-source--candidates-file (source)
  (if (assoc-default 'candidates-file source)
      `((init anything-p-candidats-file-init
              ,@(let ((orig-init (assoc-default 'init source)))
                     (cond ((null orig-init) nil)
                           ((functionp orig-init) (list orig-init))
                           (t orig-init))))
        (candidates-in-buffer)
        ,@source)
      source))
(add-to-list 'anything-compile-source-functions 'anything-compile-source--candidates-file)

(defun anything-p-candidats-file-init ()
  (destructuring-bind (file &optional updating)
      (anything-mklist (anything-attr 'candidates-file))
    (setq file (anything-interpret-value file))
    (with-current-buffer (anything-candidate-buffer (find-file-noselect file))
      (when updating
        (buffer-disable-undo)
        (font-lock-mode -1)
        (auto-revert-mode 1)))))

(anything-document-attribute 'candidates-file "<span class="quote">candidates-file plugin</span>"
                             "<span class="quote">Use a file as the candidates buffer.

1st argument is a filename, string or function name or variable name.
If optional 2nd argument is non-nil, the file opened with `auto-revert-mode'.</span>")

<span class="linecomment">;; Plug-in: headline</span>
(defun anything-compile-source--anything-headline (source)
  (if (assoc-default 'headline source)
      (append '((init . anything-headline-init)
                (get-line . buffer-substring)
                (type . line))
              source
              '((candidates-in-buffer)
                (persistent-help . "<span class="quote">Show this line</span>")))
      source))
(add-to-list 'anything-compile-source-functions 'anything-compile-source--anything-headline)

(defun anything-headline-init ()
  (when (and (anything-current-buffer-is-modified)
             (with-anything-current-buffer
               (eval (or (anything-attr 'condition) t))))
    (anything-headline-make-candidate-buffer
     (anything-interpret-value (anything-attr 'headline))
     (anything-interpret-value (anything-attr 'subexp)))))

(anything-document-attribute 'headline "<span class="quote">Headline plug-in</span>"
                             "<span class="quote">Regexp string for anything-headline to scan.</span>")
(anything-document-attribute 'condition "<span class="quote">Headline plug-in</span>"
                             "<span class="quote">A sexp representing the condition to use anything-headline.</span>")
(anything-document-attribute 'subexp "<span class="quote">Headline plug-in</span>"
                             "<span class="quote">Display (match-string-no-properties subexp).</span>")

<span class="linecomment">;; Le Wang: Note on how `anything-head-line-get-candidates' works with a list</span>
<span class="linecomment">;; of regexps.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   1. Create list of ((title . start-of-match) . hiearchy)</span>
<span class="linecomment">;;   2. Sort this list by start-of-match.</span>
<span class="linecomment">;;   3. Go through sorted list and return titles that reflect full hiearchy.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; It's quite brilliantly written.</span>
<span class="linecomment">;;</span>


(defun anything-headline-get-candidates (regexp subexp)
  (with-anything-current-buffer
    (save-excursion
      (goto-char (point-min))
      (if (functionp regexp) (setq regexp (funcall regexp)))
      (let (hierarchy curhead)
        (flet ((matched ()
                 (if (numberp subexp)
                     (cons (match-string-no-properties subexp) (match-beginning subexp))
                     (cons (buffer-substring (point-at-bol) (point-at-eol))
                           (point-at-bol))))
               (hierarchies (headlines)
                 (1+ (loop for (_ . hierarchy) in headlines
                           maximize hierarchy)))
               (vector-0-n (v n)
                 (loop for i from 0 to hierarchy
                       collecting (aref curhead i)))
               (arrange (headlines)
                 (unless (null headlines) <span class="linecomment">; FIX headlines empty bug!</span>
                   (loop with curhead = (make-vector (hierarchies headlines) "<span class="quote"></span>")
                         for ((str . pt) . hierarchy) in headlines
                         do (aset curhead hierarchy str)
                         collecting
                         (cons
                          (format "<span class="quote">H%d:%s</span>" (1+ hierarchy)
                                  (mapconcat 'identity (vector-0-n curhead hierarchy) "<span class="quote"> / </span>"))
                          pt)))))
          (if (listp regexp)
              (arrange
               (sort
                (loop for re in regexp
                      for hierarchy from 0
                      do (goto-char (point-min))
                      appending
                      (loop
                            while (re-search-forward re nil t)
                            collect (cons (matched) hierarchy)))
                (lambda (a b) (&gt; (cdar b) (cdar a)))))
              (loop while (re-search-forward regexp nil t)
                    collect (matched))))))))


(defun anything-headline-make-candidate-buffer (regexp subexp)
  (with-current-buffer (anything-candidate-buffer 'local)
    (loop for (content . pos) in (anything-headline-get-candidates regexp subexp)
          do (insert
              (format "<span class="quote">%5d:%s\n</span>"
                      (with-anything-current-buffer
                        (line-number-at-pos pos))
                      content)))))

(defun anything-headline-goto-position (pos recenter)
  (goto-char pos)
  (unless recenter
    (set-window-start (get-buffer-window anything-current-buffer) (point))))


<span class="linecomment">;; Plug-in: persistent-help</span>
(defun anything-compile-source--persistent-help (source)
  (append source '((header-line . anything-persistent-help-string))))
(add-to-list 'anything-compile-source-functions 'anything-compile-source--persistent-help)

(defun anything-persistent-help-string ()
  (substitute-command-keys
   (concat "<span class="quote">\\&lt;anything-map&gt;\\[anything-execute-persistent-action]: </span>"
           (or (anything-interpret-value (anything-attr 'persistent-help))
               (anything-aif (or (assoc-default 'persistent-action
                                                (anything-get-current-source))
                                 (assoc-default 'action
                                                (anything-get-current-source)))
                   (cond ((symbolp it) (symbol-name it))
                         ((listp it) (or (ignore-errors (caar it))  "<span class="quote"></span>"))))
               "<span class="quote"></span>")
           "<span class="quote"> (keeping session)</span>")))

(anything-document-attribute 'persistent-help "<span class="quote">persistent-help plug-in</span>"
                             "<span class="quote">A string to explain persistent-action of this source.
It also accepts a function or a variable name.</span>")

<span class="linecomment">;;; (anything '(((name . "persistent-help test")(candidates "a")(persistent-help . "TEST"))))</span>

<span class="linecomment">;; Plug-in: Type customize</span>
(defun anything-c-uniq-list (lst)
  "<span class="quote">Like `remove-duplicates' in CL.
But cut deeper duplicates and test by `equal'. </span>"
  (reverse (remove-duplicates (reverse lst) :test 'equal)))
(defvar anything-additional-type-attributes nil)
(defun anything-c-arrange-type-attribute (type spec)
  "<span class="quote">Override type attributes by `define-anything-type-attribute'.

The SPEC is like source. The symbol `REST' is replaced
with original attribute value.

 Example: Set `play-sound-file' as default action
   (anything-c-arrange-type-attribute 'file
      '((action (\"Play sound\" . play-sound-file)
         REST ;; Rest of actions (find-file, find-file-other-window, etc...).</span>"
  (setq anything-additional-type-attributes
        (delete (assq type anything-additional-type-attributes)
                anything-additional-type-attributes))
  (add-to-list 'anything-additional-type-attributes
               (cons type
                     (loop with typeattr = (assoc-default
                                            type anything-type-attributes)
                           for (attr . value) in spec
                           if (listp value)
                           collect (cons attr
                                         (anything-c-uniq-list
                                          (loop for v in value
                                                if (eq v 'REST)
                                                append
                                                (assoc-default attr typeattr)
                                                else
                                                collect v)))
                           else
                           collect (cons attr value)))))
(put 'anything-c-arrange-type-attribute 'lisp-indent-function 1)

(defun anything-compile-source--type-customize (source)
  (anything-aif (assoc-default (assoc-default 'type source)
                               anything-additional-type-attributes)
      (append it source)
    source))
(add-to-list 'anything-compile-source-functions
             'anything-compile-source--type-customize t)

<span class="linecomment">;; Plug-in: default-action</span>
(defun anything-compile-source--default-action (source)
  (anything-aif (assoc-default 'default-action source)
      (append `((action ,it ,@(remove it (assoc-default 'action source))))
              source)
    source))
(add-to-list 'anything-compile-source-functions
             'anything-compile-source--default-action t)
(anything-document-attribute 'default-action "<span class="quote">default-action plug-in</span>"
                             "<span class="quote">Default action.</span>")

 
<span class="linecomment">;;; Type Attributes</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(define-anything-type-attribute 'buffer
    `((action
       ("<span class="quote">Switch to buffer</span>" . anything-c-switch-to-buffer)
       ,(and (locate-library "<span class="quote">popwin</span>") '("<span class="quote">Switch to buffer in popup window</span>" . popwin:popup-buffer))
       ("<span class="quote">Switch to buffer other window</span>" . switch-to-buffer-other-window)
       ("<span class="quote">Switch to buffer other frame</span>" . switch-to-buffer-other-frame)
       ,(and (locate-library "<span class="quote">elscreen</span>") '("<span class="quote">Display buffer in Elscreen</span>" . anything-find-buffer-on-elscreen))
       ("<span class="quote">Query replace regexp</span>" . anything-c-buffer-query-replace-regexp)
       ("<span class="quote">Query replace</span>" . anything-c-buffer-query-replace)
       ("<span class="quote">View buffer</span>" . view-buffer)
       ("<span class="quote">Display buffer</span>"   . display-buffer)
       ("<span class="quote">Grep buffers (C-u grep all buffers)</span>" . anything-c-zgrep-buffers)
       ("<span class="quote">Revert buffer(s)</span>" . anything-revert-marked-buffers)
       ("<span class="quote">Insert buffer</span>" . insert-buffer)
       ("<span class="quote">Kill buffer(s)</span>" . anything-kill-marked-buffers)
       ("<span class="quote">Diff with file</span>" . diff-buffer-with-file)
       ("<span class="quote">Ediff Marked buffers</span>" . anything-ediff-marked-buffers)
       ("<span class="quote">Ediff Merge marked buffers</span>" . (lambda (candidate)
                                         (anything-ediff-marked-buffers candidate t))))
      (persistent-help . "<span class="quote">Show this buffer</span>")
      (candidate-transformer anything-c-skip-boring-buffers
                             anything-c-transform-buffer-display-string))
  "<span class="quote">Buffer or buffer name.</span>")

(define-anything-type-attribute 'file
    `((action
       ("<span class="quote">Find file</span>" . anything-find-many-files)
       ,(and (locate-library "<span class="quote">popwin</span>") '("<span class="quote">Find file in popup window</span>" . popwin:find-file))
       ("<span class="quote">Find file as root</span>" . anything-find-file-as-root)
       ("<span class="quote">Find file other window</span>" . find-file-other-window)
       ("<span class="quote">Find file other frame</span>" . find-file-other-frame)
       ("<span class="quote">Open dired in file's directory</span>" . anything-c-open-dired)
       ("<span class="quote">Grep File(s) `C-u recurse'</span>" . anything-find-files-grep)
       ("<span class="quote">Zgrep File(s) `C-u Recurse'</span>" . anything-ff-zgrep)
       ("<span class="quote">Pdfgrep File(s)</span>" . anything-ff-pdfgrep)
       ("<span class="quote">Checksum File</span>" . anything-ff-checksum)
       ("<span class="quote">Ediff File</span>" . anything-find-files-ediff-files)
       ("<span class="quote">Ediff Merge File</span>" . anything-find-files-ediff-merge-files)
       ("<span class="quote">View file</span>" . view-file)
       ("<span class="quote">Insert file</span>" . insert-file)
       ("<span class="quote">Delete file(s)</span>" . anything-delete-marked-files)
       ("<span class="quote">Open file externally (C-u to choose)</span>" . anything-c-open-file-externally)
       ("<span class="quote">Open file with default tool</span>" . anything-c-open-file-with-default-tool)
       ("<span class="quote">Find file in hex dump</span>" . hexl-find-file))
      (persistent-help . "<span class="quote">Show this file</span>")
      (action-transformer anything-c-transform-file-load-el
                          anything-c-transform-file-browse-url)
      (candidate-transformer anything-c-w32-pathname-transformer
                             anything-c-skip-current-file
                             anything-c-skip-boring-files
                             anything-c-shorten-home-path))
  "<span class="quote">File name.</span>")

(let ((actions '(("<span class="quote">Describe command</span>" . describe-function)
                 ("<span class="quote">Add command to kill ring</span>" . anything-c-kill-new)
                 ("<span class="quote">Go to command's definition</span>" . find-function)
                 ("<span class="quote">Debug on entry</span>" . debug-on-entry)
                 ("<span class="quote">Cancel debug on entry</span>" . cancel-debug-on-entry)
                 ("<span class="quote">Trace function</span>" . trace-function)
                 ("<span class="quote">Trace function (background)</span>" . trace-function-background)
                 ("<span class="quote">Untrace function</span>" . untrace-function))))
  (define-anything-type-attribute 'command
      `((action ("<span class="quote">Call interactively</span>" . anything-c-call-interactively)
                ,@actions)
        (coerce . anything-c-symbolify)
        (persistent-action . describe-function))
    "<span class="quote">Command. (string or symbol)</span>")

  (define-anything-type-attribute 'function
      `((action . ,actions)
        (action-transformer anything-c-transform-function-call-interactively)
        (candidate-transformer anything-c-mark-interactive-functions)
        (coerce . anything-c-symbolify))
    "<span class="quote">Function. (string or symbol)</span>"))

(define-anything-type-attribute 'variable
    '((action ("<span class="quote">Describe variable</span>" . describe-variable)
       ("<span class="quote">Add variable to kill ring</span>" . anything-c-kill-new)
       ("<span class="quote">Go to variable's definition</span>" . find-variable)
       ("<span class="quote">Set variable</span>" . anything-c-set-variable))
      (coerce . anything-c-symbolify))
  "<span class="quote">Variable.</span>")

(define-anything-type-attribute 'sexp
    '((action ("<span class="quote">Eval s-expression</span>" . (lambda (c) (eval (read c))))
       ("<span class="quote">Add s-expression to kill ring</span>" . kill-new))
      (action-transformer anything-c-transform-sexp-eval-command-sexp))
  "<span class="quote">String representing S-Expressions.</span>")

(define-anything-type-attribute 'bookmark
    `((coerce . anything-bookmark-get-bookmark-from-name)
      (action
       ("<span class="quote">Jump to bookmark</span>" . anything-c-bookmark-jump)
       ("<span class="quote">Jump to BM other window</span>" . bookmark-jump-other-window)
       ("<span class="quote">Bookmark edit annotation</span>" . bookmark-edit-annotation)
       ("<span class="quote">Bookmark show annotation</span>" . bookmark-show-annotation)
       ("<span class="quote">Delete bookmark(s)</span>" . anything-delete-marked-bookmarks)
       ,@(and (locate-library "<span class="quote">bookmark-extensions</span>")
              `(("<span class="quote">Edit Bookmark</span>" . bmkext-edit-bookmark)))
       ("<span class="quote">Rename bookmark</span>" . bookmark-rename)
       ("<span class="quote">Relocate bookmark</span>" . bookmark-relocate))
      (keymap . ,anything-c-bookmark-map)
      (mode-line . anything-bookmark-mode-line-string))
  "<span class="quote">Bookmark name.</span>")

(define-anything-type-attribute 'line
    '((display-to-real . anything-c-display-to-real-line)
      (action ("<span class="quote">Go to Line</span>" . anything-c-action-line-goto)))
  "<span class="quote">LINENO:CONTENT string, eg. \"  16:foo\".

Optional `target-file' attribute is a name of target file.

Optional `before-jump-hook' attribute is a function with no
arguments which is called before jumping to position.

Optional `after-jump-hook' attribute is a function with no
arguments which is called after jumping to position.

If `adjust' attribute is specified, searches the line whose
content is CONTENT near the LINENO.

If `recenter' attribute is specified, the line is displayed at
the center of window, otherwise at the top of window.
</span>")

(define-anything-type-attribute 'file-line
    `((filtered-candidate-transformer anything-c-filtered-candidate-transformer-file-line)
      (multiline)
      (action ("<span class="quote">Go to</span>" . anything-c-action-file-line-goto)))
  "<span class="quote">FILENAME:LINENO:CONTENT string, eg. \"~/.emacs:16:;; comment\".

Optional `default-directory' attribute is a default-directory
FILENAME is interpreted.

Optional `before-jump-hook' attribute is a function with no
arguments which is called before jumping to position.

Optional `after-jump-hook' attribute is a function with no
arguments which is called after jumping to position.

If `adjust' attribute is specified, searches the line whose
content is CONTENT near the LINENO.

If `recenter' attribute is specified, the line is displayed at
the center of window, otherwise at the top of window.
</span>")

(define-anything-type-attribute 'timer
    '((real-to-display . anything-c-timer-real-to-display)
      (action ("<span class="quote">Cancel Timer</span>" . cancel-timer)
       ("<span class="quote">Describe Function</span>" . (lambda (tm) (describe-function (timer--function tm))))
       ("<span class="quote">Find Function</span>" . (lambda (tm) (find-function (timer--function tm)))))
      (persistent-action . (lambda (tm) (describe-function (timer--function tm))))
      (persistent-help . "<span class="quote">Describe Function</span>"))
  "<span class="quote">Timer.</span>")

 
<span class="linecomment">;;; Default `anything-sources'</span>
<span class="linecomment">;; Setting `anything-sources' is DEPRECATED, but it seems that newbies</span>
<span class="linecomment">;; tend to invoke M-x anything directly. So I offer default setting.</span>
(setq anything-sources
      '(anything-c-source-buffers-list
        anything-c-source-recentf
        anything-c-source-files-in-current-dir+))

 
<span class="linecomment">;;; Preconfigured Anything</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;###autoload</span>
(defun anything-mini ()
  "<span class="quote">Preconfigured `anything' lightweight version \(buffer -&gt; recentf\).</span>"
  (interactive)
  (anything-other-buffer '(anything-c-source-buffers-list
                           anything-c-source-recentf
                           anything-c-source-buffer-not-found)
                         "<span class="quote">*anything mini*</span>"))
<span class="linecomment">;;;###autoload</span>
(defun anything-for-files ()
  "<span class="quote">Preconfigured `anything' for opening files.
ffap -&gt; recentf -&gt; buffer -&gt; bookmark -&gt; file-cache -&gt; files-in-current-dir -&gt; locate.</span>"
  (interactive)
  (anything-other-buffer anything-for-files-prefered-list "<span class="quote">*anything for files*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-recentf ()
  "<span class="quote">Preconfigured `anything' for `recentf'.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-recentf "<span class="quote">*anything recentf*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-info-at-point (arg)
  "<span class="quote">Preconfigured `anything' for searching info at point.
With a prefix-arg insert symbol at point.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((anything-c-google-suggest-default-function
         'anything-c-google-suggest-emacs-lisp))
    (anything :sources '(anything-c-source-info-elisp
                         anything-c-source-info-cl
                         anything-c-source-info-pages
                         anything-c-source-google-suggest)
              :input (and arg (thing-at-point 'symbol))
              :buffer "<span class="quote">*anything info*</span>")))

<span class="linecomment">;;;###autoload</span>
(defun anything-show-kill-ring ()
  "<span class="quote">Preconfigured `anything' for `kill-ring'.
It is drop-in replacement of `yank-pop'.
You may bind this command to M-y.
First call open the kill-ring browser, next calls move to next line.</span>"
  (interactive)
  (let ((enable-recursive-minibuffers t))
    (anything :sources 'anything-c-source-kill-ring
              :buffer "<span class="quote">*anything kill-ring*</span>")))

<span class="linecomment">;;;###autoload</span>
(defun anything-minibuffer-history ()
  "<span class="quote">Preconfigured `anything' for `minibuffer-history'.</span>"
  (interactive)
  (let ((enable-recursive-minibuffers t))
    (anything-other-buffer 'anything-c-source-minibuffer-history
                           "<span class="quote">*anything minibuffer-history*</span>")))

<span class="linecomment">;;;###autoload</span>
(defun anything-gentoo ()
  "<span class="quote">Preconfigured `anything' for gentoo linux.</span>"
  (interactive)
  (anything-other-buffer '(anything-c-source-gentoo
                           anything-c-source-use-flags)
                         "<span class="quote">*anything gentoo*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-imenu ()
  "<span class="quote">Preconfigured `anything' for `imenu'.</span>"
  (interactive)
  (anything :sources 'anything-c-source-imenu
            :buffer "<span class="quote">*anything imenu*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-google-suggest ()
  "<span class="quote">Preconfigured `anything' for google search with google suggest.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-google-suggest "<span class="quote">*anything google*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-yahoo-suggest ()
  "<span class="quote">Preconfigured `anything' for Yahoo searching with Yahoo suggest.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-yahoo-suggest "<span class="quote">*anything yahoo*</span>"))

<span class="linecomment">;;; Converted from anything-show-*-only</span>
<span class="linecomment">;;;###autoload</span>
(defun anything-for-buffers ()
  "<span class="quote">Preconfigured `anything' for buffers.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-buffers "<span class="quote">*anything for buffers*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-buffers-list ()
  "<span class="quote">Preconfigured `anything' to list buffers.
It is an enhanced version of `anything-for-buffers'.</span>"
  (interactive)
  (anything :sources '(anything-c-source-buffers-list
                       anything-c-source-buffer-not-found)
            :buffer "<span class="quote">*anything buffers*</span>" :keymap anything-c-buffer-map))

(defalias 'anything-buffers+ 'anything-buffers-list
  "<span class="quote">Preconfigured `anything' to list buffers.
It is an alias of `anything-buffers-list'.</span>")

<span class="linecomment">;;;###autoload</span>
(defun anything-bbdb ()
  "<span class="quote">Preconfigured `anything' for BBDB.

Needs BBDB.

http://bbdb.sourceforge.net/</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-bbdb "<span class="quote">*anything bbdb*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-locate (arg)
  "<span class="quote">Preconfigured `anything' for Locate.
Note: you can add locate options after entering pattern.
See 'man locate' for valid options.

You can specify a specific database with prefix argument ARG \(C-u\).
Many databases can be used: navigate and mark them.
See also `anything-locate-with-db'.

To create a user specific db, use
\"updatedb -l 0 -o db_path -U directory\".
Where db_path is a filename matched by
`anything-locate-db-file-regexp'.</span>"
  (interactive "<span class="quote">P</span>")
  (setq anything-ff-default-directory default-directory)
  (anything-locate-1 arg))

<span class="linecomment">;;;###autoload</span>
(defun anything-w3m-bookmarks ()
  "<span class="quote">Preconfigured `anything' for w3m bookmark.

Needs w3m and emacs-w3m.

http://w3m.sourceforge.net/
http://emacs-w3m.namazu.org/</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-w3m-bookmarks
                         "<span class="quote">*anything w3m bookmarks*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-firefox-bookmarks ()
  "<span class="quote">Preconfigured `anything' for firefox bookmark.
You will have to enable html bookmarks in firefox:
open about:config in firefox and double click on this line to enable value \
to true:

user_pref(\"browser.bookmarks.autoExportHTML\", false);

You should have now:

user_pref(\"browser.bookmarks.autoExportHTML\", true);

After closing firefox, you will be able to browse you bookmarks.
</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-firefox-bookmarks
                         "<span class="quote">*Anything Firefox*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-colors ()
  "<span class="quote">Preconfigured `anything' for color.</span>"
  (interactive)
  (anything-other-buffer
   '(anything-c-source-colors anything-c-source-customize-face)
   "<span class="quote">*anything colors*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-bookmarks ()
  "<span class="quote">Preconfigured `anything' for bookmarks.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-bookmarks "<span class="quote">*anything bookmarks*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-pp-bookmarks ()
  "<span class="quote">Preconfigured `anything' for bookmarks (pretty-printed).</span>"
  (interactive)
  (anything-other-buffer '(anything-c-source-bookmarks-local
                           anything-c-source-bookmarks-su
                           anything-c-source-bookmarks-ssh)
                         "<span class="quote">*anything pp bookmarks*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-insert-latex-math ()
  "<span class="quote">Preconfigured anything for latex math symbols completion.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-latex-math "<span class="quote">*anything latex*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-register ()
  "<span class="quote">Preconfigured `anything' for Emacs registers.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-register "<span class="quote">*anything register*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-man-woman ()
  "<span class="quote">Preconfigured `anything' for Man and Woman pages.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-man-pages "<span class="quote">*Anything man woman*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-org-keywords ()
  "<span class="quote">Preconfigured `anything' for org keywords.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-org-keywords "<span class="quote">*org keywords*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-emms ()
  "<span class="quote">Preconfigured `anything' for emms sources.</span>"
  (interactive)
  (anything :sources '(anything-c-source-emms-streams
                       anything-c-source-emms-files
                       anything-c-source-emms-dired)
            :buffer "<span class="quote">*Anything Emms*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-eev-anchors ()
  "<span class="quote">Preconfigured `anything' for eev anchors.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-eev-anchor "<span class="quote">*Anything eev anchors*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-bm-list ()
  "<span class="quote">Preconfigured `anything' for visible bookmarks.

Needs bm.el

http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el</span>"
  (interactive)
  (let ((anything-outline-using t))
    (anything-other-buffer 'anything-c-source-bm "<span class="quote">*anything bm list*</span>")))

<span class="linecomment">;;;###autoload</span>
(defun anything-timers ()
  "<span class="quote">Preconfigured `anything' for timers.</span>"
  (interactive)
  (anything-other-buffer '(anything-c-source-absolute-time-timers
                           anything-c-source-idle-time-timers)
                         "<span class="quote">*anything timers*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-list-emacs-process ()
  "<span class="quote">Preconfigured `anything' for emacs process.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-emacs-process "<span class="quote">*anything process*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-occur ()
  "<span class="quote">Preconfigured Anything for Occur source.
If region is active, search only in region,
otherwise search in whole buffer.</span>"
  (interactive)
  (let ((anything-compile-source-functions
         <span class="linecomment">;; rule out anything-match-plugin because the input is one regexp.</span>
         (delq 'anything-compile-source--match-plugin
               (copy-sequence anything-compile-source-functions))))
    (anything :sources 'anything-c-source-occur
              :buffer "<span class="quote">*Anything Occur*</span>"
              :history 'anything-c-grep-history)))

<span class="linecomment">;;;###autoload</span>
(defun anything-browse-code ()
  "<span class="quote">Preconfigured anything to browse code.</span>"
  (interactive)
  (anything :sources 'anything-c-source-browse-code
            :buffer "<span class="quote">*anything browse code*</span>"
            :default (thing-at-point 'symbol)))

<span class="linecomment">;;;###autoload</span>
(defun anything-org-headlines ()
  "<span class="quote">Preconfigured anything to show org headlines.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-org-headline "<span class="quote">*org headlines*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-regexp ()
  "<span class="quote">Preconfigured anything to build regexps.
`query-replace-regexp' can be run from there against found regexp.</span>"
  (interactive)
  (save-restriction
    (let ((anything-compile-source-functions
           <span class="linecomment">;; rule out anything-match-plugin because the input is one regexp.</span>
           (delq 'anything-compile-source--match-plugin
                 (copy-sequence anything-compile-source-functions))))
      (when (and (anything-region-active-p)
                 <span class="linecomment">;; Don't narrow to region if buffer is already narrowed.</span>
                 (not (anything-current-buffer-narrowed-p)))
        (narrow-to-region (region-beginning) (region-end)))
      (anything :sources anything-c-source-regexp
                :buffer "<span class="quote">*anything regexp*</span>"
                :prompt "<span class="quote">Regexp: </span>"
                :history 'anything-build-regexp-history))))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-copy-files-async ()
  "<span class="quote">Preconfigured anything to copy file list FLIST to DEST asynchronously.</span>"
  (interactive)
  (let* ((flist (anything-c-read-file-name
                 "<span class="quote">Copy File async: </span>"
                 :marked-candidates t))
         (dest  (anything-c-read-file-name
                 "<span class="quote">Copy File async To: </span>"
                 :preselect (car flist)
                 :initial-input (car anything-ff-history)
                 :history (anything-find-files-history :comp-read nil))))
    (anything-c-copy-async-with-log flist dest)))

<span class="linecomment">;;;###autoload</span>
(defun anything-find-files (arg)
  "<span class="quote">Preconfigured `anything' for anything implementation of `find-file'.
Called with a prefix arg show history if some.
Don't call it from programs, use `anything-find-files-1' instead.
This is the starting point for nearly all actions you can do on files.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((any-input (if (and arg anything-ff-history)
                       (anything-find-files-history)
                       (anything-find-files-initial-input)))
        (presel    (buffer-file-name (current-buffer))))
    (when (and (eq major-mode 'org-agenda-mode)
               org-directory
               (not any-input))
      (setq any-input (expand-file-name org-directory)))
    (set-text-properties 0 (length any-input) nil any-input)
    (if any-input
        (anything-find-files-1 any-input)
        (setq any-input (expand-file-name (anything-c-current-directory)))
        (anything-find-files-1
         any-input (if anything-ff-transformer-show-only-basename
                       (and presel (anything-c-basename presel))
                       presel)))))

<span class="linecomment">;;;###autoload</span>
(defun anything-write-file ()
  "<span class="quote">Preconfigured `anything' providing completion for `write-file'.</span>"
  (interactive)
  (let ((anything-mp-highlight-delay nil))
    (anything :sources 'anything-c-source-write-file
              :input (expand-file-name default-directory)
              :prompt "<span class="quote">Write buffer to file: </span>"
              :buffer "<span class="quote">*Anything write file*</span>")))

<span class="linecomment">;;;###autoload</span>
(defun anything-insert-file ()
  "<span class="quote">Preconfigured `anything' providing completion for `insert-file'.</span>"
  (interactive)
  (let ((anything-mp-highlight-delay nil))
    (anything :sources 'anything-c-source-insert-file
              :input (expand-file-name default-directory)
              :prompt "<span class="quote">Insert file: </span>"
              :buffer "<span class="quote">*Anything insert file*</span>")))

<span class="linecomment">;;;###autoload</span>
(defun anything-dired-rename-file ()
  "<span class="quote">Preconfigured `anything' to rename files from dired.</span>"
  (interactive)
  (anything-dired-do-action-on-file :action 'rename))

<span class="linecomment">;;;###autoload</span>
(defun anything-dired-copy-file ()
  "<span class="quote">Preconfigured `anything' to copy files from dired.</span>"
  (interactive)
  (anything-dired-do-action-on-file :action 'copy))

<span class="linecomment">;;;###autoload</span>
(defun anything-dired-symlink-file ()
  "<span class="quote">Preconfigured `anything' to symlink files from dired.</span>"
  (interactive)
  (anything-dired-do-action-on-file :action 'symlink))

<span class="linecomment">;;;###autoload</span>
(defun anything-dired-hardlink-file ()
  "<span class="quote">Preconfigured `anything' to hardlink files from dired.</span>"
  (interactive)
  (anything-dired-do-action-on-file :action 'hardlink))

<span class="linecomment">;;;###autoload</span>
(defun anything-do-grep ()
  "<span class="quote">Preconfigured anything for grep.
Contrarily to Emacs `grep' no default directory is given, but
the full path of candidates in ONLY.
That allow to grep different files not only in `default-directory' but anywhere
by marking them (C-&lt;SPACE&gt;). If one or more directory is selected
grep will search in all files of these directories.
You can use also wildcard in the base name of candidate.
If a prefix arg is given use the -r option of grep.
The prefix arg can be passed before or after start.
See also `anything-do-grep-1'.</span>"
  (interactive)
  (let ((only    (anything-c-read-file-name
                  "<span class="quote">Search in file(s): </span>"
                  :marked-candidates t
                  :preselect (or (dired-get-filename nil t)
                                 (buffer-file-name (current-buffer)))))
        (prefarg (or current-prefix-arg anything-current-prefix-arg)))
    (anything-do-grep-1 only prefarg)))

<span class="linecomment">;;;###autoload</span>
(defun anything-do-zgrep ()
  "<span class="quote">Preconfigured anything for zgrep.</span>"
  (interactive)
  (let ((prefarg (or current-prefix-arg anything-current-prefix-arg))
        (ls (anything-c-read-file-name
             "<span class="quote">Search in file(s): </span>"
             :marked-candidates t
             :preselect (or (dired-get-filename nil t)
                            (buffer-file-name (current-buffer))))))
    (anything-ff-zgrep-1 ls prefarg)))

<span class="linecomment">;;;###autoload</span>
(defun anything-do-pdfgrep ()
  "<span class="quote">Preconfigured anything for pdfgrep.</span>"
  (interactive)
  (let ((only (anything-c-read-file-name
               "<span class="quote">Search in file(s): </span>"
               :marked-candidates t
               :test #'(lambda (file)
                         (or (string= (file-name-extension file) "<span class="quote">pdf</span>")
                             (string= (file-name-extension file) "<span class="quote">PDF</span>")
                             (file-directory-p file)))
               :preselect (or (dired-get-filename nil t)
                              (buffer-file-name (current-buffer)))))
        (anything-c-grep-default-function 'anything-c-pdfgrep-init))
    (anything-do-pdfgrep-1 only)))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-etags-select (arg)
  "<span class="quote">Preconfigured anything for etags.
Called with one prefix arg use symbol at point as initial input.
Called with two prefix arg reinitialize cache.
If tag file have been modified reinitialize cache.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((tag  (anything-c-etags-get-tag-file))
        (init (and (equal arg '(4)) (thing-at-point 'symbol)))
        (anything-quit-if-no-candidate t)
        (anything-execute-action-at-once-if-one t)
        (anything-compile-source-functions
         (if anything-c-etags-use-regexp-search
             <span class="linecomment">;; rule out anything-match-plugin because the input is one regexp.</span>
             (delq 'anything-compile-source--match-plugin
                   (copy-sequence anything-compile-source-functions))
             anything-compile-source-functions)))
    (when (or (equal arg '(16))
              (and anything-c-etags-mtime-alist
                   (anything-c-etags-file-modified-p tag)))
      (remhash tag anything-c-etags-cache))
    (if (and tag (file-exists-p tag))
        (anything :sources 'anything-c-source-etags-select
                  :keymap anything-c-etags-map
                  :input init
                  :buffer "<span class="quote">*anything etags*</span>")
        (message "<span class="quote">Error: No tag file found, please create one with etags shell command.</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun anything-filelist ()
  "<span class="quote">Preconfigured `anything' to open files instantly.

See `anything-c-filelist-file-name' docstring for usage.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-filelist "<span class="quote">*anything file list*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-filelist+ ()
  "<span class="quote">Preconfigured `anything' to open files/buffers/bookmarks instantly.

This is a replacement for `anything-for-files'.
See `anything-c-filelist-file-name' docstring for usage.</span>"
  (interactive)
  (anything-other-buffer
   '(anything-c-source-ffap-line
     anything-c-source-ffap-guesser
     anything-c-source-buffers-list
     anything-c-source-recentf
     anything-c-source-bookmarks
     anything-c-source-file-cache
     anything-c-source-filelist)
   "<span class="quote">*anything file list*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-M-x ()
  "<span class="quote">Preconfigured `anything' for Emacs commands.
It is `anything' replacement of regular `M-x' `execute-extended-command'.</span>"
  (interactive)
  (let* (in-help
         help-cand
         special-display-buffer-names
         special-display-regexps
         anything-persistent-action-use-special-display
         (history (loop with hist
                        for i in extended-command-history
                        for com = (intern i)
                        when (fboundp com)
                        collect i into hist finally return hist)))
    (flet ((pers-help (candidate)
             (let ((hbuf (get-buffer (help-buffer))))
               (if (and in-help (string= candidate help-cand))
                   (progn
                     <span class="linecomment">;; When M-x is started from a help buffer,</span>
                     <span class="linecomment">;; Don't kill it as it is anything-current-buffer.</span>
                     (unless (equal hbuf anything-current-buffer)
                       (kill-buffer hbuf))
                     (setq in-help nil))
                   <span class="linecomment">;; Be sure anything-current-buffer</span>
                   <span class="linecomment">;; have not a dedicated window.</span>
                   (set-window-dedicated-p
                    (get-buffer-window anything-current-buffer) nil)
                   (describe-function (intern candidate))
                   (message nil) <span class="linecomment">; Erase the new stupid message Type "q"[...]</span>
                   (setq in-help t))
               (setq help-cand candidate))))
      (let* ((command (anything-comp-read
                       "<span class="quote">M-x </span>" obarray
                       :test 'commandp
                       :requires-pattern anything-M-x-requires-pattern
                       :name "<span class="quote">Emacs Commands</span>"
                       :buffer "<span class="quote">*anything M-x*</span>"
                       :persistent-action 'pers-help
                       :persistent-help "<span class="quote">Describe this command</span>"
                       :history history
                       :must-match t
                       :candidates-in-buffer t
                       :fc-transformer 'anything-M-x-transformer))
             (sym-com (intern command)))
        (unless current-prefix-arg
          (setq current-prefix-arg anything-current-prefix-arg))
        <span class="linecomment">;; Avoid having `this-command' set to *exit-minibuffer.</span>
        (setq this-command sym-com)
        (call-interactively sym-com)
        (setq extended-command-history
              (cons command (delete command history)))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-manage-advice ()
  "<span class="quote">Preconfigured `anything' to disable/enable function advices.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-advice "<span class="quote">*anything advice*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-bookmark-ext ()
  "<span class="quote">Preconfigured `anything' for bookmark-extensions sources.
Needs bookmark-ext.el:
&lt;http://mercurial.intuxication.org/hg/emacs-bookmark-extension&gt;.
Contain also `anything-c-source-google-suggest'.</span>"
  (interactive)
  (anything
   :sources
   '(anything-c-source-bookmark-files&dirs
     anything-c-source-bookmark-w3m
     anything-c-source-google-suggest
     anything-c-source-bmkext-addressbook
     anything-c-source-bookmark-gnus
     anything-c-source-bookmark-info
     anything-c-source-bookmark-man
     anything-c-source-bookmark-images
     anything-c-source-bookmark-su-files&dirs
     anything-c-source-bookmark-ssh-files&dirs)
   :prompt "<span class="quote">SearchBookmark: </span>"
   :buffer "<span class="quote">*anything bmkext*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-simple-call-tree ()
  "<span class="quote">Preconfigured `anything' for simple-call-tree. List function relationships.

Needs simple-call-tree.el.
http://www.emacswiki.org/cgi-bin/wiki/download/simple-call-tree.el</span>"
  (interactive)
  (anything-other-buffer
   '(anything-c-source-simple-call-tree-functions-callers
     anything-c-source-simple-call-tree-callers-functions)
   "<span class="quote">*anything simple-call-tree*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-mark-ring ()
  "<span class="quote">Preconfigured `anything' for `anything-c-source-mark-ring'.</span>"
  (interactive)
  (anything :sources 'anything-c-source-mark-ring))

<span class="linecomment">;;;###autoload</span>
(defun anything-global-mark-ring ()
  "<span class="quote">Preconfigured `anything' for `anything-c-source-global-mark-ring'.</span>"
  (interactive)
  (anything :sources 'anything-c-source-global-mark-ring))

<span class="linecomment">;;;###autoload</span>
(defun anything-all-mark-rings ()
  "<span class="quote">Preconfigured `anything' for `anything-c-source-global-mark-ring' and \
`anything-c-source-mark-ring'.</span>"
  (interactive)
  (anything :sources '(anything-c-source-mark-ring
                       anything-c-source-global-mark-ring)))

<span class="linecomment">;;;###autoload</span>
(defun anything-yaoddmuse-emacswiki-edit-or-view ()
  "<span class="quote">Preconfigured `anything' to edit or view EmacsWiki page.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el</span>"
  (interactive)
  (anything :sources 'anything-c-source-yaoddmuse-emacswiki-edit-or-view))

<span class="linecomment">;;;###autoload</span>
(defun anything-yaoddmuse-emacswiki-post-library ()
  "<span class="quote">Preconfigured `anything' to post library to EmacsWiki.

Needs yaoddmuse.el.

http://www.emacswiki.org/emacs/download/yaoddmuse.el</span>"
  (interactive)
  (anything :sources 'anything-c-source-yaoddmuse-emacswiki-post-library))

<span class="linecomment">;;;###autoload</span>
(defun anything-eval-expression (arg)
  "<span class="quote">Preconfigured anything for `anything-c-source-evaluation-result'.</span>"
  (interactive "<span class="quote">P</span>")
  (anything :sources 'anything-c-source-evaluation-result
            :input (when arg (thing-at-point 'sexp))
            :buffer "<span class="quote">*anything eval*</span>"
            :history 'anything-eval-expression-input-history
            :keymap anything-eval-expression-map))

<span class="linecomment">;;;###autoload</span>
(defun anything-eval-expression-with-eldoc ()
  "<span class="quote">Preconfigured anything for `anything-c-source-evaluation-result' with `eldoc' support. </span>"
  (interactive)
  (declare (special eldoc-idle-delay))
  (let ((timer (run-with-idle-timer eldoc-idle-delay
                                    'repeat 'anything-eldoc-show-in-eval))
        (minibuffer-completing-symbol t) <span class="linecomment">; Enable lisp completion.</span>
        (completion-cycle-threshold t))  <span class="linecomment">; Always cycle, no pesty completion buffer (emacs24 only).</span>
    (unwind-protect
         (minibuffer-with-setup-hook
             'anything-eldoc-store-minibuffer
           (call-interactively 'anything-eval-expression))
      (and timer (cancel-timer timer))
      (setq anything-eldoc-active-minibuffers-list
            (cdr anything-eldoc-active-minibuffers-list)))))

<span class="linecomment">;;;###autoload</span>
(defun anything-calcul-expression ()
  "<span class="quote">Preconfigured anything for `anything-c-source-calculation-result'.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-calculation-result "<span class="quote">*anything calcul*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-surfraw (pattern engine)
  "<span class="quote">Preconfigured `anything' to search PATTERN with search ENGINE.</span>"
  (interactive (list (read-string "<span class="quote">SearchFor: </span>"
                                  nil 'anything-surfraw-input-history)
                     (anything-comp-read
                      "<span class="quote">Engine: </span>"
                      (anything-c-build-elvi-list)
                      :must-match t
                      :name "<span class="quote">Surfraw Search Engines</span>"
                      :history anything-surfraw-engines-history)))
  (let* ((engine-nodesc (car (split-string engine)))
         (url (with-temp-buffer
                (apply 'call-process "<span class="quote">surfraw</span>" nil t nil
		       <span class="linecomment">;;JAVE</span>
                       (append  (list engine-nodesc "<span class="quote">-p</span>") (split-string pattern)))
                (replace-regexp-in-string
                 "<span class="quote">\n</span>" "<span class="quote"></span>" (buffer-string))))
         (browse-url-browser-function (or anything-surfraw-default-browser-function
                                          browse-url-browser-function)))
    (if (string= engine-nodesc "<span class="quote">W</span>")
        (anything-c-browse-url anything-c-home-url)
        (anything-c-browse-url url)
        (setq anything-surfraw-engines-history
              (cons engine (delete engine anything-surfraw-engines-history))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-call-source ()
  "<span class="quote">Preconfigured `anything' to call anything source.</span>"
  (interactive)
  (anything :sources 'anything-c-source-call-source
            :buffer anything-source-select-buffer))

<span class="linecomment">;;;###autoload</span>
(defun anything-execute-anything-command ()
  "<span class="quote">Preconfigured `anything' to execute preconfigured `anything'.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-anything-commands
                         "<span class="quote">*anything commands*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-create (&optional string initial-input)
  "<span class="quote">Preconfigured `anything' to do many create actions from STRING.
See also `anything-create--actions'.</span>"
  (interactive)
  (setq string (or string (read-string "<span class="quote">Create Anything: </span>" initial-input)))
  (anything :sources '(((name . "<span class="quote">Anything Create</span>")
                        (header-name . (lambda (_) (format "<span class="quote">Action for \"%s\"</span>" string)))
                        (candidates . anything-create--actions)
                        (candidate-number-limit)
                        (action . (lambda (func) (funcall func string)))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-top ()
  "<span class="quote">Preconfigured `anything' for top command.</span>"
  (interactive)
  (let ((anything-samewindow t)
        (anything-enable-shortcuts)
        (anything-display-function 'anything-default-display-buffer)
        (anything-candidate-number-limit 9999))
    (save-window-excursion
      (delete-other-windows)
      (anything-other-buffer 'anything-c-source-top "<span class="quote">*anything top*</span>"))))

<span class="linecomment">;;;###autoload</span>
(defun anything-select-xfont ()
  "<span class="quote">Preconfigured `anything' to select Xfont.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-xfonts "<span class="quote">*anything select* xfont</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-world-time ()
  "<span class="quote">Preconfigured `anything' to show world time.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-time-world "<span class="quote">*anything world time*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-apt (arg)
  "<span class="quote">Preconfigured `anything' : frontend of APT package manager.
With a prefix arg reload cache.</span>"
  (interactive "<span class="quote">P</span>")
  (let ((query (read-string "<span class="quote">Search Package: </span>" nil 'anything-c-apt-input-history)))
    (when arg (anything-c-apt-refresh))
    (anything :sources 'anything-c-source-apt
              :prompt "<span class="quote">Search Package: </span>"
              :input query
              :history 'anything-c-apt-input-history)))

<span class="linecomment">;;;###autoload</span>
(defun anything-esh-pcomplete ()
  "<span class="quote">Preconfigured anything to provide anything completion in eshell.</span>"
  (interactive)
  (let* ((anything-quit-if-no-candidate t)
         (anything-execute-action-at-once-if-one t)
         (target (thing-at-point 'symbol))
         (end (point))
         (beg (or (and target (- end (length target)))
                  <span class="linecomment">;; Nothing at point.</span>
                  (progn (insert "<span class="quote"> </span>") (point)))))
    (setq anything-ec-target (or target "<span class="quote"> </span>"))
    (with-anything-show-completion beg end
      (anything :sources 'anything-c-source-esh
                :buffer "<span class="quote">*anything pcomplete*</span>"
                :input (anything-ff-set-pattern <span class="linecomment">; Handle tramp filenames.</span>
                        (car (last (ignore-errors <span class="linecomment">; Needed in lisp symbols completion.</span>
                                     (pcomplete-parse-arguments)))))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-eshell-history ()
  "<span class="quote">Preconfigured anything for eshell history.</span>"
  (interactive)
  (let* ((end (point))
         (beg (save-excursion (eshell-bol) (point)))
         (input (buffer-substring beg end))
         flag-empty)
    (when (eq beg end)
      (insert "<span class="quote"> </span>")
      (setq flag-empty t)
      (setq end (point)))
    (unwind-protect
         (with-anything-show-completion beg end
           (anything :sources 'anything-c-source-eshell-history
                     :buffer "<span class="quote">*Eshell history*</span>"
                     :input input))
      (when (and flag-empty
                 (looking-back "<span class="quote"> </span>"))
        (delete-char -1)))))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-run-external-command (program)
  "<span class="quote">Preconfigured `anything' to run External PROGRAM asyncronously from Emacs.
If program is already running exit with error.
You can set your own list of commands with
`anything-c-external-commands-list'.</span>"
  (interactive (list
                (anything-comp-read
                 "<span class="quote">RunProgram: </span>"
                 (anything-c-external-commands-list-1 'sort)
                 :must-match t
                 :name "<span class="quote">External Commands</span>"
                 :history anything-external-command-history)))
  (anything-run-or-raise program)
  (setq anything-external-command-history
        (cons program (delete program
                              (loop for i in anything-external-command-history
                                    when (executable-find i) collect i)))))

<span class="linecomment">;;;###autoload</span>
(defun anything-ratpoison-commands ()
  "<span class="quote">Preconfigured `anything' to execute ratpoison commands.</span>"
  (interactive)
  (anything-other-buffer 'anything-c-source-ratpoison-commands
                         "<span class="quote">*anything ratpoison commands*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-ucs ()
  "<span class="quote">Preconfigured anything for `ucs-names' math symbols.</span>"
  (interactive)
  (anything :sources 'anything-c-source-ucs
            :keymap  anything-c-ucs-map))

<span class="linecomment">;;;###autoload</span>
(defun anything-c-apropos ()
  "<span class="quote">Preconfigured anything to describe commands, functions, variables and faces.</span>"
  (interactive)
  (let ((default (thing-at-point 'symbol)))
    (anything :sources
              `(((name . "<span class="quote">Commands</span>")
                 (init . (lambda ()
                           (anything-c-apropos-init 'commandp ,default)))
                 (persistent-action . anything-lisp-completion-persistent-action)
                 (persistent-help . "<span class="quote">Show brief doc in mode-line</span>")
                 (candidates-in-buffer)
                 (action . (lambda (candidate)
                             (describe-function (intern candidate)))))
                ((name . "<span class="quote">Functions</span>")
                 (init . (lambda ()
                           (anything-c-apropos-init #'(lambda (x) (and (fboundp x)
                                                                       (not (commandp x))))
                                                    ,default)))
                 (persistent-action . anything-lisp-completion-persistent-action)
                 (persistent-help . "<span class="quote">Show brief doc in mode-line</span>")
                 (candidates-in-buffer)
                 (action . (lambda (candidate)
                             (describe-function (intern candidate)))))
                ((name . "<span class="quote">Variables</span>")
                 (init . (lambda ()
                           (anything-c-apropos-init 'boundp ,default)))
                 (persistent-action . anything-lisp-completion-persistent-action)
                 (persistent-help . "<span class="quote">Show brief doc in mode-line</span>")
                 (candidates-in-buffer)
                 (action . (lambda (candidate)
                             (describe-variable (intern candidate)))))
                ((name . "<span class="quote">Faces</span>")
                 (init . (lambda ()
                           (anything-c-apropos-init 'facep ,default)))
                 (persistent-action . anything-lisp-completion-persistent-action)
                 (persistent-help . "<span class="quote">Show brief doc in mode-line</span>")
                 (candidates-in-buffer)
                 (filtered-candidate-transformer . (lambda (candidates source)
                                                     (loop for c in candidates
                                                           collect (propertize c 'face (intern c)))))
                 (action . (lambda (candidate)
                             (describe-face (intern candidate)))))
                ((name . "<span class="quote">Anything attributes</span>")
                 (candidates . (lambda ()
                                 (mapcar 'symbol-name anything-additional-attributes)))
                 (action . (lambda (candidate)
                             (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
                               (princ (get (intern candidate) 'anything-attrdoc))))))))))

<span class="linecomment">;;;###autoload</span>
(defun anything-xrandr-set ()
  (interactive)
  (anything :sources 'anything-c-source-xrandr-change-resolution
            :buffer "<span class="quote">*anything xrandr*</span>"))

<span class="linecomment">;;;###autoload</span>
(defun anything-ctags-current-file ()
  "<span class="quote">Preconfigured `anything' to list function/variable definitions.

Needs Exuberant Ctags.

http://ctags.sourceforge.net/</span>"
  (interactive)
  (anything :sources 'anything-c-source-ctags
            :buffer "<span class="quote">*anything ctags*</span>"))
 
<span class="linecomment">;;; Unit tests are now in ../developer-tools/unit-test-anything-config.el.</span>

(provide 'anything-config)

<span class="linecomment">;; Local Variables:</span>
<span class="linecomment">;; coding: utf-8</span>
<span class="linecomment">;; End:</span>

<span class="linecomment">;;; anything-config.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=anything-config.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_anything-config.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=anything-config.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=anything-config.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=anything-config.el">Administration</a></span><span class="time"><br /> Last edited 2013-01-17 13:40 UTC by <a class="author" title="from 61-26-108-88.rev.home.ne.jp" href="http://www.emacswiki.org/emacs/rubikitch">rubikitch</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=anything-config.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
