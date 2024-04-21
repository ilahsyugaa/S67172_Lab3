<%-- 
    Document   : processCalculateCarLoan
    Created on : Apr 20, 2024, 6:13:36 PM
    Author     : Fad Rahmat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Loan Result</title>
</head>
<body>
    <h1>Car Loan Result</h1>
    <%
        // Retrieve parameters from the request
        String loanAmountStr = request.getParameter("loanAmount");
        String loanPeriodStr = request.getParameter("loanPeriod");
        
        // Parse parameters to integers
        int loanAmount = Integer.parseInt(loanAmountStr);
        int loanPeriod = Integer.parseInt(loanPeriodStr);
        
        // Calculate annual interest rate based on loan period
        double annualInterestRate;
        if (loanPeriod < 5) {
            annualInterestRate = 0.028; // 2.8% annual interest rate for loan period less than 5 years
        } else {
            annualInterestRate = 0.045; // 4.5% annual interest rate for loan period 5 years or more
        }
        
        double monthlyInterestRate = annualInterestRate / 12;
        int totalMonths = loanPeriod * 12;
        
        // Calculate monthly payment
        double monthlyPayment = (loanAmount * monthlyInterestRate) / (1 - Math.pow(1 + monthlyInterestRate, -totalMonths));
        
        // Calculate total loan with interest
        double totalLoan = monthlyPayment * totalMonths;
        
        // Display result
    %>
    <p>Loan Amount: RM <%= loanAmount %></p>
    <p>Loan Period: <%= loanPeriod %> years</p>
    <p>Annual Interest Rate: <%= annualInterestRate * 100 %>%</p>
    <p>Monthly Payment: RM <%= String.format("%.2f", monthlyPayment) %></p>
    <p>Total Loan (+interest): RM <%= String.format("%.2f", totalLoan) %></p>
</body>
</html>