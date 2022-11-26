;;1. Написать функцию, которая по своему списку-аргументу lst определяет является ли он палиндромом (то есть равны ли lst и (reverse lst)).

;; (1 2 3 2 1) (8) (4 5 4) (6 7 7 6)

(defun is-pali-ins (tmp lst)
  (cond ((null lst) nil)
	((or (equal tmp lst) (equal tmp (cdr lst))) T)
	(T (is-pali-ins (cons (car lst) tmp) (cdr lst) )) ))


(defun is-pali (lst) (is-pali-ins () lst))

(defun is-pali-2 (lst)
  (if (equal (reverse lst) lst) T))


;;2. Написать предикат set-equal, который возвращает t, если два его множества-аргумента содержат одни и те же элементы, порядок которых не имеет значения.

(defun my-member (el set2)
  (cond ((null set2) nil)
	((equal el (car set2)) T)
	(T (my-member el (cdr set2)))))
        
(defun my-subsetp (set1 set2)
  (cond ((my-member (car set1) set2)
	 (if (not (null (cdr set1)))
	     (my-subsetp (cdr set1) set2) T)) ))

(defun set-equal (set1 set2)
  (and (my-subsetp set1 set2)
       (my-subsetp set2 set1)))

(defun set-equal-2 (lst1 lst2)
  (and (subsetp lst2 lst1)
       (subsetp lst1 lst2)))

;;3. Напишите свои необходимые функции, которые обрабатывают таблицу из 4-х точечных пар:(страна . столица), и возвращают по стране - столицу, а по столице — страну .
((japan . tokyo)
 (russia . moscow)
 (italy . rome)
 (france . paris))

(defun get-country (table capital)
  (cond ((null table) Nil)
	((eq capital (cdar table)) (caar table))
	(T (get-country (cdr table) capital))
	))

(defun get-capital (table country)
  (cond ((null table) Nil)
	((eq country (caar table)) (cdar table))
	(T (get-capital (cdr table) country))
	))

;;4. Напишите функцию swap-first-last, которая переставляет в списке-аргументе первый и последний элементы.
;;(1 2 3 4) (4 2 3 1) (list (car (reverse lst) (cdr lst)))
(defun f-no-l1 (lst)
  (reverse (cdr (reverse lst))))

(defun swap-first-last2 (lst)
  (append (last lst) (cdr (f-no-l1 lst)) (cons (car lst) Nil)))

;; (1 2 3 4) -> (4 2 3 1)


(defun swap-first-lasto (lst)
  (let ((tail (cdr lst)))
    (cons (change-end (car lst) tail nil) tail)
    ))


;; --------------------------------------------------


;; -> oldend
(defun change-end (newend lst oldend)
  (cond ((null (car lst)) (setf (car lst) newend))
	((null (cdr lst))
	 (setf oldend (car lst))
	 (setf (car lst) newend)
	 oldend)
	(T (change-end newend (cdr lst) oldend)) ))


(defun swap-first-last (lst)
  (cond ((or (null lst) (null (cdr lst))) lst)
  (T (setf (car lst) (change-end (car lst) (cdr lst) nil))
  lst)))




;; --------------------------------------------------

;;5. Напишите функцию swap-two-ellement, которая переставляет в списке- аргументе два указанных своими порядковыми номерами элемента в этом списке.
;; (1 2 3 4 5) 1 3 -> (1 4 3 2 5)


(defun swap-two-ellement1 (lst n1 n2)
  (let ((el1 (nth n1 lst))
	 (el2 (nth n2 lst))) 
   (setf (nth n1 lst) el2
	 (nth n2 lst) el1)
    lst))


(defun mynthcdr (n lst)
  (cond ((null lst) Nil)
	((eq 0 n) lst)
	(T (setf n (- n 1))
	   (mynthcdr n (cdr lst))) ))

(defun mynth (n lst)
  (cond ((null lst) Nil)
	((eq 0 n) (car lst))
	(T  (mynth (- n 1) (cdr lst))))
 )


(defun swap-two-ellement2 (lst n1 n2)
  (let ((el1 (car (mynthcdr n1 lst)))
	(el2 (car (mynthcdr n2 lst)))) 
   (setf (car (mynthcdr n1 lst)) el2
	 (car (mynthcdr n2 lst)) el1)
    lst))


(defun swap-two-ellement3 (lst n1 n2)
  (let ((el1 (mynth n1 lst))
	(el2 (mynth n2 lst))) 
   (setf (mynth n1 lst) el2
	 (mynth n2 lst) el1)
    lst))


;;6. Напишите две функции, swap-to-left и swap-to-right, которые производят одну круговую перестановку в списке-аргументе влево и вправо, соответственно.

(defun f-no-l1 (lst)
  (reverse (cdr (reverse lst))))

;; (1 2 3 4 5) -> (2 3 4 5 1)
(defun swap-to-left (lst)
  (append (cdr lst) (cons (car lst) Nil)))
;; (1 2 3 4 5) -> (5 1 2 3 4)
(defun swap-to-right (lst)
  (cons (car (last lst)) (f-no-l1 lst)))

;;7. Напишите функцию, которая добавляет к множеству двухэлементных списков новый двухэлементный список, если его там нет.

;;((1 2) (3 4) (5 6))

(defun add-lst-to-set-ins (lset lst tmp)
  (cond ((null tmp) (append lset (list lst)))
	((equal (car tmp) lst) lset)
	(T (add-lst-to-set-ins lset lst (cdr tmp)))))
(defun add-lst-to-set (lset lst)
  (add-lst-to-set-ins lset lst lset))


;;8. Напишите функцию, которая умножает на заданное число-аргумент первый числовой элемент списка из заданного 3-х элементного списка-аргумента, когда
;;a) все элементы списка -- числа,
;; 10 '(1 2 3)  ->  (10 2 3)
;;6) элементы списка -- любые объекты.
;; 10 '((r 3) 4 sfsd)  ->  ((r 3) 40 sfsd)

(defun mult-a (x lst)
  (cond ((/= (length lst) 3) 'length!=3)
	(T (setf (car lst) (* x (car lst)))
	   lst) ))

(defun mult-b (x lst)
  (cond ((/= (length lst) 3) 'length!=3)
	((numberp (car lst))
	 (setf (car lst) (* x (car lst))) lst)
	((numberp (cadr lst))
	 (setf (cadr lst) (* x (cadr lst))) lst)
	((numberp (caddr lst))
	 (setf (caddr lst) (* x (caddr lst))) lst) ))



(defun mult-b2 (x lst plst)
  (cond ((null lst) plst)
	((numberp (car lst))
	 (setf (car lst) (* x (car lst))) plst)
	(T (mult-b2 x (cdr lst) plst) )))

;;9. Напишите функцию, select-between, которая из списка-аргумента из 5 чисел выбирает только те, которые расположены между двумя указанными границами-аргументами и возвращает их в виде списка (упорядоченного по возрастанию списка чисел (+ 2 балла)).

;; (3 2 1 5 4) 4 0 -> (3 2 1)

;; (1 2 3 5) 4 -> (1 2 3 4 5)


(defun add-to-end (x lst p)
  (cond ((null (car lst)) (setf (car lst) x) p)
	((null (cdr lst)) (setf (cdr lst) (cons x Nil)) p)
	(T (add-to-end x (cdr lst) p)) ))

(defun mergelst (lst1 lst2 p1)
  (cond ((null (cdr lst1)) (setf (cdr lst1) lst2) p1)
	(T (mergelst (cdr lst1) lst2 p1)) ))

;; head (cons nil nil)
(defun add-to-sorted (x head tail)
  (cond ((and (null tail) (null head)) (add-to-end x tail tail))
	((null tail) (add-to-end x head head))
	((> x (car tail))
	 (add-to-sorted x
			    (add-to-end (car tail) head head)
			    (cdr tail) ))
	(T (mergelst head (cons x tail) head)
	   head)))


(defun is-between (x b1 b2)
  (or (and (> x b1) (< x b2))
      (and (< x b1) (> x b2))))

;; res (cons nil nil)
(defun select-between (lst b1 b2 res)
  (cond ((null lst) res)
	((is-between (car lst) b1 b2)
	 (add-to-end (car lst) res res)
	 (select-between (cdr lst) b1 b2 res))
	(T (select-between (cdr lst) b1 b2 res))))

