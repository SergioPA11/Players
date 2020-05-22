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
<link rel="stylesheet" href="https://playita-70a1b.firebaseapp.com/css/styles.css"></link>

  </head>
  <body>
   
    <div class = "container">
    <br></br>
     <h1>Buscar jugador por equipo</h1>
    <form action="/Jugadores/jugador" method="POST">
    Equipo:<input type="text" name="equipo"/>
    <button type="submit">Find</button>
    </form>
      <table class = "table">
        <thead>
        <tr>
          <th>Nombre</th>
          <th>Dorsal</th>
          <th>Equipo</th>
        </tr>
        </thead>
        <tbody>
        
        <br></br>
        <br></br>
        
     <h1>Añadir Jugador</h1>   
     <form action="/Jugadores" method="POST">
    Equipo:<input type="text" name="equipo"/>
    Dorsal:<input type="number" name="dorsal"/>
    Nombre:<input type="text" name="nombre"/>
    <button type="submit">Add</button>
    </form>
    
    <br></br>
    <br></br>
    
    <h1>Retirar Jugador</h1>   
     <form action="/Jugadores/jugador/nombre" method="POST">
    Dorsal:<input type="number" name="dorsal"/>
    Nombre:<input type="text" name="nombre"/>
    <button type="submit">Retired</button>
    </form>
    
    <br></br>
    <br></br>
    
    <h1>Modificar Jugador</h1>   
     <form action="/Jugadores/jugador/updatePlayer" method="POST">
    Nombre:<input type="text" name="nombre"/>
    <button type="submit">Update</button>
    </form>
    
    <br></br>
    
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