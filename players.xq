(: 
 : Inicio
 :)
 module namespace page = 'http://basex.org/modules/web-page';
 
 declare
   %rest:POST
   %rest:path("/Jugadores/jugador")
   %rest:form-param("equipo","{$equipo}","(no equipo)")
   %output:method("html")
   %output:doctype-system("about:legacy-compact")
   function page:Jugadores($equipo as xs:string)
   as element(html)

{
<html>
  <head>
    <title>Jugadores de Futbol</title>
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
  <h1>Búsqueda: </h1>
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
  for $b in doc("jugadores")//jugador
      where $b/equipo/text()=$equipo
  order by $b/dorsal
  return <tr>
  <td>{
      $b/nombre/text()
    }</td> 
 <td>{
      $b/dorsal/text()
    }</td>
  <td>{
      $b/equipo/text()
    }</td>
  </tr>

}
        
        </tbody>
      </table>
    </div>
  
  </body>
  
</html>
};