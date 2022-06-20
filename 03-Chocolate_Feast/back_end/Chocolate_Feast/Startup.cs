using Chocolate_Feast.Services;
using Microsoft.OpenApi.Models;

namespace Chocolate_Feast
{
    /// <summary>
    /// configuraciones de la solución
    /// </summary>
    public class Startup
    {
        public readonly string _cors = "all";
        public IConfiguration _configuration { get; set; }        


        /// <summary>
        /// Contructor
        /// </summary>
        /// <param name="configuration"></param>
        public Startup(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        
        /// <summary>
        /// Configuración de los servicios, por defecto permite todos las peticiones en localhost
        /// </summary>
        /// <param name="services"></param>
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(name: _cors, builder =>
                {
                    //builder.WithOrigins("http://localhost", "file:///C:")
                    builder.SetIsOriginAllowed(origin => new Uri(origin).Host == "localhost")
                    .AllowAnyMethod().AllowAnyHeader();
                    
                });
            });

            services.AddControllers();

            services.AddEndpointsApiExplorer();

            // injecto el servicio
            services.AddTransient<ImpChocolateFestService>();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Chocolate_Feast", Version = "v1" });
            });
        }

        /// <summary>
        /// Configuraciones del MW
        /// </summary>
        /// <param name="app"></param>
        /// <param name="env"></param>
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
           
            app.UseCors(_cors);

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "Chocolate_Feast v1"));
            }

            //app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
