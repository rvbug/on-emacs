
;; on emacs use key C-x C-e to evaluate the expression!

;;self evaluating examples
42      ;;number
"hello" ;;string
[(1 2 (+ 1 2))] ;;returns a list

;;the following are not self evaluating
buffer-file-name ;;returns the full path of this file
(+ 300 100) ; 400

;;get the types
(type-of t) ;; symbol
(type-of [(1 2 (+ 1 2))]) ;; vector
(type-of (list 1 2 3)) ;; cons ???

;;equality & it's types
(eq 1 1) ;t
(eq 3.1 3.1) ;nil
(eq "things" "things") ;nil because it is not referencing same obj
(eq 1 1.) ;t

(eql 3.1 3.1) ;t - referencing same obj for numbers
(equal "things" "things") ;t
(equal 1.1 1.1) ;t

;;equality for strings
(char-equal ?A ?A) ;t
(char-equal ?A 65) ;t
(char-equal ?A ?a) ;t - due to case-fold-search
case-fold-search ;t
(setq case-fold-search nil) ;now ?A != ?a
(setq case-fold-search t) ;now ?A == ?a

(truncate 3.6) ;3
(ceiling 3.5) ;4
(floor 3.5) ;3

;;predicates
(integerp 1) ;t
(floatp 1.0) ;t
(numberp 1.1) ;t
(numberp 2) ;t
(zerop 1) ;nil
(zerop 0) ;t

;;comparison operators & strings
(= 1 1)
(>= 2 3)
(= 1 1 1
   1
   1
   1 1 1) ;t
(string= "HELLO" "hello") ;nil
(string< "HELLO" "hello") ;t

;;min & max
(max 1 3 5)
(min 1 -1 0)

;;chars & unicode including keyboard bindings
?A ;65
?a ;97
?\n ;10
?\N{U+E0} ;224
?\M-x ; 134217848
(kbd "M-x") ;array=[134217848]

;;length on list, strings, arrays/vectors
(length '(1 2 3 4 5)) ;5
(length "hello") ;5
(length nil) ;0
(length [1 2 3 4 5 6 7 8]) ;8

;;get specific elements from list, strings, arrays
(elt '(1 2 3 4) 1) ;2
(elt [1 2 3 4 5] 3) ;4
(elt "hello" 1) ;?e
(elt '(1 2 3 4) 2) ;3
(elt '(1 2 3 4) -4) ;always returns 1

;; data types
;;strings
(make-string 5 ?!) ; o/p = !!!!!
(make-string 3 ?a) ;aaa
(string ?H ?e ?l ?l ?o) ;hello
(stringp "hello") ;t
(string-or-null-p "test") ;t either case
(char-or-string-p ?A) ;t
(char-or-string-p 65) ;t

;;string manipulation
(substring "hello" 0 4) ;hell
(substring "hello" 1) ; ello
;addint t will trim the whitepace - it's optional
(split-string "hello;world;splits;" ";" t) ;splits with ;

;; array can be both sequence and array
(arrayp "Array") ;t
(sequencep "Sequence") ;t
(listp "list") ;nil

;formatting
(format "%d %s" 100 "system") ; 100 system
(format "lists -> %s" '(1 2 3))
(message "this is %d" 5)

;lists & cons
(cons 1 2) ; (1 . 2) known as cons
'(1 . 2)  ; same as above
(car '(1 . 2)) ;1 left value
(cdr '(1 . 2)) ;2 right value
(setq some-cons '(1 . 2))
some-cons ; shows the value
(cdr some-cons) ; 2
(car some-cons) ;1
;;change the values
(setcar some-cons 3)
(setcdr some-cons 4)
some-cons ; (3 . 4)

;;building list from cons cells
(cons 1 '(2 3 4)) ; (1 2 3 4)
(cons 1 (cons 2 (cons 3 nil))) ; (1 2 3)
(cons '(1 2 3) '(4)) ; ((1 2 3 (4))
(append '(1 2 3) '(4)); (1 2 3 4)
(append '(1 2 3) 4); (1 2 3 . 4)
(append '(4) '(1 2 3)); (4 1 2 3)
(append '(1 2 3) '(4 5 6))

;alists
(setq some-list '((one . 1)
		  (two . 2)
		  (three . 3)))

(alist-get 'one some-list) ; 1
(alist-get 'two some-list) ; 2
(alist-get 'three some-list) ; 3

;;association queue
(assq 'one some-list); (one . 1)
;;check the key for the value
(rassq 1 some-list); (one . 1)
;;set the value of the key
(setf (alist-get 'one some-list) 5)
(alist-get 'one some-list) ;;5

;;plist is another way of keyvalue
;; but for flat list instead of cons
;;below you assign the pairs and
;;then check for keys
(plist-get '(one 1 two 2) 'one); 1
(plist-get '(one 1 th 3) 'th);3
;;adding the value
(plist-put '(one 1 two 2) 'three 3)

;;sequence
(sequencep "Sequences") ;t
(sequencep ()) ;t list
(sequencep []) ;t array
(sequencep [1 2 4 ]) ;t
(sequencep nil) ;t list can be nil

;;predicates
(listp '(1 2 3));t
(listp 1) ;nil
(cons 1 nil);to check
(append '(1) nil); (1)
(listp (cons 1 2)) ;t
(type-of(cons 1 2)); cons
(listp (cons 1 (cons 2 nil)));t


;;array
(setq arr [1 2 3 4 5])
arr ; prints it
(aset arr 0 5);sets 0th elm to 5
arr
(setq str "hello")
str ;hello
(aset str 0 ?m)
str ;mello
;;fillall arr with 6
(fillarray arr 6)

;;expression
;;except for nul and () all are t
(if t 'tr 'fl) ;tr
(if 5 'tt 'ff) ;tt
(if "emacs" 'tru 'fal);tru
(if nil 'tt 'ff);ff
(if '() 'tt 'ff);ff

;;logic operators
(not t);nil
; return last val if all expr is t
(and t t t 'istrue); istrue
(and t t t '(1 2 3)); (1 2 3)
(and t t '(1 2 3) t); t
(and nil 'some)
;;or if it see the 1st as t it returns
(or 1 2 3); 1
(or 'something 2); something
(or (- 5 10) (+ 2 0)); -5

;;if expr - it will return true expre value
;; else return the last stament of else one
(if nil 5
  (message "going to else stmt")
  ); goes to message
;;returns the last statement
;;check if 5 is nil
(setq what (if nil 5
  (message "goes here")
  (+ 2 2)));4
;;assigned to what
what ;4

;;progn to run multiple stmt
;;shld return runing this and 10
(if t
    (progn
      (message "running this")10)
  (message "else stmnt")
  (5))

;;when & else
;;when we just care about t or f
;;when - if expression is true then evaluate
;;er comes next - this can be series of expression
;but will return the last expression
(when (> 2 2) 'foo);nil
(unless (> 2 2) 'unless);unless
(unless (>= 2 2) 'unles);nil

(when (>= 2 2)
  (message "when - not true")
  (- 2 3)
  (+ 3 9) ; return 12

(unless (> 2 2)
    (message "unless")
    (+ 3 3));6

;cond - different case
(setq a 1)
(setq a 2)
(setq a -1)
a
(cond ((eql a 1) "equal 1")
      ((> a 1) "greater 1")
      (t  "else")) ;else

;;loops - 4 types

;;while
;;shows in *Message* buffer
(setq cnt 0)
(while (< cnt 5)
  (message "cnt %d" cnt)
  (setq cnt (1+ cnt)))

;;dotimes
(dotimes (count 5)
  (message "using dotimes %d" count))

;dolist - loops thru list
(dolist (item '(1 2 3 4 5))
	      (message "item %d" item))
;;recurssion to be done later

;;functions

(defun func (x y)
  (* (+ 2 2)
     (/ 10 2))
  ;(message "hello funcs")
  )

(func 10 3); 20
(setq test (func 10 3))
test

;;function parameters
(defun func-opt (x &optional y z)
  (* x
     (or y 1) ; if y is nil return 1
     (or z 5)))
(func-opt 5) ;5
(func-opt 5 2);50
(func-opt 5 10 2);100
(func-opt 5 nil 10); 50
(func-opt 5 10 20 30); error

(setq y 5)
(or y 10); if y is nill it is 10 or else 5

;;rest - one arg containing remianing params
;;e.g (+ 2 2) - gives 4 but I can gve any num of args
;;e.g. (+ 2 3 4 5 6 7) etc - this uses rest

;; to check if we have list and empty list
(setq all-items '(1 2 3 4 5 6 7 8))
(setq all-items '())
all-items
(dolist (it all-items)
  (when it
    (message "all items are %d" it)))

(defun multiply-many(x &rest ops)
  (dolist (op ops)
    (message "list contains -> %d" op)
    (when op
      (setq x (* x op))))
  x); return x

(multiply-many 1)
(multiply-many 2 2); check *Message* buffer
(multiply-many 1 2 3 4 5); 120

;;optional and rest
(defun both (x &optional y &rest ops)
  (setq x (* x (or y 1)))
  (dolist (op ops)
    (when op
      (setq x (* x op))))
  x)

(both 1 2 3 4 5); 120

;;documenting functions
;; use describe-function then
;;cntr h f -> to the above
;;install helpful then search using helpful-function
;;dont indent your doc
(defun fordocs(x y)
  "Multiplies the arguments X Y."
  (* (+ x 20)
     (- y 10)))

;;functions without name - lambda
;;this is function as a value
;;it is an object
(lambda (x y)
  (+ 100 x y))

;;now 1st param is always a function (+ 2 3)
;;so you can do something like this
(
 (lambda (x y)
  (+ 100 x y))
  10 20
 ); 130

;;invoking a function
;normal way
(+ 2 2)
;;another way
(funcall '+ 2 2)

;;' means do not evaluate it - only lookup the value or func defn
;; if we dont mention it will look for a variable

;;need to study more on this
(defun give-function (fun x)
  (message "function : %s & Result is %d"
	   fun
	   (funcall fun x)))
(setq fun-in-variable (lambda (arg) (+ arg 1)))
(defun named-ver (arg)
  (+ arg 1))

(give-function fun-in-variable 5)
(give-function 'named-ver 6) ;always give this '
(give-function named-ver 6); error

;; when you want to send list of values to pass to a func
(apply '+ '(2 2));4
(funcall '+ 2 2) ;4

;;interactive functions are commands in emacs
;;this will show up when you use M-x and can be use in keybindings
;;check the documention - it is different
(defun my-first-interactive-func ()
    (interactive)
    (message "this is interactive"))

;;interactive takes some args
(defun do-maths (x y)
  (* (+ x 10)
     (* y 20)))
(global-set-key (kbd "C-C z") 'do-maths)
;;now if I run the above line it will not work
;;lets make it interactive
(defun do-maths (x y)
  (interactive)
  (* (+ x 10)
     (* y 20)))
(global-set-key (kbd "C-C z") 'do-maths)

					;now when I run above ot will not know what to do with the args

(defun do-maths (x y) 
  (interactive "N\nN")
  (* (+ x 10)
     (* y 20)))
(global-set-key (kbd "C-C z") 'do-maths)

;;this will promt to get the values but will not show o/p
(defun do-maths (x y) 
  (interactive "NPlease enter x:\nNPlease enter y value:")
  (* (+ x 10)
     (* y 20)))
(global-set-key (kbd "C-C z") 'do-maths)


;;now this will return the value
;;you can use M-x as well
(defun do-maths (x y) 
"Multiply two numbers X & Y and returns values"
  (interactive "NPlease enter x:\nNPlease enter y:")
  (message "the result is %d"
  (* (+ x 10)
     (* y 20))))
(global-set-key (kbd "C-C z") 'do-maths)
;;another example
(defun run-a-command(command)
  (interactive "CChoose a command: ")
  (message "Run %s !" command))

;;lesson 4 variables & scopes
;variable is a symbol that has value
(setq tab-width 4)
;;or - to check the symbol c-h o
;; using set will have to add '
(set 'tab-width 6)
;;so instead of setting manually use this
(setq mouse '(1 ((shift) .1))
	mouse2 nil
	mouse3 't
	scroll 1)
 
; using defvar - if it is not set by setq then defvar takes yes
;;or else it will be no
;;if you want to force use eval-defun

(setq docs "no")
(defvar docs "yes"
  "this is for documentation")
docs

;;buffer local variables - To have different values for different
;;buffers - e.g. tab-width for different buffer with C++ or Python etc
(setq-local tab-width 4)  ; this is set to 4 for this buffer basics.el
;;e.g. set a value width 2 and then also setq-local width 4
;;this will set it to 4 in local and now if I do (setq width 6)
;;this will still set the value to 6 on local only

;;to make any var local for all future buffers
(setq not-local t)
(make-variable-buffer-local 'not-local)
;;to make this buffer local default - globally
(setq-default not-local t)

;;global var used if it is not defined in buffer scope
;;let is used temp for local variable without changing the global val
;(let ((x 0)))
(let ((y 5)
	  (z 10))
  (* y z))



;;why do we need let*

(let ((y 5)
	  (z (+ y 5)))
  (* y z)) ; you cannot find y here
;;because the above expression evalues to the following
(let ((y 5))
  (let (z (+y 5))) ; this let does not know what is y
  (* y z))

;so use let* like below-

(let* ((y 5)
	   (z (+ y 5)))
  (* y z))

;;dynamic scope by default in lisp
(setq x 5)
(defun checkx (y)
  (+ x y))
(checkx 10) ;15
(let ((x 15))
  (checkx 10)); 25 picks new x value
;;now we run again checkx it goes back to 15
(checkx 10); 15

;;customization variables - user can set it w/o writing code
;;but by UI - they are code of emacs
(defcustom my-custom-var 28) 

;;buffers - lesson 5
;;each buffers have their own variables
(current-buffer)

;;these 2 below are low level api buffers
(get-buffer "init.el"); returns #<buffer init.el> & does nothing
;;creates if it does not exists; check the buffer list
(get-buffer-create "hello emacs")
;;change the current buffer with set-buffer
(progn
  (set-buffer (get-buffer "hello emacs"))
  (current-buffer))
;; send the name of the buffer directly - gives the same results
(progn
  (set-buffer "hello emacs")
  (current-buffer))

;; the above set buffer creates a problem - if I set the buffer
;;and my code runs and it will get afftected because the buffer
;;changed - for this we need to use save-current-buffer
;; below after it runs, it will go back the original buffer
;;which calls it 
(progn
  (save-current-buffer
    (set-buffer "hello emacs")
    (message "Current buffer is %s" (current-buffer)))
  ;;above wrote to hello emacs buffer - check in *Message*
  ;;then sets it back to the current buffer via below
  (current-buffer)
  (message "now the current buffer is %s" (current-buffer)))

;;shorter version which sets the current buffer is
(progn
  (with-current-buffer "hello emacs"
    (message "the current buffer is %s" (current-buffer))
    (current-buffer))

;;file buffers
(buffer-file-name);;gives the full path of this buffer file

;;get-file-buffer 
;;if the buffer with this file name is not open, it will show nil
(get-file-buffer "basics.el")

;;function which will visit a file without displaying it, mainly for
;;opening a file into a buffer is :-
(find-file-noselect "hello emacs")
;;lets say the this buffer is open and modified, if you try to call
;;it will prompt before opening - to avoid that use t but
;;it will not load the content of the updated file
(find-file-noselect "hello emacs" t)

;;point - where the location of teh cursor is in the buffer
;;returns a int starts at 1
;;it is different for same buffer on different window
(point)
(point-min) ; 1
(point-max);12831

;;moving the point
(goto-char 1) ; move to the top
(goto-char (point-max))
;;following can also be used
(forward-char 1)
(backward-char 1)
(beginning-of-buffer)
(end-of-buffer)
(forward-word  5)
(backward-word 5)
(forward-line)

;;perserving the point
;;go to char and then come back to the original loc
(save-excursion
  (goto-char (point-max))
  (point))

;;buffer text
(chat-after) ;gives the current point
(char-after (point))

;;get text between 2 points
(buffer-substring 1 5); returns vectors as it starts with "#"
;;returns the font prop, color size etc
;;to avoid those use extra info
(buffer-substring-no-properties 1 20)
  
;;the thing - grabs the text if it matching particular "thing"
;; from word, sentencem line, sexp, list, url, email, filename
(thing-at-point 'sentence)
;;if you do not next extra o/p info use t
(thing-at-point 'sentence t)
(thing-at-point 'sexp t);; gives back this  entire line

					;search for text
(search-forward "text");puts the cursor after this word

;;this is a text - let us see if search-forward finds it

(search-backward "buffer")
(search-backward "text" nil t 3); picked 3rd occurrance
;;no-error - does not signal if not found
;;count find the "nth" results

;;if we use -- in func then it is internal fun
;;(defun example--func-not-callable-by-user...

;;insert text to the point - can be given str, objects etc
(insert " 0_0") ;;prints this -> 0_0
(insert-char ?\- 20) ;--------------------
(insert "\n" "this is an example")
;this is an example

;;delete text
(point);14345
(delete-region 14345 (point-max)); this will delete till here

(with-current-buffer "hello emacs"
  (delete-region (point) (point-max)));;wow deletes the data from hello emacs buffer

;save buffer
(save-buffer "hello emacs")



;;files and directories
default-directory ;; similar to pwd

(file-name-directory (buffer-file-name)) ; dirname
(file-name-nondirectory (buffer-file-name)) ;;filename
(file-name-extension (buffer-file-name)) ;; el
(file-name-sans-extension (buffer-file-name)) ;; get the file name without extension
(file-name-base (buffer-file-name)) ;;basics
(file-name-as-directory (buffer-file-name)); "/Users/rakesh.venkat/Documents/rakesh/emacs/basics.el/"
(file-name-as-directory
 (file-name-sans-extension (buffer-file-name))) ;; removes the .el

;;predicate is t or nil
;;if a file name is a absolute path
(file-name-absolute-p (buffer-file-name)) ;
(file-name-absolute-p "basics.el") ;nil
(file-relative-name (buffer-file-name) "~/Document") ;gves the relative path from where this Document is mentioned 
(file-relative-name (buffer-file-name) "~/.dotfiles")

(expand-file-name "basics.el") ;;gives the full path

;;check if the files and dir exists
(file-exists-p "basics.el") ; t
;; create directory
(make-directory "~/Document/emacs") ; creates the dir
(make-directory "~/Document/emacs" t); this will throw no error
;;below throws error if one of the dir does not exists
;;if I add t at the end - it will create all the dirs
(make-directory "~/Documents/emacs/em/acs")

;;copy file
(copy-file "~/emacs/init.el" "/tmp") ;to tmp file
(copy-file "~/emacs/init.el" "/tmp/") ;to tmp filefolder
(copy-directory "/emacs/em" "/tmp/")



;;hooks
;; hook is a variable that stores a list of functions
;; to be involved when something happens e.g. when mode is active
;;define a variable that is  set to nil or an empty list

(defvar basic-mode-hook nil
  "the hook for basic mode")
;;to exec this hook
(run-hooks 'basic-mode-hook)

;;now add a func to hook with add-hook
(add-hook 'basic-mode-hook (lambda () (message "hook invoked")))
;;now run this
(run-hooks 'basic-mode-hook)
;;run C-h e - to see the message 
