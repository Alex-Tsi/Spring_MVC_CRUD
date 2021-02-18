package com.spring.mvc;

import com.spring.hibernate.entity.Employee;
import com.spring.hibernate.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import java.util.List;

@Controller
@RequestMapping("/")
public class MyController {

    private final EmployeeService employeeService;

    @Autowired
    public MyController(@Qualifier("employeeServiceImpl") EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @RequestMapping("/")
    public String showAllEmployees(/*@RequestParam(name = "name", defaultValue = "0") String name,
                                   @RequestParam(name = "surname", defaultValue = "0") String surname,
                                   @RequestParam(name = "department", defaultValue = "0") String department,
                                   @RequestParam(name = "salary", defaultValue = "0") String salary,*/
            Model model) {
        /*if (!name.equals("0")) {
            Employee employee = new Employee(name, surname, department, Integer.parseInt(salary));
            employeeService.addEmployee(employee);
        }*/

        List<Employee> employeeList = employeeService.getAllEmployees();
        model.addAttribute("employee", new Employee());
        model.addAttribute("employeeList", employeeList);
        return "all-employees";
    }

    /**
     * Сохранение происходит через промежуточное звено. Т.к. одновременно отправить модель и принять её
     * Может быть невозможно, то необходить использовать другой метод, который примет модель из
     * Из исходящего запроса
     * Например (/)showAllEmployees добавляет в модель аттрибут Employee(), форма в представлении (view)
     * принимает эту модель и через кнопку сабмит отправляет её на (/saveEmployee)saveEmployee
     */
    @RequestMapping("/saveEmployee")
    public String saveEmployee(@ModelAttribute("employee") Employee employee) {
        System.out.println(employee.getId());
        employeeService.saveOrUpdateEmployee(employee);
        return "redirect:/";
    }

    @RequestMapping("/addNewEmployee")
    public String addNewEmployee(Model model) {
        model.addAttribute("employee", new Employee());
        return "employee-info";
    }

    @RequestMapping("/updateInfo")
    public String updateEmployee(@RequestParam("empId") int id, Model model) {
        Employee employee = employeeService.getEmployee(id);
        model.addAttribute("employee", employee);
        return "employee-info";
    }

    @RequestMapping("/deleteEmployee")
    public String deleteEmployee(@RequestParam("empId") int id) {
        employeeService.deleteEmployee(id);
        return "redirect:/";
    }

    //ModelAttribute при необходимости создаёт объект и инициализирует поля по умолчанию
    @RequestMapping("/getEmployee")
    public String getAnEmployee(/*@ModelAttribute("getEmp") Employee employee, */
            @RequestParam(value = "empId", defaultValue = "0") int id,
            Model model) {
        Employee employee = employeeService.getEmployee(id);
        model.addAttribute("employee", employee);
        return "get-employee";
    }
}