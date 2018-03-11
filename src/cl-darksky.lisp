(in-package :cl-user)
(defpackage cl-darksky
  (:use #:cl
        #:cl-darksky.http)
  (:export #:forecast
           #:forecast-hourly))
(in-package :cl-darksky)


(defvar *api-key* nil)


(defun forecast (lat lgn)
  (let* ((url (format nil "https://api.darksky.net/forecast/~A/~A,~A"
                      *api-key*
                      lat
                      lgn))
         (response (http-get url)))
    (alexandria:assoc-value response "currently" :test #'equalp)))


(defun forecast-hourly (lat lgn)
  (let* ((url (format nil "https://api.darksky.net/forecast/~A/~A,~A"
                      *api-key*
                      lat
                      lgn))
         (response (http-get url)))
    (alexandria:assoc-value response "hourly" :test #'equalp)))
