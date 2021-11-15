(ns logical.core
  (:refer-clojure :exclude [==])
  (:use [clojure.core.logic])
  (:use [clojure.core.logic.pldb]))

;; 3.
(db-rel mano x)
(db-rel womano x)
(db-rel systemo x)
(db-rel languageo x)
(db-rel vitalo p s)
(db-rel turingo p y)
(db-rel creatoro p c)

(def facts 
  (db
    [mano :alan-turing]
    [womano :grace-hopper]
    [mano :leslie-lamport]
    [mano :alonzo-church]
    [womano :ada-lovelace]
    [womano :barbara-liskov]
    [womano :frances-allen]
    [mano :john-mccarthy]
    [systemo :turing-machine]
    [systemo :univac]
    [languageo :latex]
    [languageo :lambda-calculus]
    [systemo :venus]
    [languageo :lisp]))

(def facts
  (-> facts
      (db-fact vitalo :alan-turing :dead)
      (db-fact vitalo :grace-hopper :dead)
      (db-fact vitalo :leslie-lamport :alive)
      (db-fact vitalo :alonzo-church :dead)
      (db-fact vitalo :ada-lovelace :dead)
      (db-fact vitalo :barbara-liskov :alive)
      (db-fact vitalo :frances-allen :alive)
      (db-fact vitalo :john-mccarthy :dead)
      (db-fact turingo :leslie-lamport :2013)
      (db-fact turingo :barbara-liskov :2008)
      (db-fact turingo :frances-allen :2006)
      (db-fact turingo :john-maccarthy :1971)
      (db-fact creatoro :alan-turing :turing-machine)
      (db-fact creatoro :grace-hopper :univac)
      (db-fact creatoro :leslie-lamport :latex)
      (db-fact creatoro :alonzo-church :lambda-calculus)
      (db-fact creatoro :barbara-liskov :venus)
      (db-fact creatoro :john-maccarthy :lisp)))

;; 1.
(defn intersection [l1 l2]
  (run* [q] (membero q l1) (membero q l2)))

;; 2.
(run* [q] (appendo q [2 3 4] [1 2 3 4]))
(run* [q] (appendo [1] [2 3 4] q))
(run* [q] (appendo [2] q [2 3 4 5]))

;; 4.
(defn scientisto [q]
  (conde 
   [(fresh [p c]
           (creatoro p c)
           (languageo c)
           (== p q))]
   [(fresh [p c]
           (creatoro p c)
           (systemo c)
           (== p q))]))

;; 5.
(defn scientist-with-turing-award [q]
  (fresh [p y] 
         (scientisto p)
         (turingo p y)
         (== q p)))

;; 6.
(db-rel persono x)
(db-rel childo c p)
(db-rel spouso s p)

(def genealogy
  (db
   [persono :bob]
   [persono :mary]
   [persono :alice]
   [persono :john]
   [persono :joyce]
   [persono :rob]))

(def genealogy
  (-> genealogy
      (db-fact spouso :bob :mary)            ;          bob --- mary
      (db-fact spouso :mary :bob)            ;               |
      (db-fact childo :alice :bob)           ;              / \
      (db-fact childo :alice :mary)          ;         alice   john --- joyce
      (db-fact childo :john :bob)            ;                       |
      (db-fact childo :john :mary)           ;                       |
      (db-fact spouso :john :joyce)          ;                      rob
      (db-fact spouso :joyce :john)          ;
      (db-fact childo :rob :john)            ;
      (db-fact childo :rob :joyce)))         ;

;; not sure why this does not work for grandparents. Any suggestions?
(defn ancestoro [d a]
  (conde 
   [(childo d a)]
   [(fresh [g]
           (childo d a)
           (childo a g)
           (ancestoro a g))]))

(defn descendanto [a d]
  (ancestoro d a))

(defn -main [x]
  (println x "Hello, World!"))