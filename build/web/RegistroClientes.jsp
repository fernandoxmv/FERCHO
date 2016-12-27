<%-- 
    Document   : RegistroClientes
    Created on : 11/12/2016, 7:17:27
    Author     : Fernando
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clase.ClaseCliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>C.C.B</title>
        <style>
            
    body
    {
        width: auto;
	height: auto;
	margin-top:auto;
	margin-bottom:auto;
	margin-left:auto;
	margin-right:auto;
	background-color: #CFDCDD;
        box-shadow: inset 0 0 4px 0 black;
        font-family: sans-serif;
    }
    header
    {
        width: auto;
        height:auto;
	background: #2A646B;
	margin: auto;
        box-shadow: inset 0 0 3px 1px black;
    }
    nav
    {   
	height:auto;
        text-align: center;
        margin:auto;
        background: #42868F;
        box-shadow: inset 0 0 2px 1px black;
    }

    section
    {
        background: #F3F5F5;
	width: 900px;
	height: auto;
        margin: auto;
        margin-top: 0px;
    }

    footer
    {
	position: relative;
	height: 80px;
	background:#2A646B;
	clear: both;
        color: #FFFFFF;
        box-shadow: inset 0 0 5px 1px black;
    }

    button
    {   
        border: none;
        margin-top: 12px;
        margin-bottom: 12px;
        margin-left: 1%;
        margin-right: 1%;
        background: #60CEF2;
        cursor: pointer;
        color: #FFFFFF;
        padding: 5px;
        font-size: 18px;
        border-radius: 8px;
        box-sizing: border-box;
        transition: all 100ms ease;
        border-bottom:outset ;   
    }
    button:active
    {
        transform : perspective(500px) translateZ(-75px);
    }
    button:hover 
    {
        background: #FFFFFF;
        color: black;
        box-shadow: inset 0 0 0 3px #60CEF2;
    }
    
    #tr ,#th
            {
               background: #42868F;
               color: #fff;
               border: 1px solid black;
            }
            #td
            {
                background: #fff;
                color: #000;
                border: 1px black;
            }

    </style>    
        
        
    </head>
    
    <%!
        ArrayList<ClaseCliente> clientes;
        String mensaje= "";
    %>

    <%
        clientes = (ArrayList<ClaseCliente>) session.getAttribute("CLIENTES");
        if(clientes == null) 
        {
            clientes= new ArrayList<ClaseCliente>();
            session.setAttribute("CLIENTES", clientes);
        }

        mensaje= (String) session.getAttribute("MENSAJE");
        if (mensaje==null) 
        {
            mensaje= "";
            session.setAttribute("MENSAJE", mensaje);
        }
    %>
    
    
    <body>
        <header>
            <table>
            <tr>
            <td rowspan="4"><img src="https://k60.kn3.net/0/6/D/C/A/5/465.png" style=" height: 100px; margin-right: 20px; margin-left: 15px; margin-top: 3px "></td>
            </tr>
            <tr>
            <td style="font-size:40px; color: #60CEF2;float: left; text-shadow: black 0.1em 0.1em 0.2em">C.C.B</td>
            </tr>
            <tr>
            <td style=" font-size:20px; color: #FFFFFF;">Cursos de Computación Basico</td>
            </tr>
            <tr><td>&nbsp</td></tr>
            </table>
        </header>
        
        <nav>
            <a href="index.html"><button>Inicio</button></a>
            <button>Registro de Profesores</button>
            <button>Registro de Cursos</button>
            <button>Galería</button>
            <button>Contacto</button>
            <button>¿Quiénes somos?</button>
        </nav>
        
        <section>
        <fieldset> 
            <legend align= "center"style="color: darkred"><h2>Registrar Alumno</h2></legend>
            <form action="ServletClientes" method="post">  
                <table style="margin: auto; width: 600px; margin-left: 50px">
                <tr>
                    <td><label>Cedula: </label></td>
                    <td><input name="CEDULA" type="text" maxlength="10" size="30" required ></td>
                </tr>
                
                <tr>
                    <td><label>Nombre:</label></td>
                    <td><input name="NOMBRE" type="text"size="30" required ></td>
                </tr>
                
                <tr>
                    <td><label>Genero: </label></td>
                    <td><select name="GENERO">
                    <option>Masculino</option>
                    <option>Femenino</option></td>
                                
                </tr>
                
                <tr>
                    <td><label>Edad: </label></td>
                    <td><input name="EDAD" type="number" min="15" max="99" maxlength="2"size="30" required ></td>
                </tr>
                
                <tr>
                    <td><label>Correo: </label></td>
                    <td><input name="CORREO" type="email" size="30"required ></td>
                </tr>
                
                
                <tr>
                    <td><label>Ocupación: </label></td>
                    <td><input name="OCUPACION" type="text"size="30" required></td>
                </tr>

                <tr>
                    <td><label>Fecha de Ingreso: </label></td>
                    <td><input name="FECHA" type="date"size="30" required></td>
                </tr>
                
                <tr>
                    <td><label>Tiempo de suscripción: </label></td>
                    <td><input name="TIEMPO" type="text" size="30"required></td>
                </tr>
                
                <tr>
                    <td><label>Ciudad: </label></td>
                    <td><input name="CIUDAD" type="text"size="30" required></td>
                </tr>
                <tr>
                    <td><input type="submit" value="GUARDAR" style="background-color: darkgoldenrod; color: #FFFFFF;size: 30px" ></td>
                    <td style="color: red"><%=mensaje%></td>
                </tr>
                </table>    
            </form>
            
        </fieldset>
        
        <fieldset> 
            <legend align= "center" style="color: darkred"> <h2>Lista de Alumnos</h2></legend>
            <table style="margin: auto; width: 850px; border-spacing: 1px; background: #FFFFFF ;font-size: 13px">
            <tr id="tr">
                <th id="th">Cedula</th>
                <th id="th">Nombre</th>
                <th id="th">Genero</th>
                <th id="th">Edad</th>
                <th id="th">Correo</th>
                <th id="th">Ocupación</th>
                <th id="th">Fecha Ingreso</th>
                <th id="th">Suscripción</th>
                <th id="th">Ciudad</th>
            </tr>
           
                <%
                for (ClaseCliente c : clientes) 
                {
                %>
                    <tr>
                    <td><%= c.getCedula()%></td>    
                    <td><%= c.getNombre()%></td>
                    <td><%= c.getGenero()%></td>
                    <td><%= c.getEdad()%></td>
                    <td><%= c.getCorreo()%></td>
                    <td><%= c.getOcupacion()%></td>
                    <td><%= c.getFechaingreso()%></td>
                    <td><%= c.getTiempo()%></td>
                    <td><%= c.getCiudad()%></td>
                    </tr>
                <%
                }
                %>
        </table> 
        </fieldset>
        </section>
        
        
        
        <footer>
            <br><br>
            <p style="margin-top:auto; font-size:20px; margin-bottom:auto; text-align: center">C.C.B - 2016</p>
        </footer>    
    </body>
</html>
