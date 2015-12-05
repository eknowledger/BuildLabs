using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SampleApp.Core.Tests
{
    [TestClass]
    public class GreeterTests
    {
        [TestMethod]
        public void Greet_ValidName_ShouldReturnGreetingMessage()
        {
            Greeter g = new Greeter();
            var response = g.Greet(new GreetingRequest("Ahmed"));
            Assert.IsNotNull(response);
            Assert.IsTrue(response.Greeting.Contains("Ahmed"));
        }
    }
}
