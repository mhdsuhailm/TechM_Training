package Task_02;

import java.util.Scanner;

class Employee {
    private int empId;
    private String empName;
    private double sal;
    private int yearsWorked;

    public void setEmployeeDetails(int empId, String empName, double sal, int yearsWorked) {
        this.empId = empId;
        this.empName = empName;
        this.sal = sal;
        this.yearsWorked = yearsWorked;
    }

    public void getEmployeeDetails() {
        System.out.println("\nEmployee Details:");
        System.out.println("ID: " + empId);
        System.out.println("Name: " + empName);
        System.out.println("Monthly Salary: " + sal);
        System.out.println("Years Worked: " + yearsWorked);
    }

    public void getLoanEligibility() {
        if (yearsWorked <= 5) {
            System.out.println(empName + " is not eligible for a loan.");
            return;
        }

        double annualSalary = sal * 12;
        double loanAmount = 0;

        if (annualSalary >= 15_00_000) {
            loanAmount = 7_00_000;
        } else if (annualSalary >= 10_00_000) {
            loanAmount = 5_00_000;
        } else if (annualSalary >= 6_00_000) {
            loanAmount = 2_00_000;
        }

        if (loanAmount > 0) {
            System.out.println(empName + " is eligible for a loan of Rs. " + loanAmount);
        } else {
            System.out.println(empName + " is not eligible for a loan.");
        }
    }
}

public class EmployeeLoan {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        Employee emp = new Employee();

        System.out.print("Enter Employee ID: ");
        int id = sc.nextInt();
        sc.nextLine();

        System.out.print("Enter Employee Name: ");
        String name = sc.nextLine();

        System.out.print("Enter Monthly Salary: ");
        double salary = sc.nextDouble();

        System.out.print("Enter Years Worked: ");
        int years = sc.nextInt();

        emp.setEmployeeDetails(id, name, salary, years);

        emp.getEmployeeDetails();

        emp.getLoanEligibility();

        sc.close();
    }
}
