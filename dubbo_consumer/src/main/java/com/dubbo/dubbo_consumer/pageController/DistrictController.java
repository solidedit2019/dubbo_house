package com.dubbo.dubbo_consumer.pageController;


import com.alibaba.dubbo.config.annotation.Reference;
import com.dubbo.dubbo_entity.entity.District;
import com.dubbo.dubbo_interface.service.DistrictService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller("controller2")
@RequestMapping("/page/")
public class DistrictController {
    @Reference(interfaceClass = DistrictService.class)
    private DistrictService districtService;

    @RequestMapping("getAllDistrict")
    @ResponseBody
    public List<District> getAllDistrict(){
        return   districtService.getAllDistrict();
    }
}
