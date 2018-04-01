package com.notebookservice.controller;

import com.notebookservice.model.AbstractModels.Device;
import com.notebookservice.model.Issue;
import com.notebookservice.model.Mobile;
import com.notebookservice.model.User;
import com.notebookservice.service.*;
import com.notebookservice.validator.IssueValidator;
import com.notebookservice.validator.UserValidator;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;


@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private DeviceService deviceService;

    @Autowired
    private IssueValidator issueValidator;

    @Autowired
    private IssueService issueService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private ShipService shipService;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getConfirmPassword());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("error", "Username or password is incorrect.");
        }

        if (logout != null) {
            model.addAttribute("message", "Logged out successfully.");
        }

        return "login";
    }

    @RequestMapping(value = "/deviceInfo/{id}", method = RequestMethod.GET)
    public String editContact(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("device", deviceService.getDevice(id.longValue()));
        model.addAttribute("issue", new Issue());
        return "/deviceInfo";
    }

    @RequestMapping(value = "/deviceInfo", method = RequestMethod.POST)
    public String addIssue(@RequestParam(value = "did") Integer id, @ModelAttribute("issue") Issue issue) {

        issue.setDevice(deviceService.getDevice(id.longValue()));
        issue.setFixed(false);

        issueService.addIssue(issue);
       // modelAndView.setViewName("/deviceInfo/"+device.getDeviceId());

        return ("redirect:/deviceInfo/"+id+"");
    }
    @RequestMapping(value = "/welcome", method = RequestMethod.POST)
    public String addDevice(Model model, HttpServletRequest request, @ModelAttribute("newd") Mobile mobile) {

        Set<Issue> issueSet = new HashSet<>();
       mobile.setIssues(issueSet);
       mobile.setType("Phone");
        User user1 = userService.findByUsername(request.getUserPrincipal().getName());
        user1.addDevice(mobile);
        deviceService.addDevice(mobile);

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/editIssue/{id}", method = RequestMethod.GET)
    public String editPerson(@PathVariable("id") Integer id, Model model){
        model.addAttribute("issue", issueService.getIssue(id.longValue()));
        //return "deviceInfo?id=2";
        return "/editIssue";
    }

    @RequestMapping(value = "/editIssue", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveIssue(@ModelAttribute("issue") Issue issue, ModelAndView model) {

        issue.setDevice(issueService.getIssue(issue.getIssueId()).getDevice());
        issueService.updateIssue(issue);

        //model.addObject("listDevices", deviceService.getAllDevices());
        model.setViewName("redirect:/welcome");
        return model;
    }


    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public ModelAndView welcome(ModelAndView model, HttpServletRequest request) {
        List<Device> deviceList = new ArrayList<>();
        username=request.getUserPrincipal().getName();
        if(request.getUserPrincipal().getName().equalsIgnoreCase("admin123")) {
            deviceList = deviceService.getAllDevices();
        }
        else
        {
            deviceList = deviceService.getDeviceByUser(request.getUserPrincipal().getName());
        }
        model.addObject("listDevices", deviceList);
        model.addObject("listManuf", statistics());
        model.addObject("newd", new Mobile());
        model.setViewName("welcome");



        return model;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model) {
        return "admin";
    }

    @RequestMapping(value = "/deleteDevice")
    public String deleteDevice(HttpServletRequest request){
        Long deviceId = Long.parseLong(request.getParameter("id"));
        deviceService.deleteDevice(deviceId);
        return "redirect:/welcome";
    }




    String username = new String();
    public Map statistics(){
        Map map = new Hashtable();
        User user = userService.findByUsername(username);
        System.out.println(username);
        if(!username.contains("admin123")) {
            for (Device d : user.getDevices()) {
                if (map.containsKey(d.getManufactuer())) {
                    map.put(d.getManufactuer(), Integer.parseInt(map.get(d.getManufactuer()).toString()) + d.getIssues().size());
                } else {
                    map.put(d.getManufactuer(), d.getIssues().size());
                }
            }
        }
        else{
            for (Device d : deviceService.getAllDevices()) {
                if (map.containsKey(d.getManufactuer())) {
                    map.put(d.getManufactuer(), Integer.parseInt(map.get(d.getManufactuer()).toString()) + d.getIssues().size());
                } else {
                    map.put(d.getManufactuer(), d.getIssues().size());
                }
            }
        }
        System.out.println(map.toString());
        return map;
    }



}
