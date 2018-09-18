package com.hxci.util;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/**
 * 读取 Excel 文件
 *
 * @param <T>
 */
@SuppressWarnings("all")
public class ExcelUpload<T> {

    //泛型
    private T t;

    private Class clazz;

    //总行数
    private int totalRows = 0;
    //总列数
    private int totalCells = 0;
    //错误信息接收器
    private String errorMsg;

    //获取表头数据
    private List<Map<String, Object>> headList;

    //获取数据 返回List<T>
    private List<T> list;

    //获取数据 返回List<Map<String ,Object>
    private List<Map<String, Object>> mapList;

    public List<T> getList() {
        return list;
    }

    public List<Map<String, Object>> getMapList() {
        return mapList;
    }

    public List<Map<String, Object>> getHeadList() {
        return headList;
    }

    //获取总行数
    public int getTotalRows() {
        return totalRows;
    }

    //获取总列数
    public int getTotalCells() {
        return totalCells;
    }

    //获取错误信息
    public String getErrorInfo() {
        return errorMsg;
    }

    private ExcelUpload() {


    }

    public ExcelUpload(Class<T> clazz) {
        try {
            this.t = clazz.newInstance();
            this.clazz = clazz;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    public boolean readExcel(MultipartFile file, String sheetName) {
        String fileName = file.getOriginalFilename();
        if (validateExcel(fileName)) {
            if (isExcel2003(fileName)) {
                readExcel2003(file, sheetName);
                return true;
            }
            if (isExcel2007(fileName)) {
                readExcel2007(file, sheetName);
                return true;
            }
        } else {
            try {
                throw  new Exception(errorMsg);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    /**
     * 读取低版本Excel
     *
     * @param file
     * @param sheetName
     */
    private void readExcel2003(MultipartFile file, String sheetName) {

        try {
            //创建EXCEL ，读取文件内容
            HSSFWorkbook workbook = new HSSFWorkbook(file.getInputStream());
            //获取第一个工作表
            HSSFSheet sheet = null;
            if ("".equals(sheetName) || null == sheetName) {
                sheet = workbook.getSheetAt(0);
            } else {
                sheet = workbook.getSheet(sheetName);
            }
            //第一行行号
            int firstRowNum = 0;
            //获取sheet中最后一行行号
            int lastRowNum = sheet.getLastRowNum();
            //表头行
            HSSFRow headrow = sheet.getRow(firstRowNum);
            //获取表头行最后单元格列号
            int lastCellNum = headrow.getLastCellNum();
            //装表头
            headList = new LinkedList<Map<String, Object>>();
            this.totalRows = lastRowNum;
            this.totalCells = lastCellNum;
            //获取表头数据
            Map<String, Object> headmap = new LinkedHashMap<String, Object>();
            for (int i = 0; i < lastCellNum; i++) {
                HSSFCell cell = headrow.getCell(i);

                if (getCnOrEn(cell.getStringCellValue())) {
                    headmap.put("" + (i + 1) + "", getZdType(cell.getStringCellValue()));//将中文字段转英文
                } else {
                    headmap.put("" + (i + 1) + "", cell.getStringCellValue());
                }
                headList.add(headmap);
            }

            //获取Excel数据 获取表头的最后一个长度 ，防止有空数据 影响每行记录的长度
            mapList = new ArrayList<Map<String, Object>>();
            Map<String, Object> map = null;
            Map<String, Object> headMap = null;
            for (int i = 1; i <= lastRowNum; i++) {
                headrow = sheet.getRow(i);
                map = new LinkedHashMap<String, Object>();
                for (int j = 0; j < headList.size(); j++) {
                    headMap = headList.get(j);
                    String zd = (String) headMap.get("" + (j + 1));
                    HSSFCell cell = headrow.getCell(j) != null ? headrow.getCell(j) : headrow.createCell(j);
                    if (cell != null) {
                        switch (cell.getCellType()) {
                            case HSSFCell.CELL_TYPE_NUMERIC: //数字 0
//                                map.put(zd, doubleTrans(cell.getNumericCellValue()).trim());
                                map.put(zd, doubleTrans(cell.getNumericCellValue()));
                                break;
                            case HSSFCell.CELL_TYPE_STRING: //字符串 1
                                map.put(zd, cell.getStringCellValue());
                                break;
                            case HSSFCell.CELL_TYPE_BOOLEAN: //布尔 4
                                map.put(zd, String.valueOf(cell.getBooleanCellValue()).trim());
                                break;
                            case HSSFCell.CELL_TYPE_FORMULA: //公式 2
                                map.put(zd, cell.getCellFormula());
                                break;
                            case HSSFCell.CELL_TYPE_BLANK: //空值 3
                                map.put(zd, "");
                                break;
                            case HSSFCell.CELL_TYPE_ERROR: //故障 5
                                System.out.println("故障1");
                                map.put(zd, "");
                                break;
                            default:
                                map.put(zd, "");
                                break;
                        }
                    }
                }
                mapList.add(map);
            }
            setT();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 读取高版本Excel
     *
     * @param file
     * @param sheetName
     */
    private void readExcel2007(MultipartFile file, String sheetName) {
        XSSFWorkbook workbook = null;
        try {
            workbook = new XSSFWorkbook(file.getInputStream());
            //获取第一个工作表
            Sheet sheet = null;
            if ("".equals(sheetName) || null == sheetName) {
                sheet = workbook.getSheetAt(0);
            } else {
                sheet = workbook.getSheet(sheetName);
            }
            //第一行行号
            int firstRowNum = 0;
            //获取sheet中最后一行行号
            int lastRowNum = sheet.getLastRowNum();
            //表头行
            Row headrow = sheet.getRow(firstRowNum);
            //获取表头行最后单元格列号
            int lastCellNum = headrow.getLastCellNum();
            //装表头
            headList = new LinkedList<Map<String, Object>>();
            this.totalRows = lastRowNum;
            this.totalCells = lastCellNum;
            //获取表头数据
            for (int i = 0; i < lastCellNum; i++) {
                Cell cell = headrow.getCell(i);
                Map<String, Object> headmap = new LinkedHashMap<String, Object>();
                if (getCnOrEn(cell.getStringCellValue())) {
                    headmap.put("" + (i + 1) + "", getZdType(cell.getStringCellValue()));//将中文字段转英文
                } else {
                    headmap.put("" + (i + 1) + "", cell.getStringCellValue());
                }
                headList.add(headmap);
            }

            //获取Excel数据 获取表头的最后一个长度 ，防止有空数据 影响每行记录的长度
            mapList = new ArrayList<Map<String, Object>>();
            Map<String, Object> map = null;
            Map<String, Object> headMap = null;
            for (int i = 1; i <= lastRowNum; i++) {
                headrow = sheet.getRow(i);
                map = new LinkedHashMap<String, Object>();
                for (int j = 0; j < headList.size(); j++) {
                    headMap = headList.get(j);
                    String zd = (String) headMap.get("" + (j + 1));
                    Cell cell = headrow.getCell(j) != null ? headrow.getCell(j) : headrow.createCell(j);
                    if (cell != null) {
                        switch (cell.getCellType()) {
                            case HSSFCell.CELL_TYPE_NUMERIC: //数字 0
                                map.put(zd, doubleTrans(cell.getNumericCellValue()));
                                break;
                            case HSSFCell.CELL_TYPE_STRING: //字符串 1
                                map.put(zd, cell.getStringCellValue().trim());
                                break;
                            case HSSFCell.CELL_TYPE_BOOLEAN: //布尔 4
                                map.put(zd, String.valueOf(cell.getBooleanCellValue()));
                                break;
                            case HSSFCell.CELL_TYPE_FORMULA: //公式 2
                                map.put(zd, cell.getCellFormula());
                                break;
                            case HSSFCell.CELL_TYPE_BLANK: //空值 3
                                map.put(zd, "");
                                break;
                            case HSSFCell.CELL_TYPE_ERROR: //故障 5
                                System.out.println("故障2");
                                map.put(zd, "");
                                break;
                            default:
                                map.put(zd, "");
                                break;
                        }
                    }
                }
                mapList.add(map);
            }
            setT();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void setT() throws Exception {
        list = new LinkedList<T>();
        if (t != null) {
            List<Map<String, Class>> setTypeMethod = (List<Map<String, Class>>) getJson().get("setTypeMethod");
            List<Map<String, Object>> setMethod = (List<Map<String, Object>>) getJson().get("setMethod");
            List<Map<String, Object>> getMethod = (List<Map<String, Object>>) getJson().get("getMethod");
            List<Map<String, String>> tempKey = new LinkedList<Map<String, String>>();
            List<Map<String, Class>> tempValue = new LinkedList<Map<String, Class>>();
            List<Map<String, Object>> tempDate = new LinkedList<Map<String, Object>>();
            Map<String, String> tempKeymap = null;
            Map<String, Class> tempValuemap = null;
            Map<String, Object> tempDatemap = null;
            List<String> zd = new LinkedList<String>();
            for (Map<String, Object> mapDate : mapList) { //每一条数据
                tempKeymap = new LinkedHashMap<String, String>();
                tempValuemap = new LinkedHashMap<String, Class>();
                tempDatemap = new LinkedHashMap<String, Object>();
                for (Map<String, Class> map : setTypeMethod) {

                    for (Map.Entry<String, Class> entry : map.entrySet()) {
                        String _key = entry.getKey();
                        String key = _key.substring(0, 1).toUpperCase() + _key.substring(1);
                        if (mapDate.containsKey(key)) {
                            zd.add(key);
                            tempKeymap.put(key, "set" + key);
                            tempValuemap.put(key, entry.getValue());
                            tempDatemap.put(key, mapDate.get(key));
                        }
                        break;
                    }
                }
                tempKey.add(tempKeymap);
                tempValue.add(tempValuemap);
                tempDate.add(tempDatemap);
            }

            for (int i = 0; i < tempKey.size(); i++) {//行数
                T t = (T) clazz.newInstance(); //每一行一个对象 创建一次
                for (int j = 0; j < tempKey.get(i).size(); j++) {//列数
                    if (tempValue.get(i).get(zd.get(j)).getName() == "java.lang.String") {
                        Method method = clazz.getMethod(tempKey.get(i).get(zd.get(j)), tempValue.get(i).get(zd.get(j)));
                        method.invoke(t, String.valueOf(tempDate.get(i).get(zd.get(j))));
                        continue;
                    } else if ((tempValue.get(i).get(zd.get(j)).getName() == "java.lang.Integer") && (!(tempDate.get(i).get(zd.get(j)).equals("")))) {
                        if ((tempDate.get(i).get(zd.get(j)) != null)) { //不为空数据
                            Method method = clazz.getMethod(tempKey.get(i).get(zd.get(j)), tempValue.get(i).get(zd.get(j)));
                            method.invoke(t, Integer.parseInt(String.valueOf(tempDate.get(i).get(zd.get(j)))));
                        }
                    }
                }
                list.add(t);
            }
        } else {
            try {
                throw new Exception("没有指定反射的Class类,或指定反射的Class与指定的泛型不符");
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
    }
    /**
     * 获取T里面的所有私有成员变量 以及set get 方法 和set参数的数据类型
     *
     * @return
     */
    private JSONObject getJson() {
        Field[] fields = t.getClass().getDeclaredFields();
        List<Map<String, Object>> setMethods = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> getMethods = new ArrayList<Map<String, Object>>();
        List<Map<String, Class>> setTypeMethods = new ArrayList<Map<String, Class>>();
        for (Field field : fields) {
            Map<String, Object> setMethod = new LinkedHashMap<String, Object>();//装set方法
            Map<String, Object> getMethod = new LinkedHashMap<String, Object>();//装get方法
            Map<String, Class> setTypeMethod = new LinkedHashMap<String, Class>();//装set方法 参数类型
            //得到成员变量类型的类类型
            Class fieldType = field.getType();
            String typeName = fieldType.getName();
            //得到成员变量的名称
            String fieldName = field.getName();
            String getMethodName = "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
            String setMethodName = "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
            Class<?> type = field.getType();//获取属性的返回值
            if (isJavaClass(fieldType)) {//判断是否为java本身定义类型
                setMethod.put(fieldName, setMethodName);
                getMethod.put(fieldName, getMethodName);
                setTypeMethod.put(fieldName, fieldType);
                setMethods.add(setMethod);
                getMethods.add(getMethod);
                setTypeMethods.add(setTypeMethod);
            }
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("setMethod", setMethods);
        jsonObject.put("getMethod", getMethods);
        jsonObject.put("setTypeMethod", setTypeMethods);
        return jsonObject;
    }


    /**
     * 判断是否为java本身定义的类型
     * true : java本身定义的数据类型
     * false : 为自定义类型
     *
     * @param clz
     * @return
     */
    public static boolean isJavaClass(Class<?> clz) {
        return clz != null && clz.getClassLoader() == null;
    }

    /**
     * 将中文字段转成英文
     *
     * @param name
     * @return
     */
    private static String getZdType(String name) {
        Class clazz = StudentType.class;
        try {
            return (String) clazz.getField(name).get(name);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 判断是否为中文 中文返回true 英文返回false
     *
     * @param name
     */
    private static Boolean getCnOrEn(String name) {
        String pattern = ".*[\u4e00-\u9fa5]+";
        Pattern r = Pattern.compile(pattern);
        Matcher m = r.matcher(name);
        return m.matches() ? true : false;
    }

    /**
     * 将小数转成整数，类似3.0 变成 3 ；3.1 还是3.1
     *
     * @param d
     * @return
     */
    private static String doubleTrans(double d) {
        double e = d - (int) d;
        if (e == 0) {
            return String.valueOf((int) d);
        } else {
            return String.valueOf(d);
        }
    }

    /**
     * 验证EXCEL文件
     *
     * @param fileName
     * @return
     */
    private boolean validateExcel(String fileName) {
        if (fileName == null || !(isExcel2003(fileName) || isExcel2007(fileName))) {
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;
    }

    // @描述：是否是2003的excel，返回true是2003
    private static boolean isExcel2003(String fileName) {
        return fileName.matches("^.+\\.(?i)(xls)$");
    }

    //@描述：是否是2007的excel，返回true是2007
    private static boolean isExcel2007(String fileName) {
        return fileName.matches("^.+\\.(?i)(xlsx)$");
    }



}
