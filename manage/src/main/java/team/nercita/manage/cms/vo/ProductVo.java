/*
 * ProductVo.java
 * 创建者：L
 * 创建日期：2017年12月26日 下午3:25:20
 *
 * 版权所有(C) 2015-2018。英泰伟业科技(北京)有限公司。
 * 保留所有权利。
 */

package team.nercita.manage.cms.vo;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author L 
 * @date： 2017年12月26日 下午3:25:20
 */
public class ProductVo implements Serializable {

	private static final long serialVersionUID = -2358607622137951153L;

	private String productId;
	private String productName;
	private List<ValueVo> valueList;
	private int useAmount;
	private int storeAmout;

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public List<ValueVo> getValueList() {
		return valueList;
	}

	public void setValueList(List<ValueVo> valueList) {
		this.valueList = valueList;
	}

	public int getUseAmount() {
		return useAmount;
	}

	public void setUseAmount(int useAmount) {
		this.useAmount = useAmount;
	}

	public int getStoreAmout() {
		return storeAmout;
	}

	public void setStoreAmout(int storeAmout) {
		this.storeAmout = storeAmout;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}
	
}
