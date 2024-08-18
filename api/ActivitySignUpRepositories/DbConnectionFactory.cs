using Dapper.AmbientContext;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Hosting;
using System.Runtime.CompilerServices;

namespace ActivitySignUp.Repositories
{
    /// <summary>
    /// this class constructs the db connections
    /// </summary>
    public class DbConnectionFactory : IDbConnectionFactory
    {

        private IConfiguration _configuration;


        /// <summary>
        /// basic ctor
        /// </summary>
        /// <param name="configuration">the application configuration</param>
        public DbConnectionFactory(
            IConfiguration configuration
            )
        {
            _configuration = configuration;
        }

        /// <summary>
        /// creates the connection
        /// </summary>
        /// <returns>IDbConnection</returns>
        public IDbConnection Create()
        {
            var connstring = string.Empty;
            switch (_configuration["ASPNETCORE_ENVIRONMENT"])
            {
                case "Production":
                    {
                        connstring = _configuration.GetConnectionString("ActivitySignUpDatabase_Production");
                        break;
                    }
                case "arm64-latest":
                    {
                        connstring = _configuration.GetConnectionString("ActivitySignUpDatabase_arm64-latest");
                        break;
                    }
                case "local":
                    {
                        connstring = _configuration.GetConnectionString("ActivitySignUpDatabase_local");
                        break;
                    }
                default:
                    {
                        connstring = _configuration.GetConnectionString("ActivitySignUpDatabase");
                        break;
                    }
            }
            if (string.IsNullOrEmpty(connstring))
            {
                throw new System.Exception("no connection string.");
            }
            return new SqlConnection(connstring);
        }
    }
}
