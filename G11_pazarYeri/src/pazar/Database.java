package pazar;

import com.sun.xml.internal.ws.util.StringUtils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Database {
    private static Connection conn = null;
    public static void main(String[] args) throws SQLException {
        try {
            Class.forName("org.postgresql.Driver"); // Driveri tanıtmak için
        } catch (ClassNotFoundException e) {
        }
        String user, pass;
        user = "postgres"; // pgAdmindeki kullanici adin(default olarak postgres)
        pass = "2580"; // pgAdmine girerkenki şifre
      
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/SemtPazari",user,pass);
        } catch (SQLException throwables) {
        }
        
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Arayuz.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        Arayuz arayuz = new Arayuz(conn);
        arayuz.setVisible(true);
    }
    public static ArrayList<Integer[]> getTezgahlar() throws SQLException{
        Statement s = null;
        ArrayList<Integer[]> arr = new ArrayList<>();
        s = conn.createStatement();
        String query = "SELECT * FROM tezgahlar";
        ResultSet r = null;
        r = s.executeQuery(query);
        while (r.next()){

            try {
                Integer[] newArr = new Integer[4];
                newArr[0] = r.getInt(1);
                newArr[1] = r.getInt(2);
                newArr[2] = r.getInt(3);
                newArr[3] = r.getInt(4);
                arr.add(newArr);
                
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        try {
            s.close(); // queriyi bitir
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return arr;
    }
    
    public static ArrayList<Object[]> getCalisanlar() throws SQLException{
        Statement s = null;
        ArrayList<Object[]> arr = new ArrayList<>();
        s = conn.createStatement();
        String query = "SELECT * FROM calisanlar";
        ResultSet r = null;
        r = s.executeQuery(query);

        while (r.next()){

            try {
                Object[] newArr = new Object[8];
                newArr[0] = r.getInt(1);
                newArr[1] = r.getString(2);
                newArr[2] = StringUtils.capitalize(r.getString(3)) + " " + 
                                    StringUtils.capitalize(r.getString(4));
                newArr[3] = r.getString(5);
                newArr[4] = r.getString(6);
                newArr[5] = r.getString(7);
                newArr[6] = r.getInt(8);
                newArr[7] = r.getInt(9);
                arr.add(newArr);
                
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
         }
        try {
            s.close(); // queriyi bitir
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return arr;
    }
    
    public static ArrayList<Object[]> getUrunler() throws SQLException{
        Statement s = null;
        ArrayList<Object[]> arr = new ArrayList<>();
        s = conn.createStatement();
        String query = "SELECT * FROM urunler";
        ResultSet r = null;
        r = s.executeQuery(query);

        while (r.next()){

            try {
                Object[] newArr = new Object[6];
                newArr[0] = r.getInt(1);
                newArr[1] = r.getInt(2);
                newArr[2] = r.getString(3);
                newArr[3] = r.getString(4);
                newArr[4] = r.getInt(5);
                newArr[5] = r.getInt(6);
                arr.add(newArr);
                
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
         }
        try {
            s.close(); // queriyi bitir
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return arr;
    }
    
    public static ArrayList<Object[]> getSatisKaydi() throws SQLException{
        Statement s = null;
        ArrayList<Object[]> arr = new ArrayList<>();
        s = conn.createStatement();
        String query = "SELECT * FROM satiskaydi";
        ResultSet r = null;
        r = s.executeQuery(query);

        while (r.next()){

            try {
                Object[] newArr = new Object[7];
                newArr[0] = r.getInt(2);
                newArr[1] = r.getInt(3);
                newArr[2] = r.getInt(4);
                newArr[3] = r.getFloat(5);
                newArr[4] = r.getString(6);
                newArr[5] = r.getInt(7);
                newArr[6] = r.getFloat(8);
                arr.add(newArr);
                
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        try {
            s.close(); // queriyi bitir
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return arr;
    }
}
