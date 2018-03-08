using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(IdeaPortal.Web.Startup))]
namespace IdeaPortal.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
