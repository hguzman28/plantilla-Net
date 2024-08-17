var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Usar un middleware para reescribir la URL
app.UsePathBase("/tipo-api");

app.MapGet("/tipo-api", () => "¡Hola Mundo desde .NET!");

app.Run();
