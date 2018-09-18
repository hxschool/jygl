package com.hxci.util;

import org.apache.poi.ss.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExcelUpLoadUtil {




    //文件路径
    private String filePath;
    //Sheet1工作空间名
    private String sheetName;
    private Workbook workBook;
    private Sheet sheet;
    //表格头部
    private List<String> columnHeaderList;
    //所有数据
    private List<List<String>> listData;
    //所有数据
    private List<Map<String, String>> mapData;
    private boolean flag;

    public ExcelUpLoadUtil(String filePath, String sheetName) {
        this.filePath = filePath;
        this.sheetName = sheetName;
        this.flag = false;
        this.load();
        this.getSheetData();
    }

    private void load() {
        FileInputStream inStream = null;
        try {
            inStream = new FileInputStream(new File(filePath));
//            workBook = WorkbookFactory.create(inStream);
//            workBook
//            jxl.Workbook.getWorkbook();
//            Workbook.getWorkbook(xxx .getInputStream());
            if("".equals(sheetName) || sheetName == null){
                sheet = workBook.getSheetAt(0);
            }else{
                sheet = workBook.getSheet(sheetName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (inStream != null) {
                    inStream.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private String getCellValue(Cell cell) {
        String cellValue = "";
        DataFormatter formatter = new DataFormatter();
        if (cell != null) {
            switch (cell.getCellType()) {
                case Cell.CELL_TYPE_NUMERIC:
                    if (DateUtil.isCellDateFormatted(cell)) {
                        cellValue = formatter.formatCellValue(cell);
                    } else {
                        double value = cell.getNumericCellValue();
                        int intValue = (int) value;
                        cellValue = value - intValue == 0 ? String.valueOf(intValue) : String.valueOf(value);
                    }
                    break;
                case Cell.CELL_TYPE_STRING:
                    cellValue = cell.getStringCellValue();
                    break;
                case Cell.CELL_TYPE_BOOLEAN:
                    cellValue = String.valueOf(cell.getBooleanCellValue());
                    break;
                case Cell.CELL_TYPE_FORMULA:
                    cellValue = String.valueOf(cell.getCellFormula());
                    break;
                case Cell.CELL_TYPE_BLANK:
                    cellValue = "";
                    break;
                case Cell.CELL_TYPE_ERROR:
                    cellValue = "";
                    break;
                default:
                    cellValue = cell.toString().trim();
                    break;
            }
        }
        return cellValue.trim();
    }

    private void getSheetData() {
        listData = new ArrayList<List<String>>();
        mapData = new ArrayList<Map<String, String>>();
        columnHeaderList = new ArrayList<String>();
        int numOfRows = sheet.getLastRowNum() + 1;
        for (int i = 0; i < numOfRows; i++) {
            Row row = sheet.getRow(i);
            Map<String, String> map = new HashMap<String, String>();
            List<String> list = new ArrayList<String>();
            if (row != null) {
                for (int j = 0; j < row.getLastCellNum(); j++) {
                    Cell cell = row.getCell(j);
                    if (i == 0) {
                        columnHeaderList.add(getCellValue(cell));
                    } else {
                        map.put(columnHeaderList.get(j), this.getCellValue(cell));
                    }
                    list.add(this.getCellValue(cell));
                }
            }
            if (i > 0) {
                mapData.add(map);
            }
            listData.add(list);
        }
        flag = true;
    }

    public String getCellData(int row, int col) {
        if (row <= 0 || col <= 0) {
            return null;
        }
        if (!flag) {
            this.getSheetData();
        }
        if (listData.size() >= row && listData.get(row - 1).size() >= col) {
            return listData.get(row - 1).get(col - 1);
        } else {
            return null;
        }
    }

    public String getCellData(int row, String headerName) {
        if (row <= 0) {
            return null;
        }
        if (!flag) {
            this.getSheetData();
        }
        if (mapData.size() >= row && mapData.get(row - 1).containsKey(headerName)) {
            return mapData.get(row - 1).get(headerName);
        } else {
            return null;
        }
    }

    public List<List<String>> getListData() {
        return listData;
    }

    public List<Map<String, String>> getMapData() {
        return mapData;
    }

    public List<String> getColumnHeaderList() {
        return columnHeaderList;
    }



    public static void main(String[] args) {
//        String [] title = {"身份证号","性别","性别代码","考生号","姓名","学号"};
//        try {
//            Class clazz = Class.forName("com.hxci.util.StudentType");
//            for (int i =0;i<title.length;i++){
//                String str = clazz.getField(title[i]).getName();
//                System.out.println(ExcelUpLoadUtil.getZdType("姓名"));
                //上传彪
//                System.out.println(str+":"+clazz.getField(title[i]).get(title[i]));
//            }

//            System.out.println(clazz.getField(title).get(title));
//            Field[] fields = clazz.getFields();
//            for (Field f : fields) {
//                System.out.println(f.getName());
//            }
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        } catch (NoSuchFieldException e) {
//            e.printStackTrace();
//        } catch (IllegalAccessException e) {
//            e.printStackTrace();
//        }


        /**
         * ExcelUpLoadUtil eh = new ExcelUpLoadUtil(this.fileName,this.workSpace);
         int j = 0;
         for(int i =0;i<eh.getMapData().size();i++){
         dao.insertData( table,eh.getMapData().get(i));
         j=i+1;
         }
         if(j == eh.getMapData().size()){
         flag = true;
         }else{
         flag = false;
         }
         */
    }

}
