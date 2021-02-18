package com.spring.aop.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

import java.util.Arrays;

@Component
@Aspect
public class GetAllEmployeesAspect {

    //@Around("com.spring.aop.pointcuts.PointCuts.getAllDaoMethods()")
    @Around("execution(* com.spring.hibernate.dao.EmployeeDAOImp.*.*(..))")
    public Object aroundGetAllEmployeeAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("get all employees");
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        System.out.println("Name of method " + signature.getName());
        System.out.println("Types of parameters " + Arrays.toString(signature.getParameterTypes()));

        Object targetResult;
        targetResult = joinPoint.proceed();

        System.out.println("End of method " + signature.getName());

        return targetResult;
    }
}
