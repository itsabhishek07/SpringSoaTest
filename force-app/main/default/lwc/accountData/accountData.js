import { LightningElement } from 'lwc';
import Accdetails from '@salesforce/apex/RecentlyCreatedAccounts.getData';

export default class AccountData extends LightningElement {

    SearchResult;

   handleSearch({ }){
    Accdetails()
    .then(result =>{
        console.log('result is ',result);
        this.SearchResult = result;
    })
    .catch(error => {
        console.log('error happened ',error);
    });
   }
}