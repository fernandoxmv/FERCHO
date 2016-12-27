/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Clase.ClaseCliente;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fernando
 */
public class ServletClientes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String mensaje = "";
        Boolean repetido = false;
        try
        {
            String cedula= request.getParameter("CEDULA");
            String nombre= request.getParameter("NOMBRE");
            String genero= request.getParameter("GENERO");
            String edad= request.getParameter("EDAD");
            String correo= request.getParameter("CORREO");
            String ocupacion= request.getParameter("OCUPACION");
            String fecha= request.getParameter("FECHA");
            String tiempo= request.getParameter("TIEMPO");
            String ciudad= request.getParameter("CIUDAD");
            
           
         
            if(cedula.length()==0 && nombre.length()==0 && genero.length()==0 && edad.length()==0 && correo.length()==0 &&  ocupacion.length()==0 && fecha.length()==0 && tiempo.length()==0 &&  ciudad.length()==0)
            {
                mensaje = "Error: Complete todos los datos del formulario!";
            }
            else
            {
                ArrayList<ClaseCliente> clientes;
                clientes = (ArrayList<ClaseCliente>) request.getSession().getAttribute("CLIENTES");
                
                //Si la lista empleados esta vacía la inicializa
                if (clientes == null) 
                {
                    clientes = new ArrayList<ClaseCliente>();
                }
                else
                {
                    //Verifica si ya existe cedula
                    for(ClaseCliente temp: clientes) 
                    {
                        if (temp.getCedula().equalsIgnoreCase(cedula)) 
                        {
                            repetido = true;
                            break;
                        }
                    }
                }
                
                if(repetido==false)
                {
                    ClaseCliente objcliente = new ClaseCliente();
                    objcliente.setCedula(cedula);
                    objcliente.setNombre(nombre);
                    objcliente.setGenero(genero);
                    objcliente.setEdad(Integer.parseInt(edad));
                    objcliente.setCorreo(correo);
                    objcliente.setOcupacion(ocupacion);
                    objcliente.setFechaingreso(fecha);
                    objcliente.setTiempo(tiempo);
                    objcliente.setCiudad(ciudad);
                    
                    clientes.add(objcliente);
                    
                    request.getSession().setAttribute("CLIENTES", clientes);
                }
                else
                {
                     mensaje = "Error: Ya existe registro!";
                }    
            }
        
        }
        catch (NumberFormatException e) 
        {
            mensaje= "ERROR: "+ e.toString();
        }
        finally 
        {
            request.getSession().setAttribute("MENSAJE", mensaje);
            response.sendRedirect("RegistroClientes.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
