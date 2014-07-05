1. Boolean查询结果为NULL的处理（处理为false）--未解决

2. insert/update失败是报错 

3. 返回结果组装成list或HashMap（见EmployeeMapper.xml）

4. 如何使用EmployeeMapper，见EmployeeMapper.java和EmployeeMapper.xml和EmployeeMapperTest.java
   - 登录
   - 拿到所有角色
   - 更新信息
   - 添加雇员
   - 所在部门
   - 传参活用（新增@Param注解）
   - 批量更新
   - 返回值活用
     - 把Employee组装成hashmap
     - List<Employee>
     - List<HashMap<String, Object>>

5. 几个不同的表组装，建议用resultMap封装成hashmap，在EmployeeMapper.xml搜索“组装”

6. foreach步长研究，为解决

7. 如何使用spring-test(junit)，见EmployeeMapperTest.java

8. 如何使用sqlSessionTemplate快速测试，见SqlSessionTemplateTest.java

9. 程序组织结构

NIKEYOA_V1.0

src下放java代码，dao.Security结尾的是Spring Security相关，志勇可以把代码迁移到这里；
mapper是dao接口，mapper.Security是spring security表和部门表；
mapper.Customer是客户和项目；
mapper.ServiceAndTask是事务和子任务；
mapper.ServiceAndTaskReference是事务和子任务的相关表，如一些类型、进度和评价；
model是模型层；

resource放配置文件；

test放测试类；







