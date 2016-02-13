using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace SampleApp.Core.NUnit.Tests
{
     [TestFixture]
    public class GreeterTests
    {
        [Test]
        public void Greet_ValidName_ShouldReturnGreetingMessage()
        {
            Greeter g = new Greeter();
            var response = g.Greet(new GreetingRequest("Ahmed"));
            Assert.IsNotNull(response, "Verify response object is retured");
            Assert.IsTrue(response.Greeting.Contains("Ahmed"), "Verify correctence of reponse object");
        }
    }
}
