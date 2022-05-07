package Detail;

import connection.connection;

import java.sql.*;
import java.util.Vector;

public class ProductDao {

    public Product getProduct(int p_id)
    {
        connection Factory = new connection();
        Connection con = Factory.getConnection();
        Product products = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from products,brand where p_id=? and p_brandid=B_brandid";
            ps = con.prepareStatement(sql);
            ps.setString(1, ""+p_id);
            System.out.println(ps);
            rs = ps.executeQuery();
            if (rs.next()) {
                products = new Product();
                products.setId(Integer.parseInt(rs.getString("p_id")));
                products.setBrandname(rs.getString("b_name"));
                products.setName(rs.getString("p_name"));
                products.setPrice(Float.parseFloat(rs.getString("p_price")));
                products.setDescribePro(rs.getString("p_describePro"));
                products.setDescribeMake(rs.getString("p_describeMake"));
                products.setDescribeSize(rs.getString("p_describeSize"));
                products.setDescribeBrand(rs.getString("b_describe"));
                products.setTag(rs.getString("p_tag"));
                products.setBoughtNum(Integer.parseInt(rs.getString("p_boughtNum")));
                products.setActivity(rs.getString("p_activity"));
                try{
                    String sql2 = "select * from producttype where pt_productid=?";
                    ps = con.prepareStatement(sql2);
                    ps.setString(1,""+p_id);System.out.println(ps);
                    ResultSet rs2 = ps.executeQuery();
                    while(rs2.next()){
                        int pt_id=Integer.parseInt(rs2.getString("pt_typeid"));
                        String pt_color=rs2.getString("pt_color");
                        String pt_size=rs2.getString("pt_size");
                        String pt_pic=rs2.getString("pt_pic");
                        int pt_stock=Integer.parseInt(rs2.getString("pt_stock"));
                        products.addType(pt_id,pt_color,pt_size, pt_pic,pt_stock);
                    }
                }catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Factory.closeAll(con, ps, rs);
        }
        return products;
    }

    public Vector<Product> getProductList(int p_id1,int p_id2)
    {
        connection Factory = new connection();
        Connection con = Factory.getConnection();
        Vector<Product> ProList=new Vector<Product>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from products,brand where p_id>=? and p_id <=? and p_brandid=B_brandid";
            ps = con.prepareStatement(sql);
            ps.setString(1, ""+p_id1);
            ps.setString(2, ""+p_id2);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product products = new Product();
                products.setId(Integer.parseInt(rs.getString("p_id")));
                products.setBrandname(rs.getString("b_name"));
                products.setName(rs.getString("p_name"));
                products.setPrice(Float.parseFloat(rs.getString("p_price")));
                products.setDescribePro(rs.getString("p_describePro"));
                products.setDescribeMake(rs.getString("p_describeMake"));
                products.setDescribeSize(rs.getString("p_describeSize"));
                products.setDescribeBrand(rs.getString("b_describe"));
                products.setTag(rs.getString("p_tag"));
                products.setBoughtNum(Integer.parseInt(rs.getString("p_boughtNum")));
                products.setActivity(rs.getString("p_activity"));
                try{
                    String sql2 = "select * from producttype where pt_productid=?";
                    ps = con.prepareStatement(sql2);
                    ps.setString(1,rs.getString("p_id"));
                    ResultSet rs2 = ps.executeQuery();
                    while(rs2.next()){
                        int pt_id=Integer.parseInt(rs2.getString("pt_typeid"));
                        String pt_color=rs2.getString("pt_color");
                        String pt_size=rs2.getString("pt_size");
                        String pt_pic=rs2.getString("pt_pic");
                        int pt_stock=Integer.parseInt(rs2.getString("pt_stock"));
                        products.addType(pt_id,pt_color,pt_size, pt_pic,pt_stock);
                    }
                }catch (SQLException e) {
                    e.printStackTrace();
                }
                ProList.addElement(products);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Factory.closeAll(con, ps, rs);
        }
        return ProList;
    }

    public Vector<Wishlist> getWishList(int w_userid)
    {
        connection Factory = new connection();
        Connection con = Factory.getConnection();
        Vector<Wishlist> wishlist=new Vector<Wishlist>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from wishlist,producttype,products,brand where w_userid=? and "
                    + "w_productid=p_id and w_typeid=pt_typeid and p_brandid=B_brandid";
            ps = con.prepareStatement(sql);
            ps.setString(1, ""+w_userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Wishlist w = new Wishlist();
                w.setP_id(Integer.parseInt(rs.getString("p_id")));
                w.setPt_id(Integer.parseInt(rs.getString("pt_typeid")));
                w.setPic(rs.getString("pt_pic"));
                w.setBrandname(rs.getString("b_name"));
                w.setName(rs.getString("p_name"));
                w.setSize(rs.getString("pt_size"));
                w.setColor(rs.getString("pt_color"));
                w.setPrice(Float.parseFloat(rs.getString("p_price")));
                w.setStock(Integer.parseInt(rs.getString("pt_stock")));
                wishlist.addElement(w);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Factory.closeAll(con, ps, rs);
        }
        return wishlist;
    }

    public Vector<Cart> getCartList(int c_userid)
    {
        connection Factory = new connection();
        Connection con = Factory.getConnection();
        Vector<Cart> cartList=new Vector<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from cart,producttype,products,brand where c_userid=? and "
                    + "c_productid=p_id and c_typeid=pt_typeid and p_brandid=B_brandid";
            ps = con.prepareStatement(sql);
            ps.setString(1, ""+c_userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart();
                c.setP_id(Integer.parseInt(rs.getString("p_id")));
                c.setPt_id(Integer.parseInt(rs.getString("pt_typeid")));
                c.setPic(rs.getString("pt_pic"));
                c.setBrandname(rs.getString("b_name"));
                c.setName(rs.getString("p_name"));
                c.setSize(rs.getString("pt_size"));
                c.setColor(rs.getString("pt_color"));
                c.setPrice(Float.parseFloat(rs.getString("p_price")));
                c.setStock(Integer.parseInt(rs.getString("pt_stock")));
                cartList.addElement(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Factory.closeAll(con, ps, rs);
        }
        return cartList;
    }

    public static void main(String[] args) {
        ProductDao check=new ProductDao();
        Vector<Product> ProList=new Vector<Product>();
        ProList=check.getProductList(1, 9);
        String s=ProList.get(1).getTypePic(0);
        System.out.print(s);
    }
}
