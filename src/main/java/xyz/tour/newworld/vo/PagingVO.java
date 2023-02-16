package xyz.tour.newworld.vo;

import java.util.List;

import lombok.Data;

@Data
public class PagingVO {
	
	private int total;
	private int currentPage;
	private int totalPages;
	private int startPage;
	private int endPage;
	private int pagingCount;
	private List<BoardReviewVO> boardReviewVO;
	
	public PagingVO(int total, int currentPage, int size, int pagingCount, List<BoardReviewVO> boardReviewVO) {
		this.total = total;
		this.currentPage = currentPage;
		this.boardReviewVO = boardReviewVO;
		this.pagingCount = pagingCount;
		
		if(total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if(total % size > 0) {
				totalPages++;
			}
			
			startPage = currentPage / pagingCount * pagingCount + 1;
			if(currentPage % pagingCount == 0) {
				startPage -= pagingCount;
			}
			
			endPage = startPage + pagingCount - 1;
			
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}
	}
	// 전체 행의 수를 리턴
	public int getTotal() {
		return this.total;
	}
	
	// select 결과가 없는가? 체킹 : true면 결과가 없다는 의미
	public boolean hasNoArticles() {
		return this.total == 0;
	}
	
	// select 결과가 있는가? 체킹 : true면 결과가 있다는 의미
	public boolean hasArticles() {
		return this.total > 0;
	}
	
	// 현재 페이지 번호 리턴
	public int getCurrentPage() {
		return this.currentPage;
	}
	
	// 전체 페이지의 개수 리턴
	public int getTotalPages() {
		return totalPages;
	}
	
	// 데이터 VO List 리턴
	public List<BoardReviewVO> boardReviewVO(){
		return this.boardReviewVO;
	}
	
	// 목록 하단의 시작 번호를 리턴
	public int getStartPage() {
		return this.startPage;
	}
	
	// 목록 하단의 종료 번호를 리턴
	public int getEndPage() {
		return this.endPage;
	}
}
