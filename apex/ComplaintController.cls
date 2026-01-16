public with sharing class ComplaintController {

    @AuraEnabled
    public static void createCase(
        String customerName,
        String customerEmail,
        String subject,
        String description
    ) {
        Case c = new Case();
        c.SuppliedName = customerName;
        c.SuppliedEmail = customerEmail;
        c.Subject = subject;
        c.Description = description;
        c.Status = 'New';
        c.Priority = 'Medium';

        insert c;
    }
}
