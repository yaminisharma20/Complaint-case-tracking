@IsTest
public class ComplaintControllerTest {

    @IsTest
    static void testCreateCase() {

        Test.startTest();
        ComplaintController.createCase(
            'Test User',
            'test@email.com',
            'Login Issue',
            'Unable to login'
        );
        Test.stopTest();

        Case c = [
            SELECT Subject, Status, Priority
            FROM Case
            WHERE Subject = 'Login Issue'
            LIMIT 1
        ];

        System.assertEquals('New', c.Status);
        System.assertEquals('Medium', c.Priority);
    }
}
