// 1. Io is Strongly typed

(1 + 1) println
// (1 + "one") println

// 2

0 or false // 0 is true
"" or false // "" is true
nil or false // nil is false

// 3

Animal := Object clone
Dog := Animal clone
luca := Dog clone

luca proto slotNames // list slots of the prototype

// 4

luca a ::= 1 // creates slot, setter and assigns value
luca b := 1 // creates slot and assigns value
luca b = 2 // only reassigns an already existing slot

// 5

Dog bark := method("Ruff" println)
Dog bark