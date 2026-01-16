trigger CaseStatusTrigger on Case (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        CaseTriggerHandler.afterUpdate(
            Trigger.new,
            Trigger.oldMap
        );
    }
}
