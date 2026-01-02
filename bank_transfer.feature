Feature: bank transfer with different users and data

As a user
I want to be able to create a bank transfer
So that I can transfer money
    
Scenario Outline: Submit bank transfer with different conditions
    Given the user is on the bank transfer page
    And the user is connected as "<user>"
    And the user enter the beneficiary name with "<beneficiaryName>"
    And the user enter the IBAN with "<iban>"
    And the user enter the label with "<label>"
    And the user enter the amount with "<amount>"
    And the user select the transfer mode "<transferMode>"
    And the user select the transfer date "<transferDate>"
    When the user clicks the transfer button
    Then the user should see the message "<resultMessage>"

Examples:
   | user          | beneficiaryName | iban      | label      | amount | transferMode  | transferDate  | resultMessage      |
   | administrator | validName       | validIban | validLabel | 100    | instant       | empty         |/transfer           |
   | administrator | validName       | validIban | validLabel | 100    | scheduled     | tomorrow      |/scheduledTomorrow  |
   | administrator | validName       | wrongIban | validLabel | 100    | instant       | empty         |/ibanTooShort       |
   | user          | validName       | validIban | validLabel | 100    | instant       | empty         |/errorUser          |

