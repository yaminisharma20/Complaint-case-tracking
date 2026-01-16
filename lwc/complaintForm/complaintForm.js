import { LightningElement } from 'lwc';
import createCase from '@salesforce/apex/ComplaintController.createCase';

export default class ComplaintForm extends LightningElement {

    customerName;
    customerEmail;
    subject;
    description;

    handleName(event) {
        this.customerName = event.target.value;
    }

    handleEmail(event) {
        this.customerEmail = event.target.value;
    }

    handleSubject(event) {
        this.subject = event.target.value;
    }

    handleDescription(event) {
        this.description = event.target.value;
    }

    handleSubmit() {
        createCase({
            customerName: this.customerName,
            customerEmail: this.customerEmail,
            subject: this.subject,
            description: this.description
        }).then(() => {
            alert('Complaint submitted successfully');
        });
    }
}
