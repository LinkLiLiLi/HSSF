package team.nercita.manage.cms.util;
@SuppressWarnings("unused")
public class Page {
	private int currPage = 1;
	private int totalPage;
	private int totalRows;
	private int pageRows = 20;

	private boolean hasFirstPage;
	private boolean hasPrevPage;
	private boolean hasNextPage;
	private boolean hasLastPage;
	
	public Page(int totalRows, Integer currPage) {
		this.totalRows = totalRows;
		this.currPage = (currPage == null || currPage == 0) ? 1 : currPage;
	}
	
	public static int getStartIndex(Integer currPage){
		return currPage == null || currPage <= 1 ? 0 : (currPage - 1) * Page.PageRows.pageRows.getValue();
	}
	
	public static int getMaxResult(){
		return PageRows.pageRows.getValue();
	}
	
	public static enum PageRows {
		pageRows(20);

        private int value;

        public int getValue() {
            return value;
        }

        private PageRows(int value) {
            this.value = value;
        }
    }
	
	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalPage() {
		return totalRows%pageRows == 0 ? totalRows/pageRows : totalRows/pageRows +1;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getPageRows() {
		return pageRows;
	}

	public void setPageRows(int pageRows) {
		this.pageRows = pageRows;
	}

	public boolean isHasFirstPage() {
		return currPage > 1;
	}

	public boolean isHasPrevPage() {
		return currPage > 1;
	}

	public boolean isHasNextPage() {
		return getTotalPage() != currPage && getTotalPage() !=0;
	}

	public boolean isHasLastPage() {
		return getTotalPage() != currPage && getTotalPage() !=0;
	}
	
}
