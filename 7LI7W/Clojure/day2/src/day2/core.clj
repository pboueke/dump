(ns day2.core)

; 1.
(defmacro unless [test ifbody & [elsebody]]
  (list 'if (list 'not test) ifbody elsebody))

; 2.
(defprotocol Student
  (learn [this content]))

(defrecord Person [name]
  Student
  (learn [_ content] (println content)))

(def me (Person. "Pedro"))

(defn -main
  "lein run"
  []
  (unless true (println "True!") (println "False!"))
  (unless false (println "True!"))
  (learn me "2+2=4"))

