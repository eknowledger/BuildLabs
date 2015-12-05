using System.Web.Http;
using SampleApp.Core;

namespace SampleApp.Web.Api.Controllers
{
    [RoutePrefix("api/greeting")]
    public class GreetingController : ApiController
    {
        public string Get(string name)
        {
            Greeter greeter = new Greeter();
            var response = greeter.Greet(new GreetingRequest(name));
            return response.ToString();
        }
    }
}