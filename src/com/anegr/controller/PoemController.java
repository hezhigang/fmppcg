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
import com.anegr.domain.Poem;
import com.anegr.service.PoemService;
import com.anegr.vo.SubmitResultTip;

@Controller
public class PoemController {
	private static final Logger logger = Logger.getLogger(PoemController.class);
	
	@Resource
	private PoemService service;
	
	@RequestMapping(value="/poem/edit.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public Poem edit(@RequestParam String id) {
		return service.get(id);
	}
	
	@RequestMapping(value="/poem/save.do", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public SubmitResultTip save(@RequestBody Poem poem) {
		service.insert(poem);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;
	}
	
	@RequestMapping(value="/poem/update.do", method = RequestMethod.POST, consumes="application/json")
	@ResponseBody
	public SubmitResultTip update(@RequestBody Poem poem) {
		service.update(poem);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;		
	}	
	
	@RequestMapping(value="/poem/del.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public SubmitResultTip del(@RequestParam String id) {
		service.delete(id);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;
	}
	
	@RequestMapping(value="/poem/delBatch.do", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public SubmitResultTip delBatch(@RequestParam("ids") String ids) {
		List list = Arrays.asList(ids.split(":"));
		service.deleteBatch(list);
		SubmitResultTip submitresulttip = new SubmitResultTip("success");
		return submitresulttip;		
	}
	
	@RequestMapping("/poem/list2.do")
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
		return "poem/poem_list2";
	}
	
	@RequestMapping("/poem/add2.do")
	public String add2() {
		return "poem/poem_form";
	}
	
	@RequestMapping(value="/poem/edit2.do", method = RequestMethod.GET)
	public String edit2(@RequestParam String id, Model model) {
		model.addAttribute("poem", service.get(id));
		return "poem/poem_form";
	}
	
	@RequestMapping(value="/poem/post.do", method = RequestMethod.POST)
	public ModelAndView post(Poem poem) {
		ModelAndView mav = new ModelAndView();
		Integer pkid = poem.getId();
		if (pkid!=null && pkid.intValue()>0)
			service.update(poem);
		else
		    service.insert(poem);
		mav.setViewName("redirect:/poem/list2.do");
		return mav;
	}
	
	@RequestMapping("/poem/list3.do")
	public String index(Model model) {
		model.addAttribute("poemlist", service.getPagingData(0, PullSize.POEM));		
		return "poem/poem_list3";
	}
	
	@RequestMapping(value="/poem/more.do",method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Poem> more(@RequestParam(value="start",required=false) Integer start, @RequestParam(value="count",required=false) Integer count) {
        if(null==count){
        	count = PullSize.POEM;  
        }
        if(count>PullSize.POEM){
        	count = PullSize.POEM;  
        }
        if(null==start){
        	start = 0;
        }
		return service.getPagingData(start, count);
	}	
}