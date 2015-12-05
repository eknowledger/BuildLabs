using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SampleApp.Core;

namespace SampleApp.Console
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Console.WriteLine("Greeter App");
            System.Console.WriteLine("Please Enter your Name:");
            var name = System.Console.ReadLine();

            Greeter g = new Greeter();
            var message = g.Greet(new GreetingRequest(name)).ToString();
            System.Console.WriteLine(message);

            System.Console.WriteLine("Thank you!");
            System.Console.WriteLine("Press any key to exit!");
            System.Console.ReadLine();
        }

    }
}
