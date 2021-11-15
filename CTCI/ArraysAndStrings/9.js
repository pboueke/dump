function isRotation(s1, s2) {
    // returns true if s1 is a rotation of s2
    if (s1 === s2) return true

    let found = false
    let start = 0
    let counter = 0
    let iterator = 0
    for (let letter of s1) {
        if (letter === s2[iterator]) {
            if (!found) { 
                start = counter
            }
            found = true
            iterator += 1
        } else {
            found = false
            iterator = 0
        }
        counter += 1
    }

    if (!found) return false

    const first = s1.slice(start, s1.length)
    const second = s1.slice(0, start)

    return first + second === s2

}

console.log(isRotation("cdab", "abcd"))
console.log(isRotation("cdasb", "abcd"))
console.log(isRotation("cdab", "abdc"))
console.log(isRotation("waterbottle", "erbottlewat"))