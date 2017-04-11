<@pp.dropOutputFile />
<#list model.classes.class as class>
<@pp.changeOutputFile name="${class.name}Controller.java" />
<#assign relativePath=class.name?lower_case>
/**
 * @author ${class.author}
 */
package com.anegr.controller;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anegr.dao.Paginator;
import com.anegr.domain.${class.name};
import com.anegr.service.${class.name}Service;
import com.anegr.vo.SubmitResultTip;

@Controller
public class ${class.name}Controller {
	private static final Logger logger = Logger.getLogger(${class.name}Controller.class);
	
	@Resource
	private ${class.name}Service service;
	
	@RequestMapping(value="/${relativePath}/edit.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public ${class.name} edit(@RequestParam String ${class.oid}) {
		return service.get(${class.oid});
	}
	
	@RequestMapping(value="/${relativePath}/save.do", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public SubmitResultTip save(@RequestBody ${class.name} ${class.name?lower_case}) {
		service.insert(${class.name?lower_case});
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;
	}
	
	@RequestMapping(value="/${relativePath}/update.do", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public SubmitResultTip update(@RequestBody ${class.name} ${class.name?lower_case}) {
		service.update(${class.name?lower_case});
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;		
	}	
	
	@RequestMapping(value="/${relativePath}/del.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public SubmitResultTip del(@RequestParam String id) {
		service.delete(id);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;
	}
	
	@RequestMapping(value="/${relativePath}/delBatch.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public SubmitResultTip delBatch(@RequestParam("ids") String ids) {
		List list = Arrays.asList(ids.split(":"));
		service.deleteBatch(list);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;		
	}
	
	@RequestMapping("/${relativePath}/list2.do")
	public String list2(Model model, @RequestParam(value="pageNum",required=false) Integer pageNum, @RequestParam(value="pageSize",required=false) Integer pageSize) {
        if(null==pageSize){  
            pageSize = 10;  
        }  
        if(pageSize>50){  
            pageSize = 50;  
        } 
        if(null==pageNum){
            pageNum = 1;  
        }    
    	
		Paginator paginator = new Paginator(pageNum,pageSize);
		paginator=service.paging(paginator);
		model.addAttribute("pg", paginator);		
		return "${class.name?lower_case}/${class.name?lower_case}_list2";
	}
	
	@RequestMapping("/${relativePath}/add2.do")
	public String add2() {
		return "${class.name?lower_case}/${class.name?lower_case}_form";
	}
	
	@RequestMapping(value="/${relativePath}/edit2.do", method = RequestMethod.GET)
	public String edit2(@RequestParam String ${class.oid}, Model model) {
		model.addAttribute("${class.name?lower_case}", service.get(${class.oid}));
		return "${class.name?lower_case}/${class.name?lower_case}_form";
	}
	
	@RequestMapping(value="/${relativePath}/post.do", method = RequestMethod.POST)
	public ModelAndView post(${class.name} ${class.name?lower_case}) {
		ModelAndView mav = new ModelAndView();
		${class.oid.@type} pkid = ${class.name?lower_case}.get${class.oid?cap_first}();
		if (pkid!=null && pkid.intValue()>0)
			service.update(${class.name?lower_case});
		else
		    service.insert(${class.name?lower_case});
		mav.setViewName("redirect:/${class.name?lower_case}/list2.do");
		return mav;
	}	
}
</#list>