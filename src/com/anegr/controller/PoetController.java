/**
 * @author hezhigang
 */
package com.anegr.controller;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.anegr.Constants.PullSize;
import com.anegr.dao.Paginator;
import com.anegr.domain.Poet;
import com.anegr.service.PoetService;
import com.anegr.vo.SubmitResultTip;

@Controller
public class PoetController {
	private static final Logger logger = Logger.getLogger(PoetController.class);
	
	@Resource
	private PoetService service;
	
	@RequestMapping(value="/poet/edit.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Poet edit(@RequestParam String id) {
		return service.get(id);
	}
	
	@RequestMapping(value="/poet/save.do", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public SubmitResultTip save(@RequestBody Poet poet) {
		service.insert(poet);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;
	}
	
	@RequestMapping(value="/poet/update.do", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public SubmitResultTip update(@RequestBody Poet poet) {
		service.update(poet);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;		
	}	
	
	@RequestMapping(value="/poet/del.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public SubmitResultTip del(@RequestParam String id) {
		service.delete(id);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;
	}
	
	@RequestMapping(value="/poet/delBatch.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public SubmitResultTip delBatch(@RequestParam("ids") String ids) {
		List list = Arrays.asList(ids.split(":"));
		service.deleteBatch(list);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;		
	}
	
	@RequestMapping("/poet/list2.do")
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
		return "poet/poet_list2";
	}
	
	@RequestMapping("/poet/add2.do")
	public String add2() {
		return "poet/poet_form";
	}
	
	@RequestMapping(value="/poet/edit2.do", method = RequestMethod.GET)
	public String edit2(@RequestParam String id, Model model) {
		model.addAttribute("poet", service.get(id));
		return "poet/poet_form";
	}
	
	@RequestMapping(value="/poet/post.do", method = RequestMethod.POST)
	public ModelAndView post(Poet poet) {
		ModelAndView mav = new ModelAndView();
		Integer pkid = poet.getId();
		if (pkid!=null && pkid.intValue()>0)
			service.update(poet);
		else
		    service.insert(poet);
		mav.setViewName("redirect:/poet/list2.do");
		return mav;
	}
	
	@RequestMapping("/poet/list3.do")
	public String index(Model model) {
		model.addAttribute("poetlist", service.getPagingData(0, PullSize.POET));		
		return "poet/poet_list3";
	}
	
	@RequestMapping(value="/poet/more.do",method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Poet> more(@RequestParam(value="start",required=false) Integer start, @RequestParam(value="count",required=false) Integer count) {
        if(null==count){
        	count = PullSize.POET;  
        }  
        if(count>PullSize.POET){
        	count = PullSize.POET;  
        }
        if(null==start){
        	start = 0;  
        }
		return service.getPagingData(start, count);
	}
}
