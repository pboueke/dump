using System;

namespace _5.cs
{
    class Program
    {
        static void Main(string[] args)
        {
            bool result = false;
            string w1 = args[0];
            string w2 = args[1];
            Console.WriteLine("Comparing " + w1 + " " + w2 + ". Are they one char away?");

            int difference = Math.Abs(w1.Length - w2.Length);
            if (w1.Length == w2.Length) {
                if (isOneEditAway(w1, w2)) {
                    result = true;
                }
            } else if (difference == 1 && w1.Length > w2.Length) {
                if (isOneInsertionAway(w1, w2)) {
                    result = true;
                }
            } else if (difference == 1 && w1.Length < w2.Length) {
                if (isOneInsertionAway(w2, w1)) {
                    result = true;
                }
            }

            Console.WriteLine(result);
        }
        
        // w1.Length > w2.Length
        static bool isOneInsertionAway(string w1, string w2) 
        {
            bool skipped = false;
            int id1 = 0;
            int id2 = 0;
            while (id1 < w1.Length && id2 < w2.Length) {
                if (w1[id1] != w2[id2]) {
                    if (skipped) return false;
                    id1 += 1;
                } else {
                    id1 += 1;
                    id2 += 1;
                }
            }
            return true;
        }

        // w1 and w2 of equal size
        static bool isOneEditAway(string w1, string w2)
        {
            bool foundDiff = false;
            for (int i = 0; i < w1.Length; i++) {
                if (w1[i] != w2[i]) {
                    if (foundDiff) {
                        return false;
                    }
                    foundDiff = true;
                }
            }
            return true;
        }
    }
}
