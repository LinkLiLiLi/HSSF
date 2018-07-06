# 简介

- 工作中纯靠数据库软件生成的Excel报表有可能不会满足需求,时间工作中需要的数据结构往往是很复杂的,而且在大数据的情况下需要对数据的处理更加精细化,所以单纯的sql语句已经不能满足对数据处理的要求.

# 工具

- 为了使Java可以操作Excel,Apach POI团队推出了相应的Java API,以便根据Office Open XML标准和Miscrosoft的OLE 2复合文档格式操作各种文件格式.
- 其中最常用于Excel工作簿(SS=HSSF+XSSF),Word文档(WP=HWPF+XWPF)和PPT演示文稿(SL=HSLF+XSLF).其中本文主要介绍使用Java读取和写入Excel文件<u>(.xls格式)</u>使用的HSSF.
- 最好还是使用SS组合,这样可以适应各种环境.下图为HSSF于XSSF的比较.![ss-features](D:\Git\picture\ss-features.png)

# 原理

- HSSF既然是Excel文件格式的纯Java实现,那必定要满足Java的面相对象的基础,把表作为对象使用.而且涉及到导入导出就必定和输出输入流有着密不可分的联系.

- 下面针对具体业务实现导出Excel表格.

- ~~~Java
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
  ~~~

  - 第一步是一些对象的创建,其中包括声明工作簿,声明表格样式,然后应用.


  - 第二步是根据自己的架构取出相应的数据存入list,接下来根据list.size()进行<u>循环1</u>,由于需求是多sheet结构,所以在<u>循环1</u>中首先创建sheet并取出sheet的名字

    ~~~Java
    HSSFSheet sheet = workbook.createSheet();
                	  Currency currency = list.get(i);
                	  String currencyName = currency.getStr("name");
                	  String abbreviate = currency.getStr("abbreviate");
                	  if(sheetList.contains(currencyName)){
                		  currencyName = currencyName + "#";
                	  }
                	  sheetList.add(currencyName);
                	  workbook.setSheetName(i,currencyName);
    ~~~

    注意HSSF源码中是不允许sheet重名和为空的,

    ~~~Java
    /**
         * Set the sheet name.
         *setSheetName源码
         * @param sheetIx number (0 based)
         * @throws IllegalArgumentException if the name is null or invalid
         *  or workbook already contains a sheet with this name
         * @see #createSheet(String)
         * @see org.apache.poi.ss.util.WorkbookUtil#createSafeSheetName(String nameProposal)
         */
        @Override
        public void setSheetName(int sheetIx, String name) {
            if (name == null) {
                throw new IllegalArgumentException("sheetName must not be null");
            }

            if (workbook.doesContainsSheetName(name, sheetIx)) {
                throw new IllegalArgumentException("The workbook already contains a sheet with this name");
            }
            validateSheetIndex(sheetIx);
            workbook.setSheetName(sheetIx, name);
        }
    ~~~

    我取的数据里面sheet名是有重复的,所以这里就要解决这个问题,我用的方法是创建一个sheetList,然后调用list的contains方法判断是否与之前的重复,重复的话就在第二个名字中加入表示符号,再加入sheetList中.

    - 第三步是生成表格的标题行也就是第一行,声明一个headers的数组存入标题行,声明cell,循环填入headers
    - 第四步是组装标题行下的数据行,首先使用Dao层取出数据存入list2并<u>循环2</u>声明行对象row,创建intext字符串数组存入每行的数据(这里使用的是反射的概念,根据javabean属性的先后顺序,动态调用get..()方法得到属性值),循环intext数组存入每个cell中
    - 第五步就是输出到本地,首先新建一个输出流,添上存入的本地地址,再把workbook写入这个流中进行传输,另外输出到本地不要忘记close.