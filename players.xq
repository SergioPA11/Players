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
<link rel="stylesheet" href="https://playita-70a1b.firebaseapp.com/css/styles.css"></link>

  </head>
  <body>
    <div class = "container">
    <br></br>
    <h1>Búsqueda: </h1>
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


 declare
   %rest:POST
   %rest:path("/Jugadores")
   %rest:form-param("equipo","{$equipo}","(no equipo)")
   %rest:form-param("dorsal","{$dorsal}","(no dorsal)")
   %rest:form-param("nombre","{$nombre}","(no nombre)")
   %output:method("html")
   %output:doctype-system("about:legacy-compact")
   updating function page:InsertJugadores(
     $nombre as xs:string,
     $dorsal as xs:integer,
     $equipo as xs:string
   ){
  update:output(web:redirect('/Jugadores')),
  for $add in doc("jugadores")//jugadores
  return insert node
  <jugador>
    <nombre>{$nombre}</nombre>
    <dorsal>{$dorsal}</dorsal>
    <equipo>{$equipo}</equipo>
  </jugador>
  as first into $add
};

  
declare
   %rest:POST
   %rest:path("/Jugadores/jugador/nombre")
   %rest:form-param("nombre","{$nombre}","(no nombre)")
   %rest:form-param("dorsal","{$dorsal}","(no dorsal)")
   %output:method("html")
   %output:doctype-system("about:legacy-compact")
   updating function page:DeleteJugadores(
     $nombre as xs:string,
     $dorsal as xs:integer

   ){
  update:output(web:redirect('/Jugadores')),
  for $del in doc ("jugadores")//jugador
  where $del/nombre = $nombre
  return delete node $del
};

  
declare
   %rest:POST
   %rest:path("/Jugadores/jugador/dorsal")
   %rest:form-param("nombre","{$nombre}","(no nombre)")
   %rest:form-param("dorsal","{$dorsal}","(no dorsal)")
   %rest:form-param("equipo","{$equipo}","(no equipo)")
   %output:method("html")
   %output:doctype-system("about:legacy-compact")
   updating function page:ModifyJugadores(
     $nombre as xs:string,
     $dorsal as xs:integer,
     $equipo as xs:string    
   ){
  update:output(web:redirect('/Jugadores')),
  for $mod in doc("jugadores")//jugador
  where $mod/nombre = $nombre
  return replace node $mod with
  <jugador>
    <nombre>{$nombre}</nombre>
    <dorsal>{$dorsal}</dorsal>
    <equipo>{$equipo}</equipo>
  </jugador>
};


 declare
   %rest:POST
   %rest:path("/Jugadores/jugador/updatePlayer")
   %rest:form-param("nombre","{$nombre}","(no nombre)")
   %output:method("html")
   %output:doctype-system("about:legacy-compact")
   function page:Traspaso($nombre as xs:string)
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
<link rel="stylesheet" href="https://playita-70a1b.firebaseapp.com/css/styles.css"></link>

  </head>
  <body>
    <div class = "container">
    <br></br>
    <h1>Búsqueda: </h1>
      <table class = "table">
        <thead>
        <tr>
          <th>Nombre</th>
          <th>Dorsal</th>
          <th>Equipo</th>
        </tr>
        </thead>
        <tbody>
        
       <h1>Modificar Jugador</h1>   
         <form action="/Jugadores/jugador/dorsal" method="POST">
            Equipo:<input type="text" name="equipo"/>
            Dorsal:<input type="number" name="dorsal"/>
            Nombre:<input type="text" name="nombre"/>
          <button type="submit">Add</button>
    </form>
        
{
  for $b in doc("jugadores")//jugador
      where $b/nombre/text()=$nombre
  order by $b/dorsal
  return 
  <tr>
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
