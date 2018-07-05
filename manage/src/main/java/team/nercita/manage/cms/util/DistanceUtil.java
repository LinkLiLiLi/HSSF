/*
 * DistanceUtil.java
 * 创建者：L
 * 创建日期：2017年12月18日 下午3:28:28
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.util;

import java.text.DecimalFormat;

/**
 * 
 * @author L
 * @date： 2017年12月18日 下午3:28:28
 */
public class DistanceUtil {
	private static final double EARTH_RADIUS = 6378.137;
	
	private static double rad(double d)
    {
        return d * Math.PI / 180.0;
    }
	
	public static double GetDistance(double lat1, double lng1, double lat2, double lng2)
    {
        double radLat1 = rad(lat1);
        double radLat2 = rad(lat2);
        double a = radLat1 - radLat2;
        double b = rad(lng1) - rad(lng2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a/2),2) + 
         Math.cos(radLat1)*Math.cos(radLat2)*Math.pow(Math.sin(b/2),2)));
        s = s * EARTH_RADIUS;
        
        DecimalFormat format = new DecimalFormat("#.00");
        return Double.parseDouble(format.format(s));
    }
	
	public static void main(String[] args) {
		System.out.println(GetDistance(10.3325, 36.21, 10.33582, 37.33));
	}
}
