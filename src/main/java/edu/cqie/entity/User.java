package edu.cqie.entity;

import lombok.Data;

@Data
public class User {
    private Long userId;
    private String name;
    private Integer sex;//0男//1女
    private String email;
    private String phoneNumber;
    private String address;
}
