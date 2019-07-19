package com.dubbo.dubbo_consumer.pageController;


import com.alibaba.dubbo.config.annotation.Reference;
import com.dubbo.dubbo_entity.entity.Street;
import com.dubbo.dubbo_interface.service.StreetService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller("Controller2")
@RequestMapping("/page/")
public class StreetController {
    @Reference(interfaceClass = StreetService.class)
    private StreetService streetService;

    @RequestMapping("getAllStreet")
    @ResponseBody
    public List<Street> getAllStreet(Integer did){
        return   streetService.getAllStreet(did);
    }
}
