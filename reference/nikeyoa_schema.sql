CREATE TABLE projects (
  project_id INT(11) NOT NULL AUTO_INCREMENT,
  project_name VARCHAR(255) NULL DEFAULT NULL COMMENT '项目名称',
  project_desc VARCHAR(1000) NULL DEFAULT NULL COMMENT '项目描述',
  project_contact VARCHAR(255) NULL DEFAULT NULL COMMENT '联系方式',
  is_finished BOOL NULL DEFAULT '0' COMMENT '是否完成 0：否 1：是',
  PRIMARY KEY(project_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE evaluates_types (
  type_id INT(11) NOT NULL AUTO_INCREMENT COMMENT '评价类型 1：部门主管 2：项目经理 3：总经理',
  type_cn_name VARCHAR(255) NULL,
  type_en_name VARCHAR(255) NULL,
  PRIMARY KEY(type_id)
);

CREATE TABLE statuses_types (
  type_id INT(11) NOT NULL AUTO_INCREMENT COMMENT '状态类型 1：不需要完成 2：审核中 3：进行中 4：已完成',
  type_cn_name VARCHAR(255) NULL DEFAULT NULL,
  type_en_name VARCHAR(255) NULL DEFAULT NULL COMMENT '英文名称 1：canceled 2：checking 3：in_process 4：finished',
  PRIMARY KEY(type_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE services_types (
  type_id INT(11) NOT NULL AUTO_INCREMENT COMMENT '事务类型 1：售前 2：售中 3：售后',
  type_cn_name VARCHAR(255) NULL,
  type_en_name VARCHAR(255) NULL,
  PRIMARY KEY(type_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE tasks_types (
  type_id INT(11) NOT NULL AUTO_INCREMENT COMMENT '任务类型 1：现场维护任务 2：软件模块开发任务 3：预研任务',
  type_cn_name VARCHAR(255) NULL,
  type_en_name VARCHAR(255) NULL,
  PRIMARY KEY(type_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE departments (
  depart_id INT(11) NOT NULL AUTO_INCREMENT,
  depart_name VARCHAR(255) NULL DEFAULT NULL COMMENT '部门名称',
  depart_desc VARCHAR(255) NULL DEFAULT NULL COMMENT '部门描述',
  PRIMARY KEY(depart_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE companies (
  company_id INT(11) NOT NULL AUTO_INCREMENT,
  company_name VARCHAR(255) NULL DEFAULT NULL COMMENT '客户名称',
  company_desc VARCHAR(1000) NULL DEFAULT NULL COMMENT '客户描述',
  company_contact VARCHAR(255) NULL DEFAULT NULL COMMENT '客户联系方式',
  PRIMARY KEY(company_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE sys_authorities (
  authority_id INT(11) NOT NULL AUTO_INCREMENT,
  authority_name VARCHAR(255) NULL DEFAULT NULL COMMENT '权限名称',
  authority_desc VARCHAR(255) NULL DEFAULT NULL COMMENT '权限描述',
  is_enable BOOL NULL DEFAULT '1' COMMENT '是否启用 0：否 1：是',
  is_sys BOOL NULL DEFAULT '0' COMMENT '是否管理员 0：否 1：是',
  PRIMARY KEY(authority_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE evaluates (
  eval_id INT(11) NOT NULL AUTO_INCREMENT,
  eval_type INT(11) NULL DEFAULT NULL COMMENT '评价类型 1：部门主管 2：项目经理 3：总经理',
  eval_detail VARCHAR(255) NULL DEFAULT NULL COMMENT '评价细节',
  eval_date VARCHAR(255) NULL DEFAULT NULL COMMENT '评价日期',
  eval_by_who INT(11) NULL DEFAULT NULL COMMENT '评价人',
  PRIMARY KEY(eval_id),
  INDEX eval_type_index(eval_type),
  FOREIGN KEY(eval_type)
    REFERENCES evaluates_types(type_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE sys_roles (
  role_id INT(11) NOT NULL AUTO_INCREMENT,
  role_name VARCHAR(255) NULL DEFAULT NULL COMMENT '角色名称',
  role_desc VARCHAR(255) NULL DEFAULT NULL COMMENT '角色描述',
  is_enable BOOL NULL DEFAULT '1' COMMENT '是否启用 0：否 1：是',
  is_sys BOOL NULL DEFAULT '0' COMMENT '是否管理员 0：否 1：是',
  PRIMARY KEY(role_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE sys_resources (
  resource_id INT(11) NOT NULL AUTO_INCREMENT,
  resource_name VARCHAR(255) NULL DEFAULT NULL COMMENT '资源名称',
  resource_desc VARCHAR(255) NULL DEFAULT NULL COMMENT '资源描述',
  is_enable BOOL NULL DEFAULT '1' COMMENT '是否启用 0：否 1：是',
  is_sys BOOL NULL DEFAULT '0' COMMENT '是否管理员 0：否 1：是',
  PRIMARY KEY(resource_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE sys_employees (
  emp_id INT(11) NOT NULL AUTO_INCREMENT,
  emp_name VARCHAR(255) NULL DEFAULT NULL COMMENT '员工名称',
  emp_password VARCHAR(255) NULL DEFAULT NULL COMMENT '员工密码',
  emp_email VARCHAR(255) NULL DEFAULT NULL COMMENT '员工邮件',
  emp_desc VARCHAR(255) NULL DEFAULT NULL COMMENT '员工描述',
  emp_account VARCHAR(255) NULL DEFAULT NULL COMMENT '员工账户',
  is_sys BOOL NULL DEFAULT '0' COMMENT '是否管理员 0：否 1：是',
  is_using BOOL NULL DEFAULT '1' COMMENT '是否在职 0：否 1：是',
  PRIMARY KEY(emp_id)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE sys_roles_authorities (
  role_id INT(11) NOT NULL COMMENT '角色',
  authority_id INT(11) NOT NULL COMMENT '权限',
  PRIMARY KEY(role_id, authority_id),
  INDEX role_id_index(role_id),
  INDEX authority_id_index(authority_id),
  FOREIGN KEY(role_id)
    REFERENCES sys_roles(role_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(authority_id)
    REFERENCES sys_authorities(authority_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE sys_employees_roles (
  emp_id INT(11) NOT NULL COMMENT '员工',
  role_id INT(11) NOT NULL COMMENT '角色',
  PRIMARY KEY(emp_id, role_id),
  INDEX emp_id_index(emp_id),
  INDEX role_id_index(role_id),
  FOREIGN KEY(emp_id)
    REFERENCES sys_employees(emp_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(role_id)
    REFERENCES sys_roles(role_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE tasks (
  task_id INT(11) NOT NULL AUTO_INCREMENT,
  task_status INT(11) NOT NULL DEFAULT 1 COMMENT '任务状态 状态 1：不需要完成 2：审核中 3：进行中 4：已完成',
  eval_id INT(11) NULL DEFAULT NULL COMMENT '对任务总评价',
  task_type INT(11) NULL DEFAULT NULL COMMENT '任务类型 1：现场维护任务 2：软件模块开发任务 3：预研任务',
  task_name VARCHAR(255) NULL DEFAULT NULL COMMENT '任务名称',
  task_desc VARCHAR(1000) NULL DEFAULT NULL COMMENT '任务描述',
  task_begin DATE NULL DEFAULT NULL COMMENT '开始时间',
  task_end DATE NULL DEFAULT NULL COMMENT '截止期限',
  task_attach BLOB NULL DEFAULT NULL COMMENT '任务附件',
  task_memo VARCHAR(1000) NULL DEFAULT NULL COMMENT '任务备注',
  task_progress INT(11) NULL DEFAULT NULL COMMENT '任务进展 值在0至100之间',
  task_finished_date DATE NULL DEFAULT NULL COMMENT '实际完成时间',
  task_level VARCHAR(255) NULL DEFAULT NULL COMMENT '任务绩效 如：2A',
  task_level_count VARCHAR(255) DEFAULT NULL COMMENT '任务绩效计数 如：2A=10',
  PRIMARY KEY(task_id),
  INDEX task_type_index(task_type),
  INDEX eval_id_index(eval_id),
  INDEX task_status_index(task_status),
  FOREIGN KEY(task_type)
    REFERENCES tasks_types(type_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(eval_id)
    REFERENCES evaluates(eval_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(task_status)
    REFERENCES statuses_types(type_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE projects_employees (
  project_id INT(11) NOT NULL COMMENT '项目',
  emp_id INT(11) NOT NULL COMMENT '员工',
  PRIMARY KEY(project_id, emp_id),
  INDEX project_id_index(project_id),
  INDEX emp_id_index(emp_id),
  FOREIGN KEY(project_id)
    REFERENCES projects(project_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(emp_id)
    REFERENCES sys_employees(emp_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE departments_employees (
  emp_id INT(11) NOT NULL COMMENT '员工',
  depart_id INT(11) NOT NULL COMMENT '部门',
  PRIMARY KEY(emp_id, depart_id),
  INDEX depart_id_index(depart_id),
  INDEX emp_id_index(emp_id),
  FOREIGN KEY(depart_id)
    REFERENCES departments(depart_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(emp_id)
    REFERENCES sys_employees(emp_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE companies_projects (
  company_id INT(11) NOT NULL COMMENT '客户',
  project_id INT(11) NOT NULL COMMENT '项目',
  PRIMARY KEY(company_id, project_id),
  INDEX company_id_index(company_id),
  INDEX project_id_index(project_id),
  FOREIGN KEY(company_id)
    REFERENCES companies(company_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(project_id)
    REFERENCES projects(project_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE sys_authorities_resources (
  authority_id INT(11) NOT NULL COMMENT '权限',
  resource_id INT(11) NOT NULL COMMENT '资源',
  PRIMARY KEY(authority_id, resource_id),
  INDEX authority_id_index(authority_id),
  INDEX resource_id_index(resource_id),
  FOREIGN KEY(authority_id)
    REFERENCES sys_authorities(authority_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(resource_id)
    REFERENCES sys_resources(resource_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE services (
  ser_id INT(11) NOT NULL AUTO_INCREMENT,
  ser_type INT(11) NULL DEFAULT NULL COMMENT '事务类型 1：售前 2：售中 3：售后',
  ser_status INT(11) not NULL DEFAULT 1 COMMENT '事务状态 1：不需要完成 2：审核中 3：进行中 4：已完成',
  ser_name VARCHAR(255) NULL DEFAULT NULL COMMENT '事务名称',
  ser_attach BLOB NULL DEFAULT NULL COMMENT '事务附件',
  ser_desc VARCHAR(1000) NULL DEFAULT NULL COMMENT '事务描述',
  ser_memo VARCHAR(1000) NULL DEFAULT NULL COMMENT '事务备注',
  ser_progress INT(11) NULL DEFAULT NULL COMMENT '事务进展 值在0至100之间',
  PRIMARY KEY(ser_id),
  INDEX ser_status_index(ser_status),
  INDEX ser_type_index(ser_type),
  FOREIGN KEY(ser_status)
    REFERENCES statuses_types(type_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(ser_type)
    REFERENCES services_types(type_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE projects_services (
  project_id INT(11) NOT NULL COMMENT '项目',
  ser_id INT(11) NOT NULL COMMENT '事务',
  PRIMARY KEY(project_id, ser_id),
  INDEX project_id_index(project_id),
  INDEX ser_id_index(ser_id),
  FOREIGN KEY(project_id)
    REFERENCES projects(project_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(ser_id)
    REFERENCES services(ser_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE services_tasks (
  ser_id INT(11) NOT NULL COMMENT '事务',
  task_id INT(11) NOT NULL COMMENT '任务',
  PRIMARY KEY(ser_id, task_id),
  INDEX ser_id_index(ser_id),
  INDEX task_id_index(task_id),
  FOREIGN KEY(ser_id)
    REFERENCES services(ser_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(task_id)
    REFERENCES tasks(task_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE tasks_employees (
  emp_id INT(11) NOT NULL COMMENT '员工',
  task_id INT(11) NOT NULL COMMENT '任务',
  eval_id INT(11) NULL DEFAULT NULL COMMENT '对员工完成情况评价',
  task_progress INT(11) NULL DEFAULT 0 COMMENT '所占任务百分比 0至100',
  PRIMARY KEY(emp_id, task_id),
  INDEX emp_id_index(emp_id),
  INDEX task_id_index(task_id),
  INDEX eval_id_index(eval_id),
  FOREIGN KEY(emp_id)
    REFERENCES sys_employees(emp_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(task_id)
    REFERENCES tasks(task_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE,
  FOREIGN KEY(eval_id)
    REFERENCES evaluates(eval_id)
      ON DELETE NO ACTION
      ON UPDATE CASCADE
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


