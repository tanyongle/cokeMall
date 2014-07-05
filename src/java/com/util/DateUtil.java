package com.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateUtil {


	public static void main(String[] args) throws Throwable{
		DateUtil util = new DateUtil();
		String nowdate = "2013-08-10";
		//util.getLastWeekLastDay();
		getLastWeekFirstDay();
	}
	
	/**
	 * 
	 * @param date
	 * @return	传入时间，返回当前是星期几（1，2，3，4，5，6，7）
	 * @throws Throwable
	 */
	public  static  int  whitchDayForWeek(String date) throws  Throwable {  
		DateFormat format = new  SimpleDateFormat("yyyy-MM-dd" ); 
		Calendar c = Calendar.getInstance();  
		System.err.println(date);
		c.setTime(format.parse(date));  
		int  dayForWeek = 0 ;  
		if (c.get(Calendar.DAY_OF_WEEK) == 1 ){  
			dayForWeek = 7 ;  
		}else {  
			dayForWeek = c.get(Calendar.DAY_OF_WEEK)-1;  
		}  
		return  dayForWeek; 

	}

	/**
	 * 
	 * @param mydate
	 * @param num
	 * @return 返回本周开始的日期
	 * @throws Throwable 
	 */
	public static String getSpecifiedDayBefore(String mydate) throws Throwable{
		int week = whitchDayForWeek(mydate);
		if(week==7){
			return mydate;
		}else{
			long long_now_date = new Date().getTime();
			String nowdate = new SimpleDateFormat("yyyy-MM-dd").format(long_now_date);
			Calendar c = Calendar.getInstance();
			Date date=null;
			try {
				date = new SimpleDateFormat("yyyy-MM-dd").parse(mydate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			c.setTime(date);
			int day=c.get(Calendar.DATE);
			c.set(Calendar.DATE,day-week);
			String dayBefore=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
			return dayBefore;
		}
	}

	/**
	 * @author Mr.Tan
	 * @time 2013-8-10
	 * @return 返回上一周的最后一天的日期
	 * @throws Throwable 
	 */
	public static String getLastWeekLastDay() throws Throwable{
		String currentDate = getCurrentDate();
		String string_lastWeekLastDay = getDayBefore(getSpecifiedDayBefore(currentDate));
		System.out.println("上周最后一天:"+string_lastWeekLastDay);
		return string_lastWeekLastDay;
	}

	/**
	 * @author Mr.Tan
	 * @time 2013-8-10
	 * @return 返回上一周的第一天的日期
	 * @throws Throwable 
	 */
	public static String  getLastWeekFirstDay() throws Throwable{
		String lastDateOfLastweek = getLastWeekLastDay();
		String firstDateOfLastWeek = getSpecifiedDayBefore(lastDateOfLastweek);
		System.out.println("上周第一天:"+firstDateOfLastWeek);
		return firstDateOfLastWeek;


	}
	/**
	 * @author Mr.Tan
	 * @time  2013-8-10
	 * @param mydate
	 * @return 返回前一天的日期
	 */
	public static String getDayBefore(String mydate){
		long long_now_date = new Date().getTime();
		String nowdate = new SimpleDateFormat("yyyy-MM-dd").format(long_now_date);
		Calendar c = Calendar.getInstance();
		Date date=null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(mydate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		c.setTime(date);
		int day=c.get(Calendar.DATE);
		c.set(Calendar.DATE,day-1);

		String dayBefore=new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
		return dayBefore;
	}

/**
 * 
 * @param firstOrLast(true:获取本月第一天的日期,false:获取本月最后一天的日期)
 * @return 
 */
	public static String getThisMonth(boolean firstOrLast){
		Calendar calendar = new  GregorianCalendar();
		SimpleDateFormat simpleFormate  =   new  SimpleDateFormat( "yyyy-MM-dd" );
		if(firstOrLast){
			calendar.set(Calendar.DATE, 1);
			String firstDateInThisMonth = simpleFormate.format(calendar.getTime());
			return firstDateInThisMonth;
		}else{
			calendar.set( Calendar.DATE,1);
			calendar.roll(Calendar.DATE,-1);
			String lastDateInThisMonth = simpleFormate.format(calendar.getTime());
			return lastDateInThisMonth;
		}
	}
	/**
	 * @author Mr.Tan
	 * @time 2013-8-10
	 * @return 返回上个月第一天字符串,格式为"2013-07-01"
	 */
	public static String lastMonFirstDay(){  
		Calendar cal = Calendar.getInstance();  
		int year = cal.get(Calendar.YEAR);  
		int month = cal.get(Calendar.MONTH) + 1;  
		cal.set(Calendar.DAY_OF_MONTH, 1);  
		cal.add(Calendar.DAY_OF_MONTH, -1);  
		int day = cal.get(Calendar.DAY_OF_MONTH);  
		String months = "";  
		String days = "";  
		if (month > 1) {  
			month--;  
		} else {  
			year--;  
			month = 12;  
		}  
		if (!(String.valueOf(month).length() > 1)) {  
			months = "0" + month;  
		} else {  
			months = String.valueOf(month);  
		}  
		if (!(String.valueOf(day).length() > 1)) {  
			days = "0" + day;  
		} else {  
			days = String.valueOf(day);  
		}  
		String firstDay = "" + year + "-" + months + "-01";
		//System.out.println(firstDay);
		return firstDay;  

	} 
	/**
	 * @author Mr.Tan
	 * @time 2013-8-10
	 * @return 返回上个月的最后一天的日期字符串 '2013-07-31'
	 */
	public static String lastMonLastDay(){  
		Calendar cal = Calendar.getInstance();  
		int year = cal.get(Calendar.YEAR);  
		int month = cal.get(Calendar.MONTH) + 1;  
		cal.set(Calendar.DAY_OF_MONTH, 1);  
		cal.add(Calendar.DAY_OF_MONTH, -1);  
		int day = cal.get(Calendar.DAY_OF_MONTH);  
		String months = "";  
		String days = "";  
		if (month > 1) {  
			month--;  
		} else {  
			year--;  
			month = 12;  
		}  
		if (!(String.valueOf(month).length() > 1)) {  
			months = "0" + month;  
		} else {  
			months = String.valueOf(month);  
		}  
		if (!(String.valueOf(day).length() > 1)) {  
			days = "0" + day;  
		} else {  
			days = String.valueOf(day);  
		}  
		String lastDay = "" + year + "-" + months + "-" + days;  
		//System.out.println(lastDay);
		return lastDay;  
	}

	/**
	 * @author Mr.Tan
	 * @return 返回当前日期
	 */
	public static String getCurrentDate(){
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String currenetTime = sdf.format(new Date());
		System.out.println(currenetTime);
		return currenetTime;
	}

}
