package com.yst.tag;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;

import com.yst.util.PaginationInfo;


/**   
 * 创建人：张明  
 * 创建时间：2013-10-16   
 * 修改人：user   
 * 修改时间：2013-10-16
 * 类描述：    分页标签类
 * 修改备注：   
 * 版本:  v1.0
 *    
 */

public class PageTagInfo  extends BodyTagSupport {
	
	private static final long serialVersionUID = 6843803621459234498L;

	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		PaginationInfo pList = (PaginationInfo) request.getAttribute("page");
        String urls=request.getContextPath();
		if (null!=pList){
			try {
				final JspWriter writer = pageContext.getOut();
				StringBuffer buffer = new StringBuffer("<form id=\"pagerForm\" method=\"post\" action=\"");
				buffer.append(pList.getActionUrl()).append("\">");
				Map<String,String> m = pList.getQuery();
				for(String key : m.keySet()){
					String value = m.get(key);
					if (StringUtils.isNotBlank(value)) {
						buffer.append("<input type=\"hidden\" name=\"").append(key).append("\" id=\"").append(key).append("\" value=\"").append(value).append("\"/>");
					}
				}
				if(!m.containsKey("pageNo")){
					/*buffer.append("<input type=\"hidden\" name=\"pageNo\" id=\"pageNo\" value=\"1\"/>");*/
					buffer.append("<input type=\"hidden\" name=\"pageNo\" id=\"pageNo\" value=\""+pList.getCurrentPage()+"\"/>");
				}
				if(!m.containsKey("pageSize")){
					buffer.append("<input type=\"hidden\" name=\"pageSize\" id=\"pageSize\" value=\"").append(pList.getPageSize()).append("\"/>");
				}
				buffer.append("<input type=\"hidden\" name=\"actionUrl\" id=\"actionUrl\" value=\"").append(pList.getActionUrl()).append("\"/>");
				buffer.append("<input type=\"hidden\" name=\"totalPage\" id=\"totalPage\" value=\"").append(pList.getTotalPage()).append("\"/>");
				buffer.append("</form>");
				//创造分页条
				//添加CSS
				buffer.append("<style type='text/css'>.tw_pageBar{ float:right; margin-top:10px;}.tw_pageBar span,.tw_pageBar span a{ cursor: pointer; font-size:12px;}.tw_pageBar span{margin-right:3px;}.tw_pageBar .mlr10{ margin-left:10px; margin-right:10px;}.selBorder{ border:1px solid #71bfef; margin:0px 5px; height:20px;}</style>");
				buffer.append("<div id='pageBar' class='tw_pageBar'>");

				//打印翻页内容
				if (pList.getCurrentPage() <= 1) {
					buffer.append("<span><img src='"+urls+"/images/first.jpg' width='10' height='11' alt='首页' title='首页' /></span><span><img src='"+urls+"/images/qian.jpg' width='10' height='11'  alt='上一页' title='上一页'  /></span>");
				} else {
					buffer.append("<span><a href='javascript:void(0)' id='firstPage'><img src='"+urls+"/images/first.jpg' width='10' height='11' alt='首页' title='首页' /></a></span>");
					buffer.append("<span><a href='javascript:void(0)' id='prePage'><img src='"+urls+"/images/qian.jpg' width='10' height='11'  alt='上一页' title='上一页'  /></a></span>");
				}
                
                //打印页次
				buffer.append("<span class='mlr10'>页次:<i id='nowpage'>" + ((pList.getTotalPage() == 0) ? 0 : pList.getCurrentPage()));
				buffer.append("</i>/<i id='allPages'>" + pList.getTotalPage() + "</i></span>");
                
				if (pList.getCurrentPage() >= pList.getTotalPage()) {
					buffer.append("<span><img src='"+urls+"/images/hou.jpg' width='10' height='11'  alt='下一页' title='下一页'  onclick='RETURN false;'/></span><span><img src='"+urls+"/images/last.jpg' width='10' height='11' alt='尾页'  title='尾页'  /></span>");
				} else {
			

		buffer.append("<span><a href='javascript:void(0)' id='nextPage'><img src='"+urls+"/images/hou.jpg' width='10' height='11'  alt='下一页' title='下一页'  /></a></span>");
					buffer.append("<span><a href='javascript:void(0)' id='endPage'><img src='"+urls+"/images/last.jpg' width='10' height='11' alt='尾页'  title='尾页'  /></a></span>");
				}

				

				//打印每页记录条数
	       buffer.append("<SELECT id='selfPageSize' class='selBorder'>");
				buffer.append("<OPTION value='5'>5</OPTION>");
				buffer.append("<OPTION value='10'>10</OPTION>");
				buffer.append("<OPTION value='15'>15</OPTION>");
				buffer.append("<OPTION value='20'>20</OPTION>");
				buffer.append("</SELECT><span>条/页</span>");
				//打印记录总数
				buffer.append("<span class='mlr10'>共" + pList.getTotalRecord() + "条记录</span>");

				//打印跳转到第几页
				buffer.append("<span>转到第</span><SELECT id='selfPage' class='selBorder'>");
				for (int i = 1; i <= pList.getTotalPage(); i++) {
					buffer.append("<OPTION value=" + i + " "
							+ ((i == pList.getCurrentPage()) ? " selected" : "") + ">" + i
							+ "</OPTION>");
				}
				buffer.append("</select><span>页</span>");
				buffer.append("</div>");

				writer.print(buffer.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return SKIP_BODY;
	}

	/**
	 * 标签结束
	 */
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

}

