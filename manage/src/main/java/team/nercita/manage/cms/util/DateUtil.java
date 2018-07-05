/*
 * DateUtil.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午9:08:15
 * 创业小团队-后台
 */
package team.nercita.manage.cms.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.joda.time.DateTime;

import com.alibaba.druid.sql.visitor.functions.Right;

import net.sf.cglib.core.Local;

/**
 *
 * @author L
 * @date 2017年7月16日 下午9:08:15
 */
public class DateUtil {
	/**
	 * 获取两个日期 间隔天数
	 * @param beginDate
	 * @param endDate
	 * @return
	 */
	public static int calculateDate(Date beginDate, Date endDate){
		Long begin = beginDate.getTime();
		Long end = endDate.getTime();
		
		return (int) ((end - begin)/1000/60/60/24);
	}
	
	public static String getWeekFirst(){
		SimpleDateFormat sdfall = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar= Calendar.getInstance(Locale.CHINA);
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		
		return sdfall.format(calendar.getTime());
	}
	
	public static String getWeekEnd(){
		return DateTime.parse(getWeekFirst()).plusDays(7).toString("yyyy-MM-dd");
	}
	public static String getToday(){
		SimpleDateFormat sdfall = new SimpleDateFormat("yyyy-MM-dd");
		return sdfall.format(Calendar.getInstance().getTime());
	}
	
	/**
	 * 获取周时间（月日/月日）
	 * @param num
	 * @return
	 */
	public static String getWeekInfo(int num){
		SimpleDateFormat sdfall = new SimpleDateFormat("yyyy-MM-dd");

		Calendar calendar= Calendar.getInstance(Locale.CHINA);
		calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		
		DateTime monday = DateTime.parse(sdfall.format(calendar.getTime()));//周一时间
		DateTime sunday = monday.plusDays(6);//周日
		
		sunday = sunday.minusDays(num * 7);
		monday = monday.minusDays(num * 7);
		
		return monday.toString("yyyy-MM-dd") + "/" + sunday.toString("MM-dd");
	}
	
	public static Date getMondayOfThisWeek() {
		Calendar c = Calendar.getInstance();
		c.setTime(DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate());
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0)
			day_of_week = 7;
		c.add(Calendar.DATE, -day_of_week + 1);
		return c.getTime();
	}

	/**
	 * 得到本周周日
	 * 
	 * @return yyyy-MM-dd
	 */
	public static Date getSundayOfThisWeek() {
		Calendar c = Calendar.getInstance();
		c.setTime(DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate());
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0)
			day_of_week = 7;
		c.add(Calendar.DATE, -day_of_week + 7);
		return c.getTime();
	}
	
	public static void main(String[] args) {
		System.out.println(getMondayOfThisWeek());
		System.out.println(getSundayOfThisWeek());
	}
}
