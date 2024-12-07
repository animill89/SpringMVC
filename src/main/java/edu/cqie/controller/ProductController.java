package edu.cqie.controller;

import edu.cqie.entity.Result;
import edu.cqie.entity.Product; // 替换为 Product 实体
import edu.cqie.service.ProductService; // 替换为 ProductService
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("product") // 修改请求映射为 “product”
public class ProductController {

    @Autowired
    ProductService productService; // 使用 ProductService

    @RequestMapping("/list") // 修改为 GET 请求
    @ResponseBody
    public Result list(){
        // 获取产品列表
        return Result.ok("获取成功！", productService.list());
    }

    @RequestMapping("/add") // 修改为 POST 请求
    @ResponseBody
    public Result add(@RequestBody Product product){ // 使用 Product 对象
        productService.add(product);
        return Result.ok();
    }

    @RequestMapping("/edit") // 修改为 POST 请求
    @ResponseBody
    public Result edit(@RequestBody Product product){ // 使用 Product 对象
        productService.edit(product);
        return Result.ok();
    }

    // 删除产品
    @GetMapping("/remove/{code}") // 修改为 DELETE 请求
    @ResponseBody
    public Result remove(@PathVariable String code){
        productService.remove(code);
        return Result.ok();
    }

    @GetMapping("/delete") // 删除产品通过名称
    @ResponseBody
    public Result deleteProduct(@RequestParam("name") String productName){
        productService.deleteProduct(productName);
        return Result.ok();
    }


    // 批量删除
    @PostMapping("/remove") // 批量删除
    @ResponseBody
    public Result remove(@RequestParam List<Long> ids){
        productService.remove(ids);
        return Result.ok();
    }

    // 获取产品详情
    @GetMapping("/get/{code}") // 更改为 GET 请求以获取产品详情
    @ResponseBody
    public Result get(@PathVariable("code") String code){
        return Result.ok("获取成功",productService.get(code)); // 返回产品详情
    }

    @GetMapping("/toAddPage") // 跳转到添加页面
    public String toAddPage(){
        return "product/add"; // 返回添加产品页面
    }

    @GetMapping("/toProductPage") // 跳转到产品列表页面
    public String toProductPage(){
        return "product/list"; // 返回产品列表页面
    }

    @GetMapping("/toEditPage/{code}") // 跳转到编辑页面
    public String toEditPage(@PathVariable("code") String code, Model model){
        model.addAttribute("code", code); // 将产品 ID 添加到模型中
        return "product/edit"; // 返回编辑产品页面
    }
}