; 1. Написать функцию, которая принимает целое
; число и возвращает первое четное число, не меньшее
; аргумента.
; 9 -> 10
; 2 -> 2
(defun f (x)
(cond ((= 0 (rem x 2)) x)
      (t (+ x 1))))
(f 3)




; 2. Написать функцию, которая принимает число и
; возвращает число того же знака, но с модулем на
; 1 больше модуля аргумента.


; 3. Написать функцию, которая принимает два числа
; и возвращает список из этих чисел, расположенный
; по возрастани