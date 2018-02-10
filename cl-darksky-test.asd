#|
  This file is a part of cl-darksky project.
  Copyright (c) 2018 Artemiy Stepanov (0xk175un3@gmail.com)
|#

(defsystem "cl-darksky-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Artemiy Stepanov"
  :license "BSD 2-clause"
  :depends-on ("cl-darksky"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cl-darksky"))))
  :description "Test system for cl-darksky"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
