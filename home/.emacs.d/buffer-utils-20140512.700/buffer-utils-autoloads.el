;;; buffer-utils-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "buffer-utils" "buffer-utils.el" (23268 60077
;;;;;;  112095 987000))
;;; Generated autoloads from buffer-utils.el

(autoload 'buffer-utils-save-order "buffer-utils" "\
Execute BODY, then restore previous buffer order.

This macro saves the buffer order, executes BODY, then restores
the saved order.  The return value is the last form in BODY.

The buffer order is also restored if BODY exits nonlocally.

Note: BODY should not add or remove buffers, but a graceful
recovery will be attempted if that does occur.

\(fn &rest BODY)" nil t)

(function-put 'buffer-utils-save-order 'lisp-indent-function '0)

(autoload 'buffer-utils-huge-p "buffer-utils" "\
Return t if BUFFER is huge.

BUFFER is optional, and defaults to the current buffer.

The size cutoff is defined by the variable
`buffer-utils-huge-cutoff'.

\(fn &optional BUFFER)" nil nil)

(autoload 'buffer-utils-narrowed-p "buffer-utils" "\
Return t if BUFFER is narrowed.

BUFFER is optional, and defaults to the current buffer.

\(fn &optional BUFFER)" nil nil)

(autoload 'buffer-utils-in-mode "buffer-utils" "\
Return non-nil if BUFFER is in `major-mode' MODE.

If BUFFER is nil, tests the current buffer.

If optional DERIVED is non-nil, return non-nil if the
`major-mode' of BUFFER is the same as or derived from MODE.

\(fn BUFFER MODE &optional DERIVED)" nil nil)

(autoload 'buffer-utils-all-matching "buffer-utils" "\
Return all buffers where PREDICATE applied to the buffer is non-nil.

Return value is a list of buffers, or nil if there is no match.

If optional SKIP-CURRENT is non-nil, skip the current buffer.

\(fn PREDICATE &optional SKIP-CURRENT)" nil nil)

(autoload 'buffer-utils-first-matching "buffer-utils" "\
Return the first buffer where PREDICATE applied to the buffer is non-nil.

Return value is a buffer object, or nil if there is no match.

If optional SKIP-CURRENT is non-nil, skip the current buffer.

\(fn PREDICATE &optional SKIP-CURRENT)" nil nil)

(autoload 'buffer-utils-all-in-mode "buffer-utils" "\
Return all buffers in `major-mode' MODE.

Return value is a list of buffers, or nil if there is no match.

If optional DERIVED is non-nil, return all buffers whose
`major-mode' is the same as or derived from MODE.

If optional SKIP-CURRENT is non-nil, skip the current buffer.

\(fn MODE &optional DERIVED SKIP-CURRENT)" nil nil)

(autoload 'buffer-utils-most-recent-file-associated "buffer-utils" "\
Return the most-recently visited buffer which is associated with a file.

If optional SKIP-CURRENT is non-nil, skip the current buffer.

\(fn &optional SKIP-CURRENT)" nil nil)

(autoload 'buffer-utils-set-order "buffer-utils" "\
Reorders the buffer list to match NEW-ORDER.

Elements of NEW-ORDER which are not active buffers are silently
ignored.

Current buffers which are not members of NEW-ORDER are moved to
the end of the buffer list, maintaining their current relative
order.

\(fn NEW-ORDER)" nil nil)

(autoload 'buffer-utils-bury-and-forget "buffer-utils" "\
Bury BUFFER-OR-NAME and forget about it.

BUFFER-OR-NAME is optional, and defaults to the current buffer.

\"Burying\" refers to the list of buffers returned by
`buffer-list'.  A buried buffer is moved to the end of the list.

\"Forgetting\" refers to window WIN's memory of what it has
displayed.  This only has an effect in GNU Emacs 24.1 or higher.
WIN is optional, and defaults to the selected window.

See `bury-buffer' and `unrecord-window-buffer'.

\(fn &optional BUFFER-OR-NAME WIN)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; buffer-utils-autoloads.el ends here
