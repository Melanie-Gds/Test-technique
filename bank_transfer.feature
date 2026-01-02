## login_test.feature

Feature: Create bank transfer

As a legitimate user
I want to be able create a bank transfer
So that I can transfer it

Background:
    Given the user is on the bank transfer page
    And the user fill the beneficiary name with "beneficiaryName"
    And the user fill the IBAN with "iban"
    And the user fill the label with "label"
    And the user fill the amount with "amount"
    And the user choose the transfer mode "transferMode"

@transfer
Scenario: Successful bank transfer in instant mode
        Given the user is on the bank transfer page
        When the user submit the bank transfer form
        Then the bank transfer should be submit
        And the message "transfer Success" is displayed

 Scenario: Successful bank transfer scheduled at tomorrow 
        Given the user is on the bank transfer page
        When the user submit the bank transfer form
        Then the bank transfer is programmed
        And the message "transfer programmed with Success" is displayed

@boundary
Scenario: Failed bank transfer with IBAN to short
        Given the user is on the bank transfer page
        When the user ubmit the bank transfer form
        Then an error message "IBAN too short" is displayed

@rbac  background ne marchera pas ? 
Scenario: Failed bank transfer with non-authorized role
        Given the user is on the bank page 
        When the user click the bank transfer page 
        Then an error message "Only administrator or Purchase Manger can create a transfer" is displayed