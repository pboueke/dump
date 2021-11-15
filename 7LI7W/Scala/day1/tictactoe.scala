class Board() {

    private val players = List("X", "O")
    private var state = List(List("_","_","_"),
                             List("_","_","_"),
                             List("_","_","_"))

    def this(board: List[List[String]]){
        this()
        state = board
        if (!this.validateBoard()) {
            println("Invalid Board") // todo: throw
        }
    }

    def display() {
        println("")
        state.foreach { row =>
            row.foreach { cell =>
                print(cell)
                print(" ")
            }
            println("")
        }
        println("")
    }

    def validateBoard() : Boolean = {
        var result = true
        val rows = state.length
        state.foreach { row => 
            if (row.length != rows || !row.forall(players.contains(_))) {
                result = false
            }
        }
        result
    }

    def makeMove(player: String, x: Int, y: Int) : Boolean = {
        var result = false
        if (players.contains(player)) {
            if (x < state.length && y < state.length) {
                var newState : List[List[String]] = List()
                for (i <- 0 until state.length) {
                    if (i == y) {
                        newState = newState :+ state(y).updated(x,player)
                    } else {
                        newState = newState :+ state(i)
                    }
                }
                println(newState)
                this.state = newState
                result = true
            } else {
                println("Position out of bounds")
            }
        } else {
            println ("Invalid player Id")
        }
        result
    }

    def checkWinner() : String = {
        var winner : String = "_"
        players.foreach { player =>
            
            state.foreach { row =>
                if (row.forall(_ == player)) {
                    winner = player
                }
            }

            for (j <- 0 until state(0).length) {
                var col : List[String] = List()
                for (i <- 0 until state.length) {
                    col = col :+ state(i)(j)
                }
                if (col.forall(_ == player)) {
                    winner = player
                }
            }

            var diag1 : List[String] = List()
            var diag2 : List[String] = List()
            for (i <- 0 until state.length) {
                val j = state.length - 1 - i
                diag1 = diag1 :+ state(i)(i)
                diag2 = diag2 :+ state(i)(j)
            }
            if (diag1.forall(_ == player) || diag2.forall(_ == player)) {
                winner = player
            }

        }
        winner
    }


}

var b = new Board()

var player : String = ""
var isX = true
while(b.checkWinner() == "_") {
    b.display
    player = if (isX) "X" else "O"
    println(s"$player's turn")
    print("Please provide row number: ")
    var x = Console.readInt
    print("Please provide col number: ")
    var y = Console.readInt
    while (!b.makeMove(player,x,y)) {
        print("Please provide row number: ")
        x = Console.readInt
        print("Please provide col number: ")
        y = Console.readInt
    }
    isX = !isX
}

print(s"Player $player won!")