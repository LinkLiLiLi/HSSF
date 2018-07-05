/*
 * AttendanceController.java
 * 创建者：L
 * 系统名称：农业自动化内部管理系统。
 * 创建日期：2017年7月16日 下午8:22:26
 * 创业小团队-后台
 */
package team.nercita.manage.cms.contoller.deptmanage;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import team.nercita.manage.cms.po.deptmanage.AttendanceGroup;
import team.nercita.manage.cms.po.deptmanage.AttendanceSet;
import team.nercita.manage.cms.po.deptmanage.User;
import team.nercita.manage.cms.service.sign.SignService;
import team.nercita.manage.cms.service.usermanage.AttendanceService;
import team.nercita.manage.cms.service.usermanage.UserService;

/**
 * 靠前管理
 * @author L
 * @date 2017年7月16日 下午8:22:26
 */
@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	@Autowired
	SignService signService;
	
	@Autowired
	AttendanceService attendanceService;
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/stat")
	public ModelAndView stat(@ModelAttribute(value="startTime") String startTime) {
		Date date = DateTime.parse(DateTime.now().minusDays(1).toString("yyyy-MM-dd")).toDate();
		String dataTime = DateTime.now().minusDays(1).toString("yyyy-MM-dd");
		if(StringUtils.isNotBlank(startTime)) {
			date = DateTime.parse(startTime).toDate();
			dataTime = startTime;
			
		}
		
		ModelAndView view = new ModelAndView("deptmanage/attendance/stat");
		view.addObject("curr", attendanceService.doJoinTransCurrStat(DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate()));
		view.addObject("yestoday", attendanceService.doJoinTransFindAbsent(DateTime.parse(DateTime.now().toString("yyyy-MM-dd")).toDate()));
		view.addObject("statList", attendanceService.doJoinTransFindStat(date));
		view.addObject("dataTime", dataTime);
		return view;
	}
	
	@RequestMapping("/toadd")
	public String toadd(){
		return "deptmanage/attendance/add";
	}
	
	@RequestMapping("/add")
	public String add(String startTime, String endTime, int absentType, String reason){
		User user = (User) SecurityUtils.getSubject().getSession().getAttribute("user");
		signService.doTransSaveAbsent(user, reason, absentType, DateTime.parse(startTime).toDate(), DateTime.parse(endTime).toDate(), "");
		return "redirect:/attendance/stat";
	}
	
	@RequestMapping("/toset")
	public ModelAndView toset(){
		ModelAndView view = new ModelAndView("deptmanage/attendance/set");
		
		List<AttendanceGroup> groupList = attendanceService.doJoinTransQueryGroup();
		List<User> userList = userService.doJoinTransQueryUserList();
		
		Map<String, User> userMap = new HashMap<>();
		for (User user : userList) {
			userMap.put(user.getId(), user);
		}
		
		for (AttendanceGroup attendanceGroup : groupList) {
			if(userMap.containsKey(attendanceGroup.getUser().getId())){
				userMap.remove(attendanceGroup.getUser().getId());
			}
		}
		
		List<User> notAttList = new ArrayList<>();
		
		if(!userMap.isEmpty()) {
			for(Map.Entry<String, User> maps : userMap.entrySet()){
				notAttList.add(maps.getValue());
			}
		}
		view.addObject("notList", notAttList);
		view.addObject("groupList", groupList);
		view.addObject("setinfo", attendanceService.doJoinTransAttendanceSet());
		
		return view;
	}
	
	@RequestMapping("/set")
	public String set(AttendanceSet attendanceSet, String ids, RedirectAttributes attr){
		attendanceService.doTransAttendanceSet(attendanceSet, ids);
		attr.addFlashAttribute("msg", "考勤组设置成功！");
		return "redirect:/attendance/toset";
	}
}
