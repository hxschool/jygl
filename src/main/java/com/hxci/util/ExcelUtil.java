package com.hxci.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.poi.hssf.usermodel.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Iterator;
import java.util.Map;

/**
 * @author xuning
 * 从数据库导出数据
 */
public class ExcelUtil {

    public static int DEFAULT_COLOUMN_WIDTH = 17;

    /**
     * 导出Excel 97(.xls)格式 ，少量数据
     * @param headMap 属性-列名
     * @param jsonArray 数据集
     * @param colWidth 列宽 默认 至少17个字节
     * @param out 输出流
     */
    public static void exportExcel(Map<String, Object> headMap,JSONArray jsonArray,int colWidth, OutputStream out) {

        // 声明一个工作薄
        HSSFWorkbook workbook = new HSSFWorkbook();
        workbook.createInformationProperties();
        //表头样式
        HSSFCellStyle titleStyle = workbook.createCellStyle();
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont titleFont = workbook.createFont();
        titleFont.setFontHeightInPoints((short) 20);
        titleFont.setBoldweight((short) 700);
        titleStyle.setFont(titleFont);
        // 列头样式
        HSSFCellStyle headerStyle = workbook.createCellStyle();
//        headerStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
//        headerStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
//        headerStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//        headerStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
//        headerStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
//        headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HSSFFont headerFont = workbook.createFont();
        headerFont.setFontHeightInPoints((short) 12);
        headerFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        headerStyle.setFont(headerFont);
        // 单元格样式
        HSSFCellStyle cellStyle = workbook.createCellStyle();
//        cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
//        cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
//        cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
//        cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
//        cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
//        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
        HSSFFont cellFont = workbook.createFont();
        cellFont.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
        cellStyle.setFont(cellFont);
        // 生成一个(带标题)表格
        HSSFSheet sheet = workbook.createSheet();
        // 声明一个画图的顶级管理器
        @SuppressWarnings("unused")
		HSSFPatriarch patriarch = sheet.createDrawingPatriarch();
        //设置列宽
        int minBytes = colWidth<DEFAULT_COLOUMN_WIDTH?DEFAULT_COLOUMN_WIDTH:colWidth;//至少字节数
        int[] arrColWidth = new int[headMap.size()];
        // 产生表格标题行,以及设置列宽
        String[] properties = new String[headMap.size()];
        String[] headers = new String[headMap.size()];
        int ii = 0;
        for (Iterator<String> iter = headMap.keySet().iterator(); iter
                .hasNext();) {
            String fieldName = iter.next();

            properties[ii] = fieldName;
            headers[ii] = fieldName;

            int bytes = fieldName.getBytes().length;
            arrColWidth[ii] =  bytes < minBytes ? minBytes : bytes;
            sheet.setColumnWidth(ii,arrColWidth[ii]*256);
            ii++;
        }
        // 遍历集合数据，产生数据行
        int rowIndex = 0;
        for (Object obj : jsonArray) {
            if(rowIndex == 65535 || rowIndex == 0){
                if ( rowIndex != 0 ) sheet = workbook.createSheet();//如果数据超过了，则在第二页显示

                HSSFRow headerRow = sheet.createRow(0); //列头 rowIndex =0
                for(int i=0;i<headers.length;i++)
                {
                    headerRow.createCell(i).setCellValue(headers[i]);
                    headerRow.getCell(i).setCellStyle(headerStyle);

                }
                rowIndex = 1;//数据内容从 rowIndex=1开始
            }
            JSONObject jo = (JSONObject) JSONObject.toJSON(obj);
            HSSFRow dataRow = sheet.createRow(rowIndex);
            for (int i = 0; i < properties.length; i++)
            {
                HSSFCell newCell = dataRow.createCell(i);

                Object o =  jo.get(properties[i]);
                String cellValue = "";
                if(o==null) cellValue = "";
                else cellValue = o.toString();

                newCell.setCellValue(cellValue);
                newCell.setCellStyle(cellStyle);
            }
            rowIndex++;
        }
        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //Web 导出excel
    public static void downloadExcelFile(String title , Map<String,Object> headMap,JSONArray ja,HttpServletResponse response){
        try {
            ByteArrayOutputStream os = new ByteArrayOutputStream();
            ExcelUtil.exportExcel(headMap,ja,0,os);
            byte[] content = os.toByteArray();
            InputStream is = new ByteArrayInputStream(content);
            // 设置response参数，可以打开下载页面
            response.reset();

            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+ new String((title + ".xls").getBytes(), "iso-8859-1"));
            response.setContentLength(content.length);
            ServletOutputStream outputStream = response.getOutputStream();
            BufferedInputStream bis = new BufferedInputStream(is);
            BufferedOutputStream bos = new BufferedOutputStream(outputStream);
            byte[] buff = new byte[8192];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {

                bos.write(buff, 0, bytesRead);
            }
            bis.close();
            bos.close();
            outputStream.flush();
            outputStream.close();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public static void main(String[] args) throws IOException {
//        int count = 100000;
//        JSONArray ja = new JSONArray();
//        for(int i=0;i<100000;i++){
//            Student s = new Student();
//            s.setName("POI"+i);
//            s.setAge(i);
//            s.setHeight(i);
//            s.setWeight(i);
//            s.setSex(i/2==0?false:true);
//            ja.add(s);
//        }
//        Map<String,Object> headMap = new LinkedHashMap<String,Object>();
//        headMap.put("name","姓名");
//        headMap.put("age","年龄");
//        headMap.put("height","身高");
//        headMap.put("weight","体重");
//        headMap.put("sex","性别");
//
//        /*
//        OutputStream outXls = new FileOutputStream("E://a.xls");
//        System.out.println("正在导出xls....");
//        Date d = new Date();
//        ExcelUtil.exportExcel(title,headMap,ja,null,outXls);
//        System.out.println("共"+count+"条数据,执行"+(new Date().getTime()-d.getTime())+"ms");
//        outXls.close();*/
//        //
//        OutputStream outXls = new FileOutputStream("c://idea//b.xls");
//        System.out.println("正在导出xls....");
//        Date d2 = new Date();
//        ExcelUtil.exportExcel(headMap,ja,0,outXls);
//        System.out.println("共"+count+"条数据,执行"+(new Date().getTime()-d2.getTime())+"ms");
//        outXls.close();

//    }






}

