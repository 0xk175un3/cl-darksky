(in-package :cl-user)
(defpackage cl-darksky.util
  (:use #:cl)
  (:export #:check-api-key
           #:*api-key*
           #:aget))
(in-package :cl-darksky.util)

(defvar *api-key* nil)

(defun aget (alist key &key (test #'string=))
  (let ((record (assoc key alist :test test)))
    (if record
        (values (cdr record) t)
        (values nil nil))))

(defun (setf aget) (val alist key &key (test #'string=))
  (let ((record (assoc key alist :test test)))
    (if record
        (rplacd record val)
        (rplacd (last alist) `((,key . ,val)))))
  val)
