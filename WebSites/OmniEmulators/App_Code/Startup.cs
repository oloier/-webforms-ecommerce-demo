using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OmniEmulators.Startup))]
namespace OmniEmulators
{
    public partial class Startup {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
