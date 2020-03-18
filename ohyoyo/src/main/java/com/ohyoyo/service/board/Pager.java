package com.ohyoyo.service.board;

public class Pager {
	public static final int PAGE_SCALE=10; // 페이지당 게시물수 
	public static final int BLOCK_SCALE=10; // 화면당 페이지수
	
	private int curPage;	//현재페이지
	private int prevPage;	//이전페이지
	private int nextPage;	//다음페이지
	private int totPage;	//전체 페이지갯수
	private int totBlock;	//전체 페이지블록갯수
	private int curBlock;	//현재블록
	private int prevBlock;	//이전블록
	private int nextBlock;	//다음블록
	private int pageBegin;	//#{start} 변수에 전달될 값
	private int pageEnd;	//#{end} 변수에 전달될 값
	private int blockBegin;	//블록의 시작페이지 번호
	private int blockEnd;	//블록의 끝페이지 번호
	
	// Pager(레코드 갯수, 출력할 페이지 번호)
	public Pager(int count, int curPage) {
		curBlock = 1; // 현재블록 번호
		this.curPage = curPage; // 현재페이지 번호
		setTotPage(count); // 전체페이지 갯수계산
		setPageRange();	// #{start}, #{end} 값 계산
		setTotBlock();	// 전체블록갯수계산
		setBlockRange(); // 블록의 시작, 끝 번호 계산
	}	
	
	// where rn between #{start} and #{end}에 입력될 값
	public void setPageRange() {
		// 시작번호 = (현재페이지-1 )x페이지당 게시물수 +1
		// 끝번호 = 시작번호 + 페이지당 게시물수 -1
		pageBegin = (curPage-1) * PAGE_SCALE +1;
		pageEnd = pageBegin + PAGE_SCALE -1;
	}
	
	// 전체블록갯수계산
	public void setTotBlock() {
		totBlock = (int)Math.ceil(totPage*1.0 / BLOCK_SCALE);
	}
	// 블록의 시작, 끝 번호 계산
	public void setBlockRange() {
		// 원하는 페이지가 몇번째 블록에 속하는지 계산
		curBlock=(curPage-1)/BLOCK_SCALE +1;
		// 블록의 시작페이지, 끝페이지 번호 계산
		blockBegin=(curBlock-1)*BLOCK_SCALE+1;
		blockEnd=blockBegin+BLOCK_SCALE-1;
		// 마지막 블록 번호가 범위를 초과하지않도록 처리
		if(blockEnd > totPage) {
			blockEnd = totPage;
		}
		// [이전][다음]을 눌렀을때 이동할 페이지 번호
		prevPage=(curBlock==1) ? 1:(curBlock-1)*BLOCK_SCALE;
		nextPage=curBlock>totBlock ? (curBlock*BLOCK_SCALE):(curBlock*BLOCK_SCALE)+1;
		// 마지막 페이지가 범위를 초과하지않도록 처리
		if(nextPage >= totPage) {
			nextPage = totPage;
		}
	}

	public final int getCurPage() {
		return curPage;
	}

	public final void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public final int getPrevPage() {
		return prevPage;
	}

	public final void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public final int getNextPage() {
		return nextPage;
	}

	public final void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public final int getTotPage() {
		return totPage;
	}

	// 전체페이지 갯수계산
	public void setTotPage(int count) {
		// Math.ceil() 올림
		totPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);
	}
	public final int getTotBlock() {
		return totBlock;
	}

	public final void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public final int getCurBlock() {
		return curBlock;
	}

	public final void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public final int getPrevBlock() {
		return prevBlock;
	}

	public final void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public final int getNextBlock() {
		return nextBlock;
	}

	public final void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public final int getPageBegin() {
		return pageBegin;
	}

	public final void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public final int getPageEnd() {
		return pageEnd;
	}

	public final void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public final int getBlockBegin() {
		return blockBegin;
	}

	public final void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}

	public final int getBlockEnd() {
		return blockEnd;
	}

	public final void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
}
