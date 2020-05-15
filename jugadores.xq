(: 
 : Inicio
 :)
 module namespace page = 'http://basex.org/modules/web-page';
 
 declare
   %rest:GET
   %rest:path("/Jugadores")
   %output:method("html")
   %output:doctype-system("about:legacy-compact")
   function page:Jugadores()
   as element(html)

{
<html>
  <head>
    <title>Jugadores</title>
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
</script>

  </head>
  <body>
    <form action="/Jugadores/jugador" method="POST">
    Equipo:<input type="text" name="equipo"/>
    <button type="submit">Find</button>
    </form>
    <div class = "container">
      <table class = "table">
        <thead>
        <tr>
          <th>Nombre</th>
          <th>Dorsal</th>
          <th>Equipo</th>
        </tr>
        </thead>
        <tbody>
{
  for $b in doc(
      "jugadores")//jugador
  order by $b/dorsal
  return <tr>
  <td>{$b/nombre/text()}</td> 
  <td>{$b/dorsal/text()}</td>
  <td>{$b/equipo/text()}</td>
  </tr>

}
        
        </tbody>
      </table>
    </div>
  
  </body>
  
</html>
};