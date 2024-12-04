package edu.cqie.entity;

public class Result {
    private Long count; // 用于表示条目或项的数量
    private Integer total; // 用于表示条目的总数
    private String code; // 用于表示状态码（例如：成功、错误）
    private String msg; // 存放消息（例如：错误描述、成功消息）
    private Object data; // 存放实际返回的数据负载

    // 仅带状态码和消息的构造函数
    public Result(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    // 带状态码、消息和数据的构造函数
    public Result(String code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    // 带状态码、消息、数量、总数和数据的完整构造函数
    public Result(String code, String msg, Long count, Integer total, Object data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.total = total;
        this.data = data;
    }

    public Result(String code, String msg, Long count, Object data) {
        this.code=code;
        this.msg=msg;
        this.count=count;
        this.data=data;
    }


    // Getter 和 Setter 方法
    public Long getCount() {
        return count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Result{" +
                "count=" + count +
                ", total=" + total +
                ", code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';
    }

    public static Result ok() {
        return new Result("0","操作成功");
    }
    public static Result ok(String msg) {
        return new Result("0",msg);
    }
    public static Result ok(String msg,Object obj) {
        return new Result("0",msg,obj);
    }
    public static Result ok(String msg,Long count,Object obj) {
        return new Result("0","",count,obj);
    }
    public static Result fail() {
        return new Result("-1","操作失败");
    }
    public static Result fail(String msg) {
        return new Result("-1","msg");
    }
}