(ns day1.core)

(defn big [str n]
     (if (= (count str) 0)
       (< n 0)
       (big (rest str) (- n 1))))

(defn collection-type [col]
  (cond
    (list? col) :list
    (vector? col) :vector
    (map? col) :map))

(defn -main
  "lein run 'string'"
  [x]
  (println (str "1. " (big x 6)))
  (println (collection-type {:key "value"})))
