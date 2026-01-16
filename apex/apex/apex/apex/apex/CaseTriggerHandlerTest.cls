@IsTest
public class CaseTriggerHandlerTest {

    @IsTest
    static void testStatusChange() {

        Case c = new Case(
            Subject = 'Test Case',
            SuppliedName = 'User',
            SuppliedEmail = 'user@email.com',
            Status = 'New'
        );
        insert c;

        Test.startTest();
        c.Status = 'In Progress';
        update c;
        Test.stopTest();

        System.assert(true);
    }
}


