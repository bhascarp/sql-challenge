-- Table Schemata

-- departments table
CREATE TABLE departments(
  dept_no  varchar(50) NOT NULL,
  dept_name VARCHAR(256) NOT NULL,
  PRIMARY KEY (dept_no)
);

-- titles table
CREATE TABLE titles(
  title_id  varchar(50) NOT NULL PRIMARY KEY,
  title VARCHAR(256) NOT NULL
);

-- employees Table
CREATE TABLE employees (
  emp_no INTEGER NOT NULL PRIMARY KEY,
  emp_title_id VARCHAR(50) NOT NULL,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
  birth_date timestamp NOT NULL,
  first_name varchar(256),
  last_name varchar(256) NOT NULL,
  sex varchar(10),
  hire_date timestamp NOT NULL
);

-- salaries table
CREATE TABLE salaries(
  emp_no  int NOT NULL,
  salary int NOT NULL,
  FOREIGN KEY (emp_no) references employees(emp_no)
);

-- dept_emp table
CREATE TABLE dept_emp(
  emp_no int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  dept_no VARCHAR(255) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- dept_manager table
CREATE TABLE dept_manager(
  dept_no varchar(255) NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  emp_no int NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
