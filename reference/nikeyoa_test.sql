insert into sys_employees values (1, '张俊佳', '123456', null, null, null, 0, 1);

insert into sys_roles values (1, '总经理', '公司老大', 1, 0);
insert into sys_roles values (2, '项目经理', '项目老大', 1, 0);
insert into sys_roles values (3, '部门主管', '部门老大', 1, 0);
insert into sys_roles values (4, '技术工程师', '小弟', 1, 0);
insert into sys_roles values (5, '软件工程师', '小弟', 1, 0);


insert into sys_employees_roles values (1, 4);
insert into sys_employees_roles values (1, 5);
