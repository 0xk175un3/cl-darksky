#|
  This file is a part of cl-darksky project.
  Copyright (c) 2018 Artemiy Stepanov
|#

#|
  Author: Artemiy Stepanov
|#

(defsystem "cl-darksky"
  :version "0.1.0"
  :author "Artemiy Stepanov"
  :license "BSD 2-clause"
  :depends-on ("jonathan"
               "dexador")
  :components ((:module "src"
                :components
                ((:file "cl-darksky" :depends-on ("http" "util"))
                 (:file "http")
                 (:file "util"))))
  :description "Get weather via Dark Sky"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "cl-darksky-test"))))
