using System;

namespace TennisFunctionnalConsole
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var initial = new Score("love-love");
            Console.WriteLine(initial.Display);
          
            CalcScore(Curry(Console.ReadLine())(initial));
        }

        private static Func<Score, InputData> Curry(string readLine)
        {
            return (s) => new InputData(readLine, s);
        }

        private static void CalcScore(InputData data)
        {           
            if (data.ReadLine != "Exit")
            {
                var score = data.Score.P1Win();
                Console.WriteLine(score.Display);
                CalcScore(new InputData(Console.ReadLine(), score));
            }
            else
            {
                Console.WriteLine("bye bye");
            }
        }

    }

    public class InputData
    {
        public string ReadLine { get; set; }
        public Score Score { get; set; }

        public InputData(string readLine, Score score)
        {
            ReadLine = readLine;
            Score = score;
        }
    }

    public class Score
    {
        public Score(string display)
        {
            Display = display;
        }

        public string Display { get; private set; }

        public Score P1Win()
        {
            return new Score("fifteen-love");
        }
    }
}
