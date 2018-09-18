package com.hxci.controller;


import com.hxci.pojo.StudentDetail;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration({"classpath:spring-dao.xml"})
public class test {

    //https://www.imooc.com/video/7124

    //-------------------------------------
    //高版本xlsx
    public void poicreatExcelGao(){
        //表头
        String [] title = {"id","name","sex"};

        //创建Excel 工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();
        //创建一个工作表sheet
        XSSFSheet sheet = workbook.createSheet();
        //创建第一行
        XSSFRow row =sheet.createRow(0);
        XSSFCell cell = null;
        //插入第一行数据
        for (int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
        }
        //追加数据
        for (int i=1;i<=10;i++){
            XSSFRow nextrow = sheet.createRow(i);
            XSSFCell cell2 = nextrow.createCell(0);
            cell2.setCellValue("a"+i);
            cell2 = nextrow.createCell(1);
            cell2.setCellValue("user"+i);
            cell2 = nextrow.createCell(2);
            cell2.setCellValue("男"+i);
        }
        //创建一个文件
        File file = new File("C:\\Users\\xuning\\Desktop\\poi_test.xlsx");
        try {
            file.createNewFile();
            //将内容写入Excel 存盘
            FileOutputStream stream = FileUtils.openOutputStream(file);
            workbook.write(stream);
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //-------------------------------------
    //低版本 xls

    public void poireadExcel(){
        //需要解析的Excel文件
        File file = new File("C:\\Users\\xuning\\Desktop\\poi_test.xls");
        try {
            //创建Excel,读取文件内容
            HSSFWorkbook workbook = new HSSFWorkbook(FileUtils.openInputStream(file));
            //获取第一个工作表
//            HSSFSheet sheet = workbook.getSheet("Sheet0");
            HSSFSheet sheet = workbook.getSheetAt(0);
            int firstRowNum = 0;
            //获取sheet中最后一行行号
            int lastRowNum = sheet.getLastRowNum();
            System.out.println(lastRowNum);
            for (int i=firstRowNum;i<lastRowNum+1;i++){
                HSSFRow row =sheet.getRow(i);
                //获取当前行有多少列
                int lastCellNum = row.getLastCellNum();
                for (int j =0;j<lastCellNum;j++){
                    HSSFCell cell = row.getCell(j);
                    String value = cell.getStringCellValue();
                    System.out.print(value +"  ");
                }
                System.out.println();
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void poicreatExcel(){
        //表头
        String [] title = {"id","name","sex"};

        //创建Excel 工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        //创建一个工作表sheet
        HSSFSheet sheet = workbook.createSheet();
        //创建第一行
        HSSFRow row =sheet.createRow(0);
        HSSFCell cell = null;
        //插入第一行数据
        for (int i=0;i<title.length;i++){
            cell = row.createCell(i);
            cell.setCellValue(title[i]);
        }
        //追加数据
        for (int i=1;i<=10;i++){
            HSSFRow nextrow = sheet.createRow(i);
            HSSFCell cell2 = nextrow.createCell(0);
            cell2.setCellValue("a"+i);
            cell2 = nextrow.createCell(1);
            cell2.setCellValue("user"+i);
            cell2 = nextrow.createCell(2);
            cell2.setCellValue("男"+i);
        }
        //创建一个文件
        File file = new File("C:\\Users\\xuning\\Desktop\\poi_test.xls");
        try {
            file.createNewFile();
            //将内容写入Excel 存盘
            FileOutputStream stream = FileUtils.openOutputStream(file);
            workbook.write(stream);
            stream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void jxlreadExcel(){
        try {
            //创建workbook
            Workbook workbook = Workbook.getWorkbook(new File("C:\\Users\\xuning\\Desktop\\insert1.xls"));
            //获取工作表sheet
            Sheet sheet = workbook.getSheet(0);
            //循环行
            for(int i=0;i<sheet.getRows();i++){
                //循环列
                for(int j=0;j<sheet.getColumns();j++){
                    Cell cell = sheet.getCell(j,i);
                    System.out.print(cell.getContents() + "  ");
                }
                System.out.println();
            }
            workbook.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void jxlcreatExcel(){
        //用数组存表头
        String [] title={"id","name","sex"};
        //创建EXCEL文件
        File file = new File("C:\\Users\\xuning\\Desktop\\insert1.xls");
        try {
            file.createNewFile();
            //创建工作簿
            WritableWorkbook workbook = Workbook.createWorkbook(file);
            //创建sheet
            WritableSheet sheet = workbook.createSheet("sheet1",0);

            Label label = null;
            //第一行设置列名
            for(int i=0;i<title.length;i++){
                label = new Label(i,0,title[i]);
                sheet.addCell(label);
            }
            for(int i=1;i<10;i++){
                label = new Label(0,i,"a"+1);
                sheet.addCell(label);
                label = new Label(1,i,"user"+1);
                sheet.addCell(label);
                label = new Label(2,i,"男"+1);
                sheet.addCell(label);
            }
            //写入数据
            workbook.write();
            workbook.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

        List<StudentDetail> list = new ArrayList<StudentDetail>();  //excel上传过来的
        List<StudentDetail> list1 = new ArrayList<StudentDetail>(); //查回来的
        StudentDetail studentDetail = new StudentDetail();
        StudentDetail studentDetail1 = new StudentDetail();
        StudentDetail studentDetail10 = new StudentDetail();
        StudentDetail studentDetail11 = new StudentDetail();
        StudentDetail studentDetail2 = new StudentDetail();

        studentDetail.setKsh("123");
        studentDetail.setSfzh("asdf");
        studentDetail.setXm("张三");

        studentDetail1.setKsh("123");
        studentDetail10.setKsh("10");
        studentDetail11.setKsh("11");
        studentDetail1.setSfzh("asdf");
        studentDetail10.setSfzh("asdf10");
        studentDetail11.setSfzh("asdf11");

        list.add(studentDetail);
        list1.add(studentDetail1);
        list.add(studentDetail10);
        list.add(studentDetail11);

        studentDetail2.setKsh("1234");
        studentDetail2.setSfzh("asdfe");
        studentDetail2.setXm("李四");
        list.add(studentDetail2);


        List<StudentDetail> temp = new ArrayList<StudentDetail>();



        for (int i=0;i<list1.size();i++){
            StudentDetail temp1Stu = list1.get(i);
            int j ;
            for (j=0;j<list.size();j++){
                StudentDetail tempStu = list.get(i);
                if((tempStu.getKsh() == temp1Stu.getKsh()) && (temp1Stu.getSfzh() == temp1Stu.getSfzh())){
                    temp.add(tempStu);
                    break;
                }
            }
            if((list1.size()==i) || (list.size()==j)){
                break;
            }
        }



//        List<String> newList = list.FindAll(x => !lstFromDB.Contains(x));




    }


}
