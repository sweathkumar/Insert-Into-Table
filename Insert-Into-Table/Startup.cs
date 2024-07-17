using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Insert_Into_Table.Startup))]
namespace Insert_Into_Table
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
