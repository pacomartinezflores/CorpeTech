<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String url = "jdbc:mysql://localhost:3306/corpetech";
    String usuario = "admin_db";
    String contraseña = "contraseña_db";


    Connection conexion = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        conexion = DriverManager.getConnection(url, usuario, contraseña);
        out.println("¡Conexión establecida a la base de datos!");


    } catch (ClassNotFoundException e) {
        out.println("Error: No se pudo cargar el controlador JDBC.");
        e.printStackTrace();
    } catch (SQLException e) {
        out.println("Error de conexión: " + e.getMessage());
        e.printStackTrace();
    } finally {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
                out.println("¡Conexión cerrada correctamente!");
            }
        } catch (SQLException e) {
            out.println("Error al cerrar la conexión: " + e.getMessage());
            e.printStackTrace();
        }
    }
%>
