(ns day3.core)

(def accounts (ref [0 0 0 0 0 0 0 0 0 0]))

(defn balance [id]
  (nth @accounts id))

(defn credit [id amount]
  (dosync
   (alter accounts assoc id (+ (balance id) amount))))

(defn debit [id amount]
  (credit id (- amount)))

(defn -main
  "lein run"
  []
  (credit 5 100)
  (debit 5 50)
  (println (str (balance 5))))
