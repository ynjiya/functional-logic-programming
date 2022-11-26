;;Используя функционалы: apply, funcall, mapcar, maplist.

;; apply - Applies the function to the args (Its last argument must be a list, and the elements of this list become individual arguments to the function.)

;; funcall -  Applies the function to the args

;; mapcar - call function with car's of lst as an agrument
;; => result-list

;; mapcan
;; => concatenated-results

;; maplist - call function with cdr's of lst as an argument 
;; => result-list

;; mapcon
;; => concatenated-results






;; 1. Напишите функцию, которая уменьшает на 10 все числа из списка-аргумента этой функции.

(defun subtract-list-10 (lst)
  (mapcar #'(lambda (x) (- x 10)) lst))

;;2. Напишите функцию, которая умножает на заданное число-аргумент все числа из заданного списка-аргумента, когда
;; a) все элементы списка --- числа, (1 2 3) 10 -> (10 20 30)

(defun mult-randlist (lst num)
  (mapcar #'(lambda (x) (if (numberp x) (* x num) x)) lst))

;; б) элементы списка -- любые объекты. (a 1 2 sdf 3) 10 -> (a 10 20 sdf 30)

(defun mult-numlist (num lst)
  (mapcar #'(lambda (x) (* num x)) lst))

;;3. Написать функцию, которая по своему списку-аргументу lst определяет является ли он палиндромом (то есть равны ли lst и (reverse lst)).


(defun my-reverse (lst res)
  (cond ((null lst) res)
	(T (my-reverse (cdr lst) (cons (car lst) res))) ))


(defun is-palindrom (lst)
  (funcall #'(lambda (l1 l2) (equal l1 l2))  lst (my-reverse lst ())))


;;4. Написать предикат set-equal, который возвращает t, если два его множества- аргумента содержат одни и те же элементы, порядок которых не имеет значения.
;; (1 2 1 3 2) (3 2 1 2) T


(defun my-member (el set2)
  (cond ((null set2) nil)
	((equal el (car set2)) T)
	(T (my-member el (cdr set2)))))
        
(defun my-subsetp (set1 set2)
  (cond ((my-member (car set1) set2)
	 (if (not (null (cdr set1)))
	     (my-subsetp (cdr set1) set2) T)) ))


(defun set-equal-1 (set1 set2)
  (and (my-subsetp set1 set2)
       (my-subsetp set2 set1)))

(defun set-equal (set1 set2)
  (not (or (mapcan #'(lambda (x1) (if (null x1) (not  x1) nil))
		   (mapcar #'(lambda (x)
		      (my-member x set2))
		       set1))
	   (mapcan #'(lambda (x2) (if (null x2) (not x2) nil))
		   (mapcar #'(lambda (y)
		      (my-member y set1))
		       set2)))))
;;5. Написать функцию которая получает как аргумент список чисел, а возвращает список квадратов этих чисел в том же порядке.

(defun square (lst)
  (mapcar #'(lambda (x) (* x x)) lst))

;;6. Напишите функцию, select-between, которая из списка-аргумента, содержащего только числа, выбирает только те, которые расположены между двумя указанными границами- аргументами и возвращает их в виде списка (упорядоченного по возрастанию списка чисел (+ 2 балла)).

(defun is-between (x b1 b2)
  (or (and (>= x b1) (<= x b2))
      (and (<= x b1) (>= x b2))))

(defun select-between (lst b1 b2)
  (mapcan #'(lambda (x)
	      (if (is-between x b1 b2) (list x) nil))
	  lst ))

;;7. Написать функцию, вычисляющую декартово произведение двух своих списков- аргументов. ( Напомним, что А х В это множество всевозможных пар (a b), где а принадлежит А, принадлежит В.)
;; a (2 3)
;; b (4 5 6)
;; ((2 4) (2 5) (2 6)
;; (3 4) (3 5) (3 6))

(defun decart (lst1 lst2)
  (mapcar #'(lambda (x)
	      (mapcar #'(lambda (y) (cons x y))
		      lst2))
	  lst1))


;;8. Почему так реализовано reduce, в чем причина?
;; (reduce #'+0) -> 0
;; (reduce #'+ ()) -> 0
;; In the normal case, the result of reduce is the combined result of function's being applied to successive pairs of elements of sequence. If the subsequence contains exactly one element and no initial-value is given, then that element is returned and function is not called. If the subsequence is empty and an initial-value is given, then the initial-value is returned and function is not called. If the subsequence is empty and no initial-value is given, then the function is called with zero arguments, and reduce returns whatever function does. This is the only case where the function is called with other than two arguments.



;;9. Пусть list-of-list список, состоящий из списков. Написать функцию, которая вычисляет сумму длин всех элементов list-of-list, т.е. например для аргумента
;; ((1 2) (3 4)) -> 4.
;; ((1 2 3) (3 4 6 7)) -> 7.

(defun lofl-len (lofl)
  (apply #'+
	 (mapcan #'(lambda (x)
	      (if (listp x) (list (length x))))
	  lofl)))

