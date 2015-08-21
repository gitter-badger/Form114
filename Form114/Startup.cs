using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Form114.Startup))]
namespace Form114
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
