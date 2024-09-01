using Dapper.AmbientContext;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Hosting;
using System.Runtime.CompilerServices;
using Microsoft.Extensions.Logging;

namespace ActivitySignUp.Repositories
{
    /// <summary>
    /// this class constructs the db connections
    /// </summary>
    public class DbConnectionFactory : IDbConnectionFactory
    {

        private IConfiguration _configuration;
        private readonly ILogger<DbConnectionFactory> _logger;


        /// <summary>
        /// basic ctor
        /// </summary>
        /// <param name="configuration">the application configuration</param>
        public DbConnectionFactory(
            IConfiguration configuration,
            ILogger<DbConnectionFactory> logger
            )
        {
            _configuration = configuration;
            _logger = logger;
        }

        /// <summary>
        /// creates the connection
        /// </summary>
        /// <returns>IDbConnection</returns>
        public IDbConnection Create()
        {
            var connstring = string.Empty;
            var envName = _configuration["ASPNETCORE_ENVIRONMENT"];
            switch (envName)
            {
                case "Production":
                    {
                        connstring = _configuration.GetConnectionString("ActivitySignUpDatabase_Production");
                        break;
                    }
                case "Development":
                    {
                        connstring = _configuration.GetConnectionString("ActivitySignUpDatabase_Development");
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
                string message = $"No connectionstring for env {envName}.";
                _logger.LogWarning(message);
                throw new System.Exception(message);
            }

            _logger.LogTrace("selected connectionstring: {connstring}", connstring);
            return new SqlConnection(connstring);
        }
    }
}
