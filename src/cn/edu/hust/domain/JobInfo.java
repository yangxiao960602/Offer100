package cn.edu.hust.domain;

import java.util.Date;

public class JobInfo {

	private int jobinfo_id;
	private String en_name;
	private String jobinfo_name;
	private String jobinfo_description;
	private int jobinfo_num;
	private String jobinfo_category;
	private String jobinfo_year;
	private String jobinfo_qualification;
	private String jobinfo_place;
	private String jobinfo_salary;
	private Date jobinfo_time;

	public void init() {
		jobinfo_name = "";
		jobinfo_description = "";
		jobinfo_category = "";
		jobinfo_year = "";
		jobinfo_qualification = "";
		jobinfo_place = "";
		jobinfo_salary = "";
	}

	public String getEn_name() {
		return en_name;
	}

	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}

	public int getJobinfo_id() {
		return jobinfo_id;
	}

	public void setJobinfo_id(int jobinfo_id) {
		this.jobinfo_id = jobinfo_id;
	}

	public String getJobinfo_name() {
		return jobinfo_name;
	}

	public void setJobinfo_name(String jobinfo_name) {
		this.jobinfo_name = jobinfo_name;
	}

	public String getJobinfo_description() {
		return jobinfo_description;
	}

	public void setJobinfo_description(String jobinfo_description) {
		this.jobinfo_description = jobinfo_description;
	}

	public int getJobinfo_num() {
		return jobinfo_num;
	}

	public void setJobinfo_num(int jobinfo_num) {
		this.jobinfo_num = jobinfo_num;
	}

	public String getJobinfo_category() {
		return jobinfo_category;
	}

	public void setJobinfo_category(String jobinfo_category) {
		this.jobinfo_category = jobinfo_category;
	}

	public String getJobinfo_year() {
		return jobinfo_year;
	}

	public void setJobinfo_year(String jobinfo_year) {
		this.jobinfo_year = jobinfo_year;
	}

	public String getJobinfo_qualification() {
		return jobinfo_qualification;
	}

	public void setJobinfo_qualification(String jobinfo_qualification) {
		this.jobinfo_qualification = jobinfo_qualification;
	}

	public String getJobinfo_place() {
		return jobinfo_place;
	}

	public void setJobinfo_place(String jobinfo_place) {
		this.jobinfo_place = jobinfo_place;
	}

	public String getJobinfo_salary() {
		return jobinfo_salary;
	}

	public void setJobinfo_salary(String jobinfo_salary) {
		this.jobinfo_salary = jobinfo_salary;
	}

	public Date getJobinfo_time() {
		return jobinfo_time;
	}

	public void setJobinfo_time(Date jobinfo_time) {
		this.jobinfo_time = jobinfo_time;
	}

}
