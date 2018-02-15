(in-package :cl-user)
(defpackage cl-darksky.http
  (:use #:cl)
  (:export #:http-get))
(in-package :cl-darksky.http)

(defun http-get (url)
  (handler-bind ((dex:http-request-failed (dex:retry-request 10)))
    (jonathan:parse (dex:get url) :as :alist)))
