package com.spring.common;

public class paging {
	
	private StringBuilder pageHtml;
	
	public paging() {
		// TODO Auto-generated constructor stub
	}
	
	public paging(int totalcount, int currentPage, int pageSize, String queryString) {
		pageHtml = new StringBuilder();
		
		int totalPage = ((totalcount - 1) / pageSize) + 1;
		int startPage = (((currentPage - 1) / 10) * 10) + 1 ;
		int endPage = (startPage + 9) > totalPage ? totalPage : (startPage + 9);
		
		pageHtml.append("<ul class='pagination' style='justify-content: center;'>");
		
		if (currentPage == 1) {
			pageHtml.append("<li class='page-item disabled'><span class='page-link'><i class='bi bi-skip-backward-fill'></i></span></li>");
			pageHtml.append("<li class='page-item disabled'><span class='page-link'><i class='bi bi-skip-start-fill'></i></span></li>");
		} else {
			pageHtml.append("<li class='page-item'><a class='page-link' href='?currentPage=1"  + queryString + "'><i class='bi bi-skip-backward-fill'></i></a></li>");
			pageHtml.append("<li class='page-item'><a class='page-link' href='?currentPage=" + (currentPage - 1) + queryString + "'><i class='bi bi-skip-start-fill'></i></a></li>");
		}
		
		for (int i = startPage; i <= endPage; i++) {
			if (currentPage == i) {
				pageHtml.append("<li class='page-item active'><span class='page-link'>" + i + "</span></li>");
			} else {
				pageHtml.append("<li class='page-item'><a class='page-link' href='?currentPage=" + i + queryString + "'>" + i + "</a></li>");
			}
		}
		
		if (totalPage == currentPage) {
			pageHtml.append("<li class='page-item disabled'><span class='page-link'><i class='bi bi-skip-end-fill'></i></span></li>");
			pageHtml.append("<li class='page-item disabled'><span class='page-link'><i class='bi bi-skip-forward-fill'></i></span></li>");
		} else {
			pageHtml.append("<li class='page-item'><a class='page-link' href='?currentPage=" + (currentPage + 1) + queryString + "'><i class='bi bi-skip-end-fill'></i></a></li>");
			pageHtml.append("<li class='page-item'><a class='page-link' href='?currentPage=" + (totalPage) + queryString + "'><i class='bi bi-skip-forward-fill'></i></a></li>");
		}
		
		pageHtml.append("</ul>");
		// TODO Auto-generated constructor stub
	}
	
	public String getPage() {
		return pageHtml.toString();
	}
}
