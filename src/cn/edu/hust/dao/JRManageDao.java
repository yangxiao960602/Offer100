package cn.edu.hust.dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

import cn.edu.hust.domain.JobInfo;
import cn.edu.hust.utils.DataSourceUtils;

public class JRManageDao {

	public int postJob(int en_id, JobInfo jobInfo) {
		// TODO Auto-generated method stub
		/*String sql = "insert into enterprise(en_name, en_city, en_username, en_password, en_email, "
				+ "en_statu, en_code, en_registerdata, ep_lastdate) "
				+ "values(?,?,?,?,?,?,?,?,?)";*/
		
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into job_info(en_id, jobinfo_name, jobinfo_description, jobinfo_num,"
				+ " jobinfo_category, jobinfo_year, jobinfo_qualification, "
				+ "jobinfo_place, jobinfo_salary, jobinfo_time) "
				+ "values(?,?,?,?,?,?,?,?,?,?)";
		int update = 0;
		
		
		try {
			update = runner.update(sql, en_id, jobInfo.getJobinfo_name(), jobInfo.getJobinfo_description(), jobInfo.getJobinfo_num(), 
					jobInfo.getJobinfo_category(), jobInfo.getJobinfo_year(), jobInfo.getJobinfo_qualification(), 
					jobInfo.getJobinfo_place(), jobInfo.getJobinfo_salary(), jobInfo.getJobinfo_time());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return update;
	}

}
