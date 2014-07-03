<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: anything.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=anything.el" /><link type="text/css" rel="stylesheet" href="/css/emacs.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: anything.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything.el" />
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
      title="Changes for anything.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=anything.el" />
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
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22anything.el%22">anything.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/anything.el">Download</a></p><pre class="code"><span class="linecomment">;;; anything.el --- open anything / QuickSilver-like candidate-selection framework</span>

<span class="linecomment">;; Copyright (C) 2007              Tamas Patrovics</span>
<span class="linecomment">;;               2008 ~ 2012       rubikitch &lt;rubikitch@ruby-lang.org&gt;</span>
<span class="linecomment">;;               2011 ~ 2012       Thierry Volpiatto &lt;thierry.volpiatto@gmail.com&gt;</span>

<span class="linecomment">;; Author: Tamas Patrovics</span>

<span class="linecomment">;; Maintainers: rubikitch &lt;rubikitch@ruby-lang.org&gt;</span>
<span class="linecomment">;;              Thierry Volpiatto &lt;thierry.volpiatto@gmail.com&gt;</span>

<span class="linecomment">;; Keywords: files, frames, help, matching, outlines,</span>
<span class="linecomment">;;           processes, tools, convenience, anything</span>

<span class="linecomment">;; X-URL: &lt;http://repo.or.cz/w/anything-config.git&gt;</span>

<span class="linecomment">;; Site: &lt;http://www.emacswiki.org/cgi-bin/emacs/Anything&gt;</span>

<span class="linecomment">;; MailingList: &lt;https://groups.google.com/group/emacs-anything?hl=en&gt;</span>


<span class="linecomment">;;; This file is NOT part of GNU Emacs</span>

<span class="linecomment">;;; License</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This file is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>

<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with GNU Emacs; see the file COPYING.  If not, write to the</span>
<span class="linecomment">;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,</span>
<span class="linecomment">;; Boston, MA 02110-1301, USA.</span>

 
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;; Autodoc documentation:</span>
<span class="linecomment">;;  ---------------------</span>

<span class="linecomment">;;  * Commands defined here are:</span>
<span class="linecomment">;; [EVAL] (autodoc-document-lisp-buffer :type 'command :prefix "anything" :docstring t)</span>
<span class="linecomment">;; `anything-open-last-log'</span>
<span class="linecomment">;; Open anything log file of last anything session.</span>
<span class="linecomment">;; `anything'</span>
<span class="linecomment">;; Main function to execute anything sources.</span>
<span class="linecomment">;; `anything-resume'</span>
<span class="linecomment">;; Resurrect previously invoked `anything'.</span>
<span class="linecomment">;; `anything-resume-window-only'</span>
<span class="linecomment">;; </span>
<span class="linecomment">;; `anything-at-point'</span>
<span class="linecomment">;; Call anything with symbol at point as initial input.</span>
<span class="linecomment">;; `anything-force-update'</span>
<span class="linecomment">;; Force recalculation and update of candidates.</span>
<span class="linecomment">;; `anything-select-action'</span>
<span class="linecomment">;; Select an action for the currently selected candidate.</span>
<span class="linecomment">;; `anything-previous-line'</span>
<span class="linecomment">;; Move selection to the previous line.</span>
<span class="linecomment">;; `anything-next-line'</span>
<span class="linecomment">;; Move selection to the next line.</span>
<span class="linecomment">;; `anything-previous-page'</span>
<span class="linecomment">;; Move selection back with a pageful.</span>
<span class="linecomment">;; `anything-next-page'</span>
<span class="linecomment">;; Move selection forward with a pageful.</span>
<span class="linecomment">;; `anything-beginning-of-buffer'</span>
<span class="linecomment">;; Move selection at the top.</span>
<span class="linecomment">;; `anything-end-of-buffer'</span>
<span class="linecomment">;; Move selection at the bottom.</span>
<span class="linecomment">;; `anything-previous-source'</span>
<span class="linecomment">;; Move selection to the previous source.</span>
<span class="linecomment">;; `anything-next-source'</span>
<span class="linecomment">;; Move selection to the next source.</span>
<span class="linecomment">;; `anything-select-with-prefix-shortcut'</span>
<span class="linecomment">;; Invoke default action with prefix shortcut.</span>
<span class="linecomment">;; `anything-select-with-digit-shortcut'</span>
<span class="linecomment">;; Invoke default action with digit/alphabet shortcut.</span>
<span class="linecomment">;; `anything-confirm-and-exit-minibuffer'</span>
<span class="linecomment">;; Maybe ask for confirmation when exiting anything.</span>
<span class="linecomment">;; `anything-exit-minibuffer'</span>
<span class="linecomment">;; Select the current candidate by exiting the minibuffer.</span>
<span class="linecomment">;; `anything-keyboard-quit'</span>
<span class="linecomment">;; Quit minibuffer in anything.</span>
<span class="linecomment">;; `anything-help'</span>
<span class="linecomment">;; Help of `anything'.</span>
<span class="linecomment">;; `anything-debug-output'</span>
<span class="linecomment">;; Show all anything-related variables at this time.</span>
<span class="linecomment">;; `anything-delete-current-selection'</span>
<span class="linecomment">;; Delete the currently selected item.</span>
<span class="linecomment">;; `anything-delete-minibuffer-contents'</span>
<span class="linecomment">;; Same as `delete-minibuffer-contents' but this is a command.</span>
<span class="linecomment">;; `anything-toggle-resplit-window'</span>
<span class="linecomment">;; Toggle resplit anything window, vertically or horizontally.</span>
<span class="linecomment">;; `anything-narrow-window'</span>
<span class="linecomment">;; Narrow anything window.</span>
<span class="linecomment">;; `anything-enlarge-window'</span>
<span class="linecomment">;; Enlarge anything window.</span>
<span class="linecomment">;; `anything-select-2nd-action'</span>
<span class="linecomment">;; Select the 2nd action for the currently selected candidate.</span>
<span class="linecomment">;; `anything-select-3rd-action'</span>
<span class="linecomment">;; Select the 3rd action for the currently selected candidate.</span>
<span class="linecomment">;; `anything-select-4th-action'</span>
<span class="linecomment">;; Select the 4th action for the currently selected candidate.</span>
<span class="linecomment">;; `anything-select-2nd-action-or-end-of-line'</span>
<span class="linecomment">;; Select the 2nd action for the currently selected candidate.</span>
<span class="linecomment">;; `anything-execute-persistent-action'</span>
<span class="linecomment">;; Perform the associated action ATTR without quitting anything.</span>
<span class="linecomment">;; `anything-scroll-other-window'</span>
<span class="linecomment">;; Scroll other window (not *Anything* window) upward.</span>
<span class="linecomment">;; `anything-scroll-other-window-down'</span>
<span class="linecomment">;; Scroll other window (not *Anything* window) downward.</span>
<span class="linecomment">;; `anything-toggle-visible-mark'</span>
<span class="linecomment">;; Toggle anything visible mark at point.</span>
<span class="linecomment">;; `anything-display-all-visible-marks'</span>
<span class="linecomment">;; Show all `anything' visible marks strings.</span>
<span class="linecomment">;; `anything-next-visible-mark'</span>
<span class="linecomment">;; Move next anything visible mark.</span>
<span class="linecomment">;; `anything-prev-visible-mark'</span>
<span class="linecomment">;; Move previous anything visible mark.</span>
<span class="linecomment">;; `anything-yank-selection'</span>
<span class="linecomment">;; Set minibuffer contents to current selection.</span>
<span class="linecomment">;; `anything-kill-selection-and-quit'</span>
<span class="linecomment">;; Store current selection to kill ring.</span>
<span class="linecomment">;; `anything-follow-mode'</span>
<span class="linecomment">;; If this mode is on, persistent action is executed everytime the cursor is moved.</span>
<span class="linecomment">;; `anything-migrate-sources'</span>
<span class="linecomment">;; Help to migrate to new `anything' way.</span>
<span class="linecomment">;; `anything-describe-anything-attribute'</span>
<span class="linecomment">;; Display the full documentation of ANYTHING-ATTRIBUTE.</span>
<span class="linecomment">;; `anything-send-bug-report'</span>
<span class="linecomment">;; Send a bug report of anything.el.</span>
<span class="linecomment">;; `anything-send-bug-report-from-anything'</span>
<span class="linecomment">;; Send a bug report of anything.el in anything session.</span>

<span class="linecomment">;;  * Variables defined here are:</span>
<span class="linecomment">;; [EVAL] (autodoc-document-lisp-buffer :type 'internal-variable :prefix "anything-" :docstring t)</span>
<span class="linecomment">;; `anything-version'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-sources'</span>
<span class="linecomment">;; A list of sources to use with `anything'.</span>
<span class="linecomment">;; `anything-type-attributes'</span>
<span class="linecomment">;; It's a list of                                      (TYPE ATTRIBUTES ...).</span>
<span class="linecomment">;; `anything-enable-shortcuts'</span>
<span class="linecomment">;; *Whether to use digit/alphabet shortcut to select the first nine matches.</span>
<span class="linecomment">;; `anything-shortcut-keys-alist'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-display-source-at-screen-top'</span>
<span class="linecomment">;; *Display candidates at the top of screen.</span>
<span class="linecomment">;; `anything-candidate-number-limit'</span>
<span class="linecomment">;; Apply candidate-number-limit attribute value.</span>
<span class="linecomment">;; `anything-idle-delay'</span>
<span class="linecomment">;; *Be idle for this many seconds, before updating in delayed sources.</span>
<span class="linecomment">;; `anything-input-idle-delay'</span>
<span class="linecomment">;; Be idle for this many seconds, before updating.</span>
<span class="linecomment">;; `anything-samewindow'</span>
<span class="linecomment">;; Use current window to show the candidates.</span>
<span class="linecomment">;; `anything-source-filter'</span>
<span class="linecomment">;; A list of source names to be displayed.</span>
<span class="linecomment">;; `anything-map'</span>
<span class="linecomment">;; Keymap for anything.</span>
<span class="linecomment">;; `anything-header-face'</span>
<span class="linecomment">;; *Face for header lines in the anything buffer.</span>
<span class="linecomment">;; `anything-selection-face'</span>
<span class="linecomment">;; *Face for currently selected item.</span>
<span class="linecomment">;; `anything-buffer'</span>
<span class="linecomment">;; Buffer showing completions.</span>
<span class="linecomment">;; `anything-action-buffer'</span>
<span class="linecomment">;; Buffer showing actions.</span>
<span class="linecomment">;; `anything-selection-overlay'</span>
<span class="linecomment">;; Overlay used to highlight the currently selected item.</span>
<span class="linecomment">;; `anything-digit-overlays'</span>
<span class="linecomment">;; Overlays for digit shortcuts.  See `anything-enable-shortcuts'.</span>
<span class="linecomment">;; `anything-candidate-cache'</span>
<span class="linecomment">;; Holds the available candidate withing a single anything invocation.</span>
<span class="linecomment">;; `anything-pattern'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-input'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-async-processes'</span>
<span class="linecomment">;; List of information about asynchronous processes managed by anything.</span>
<span class="linecomment">;; `anything-digit-shortcut-count'</span>
<span class="linecomment">;; Number of digit shortcuts shown in the anything buffer.</span>
<span class="linecomment">;; `anything-before-initialize-hook'</span>
<span class="linecomment">;; Run before anything initialization.</span>
<span class="linecomment">;; `anything-after-initialize-hook'</span>
<span class="linecomment">;; Run after anything initialization.</span>
<span class="linecomment">;; `anything-update-hook'</span>
<span class="linecomment">;; Run after the anything buffer was updated according the new input pattern.</span>
<span class="linecomment">;; `anything-after-update-hook'</span>
<span class="linecomment">;; Run after the anything buffer was updated according the new input pattern.</span>
<span class="linecomment">;; `anything-cleanup-hook'</span>
<span class="linecomment">;; Run after anything minibuffer is closed.</span>
<span class="linecomment">;; `anything-select-action-hook'</span>
<span class="linecomment">;; Run when opening the action buffer.</span>
<span class="linecomment">;; `anything-before-action-hook'</span>
<span class="linecomment">;; Run before executing action.</span>
<span class="linecomment">;; `anything-after-action-hook'</span>
<span class="linecomment">;; Run after executing action.</span>
<span class="linecomment">;; `anything-after-persistent-action-hook'</span>
<span class="linecomment">;; Run after executing persistent action.</span>
<span class="linecomment">;; `anything-move-selection-before-hook'</span>
<span class="linecomment">;; Run before moving selection in `anything-buffer'.</span>
<span class="linecomment">;; `anything-move-selection-after-hook'</span>
<span class="linecomment">;; Run after moving selection in `anything-buffer'.</span>
<span class="linecomment">;; `anything-restored-variables'</span>
<span class="linecomment">;; Variables which are restored after `anything' invocation.</span>
<span class="linecomment">;; `anything-saved-selection'</span>
<span class="linecomment">;; Value of the currently selected object when the action list is shown.</span>
<span class="linecomment">;; `anything-current-prefix-arg'</span>
<span class="linecomment">;; Record `current-prefix-arg' when exiting minibuffer.</span>
<span class="linecomment">;; `anything-candidate-separator'</span>
<span class="linecomment">;; Candidates separator of `multiline' source.</span>
<span class="linecomment">;; `anything-current-buffer'</span>
<span class="linecomment">;; Current buffer when `anything' is invoked.</span>
<span class="linecomment">;; `anything-buffer-file-name'</span>
<span class="linecomment">;; Variable `buffer-file-name' when `anything' is invoked.</span>
<span class="linecomment">;; `anything-saved-action'</span>
<span class="linecomment">;; Saved value of the currently selected action by key.</span>
<span class="linecomment">;; `anything-last-sources'</span>
<span class="linecomment">;; OBSOLETE!! Sources of previously invoked `anything'.</span>
<span class="linecomment">;; `anything-saved-current-source'</span>
<span class="linecomment">;; Value of the current source when the action list is shown.</span>
<span class="linecomment">;; `anything-compiled-sources'</span>
<span class="linecomment">;; Compiled version of `anything-sources'.</span>
<span class="linecomment">;; `anything-in-persistent-action'</span>
<span class="linecomment">;; Flag whether in persistent-action or not.</span>
<span class="linecomment">;; `anything-quick-update'</span>
<span class="linecomment">;; If non-nil, suppress displaying sources which are out of screen at first.</span>
<span class="linecomment">;; `anything-last-sources-local'</span>
<span class="linecomment">;; Buffer local value of `anything-sources'.</span>
<span class="linecomment">;; `anything-last-buffer'</span>
<span class="linecomment">;; `anything-buffer' of previously `anything' session.</span>
<span class="linecomment">;; `anything-save-configuration-functions'</span>
<span class="linecomment">;; The functions used to restore/save window or frame configurations.</span>
<span class="linecomment">;; `anything-persistent-action-use-special-display'</span>
<span class="linecomment">;; If non-nil, use `special-display-function' in persistent action.</span>
<span class="linecomment">;; `anything-execute-action-at-once-if-one'</span>
<span class="linecomment">;; Execute default action and exit when only one candidate is remaining.</span>
<span class="linecomment">;; `anything-quit-if-no-candidate'</span>
<span class="linecomment">;; Quit when there is no candidates when non--nil.</span>
<span class="linecomment">;; `anything-scroll-amount'</span>
<span class="linecomment">;; Scroll amount when scrolling other window in an anything session.</span>
<span class="linecomment">;; `anything-display-function'</span>
<span class="linecomment">;; Function to display *anything* buffer.</span>
<span class="linecomment">;; `anything-delayed-init-executed'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-mode-line-string'</span>
<span class="linecomment">;; Help string displayed in mode-line in `anything'.</span>
<span class="linecomment">;; `anything-help-message'</span>
<span class="linecomment">;; Detailed help message string for `anything'.</span>
<span class="linecomment">;; `anything-source-in-each-line-flag'</span>
<span class="linecomment">;; Non-nil means add anything-source text-property in each candidate.</span>
<span class="linecomment">;; `anything-debug-forms'</span>
<span class="linecomment">;; Forms to show in `anything-debug-output'.</span>
<span class="linecomment">;; `anything-debug'</span>
<span class="linecomment">;; If non-nil, write log message into *Anything Log* buffer.</span>
<span class="linecomment">;; `anything-test-candidate-list'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-test-mode'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-source-name'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-candidate-buffer-alist'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-check-minibuffer-input-timer'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-match-hash'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-cib-hash'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-tick-hash'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-issued-errors'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-shortcut-keys'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-once-called-functions'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-follow-mode'</span>
<span class="linecomment">;; If this mode is on, persistent action is executed everytime the cursor is moved.</span>
<span class="linecomment">;; `anything-let-variables'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-split-window-state'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-selection-point'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-last-log-file'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-compile-source-functions'</span>
<span class="linecomment">;; Functions to compile elements of `anything-sources' (plug-in).</span>
<span class="linecomment">;; `anything-quit'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-additional-attributes'</span>
<span class="linecomment">;; List of all `anything' attributes.</span>
<span class="linecomment">;; `anything-buffers'</span>
<span class="linecomment">;; All of `anything-buffer' in most recently used order.</span>
<span class="linecomment">;; `anything-current-position'</span>
<span class="linecomment">;; Restore or save current position in `anything-current-buffer'.</span>
<span class="linecomment">;; `anything-last-frame-or-window-configuration'</span>
<span class="linecomment">;; Used to store window or frame configuration when anything start.</span>
<span class="linecomment">;; `anything-reading-pattern'</span>
<span class="linecomment">;; Whether in `read-string' in anything or not.</span>
<span class="linecomment">;; `anything-compile-source-functions-default'</span>
<span class="linecomment">;; Plug-ins this file provides.</span>
<span class="linecomment">;; `anything-input-local'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-process-delayed-sources-timer'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-mode-line-string-real'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-exit-status'</span>
<span class="linecomment">;; Flag to inform whether anything have exited or quitted.</span>
<span class="linecomment">;; `anything-minibuffer-confirm-state'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-types'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-orig-enable-shortcuts'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-persistent-action-display-window'</span>
<span class="linecomment">;; Return the window that will be used for presistent action.</span>
<span class="linecomment">;; `anything-visible-mark-face'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-visible-mark-overlays'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-marked-candidates'</span>
<span class="linecomment">;; Return marked candidates of current source if any.</span>
<span class="linecomment">;; `anything-maintainer-mail-address'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-bug-report-salutation'</span>
<span class="linecomment">;; Not documented.</span>
<span class="linecomment">;; `anything-no-dump-variables'</span>
<span class="linecomment">;; Variables not to dump in bug report.</span>

<span class="linecomment">;;  *** END auto-documentation</span>

<span class="linecomment">;; [EVAL] (autodoc-update-all)</span>

 
<span class="linecomment">;;; Commentary:</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Start with M-x anything, narrow the list by typing some pattern,</span>
<span class="linecomment">;; select with up/down/pgup/pgdown/C-p/C-n/C-v/M-v, choose with enter,</span>
<span class="linecomment">;; left/right moves between sources.  With TAB actions can be selected</span>
<span class="linecomment">;; if the selected candidate has more than one possible action.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Note that anything.el provides only the framework and some example</span>
<span class="linecomment">;; configurations for demonstration purposes.  See anything-config.el</span>
<span class="linecomment">;; for practical, polished, easy to use configurations which can be</span>
<span class="linecomment">;; used to assemble a custom personalized configuration.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; NOTE: What you find on Emacswiki is mostly deprecated and not maintained,</span>
<span class="linecomment">;;       don't complain if you use such code or configuration and something</span>
<span class="linecomment">;;       doesn't work.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Here is Japanese translation of `anything-sources' attributes.  Thanks.</span>
<span class="linecomment">;; http://d.hatena.ne.jp/sirocco634/20091012/1255336649</span>

 
<span class="linecomment">;;; Bug Report:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If you have problems, send a bug report via C-c C-x C-b in anything session (best)</span>
<span class="linecomment">;; or M-x anything-send-bug-report outside anything session.</span>
<span class="linecomment">;; I implemented bug report feature because I want to know your current state.</span>
<span class="linecomment">;; It helps me to solve problems easily.</span>
<span class="linecomment">;; The step is:</span>
<span class="linecomment">;;  0) Setup mail in Emacs, the easiest way is:</span>
<span class="linecomment">;;       (setq user-mail-address "your@mail.address")</span>
<span class="linecomment">;;       (setq user-full-name "Your Full Name")</span>
<span class="linecomment">;;       (setq smtpmail-smtp-server "your.smtp.server.jp")</span>
<span class="linecomment">;;       (setq mail-user-agent 'message-user-agent)</span>
<span class="linecomment">;;       (setq message-send-mail-function 'message-smtpmail-send-it)</span>
<span class="linecomment">;;  1) Be sure to use the LATEST version of anything.el.</span>
<span class="linecomment">;;  2) Enable debugger. M-x toggle-debug-on-error or (setq debug-on-error t)</span>
<span class="linecomment">;;  3) Use Lisp version instead of compiled one: (load "anything.el")</span>
<span class="linecomment">;;  4) Do it!</span>
<span class="linecomment">;;  5) If you got an error, please do not close *Backtrace* buffer.</span>
<span class="linecomment">;;  6) Type C-c C-x C-b (anything session, best!)</span>
<span class="linecomment">;;     or M-x anything-send-bug-report (outside)</span>
<span class="linecomment">;;     then M-x insert-buffer *Backtrace* (if you got error)</span>
<span class="linecomment">;;  7) Describe the bug using a precise recipe.</span>
<span class="linecomment">;;  8) Type C-c C-c to send.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  You can also just report bug to:</span>
<span class="linecomment">;;  https://groups.google.com/group/emacs-anything?hl=en</span>

 
<span class="linecomment">;; You can extend `anything' by writing plug-ins. As soon as</span>
<span class="linecomment">;; `anything' is invoked, `anything-sources' is compiled into basic</span>
<span class="linecomment">;; attributes, then compiled one is used during invocation.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; The oldest built-in plug-in is `type' attribute: appends</span>
<span class="linecomment">;; appropriate element of `anything-type-attributes'. Second built-in</span>
<span class="linecomment">;; plug-in is `candidates-in-buffer': selecting a line from candidates</span>
<span class="linecomment">;; buffer.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; To write a plug-in:</span>
<span class="linecomment">;; 1. Define a compiler: anything-compile-source--*</span>
<span class="linecomment">;; 2. Add compier function to `anything-compile-source-functions'.</span>
<span class="linecomment">;; 3. (optional) Write helper functions.</span>
<span class="linecomment">;</span>
<span class="linecomment">;; Tested on Emacs 22/23/24.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Vagn Johansen for ideas.</span>
<span class="linecomment">;; Thanks to Stefan Kamphausen for fixes and XEmacs support.</span>
<span class="linecomment">;; Thanks to Tassilo Horn for fixes.</span>
<span class="linecomment">;; Thanks to Drew Adams for various fixes</span>
<span class="linecomment">;; Thanks to IMAKADO for candidates-in-buffer idea.</span>
<span class="linecomment">;; Thanks to Tomohiro MATSUYAMA for multiline patch.</span>
<span class="linecomment">;;</span>

<span class="linecomment">;;; (@* "Index")</span>

<span class="linecomment">;;  If you have library `linkd.el', load</span>
<span class="linecomment">;;  `linkd.el' and turn on `linkd-mode' now.  It lets you easily</span>
<span class="linecomment">;;  navigate around the sections  Linkd mode will</span>
<span class="linecomment">;;  highlight this Index.  You can get `linkd.el' here:</span>
<span class="linecomment">;;  http://www.emacswiki.org/cgi-bin/wiki/download/linkd.el</span>
<span class="linecomment">;;</span>


<span class="linecomment">;;; (@* "Tips")</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything' accepts keyword arguments. See docstring.</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-enable-shortcuts' enables us to select candidate easily.</span>
<span class="linecomment">;; If 'prefix then they can be selected using &lt;prefix-key&gt; &lt;alnum&gt;.</span>
<span class="linecomment">;; The prefix key is `anything-select-with-prefix-shortcut'.</span>
<span class="linecomment">;; If the &lt;prefix-key&gt; is a letter, pressing twice inputs the letter itself.</span>
<span class="linecomment">;; e.g.</span>
<span class="linecomment">;;  (setq anything-enable-shortcuts 'prefix)</span>
<span class="linecomment">;;  (define-key anything-map \"@\" 'anything-select-with-prefix-shortcut)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; You can edit current selection using `anything-edit-current-selection'.</span>
<span class="linecomment">;; It is useful after persistent-action.</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; For `anything' users, setting `anything-sources' directly and</span>
<span class="linecomment">;; invoke M-x anything is obsolete way for now. Try M-x</span>
<span class="linecomment">;; `anything-migrate-sources'!</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; If you want to create anything sources, yasnippet would help you.</span>
<span class="linecomment">;; http://yasnippet.googlecode.com/</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Then get the snippet from</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/wiki/download/anything-source.yasnippet</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Put it in ~/.emacs.d/plugins/yasnippet/snippets/text-mode/emacs-lisp-mode/</span>


<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-interpret-value' is useful function to interpret value</span>
<span class="linecomment">;; like `candidates' attribute.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (anything-interpret-value "literal")            ; =&gt; "literal"</span>
<span class="linecomment">;; (anything-interpret-value (lambda () "lambda")) ; =&gt; "lambda"</span>
<span class="linecomment">;; (let ((source '((name . "lambda with source name"))))</span>
<span class="linecomment">;;   (anything-interpret-value</span>
<span class="linecomment">;;    (lambda () anything-source-name)</span>
<span class="linecomment">;;    source))                             ; =&gt; "lambda with source name"</span>
<span class="linecomment">;; (flet ((f () "function symbol"))</span>
<span class="linecomment">;;   (anything-interpret-value 'f))        ; =&gt; "function symbol"</span>
<span class="linecomment">;; (let ((v "variable symbol"))</span>
<span class="linecomment">;;   (anything-interpret-value 'v))        ; =&gt; "variable symbol"</span>
<span class="linecomment">;; (anything-interpret-value 'unbounded-1) ; error</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Now symbols are acceptable as candidates. So you do not have to use</span>
<span class="linecomment">;; `symbol-name' function. The source is much simpler. For example,</span>
<span class="linecomment">;; `apropos-internal' returns a list of symbols.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   (anything</span>
<span class="linecomment">;;    '(((name . "Commands")</span>
<span class="linecomment">;;       (candidates . (lambda () (apropos-internal anything-pattern 'commandp)))</span>
<span class="linecomment">;;       (volatile)</span>
<span class="linecomment">;;       (action . describe-function))))</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; To mark a candidate, press C-SPC as normal Emacs marking. To go to</span>
<span class="linecomment">;; marked candidate, press M-[ or M-].</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-map' is now Emacs-standard key bindings by default.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There are many `anything' applications, using `anything' for</span>
<span class="linecomment">;; selecting candidate. In this case, if there is one candidate or no</span>
<span class="linecomment">;; candidate, popping up *anything* buffer is irritating. If one</span>
<span class="linecomment">;; candidate, you want to select it at once. If no candidate, you want</span>
<span class="linecomment">;; to quit `anything'. Set `anything-execute-action-at-once-if-one'</span>
<span class="linecomment">;; and `anything-quit-if-no-candidate' to non-nil to remedy it. Note</span>
<span class="linecomment">;; that setting these variables GLOBALLY is bad idea because of</span>
<span class="linecomment">;; delayed sources. These are meant to be let-binded.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; ex.</span>
<span class="linecomment">;; (let ((anything-execute-action-at-once-if-one t)</span>
<span class="linecomment">;;       (anything-quit-if-no-candidate (lambda () (message "No candidate"))))</span>
<span class="linecomment">;;    (anything temporary-sources input))</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `set-frame-configuration' arises flickering. If you hate</span>
<span class="linecomment">;; flickering, eval:</span>
<span class="linecomment">;; (setq anything-save-configuration-functions</span>
<span class="linecomment">;;    '(set-window-configuration . current-window-configuration))</span>
<span class="linecomment">;; at the cost of restoring frame configuration (only window configuration).</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-delete-current-selection' deletes the current line.</span>
<span class="linecomment">;; It is useful when deleting a candidate in persistent action.</span>
<span class="linecomment">;; eg. `kill-buffer'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-delete-current-selection)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-attr' gets the attribute. `anything-attrset' sets the</span>
<span class="linecomment">;; attribute. `anything-attr-defined' tests whether the attribute is</span>
<span class="linecomment">;; defined. They handles source-local variables.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-attr)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-attrset)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-attr-defined)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-sources' accepts many attributes to make your life easier.</span>
<span class="linecomment">;; Now `anything-sources' accepts a list of symbols.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-sources)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything' has optional arguments. Now you do not have to let-bind</span>
<span class="linecomment">;; `anything-sources'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-resume' resumes last `anything' session. Now you do not</span>
<span class="linecomment">;; have to retype pattern.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-resume)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-execute-persistent-action' executes action without</span>
<span class="linecomment">;; quitting `anything'. When popping up a buffer in other window by</span>
<span class="linecomment">;; persistent action, you can scroll with `anything-scroll-other-window' and</span>
<span class="linecomment">;; `anything-scroll-other-window-down'. See also `anything-sources' docstring.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-execute-persistent-action)</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-sources)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-select-2nd-action', `anything-select-3rd-action' and</span>
<span class="linecomment">;; `anything-select-4th-action' select other than default action</span>
<span class="linecomment">;; without pressing Tab.</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Using `anything-candidate-buffer' and the candidates-in-buffer</span>
<span class="linecomment">;; attribute is much faster than traditional "candidates and match"</span>
<span class="linecomment">;; way. And `anything-current-buffer-is-modified' avoids to</span>
<span class="linecomment">;; recalculate candidates for unmodified buffer. See docstring of</span>
<span class="linecomment">;; them.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-candidate-buffer)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-candidates-in-buffer)</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-current-buffer-is-modified)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-current-buffer' and `anything-buffer-file-name' stores</span>
<span class="linecomment">;; `(current-buffer)' and `buffer-file-name' in the buffer `anything'</span>
<span class="linecomment">;; is invoked. Use them freely.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-current-buffer)</span>
<span class="linecomment">;; [EVAL IT] (describe-variable 'anything-buffer-file-name)</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; `anything-completing-read' and `anything-read-file-name' are</span>
<span class="linecomment">;; experimental implementation. If you are curious, type M-x</span>
<span class="linecomment">;; anything-read-string-mode. It is a minor mode and toggles on/off.</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; Use `anything-test-candidates' to test your handmade anything</span>
<span class="linecomment">;; sources. It simulates contents of *anything* buffer with pseudo</span>
<span class="linecomment">;; `anything-sources' and `anything-pattern', without side-effect. So</span>
<span class="linecomment">;; you can unit-test your anything sources! Let's TDD!</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [EVAL IT] (describe-function 'anything-test-candidates)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; For anything developpers:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There are many unit-testing framework in Emacs Lisp. See the EmacsWiki.</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/emacs/UnitTesting</span>
<span class="linecomment">;; There is an unit-test by Emacs Lisp Expectations in developper-tools directory.</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/wiki/download/el-expectations.el</span>
<span class="linecomment">;; http://www.emacswiki.org/cgi-bin/wiki/download/el-mock.el</span>

<span class="linecomment">;;</span>
<span class="linecomment">;; If you want to create anything sources, see anything-config.el.</span>
<span class="linecomment">;; It is huge collection of sources. You can learn from examples.</span>


<span class="linecomment">;; (@* "TODO")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - process status indication</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - async sources doesn't honor digit-shortcut-count</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;   - anything-candidate-number-limit can't be nil everywhere</span>

<span class="linecomment">;; (@* "HISTORY")</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Change log of this file is found at</span>
<span class="linecomment">;;  http://repo.or.cz/w/anything-config.git/history/master:/anything.el</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;  Change log of this project is found at</span>
<span class="linecomment">;;  http://repo.or.cz/w/anything-config.git?a=shortlog</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;</span>

 
<span class="linecomment">;;; Code:</span>

(require 'cl)

(defvar anything-version "<span class="quote">1.3.9</span>")

<span class="linecomment">;; (@* "User Configuration")</span>

 
<span class="linecomment">;;; Variables</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; [DEPRECATED]</span>
<span class="linecomment">;; A default value is provided in anything-config.el</span>
(defvar anything-sources nil
  "<span class="quote">A list of sources to use with `anything'.
It is deprecated, you should not use this.
Use instead individual sources or list of sources of your choice.</span>")

<span class="linecomment">;; Default values are provided in anything-config.el.</span>
(defvar anything-type-attributes nil
  "<span class="quote">It's a list of \(TYPE ATTRIBUTES ...\).
ATTRIBUTES are the same as attributes for `anything-sources'.
TYPE connects the value to the appropriate sources.
Don't set this directly, use instead `define-anything-type-attribute'.

This allows specifying common attributes for several sources.
For example, sources which provide files can specify
common attributes with a `file' type.</span>")

(defvaralias 'anything-enable-digit-shortcuts 'anything-enable-shortcuts
  "<span class="quote">Same as `anything-enable-shortcuts'.
Alphabet shortcuts are available now in `anything-enable-shortcuts'.
`anything-enable-digit-shortcuts' is retained for compatibility.</span>")

(defvar anything-enable-shortcuts nil
  "<span class="quote">*Whether to use digit/alphabet shortcut to select the first nine matches.
If t then they can be selected using Ctrl+&lt;number&gt;.

If 'prefix then they can be selected using &lt;prefix-key&gt; &lt;alnum&gt;.
The prefix key is `anything-select-with-prefix-shortcut'.
If the &lt;prefix-key&gt; is a letter, pressing twice inputs the letter itself.
e.g.
 (setq anything-enable-shortcuts 'prefix)
 (define-key anything-map \"@\" 'anything-select-with-prefix-shortcut)

If 'alphabet then they can be selected using Shift+&lt;alphabet&gt; (deprecated).
It is not recommended because you cannot input capital letters in pattern.

Keys (digit/alphabet) are listed in `anything-shortcut-keys-alist'.</span>")

(defvar anything-shortcut-keys-alist
  '((alphabet . "<span class="quote">asdfghjklzxcvbnmqwertyuiop</span>")
    (prefix   . "<span class="quote">asdfghjklzxcvbnmqwertyuiop1234567890</span>")
    (t        . "<span class="quote">123456789</span>")))

(defvar anything-display-source-at-screen-top t
  "<span class="quote">*Display candidates at the top of screen.
This happen when using `anything-next-source' and `anything-previous-source'.</span>")

(defvar anything-candidate-number-limit 50
  "<span class="quote">*Limit candidate number globally.
Do not show more candidates than this limit from individual sources.
It is usually pointless to show hundreds of matches
when the pattern is empty, because it is much simpler to type a
few characters to narrow down the list of potential candidates.

Set it to nil if you don't want this limit.</span>")

(defvar anything-idle-delay 0.3
  "<span class="quote">*Be idle for this many seconds, before updating in delayed sources.
This is useful for sources involving heavy operations
\(like launching external programs\), so that candidates
from the source are not retrieved unnecessarily if the user keeps typing.

It also can be used to declutter the results anything displays,
so that results from certain sources are not shown with every
character typed, only if the user hesitates a bit.</span>")

(defvar anything-input-idle-delay 0.3
  "<span class="quote">Be idle for this many seconds, before updating.

Unlike `anything-idle-delay', it is also effective for non-delayed sources.
If nil, candidates are collected immediately.

Note:  If this value is too low compared to `anything-idle-delay',
you may have duplicated sources when using multiples sources.
Safe value is always &gt;= `anything-idle-delay'.
Default settings are equal value for both.</span>")

(defvar anything-samewindow nil
  "<span class="quote">Use current window to show the candidates.
If t then Anything doesn't pop up a new window.</span>")

(defvar anything-source-filter nil
  "<span class="quote">A list of source names to be displayed.
Other sources won't appear in the search results.
If nil then there is no filtering.
See also `anything-set-source-filter'.</span>")

 
(defvar anything-map
  (let ((map (copy-keymap minibuffer-local-map)))
    (define-key map (kbd "<span class="quote">&lt;down&gt;</span>")          'anything-next-line)
    (define-key map (kbd "<span class="quote">&lt;up&gt;</span>")            'anything-previous-line)
    (define-key map (kbd "<span class="quote">C-n</span>")             'anything-next-line)
    (define-key map (kbd "<span class="quote">C-p</span>")             'anything-previous-line)
    (define-key map (kbd "<span class="quote">&lt;prior&gt;</span>")         'anything-previous-page)
    (define-key map (kbd "<span class="quote">&lt;next&gt;</span>")          'anything-next-page)
    (define-key map (kbd "<span class="quote">M-v</span>")             'anything-previous-page)
    (define-key map (kbd "<span class="quote">C-v</span>")             'anything-next-page)
    (define-key map (kbd "<span class="quote">M-&lt;</span>")             'anything-beginning-of-buffer)
    (define-key map (kbd "<span class="quote">M-&gt;</span>")             'anything-end-of-buffer)
    (define-key map (kbd "<span class="quote">C-g</span>")             'anything-keyboard-quit)
    (define-key map (kbd "<span class="quote">&lt;right&gt;</span>")         'anything-next-source)
    (define-key map (kbd "<span class="quote">&lt;left&gt;</span>")          'anything-previous-source)
    (define-key map (kbd "<span class="quote">&lt;RET&gt;</span>")           'anything-exit-minibuffer)
    (define-key map (kbd "<span class="quote">C-1</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-2</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-3</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-4</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-5</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-6</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-7</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-8</span>")             'anything-select-with-digit-shortcut)
    (define-key map (kbd "<span class="quote">C-9</span>")             'anything-select-with-digit-shortcut)
    (loop for c from ?A to ?Z do
          (define-key map (make-string 1 c) 'anything-select-with-digit-shortcut))
    (define-key map (kbd "<span class="quote">C-i</span>")             'anything-select-action)
    (define-key map (kbd "<span class="quote">C-z</span>")             'anything-execute-persistent-action)
    (define-key map (kbd "<span class="quote">C-e</span>")             'anything-select-2nd-action-or-end-of-line)
    (define-key map (kbd "<span class="quote">C-j</span>")             'anything-select-3rd-action)
    (define-key map (kbd "<span class="quote">C-o</span>")             'anything-next-source)
    (define-key map (kbd "<span class="quote">C-M-v</span>")           'anything-scroll-other-window)
    (define-key map (kbd "<span class="quote">M-&lt;next&gt;</span>")        'anything-scroll-other-window)
    (define-key map (kbd "<span class="quote">C-M-y</span>")           'anything-scroll-other-window-down)
    (define-key map (kbd "<span class="quote">C-M-S-v</span>")         'anything-scroll-other-window-down)
    (define-key map (kbd "<span class="quote">M-&lt;prior&gt;</span>")       'anything-scroll-other-window-down)
    (define-key map (kbd "<span class="quote">&lt;C-M-down&gt;</span>")      'anything-scroll-other-window)
    (define-key map (kbd "<span class="quote">&lt;C-M-up&gt;</span>")        'anything-scroll-other-window-down)
    (define-key map (kbd "<span class="quote">C-SPC</span>")           'anything-toggle-visible-mark)
    (define-key map (kbd "<span class="quote">M-SPC</span>")           'anything-toggle-visible-mark)
    (define-key map (kbd "<span class="quote">M-[</span>")             'anything-prev-visible-mark)
    (define-key map (kbd "<span class="quote">M-]</span>")             'anything-next-visible-mark)
    (define-key map (kbd "<span class="quote">C-k</span>")             'anything-delete-minibuffer-contents)

    (define-key map (kbd "<span class="quote">C-r</span>")             'undefined)
    (define-key map (kbd "<span class="quote">C-t</span>")             'anything-toggle-resplit-window)
    (define-key map (kbd "<span class="quote">C-}</span>")             'anything-narrow-window)
    (define-key map (kbd "<span class="quote">C-{</span>")             'anything-enlarge-window)
    
    (define-key map (kbd "<span class="quote">C-c C-d</span>")         'anything-delete-current-selection)
    (define-key map (kbd "<span class="quote">C-c C-y</span>")         'anything-yank-selection)
    (define-key map (kbd "<span class="quote">C-c C-k</span>")         'anything-kill-selection-and-quit)
    (define-key map (kbd "<span class="quote">C-c C-f</span>")         'anything-follow-mode)
    (define-key map (kbd "<span class="quote">C-c C-u</span>")         'anything-force-update)
    (define-key map (kbd "<span class="quote">M-p</span>")             'previous-history-element)
    (define-key map (kbd "<span class="quote">M-n</span>")             'next-history-element)
    <span class="linecomment">;; Debugging command</span>
    (define-key map "<span class="quote">\C-c\C-x\C-d</span>"          'anything-debug-output)
    (define-key map "<span class="quote">\C-c\C-x\C-m</span>"          'anything-display-all-visible-marks)
    (define-key map "<span class="quote">\C-c\C-x\C-b</span>"          'anything-send-bug-report-from-anything)
    <span class="linecomment">;; Use `describe-mode' key in `global-map'.</span>
    (define-key map [f1] nil) <span class="linecomment">; Allow to eval keymap whithout errors.</span>
    (dolist (k (where-is-internal 'describe-mode global-map))
      (define-key map k 'anything-help))
    map)
  "<span class="quote">Keymap for anything.</span>")

 
(defgroup anything nil
  "<span class="quote">Open anything.</span>"
  :prefix "<span class="quote">anything-</span>" :group 'convenience)

(defface anything-header
    '((t (:inherit header-line)))
  "<span class="quote">Face for header lines in the anything buffer.</span>"
  :group 'anything)

(defvar anything-header-face 'anything-header
  "<span class="quote">*Face for header lines in the anything buffer.</span>")

(defface anything-candidate-number
    '((t (:background "<span class="quote">Yellow</span>" :foreground "<span class="quote">black</span>")))
  "<span class="quote">Face for candidate number in mode-line.</span>" :group 'anything)

(defvar anything-selection-face 'highlight
  "<span class="quote">*Face for currently selected item.</span>")

(defvar anything-buffer "<span class="quote">*anything*</span>"
  "<span class="quote">Buffer showing completions.</span>")

(defvar anything-action-buffer "<span class="quote">*anything action*</span>"
  "<span class="quote">Buffer showing actions.</span>")

(defvar anything-selection-overlay nil
  "<span class="quote">Overlay used to highlight the currently selected item.</span>")

(defvar anything-digit-overlays nil
  "<span class="quote">Overlays for digit shortcuts.  See `anything-enable-shortcuts'.</span>")

(defvar anything-candidate-cache nil
  "<span class="quote">Holds the available candidate withing a single anything invocation.</span>")

(defvar anything-pattern
  "<span class="quote">The input pattern used to update the anything buffer.</span>")

(defvar anything-input
  "<span class="quote">The input typed in the candidates panel.</span>")

(defvar anything-async-processes nil
  "<span class="quote">List of information about asynchronous processes managed by anything.</span>")

(defvar anything-digit-shortcut-count 0
  "<span class="quote">Number of digit shortcuts shown in the anything buffer.</span>")

(defvar anything-before-initialize-hook nil
  "<span class="quote">Run before anything initialization.
This hook is run before init functions in `anything-sources'.</span>")

(defvar anything-after-initialize-hook nil
  "<span class="quote">Run after anything initialization.
Global variables are initialized and the anything buffer is created.
But the anything buffer has no contents.</span>")

(defvar anything-update-hook nil
  "<span class="quote">Run after the anything buffer was updated according the new input pattern.
This hook is run at the beginning of buffer.
The first candidate is selected after running this hook.
See also `anything-after-update-hook'.</span>")

(defvar anything-after-update-hook nil
  "<span class="quote">Run after the anything buffer was updated according the new input pattern.
This is very similar to `anything-update-hook' but selection is not moved.
It is useful to select a particular object instead of the first one.</span>")

(defvar anything-cleanup-hook nil
  "<span class="quote">Run after anything minibuffer is closed.
IOW this hook is executed BEFORE performing action.</span>")

(defvar anything-select-action-hook nil
  "<span class="quote">Run when opening the action buffer.</span>")

(defvar anything-before-action-hook nil
  "<span class="quote">Run before executing action.
Contrarily to `anything-cleanup-hook',
this hook run before anything minibuffer is closed
and before performing action.</span>")

(defvar anything-after-action-hook nil
  "<span class="quote">Run after executing action.</span>")

(defvar anything-after-persistent-action-hook nil
  "<span class="quote">Run after executing persistent action.</span>")

(defvar anything-move-selection-before-hook nil
  "<span class="quote">Run before moving selection in `anything-buffer'.</span>")

(defvar anything-move-selection-after-hook nil
  "<span class="quote">Run after moving selection in `anything-buffer'.</span>")

(defvar anything-restored-variables
  '(anything-candidate-number-limit
    anything-source-filter
    anything-source-in-each-line-flag
    anything-map
    anything-sources)
  "<span class="quote">Variables which are restored after `anything' invocation.</span>")

(defvar anything-saved-selection nil
  "<span class="quote">Value of the currently selected object when the action list is shown.</span>")

(defvar anything-current-prefix-arg nil
  "<span class="quote">Record `current-prefix-arg' when exiting minibuffer.</span>")

(defvar anything-candidate-separator
  "<span class="quote">--------------------</span>"
  "<span class="quote">Candidates separator of `multiline' source.</span>")

(defvar anything-current-buffer nil
  "<span class="quote">Current buffer when `anything' is invoked.</span>")

(defvar anything-buffer-file-name nil
  "<span class="quote">Variable `buffer-file-name' when `anything' is invoked.</span>")

(defvar anything-saved-action nil
  "<span class="quote">Saved value of the currently selected action by key.</span>")

(defvar anything-last-sources nil
  "<span class="quote">OBSOLETE!! Sources of previously invoked `anything'.</span>")

(defvar anything-saved-current-source nil
  "<span class="quote">Value of the current source when the action list is shown.</span>")

(defvar anything-compiled-sources nil
  "<span class="quote">Compiled version of `anything-sources'.</span>")

(defvar anything-in-persistent-action nil
  "<span class="quote">Flag whether in persistent-action or not.</span>")

(defvar anything-quick-update nil
  "<span class="quote">If non-nil, suppress displaying sources which are out of screen at first.
They are treated as delayed sources at this input.
This flag makes `anything' a bit faster with many sources.</span>")

(defvar anything-last-sources-local nil
  "<span class="quote">Buffer local value of `anything-sources'.</span>")

(defvar anything-last-buffer nil
  "<span class="quote">`anything-buffer' of previously `anything' session.</span>")

(defvar anything-save-configuration-functions
  '(set-window-configuration . current-window-configuration)
  "<span class="quote">The functions used to restore/save window or frame configurations.
It is a pair where the car is the function to restore window or frame config,
and the cdr is the function to save the window or frame config.

If you want to save and restore frame configuration, set this variable to
 '\(set-frame-configuration . current-frame-configuration\)

Older version saves/restores frame configuration, but the default is changed now
because flickering can occur in some environment. </span>")

(defvar anything-persistent-action-use-special-display nil
  "<span class="quote">If non-nil, use `special-display-function' in persistent action.</span>")

(defvar anything-execute-action-at-once-if-one nil
  "<span class="quote">Execute default action and exit when only one candidate is remaining.
It is useful for `anything' applications.</span>")

(defvar anything-quit-if-no-candidate nil
  "<span class="quote">Quit when there is no candidates when non--nil.
This variable accepts a function, which is executed if no candidate.

It is useful for `anything' applications.</span>")

(defvar anything-scroll-amount nil
  "<span class="quote">Scroll amount when scrolling other window in an anything session.
It is used by `anything-scroll-other-window'
and `anything-scroll-other-window-down'.

If you prefer scrolling line by line, set this value to 1.</span>")

(defvar anything-display-function 'anything-default-display-buffer
  "<span class="quote">Function to display *anything* buffer.
It is `anything-default-display-buffer' by default,
which affects `anything-samewindow'.</span>")

(defvar anything-delayed-init-executed nil)

(defvar anything-mode-line-string nil
  "<span class="quote">Help string displayed in mode-line in `anything'.
It can be a string or a list of two args, in this case,
first arg is a string that will be used as name for candidates number,
second arg any string to display in mode line.
If nil, use default `mode-line-format'.</span>")

(defvar anything-help-message
  "<span class="quote">\\&lt;anything-map&gt;The keys that are defined for `anything' are:
       \\{anything-map}</span>"
  "<span class="quote">Detailed help message string for `anything'.
It also accepts function or variable symbol.</span>")

(defvar anything-source-in-each-line-flag nil
  "<span class="quote">Non-nil means add anything-source text-property in each candidate.
experimental feature.</span>")

(defvaralias 'anything-debug-variables 'anything-debug-forms)

(defvar anything-debug-forms nil
  "<span class="quote">Forms to show in `anything-debug-output'.
Otherwise all variables started with `anything-' are shown.
It is useful for debug.</span>")

(defvar anything-debug nil
  "<span class="quote">If non-nil, write log message into *Anything Log* buffer.
If `debug-on-error' is non-nil, write log message regardless of this variable.
It is disabled by default because *Anything Log* grows quickly.</span>")

(defcustom anything-local-map-override-anything-map t
  "<span class="quote">Override `anything-map' keys with the corresponding ones in source local map.
When non--nil keys in source local map will override same keys in `anything-map'
otherwise same keys in `anything-map' will take precedence.</span>"
  :group 'anything
  :type  'boolean)

 
<span class="linecomment">;; (@* "Internal Variables")</span>
(defvar anything-test-candidate-list nil)
(defvar anything-test-mode nil)
(defvar anything-source-name nil)
(defvar anything-candidate-buffer-alist nil)
(defvar anything-check-minibuffer-input-timer nil)
(defvar anything-match-hash (make-hash-table :test 'equal))
(defvar anything-cib-hash (make-hash-table :test 'equal))
(defvar anything-tick-hash (make-hash-table :test 'equal))
(defvar anything-issued-errors nil)
(defvar anything-shortcut-keys nil)
(defvar anything-once-called-functions nil)
(defvar anything-follow-mode nil)
(defvar anything-let-variables nil)
(defvar anything-split-window-state nil)
(defvar anything-selection-point nil)
(defvar anything-alive-p nil)

 
<span class="linecomment">;; (@* "Utility: logging")</span>
(defun anything-log (format-string &rest args)
  "<span class="quote">Log message if `debug-on-error' or `anything-debug' is non-nil.
Messages are written to the *Anything Log* buffer.

Argument FORMAT-STRING is a string to use with `format'.
Use optional arguments ARGS like in `format'.</span>"
  (when (or debug-on-error anything-debug)
    (with-current-buffer (get-buffer-create "<span class="quote">*Anything Log*</span>")
      (buffer-disable-undo)
      (set (make-local-variable 'inhibit-read-only) t)
      (goto-char (point-max))
      (insert (let ((tm (current-time)))
                (format "<span class="quote">%s.%06d (%s) %s\n</span>"
                        (format-time-string "<span class="quote">%H:%M:%S</span>" tm)
                        (nth 2 tm)
                        (anything-log-get-current-function)
                        (apply #'format (cons format-string args))))))))

(defmacro anything-log-eval (&rest exprs)
  "<span class="quote">Write each EXPRS evaluation result to the *Anything Log* buffer.</span>"
  `(anything-log-eval-internal ',exprs))

(defun anything-log-run-hook (hook)
  "<span class="quote">Run HOOK like `run-hooks' but write these actions to anything log buffer.</span>"
  (anything-log "<span class="quote">executing %s</span>" hook)
  (when (boundp hook)
    (anything-log-eval (symbol-value hook))
    (anything-log-eval (default-value hook)))
  (run-hooks hook)
  (anything-log "<span class="quote">executed %s</span>" hook))

(defun anything-log-eval-internal (exprs)
  "<span class="quote">Eval EXPRS and write results to anything log buffer.</span>"
  (dolist (expr exprs)
    (condition-case err
        (anything-log "<span class="quote">%S = %S</span>" expr (eval expr))
      (error (anything-log "<span class="quote">%S = ERROR!</span>" expr)))))

(defun anything-log-get-current-function ()
  "<span class="quote">Get function name calling `anything-log'.
The original idea is from `tramp-debug-message'.</span>"
  (loop with exclude-func-re = "<span class="quote">^anything-\\(?:interpret\\|log\\|.*funcall\\)</span>"
        for btn from 1 to 40            <span class="linecomment">;avoid inf-loop</span>
        for btf = (second (backtrace-frame btn))
        for fn  = (if (symbolp btf) (symbol-name btf) "<span class="quote"></span>")
        if (and (string-match "<span class="quote">^anything</span>" fn)
                (not (string-match exclude-func-re fn)))
        return fn))

(defun anything-log-error (&rest args)
  "<span class="quote">Accumulate error messages into `anything-issued-errors'.
ARGS are args given to `format'.</span>"
  (apply 'anything-log (concat "<span class="quote">ERROR: </span>" (car args)) (cdr args))
  (let ((msg (apply 'format args)))
    (unless (member msg anything-issued-errors)
      (add-to-list 'anything-issued-errors msg))))

(defvar anything-last-log-file nil)
(defun anything-log-save-maybe ()
  "<span class="quote">May be save log buffer to `anything-last-log-file'.</span>"
  (when (stringp anything-debug)
    (let ((logdir (expand-file-name (format-time-string "<span class="quote">%Y%m%d</span>")
                                    anything-debug)))
      (make-directory logdir t)
      (with-current-buffer (get-buffer-create "<span class="quote">*Anything Log*</span>")
        (write-region (point-min) (point-max)
                      (setq anything-last-log-file
                            (expand-file-name (format-time-string "<span class="quote">%Y%m%d-%H%M%S</span>")
                                              logdir))
                      nil 'silent)
        (erase-buffer)))))

(defun anything-open-last-log ()
  "<span class="quote">Open anything log file of last anything session.</span>"
  (interactive)
  (if anything-last-log-file
      (view-file anything-last-log-file)
      (switch-to-buffer "<span class="quote">*Anything Log*</span>")))

(defun anything-print-error-messages ()
  "<span class="quote">Print error messages in `anything-issued-errors'.</span>"
  (message "<span class="quote">%s</span>" (mapconcat 'identity (reverse anything-issued-errors) "<span class="quote">\n</span>")))

<span class="linecomment">;; (anything-log "test")</span>
<span class="linecomment">;; (switch-to-buffer-other-window "*Anything Log*")</span>

 
<span class="linecomment">;; (@* "Programming Tools")</span>
(defmacro anything-aif (test-form then-form &rest else-forms)
  "<span class="quote">Like `if' but set the result of TEST-FORM in a temprary variable called `it'.
THEN-FORM and ELSE-FORMS are then excuted just like in `if'.</span>"
  (declare (indent 2) (debug t))
  `(let ((it ,test-form))
     (if it ,then-form ,@else-forms)))

(defun anything-mklist (obj)
  "<span class="quote">If OBJ is a list \(but not lambda\), return itself.
Otherwise make a list with one element.</span>"
  (if (and (listp obj) (not (functionp obj)))
      obj
      (list obj)))

 
<span class="linecomment">;; (@* "Anything API")</span>

(defun anything-buffer-get ()
  "<span class="quote">Return `anything-action-buffer' if shown otherwise `anything-buffer'.</span>"
  (if (anything-action-window)
      anything-action-buffer
      anything-buffer))

(defun anything-window ()
  "<span class="quote">Window of `anything-buffer'.</span>"
  (get-buffer-window (anything-buffer-get) 'visible))

(defun anything-action-window ()
  "<span class="quote">Window of `anything-action-buffer'.</span>"
  (get-buffer-window anything-action-buffer 'visible))

(defmacro with-anything-window (&rest body)
  "<span class="quote">Be sure BODY is excuted in the anything window.</span>"
  (declare (indent 0) (debug t))
  `(if anything-test-mode
       (with-current-buffer (anything-buffer-get)
         ,@body)
       (with-selected-window (anything-window)
         ,@body)))

(defmacro with-anything-current-buffer (&rest body)
  "<span class="quote">Eval BODY inside `anything-current-buffer'.</span>"
  (declare (indent 0) (debug t))
  `(with-current-buffer anything-current-buffer
     ,@body))

(defmacro with-anything-restore-variables(&rest body)
  "<span class="quote">Restore `anything-restored-variables' after executing BODY.
`post-command-hook' is handled specially.</span>"
  (declare (indent 0) (debug t))
  `(let ((--orig-vars (mapcar (lambda (v)
                                (cons v (symbol-value v)))
                              anything-restored-variables))
         (--post-command-hook-pair (cons post-command-hook
                                         (default-value 'post-command-hook))))
     (setq post-command-hook '(t))
     (setq-default post-command-hook nil)
     (unwind-protect (progn ,@body)
       (loop for (var . value) in --orig-vars
             do (set var value))
       (setq post-command-hook (car --post-command-hook-pair))
       (setq-default post-command-hook (cdr --post-command-hook-pair))
       (anything-log "<span class="quote">restore variables</span>"))))

(defun* anything-attr (attribute-name &optional
                                      (src (anything-get-current-source)))
  "<span class="quote">Get the value of ATTRIBUTE-NAME of SRC.
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (anything-aif (assq attribute-name src)
      (cdr it)))

(defun* anything-attr* (attribute-name
                        &optional (src (anything-get-current-source)))
  "<span class="quote">Pass the value of ATTRIBUTE-NAME of SRC to `anything-interpret-value'.
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (anything-interpret-value (anything-attr attribute-name src)))

(defun* anything-attr-defined (attribute-name
                               &optional (src (anything-get-current-source)))
  "<span class="quote">Return non-nil if ATTRIBUTE-NAME of SRC is defined.
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (and (assq attribute-name src) t))

(defun* anything-attrset (attribute-name value
                                         &optional
                                         (src (anything-get-current-source)))
  "<span class="quote">Set the value of ATTRIBUTE-NAME of SRC to VALUE.
if SRC is omitted, use current source.
It is useful to write your sources.</span>"
  (anything-aif (assq attribute-name src)
      (setcdr it value)
    (setcdr src (cons (cons attribute-name value) (cdr src))))
  value)

(defun anything-set-source-filter (sources)
  "<span class="quote">Set the value of `anything-source-filter' to SOURCES and update.

This function sets a filter for anything sources and it may be
called while anything is running. It can be used to toggle
displaying of sources dinamically. For example, additional keys
can be bound into `anything-map' to display only the file-related
results if there are too many matches from other sources and
you're after files only:

Shift+F shows only file results from some sources:

\(define-key anything-map \"F\" 'anything-my-show-files-only)

\(defun anything-my-show-files-only ()
  (interactive)
  (anything-set-source-filter '(\"File Name History\"
                                  \"Files from Current Directory\")))

Shift+A shows all results:

\(define-key anything-map \"A\" 'anything-my-show-all)

\(defun anything-my-show-all ()
  (interactive)
  (anything-set-source-filter nil))

Note that you have to prefix the functions with anything- prefix,
otherwise they won't be bound when Anything is used under
Iswitchb. The -my- part is added to avoid collisions with
existing Anything function names.</span>"
  (unless (and (listp sources)
               (loop for name in sources always (stringp name)))
    (error "<span class="quote">Invalid data in `anything-set-source-filter': %S</span>" sources))
  (setq anything-source-filter sources)
  (anything-log-eval anything-source-filter)
  (anything-update))

(defun anything-set-sources (sources &optional no-init no-update)
  "<span class="quote">Set SOURCES during `anything' invocation.
If NO-INIT is non-nil, skip executing init functions of SOURCES.
If NO-UPDATE is non-nil, skip executing `anything-update'.</span>"
  (with-current-buffer anything-buffer
    (setq anything-compiled-sources nil
          anything-sources sources
          anything-last-sources-local sources)
    (anything-log-eval anything-compiled-sources anything-sources))
  (unless no-init (anything-funcall-foreach 'init))
  (unless no-update (anything-update)))

(defvar anything-compile-source-functions
  '(anything-compile-source--type
    anything-compile-source--dummy
    anything-compile-source--disable-shortcuts
    anything-compile-source--candidates-in-buffer)
  "<span class="quote">Functions to compile elements of `anything-sources' (plug-in).</span>")

(defun anything-get-sources ()
  "<span class="quote">Return compiled `anything-sources', which is memoized.

Attributes:

- type
  `anything-type-attributes' are merged in.
- candidates-buffer
  candidates, volatile and match attribute are created.</span>"
  (cond
    <span class="linecomment">;; action</span>
    ((anything-action-window)
     anything-sources)
    <span class="linecomment">;; memoized</span>
    (anything-compiled-sources)
    <span class="linecomment">;; first time</span>
    (t
     (prog1
         (setq anything-compiled-sources
               (anything-compile-sources
                anything-sources anything-compile-source-functions))
       (anything-log-eval anything-compiled-sources)))))

(defun* anything-get-selection (&optional (buffer nil buffer-s)
                                          force-display-part)
  "<span class="quote">Return the currently selected item or nil.
if BUFFER is nil or unspecified, use anything-buffer as default value.
If FORCE-DISPLAY-PART is non-nil, return the display string.
If FORCE-DISPLAY-PART value is 'withprop the display string is returned
with its properties.</span>"
  (setq buffer (if (and buffer buffer-s) buffer anything-buffer))
  (unless (anything-empty-buffer-p buffer)
    (with-current-buffer buffer
      (let* ((disp-fn (if (eq force-display-part 'withprop)
                          'buffer-substring
                          'buffer-substring-no-properties))
             (selection
             (or (and (not force-display-part)
                      (get-text-property (overlay-start
                                          anything-selection-overlay)
                                         'anything-realvalue))
                 <span class="linecomment">;; It is needed to return properties of DISP in some case,</span>
                 <span class="linecomment">;; e.g for `anything-confirm-and-exit-minibuffer',</span>
                 <span class="linecomment">;; so use `buffer-substring' here when 'withprop is specified.</span>
                 (let ((disp (funcall disp-fn
                              (overlay-start anything-selection-overlay)
                              (1- (overlay-end anything-selection-overlay))))
                       (source (anything-get-current-source)))
                   (anything-aif (and (not force-display-part)
                                      (assoc-default 'display-to-real source))
                       (anything-funcall-with-source source it disp)
                     disp)))))
        (unless (equal selection "<span class="quote"></span>")
          (anything-log-eval selection)
          selection)))))

(defun anything-get-action ()
  "<span class="quote">Return the associated action for the selected candidate.
It is a function symbol \(sole action\) or list
of \(action-display . function\).</span>"
  (unless (anything-empty-buffer-p (anything-buffer-get))
    (anything-aif (anything-attr 'action-transformer)
        (anything-composed-funcall-with-source
         (anything-get-current-source) it
         (anything-attr 'action) (anything-get-selection))
      (anything-attr 'action))))

(defun anything-get-current-source ()
  "<span class="quote">Return the source for the current selection.
Use it in init, candidates, action, candidate-transformer,
filtered-candidate-transformer functions.</span>"
  (declare (special source))
  <span class="linecomment">;; The name `anything-get-current-source' should be used in init function etc.</span>
  (if (and (boundp 'anything-source-name) (stringp anything-source-name))
      source
      (with-current-buffer (anything-buffer-get)
        (or
         <span class="linecomment">;; This happen only when `anything-source-in-each-line-flag'</span>
         <span class="linecomment">;; is non--nil and there is candidates in buffer.</span>
         (get-text-property (point) 'anything-source)
         <span class="linecomment">;; Return nil when no--candidates.</span>
         (block exit
           <span class="linecomment">;; This goto-char shouldn't be necessary, but point is moved to</span>
           <span class="linecomment">;; point-min somewhere else which shouldn't happen.</span>
           (goto-char (overlay-start anything-selection-overlay))
           (let* ((header-pos (or (anything-get-previous-header-pos)
                                  (anything-get-next-header-pos)))
                  (source-name
                   (save-excursion
                     (unless header-pos
                       (return-from exit nil))
                     (goto-char header-pos)
                     (anything-current-line-contents))))
             (loop for source in (anything-get-sources) thereis
                   (and (equal (assoc-default 'name source) source-name)
                        source))))))))

(defun anything-buffer-is-modified (buffer)
  "<span class="quote">Return non-nil when BUFFER is modified since `anything' was invoked.</span>"
  (let* ((b (get-buffer buffer))
         (key (concat (buffer-name b) "<span class="quote">/</span>" (anything-attr 'name)))
         (source-tick (or (gethash key anything-tick-hash) 0))
         (buffer-tick (buffer-chars-modified-tick b))
         (modifiedp (/= source-tick buffer-tick)))
    (puthash key buffer-tick anything-tick-hash)
    (anything-log-eval buffer modifiedp)
    modifiedp))

(defun anything-current-buffer-is-modified ()
  "<span class="quote">Check if `anything-current-buffer' is modified since `anything' was invoked.</span>"
  (anything-buffer-is-modified anything-current-buffer))

(defvar anything-quit nil)
(defun anything-run-after-quit (function &rest args)
  "<span class="quote">Perform an action after quitting `anything'.
The action is to call FUNCTION with arguments ARGS.</span>"
  (setq anything-quit t)
  (anything-kill-async-processes)
  (anything-log-eval function args)
  (apply 'run-with-idle-timer 0 nil function args)
  (anything-exit-minibuffer))


(defun define-anything-type-attribute (type definition &optional doc)
  "<span class="quote">Register type attribute of TYPE as DEFINITION with DOC.
DOC is displayed in `anything-type-attributes' docstring.

Use this function is better than setting `anything-type-attributes' directly.</span>"
  (loop for i in definition do
        <span class="linecomment">;; without `ignore-errors', error at emacs22</span>
        (ignore-errors (setf i (delete nil i))))
  (anything-add-type-attribute type definition)
  (and doc (anything-document-type-attribute type doc))
  nil)

(defvaralias 'anything-attributes 'anything-additional-attributes)
(defvar anything-additional-attributes nil
  "<span class="quote">List of all `anything' attributes.</span>")

(defun anything-document-attribute (attribute short-doc &optional long-doc)
  "<span class="quote">Register ATTRIBUTE documentation introduced by plug-in.
SHORT-DOC is displayed beside attribute name.
LONG-DOC is displayed below attribute name and short documentation.</span>"
  (if long-doc
      (setq short-doc (concat "<span class="quote">(</span>" short-doc "<span class="quote">)</span>"))
      (setq long-doc short-doc
            short-doc "<span class="quote"></span>"))
  (add-to-list 'anything-additional-attributes attribute t)
  (put attribute 'anything-attrdoc
       (concat "<span class="quote">- </span>" (symbol-name attribute)
               "<span class="quote"> </span>" short-doc "<span class="quote">\n\n</span>" long-doc "<span class="quote">\n</span>")))

(put 'anything-document-attribute 'lisp-indent-function 2)

(defun anything-interpret-value (value &optional source)
  "<span class="quote">Interpret VALUE as variable, function or literal.
If VALUE is a function, call it with no arguments and return the value.
If SOURCE is `anything' source, `anything-source-name' is source name.

If VALUE is a variable, return the value.

If VALUE is a symbol, but it is not a function or a variable, cause an error.

Otherwise, return VALUE itself.</span>"
  (cond ((and source (functionp value))
         (anything-funcall-with-source source value))
        ((functionp value)
         (funcall value))
        ((and (symbolp value) (boundp value))
         (symbol-value value))
        ((symbolp value)
         (error "<span class="quote">anything-interpret-value: Symbol must be a function or a variable</span>"))
        (t
         value)))

(defun anything-once (function &rest args)
  "<span class="quote">Ensure FUNCTION with ARGS to be called once in `anything' session.</span>"
  (let ((spec (cons function args)))
    (unless (member spec anything-once-called-functions)
      (apply function args)
      (push spec anything-once-called-functions))))

 
<span class="linecomment">;; (@* "Core: API helper")</span>
(defun* anything-empty-buffer-p (&optional (buffer anything-buffer))
  "<span class="quote">Check if BUFFER have candidates.
Default value for BUFFER is `anything-buffer'.</span>"
  (zerop (buffer-size (and buffer (get-buffer buffer)))))

(defun anything-let-eval-varlist (varlist)
  "<span class="quote">Return the list of pairs VARLIST with each cdr of pair evaluated.
If VARLIST contain single elements, those are returned
as a list of one element.</span>"
  (mapcar (lambda (pair)
            (if (listp pair)
                (cons (car pair) (eval (cadr pair)))
                (cons pair nil)))
          varlist))

<span class="linecomment">;; [NOT USED]</span>
<span class="linecomment">;; (defun anything-let*-eval-varlist (varlist)</span>
<span class="linecomment">;;   (let ((vars (mapcar (lambda (pair)</span>
<span class="linecomment">;;                         (or (car-safe pair) pair))</span>
<span class="linecomment">;;                       varlist)))</span>
<span class="linecomment">;;     (eval `(let ,vars</span>
<span class="linecomment">;;              ,@(mapcar (lambda (pair)</span>
<span class="linecomment">;;                          (if (listp pair)</span>
<span class="linecomment">;;                              `(setq ,(car pair) ,(cadr pair))</span>
<span class="linecomment">;;                            `(setq ,pair nil)))</span>
<span class="linecomment">;;                        varlist)</span>
<span class="linecomment">;;              (mapcar (lambda (v)</span>
<span class="linecomment">;;                        (cons v (symbol-value v)))</span>
<span class="linecomment">;;                      ',vars)))))</span>

(defun anything-let-internal (binding bodyfunc)
  "<span class="quote">Set BINDING to anything buffer-local variables and Evaluate BODYFUNC.
BINDING is a list of \(VARNAME . VALUE\) pair.</span>"
  (setq anything-let-variables binding)
  (unwind-protect
       (funcall bodyfunc)
    (setq anything-let-variables nil)))

 
<span class="linecomment">;; (@* "Core: tools")</span>
(defun anything-current-line-contents ()
  "<span class="quote">Current line string without properties.</span>"
  (buffer-substring-no-properties (point-at-bol) (point-at-eol)))

(defun anything-funcall-with-source (source func &rest args)
  "<span class="quote">Call from SOURCE FUNC list or single function FUNC with ARGS.
FUNC can be a symbol or a list of functions.
Return the result of last function call.</span>"
  (let ((anything-source-name (assoc-default 'name source))
        result)
    (anything-log-eval anything-source-name func args)
    (dolist (func (if (functionp func) (list func) func) result)
      (setq result (apply func args)))))

(defun anything-funcall-foreach (sym)
  "<span class="quote">Call the function SYM for each source if any.</span>"
  (dolist (source (anything-get-sources))
    (anything-aif (assoc-default sym source)
        (anything-funcall-with-source source it))))

(defun anything-normalize-sources (sources)
  "<span class="quote">If SOURCES is only one source, make a list of one element.</span>"
  (cond ((or (and sources
                  (symbolp sources))
             (and (listp sources) (assq 'name sources)))
         (list sources))
        (sources)
        (t anything-sources)))

(defun anything-approximate-candidate-number (&optional in-current-source)
  "<span class="quote">Return approximate number of candidates in `anything-buffer'.
If IN-CURRENT-SOURCE is provided return number of candidates
in the source where point is.
It is used to check if candidate number is 0, 1, or 2+.</span>"
  (with-current-buffer anything-buffer
    (save-excursion
      (if in-current-source
          (goto-char (anything-get-previous-header-pos))
          (goto-char (point-min)))
      (forward-line 1)
      (let ((count-multi 1))
        (if (anything-pos-multiline-p)
            (save-excursion
              (loop while (and (not (if in-current-source
                                        (save-excursion
                                          (forward-line 2)
                                          (or (anything-pos-header-line-p) (eobp)))
                                        (eobp)))
                               (search-forward anything-candidate-separator nil t))
                    do (incf count-multi)
                    finally return count-multi))
            (save-excursion
              (loop with ln = 0
                    while (not (if in-current-source
                                   (or (anything-pos-header-line-p) (eobp))
                                   (eobp)))
                    unless (anything-pos-header-line-p)
                    do (incf ln)
                    do (forward-line 1) finally return ln)))))))

(defmacro with-anything-quittable (&rest body)
  "<span class="quote">If an error occur in execution of BODY, quit anything safely.</span>"
  (declare (indent 0) (debug t))
  `(let (inhibit-quit)
     (condition-case v
         (progn ,@body)
       (quit (setq anything-quit t)
             (exit-minibuffer)
             (keyboard-quit)))))

(defun anything-compose (arg-lst func-lst)
  "<span class="quote">Apply arguments specified in ARG-LST with each function of FUNC-LST.
The result of each function will be the new `car' of ARG-LST.

This function allows easy sequencing of transformer functions.</span>"
  (dolist (func func-lst)
    (setcar arg-lst (apply func arg-lst)))
  (car arg-lst))

(defun anything-composed-funcall-with-source (source funcs &rest args)
  "<span class="quote">With SOURCE apply `anything-funcall-with-source' with each FUNCS and ARGS.
This is used in transformers to modify candidates list.</span>"
  (if (functionp funcs)
      (apply 'anything-funcall-with-source source funcs args)
      (apply 'anything-funcall-with-source source
             (lambda (&rest args)
               (anything-compose args funcs))
             args)))

(defun anything-new-timer (variable timer)
  "<span class="quote">Give VARIABLE value to TIMER and cancel old timer.</span>"
  (anything-aif (symbol-value variable)
      (cancel-timer it))
  (set variable timer))

 
<span class="linecomment">;; (@* "Core: entry point")</span>
(defconst anything-argument-keys
  '(:sources :input :prompt :resume :preselect :buffer :keymap :default :history))

<span class="linecomment">;;;###autoload</span>
(defun anything (&rest plist)
  "<span class="quote">Main function to execute anything sources.

Keywords supported:
:sources :input :prompt :resume :preselect :buffer :keymap :default :history
Extra keywords are supported and can be added, see below.

When call interactively with no arguments deprecated `anything-sources'
will be used if non--nil.

PLIST is a list like \(:key1 val1 :key2 val2 ...\) or
\(&optional sources input prompt resume preselect buffer keymap default history\).

Basic keywords are the following:

\:sources

Temporary value of `anything-sources'.  It also accepts a
symbol, interpreted as a variable of an anything source.  It
also accepts an alist representing an anything source, which is
detected by \(assq 'name ANY-SOURCES\)

\:input

Temporary value of `anything-pattern', ie. initial input of minibuffer.

\:prompt

Prompt other than \"pattern: \".

\:resume

If t, Resurrect previously instance of `anything'.  Skip the initialization.
If 'noresume, this instance of `anything' cannot be resumed.

\:preselect

Initially selected candidate.  Specified by exact candidate or a regexp.

\:buffer

`anything-buffer' instead of *anything*.

\:keymap

`anything-map' for current `anything' session.

\:default

A default argument that will be inserted in minibuffer \
with \\&lt;minibuffer-local-map&gt;\\[next-history-element].
When nil of not present `thing-at-point' will be used instead.

\:history

By default all minibuffer input is pushed to `minibuffer-history',
if an argument HISTORY is provided, input will be pushed to HISTORY.
History element should be a symbol.

Of course, conventional arguments are supported, the two are same.

\(anything :sources sources :input input :prompt prompt :resume resume
           :preselect preselect :buffer buffer :keymap keymap :default default
           :history history\)
\(anything sources input prompt resume preselect buffer keymap default history\)

Other keywords are interpreted as local variables of this anything session.
The `anything-' prefix can be omitted.  For example,

\(anything :sources 'anything-c-source-buffers
           :buffer \"*buffers*\" :candidate-number-limit 10\)

means starting anything session with `anything-c-source-buffers'
source in *buffers* buffer and set variable `anything-candidate-number-limit'
to 10 as session local variable.</span>"
  (interactive)
  (if (keywordp (car plist))
      (anything-let-internal
       (anything-parse-keys plist)
       (lambda ()
         (apply 'anything
                (mapcar (lambda (key) (plist-get plist key))
                        anything-argument-keys))))
      (apply 'anything-internal plist)))

(defun anything-parse-keys (keys)
  "<span class="quote">Parse the KEYS arguments of `anything'.
Return only the keys that are not in `anything-argument-keys'.
It is used to set local variables via `anything-let-internal'.
This allow to add arguments that are not part of `anything-argument-keys',
but are valid anything attributes.
i.e :candidate-number-limit will be bound to `anything-candidate-number-limit'
in source.</span>"
  <span class="linecomment">;; (anything-parse-keys '(:sources ((name . "test")</span>
  <span class="linecomment">;;                                  (candidates . (a b c)))</span>
  <span class="linecomment">;;                        :buffer "toto"</span>
  <span class="linecomment">;;                        :candidate-number-limit 4))</span>
  <span class="linecomment">;; ==&gt; ((anything-candidate-number-limit . 4))</span>
  (loop for (key value) on keys by #'cddr
        for symname = (substring (symbol-name key) 1)
        for sym = (intern (if (string-match "<span class="quote">^anything-</span>" symname)
                              symname
                              (concat "<span class="quote">anything-</span>" symname)))
        unless (memq key anything-argument-keys)
        collect (cons sym value)))

<span class="linecomment">;;; (@* "Core: entry point helper")</span>
(defun anything-internal (&optional
                            any-sources any-input
                            any-prompt any-resume
                            any-preselect any-buffer
                            any-keymap any-default any-history)
  "<span class="quote">The internal anything function called by `anything'.
For ANY-SOURCES ANY-INPUT ANY-PROMPT ANY-RESUME ANY-PRESELECT ANY-BUFFER and
ANY-KEYMAP ANY-DEFAULT ANY-HISTORY See `anything'.</span>"
  (anything-log (concat "<span class="quote">[Start session] </span>" (make-string 41 ?+)))
  (anything-log-eval any-prompt any-preselect
                     any-buffer any-keymap any-default)
  (let ((old-overridding-local-map overriding-local-map))
    (unwind-protect
         (condition-case v
             (let ( <span class="linecomment">;; It is needed because `anything-source-name' is non-nil</span>
                   <span class="linecomment">;; when `anything' is invoked by action. Awful global scope.</span>
                   anything-source-name
                   anything-in-persistent-action
                   anything-quit
                   <span class="linecomment">;; [2012-10-16] move to `anything-update' to show right value of `case-fold-search'</span>
                   <span class="linecomment">;; (case-fold-search t)</span>
                   (anything-buffer (or any-buffer anything-buffer))
                   <span class="linecomment">;; cua-mode ; avoid error when region is selected</span>
                   )
               (with-anything-restore-variables
                 (anything-initialize any-resume any-input any-sources)
                 (anything-display-buffer anything-buffer)
                 (anything-log "<span class="quote">show prompt</span>")
                 (unwind-protect
                      (anything-read-pattern-maybe
                       any-prompt any-input any-preselect
                       any-resume any-keymap any-default
                       (when (and any-history (symbolp any-history)) any-history))
                   (anything-cleanup)))
               (prog1 (unless anything-quit
                        (anything-execute-selection-action-1))
                 (anything-log (concat "<span class="quote">[End session] </span>" (make-string 41 ?-)))))
           (quit
            (anything-restore-position-on-quit)
            (anything-log (concat "<span class="quote">[End session (quit)] </span>" (make-string 34 ?-)))
            nil))
      (setq overriding-local-map old-overridding-local-map)
      (anything-log-save-maybe))))

 
<span class="linecomment">;;; Anything resume</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defun* anything-resume (&optional
                         (any-buffer anything-last-buffer)
                         buffer-pattern (any-resume t))
  "<span class="quote">Resurrect previously invoked `anything'.
Called with a prefix arg, allow choosing among all existing
anything buffers.  i.e choose among various anything sessions.</span>"
  (interactive)
  (when (or current-prefix-arg buffer-pattern)
    (setq any-buffer (anything-resume-select-buffer buffer-pattern)))
  (setq anything-compiled-sources nil)
  (anything
   :sources (or (buffer-local-value 'anything-last-sources-local (get-buffer any-buffer))
                anything-last-sources anything-sources)
   :input (buffer-local-value 'anything-input-local (get-buffer any-buffer))
   :resume any-resume
   :buffer any-buffer))

<span class="linecomment">;;; rubikitch: experimental</span>
<span class="linecomment">;;; I use this and check it whether I am convenient.</span>
<span class="linecomment">;;; I may introduce an option to control the behavior.</span>
(defun* anything-resume-window-only (&optional
                                     (any-buffer anything-last-buffer)
                                     buffer-pattern)
  (interactive)
  (anything-resume any-buffer buffer-pattern 'window-only))

(defun anything-resume-p (any-resume)
  "<span class="quote">Whether current anything session is resumed or not.
Just check if ANY-RESUME value is t or window-only.</span>"
  (memq any-resume '(t window-only)))

(defun anything-resume-select-buffer (input)
  "<span class="quote">Resume precedent anything session with initial input INPUT.</span>"
  (or (anything :sources '(((name . "<span class="quote">Resume anything buffer</span>")
                            (candidates . anything-buffers)
                            (action . identity)))
                :input  input
                :resume 'noresume
                :buffer "<span class="quote">*anything resume*</span>")
      (keyboard-quit)))

 
<span class="linecomment">;;;###autoload</span>
(defun anything-at-point (&optional
                            any-sources any-input
                            any-prompt any-resume
                            any-preselect any-buffer)
  "<span class="quote">Call anything with symbol at point as initial input.
ANY-SOURCES ANY-INPUT ANY-PROMPT ANY-RESUME ANY-PRESELECT and ANY-BUFFER
are same args as in `anything'.</span>"
  (interactive)
  (anything :sources any-sources
            :input (if current-prefix-arg
                       (concat "<span class="quote">\\b</span>" (thing-at-point 'symbol) "<span class="quote">\\b</span>"
                               (if (featurep 'anything-match-plugin) "<span class="quote"> </span>" "<span class="quote"></span>"))
                       any-input)
            :prompt any-prompt
            :resume any-resume
            :preselect any-preselect
            :buffer any-buffer))

<span class="linecomment">;;;###autoload</span>
(defun anything-other-buffer (any-sources any-buffer)
  "<span class="quote">Simplified interface of `anything' with other `anything-buffer'.
Call `anything' with only ANY-SOURCES and ANY-BUFFER as args.</span>"
  (anything :sources any-sources :buffer any-buffer))

(defun anything-nest (&rest same-as-anything)
  "<span class="quote">Allow calling `anything' whithin a running anything session.</span>"
  (with-anything-window
    (let (anything-current-position
          anything-current-buffer
          (orig-anything-current-buffer anything-current-buffer)
          (orig-anything-buffer anything-buffer)
          (orig-anything-last-frame-or-window-configuration
           anything-last-frame-or-window-configuration)
          anything-pattern
          (anything-buffer (or (getf same-as-anything :buffer)
                               (nth 5 same-as-anything)
                               "<span class="quote">*Anything*</span>"))
          anything-sources
          anything-compiled-sources
          (anything-samewindow t)
          (enable-recursive-minibuffers t))
      (unwind-protect
           (apply #'anything same-as-anything)
        (with-current-buffer orig-anything-buffer
          (anything-initialize-overlays orig-anything-buffer)
          (setq anything-buffer (current-buffer))
          (anything-mark-current-line)
          (setq anything-last-frame-or-window-configuration
                orig-anything-last-frame-or-window-configuration)
          (setq cursor-type t)
          (setq anything-current-buffer orig-anything-current-buffer))))))

 
<span class="linecomment">;;; Initialize</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;</span>
(defvar anything-buffers nil
  "<span class="quote">All of `anything-buffer' in most recently used order.</span>")
(defun anything-initialize (any-resume any-input any-sources)
  "<span class="quote">Start initialization of `anything' session.
For ANY-RESUME ANY-INPUT and ANY-SOURCES See `anything'.</span>"
  (anything-log "<span class="quote">start initialization: any-resume=%S any-input=%S</span>" any-resume any-input)
  (anything-frame-or-window-configuration 'save)
  (setq anything-sources (anything-normalize-sources any-sources))
  (anything-log "<span class="quote">sources = %S</span>" anything-sources)
  (anything-hooks 'setup)
  (anything-current-position 'save)
  (if (anything-resume-p any-resume)
      (anything-initialize-overlays (anything-buffer-get))
      (anything-initial-setup))
  (unless (eq any-resume 'noresume)
    (anything-recent-push anything-buffer 'anything-buffers)
    (setq anything-last-buffer anything-buffer))
  (when any-input (setq anything-input any-input anything-pattern any-input))
  (and (anything-resume-p any-resume) (anything-funcall-foreach 'resume))
  (anything-log "<span class="quote">end initialization</span>"))

(defun anything-execute-selection-action-1 ()
  "<span class="quote">Execute current action.</span>"
  (anything-log-run-hook 'anything-before-action-hook)
  (unwind-protect
       (anything-execute-selection-action)
    (anything-aif (get-buffer anything-action-buffer)
        (kill-buffer it))
    (anything-log-run-hook 'anything-after-action-hook)))

(defun anything-restore-position-on-quit ()
  "<span class="quote">Restore position in `anything-current-buffer' when quitting.</span>"
  (anything-current-position 'restore))

(defun anything-recent-push (elt list-var)
  "<span class="quote">Add ELT to the value of LIST-VAR as most recently used value.</span>"
  (let ((m (member elt (symbol-value list-var))))
    (and m (set list-var (delq (car m) (symbol-value list-var))))
    (push elt (symbol-value list-var))))

 
<span class="linecomment">;;; (@* "Core: Accessors")</span>
<span class="linecomment">;;; rubikitch: I love to create functions to control variables.</span>
(defvar anything-current-position nil
  "<span class="quote">Cons of \(point . window-start\)  when `anything' is invoked.
It is needed to restore position in `anything-current-buffer'
when `anything' is keyboard-quitted.</span>")
(defun anything-current-position (save-or-restore)
  "<span class="quote">Restore or save current position in `anything-current-buffer'.
Argument SAVE-OR-RESTORE is one of save or restore.</span>"
  (case save-or-restore
    (save
     (anything-log "<span class="quote">Save position at %S</span>" (cons (point) (window-start)))
     (setq anything-current-position (cons (point) (window-start))))
    (restore
     (anything-log "<span class="quote">Restore position at  %S in buffer %s</span>"
                   anything-current-position
                   (buffer-name (current-buffer)))
     (goto-char (car anything-current-position))
     <span class="linecomment">;; Fix this position with the NOFORCE arg of `set-window-start'</span>
     <span class="linecomment">;; otherwise, if there is some other buffer than `anything-current-buffer'</span>
     <span class="linecomment">;; one, position will be lost.</span>
     (set-window-start (selected-window) (cdr anything-current-position) t))))


<span class="linecomment">;; Internal.</span>
(defvar anything-last-frame-or-window-configuration nil
  "<span class="quote">Used to store window or frame configuration when anything start.</span>")
(defun anything-frame-or-window-configuration (save-or-restore)
  "<span class="quote">Save or restore last frame or window configuration.
Possible value of SAVE-OR-RESTORE are 'save and 'restore.
window or frame configuration is saved/restored according to values of
`anything-save-configuration-functions'.</span>"
  (anything-log-eval anything-save-configuration-functions)
  (case save-or-restore
    (save    (setq anything-last-frame-or-window-configuration
                   (funcall (cdr anything-save-configuration-functions))))
    (restore (funcall (car anything-save-configuration-functions)
                      anything-last-frame-or-window-configuration)
             <span class="linecomment">;; Restore frame focus.</span>
             (let ((frame (and (listp anything-last-frame-or-window-configuration)
                               (caadr anything-last-frame-or-window-configuration))))
               <span class="linecomment">;; If `anything-save-configuration-functions' are window functions</span>
               <span class="linecomment">;; frame should be nil, use current frame.</span>
               (unless (framep frame)
                 (setq frame (selected-frame)))
               (select-frame-set-input-focus frame)))))

 
<span class="linecomment">;; (@* "Core: Display *anything* buffer")</span>
(defun anything-display-buffer (buf)
  "<span class="quote">Display *anything* buffer BUF.</span>"
  (let (pop-up-frames)
    (funcall (with-current-buffer buf anything-display-function) buf)))

(defun anything-default-display-buffer (buf)
  "<span class="quote">Default function to display BUF.
Where BUF is generally `anything-buffer'.
It use `switch-to-buffer' or `pop-to-buffer' depending of value of
`anything-samewindow'.</span>"
  (funcall (if anything-samewindow 'switch-to-buffer 'pop-to-buffer) buf))

 
<span class="linecomment">;; (@* "Core: initialize")</span>
(defun anything-initial-setup ()
  "<span class="quote">Initialize anything settings and set up the anything buffer.</span>"
  (anything-log-run-hook 'anything-before-initialize-hook)
  (setq anything-current-prefix-arg nil)
  (setq anything-once-called-functions nil)
  (setq anything-delayed-init-executed nil)
  (setq anything-alive-p t)
  (setq anything-current-buffer
        (if (minibuffer-window-active-p (minibuffer-window))
            <span class="linecomment">;; If minibuffer is active be sure to use it's buffer</span>
            <span class="linecomment">;; as `anything-current-buffer'.</span>
            (window-buffer (active-minibuffer-window))
            (current-buffer)))
  (setq anything-buffer-file-name buffer-file-name)
  (setq anything-issued-errors nil)
  (setq anything-compiled-sources nil)
  (setq anything-saved-current-source nil)
  (if (or (not (boundp 'split-width-threshold))
          (not split-width-threshold)
          (and (integerp split-width-threshold)
               (&gt;= split-width-threshold (+ (frame-width) 4))))
      (setq anything-split-window-state 'vertical)
      (setq anything-split-window-state 'horizontal))
  <span class="linecomment">;; Call the init function for sources where appropriate</span>
  (anything-funcall-foreach 'init)
  (setq anything-pattern "<span class="quote"></span>")
  (setq anything-input "<span class="quote"></span>")
  (setq anything-candidate-cache nil)
  (setq anything-last-sources anything-sources)
  (anything-create-anything-buffer)
  (anything-log-run-hook 'anything-after-initialize-hook))

(defvar anything-reading-pattern nil
  "<span class="quote">Whether in `read-string' in anything or not.</span>")

(defun anything-read-pattern-maybe (any-prompt any-input
                                    any-preselect any-resume any-keymap
                                    any-default any-history)
  "<span class="quote">Read pattern with prompt ANY-PROMPT and initial input ANY-INPUT.
For ANY-PRESELECT ANY-RESUME ANY-KEYMAP, See `anything'.</span>"
  (if (anything-resume-p any-resume)
      (anything-mark-current-line t)
      (anything-update any-preselect))
  (with-current-buffer (anything-buffer-get)
    (let ((src-keymap (assoc-default 'keymap (anything-get-current-source))))
      <span class="linecomment">;; Startup with the first keymap found either in current source</span>
      <span class="linecomment">;; or anything arg, otherwise use global value of `anything-map'.</span>
      <span class="linecomment">;; This map will be used as a `minibuffer-local-map'.</span>
      <span class="linecomment">;; Maybe it will be overriden when changing source</span>
      <span class="linecomment">;; by `anything-maybe-update-keymap'.</span>
      (unless anything-local-map-override-anything-map
        (anything-aif (or src-keymap any-keymap)
            (ignore-errors
              (set-keymap-parent it anything-map))))
      (set (make-local-variable 'anything-map)
           (or src-keymap any-keymap anything-map))
      (anything-log-eval (anything-approximate-candidate-number)
                         anything-execute-action-at-once-if-one
                         anything-quit-if-no-candidate)
      (cond ((and anything-execute-action-at-once-if-one
                  (= (anything-approximate-candidate-number) 1))
             (ignore))
            ((and anything-quit-if-no-candidate
                  (= (anything-approximate-candidate-number) 0))
             (setq anything-quit t)
             (and (functionp anything-quit-if-no-candidate)
                  (funcall anything-quit-if-no-candidate)))
            (t
             (let ((anything-reading-pattern t)
                   (tap (or any-default
                            (with-anything-current-buffer
                              (thing-at-point 'symbol)))))
               (read-from-minibuffer (or any-prompt "<span class="quote">pattern: </span>")
                                     any-input anything-map
                                     nil any-history tap)))))))
               
(defun anything-maybe-update-keymap ()
  "<span class="quote">Handle differents keymaps in multiples sources.
This function is meant to be run in `anything-move-selection-after-hook'.
It will override `anything-map' with the keymap attribute of current source
if some when multiples sources are present.</span>"
  (with-anything-window
    (let ((kmap (assoc-default 'keymap (anything-get-current-source))))
      (when kmap
        (and (not anything-local-map-override-anything-map)
             (ignore-errors (set-keymap-parent kmap (default-value 'anything-map))))
        (setq overriding-local-map kmap)))))
(add-hook 'anything-move-selection-after-hook 'anything-maybe-update-keymap)

(defun anything-create-anything-buffer (&optional test-mode)
  "<span class="quote">Create newly created `anything-buffer'.
If TEST-MODE is non-nil, clear `anything-candidate-cache'.</span>"
  (when test-mode
    (setq anything-candidate-cache nil))
  (with-current-buffer (get-buffer-create anything-buffer)
    (anything-log "<span class="quote">kill local variables: %S</span>" (buffer-local-variables))
    (kill-all-local-variables)
    (set (make-local-variable 'inhibit-read-only) t)
    (buffer-disable-undo)
    (erase-buffer)
    (set (make-local-variable 'inhibit-read-only) t)
    (set (make-local-variable 'anything-last-sources-local) anything-sources)
    (set (make-local-variable 'anything-follow-mode) nil)
    (set (make-local-variable 'anything-display-function) anything-display-function)
    (set (make-local-variable 'anything-selection-point) nil)
    (anything-initialize-persistent-action)
    (anything-log-eval anything-display-function anything-let-variables)
    (loop for (var . val) in anything-let-variables
          do (set (make-local-variable var) val))
    (setq cursor-type nil)
    (setq mode-name "<span class="quote">Anything</span>"))
  (anything-initialize-overlays anything-buffer)
  (get-buffer anything-buffer))

(defun anything-initialize-overlays (buffer)
  "<span class="quote">Initialize anything overlays in BUFFER.</span>"
  (anything-log "<span class="quote">overlay setup</span>")
  (if anything-selection-overlay
      <span class="linecomment">;; make sure the overlay belongs to the anything buffer if</span>
      <span class="linecomment">;; it's newly created</span>
      (move-overlay anything-selection-overlay (point-min) (point-min)
                    (get-buffer buffer))

      (setq anything-selection-overlay
            (make-overlay (point-min) (point-min) (get-buffer buffer)))
      (overlay-put anything-selection-overlay 'face anything-selection-face))

  (cond (anything-enable-shortcuts
         (setq anything-shortcut-keys
               (assoc-default anything-enable-shortcuts anything-shortcut-keys-alist))
         (unless anything-digit-overlays
           (setq anything-digit-overlays
                 (loop for key across anything-shortcut-keys
                       for overlay = (make-overlay (point-min) (point-min)
                                                   (get-buffer buffer))
                       do (overlay-put overlay 'before-string
                                       (format "<span class="quote">%s - </span>" (upcase (make-string 1 key))))
                       collect overlay))))
        (anything-digit-overlays
         (mapc 'delete-overlay anything-digit-overlays)
         (setq anything-digit-overlays nil))))

(defun anything-hooks (setup-or-cleanup)
  "<span class="quote">Add or remove hooks according to SETUP-OR-CLEANUP value.
if SETUP-OR-CLEANUP value is setup add hooks, any other value
will remove hooks.
hooks concerned are `post-command-hook' and `minibuffer-setup-hook'.</span>"
  (let ((hooks '((post-command-hook anything-check-minibuffer-input)
                 (minibuffer-setup-hook anything-print-error-messages))))
    (if (eq setup-or-cleanup 'setup)
        (dolist (args hooks) (apply 'add-hook args))
        (dolist (args (reverse hooks)) (apply 'remove-hook args)))))

 
<span class="linecomment">;; (@* "Core: clean up")</span>
<span class="linecomment">;;; TODO move</span>
(defun anything-cleanup ()
  "<span class="quote">Clean up the mess when anything exit or quit.</span>"
  (anything-log "<span class="quote">start cleanup</span>")
  (with-current-buffer anything-buffer
    <span class="linecomment">;; rubikitch: I think it is not needed.</span>
    <span class="linecomment">;; thierry: If you end up for any reasons (error etc...)</span>
    <span class="linecomment">;; with an anything-buffer staying around (visible),</span>
    <span class="linecomment">;; You will have no cursor in this buffer when switching to it,</span>
    <span class="linecomment">;; so I think this is needed.</span>
    (setq cursor-type t)
    <span class="linecomment">;; Call burry-buffer whithout arg</span>
    <span class="linecomment">;; to be sure anything-buffer is removed from window.</span>
    (bury-buffer)
    <span class="linecomment">;; Be sure we call this from anything-buffer.</span>
    (anything-funcall-foreach 'cleanup))
  (anything-new-timer 'anything-check-minibuffer-input-timer nil)
  (anything-kill-async-processes)
  (anything-log-run-hook 'anything-cleanup-hook)
  (anything-hooks 'cleanup)
  (anything-frame-or-window-configuration 'restore)
  (setq anything-alive-p nil)
  <span class="linecomment">;; This is needed in some cases where last input</span>
  <span class="linecomment">;; is yielded infinitely in minibuffer after anything session.</span>
  (anything-clean-up-minibuffer))

(defun anything-clean-up-minibuffer ()
  "<span class="quote">Remove contents of minibuffer.</span>"
  (let ((miniwin (minibuffer-window)))
    <span class="linecomment">;; Clean only current minibuffer used by anything.</span>
    <span class="linecomment">;; i.e The precedent one is active.</span>
    (unless (minibuffer-window-active-p miniwin)
      (with-current-buffer (window-buffer miniwin)
        (delete-minibuffer-contents)))))

 
<span class="linecomment">;; (@* "Core: input handling")</span>
(defun anything-check-minibuffer-input ()
  "<span class="quote">Extract input string from the minibuffer and check if it needs to be handled.</span>"
  (let ((delay (with-current-buffer anything-buffer
                 (and anything-input-idle-delay
                      (max anything-input-idle-delay 0.1)))))
    (if (or (not delay) (anything-action-window))
        (anything-check-minibuffer-input-1)
        (anything-new-timer
         'anything-check-minibuffer-input-timer
         (run-with-idle-timer delay nil 'anything-check-minibuffer-input-1)))))

(defun anything-check-minibuffer-input-1 ()
  "<span class="quote">Check minibuffer content.</span>"
  (with-anything-quittable
    (with-selected-window (or (active-minibuffer-window) (minibuffer-window))
      (anything-check-new-input (minibuffer-contents)))))

(defun anything-check-new-input (input)
  "<span class="quote">Check INPUT string and update the anything buffer if necessary.</span>"
  (unless (equal input anything-pattern)
    (setq anything-pattern input)
    (unless (anything-action-window)
      (setq anything-input anything-pattern))
    (anything-log-eval anything-pattern anything-input)
    (anything-update)))

 
<span class="linecomment">;; (@* "Core: source compiler")</span>
(defvar anything-compile-source-functions-default anything-compile-source-functions
  "<span class="quote">Plug-ins this file provides.</span>")
(defun anything-compile-sources (sources funcs)
  "<span class="quote">Compile SOURCES with FUNCS.
See `anything-compile-source-functions'.
Anything plug-ins are realized by this function.</span>"
  (mapcar
   (lambda (source)
     (loop with source = (if (listp source) source (symbol-value source))
           for f in funcs
           do (setq source (funcall f source))
           finally (return source)))
   sources))

 
<span class="linecomment">;; (@* "Core: plug-in attribute documentation hack")</span>

<span class="linecomment">;; `anything-document-attribute' is public API.</span>
(defadvice documentation-property (after anything-document-attribute activate)
  "<span class="quote">Display plug-in attributes' documentation as `anything-sources' docstring.</span>"
  (when (eq (ad-get-arg 0) 'anything-sources)
    (setq ad-return-value
          (concat ad-return-value "<span class="quote">\n</span>"
                  (mapconcat (lambda (sym) (get sym 'anything-attrdoc))
                             anything-additional-attributes
                             "<span class="quote">\n</span>")))))
<span class="linecomment">;; (describe-variable 'anything-sources)</span>
<span class="linecomment">;; (documentation-property 'anything-sources 'variable-documentation)</span>
<span class="linecomment">;; (progn (ad-disable-advice 'documentation-property 'after 'anything-document-attribute) (ad-update 'documentation-property))</span>

 
<span class="linecomment">;; (@* "Core: all candidates")</span>
(defun anything-process-delayed-init (source)
  "<span class="quote">Initialize delayed SOURCE.</span>"
  (let ((name (assoc-default 'name source)))
    (unless (member name anything-delayed-init-executed)
      (anything-aif (assoc-default 'delayed-init source)
          (with-current-buffer anything-current-buffer
            (anything-funcall-with-source source it)
            (dolist (f (if (functionp it) (list it) it))
              (add-to-list 'anything-delayed-init-executed name)))))))

(defun anything-get-candidates (source)
  "<span class="quote">Retrieve and return the list of candidates from SOURCE.</span>"
  (anything-process-delayed-init source)
  (let* ((candidate-source (assoc-default 'candidates source))
         (type-error (lambda ()
                       (error (concat "<span class="quote">Candidates must either be a function, </span>"
                                      "<span class="quote"> a variable or a list: %s</span>")
                              candidate-source)))
         (candidates (condition-case err
                         (anything-interpret-value candidate-source source)
                       (error (funcall type-error)))))
    (cond ((processp candidates) candidates)
          ((listp candidates) (anything-transform-candidates candidates source))
          (t (funcall type-error)))))


(defun anything-get-cached-candidates (source)
  "<span class="quote">Return the cached value of candidates for SOURCE.
Cache the candidates if there is not yet a cached value.</span>"
  (let* ((name (assoc-default 'name source))
         (candidate-cache (assoc name anything-candidate-cache)))
    (cond (candidate-cache
           (anything-log "<span class="quote">use cached candidates</span>")
           (cdr candidate-cache))
          (t
           (anything-log "<span class="quote">calculate candidates</span>")
           (let ((candidates (anything-get-candidates source)))
             (cond ((processp candidates)
                    (push (cons candidates
                                (append source
                                        (list (cons 'item-count 0)
                                              (cons 'incomplete-line "<span class="quote"></span>"))))
                          anything-async-processes)
                    (set-process-filter candidates 'anything-output-filter)
                    (setq candidates nil))
                   ((not (assoc 'volatile source))
                    (setq candidate-cache (cons name candidates))
                    (push candidate-cache anything-candidate-cache)))
             candidates)))))

 
<span class="linecomment">;;; (@* "Core: candidate transformers")</span>
(defun anything-transform-mapcar (function args)
  "<span class="quote">`mapcar' for candidate-transformer.

ARGS is (cand1 cand2 ...) or ((disp1 . real1) (disp2 . real2) ...)

\(anything-transform-mapcar 'upcase '(\"foo\" \"bar\"))
=&gt; (\"FOO\" \"BAR\")
\(anything-transform-mapcar 'upcase '((\"1st\" . \"foo\") (\"2nd\" . \"bar\")))
=&gt; ((\"1st\" . \"FOO\") (\"2nd\" . \"BAR\"))
</span>"
  (loop for arg in args
        if (consp arg)
        collect (cons (car arg) (funcall function (cdr arg)))
        else
        collect (funcall function arg)))

(defun anything-process-candidate-transformer (candidates source)
  "<span class="quote">Execute candidate-transformer function on all CANDIDATES of SOURCE.</span>"
  (anything-aif (assoc-default 'candidate-transformer source)
      (anything-composed-funcall-with-source source it candidates)
    candidates))

(defun anything-process-filtered-candidate-transformer (candidates source)
  "<span class="quote">Execute filtered-candidate-transformer function on all CANDIDATES of SOURCE.</span>"
  (anything-aif (assoc-default 'filtered-candidate-transformer source)
      (anything-composed-funcall-with-source source it candidates source)
    candidates))

(defun anything-process-filtered-candidate-transformer-maybe (candidates source process-p)
  "<span class="quote">Execute filtered-candidate-transformer function on all CANDIDATES of SOURCE.
This happen if PROCESS-P is non-nil.</span>"
  (if process-p
      (anything-process-filtered-candidate-transformer candidates source)
      candidates))

(defun anything-process-real-to-display (candidates source)
  "<span class="quote">Execute real-to-display function on all CANDIDATES of SOURCE.</span>"
  (anything-aif (assoc-default 'real-to-display source)
      (setq candidates (anything-funcall-with-source
                        source 'mapcar
                        (lambda (cand_)
                          (if (consp cand_)
                              <span class="linecomment">;; override DISPLAY from candidate-transformer</span>
                              (cons (funcall it (cdr cand_)) (cdr cand_))
                              (cons (funcall it cand_) cand_)))
                        candidates))
    candidates))

(defun anything-transform-candidates (candidates source &optional process-p)
  "<span class="quote">Transform CANDIDATES of SOURCE according to candidate transformers.
This happen if PROCESS-P is non-nil.</span>"
  (anything-process-real-to-display
   (anything-process-filtered-candidate-transformer-maybe
    (anything-process-candidate-transformer candidates source) source process-p)
   source))

 
<span class="linecomment">;; (@* "Core: narrowing candidates")</span>
(defun anything-candidate-number-limit (source)
  "<span class="quote">Apply candidate-number-limit attribute value.
This overhide variable `anything-candidate-number-limit'.

e.g:
If \(candidate-number-limit\) is in SOURCE, show all candidates in SOURCE.
If \(candidate-number-limit . 123\) is in SOURCE limit candidate to 123.</span>"
  (anything-aif (assq 'candidate-number-limit source)
      (or (cdr it) 99999999)
    (or anything-candidate-number-limit 99999999)))

<span class="linecomment">;; FIXME: Why a defconst here</span>
(defconst anything-default-match-functions
  (list (lambda (candidate)
          (string-match anything-pattern candidate)))
  "<span class="quote">Default functions to match candidates according to `anything-pattern'.</span>")

(defun anything-compute-matches (source)
  "<span class="quote">Compute matched results from SOURCE according to its settings.</span>"
  (if debug-on-error
      (anything-compute-matches-internal source)
      (condition-case v
          (anything-compute-matches-internal source)
        (error (anything-log-error
                "<span class="quote">anything-compute-matches: error when processing source: %s</span>"
                (assoc-default 'name source))
               nil))))

(defun anything-candidate-get-display (candidate)
  "<span class="quote">Get searched display part from CANDIDATE.
CANDIDATE is a string, a symbol, or \(DISPLAY . REAL\) cons cell.</span>"
  (format "<span class="quote">%s</span>" (or (car-safe candidate) candidate)))

(defun anything-process-pattern-transformer (pattern source)
  "<span class="quote">Execute pattern-transformer attribute PATTERN function in SOURCE.</span>"
  (anything-aif (assoc-default 'pattern-transformer source)
      (anything-composed-funcall-with-source source it pattern)
    pattern))

(defun anything-match-functions (source)
  (or (assoc-default 'match source)
      anything-default-match-functions))

(defmacro anything-accumulate-candidates-internal (cand newmatches
                                                   hash item-count limit)
  "<span class="quote">Internal, add CAND into NEWMATCHES.
Use HASH to uniq NEWMATCHES.
Argument ITEM-COUNT count the matches.
if ITEM-COUNT reaches LIMIT, exit from inner loop.</span>"
  `(unless (gethash ,cand ,hash)
     (puthash ,cand t ,hash)
     (push ,cand ,newmatches)
     (incf ,item-count)
     (when (= ,item-count ,limit)
       (setq exit t)
       (return))))

(defun anything-take-first-elements (seq n)
  (if (&gt; (length seq) n)
      (setq seq (subseq seq 0 n))
      seq))

(defun anything-match-from-candidates (cands matchfns limit)
  (let (matches)
    (condition-case nil
        (let ((item-count 0) exit)
          (clrhash anything-match-hash)
          (dolist (match matchfns)
            (let (newmatches)
              (dolist (candidate cands)
                (when (funcall match (anything-candidate-get-display candidate))
                  (anything-accumulate-candidates-internal
                   candidate newmatches anything-match-hash item-count limit)))
              (setq matches (append matches (reverse newmatches)))
              (if exit (return)))))
      (invalid-regexp (setq matches nil)))
    matches))

(defun anything-compute-matches-internal (source)
  (save-current-buffer
    (let ((matchfns (anything-match-functions source))
          (anything-source-name (assoc-default 'name source))
          (limit (anything-candidate-number-limit source))
          (anything-pattern (anything-process-pattern-transformer
                             anything-pattern source)))
      (anything-process-filtered-candidate-transformer
       (if (or (equal anything-pattern "<span class="quote"></span>") (equal matchfns '(identity)))
           (anything-take-first-elements
            (anything-get-cached-candidates source) limit)
           (anything-match-from-candidates
            (anything-get-cached-candidates source) matchfns limit))
       source))))

<span class="linecomment">;; (anything '(((name . "error")(candidates . (lambda () (hage))) (action . identity))))</span>

(defun anything-process-source (source)
  "<span class="quote">Display matched results from SOURCE according to its settings.</span>"
  (anything-log-eval (assoc-default 'name source))
  (if (assq 'direct-insert-match source) <span class="linecomment">;experimental</span>
      (anything-process-source--direct-insert-match source)
      (let ((matches (anything-compute-matches source)))
        (when matches
          (when anything-test-mode
            (setq anything-test-candidate-list
                  `(,@anything-test-candidate-list
                    (,(assoc-default 'name source)
                      ,matches))))
          (anything-insert-header-from-source source)
          (if (not (assq 'multiline source))
              (mapc 'anything-insert-match-with-digit-overlay matches)
              (let ((start (point)) separate)
                (dolist (match matches)
                  (if separate
                      (anything-insert-candidate-separator)
                      (setq separate t))
                  (anything-insert-match-with-digit-overlay match))
                (put-text-property start (point) 'anything-multiline t)))))))

(defun anything-insert-match-with-digit-overlay (match)
  (declare (special source))
  (anything-put-digit-overlay-maybe)
  (anything-insert-match match 'insert source))

(defun anything-put-digit-overlay-maybe ()
  (when (and anything-enable-shortcuts
             (not (eq anything-digit-shortcut-count
                      (length anything-digit-overlays))))
    (move-overlay (nth anything-digit-shortcut-count
                       anything-digit-overlays)
                  (point-at-bol)
                  (point-at-bol))
    (incf anything-digit-shortcut-count)))

(defun anything-process-source--direct-insert-match (source)
  "<span class="quote">[EXPERIMENTAL] Insert candidates from `anything-candidate-buffer' in SOURCE.</span>"
  (anything-log-eval (assoc-default 'name source))
  (let ((anything-source-name (assoc-default 'name source))
        content-buf)
    (funcall (assoc-default 'candidates source))
    (setq content-buf (anything-candidate-buffer))
    (unless (anything-empty-buffer-p content-buf)
      (anything-insert-header-from-source source)
      (insert-buffer-substring content-buf)
      <span class="linecomment">;; TODO call anything-put-digit-overlay-maybe with loop</span>
      )))

(defun anything-process-delayed-sources (delayed-sources &optional preselect)
  "<span class="quote">Process anything DELAYED-SOURCES.
Move selection to string or regexp PRESELECT if non--nil.
This function is called in `anything-process-delayed-sources-timer'
when emacs is idle for `anything-idle-delay'.</span>"
  (with-anything-quittable
    (anything-log-eval (mapcar (lambda (s) (assoc-default 'name s)) delayed-sources))
    (with-current-buffer anything-buffer
      (save-excursion
        (goto-char (point-max))
        (mapc 'anything-process-source delayed-sources)
        (when (and (not (anything-empty-buffer-p))
                   <span class="linecomment">;; No selection yet.</span>
                   (= (overlay-start anything-selection-overlay)
                      (overlay-end anything-selection-overlay)))
          (anything-update-move-first-line 'without-hook)))
      (when preselect (anything-preselect preselect))
      (save-excursion
        (goto-char (point-min))
        (anything-log-run-hook 'anything-update-hook))
      (anything-log-run-hook 'anything-after-update-hook))))

 
<span class="linecomment">;; (@* "Core: *anything* buffer contents")</span>
(defvar anything-input-local nil)
(defvar anything-process-delayed-sources-timer nil)
(defun anything-update (&optional preselect)
  "<span class="quote">Update candidates list in `anything-buffer' according to `anything-pattern'.
Argument PRESELECT is a string or regexp used to move selection to a particular
place once updating is done.  It should be used on single source because search
is done on whole `anything-buffer' and not on current source.</span>"
  (anything-log "<span class="quote">start update</span>")
  (setq anything-digit-shortcut-count 0)
  (anything-kill-async-processes)
  (with-current-buffer (anything-buffer-get)
    (set (make-local-variable 'anything-input-local) anything-pattern)
    (erase-buffer)
    (when anything-enable-shortcuts
      (mapc 'delete-overlay anything-digit-overlays))
    (let (delayed-sources
          (case-fold-search t)
          normal-sources)
      (unwind-protect <span class="linecomment">; Process normal sources and store delayed one's.</span>
           (setq delayed-sources
                 (loop for source in (remove-if-not 'anything-update-source-p
                                                    (anything-get-sources))
                       if (anything-delayed-source-p source)
                       collect source
                       else do (progn (push source normal-sources)
                                      (anything-process-source source))))
        (anything-log-eval
         (mapcar (lambda (s) (assoc-default 'name s)) delayed-sources))
        (if anything-test-mode <span class="linecomment">; Need only to process sources.</span>
            (mapc 'anything-process-source delayed-sources)
            (cond ((and preselect delayed-sources normal-sources)
                   <span class="linecomment">;; Preselection run here when there is</span>
                   <span class="linecomment">;; normal AND delayed sources.</span>
                   (anything-log "<span class="quote">Update preselect candidate %s</span>" preselect)
                   (anything-preselect preselect))
                  (delayed-sources <span class="linecomment">; Preselection and hooks will run later.</span>
                   (anything-update-move-first-line 'without-hook))
                  (t <span class="linecomment">; No delayed sources, run the hooks now.</span>
                   (anything-update-move-first-line)
                   (anything-log-run-hook 'anything-after-update-hook)
                   (when preselect
                     (anything-log "<span class="quote">Update preselect candidate %s</span>" preselect)
                     (anything-preselect preselect))))
            (when delayed-sources
              (anything-new-timer
               'anything-process-delayed-sources-timer
               (run-with-idle-timer
                <span class="linecomment">;; Be sure anything-idle-delay is &gt;</span>
                <span class="linecomment">;; to anything-input-idle-delay</span>
                <span class="linecomment">;; otherwise use value of anything-input-idle-delay</span>
                <span class="linecomment">;; or 0.1 if == to 0.</span>
                (max anything-idle-delay anything-input-idle-delay 0.1) nil
                'anything-process-delayed-sources delayed-sources preselect))))
        (anything-log "<span class="quote">end update</span>")))))

(defun anything-update-source-p (source)
  "<span class="quote">Wheter SOURCE need updating or not.</span>"
  (and (or (not anything-source-filter)
           (member (assoc-default 'name source) anything-source-filter))
       (&gt;= (length anything-pattern)
           (anything-aif (assoc 'requires-pattern source)
               (or (cdr it) 1)
             0))))

(defun anything-delayed-source-p (source)
  "<span class="quote">Wheter SOURCE is a delayed source or not.</span>"
  (or (assoc 'delayed source)
      (and anything-quick-update
           (&lt; (window-height (get-buffer-window (current-buffer)))
              (line-number-at-pos (point-max))))))

(defun anything-update-move-first-line (&optional without-hook)
  "<span class="quote">Goto first line of `anything-buffer'.</span>"
  (goto-char (point-min))
  (unless without-hook
    (save-excursion (anything-log-run-hook 'anything-update-hook)))
  (anything-next-line))

(defun anything-force-update (&optional preselect)
  "<span class="quote">Force recalculation and update of candidates.
If current source has `update' attribute, a function without argument,
call it before update.</span>"
  (interactive)
  (let ((source    (anything-get-current-source))
        (selection (anything-get-selection nil t)))
    (when source
      (mapc 'anything-force-update--reinit
            (anything-get-sources)))
    (anything-update preselect)
    <span class="linecomment">;; If preselect arg exists, `anything-update' should</span>
    <span class="linecomment">;; have moved to selection, otherwise do it now.</span>
    (unless preselect
      (anything-keep-selection (assoc-default 'name source) selection))
    (with-anything-window (recenter))))

(defun anything-force-update--reinit (source)
  "<span class="quote">Reinit SOURCE by calling his update and/or init functions.</span>"
  (anything-aif (anything-funcall-with-source
                 source 'anything-candidate-buffer)
      (kill-buffer it))
  (dolist (attr '(update init))
    (anything-aif (assoc-default attr source)
        (anything-funcall-with-source source it)))
  (anything-remove-candidate-cache source))

(defun anything-keep-selection (source selection)
  "<span class="quote">Switch to SOURCE and goto SELECTION.</span>"
  (when (and source selection)
    (with-anything-window
      (anything-goto-source source)
      (forward-char -1)
      (if (search-forward selection nil t)
          (forward-line 0)
          (goto-char (point-min))
          (forward-line 1))
      (anything-mark-current-line))))

(defun anything-remove-candidate-cache (source)
  "<span class="quote">Remove SOURCE from `anything-candidate-cache'.</span>"
  (setq anything-candidate-cache
        (delete (assoc (assoc-default 'name source)
                       anything-candidate-cache)
                anything-candidate-cache)))

(defun anything-insert-match (match insert-function source)
  "<span class="quote">Insert MATCH into `anything-buffer' with INSERT-FUNCTION for SOURCE.
If MATCH is a list then insert the string intended to appear on the display
and store the real value in a text property.</span>"
  (let ((start     (point-at-bol (point)))
        (dispvalue (or (car-safe match) match))
        (realvalue (cdr-safe match)))
    (setq dispvalue
          (cond ((symbolp dispvalue) (symbol-name dispvalue))
                ((numberp dispvalue) (number-to-string dispvalue))
                (t dispvalue)))
    (when (stringp dispvalue)
      (funcall insert-function dispvalue)
      <span class="linecomment">;; Some sources with candidates-in-buffer have already added</span>
      <span class="linecomment">;; 'anything-realvalue property when creating candidate buffer.</span>
      (unless (get-text-property start 'anything-realvalue)
        (and realvalue
             (put-text-property start (point-at-eol)
                                'anything-realvalue realvalue)))
      (when anything-source-in-each-line-flag
        (put-text-property start (point-at-eol) 'anything-source source))
      (funcall insert-function "<span class="quote">\n</span>"))))

(defun anything-insert-header-from-source (source)
  "<span class="quote">Insert SOURCE name in `anything-buffer' header.
Maybe insert by overlay additional info after source name if SOURCE have
header-name attribute.</span>"
  (let ((name (assoc-default 'name source)))
    (anything-insert-header
     name
     (anything-aif (assoc-default 'header-name source)
         (anything-funcall-with-source source it name)))))

(defun anything-insert-header (name &optional display-string)
  "<span class="quote">Insert header of source NAME into the anything buffer.
If DISPLAY-STRING is non--nil and a string, display this additional info
after the source name by overlay.</span>"
  (unless (bobp)
    (let ((start (point)))
      (insert "<span class="quote">\n</span>")
      (put-text-property start (point) 'anything-header-separator t)))
  (let ((start (point)))
    (insert name)
    (put-text-property (point-at-bol)
                       (point-at-eol) 'anything-header t)
    (when display-string
      (overlay-put (make-overlay (point-at-bol) (point-at-eol))
                   'display display-string))
    (insert "<span class="quote">\n</span>")
    (put-text-property start (point) 'face anything-header-face)))

(defun anything-insert-candidate-separator ()
  "<span class="quote">Insert separator of candidates into the anything buffer.</span>"
  (insert anything-candidate-separator)
  (put-text-property (point-at-bol)
                     (point-at-eol) 'anything-candidate-separator t)
  (insert "<span class="quote">\n</span>"))

 
<span class="linecomment">;; (@* "Core: async process")</span>
(defun anything-output-filter (process string)
  "<span class="quote">From PROCESS process output STRING.</span>"
  (anything-output-filter-1 (assoc process anything-async-processes) string))

(defun anything-output-filter-1 (process-assoc string)
  (anything-log-eval string)
  (with-current-buffer anything-buffer
    (let ((source (cdr process-assoc)))
      (save-excursion
        (anything-aif (assoc-default 'insertion-marker source)
            (goto-char it)
          (goto-char (point-max))
          (anything-insert-header-from-source source)
          (setcdr process-assoc
                  (append source `((insertion-marker . ,(point-marker))))))
        (anything-output-filter--process-source
         (car process-assoc) string source
         (anything-candidate-number-limit source))))
    (anything-output-filter--post-process)))

(defun anything-output-filter--process-source (process string source limit)
  (dolist (candidate (anything-transform-candidates
                      (anything-output-filter--collect-candidates
                       (split-string string "<span class="quote">\n</span>")
                       (assoc 'incomplete-line source))
                      source t))
    (if (not (assq 'multiline source))
        (anything-insert-match candidate 'insert-before-markers source)
        (let ((start (point)))
          (anything-insert-candidate-separator)
          (anything-insert-match candidate 'insert-before-markers source)
          (put-text-property start (point) 'anything-multiline t)))
    (incf (cdr (assoc 'item-count source)))
    (when (&gt;= (assoc-default 'item-count source) limit)
      (anything-kill-async-process process)
      (return))))

(defun anything-output-filter--collect-candidates (lines incomplete-line-info)
  (anything-log-eval (cdr incomplete-line-info))
  (butlast
   (loop for line in lines collect
         (if (cdr incomplete-line-info)
             (prog1
                 (concat (cdr incomplete-line-info) line)
               (setcdr incomplete-line-info nil))
             line)
         finally (setcdr incomplete-line-info line))))

(defun anything-output-filter--post-process ()
  (anything-log-run-hook 'anything-update-hook)
  (anything-aif (get-buffer-window anything-buffer 'visible)
      (save-selected-window
        (select-window it)
        (anything-skip-noncandidate-line 'next)
        (anything-mark-current-line))))

(defun anything-kill-async-processes ()
  "<span class="quote">Kill all known asynchronous processes of `anything-async-processes'.</span>"
  (mapc 'anything-kill-async-process (mapcar 'car anything-async-processes))
  (setq anything-async-processes nil))

(defun anything-kill-async-process (process)
  "<span class="quote">Kill PROCESS and detach the associated functions.</span>"
  (set-process-filter process nil)
  (delete-process process))

 
<span class="linecomment">;; (@* "Core: action")</span>
(defun anything-execute-selection-action (&optional
                                            selection action
                                            preserve-saved-action)
  "<span class="quote">If a candidate SELECTION is present then perform the associated ACTION on it.
If PRESERVE-SAVED-ACTION is non-nil don't save action.</span>"
  (anything-log "<span class="quote">executing action</span>")
  (setq action (anything-get-default-action
                (or action
                    anything-saved-action
                    (if (get-buffer anything-action-buffer)
                        (anything-get-selection anything-action-buffer)
                        (anything-get-action)))))
  (let ((source (or anything-saved-current-source
                    (anything-get-current-source))))
    (setq selection (or selection
                        (anything-get-selection)
                        (and (assoc 'accept-empty source) "<span class="quote"></span>")))
    (unless preserve-saved-action (setq anything-saved-action nil))
    (if (and selection action)
        (anything-funcall-with-source
         source action
         (anything-coerce-selection selection source)))))

(defun anything-coerce-selection (selection source)
  "<span class="quote">Apply coerce attribute function to SELECTION in SOURCE.
Coerce source with coerce function.</span>"
  (anything-aif (assoc-default 'coerce source)
      (anything-funcall-with-source source it selection)
    selection))

(defun anything-get-default-action (action)
  "<span class="quote">Get the first ACTION value of action list in source.</span>"
  (if (and (listp action) (not (functionp action)))
      (cdar action)
      action))

(defun anything-select-action ()
  "<span class="quote">Select an action for the currently selected candidate.
If action buffer is selected, back to the anything buffer.</span>"
  (interactive)
  (anything-log-run-hook 'anything-select-action-hook)
  (cond ((get-buffer-window anything-action-buffer 'visible)
         (set-window-buffer (get-buffer-window anything-action-buffer)
                            anything-buffer)
         (kill-buffer anything-action-buffer)
         (anything-set-pattern anything-input 'noupdate))
        (t
         (setq anything-saved-selection (anything-get-selection))
         (unless anything-saved-selection
           (error "<span class="quote">Nothing is selected</span>"))
         (setq anything-saved-current-source (anything-get-current-source))
         (let ((actions (anything-get-action)))
           (if (functionp actions)
               (message "<span class="quote">Sole action: %s</span>" actions)
               (anything-show-action-buffer actions)
               (anything-delete-minibuffer-contents)
               (setq anything-pattern 'dummy) <span class="linecomment">; so that it differs from the previous one</span>
               (anything-check-minibuffer-input))))))

(defun anything-show-action-buffer (actions)
  (with-current-buffer (get-buffer-create anything-action-buffer)
    (erase-buffer)
    (buffer-disable-undo)
    (set-window-buffer (get-buffer-window anything-buffer) anything-action-buffer)
    (set (make-local-variable 'anything-sources)
         `(((name . "<span class="quote">Actions</span>")
            (volatile)
            (candidates . ,actions)
            (candidate-number-limit))))
    (set (make-local-variable 'anything-source-filter) nil)
    (set (make-local-variable 'anything-selection-overlay) nil)
    (set (make-local-variable 'anything-digit-overlays) nil)
    (anything-initialize-overlays anything-action-buffer)))

 
<span class="linecomment">;; (@* "Core: selection")</span>
(defun anything-move-selection-common (move-func unit direction)
  "<span class="quote">Move the selection marker to a new position wit function MOVE-FUNC.
It is determined by UNIT and DIRECTION.</span>"
  (unless (or (anything-empty-buffer-p (anything-buffer-get))
              (not (anything-window)))
    (with-anything-window
      (anything-log-run-hook 'anything-move-selection-before-hook)
      (funcall move-func)
      (anything-skip-noncandidate-line direction)
      (anything-display-source-at-screen-top-maybe unit)
      (when (anything-get-previous-header-pos)
        (anything-mark-current-line))
      (anything-display-mode-line (anything-get-current-source))
      (anything-log-run-hook 'anything-move-selection-after-hook))))

(defun anything-display-source-at-screen-top-maybe (unit)
  (when (and anything-display-source-at-screen-top (eq unit 'source))
    (set-window-start (selected-window)
                      (save-excursion (forward-line -1) (point)))))

(defun anything-skip-noncandidate-line (direction)
  (anything-skip-header-and-separator-line direction)
  (and (bobp) (forward-line 1))     <span class="linecomment">;skip first header</span>
  (and (eobp) (forward-line -1)))   <span class="linecomment">;avoid last empty line</span>


(defun anything-skip-header-and-separator-line (direction)
  (while (and (not (bobp))
              (or (anything-pos-header-line-p)
                  (anything-pos-candidate-separator-p)))
    (forward-line (if (and (eq direction 'previous)
                           (not (eq (point-at-bol) (point-min))))
                      -1 1))))

(defvar anything-mode-line-string-real nil)
(defun anything-display-mode-line (source)
  (set (make-local-variable 'anything-mode-line-string)
       (anything-interpret-value (or (assoc-default 'mode-line source)
                                     (default-value 'anything-mode-line-string))
                                 source))
  (if anything-mode-line-string
      (setq mode-line-format
            '("<span class="quote"> </span>" mode-line-buffer-identification "<span class="quote"> </span>"
              (line-number-mode "<span class="quote">L%l</span>") "<span class="quote"> </span>" (anything-follow-mode "<span class="quote">(F) </span>")
              (:eval (anything-show-candidate-number
                      (when (listp anything-mode-line-string)
                        (car anything-mode-line-string))))
              "<span class="quote"> </span>" anything-mode-line-string-real "<span class="quote">-%-</span>")
            anything-mode-line-string-real
            (substitute-command-keys (if (listp anything-mode-line-string)
                                         (cadr anything-mode-line-string)
                                         anything-mode-line-string)))
      (setq mode-line-format
            (default-value 'mode-line-format)))
  (setq header-line-format
        (anything-interpret-value (assoc-default 'header-line source) source)))

(defun anything-show-candidate-number (&optional name)
  "<span class="quote">Used to display candidate number in mode-line.
You can specify NAME of candidates e.g \"Buffers\" otherwise
it is \"Candidate\(s\)\" by default.</span>"
  (propertize
   (format "<span class="quote">[%s %s]</span>"
           (anything-approximate-candidate-number 'in-current-source)
           (or name "<span class="quote">Candidate(s)</span>"))
   'face 'anything-candidate-number))

(defun anything-previous-line ()
  "<span class="quote">Move selection to the previous line.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (if (not (anything-pos-multiline-p))
         (forward-line -1)      <span class="linecomment">;double forward-line is meaningful</span>
         (forward-line -1)        <span class="linecomment">;because evaluation order is important</span>
         (anything-skip-header-and-separator-line 'previous)
         (let ((header-pos (anything-get-previous-header-pos))
               (separator-pos (anything-get-previous-candidate-separator-pos)))
           (when header-pos
             (goto-char (if (or (null separator-pos) (&lt; separator-pos header-pos))
                            header-pos <span class="linecomment">; first candidate</span>
                            separator-pos))
             (forward-line 1)))))
   'line 'previous))

(defun anything-next-line ()
  "<span class="quote">Move selection to the next line.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (if (not (anything-pos-multiline-p))
         (forward-line 1)
         (let ((header-pos (anything-get-next-header-pos))
               (separator-pos (anything-get-next-candidate-separator-pos)))
           (cond ((and separator-pos
                       (or (null header-pos) (&lt; separator-pos header-pos)))
                  (goto-char separator-pos))
                 (header-pos
                  (goto-char header-pos))))))
   'line 'next))

(defun anything-previous-page ()
  "<span class="quote">Move selection back with a pageful.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (condition-case nil
         (scroll-down)
       (beginning-of-buffer (goto-char (point-min)))))
   'page 'previous))

(defun anything-next-page ()
  "<span class="quote">Move selection forward with a pageful.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (condition-case nil
         (scroll-up)
       (end-of-buffer (goto-char (point-max)))))
   'page 'next))

(defun anything-beginning-of-buffer ()
  "<span class="quote">Move selection at the top.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda () (goto-char (point-min)))
   'edge 'previous))

(defun anything-end-of-buffer ()
  "<span class="quote">Move selection at the bottom.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda () (goto-char (point-max)))
   'edge 'next))

(defun anything-previous-source ()
  "<span class="quote">Move selection to the previous source.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (forward-line -1)
     (if (bobp)
         (goto-char (point-max))
         (anything-skip-header-and-separator-line 'previous))
     (goto-char (anything-get-previous-header-pos))
     (forward-line 1))
   'source 'previous))

(defun anything-next-source ()
  "<span class="quote">Move selection to the next source.</span>"
  (interactive)
  (anything-move-selection-common
   (lambda ()
     (goto-char (or (anything-get-next-header-pos) (point-min))))
   'source 'next))

(defun anything-goto-source (source-or-name)
  "<span class="quote">Move the selection to the source SOURCE-OR-NAME.</span>"
  (anything-move-selection-common
   (lambda ()
     (goto-char (point-min))
     (let ((name (if (stringp source-or-name) source-or-name
                     (assoc-default 'name source-or-name))))
       (condition-case err
           (while (not (string= name (anything-current-line-contents)))
             (goto-char (anything-get-next-header-pos)))
         (error (message "<span class="quote"></span>")))))
   'source 'next))

(defun anything-mark-current-line (&optional resumep)
  "<span class="quote">Move `anything-selection-overlay' to current line.
Note that this is not related with visibles marks, which are used
to mark candidates.</span>"
  (with-anything-window
    (when resumep
      (goto-char anything-selection-point))
    (move-overlay
     anything-selection-overlay (point-at-bol)
     (if (anything-pos-multiline-p)
         (let ((header-pos (anything-get-next-header-pos))
               (separator-pos (anything-get-next-candidate-separator-pos)))
           (or (and (null header-pos) separator-pos)
               (and header-pos separator-pos (&lt; separator-pos header-pos)
                    separator-pos)
               header-pos
               (point-max)))
       (1+ (point-at-eol))))
    (setq anything-selection-point (overlay-start anything-selection-overlay)))
  (anything-follow-execute-persistent-action-maybe))

(defun anything-this-command-key ()
  (event-basic-type (elt (this-command-keys-vector) 0)))
<span class="linecomment">;; (progn (read-key-sequence "Key: ") (p (anything-this-command-key)))</span>

(defun anything-select-with-shortcut-internal (types get-key-func)
  (if (memq anything-enable-shortcuts types)
      (save-selected-window
        (select-window (anything-window))
        (let* ((key (funcall get-key-func))
               (overlay (ignore-errors (nth (position key anything-shortcut-keys)
                                            anything-digit-overlays))))
          (if (not (and overlay (overlay-buffer overlay)))
              (when (numberp key)
                (select-window (minibuffer-window))
                (self-insert-command 1))
              (goto-char (overlay-start overlay))
              (anything-mark-current-line)
              (anything-exit-minibuffer))))
      (self-insert-command 1)))

(defun anything-select-with-prefix-shortcut ()
  "<span class="quote">Invoke default action with prefix shortcut.</span>"
  (interactive)
  (anything-select-with-shortcut-internal
   '(prefix)
   (lambda () (read-event "<span class="quote">Select shortcut key: </span>"))))

(defun anything-select-with-digit-shortcut ()
  "<span class="quote">Invoke default action with digit/alphabet shortcut.</span>"
  (interactive)
  (anything-select-with-shortcut-internal
   '(alphabet t) 'anything-this-command-key))

<span class="linecomment">;; (setq anything-enable-shortcuts 'prefix)</span>
<span class="linecomment">;; (define-key anything-map "@" 'anything-select-with-prefix-shortcut)</span>
<span class="linecomment">;; (define-key anything-map (kbd "&lt;f18&gt;") 'anything-select-with-prefix-shortcut)</span>

(defvar anything-exit-status 0
  "<span class="quote">Flag to inform whether anything have exited or quitted.
Exit with 0 mean anything have exited executing an action.
Exit with 1 mean anything have quitted with \\[keyboard-quit]
It is useful for example to restore a window config if anything abort
in special cases.
See `anything-exit-minibuffer' and `anything-keyboard-quit'.</span>")

(defvar anything-minibuffer-confirm-state nil)
(defun anything-confirm-and-exit-minibuffer ()
  "<span class="quote">Maybe ask for confirmation when exiting anything.
It is similar to `minibuffer-complete-and-exit' adapted to anything.
If `minibuffer-completion-confirm' value is 'confirm,
send in minibuffer confirm message and exit on next hit.
If `minibuffer-completion-confirm' value is t,
don't exit and send message 'no match'.</span>"
  (interactive)
  (let ((empty-buffer-p (with-current-buffer anything-buffer
                          (eq (point-min) (point-max))))
        (unknow (string= (get-text-property
                          0 'display (anything-get-selection nil 'withprop))
                         "<span class="quote">[?]</span>")))
    (cond ((and (or empty-buffer-p unknow)
                (eq minibuffer-completion-confirm 'confirm))
           (setq anything-minibuffer-confirm-state
                 'confirm)
           (setq minibuffer-completion-confirm nil)
           (minibuffer-message "<span class="quote"> [confirm]</span>"))
          ((and (or empty-buffer-p unknow)
                (eq minibuffer-completion-confirm t))
           (minibuffer-message "<span class="quote"> [No match]</span>"))
          (t
           (setq anything-minibuffer-confirm-state nil)
           (anything-exit-minibuffer)))))
(add-hook 'anything-after-update-hook 'anything-confirm-and-exit-hook)

(defun anything-confirm-and-exit-hook ()
  "<span class="quote">Restore `minibuffer-completion-confirm' when anything update.</span>"
  (unless (or (eq minibuffer-completion-confirm t)
              (not anything-minibuffer-confirm-state))
    (setq minibuffer-completion-confirm
          anything-minibuffer-confirm-state)))

(defun anything-exit-minibuffer ()
  "<span class="quote">Select the current candidate by exiting the minibuffer.</span>"
  (interactive)
  (unless anything-current-prefix-arg
    (setq anything-current-prefix-arg current-prefix-arg))
  (setq anything-exit-status 0)
  (exit-minibuffer))

(defun anything-keyboard-quit ()
  "<span class="quote">Quit minibuffer in anything.
If action buffer is displayed, kill it.</span>"
  (interactive)
  (when (get-buffer-window anything-action-buffer 'visible)
    (kill-buffer anything-action-buffer))
  (setq anything-exit-status 1)
  (abort-recursive-edit))

(defun anything-get-next-header-pos ()
  "<span class="quote">Return the position of the next header from point.</span>"
  (next-single-property-change (point) 'anything-header))

(defun anything-get-previous-header-pos ()
  "<span class="quote">Return the position of the previous header from point.</span>"
  (previous-single-property-change (point) 'anything-header))

(defun anything-pos-multiline-p ()
  "<span class="quote">Return non-nil if the current position is in the multiline source region.</span>"
  (get-text-property (point) 'anything-multiline))

(defun anything-get-next-candidate-separator-pos ()
  "<span class="quote">Return the position of the next candidate separator from point.</span>"
  (next-single-property-change (point) 'anything-candidate-separator))

(defun anything-get-previous-candidate-separator-pos ()
  "<span class="quote">Return the position of the previous candidate separator from point.</span>"
  (previous-single-property-change (point) 'anything-candidate-separator))

(defun anything-pos-header-line-p ()
  "<span class="quote">Return t if the current line is a header line.</span>"
  (or (get-text-property (point-at-bol) 'anything-header)
      (get-text-property (point-at-bol) 'anything-header-separator)))

(defun anything-pos-candidate-separator-p ()
  "<span class="quote">Return t if the current line is a candidate separator.</span>"
  (get-text-property (point-at-bol) 'anything-candidate-separator))

 
<span class="linecomment">;; (@* "Core: help")</span>
(defun anything-help-internal (bufname insert-content-fn)
  "<span class="quote">Show long message during `anything' session in BUFNAME.
INSERT-CONTENT-FN is the text to be displayed in BUFNAME.</span>"
  (save-window-excursion
    (select-window (anything-window))
    (delete-other-windows)
    (switch-to-buffer (get-buffer-create bufname))
    (erase-buffer)
    (funcall insert-content-fn)
    (setq mode-line-format "<span class="quote">%b (SPC,C-v:NextPage  b,M-v:PrevPage  other:Exit)</span>")
    (setq cursor-type nil)
    (goto-char 1)
    (anything-help-event-loop)))

(defun anything-help-event-loop ()
  (ignore-errors
    (loop for event = (read-event) do
          (case event
            ((?\C-v ? )  (scroll-up))
            ((?\M-v ?b) (scroll-down))
            (t (return))))))

(defun anything-help ()
  "<span class="quote">Help of `anything'.</span>"
  (interactive)
  (anything-help-internal
   "<span class="quote"> *Anything Help*</span>"
   (lambda ()
     (insert (substitute-command-keys
              (anything-interpret-value (or (assoc-default
                                             'help-message
                                             (anything-get-current-source))
                                            anything-help-message))))
     (org-mode))))

(defun anything-debug-output ()
  "<span class="quote">Show all anything-related variables at this time.</span>"
  (interactive)
  (anything-help-internal "<span class="quote"> *Anything Debug*</span>" 'anything-debug-output-function))

(defun anything-debug-output-function (&optional vars)
  (message "<span class="quote">Calculating all anything-related values...</span>")
  (insert "<span class="quote">If you debug some variables or forms, set `anything-debug-forms'
to a list of forms.\n\n</span>")
  (dolist (v (or vars
                 anything-debug-forms
                 (apropos-internal "<span class="quote">^anything-</span>" 'boundp)))
    (insert "<span class="quote">** </span>"
            (pp-to-string v) "<span class="quote">\n</span>"
            (pp-to-string (with-current-buffer anything-buffer (eval v))) "<span class="quote">\n</span>"))
  (message "<span class="quote">Calculating all anything-related values...Done</span>"))

 
<span class="linecomment">;; (@* "Core: misc")</span>
(defun anything-kill-buffer-hook ()
  "<span class="quote">Remove tick entry from `anything-tick-hash' when killing a buffer.</span>"
  (loop for key being the hash-keys in anything-tick-hash
        if (string-match (format "<span class="quote">^%s/</span>" (regexp-quote (buffer-name))) key)
        do (remhash key anything-tick-hash)))
(add-hook 'kill-buffer-hook 'anything-kill-buffer-hook)

(defun anything-preselect (candidate-or-regexp)
  "<span class="quote">Move `anything-selection-overlay' to CANDIDATE-OR-REGEXP on startup.</span>"
  (with-anything-window
    (when candidate-or-regexp
      (goto-char (point-min))
      <span class="linecomment">;; go to first candidate of first source</span>
      (forward-line 1)
      (let ((start (point)))
        (or (re-search-forward
             (concat "<span class="quote">^</span>" (regexp-quote candidate-or-regexp) "<span class="quote">$</span>") nil t)
            (re-search-forward candidate-or-regexp nil t)
            (search-forward candidate-or-regexp nil t)
            (goto-char start))))
    (anything-mark-current-line)))

(defun anything-delete-current-selection ()
  "<span class="quote">Delete the currently selected item.</span>"
  (interactive)
  (with-anything-window
    (cond ((anything-pos-multiline-p)
           (anything-aif (anything-get-next-candidate-separator-pos)
               (delete-region (point-at-bol)
                              (1+ (progn (goto-char it) (point-at-eol))))
             <span class="linecomment">;; last candidate</span>
             (goto-char (anything-get-previous-candidate-separator-pos))
             (delete-region (point-at-bol) (point-max)))
           (when (anything-end-of-source-p)
             (goto-char (or (anything-get-previous-candidate-separator-pos)
                            (point-min)))
             (forward-line 1)))
          (t
           (delete-region (point-at-bol) (1+ (point-at-eol)))
           (when (anything-end-of-source-p) (forward-line -1))))
    (anything-mark-current-line)))

(defun anything-end-of-source-p ()
  "<span class="quote">Return non--nil if we are at eob or end of source.</span>"
  (save-excursion
    (forward-line 1)
    (or (eq (point-at-bol) (point-at-eol))
        (anything-pos-header-line-p)
        (eobp))))

(defun anything-edit-current-selection-internal (func)
  (with-anything-window
    (beginning-of-line)
    (let ((realvalue (get-text-property (point) 'anything-realvalue)))
      (funcall func)
      (beginning-of-line)
      (and realvalue
           (put-text-property (point) (point-at-eol)
                              'anything-realvalue realvalue))
      (anything-mark-current-line))))

(defmacro anything-edit-current-selection (&rest forms)
  "<span class="quote">Evaluate FORMS at current selection in the anything buffer.
You can edit the line.</span>"
  (declare (indent 0) (debug t))
  `(anything-edit-current-selection-internal
    (lambda () ,@forms)))

(defun anything-set-pattern (pattern &optional noupdate)
  "<span class="quote">Set minibuffer contents to PATTERN.
if optional NOUPDATE is non-nil, anything buffer is not changed.</span>"
  (with-selected-window (or (active-minibuffer-window) (minibuffer-window))
    (delete-minibuffer-contents)
    (insert pattern))
  (when noupdate
    (setq anything-pattern pattern)
    (anything-hooks 'cleanup)
    (run-with-idle-timer 0 nil 'anything-hooks 'setup)))

(defun anything-delete-minibuffer-contents ()
  "<span class="quote">Same as `delete-minibuffer-contents' but this is a command.</span>"
  (interactive)
  (anything-set-pattern "<span class="quote"></span>"))
(defalias 'anything-delete-minibuffer-content 'anything-delete-minibuffer-contents)

 
<span class="linecomment">;;; Plugins</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (@* "Built-in plug-in: type")</span>
(defun anything-compile-source--type (source)
  (anything-aif (assoc-default 'type source)
      (append source (assoc-default it anything-type-attributes) nil)
    source))

<span class="linecomment">;; `define-anything-type-attribute' is public API.</span>

(defun anything-add-type-attribute (type definition)
  (anything-aif (assq type anything-type-attributes)
      (setq anything-type-attributes (delete it anything-type-attributes)))
  (push (cons type definition) anything-type-attributes))

(defvar anything-types nil)
(defun anything-document-type-attribute (type doc)
  (add-to-list 'anything-types type t)
  (put type 'anything-typeattrdoc
       (concat "<span class="quote">- </span>" (symbol-name type) "<span class="quote">\n\n</span>" doc "<span class="quote">\n</span>")))

(defadvice documentation-property (after anything-document-type-attribute activate)
  "<span class="quote">Display type attributes' documentation as `anything-type-attributes' docstring.</span>"
  (when (eq (ad-get-arg 0) 'anything-type-attributes)
    (setq ad-return-value
          (concat ad-return-value "<span class="quote">\n\n++++ Types currently defined ++++\n</span>"
                  (mapconcat (lambda (sym) (get sym 'anything-typeattrdoc))
                             anything-types "<span class="quote">\n</span>")))))

<span class="linecomment">;; (@* "Built-in plug-in: dummy")</span>
(defun anything-dummy-candidate (candidate source)
  "<span class="quote">Use `anything-pattern' as CANDIDATE in SOURCE.</span>"
  <span class="linecomment">;; `source' is defined in filtered-candidate-transformer</span>
  (list anything-pattern))

(defun anything-compile-source--dummy (source)
  (if (assoc 'dummy source)
      (append source
              '((candidates "<span class="quote">dummy</span>")
                (accept-empty)
                (match identity)
                (filtered-candidate-transformer . anything-dummy-candidate)
                (disable-shortcuts)
                (volatile)))
      source))

<span class="linecomment">;; (@* "Built-in plug-in: disable-shortcuts")</span>
(defvar anything-orig-enable-shortcuts nil)
(defun anything-save-enable-shortcuts ()
  (anything-once
   (lambda ()
     (setq anything-orig-enable-shortcuts anything-enable-shortcuts
           anything-enable-shortcuts nil))))

(defun anything-compile-source--disable-shortcuts (source)
  (if (assoc 'disable-shortcuts source)
      (append `((init ,@(anything-mklist (assoc-default 'init source))
                      anything-save-enable-shortcuts)
                (resume ,@(anything-mklist (assoc-default 'resume source))
                        anything-save-enable-shortcuts)
                (cleanup ,@(anything-mklist (assoc-default 'cleanup source))
                         (lambda () (setq anything-enable-shortcuts
                                          anything-orig-enable-shortcuts))))
              source)
      source))

<span class="linecomment">;; (@* "Built-in plug-in: candidates-in-buffer")</span>
(defun anything-candidates-in-buffer ()
  "<span class="quote">Get candidates from the candidates buffer according to `anything-pattern'.

BUFFER is `anything-candidate-buffer' by default.  Each
candidate must be placed in one line.  This function is meant to
be used in candidates-in-buffer or candidates attribute of an
anything source.  Especially fast for many (1000+) candidates.

eg.
 '((name . \"many files\")
   (init . (lambda () (with-current-buffer (anything-candidate-buffer 'local)
                        (insert-many-filenames))))
   (search re-search-forward)  ; optional
   (candidates-in-buffer)
   (type . file))

+===============================================================+
| The new way of making and narrowing candidates: Using buffers |
+===============================================================+

By default, `anything' makes candidates by evaluating the
candidates function, then narrows them by `string-match' for each
candidate.

But this way is very slow for many candidates. The new way is
storing all candidates in a buffer and narrowing them by
`re-search-forward'. Search function is customizable by search
attribute. The important point is that buffer processing is MUCH
FASTER than string list processing and is the Emacs way.

The init function writes all candidates to a newly-created
candidate buffer.  The candidates buffer is created or specified
by `anything-candidate-buffer'.  Candidates are stored in a line.

The candidates function narrows all candidates, IOW creates a
subset of candidates dynamically. It is the task of
`anything-candidates-in-buffer'.  As long as
`anything-candidate-buffer' is used,`(candidates-in-buffer)' is
sufficient in most cases.

Note that `(candidates-in-buffer)' is shortcut of three attributes:
  (candidates . anything-candidates-in-buffer)
  (volatile)
  (match identity)
And `(candidates-in-buffer . func)' is shortcut of three attributes:
  (candidates . func)
  (volatile)
  (match identity)
The expansion is performed in `anything-get-sources'.

The candidates-in-buffer attribute implies the volatile attribute.
The volatile attribute is needed because `anything-candidates-in-buffer'
creates candidates dynamically and need to be called everytime
`anything-pattern' changes.

Because `anything-candidates-in-buffer' plays the role of `match' attribute
function, specifying `(match identity)' makes the source slightly faster.

To customize `anything-candidates-in-buffer' behavior, use search,
get-line and search-from-end attributes. See also `anything-sources' docstring.</span>"
  (declare (special source))
  (anything-candidates-in-buffer-1
   (anything-candidate-buffer)
   anything-pattern
   (or (assoc-default 'get-line source)
       #'buffer-substring-no-properties)
   <span class="linecomment">;; use external variable `source'.</span>
   (or (assoc-default 'search source)
       (if (assoc 'search-from-end source)
           '(anything-candidates-in-buffer-search-from-end)
           '(anything-candidates-in-buffer-search-from-start)))
   (anything-candidate-number-limit source)
   (assoc 'search-from-end source)))

(defun anything-candidates-in-buffer-search-from-start (pattern)
  "<span class="quote">Search PATTERN with `re-search-forward' with bound and noerror args.</span>"
  (re-search-forward pattern nil t))

(defun anything-candidates-in-buffer-search-from-end (pattern)
  "<span class="quote">Search PATTERN with `re-search-backward' with bound and noerror args.</span>"
  (re-search-backward pattern nil t))

(defun anything-candidates-in-buffer-1 (buffer pattern get-line-fn
                                        search-fns limit search-from-end)
  <span class="linecomment">;; buffer == nil when candidates buffer does not exist.</span>
  (when buffer
    (with-current-buffer buffer
      (let ((start-point (if search-from-end (point-max) (point-min)))
            (endp (if search-from-end #'bobp #'eobp)))
        (goto-char (1- start-point))
        (if (string= pattern "<span class="quote"></span>")
            (anything-initial-candidates-from-candidate-buffer
             endp get-line-fn limit search-from-end)
            (anything-search-from-candidate-buffer
             pattern get-line-fn search-fns limit search-from-end
             start-point endp))))))

(defun anything-point-is-moved (proc)
  "<span class="quote">If point is moved after executing PROC, return t, otherwise nil.</span>"
  (/= (point) (progn (funcall proc) (point))))

(defun anything-search-from-candidate-buffer (pattern get-line-fn search-fns
                                              limit search-from-end
                                              start-point endp)
  (let (buffer-read-only
        matches exit newmatches)
    (anything-search-from-candidate-buffer-internal
     (lambda ()
       (clrhash anything-cib-hash)
       (dolist (searcher search-fns)
         (goto-char start-point)
         (setq newmatches nil)
         (loop with item-count = 0
               while (funcall searcher pattern)
               for cand = (funcall get-line-fn (point-at-bol) (point-at-eol))
               do (anything-accumulate-candidates-internal
                   cand newmatches anything-cib-hash item-count limit)
               unless (anything-point-is-moved
                       (lambda ()
                         (if search-from-end
                             (goto-char (1- (point-at-bol)))
                             (forward-line 1))))
               return nil)
         (setq matches (append matches (nreverse newmatches)))
         (if exit (return)))
       (delq nil matches)))))

(defun anything-initial-candidates-from-candidate-buffer (endp get-line-fn limit search-from-end)
  (delq nil (loop with next-line-fn =
                  (if search-from-end
                      (lambda (x) (goto-char (max (1- (point-at-bol)) 1)))
                      #'forward-line)
                  until (funcall endp)
                  for i from 1 to limit
                  collect (funcall get-line-fn (point-at-bol) (point-at-eol))
                  do (funcall next-line-fn 1))))

(defun anything-search-from-candidate-buffer-internal (search-fn)
  (goto-char (point-min))
  (insert "<span class="quote">\n</span>")
  (goto-char (point-max))
  (insert "<span class="quote">\n</span>")
  (unwind-protect
       (funcall search-fn)
    (goto-char (point-min))
    (delete-char 1)
    (goto-char (1- (point-max)))
    (delete-char 1)

    (set-buffer-modified-p nil)))

(defun anything-candidate-buffer (&optional create-or-buffer)
  "<span class="quote">Register and return a buffer containing candidates of current source.
`anything-candidate-buffer' searches buffer-local candidates buffer first,
then global candidates buffer.

Acceptable values of CREATE-OR-BUFFER:

- nil (omit)
  Only return the candidates buffer.
- a buffer
  Register a buffer as a candidates buffer.
- 'global
  Create a new global candidates buffer,
  named \" *anything candidates:SOURCE*\".
- other non-nil value
  Create a new local candidates buffer,
  named \" *anything candidates:SOURCE*ANYTHING-CURRENT-BUFFER\".</span>"
  (let* ((global-bname (format "<span class="quote"> *anything candidates:%s*</span>"
                               anything-source-name))
         (local-bname (format "<span class="quote"> *anything candidates:%s*%s</span>"
                              anything-source-name
                              (buffer-name anything-current-buffer))))
    (flet ((register-func ()
             (setq anything-candidate-buffer-alist
                   (cons (cons anything-source-name create-or-buffer)
                         (delete (assoc anything-source-name
                                        anything-candidate-buffer-alist)
                                 anything-candidate-buffer-alist))))
           (kill-buffers-func ()
             (loop for b in (buffer-list)
                   if (string-match (format "<span class="quote">^%s</span>" (regexp-quote global-bname))
                                    (buffer-name b))
                   do (kill-buffer b)))
           (create-func ()
             (with-current-buffer
                 (get-buffer-create (if (eq create-or-buffer 'global)
                                        global-bname
                                        local-bname))
               (buffer-disable-undo)
               (erase-buffer)
               (font-lock-mode -1)))
           (return-func ()
             (or (get-buffer local-bname)
                 (get-buffer global-bname)
                 (anything-aif (assoc-default anything-source-name
                                              anything-candidate-buffer-alist)
                     (and (buffer-live-p it) it)))))
      (when create-or-buffer
        (register-func)
        (unless (bufferp create-or-buffer)
          (and (eq create-or-buffer 'global) (kill-buffers-func))
          (create-func)))
      (return-func))))

(defun anything-compile-source--candidates-in-buffer (source)
  (anything-aif (assoc 'candidates-in-buffer source)
      (append source
              `((candidates . ,(or (cdr it) 'anything-candidates-in-buffer))
                (volatile) (match identity)))
    source))

 
<span class="linecomment">;; (@* "Utility: resplit anything window")</span>
(defun anything-toggle-resplit-window ()
  "<span class="quote">Toggle resplit anything window, vertically or horizontally.</span>"
  (interactive)
  (with-anything-window
    (let ((before-height (window-height)))
      (delete-window)
      (set-window-buffer
       (select-window (if (= (window-height) before-height)
                          (prog1
                              (split-window-vertically)
                            (setq anything-split-window-state 'vertical))
                          (setq anything-split-window-state 'horizontal)
                          (split-window-horizontally)))
       anything-buffer))))

<span class="linecomment">;; (@* "Utility: Resize anything window.")</span>
(defun anything-enlarge-window-1 (n)
  "<span class="quote">Enlarge or narrow anything window.
If N is positive enlarge, if negative narrow.</span>"
  (unless anything-samewindow
    (let ((horizontal-p (eq anything-split-window-state 'horizontal)))
      (with-anything-window
        (enlarge-window n horizontal-p)))))

(defun anything-narrow-window ()
  "<span class="quote">Narrow anything window.</span>"
  (interactive)
  (anything-enlarge-window-1 -1))

(defun anything-enlarge-window ()
  "<span class="quote">Enlarge anything window.</span>"
  (interactive)
  (anything-enlarge-window-1 1))

<span class="linecomment">;; (@* "Utility: select another action by key")</span>
(defun anything-select-nth-action (n)
  "<span class="quote">Select the N nth action for the currently selected candidate.</span>"
  (setq anything-saved-selection (anything-get-selection))
  (unless anything-saved-selection
    (error "<span class="quote">Nothing is selected</span>"))
  (setq anything-saved-action (anything-get-nth-action n (anything-get-action)))
  (anything-exit-minibuffer))

(defun anything-get-nth-action (n action)
  (cond ((and (zerop n) (functionp action))
         action)
        ((listp action)
         (or (cdr (elt action n))
             (error "<span class="quote">No such action</span>")))
        ((and (functionp action) (&lt; 0 n))
         (error "<span class="quote">Sole action</span>"))
        (t
         (error "<span class="quote">Error in `anything-select-nth-action'</span>"))))

(defun anything-select-2nd-action ()
  "<span class="quote">Select the 2nd action for the currently selected candidate.</span>"
  (interactive)
  (anything-select-nth-action 1))

(defun anything-select-3rd-action ()
  "<span class="quote">Select the 3rd action for the currently selected candidate.</span>"
  (interactive)
  (anything-select-nth-action 2))

(defun anything-select-4th-action ()
  "<span class="quote">Select the 4th action for the currently selected candidate.</span>"
  (interactive)
  (anything-select-nth-action 3))

(defun anything-select-2nd-action-or-end-of-line ()
  "<span class="quote">Select the 2nd action for the currently selected candidate.
This happen when point is at the end of minibuffer.
Otherwise goto the end of minibuffer.</span>"
  (interactive)
  (if (eolp)
      (anything-select-nth-action 1)
      (end-of-line)))

<span class="linecomment">;; (@* "Utility: Persistent Action")</span>
(defmacro with-anything-display-same-window (&rest body)
  "<span class="quote">Execute BODY in the window used for persistent action.
Make `pop-to-buffer' and `display-buffer' display in the same window.</span>"
  (declare (indent 0) (debug t))
  `(let ((display-buffer-function 'anything-persistent-action-display-buffer))
     ,@body))

(defvar anything-persistent-action-display-window nil)
(defun anything-initialize-persistent-action ()
  (set (make-local-variable 'anything-persistent-action-display-window) nil))

(defun* anything-execute-persistent-action (&optional (attr 'persistent-action) onewindow)
  "<span class="quote">Perform the associated action ATTR without quitting anything.
ATTR default is 'persistent-action', but it can be anything else.
In this case you have to add this new attribute to your source.
When `anything-samewindow' and ONEWINDOW are non--nil,
the anything window is never split in persistent action.</span>"
  (interactive)
  (anything-log "<span class="quote">executing persistent-action</span>")
  (with-anything-window
    (save-selected-window
      (anything-select-persistent-action-window onewindow)
      (anything-log-eval (current-buffer))
      (let ((anything-in-persistent-action t))
        (with-anything-display-same-window
          (anything-execute-selection-action
           nil
           (or (assoc-default attr (anything-get-current-source))
               (anything-get-action))
           t)
          (anything-log-run-hook 'anything-after-persistent-action-hook))))))


(defun anything-persistent-action-display-window (&optional onewindow)
  "<span class="quote">Return the window that will be used for presistent action.
If ONEWINDOW is non--nil window will not be splitted in persistent action
if `anything-samewindow' is non--nil also.</span>"
  (with-anything-window
    (setq anything-persistent-action-display-window
          (cond ((window-live-p anything-persistent-action-display-window)
                 anything-persistent-action-display-window)
                ((and anything-samewindow (one-window-p t) (not onewindow))
                 (split-window))
                ((get-buffer-window anything-current-buffer))
                (t
                 (next-window (selected-window) 1))))))

(defun anything-select-persistent-action-window (&optional onewindow)
  "<span class="quote">Select the window that will be used for persistent action.
See `anything-persistent-action-display-window' for how to use ONEWINDOW.</span>"
  (select-window (get-buffer-window (anything-buffer-get)))
  (select-window
   (setq minibuffer-scroll-window
         (anything-persistent-action-display-window onewindow))))

(defun anything-persistent-action-display-buffer (buf &optional not-this-window)
  "<span class="quote">Make `pop-to-buffer' and `display-buffer' display in the same window.
If `anything-persistent-action-use-special-display' is non-nil and
BUF is to be displayed by `special-display-function', use it.
Otherwise ignores `special-display-buffer-names' and `special-display-regexps'.
Argument NOT-THIS-WINDOW if present will be used as
second argument of `display-buffer'.</span>"
  (let* ((name (buffer-name buf))
         display-buffer-function pop-up-windows pop-up-frames
         (same-window-regexps
          (unless (and anything-persistent-action-use-special-display
                       (or (member name
                                   (mapcar (lambda (x) (or (car-safe x) x))
                                           special-display-buffer-names))
                           (remove-if-not
                            (lambda (x) (string-match (or (car-safe x) x) name))
                            special-display-regexps)))
            '("<span class="quote">.</span>"))))
    (display-buffer buf not-this-window)))

<span class="linecomment">;; scroll-other-window(-down)? for persistent-action</span>
(defun anything-scroll-other-window-base (command)
  (with-selected-window (anything-persistent-action-display-window)
    (funcall command anything-scroll-amount)))

(defun anything-scroll-other-window ()
  "<span class="quote">Scroll other window (not *Anything* window) upward.</span>"
  (interactive)
  (anything-scroll-other-window-base 'scroll-up))

(defun anything-scroll-other-window-down ()
  "<span class="quote">Scroll other window (not *Anything* window) downward.</span>"
  (interactive)
  (anything-scroll-other-window-base 'scroll-down))

 
<span class="linecomment">;; (@* "Utility: Visible Mark")</span>
(defface anything-visible-mark
    '((((min-colors 88) (background dark))
       (:background "<span class="quote">green1</span>" :foreground "<span class="quote">black</span>"))
      (((background dark)) (:background "<span class="quote">green</span>" :foreground "<span class="quote">black</span>"))
      (((min-colors 88)) (:background "<span class="quote">green1</span>"))
      (t (:background "<span class="quote">green</span>")))
  "<span class="quote">Face for visible mark.</span>"
  :group 'anything)

(defvar anything-visible-mark-face 'anything-visible-mark)
(defvar anything-visible-mark-overlays nil)

(defun anything-clear-visible-mark ()
  (with-current-buffer (anything-buffer-get)
    (mapc 'delete-overlay anything-visible-mark-overlays)
    (set (make-local-variable 'anything-visible-mark-overlays) nil)))
(add-hook 'anything-after-initialize-hook 'anything-clear-visible-mark)

(defvar anything-marked-candidates nil
  "<span class="quote">Marked candadates.  List of \(source . real\) pair.</span>")

(defun anything-this-visible-mark ()
  (loop for o in anything-visible-mark-overlays
        when (equal (point-at-bol) (overlay-start o))
        return o))

(defun anything-delete-visible-mark (overlay)
  (setq anything-marked-candidates
        (remove
         (cons (anything-get-current-source) (anything-get-selection))
         anything-marked-candidates))
  (delete-overlay overlay)
  (setq anything-visible-mark-overlays
        (delq overlay anything-visible-mark-overlays)))

(defun anything-make-visible-mark ()
  (let ((o (make-overlay (point-at-bol) (1+ (point-at-eol)))))
    (overlay-put o 'face   anything-visible-mark-face)
    (overlay-put o 'source (assoc-default 'name (anything-get-current-source)))
    (overlay-put o 'string (buffer-substring (overlay-start o) (overlay-end o)))
    (overlay-put o 'real   (anything-get-selection))
    (add-to-list 'anything-visible-mark-overlays o))
  (push (cons (anything-get-current-source) (anything-get-selection))
        anything-marked-candidates))

(defun anything-toggle-visible-mark ()
  "<span class="quote">Toggle anything visible mark at point.</span>"
  (interactive)
  (with-anything-window
    (anything-aif (anything-this-visible-mark)
        (anything-delete-visible-mark it)
      (anything-make-visible-mark))
    (anything-next-line)))

(defun anything-display-all-visible-marks ()
  "<span class="quote">Show all `anything' visible marks strings.</span>"
  (interactive)
  (with-anything-window
    (lexical-let ((overlays (reverse anything-visible-mark-overlays)))
      (anything-run-after-quit
       (lambda ()
         (with-output-to-temp-buffer "<span class="quote">*anything visible marks*</span>"
           (dolist (o overlays) (princ (overlay-get o 'string)))))))))

(defun anything-marked-candidates ()
  "<span class="quote">Return marked candidates of current source if any.
Otherwise one element list of current selection.

It is analogous to `dired-get-marked-files'.</span>"
  (with-current-buffer (anything-buffer-get)
    (let ((cands
           (if anything-marked-candidates
               (loop with current-src = (anything-get-current-source)
                     for (source . real) in (reverse anything-marked-candidates)
                     when (equal current-src source)
                     collect (anything-coerce-selection real source))
               (list (anything-get-selection)))))
      (anything-log-eval cands)
      cands)))

(defun anything-reset-marked-candidates ()
  (with-current-buffer (anything-buffer-get)
    (set (make-local-variable 'anything-marked-candidates) nil)))

(add-hook 'anything-after-initialize-hook 'anything-reset-marked-candidates)
<span class="linecomment">;; (add-hook 'anything-after-action-hook 'anything-reset-marked-candidates)</span>

(defun anything-current-source-name= (name)
  (save-excursion
    (goto-char (anything-get-previous-header-pos))
    (equal name (anything-current-line-contents))))

(defun anything-revive-visible-mark ()
  "<span class="quote">Restore marked candidates when anything update display.</span>"
  (with-current-buffer anything-buffer
    (dolist (o anything-visible-mark-overlays)
      (goto-char (point-min))
      (while (and (search-forward (overlay-get o 'string) nil t)
                  (anything-current-source-name= (overlay-get o 'source)))
        <span class="linecomment">;; Calculate real value of candidate.</span>
        <span class="linecomment">;; It can be nil if candidate have only a display value.</span>
        (let ((real (get-text-property (point-at-bol 0) 'anything-realvalue)))
          (if real
              <span class="linecomment">;; Check if real value of current candidate is the same</span>
              <span class="linecomment">;; that the one stored in overlay.</span>
              (and (string= (overlay-get o 'real) real)
                   (move-overlay o (point-at-bol 0) (1+ (point-at-eol 0))))
              (move-overlay o (point-at-bol 0) (1+ (point-at-eol 0)))))))))
(add-hook 'anything-update-hook 'anything-revive-visible-mark)

(defun anything-next-point-in-list (curpos points &optional prev)
  (cond
    <span class="linecomment">;; rule out special cases</span>
    ((null points)                        curpos)
    ((and prev (&lt; curpos (car points)))   curpos)
    ((&lt; (car (last points)) curpos)
     (if prev (car (last points)) curpos))
    (t
     (nth (if prev
              (loop for pt in points
                    for i from 0
                    if (&lt;= curpos pt)
                    return (1- i))
              (loop for pt in points
                    for i from 0
                    if (&lt; curpos pt)
                    return i))
          points))))

(defun anything-next-visible-mark (&optional prev)
  "<span class="quote">Move next anything visible mark.
If PREV is non-nil move to precedent.</span>"
  (interactive)
  (with-anything-window
    (ignore-errors
      (goto-char (anything-next-point-in-list
                  (point)
                  (sort (mapcar 'overlay-start anything-visible-mark-overlays) '&lt;)
                  prev)))
    (anything-mark-current-line)))

(defun anything-prev-visible-mark ()
  "<span class="quote">Move previous anything visible mark.</span>"
  (interactive)
  (anything-next-visible-mark t))

<span class="linecomment">;; (@* "Utility: Selection Paste")</span>
(defun anything-yank-selection ()
  "<span class="quote">Set minibuffer contents to current selection.</span>"
  (interactive)
  (anything-set-pattern (anything-get-selection nil t)))

(defun anything-kill-selection-and-quit ()
  "<span class="quote">Store current selection to kill ring.
You can paste it by typing \\[yank].</span>"
  (interactive)
  (anything-run-after-quit
   (lambda (sel)
     (kill-new sel)
     (message "<span class="quote">Killed: %s</span>" sel))
   (anything-get-selection nil t)))

 
<span class="linecomment">;; (@* "Utility: Automatical execution of persistent-action")</span>
(add-to-list 'minor-mode-alist '(anything-follow-mode "<span class="quote"> AFollow</span>"))
(defun anything-follow-mode ()
  "<span class="quote">If this mode is on, persistent action is executed everytime the cursor is moved.</span>"
  (interactive)
  (with-current-buffer anything-buffer
    (setq anything-follow-mode (not anything-follow-mode))
    (message "<span class="quote">anything-follow-mode is %s</span>"
             (if anything-follow-mode "<span class="quote">enabled</span>" "<span class="quote">disabled</span>"))))

(defun anything-follow-execute-persistent-action-maybe ()
  "<span class="quote">Execute persistent action in mode `anything-follow-mode'.
This happen after `anything-input-idle-delay' secs.</span>"
  (and (not (get-buffer-window anything-action-buffer 'visible))
       (buffer-local-value 'anything-follow-mode
                           (get-buffer-create anything-buffer))
       (sit-for (and anything-input-idle-delay
                     (max anything-input-idle-delay 0.1)))
       (anything-window)
       (anything-get-selection)
       (save-excursion
         (anything-execute-persistent-action))))

 
<span class="linecomment">;; (@* "Utility: Migrate `anything-sources' to my-anything command")</span>
(defun anything-migrate-sources ()
  "<span class="quote">Help to migrate to new `anything' way.</span>"
  (interactive)
  (with-current-buffer (get-buffer-create "<span class="quote">*anything migrate*</span>")
    (erase-buffer)
    (insert (format "<span class="quote">\
Setting `anything-sources' directly is not good because
`anything' is not for one command.  For now, interactive use of
`anything' (M-x anything) is only for demonstration purpose.
So you should define commands calling `anything'.
I help you to migrate to the new way.

The code below is automatically generated from current
`anything-sources' value. You can use the `my-anything' command
now!

Copy and paste it to your .emacs. Then substitute `my-anything'
for `anything' bindings in all `define-key', `local-set-key' and
`global-set-key' calls.

\(defun my-anything ()
  \"Anything command for you.

It is automatically generated by `anything-migrate-sources'.\"
  (interactive)
  (anything-other-buffer
    '%S
    \"*my-anything*\"))
</span>" anything-sources))
    (eval-last-sexp nil)
    (substitute-key-definition 'anything 'my-anything global-map)
    (pop-to-buffer (current-buffer))))

 
<span class="linecomment">;; (@* "Compatibility")</span>

<span class="linecomment">;; Copied assoc-default from XEmacs version 21.5.12</span>
(unless (fboundp 'assoc-default)
  (defun assoc-default (key alist &optional test default)
    "<span class="quote">Find object KEY in a pseudo-alist ALIST.
ALIST is a list of conses or objects.  Each element (or the element's car,
if it is a cons) is compared with KEY by evaluating (TEST (car elt) KEY).
If that is non-nil, the element matches;
then `assoc-default' returns the element's cdr, if it is a cons,
or DEFAULT if the element is not a cons.

If no element matches, the value is nil.
If TEST is omitted or nil, `equal' is used.</span>"
    (let (found (tail alist) value)
      (while (and tail (not found))
        (let ((elt (car tail)))
          (when (funcall (or test 'equal) (if (consp elt) (car elt) elt) key)
            (setq found t value (if (consp elt) (cdr elt) default))))
        (setq tail (cdr tail)))
      value)))

<span class="linecomment">;; Function not available in XEmacs,</span>
(unless (fboundp 'minibuffer-contents)
  (defun minibuffer-contents ()
    "<span class="quote">Return the user input in a minbuffer as a string.
The current buffer must be a minibuffer.</span>"
    (field-string (point-max)))

  (defun delete-minibuffer-contents  ()
    "<span class="quote">Delete all user input in a minibuffer.
The current buffer must be a minibuffer.</span>"
    (delete-field (point-max))))

<span class="linecomment">;; Function not available in older Emacs (&lt;= 22.1).</span>
(unless (fboundp 'buffer-chars-modified-tick)
  (defun buffer-chars-modified-tick (&optional buffer)
    "<span class="quote">Return BUFFER's character-change tick counter.
Each buffer has a character-change tick counter, which is set to the
value of the buffer's tick counter (see `buffer-modified-tick'), each
time text in that buffer is inserted or deleted.  By comparing the
values returned by two individual calls of `buffer-chars-modified-tick',
you can tell whether a character change occurred in that buffer in
between these calls.  No argument or nil as argument means use current
buffer as BUFFER.</span>"
    (with-current-buffer (or buffer (current-buffer))
      (if (listp buffer-undo-list)
          (length buffer-undo-list)
          (buffer-modified-tick)))))

 
<span class="linecomment">;; (@* "CUA workaround")</span>
(defadvice cua-delete-region (around anything-avoid-cua activate)
  (ignore-errors ad-do-it))

(defadvice copy-region-as-kill (around anything-avoid-cua activate)
  (if cua-mode
      (ignore-errors ad-do-it)
      ad-do-it))

<span class="linecomment">;;(@* "Attribute Documentation")</span>
(defun anything-describe-anything-attribute (anything-attribute)
  "<span class="quote">Display the full documentation of ANYTHING-ATTRIBUTE.
ANYTHING-ATTRIBUTE should be a symbol.</span>"
  (interactive (list (intern
                      (completing-read
                       "<span class="quote">Describe anything attribute: </span>"
                       (mapcar 'symbol-name anything-additional-attributes)
                       nil t))))
  (with-output-to-temp-buffer "<span class="quote">*Help*</span>"
    (princ (get anything-attribute 'anything-attrdoc))))

(anything-document-attribute 'name "<span class="quote">mandatory</span>"
  "<span class="quote">  The name of the source. It is also the heading which appears
  above the list of matches from the source. Must be unique.</span>")

(anything-document-attribute 'header-name "<span class="quote">optional</span>"
  "<span class="quote">  A function returning the display string of the header. Its
  argument is the name of the source. This attribute is useful to
  add an additional information with the source name.</span>")

(anything-document-attribute 'candidates "<span class="quote">mandatory if candidates-in-buffer attribute is not provided</span>"
  "<span class="quote">  Specifies how to retrieve candidates from the source. It can
  either be a variable name, a function called with no parameters
  or the actual list of candidates.

  The list must be a list whose members are strings, symbols
  or (DISPLAY . REAL) pairs.

  In case of (DISPLAY . REAL) pairs, the DISPLAY string is shown
  in the Anything buffer, but the REAL one is used as action
  argument when the candidate is selected. This allows a more
  readable presentation for candidates which would otherwise be,
  for example, too long or have a common part shared with other
  candidates which can be safely replaced with an abbreviated
  string for display purposes.

  Note that if the (DISPLAY . REAL) form is used then pattern
  matching is done on the displayed string, not on the real
  value.

  If the candidates have to be retrieved asynchronously (for
  example, by an external command which takes a while to run)
  then the function should start the external command
  asynchronously and return the associated process object.
  Anything will take care of managing the process (receiving the
  output from it, killing it if necessary, etc.). The process
  should return candidates matching the current pattern (see
  variable `anything-pattern'.)

  Note that currently results from asynchronous sources appear
  last in the anything buffer regardless of their position in
  `anything-sources'.</span>")

(anything-document-attribute 'action "<span class="quote">mandatory if type attribute is not provided</span>"
  "<span class="quote">  It is a list of (DISPLAY . FUNCTION) pairs or FUNCTION.
  FUNCTION is called with one parameter: the selected candidate.

  An action other than the default can be chosen from this list
  of actions for the currently selected candidate (by default
  with TAB). The DISPLAY string is shown in the completions
  buffer and the FUNCTION is invoked when an action is
  selected. The first action of the list is the default.</span>")

(anything-document-attribute 'coerce "<span class="quote">optional</span>"
  "<span class="quote">  It's a function called with one argument: the selected candidate.

  This function is intended for type convertion.
  In normal case, the selected candidate (string) is passed to action function.
  If coerce function is specified, it is called just before action function.

  Example: converting string to symbol
    (coerce . intern)</span>")

(anything-document-attribute 'type "<span class="quote">optional if action attribute is provided</span>"
  "<span class="quote">  Indicates the type of the items the source returns.

  Merge attributes not specified in the source itself from
  `anything-type-attributes'.

  This attribute is implemented by plug-in.</span>")

(anything-document-attribute 'init "<span class="quote">optional</span>"
  "<span class="quote">  Function called with no parameters when anything is started. It
  is useful for collecting current state information which can be
  used to create the list of candidates later.

  For example, if a source needs to work with the current
  directory then it can store its value here, because later
  anything does its job in the minibuffer and in the
  `anything-buffer' and the current directory can be different
  there.</span>")

(anything-document-attribute 'delayed-init "<span class="quote">optional</span>"
  "<span class="quote">  Function called with no parameters before candidate function is
  called.  It is similar with `init' attribute, but its
  evaluation is deferred. It is useful to combine with </span>")

(anything-document-attribute 'match "<span class="quote">optional</span>"
  "<span class="quote">  List of functions called with one parameter: a candidate. The
  function should return non-nil if the candidate matches the
  current pattern (see variable `anything-pattern').

  This attribute allows the source to override the default
  pattern matching based on `string-match'. It can be used, for
  example, to implement a source for file names and do the
  pattern matching on the basename of files, since it's more
  likely one is typing part of the basename when searching for a
  file, instead of some string anywhere else in its path.

  If the list contains more than one function then the list of
  matching candidates from the source is constructed by appending
  the results after invoking the first function on all the
  potential candidates, then the next function, and so on. The
  matching candidates supplied by the first function appear first
  in the list of results and then results from the other
  functions, respectively.

  This attribute has no effect for asynchronous sources (see
  attribute `candidates'), since they perform pattern matching
  themselves.</span>")

(anything-document-attribute 'candidate-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It's a function or a list of functions called with one argument
  when the completion list from the source is built. The argument
  is the list of candidates retrieved from the source. The
  function should return a transformed list of candidates which
  will be used for the actual completion.  If it is a list of
  functions, it calls each function sequentially.

  This can be used to transform or remove items from the list of
  candidates.

  Note that `candidates' is run already, so the given transformer
  function should also be able to handle candidates with (DISPLAY
  . REAL) format.</span>")

(anything-document-attribute 'filtered-candidate-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It has the same format as `candidate-transformer', except the
  function is called with two parameters: the candidate list and
  the source.

  This transformer is run on the candidate list which is already
  filtered by the current pattern. While `candidate-transformer'
  is run only once, it is run every time the input pattern is
  changed.

  It can be used to transform the candidate list dynamically, for
  example, based on the current pattern.

  In some cases it may also be more efficent to perform candidate
  transformation here, instead of with `candidate-transformer'
  even if this transformation is done every time the pattern is
  changed.  For example, if a candidate set is very large then
  `candidate-transformer' transforms every candidate while only
  some of them will actually be dislpayed due to the limit
  imposed by `anything-candidate-number-limit'.

  Note that `candidates' and `candidate-transformer' is run
  already, so the given transformer function should also be able
  to handle candidates with (DISPLAY . REAL) format.

  This option has no effect for asynchronous sources. (Not yet,
  at least.</span>")

(anything-document-attribute 'action-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It's a function or a list of functions called with two
  arguments when the action list from the source is
  assembled. The first argument is the list of actions, the
  second is the current selection.  If it is a list of functions,
  it calls each function sequentially.

  The function should return a transformed action list.

  This can be used to customize the list of actions based on the
  currently selected candidate.</span>")

(anything-document-attribute 'pattern-transformer "<span class="quote">optional</span>"
  "<span class="quote">  It's a function or a list of functions called with one argument
  before computing matches. Its argument is `anything-pattern'.
  Functions should return transformed `anything-pattern'.

  It is useful to change interpretation of `anything-pattern'.</span>")

(anything-document-attribute 'delayed "<span class="quote">optional</span>"
  "<span class="quote">  Candidates from the source are shown only if the user stops
  typing and is idle for `anything-idle-delay' seconds.</span>")

(anything-document-attribute 'volatile "<span class="quote">optional</span>"
  "<span class="quote">  Indicates the source assembles the candidate list dynamically,
  so it shouldn't be cached within a single Anything
  invocation. It is only applicable to synchronous sources,
  because asynchronous sources are not cached.</span>")

(anything-document-attribute 'requires-pattern "<span class="quote">optional</span>"
  "<span class="quote">  If present matches from the source are shown only if the
  pattern is not empty. Optionally, it can have an integer
  parameter specifying the required length of input which is
  useful in case of sources with lots of candidates.</span>")

(anything-document-attribute 'persistent-action "<span class="quote">optional</span>"
  "<span class="quote">  Function called with one parameter; the selected candidate.

  An action performed by `anything-execute-persistent-action'.
  If none, use the default action.</span>")

(anything-document-attribute 'candidates-in-buffer "<span class="quote">optional</span>"
  "<span class="quote">  Shortcut attribute for making and narrowing candidates using
  buffers.  This newly-introduced attribute prevents us from
  forgetting to add volatile and match attributes.

  See docstring of `anything-candidates-in-buffer'.

  (candidates-in-buffer) is equivalent of three attributes:
    (candidates . anything-candidates-in-buffer)
    (volatile)
    (match identity)

  (candidates-in-buffer . candidates-function) is equivalent of:
    (candidates . candidates-function)
    (volatile)
    (match identity)

  This attribute is implemented by plug-in.</span>")

(anything-document-attribute 'search "<span class="quote">optional</span>"
  "<span class="quote">  List of functions like `re-search-forward' or `search-forward'.
  Buffer search function used by `anything-candidates-in-buffer'.
  By default, `anything-candidates-in-buffer' uses `re-search-forward'.
  This attribute is meant to be used with
  (candidates . anything-candidates-in-buffer) or
  (candidates-in-buffer) in short.</span>")

(anything-document-attribute 'search-from-end "<span class="quote">optional</span>"
  "<span class="quote">  Make `anything-candidates-in-buffer' search from the end of buffer.
  If this attribute is specified, `anything-candidates-in-buffer' uses
  `re-search-backward' instead.</span>")

(anything-document-attribute 'get-line "<span class="quote">optional</span>"
  "<span class="quote">  A function like `buffer-substring-no-properties' or `buffer-substring'.
  This function converts point of line-beginning and point of line-end,
  which represents a candidate computed by `anything-candidates-in-buffer'.
  By default, `anything-candidates-in-buffer' uses
  `buffer-substring-no-properties'.</span>")

(anything-document-attribute 'display-to-real "<span class="quote">optional</span>"
  "<span class="quote">  Function called with one parameter; the selected candidate.

  The function transforms the selected candidate, and the result
  is passed to the action function.  The display-to-real
  attribute provides another way to pass other string than one
  shown in Anything buffer.

  Traditionally, it is possible to make candidates,
  candidate-transformer or filtered-candidate-transformer
  function return a list with (DISPLAY . REAL) pairs. But if REAL
  can be generated from DISPLAY, display-to-real is more
  convenient and faster.</span>")

(anything-document-attribute 'real-to-display "<span class="quote">optional</span>"
  "<span class="quote">  Function called with one parameter; the selected candidate.

  The inverse of display-to-real attribute.

  The function transforms the selected candidate, which is passed
  to the action function, for display.  The real-to-display
  attribute provides the other way to pass other string than one
  shown in Anything buffer.

  Traditionally, it is possible to make candidates,
  candidate-transformer or filtered-candidate-transformer
  function return a list with (DISPLAY . REAL) pairs. But if
  DISPLAY can be generated from REAL, real-to-display is more
  convenient.

  Note that DISPLAY parts returned from candidates /
  candidate-transformer are IGNORED as the name `display-to-real'
  says.</span>")

(anything-document-attribute 'cleanup "<span class="quote">optional</span>"
  "<span class="quote">  Function called with no parameters when *anything* buffer is closed. It
  is useful for killing unneeded candidates buffer.

  Note that the function is executed BEFORE performing action.</span>")

(anything-document-attribute 'candidate-number-limit "<span class="quote">optional</span>"
  "<span class="quote">  Override `anything-candidate-number-limit' only for this source.</span>")

(anything-document-attribute 'accept-empty "<span class="quote">optional</span>"
  "<span class="quote">  Pass empty string \"\" to action function.</span>")

(anything-document-attribute 'disable-shortcuts "<span class="quote">optional</span>"
  "<span class="quote">  Disable `anything-enable-shortcuts' in current `anything' session.

  This attribute is implemented by plug-in.</span>")

(anything-document-attribute 'dummy "<span class="quote">optional</span>"
  "<span class="quote">  Set `anything-pattern' to candidate. If this attribute is
  specified, The candidates attribute is ignored.

  This attribute is implemented by plug-in.
  This plug-in implies disable-shortcuts plug-in.</span>")

(anything-document-attribute 'multiline "<span class="quote">optional</span>"
  "<span class="quote">  Enable to selection multiline candidates.</span>")

(anything-document-attribute 'update "<span class="quote">optional</span>"
  (substitute-command-keys
   "<span class="quote">  Function called with no parameters when \
\\&lt;anything-map&gt;\\[anything-force-update] is pressed.</span>"))

(anything-document-attribute 'mode-line "<span class="quote">optional</span>"
  "<span class="quote">  source local `anything-mode-line-string'. (included in `mode-line-format')
  It accepts also variable/function name.</span>")

(anything-document-attribute 'header-line "<span class="quote">optional</span>"
  "<span class="quote">  source local `header-line-format'.
  It accepts also variable/function name. </span>")

(anything-document-attribute
 'resume "<span class="quote">optional</span>"
 "<span class="quote">  Function called with no parameters when `anything-resume' is started.</span>")

(anything-document-attribute 'keymap "<span class="quote">optional</span>"
  "<span class="quote">  Specific keymap for this source.
  It is useful to have a keymap per source when using more than one source.
  Otherwise, a keymap can be set per command with `anything' argument KEYMAP.
  NOTE: when a source have `anything-map' as keymap attr,
  the global value of `anything-map' will override the actual local one.</span>")

(anything-document-attribute 'help-message "<span class="quote">optional</span>"
  "<span class="quote">  Help message for this source.
  If not present, `anything-help-message' value will be used.</span>")

 
<span class="linecomment">;; (@* "Bug Report")</span>
(defvar anything-maintainer-mail-address "<span class="quote">emacs-anything@googlegroups.com</span>")

(defvar anything-bug-report-salutation
  "<span class="quote">Describe bug below, using a precise recipe.

When I executed M-x ...

How to send a bug report:
  1) Be sure to use the LATEST version of anything.el.
  2) Enable debugger. M-x toggle-debug-on-error or (setq debug-on-error t)
  3) Use Lisp version instead of compiled one: (load \"anything.el\")
  4) If you got an error, please paste *Backtrace* buffer.
  5) Type C-c C-c to send.</span>")

(defvar anything-no-dump-variables
  '(anything-candidate-buffer-alist
    anything-digit-overlays
    anything-help-message
    anything-candidate-cache
    )
  "<span class="quote">Variables not to dump in bug report.</span>")

(defun anything-dumped-variables-in-bug-report ()
  (let ((hash (make-hash-table)))
    (loop for var in (apropos-internal "<span class="quote">anything-</span>" 'boundp)
          for vname = (symbol-name var)
          unless (or (string-match "<span class="quote">-map$</span>" vname)
                     (string-match "<span class="quote">^anything-c-source-</span>" vname)
                     (string-match "<span class="quote">-hash$</span>" vname)
                     (string-match "<span class="quote">-face$</span>" vname)
                     (memq var anything-no-dump-variables))
          collect var)))

(defun anything-send-bug-report ()
  "<span class="quote">Send a bug report of anything.el.</span>"
  (interactive)
  (with-current-buffer (or anything-last-buffer
                           (current-buffer))
    (reporter-submit-bug-report
     anything-maintainer-mail-address
     "<span class="quote">anything.el</span>"
     (anything-dumped-variables-in-bug-report)
     nil nil
     anything-bug-report-salutation)))

(defun anything-send-bug-report-from-anything ()
  "<span class="quote">Send a bug report of anything.el in anything session.</span>"
  (interactive)
  (anything-run-after-quit 'anything-send-bug-report))

<span class="linecomment">;; Debugging function.</span>
(defun* anything-test-candidates
    (sources &optional (input "<span class="quote"></span>")
             (compile-source-functions
              anything-compile-source-functions-default))
  "<span class="quote">Test helper function for anything.
Given pseudo `anything-sources' and `anything-pattern', returns list like
  ((\"source name1\" (\"candidate1\" \"candidate2\"))
   (\"source name2\" (\"candidate3\" \"candidate4\")))</span>"
  (let ((anything-test-mode t)
        anything-enable-shortcuts
        anything-candidate-cache
        (anything-compile-source-functions compile-source-functions)
        anything-before-initialize-hook
        anything-after-initialize-hook
        anything-update-hook
        anything-test-candidate-list)
    (get-buffer-create anything-buffer)
    (anything-initialize nil input sources)
    (anything-update)
    <span class="linecomment">;; test-mode spec: select 1st candidate!</span>
    (with-current-buffer anything-buffer
      (forward-line 1)
      (anything-mark-current-line))
    (prog1
        anything-test-candidate-list
      (anything-cleanup))))

 
<span class="linecomment">;; (@* "Unit Tests")</span>
<span class="linecomment">;; See developer-tools/unit-test-anything.el</span>

(provide 'anything)

<span class="linecomment">;; Local Variables:</span>
<span class="linecomment">;; coding: utf-8</span>
<span class="linecomment">;; End:</span>

<span class="linecomment">;;; anything.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=anything.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_anything.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=anything.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=anything.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=anything.el">Administration</a></span><span class="time"><br /> Last edited 2012-10-16 13:01 UTC by <a class="author" title="from 61-26-108-88.rev.home.ne.jp" href="http://www.emacswiki.org/emacs/rubikitch">rubikitch</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=anything.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
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
