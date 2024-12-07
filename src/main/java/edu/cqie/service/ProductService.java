package edu.cqie.service;

import edu.cqie.entity.Product;
import edu.cqie.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.ArrayList;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductService {
    // 存储产品的集合
    private List<Product> products = new ArrayList<>();

    // 获取所有产品
    public List<Product> list() {
        return products;
    }

    // 添加新产品
    public void add(Product product) {
        products.add(product);
    }

    // 根据产品ID删除产品
    public void remove(String code) {
        products.removeIf(product -> product.getCode().equals(code));
//        list.removeIf(i->i.getUserId()==id);
    }


    // 批量删除产品
    public void remove(List<Long> ids) {
        products.removeIf(product -> ids.contains(product.getCode()));
    }

    // 根据产品ID获取产品详情
    public Product get(String code) {
        return products.stream().filter(item -> item.getCode().equals(code)).findFirst().orElse(null);
    }


public void edit(Product updatedProduct) {
    Optional<Product> existingProduct = products.stream()
            .filter(product -> product.getCode().equals(updatedProduct.getCode()))
            .findFirst();

    if (existingProduct.isPresent()) {
        // 如果存在，就直接修改它
        Product product = existingProduct.get();
        product.setName(updatedProduct.getName());
        product.setType(updatedProduct.getType());
        product.setUnit(updatedProduct.getUnit());
        product.setPrice(updatedProduct.getPrice());
    }
}

    // 根据产品名称删除产品
    public void deleteProduct(String name) {
        products.removeIf(product -> product.getName().equals(name));
    }
}