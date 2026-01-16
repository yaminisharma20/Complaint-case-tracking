public class CaseTriggerHandler {

    public static void afterUpdate(
        List<Case> newList,
        Map<Id, Case> oldMap
    ) {
        List<Messaging.SingleEmailMessage> emails =
            new List<Messaging.SingleEmailMessage>();

        for (Case c : newList) {
            Case oldCase = oldMap.get(c.Id);

            if (c.Status != oldCase.Status &&
                c.SuppliedEmail != null) {

                Messaging.SingleEmailMessage mail =
                    new Messaging.SingleEmailMessage();

                mail.setToAddresses(
                    new String[] { c.SuppliedEmail }
                );

                mail.setSubject('Complaint Status Updated');

                mail.setPlainTextBody(
                    'Hello ' + c.SuppliedName +
                    ',\n\nYour complaint status is now: ' +
                    c.Status
                );

                emails.add(mail);
            }
        }

        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
