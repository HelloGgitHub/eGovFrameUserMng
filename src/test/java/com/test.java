//package com;
//
//import java.text.SimpleDateFormat;
//import java.util.Calendar;
//import java.util.Date;
//
//public class test {
//
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		
//		
//		Calendar cal = Calendar.getInstance();
//		System.out.println(cal.get(Calendar.YEAR));
//		System.out.println(cal.get(Calendar.MONTH)+1);
//		System.out.println(cal.get(Calendar.DATE));
//		System.out.println(cal.get(Calendar.HOUR));
//		System.out.println(cal.get(Calendar.MINUTE));
//		System.out.println(cal.getTimeInMillis());
//		
//	}
//
//	
//	public String getTime(String param) {
//		String rtn = "";
//		SimpleDateFormat sdf = new SimpleDateFormat(param);
////		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
//        long timeInMillis =System.currentTimeMillis();
//
//        Date timeInDate = new Date(timeInMillis);
//        String timeInFormat = sdf.format(timeInDate);
//        
//        System.out.println(timeInFormat);
//        return rtn;
//	}
//}
