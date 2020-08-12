package org.tesseract.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.ServletActionContext;
import org.tesseract.entities.CategoryBean;
import org.tesseract.entities.StockBean;
import org.tesseract.persistance.DashBoardHibernateDao;

import com.opensymphony.xwork2.ActionSupport;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class DashBoardAction extends ActionSupport{
	private static final long serialVersionUID = 1L;

	/* INSTANTIATIONS */
	private DashBoardHibernateDao dashBoardHibernateDao = new DashBoardHibernateDao();
	
	/* DECLARATIONS */
	private Collection<Object> overallSalesList,
							   currentDaySalesList,
							   rateList,
							   categoryWiseSalesDetails;
	
	private List<StockBean> stockList;
	private FileInputStream fileInputStream;
	private String destinationPath;
	private String fileName;
	private final String documentContentType = "application/vnd.ms-excel";
	
	private CategoryBean category;
	
	private SimpleDateFormat dateFormat;
	
	
	/*
	 * TODO:
	 * 1. get total sales till date - amount & count
	 * 2. current date's total sales - amount & count
	 * 3. current date gold, platinum, silver rate
	 * */
	public String getAllSalesData() {
		overallSalesList = new ArrayList<Object>();
		overallSalesList = dashBoardHibernateDao.getSalesDetails("TOTAL");
		return SUCCESS;
	}
	
	public String getTodaysSalesData() {
		currentDaySalesList = new ArrayList<Object>();
		currentDaySalesList = dashBoardHibernateDao.getSalesDetails("TODAY");
		return SUCCESS;
	}
	
	public String getStockDetails() {
		stockList = new ArrayList<StockBean>();
		stockList = dashBoardHibernateDao.getCurrentStockDetails();
		return SUCCESS;
	}
	
	public String generateStockReport() throws Exception {
		ServletContext servletContext = ServletActionContext.getServletContext();
		dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		FileOutputStream fileOutputStream;
		String fileLocation = "/reports";
		
		File destination = new File(servletContext.getRealPath(fileLocation));
		
		if (!destination.exists()) {
			destination.mkdirs();
		}
		
		String today = dateFormat.format(new Date()).toString();
		fileName = "Stock-Report-" + today + ".xls";
		destinationPath = destination.getAbsolutePath() + "/" + fileName;
		Workbook workBook = new HSSFWorkbook();
		Sheet sheet = workBook.createSheet("Stock Report "+ today);
		
		List<StockBean> stocks = dashBoardHibernateDao.getCurrentStockDetails();

		Row headerRow = sheet.createRow(0);
		Cell headerCell0 = headerRow.createCell(0);
		headerCell0.setCellValue("#");
		Cell headerCell1 = headerRow.createCell(1);
		headerCell1.setCellValue("Item");
		Cell headerCell2 = headerRow.createCell(2);
		headerCell2.setCellValue("Stock");
		
		for(int i = 0; i < stocks.size(); i++) {
			StockBean stock = stocks.get(i);
			Row row = sheet.createRow(i+1);
			Cell cell0 = row.createCell(0);
			cell0.setCellValue(i+1);
			Cell cell1 = row.createCell(1);
			cell1.setCellValue(stock.getProductId().getProductName());
			Cell cell2 = row.createCell(2);
			cell2.setCellValue(stock.getQuantity());
		}
		
		fileOutputStream = new FileOutputStream(destinationPath);
		workBook.write(fileOutputStream);
		fileOutputStream.close();
		fileInputStream = new FileInputStream(new File(destinationPath));
		
		return SUCCESS;
		
	}
	
	public String getRateDetails() {
		rateList = new ArrayList<Object>();
		rateList = dashBoardHibernateDao.getDailyRateList();
		return SUCCESS;
	}
	
	public String getCategoryWiseSaleAmount() {
		categoryWiseSalesDetails = new ArrayList<Object>();
		categoryWiseSalesDetails = dashBoardHibernateDao.getCategoryWiseSalesCountAndAmount(category.getCategoryCode(), 
									 (new SimpleDateFormat("dd-MM-yyyy").format(new Date())).toString().split("-")[1]);
		return SUCCESS;
	}
	
}
