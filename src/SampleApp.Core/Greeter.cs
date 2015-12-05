using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SampleApp.Core
{
    public class Greeter
    {
        public GreetingReponse Greet(GreetingRequest request)
        {
            if(request == null)
                throw new ArgumentNullException("request");
            var reponse = new GreetingReponse(string.Format("Hello Mr.{0}", request.Name));
            return reponse;

        }
    }

    public class GreetingRequest
    {
        public GreetingRequest(string name)
        {
            Name = name;
        }
        public string Name;
    }
    public class GreetingReponse
    {
        public GreetingReponse(string greetingMessage)
        {
            GreetingTime = DateTime.Now;
            Greeting = greetingMessage;
        }
        public string Greeting;
        public DateTime GreetingTime;

        public override string ToString()
        {
            return string.Format("Greeter response message: {0} on {1}", Greeting, GreetingTime);
        }
    }
}
