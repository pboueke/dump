// O(N + M)
const isPermutation = (original, possiblePermutation) => {
    // O(N + M) ~ depends on the implementation of length, we will 
    // assume it should iterate over all letters of the string
    if (original.length != possiblePermutation.length) return false

    // O(N) ~ M == N
    let orgLetterCounters = original.split("").reduce((acc, next) => {
        if (!acc[next]) acc[next] = 1
        else acc[next] += 1
        return acc
    }, {})

    // O(N)
    for (let letter of possiblePermutation) {
        if (!orgLetterCounters[letter]) return false
        orgLetterCounters[letter] -= 1
    }

    // O(N)
    return Object.values(orgLetterCounters).reduce((a,b) => a + b, 0) == 0
}

console.log(isPermutation("abcdefgh", "acbedhgf"))
console.log(isPermutation("aaaaaa", "aaaaab"))