package com.che.tokeninweb.controller.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.che.tokeninweb.model.Currency;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

     /**
     *  测试
     */
public class UserLyTestController {
	 /**
     * 导出
     */
          public void exportByMarketcap(){
        	  Map<String, Object> map = new HashMap<String, Object>();
              String msg = "0";
              // 声明一个工作薄
              HSSFWorkbook workbook = new HSSFWorkbook();
              // 生成一个样式
              HSSFCellStyle style = workbook.createCellStyle();
              // 生成一个字体
              HSSFFont font = workbook.createFont();
              // 把字体应用到当前的样式
              style.setFont(font);
              List<Currency> list = Currency.dao.find("select c.name,c.abbreviate,CONVERT(p.marketCap,DECIMAL(18)) as marketCap from h_currency c left join h_currency_price p on c.id=p.cid order by marketCap desc limit 200");
              List<String> sheetList = new ArrayList<>();
              
              for (int i = 0; i < list.size(); i++) {
            	  //System.out.println(i);
            	  HSSFSheet sheet = workbook.createSheet();
            	  Currency currency = list.get(i);
            	  String currencyName = currency.getStr("name");
            	  String abbreviate = currency.getStr("abbreviate");
            	  if(sheetList.contains(currencyName)){
            		  currencyName = currencyName + "#";
            	  }
            	  sheetList.add(currencyName);
            	  workbook.setSheetName(i,currencyName);
            	// 产生表格标题行
                  //第一行
                  HSSFRow row = sheet.createRow(0);
                  String[] headers = {"name", "symbol", "commits","commitDate"};
              for(short j = 0; j < headers.length; j++) {
                  HSSFCell cell = row.createCell(j);
                  cell.setCellStyle(style);
                  HSSFRichTextString text = new HSSFRichTextString(headers[j]);
                  cell.setCellValue(text);
                  }
              
              
              List<Record> list2 = Db.use("tokenin").find("select c.title,c.shortTitle,i.commits,i.commitDate from h_currency_info i left join h_currency c on c.id=i.cid where c.title=? and c.shortTitle=? order by i.commitDate desc limit 90",currencyName,abbreviate);
              if(list2.size()==0){
            	  System.out.println(abbreviate);
              }else{
              for (int j = 0; j < list2.size(); j++) {
            	  row = sheet.createRow(j+1);
            	  Record info = null;
            	  info = list2.get(j);
                   String[] intext = {info.getStr("title"), info.getStr("shortTitle"),info.getStr("commits"),info.getStr("commitDate")};
                  // 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
                  for (short m = 0; m < intext.length; m++) {
                      HSSFCell cell = row.createCell(m);
                      cell.setCellStyle(style);
                      HSSFRichTextString text = new HSSFRichTextString(intext[m]);
                      cell.setCellValue(text);
                  }
              
			}
              try {
                  FileOutputStream output = new FileOutputStream("e:\\infoExcel\\" + "currencyInfo" + ".xls");
                  workbook.write(output);
                  //输出到本地需要用close
                  output.close();
              } catch (IOException e) {
                  e.printStackTrace();
              }
			}
              }
          }
}
