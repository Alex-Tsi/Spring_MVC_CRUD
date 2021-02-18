package com.spring.aop.pointcuts;

import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;


@Component
public class PointCuts {

    @Pointcut("execution(* com.spring.hibernate.dao.EmployeeDAOImp.*.*(..))")
    public void getAllDaoMethods() {
    }

}