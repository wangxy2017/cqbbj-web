package com.cqbbj.core.util;

import com.cqbbj.entity.Employee;

public class EmployeeUtils {

    private static Employee employee;

    public static void setEmployee(Employee emp){
        employee=emp;
    }
    public static Employee getEmployee(){
            return employee;
    }


}
