package zpy.util;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import zpy.model.Category;

public class DbUtils {
	public static int getMaxPage(String cid){
		String sql = "";
		if(cid==null){
			sql = "select count(*) from blog";
		}else{
			sql = "select count(*) from blog where category_id="+cid;
		}
		QueryRunner qr = DbHelper.getQueryRunner();
		int count = 0;
		try {
		     count = qr.query(sql, new ResultSetHandler<Integer>(){  
		    	  
	                public Integer handle(ResultSet rs) throws SQLException {  
	                    if(rs.next()){  
	                        return rs.getInt(1); //或者rs.getLong("count");  
	                    }  
	                    return 0;  
	                }  
	                  
	            });  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(count%10!=0){
			count = count/10+1;
		}else{
			count = count/10;
		}
		return count;
	}
	
	public static int getCategoryLevel(int categoryId){
		String sql = "select level from category where id="+categoryId;
		QueryRunner qr = DbHelper.getQueryRunner();
		int level = 0;
		try {
			Category c = qr.query(sql, new BeanHandler(Category.class));
			level  = c.getLevel();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return level;
	}
}
