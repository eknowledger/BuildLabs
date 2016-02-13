using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;
using Assert = Microsoft.VisualStudio.TestTools.UnitTesting.Assert;

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

//    [TestFixture]
//    public class GreeterTests
//    {
//
//        [Test]
//        public void Greet_ValidName_ShouldReturnGreetingMessage()
//        {
//            Greeter g = new Greeter();
//            var response = g.Greet(new GreetingRequest("Ahmed"));
//            Assert.IsNotNull(response, "Verify response object is retured");
//            Assert.IsTrue(response.Greeting.Contains("Ahmed"), "Verify correctence of reponse object");
//        }
//    }
}
