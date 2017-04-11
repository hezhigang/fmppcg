/**
 * 作者: 和志刚
 * 日期: 2014-9-23
 * 时间: 上午10:10:36
 */
package com.anegr.web.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import javax.servlet.jsp.tagext.TryCatchFinally;

import org.apache.log4j.Logger;

public class Pager extends TagSupport implements TryCatchFinally {
	private static final Logger logger = Logger.getLogger(Pager.class);
	private Integer curPage; // 当前页
	private Integer pageSize = 10; // 每页几条
	private Integer totalCount = 0; // 总记录数
	private String formId; // 用于发送分页post的表单id
	private String barStyle;  //分页条类型：simple-只显示前后翻页两个按钮，complex-带页号

	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public void setBarStyle(String barStyle) {
		this.barStyle = barStyle;
	}

	public int doStartTag() throws JspException {
		int totalPage = 0; // 总页数
		if (totalCount % pageSize == 0) {
			totalPage = totalCount / pageSize;
		} else {
			totalPage = (totalCount / pageSize) + 1;
		}
		if (curPage < 1) {
			curPage = 1;
		}
		if (curPage > totalPage)
			curPage = totalPage;

		if (totalPage > 0 && curPage <= totalPage) {
			StringBuilder sb = new StringBuilder("");
			
			if (barStyle!=null && !"".equals(barStyle) && "complex".equalsIgnoreCase(barStyle)) {
				sb.append("<script type='text/javascript'>"
						+ "function go(pageNum){"
						+ "var f = document.getElementById('" + formId + "');"
						+ "f.action = f.action + '?pageNum=' + pageNum + '&pageSize=" + pageSize + "';" 
						+ "f.submit();" + "}" 
						+ "</script>");
	
				sb.append("<nav><ul class=\"pagination pagination-lg\">");
				int start = 1;
				int end = totalPage;
				for (int i = 4; i >= 1; i--) {
					if ((curPage - i) >= 1) {
						start = curPage - i;
						break;
					}
				}
				for (int i = 4; i >= 1; i--) {
					if ((curPage + i) <= totalPage) {
						end = curPage + i;
						break;
					}
				}
				// 如果小于9则右侧补齐
				if (end - start + 1 <= 9) {
					Integer padLen = 9 - (end - start + 1);
					for (int i = padLen; i >= 1; i--) {
						if ((end + i) <= totalPage) {
							end = end + i;
							break;
						}
					}
				}
	
				// 如果还小于9左侧补齐
				if (end - start + 1 <= 9) {
					Integer padLen = 9 - (end - start + 1);
					for (int i = padLen; i >= 1; i--) {
						if ((start - i) >= 1) {
							start = start - i;
							break;
						}
					}
				}
	
				if (curPage > 1) {
					if (start > 1) {
						sb.append("<li><a href='javascript:go(1)'>首页</a></li>");
					}
					sb.append("<li><a href='javascript:go(" + (curPage - 1) + ")'>上一页</a></li>");
				}
	
				for (int i = start; i <= end; i++) {
					if (i == curPage) {
						sb.append("<li class='active'><a href='#'>" + i + "</a></li>");
					} else {
						sb.append("<li><a href='javascript:go(" + i + ")'>" + i + "</a></li>");
					}
				}
				if (curPage < totalPage) {
					sb.append("<li><a href='javascript:go(" + (curPage + 1) + ")'>下一页</a></li>");
					if (end < totalPage) {
						sb.append("<li><a href='javascript:go(" + totalPage + ")'>尾页</a></li>");
					}
				}
				sb.append("<li><a href='javascript:void(0)'>共" + totalPage + "页" + this.totalCount + "条</a></li>");
				sb.append("</ul></nav>");
			}
			else {
				sb.append("<script type='text/javascript'>"
						+ "function go(pageNum){"
						+ "var f = document.getElementById('" + formId + "');"
						+ "f.action = f.action + '?pageNum=' + pageNum + '&pageSize=" + pageSize + "';" 
						+ "f.submit();" + "}" 
						+ "</script>");
	
				sb.append("<nav><ul class=\"pager\">");
				if (curPage > 1) {
					sb.append("<li class='previous'><a href='javascript:go(" + (curPage - 1) + ")'>上一页</a></li>");
				}
				else {
					sb.append("<li class='previous disabled'><a href='#'>上一页</a></li>");
				}
	
				if (curPage < totalPage) {
					sb.append("<li class='next'><a href='javascript:go(" + (curPage + 1) + ")'>下一页</a></li>");
				}
				else {
					sb.append("<li class='next disabled'><a href='#'>下一页</a></li>");
				}
				sb.append("</ul></nav>");
			}			
			JspWriter out = pageContext.getOut();
			try {
				out.print(sb.toString());
				out.flush();
			} catch (IOException e) {
				logger.error("分页标签出错：");
				logger.error(e);
			} finally {
				sb = null;
			}
		}
		return super.doStartTag();
	}

	public int doEndTag() throws JspException {
		return super.doEndTag();
	}

	@Override
	public void doCatch(Throwable arg0) throws Throwable {
		logger.error(arg0);
	}

	@Override
	public void doFinally() {

	}

	public void release() {
		super.release();
		formId = null;
		curPage = null;
		pageSize = null;
		totalCount = null;
		barStyle = null;
	}
}