using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KATEArtGallery.Startup))]
namespace KATEArtGallery
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
