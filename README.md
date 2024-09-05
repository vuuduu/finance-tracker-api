# finance-tracker-api
Contains all the api endpoints for a full stack finance application

## Finance Tracker Schema 
### Revision 1
![image](https://github.com/user-attachments/assets/d5ba4046-aee6-4698-8ebb-8a27b1473cac)

### Revision 2
![image](https://github.com/user-attachments/assets/4904eaa2-d492-4a0f-9654-2190f483d480)


## Finance Tracker Table and Description
* **Tracker_Account Table**
  * ta_id ⇒ (Primary Key), identifier
  * username ⇒ (Unique)
  * password
  * account_name 

* **Monthly_racker Table**
  * mt_id ⇒ (Primary Key), identifier
  * ta_id ⇒ (Foreign Key), tracker account id
  * month ⇒ (Unique)
  * year ⇒ (Unique)
  * memo ⇒ a field to hold texts

* **Bank Account Table**
  * ba_id ⇒ (Primary Key), identifier
  * balance ⇒ how much does the account have
  * account_type ⇒ is it saving, checking, investment, etc…
  * last_update ⇒ 
  * memo

* **Credit_Card Table**
  * cc_id ⇒ (Primary Key), identifier
  * cc_type ⇒ (UNIQUE), what kind of credit card? Discover, Bilt, Capital One
  * credit_limit ⇒ amount that you allow to spend
  * balance ⇒ amount that one have spent so far
  * year_opened ⇒ when was it first opened

* Income_Transaction Table
  * it_id ⇒ (Primary Key), income transaction id
  * mt_id ⇒ (Foreign Key), monthly transaction id
  * date ⇒ when this transaction was made
  * source ⇒ where is it coming from
  * amount
  * ic_id ⇒ (Foreign Key), income category id
  * account_to ⇒ (Foreign Key), where does this transaction go to. 
  * memo ⇒ notes

* Income_Category Table
  * ic_id ⇒ (Primary Key)
  * category_name ⇒ List of categories that are specific to income transaction

* Expense_Transaction Table
  * et_ic ⇒ (Primary Key), expense transaction id
  * mt_id ⇒ (Foreign Key), monthly tracker id
  * date ⇒ when this transaction was made
  * vendor ⇒ where does the payment go to
  * amount
  * ec_id ⇒ (Foreign Key), expense category id
  * card_use ⇒ (Foreign Key)
  * memo

* Expense_Category Table
  * ec_id ⇒ (Primary Key), expense category id
  * category_name ⇒ List of categories that are specific to expense transaction

* Payoff_Transaction Table
  * pt_id ⇒ (Primary Key), payoff transaction id
  * mt_id ⇒ (Foreign Key), monthly tracker id
  * date
  * amount
  * pc_id ⇒ (Foreign Key), payoff category id
  * account_from ⇒ (Foreign Key), from which account does this payment coming from
  * account_to ⇒ (Foreign Key), from which account does this payment going to
  * memo

* **Payoff_Category Table*8
  * pc_id ⇒ (Primary Key)
  * category_name ⇒ List of categories that are specific to payoff transaction

