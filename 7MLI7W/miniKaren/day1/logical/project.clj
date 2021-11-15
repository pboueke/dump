(defproject logical "0.1.0-SNAPSHOT"
  :main logical.core
  :dependencies [[org.clojure/clojure "1.10.0"]
                 [org.clojure/core.logic "0.8.11"]]
  :repl-options {:init-ns logical.core})
