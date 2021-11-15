// 1.
val size = List("Rio de Janeiro", "Curitiba", "Rio Branco")
            .foldLeft(0)((sum, value) => sum + value.size)

println(size)

// 2.
trait Censor {
    def filter(text: String, filters: Map[String, String]) : String = {
        filters.foldLeft(text)((s,f) => s.replaceAll(f._1,f._2))
    }
}

class Grandma extends Censor

// 3
val filters = scala.io.Source.fromFile("substitutes.txt").getLines()
              .map(_.split(" "))
              .foldLeft(Map[String,String]())((f,l) => f + (l(0) -> l(1)))


// finnaly

println(new Grandma().filter("Darn it! Sun of a gun! Shoot!", filters))