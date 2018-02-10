(in-package :cl-user)
(defpackage cl-darksky
  (:use #:cl
        #:cl-darksky.http
        #:cl-darksky.util)
  (:export #:forecast
           #:forecast-hourly))
(in-package :cl-darksky)

(defun forecast (lat lgn)
  (let ((url (format nil "https://api.darksky.net/forecast/~A/~A,~A" *api-key* lat lgn)))
       (values (aget (jonathan:parse (http-get url) :as :alist) "currently"))))

(defun forecast-hourly (lat lgn)
  (let ((url (format nil "https://api.darksky.net/forecast/~A/~A,~A" *api-key* lat lgn)))
       (values (aget (jonathan:parse (http-get url) :as :alist) "hourly"))))
