using System;
using System.IO;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace TennisFunctionnalConsole.Test
{
    [TestClass]
    public class TennisScoreShould
    {
        [TestMethod]
        public void display_love_love_at_startup()
        {
            var input = new[] {"Exit"};
            var outputs = new[] {"love-love", "bye bye\r\n"};

            var stringWriter = new StringWriter();
            Console.SetOut(stringWriter);
            Console.SetIn(new StringReader(string.Join("\r\n", input)));

            var line = "";
            Program.Main(new string[] {});

            Assert.AreEqual(string.Join("\r\n", outputs), stringWriter.GetStringBuilder().ToString());
        }

        [TestMethod]
        public void display_fifteen_love_if_player_one_wins()
        {
            var input = new[] { "P1", "Exit" };
            var outputs = new[] { "love-love", "fifteen-love", "bye bye\r\n" };

            var stringWriter = new StringWriter();
            Console.SetOut(stringWriter);
            Console.SetIn(new StringReader(string.Join("\r\n", input)));

            var line = "";
            Program.Main(new string[] { });

            Assert.AreEqual(string.Join("\r\n", outputs), stringWriter.GetStringBuilder().ToString());
        }
    }
}

