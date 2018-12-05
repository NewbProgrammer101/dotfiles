;;; cloc-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "cloc" "cloc.el" (23268 60253 837180 231000))
;;; Generated autoloads from cloc.el

(autoload 'cloc-get-results-as-plists "cloc" "\
Get output of cloc results as a list of plists. Each plist contains as a
property the number of files analyzed, the blank lines, the code lines, comment
lines, etc. for a given language in the range of files tested. If PREFIX-GIVEN
is set to true, this runs on the current buffer. If not, and REGEX is given,
it will search file-visiting buffers for file paths matching the regex. If the
regex is nil, it will prompt for a regex; putting in a blank there will default
to the current buffer.

\(fn PREFIX-GIVEN &optional REGEX)" nil nil)

(autoload 'cloc "cloc" "\
Run the executable \"cloc\" over file-visiting buffers with pathname
specified by a regex. If PREFIX-GIVEN is true or a blank regex is given, the
current buffer is \"cloc'd\". cloc's entire summary output is given in the
messages buffer.

\(fn PREFIX-GIVEN)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; cloc-autoloads.el ends here
