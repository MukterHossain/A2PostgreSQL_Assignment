
# A2PostrgeSQL_Assignment

--

## Answer 7 question in bangla

### 1. What is PostgreSQL?
**উত্তর:**
**PostgreSQL** হলো একটি শক্তিশালী, ওপেন সোর্স Relational Database Management System(RDBMS), যেটি SQL ও আধুনিক ডেটাবেস ফিচার যেমন: ট্রানজ্যাকশন, স্টোরড প্রসিডিউর, ইনডেক্সিং এবং JSON ডাটা সমর্থন করে। এটি নির্ভরযোগ্য ও একাধিক প্লাটফর্মে ব্যবহারযোগ্য।


### 2. What is purpose of a database schema in PostgreSQL?
**উত্তর:**
**Schema** হলো ডেটাবেসের মধ্যে একটি লজিক্যাল গোষ্ঠী, যেখানে টেবিল, ভিউ, ফাংশন ও অন্যান্য অবজেক্ট থাকে।
###### Schema ব্যবহারের উদ্দেশ্য:
* অবজেক্টকে সংগঠিত রাখা
* একাধিক ইউজার বা অ্যাপ্লিকেশনের জন্য পৃথক জায়গা তৈরি করা
* নাম সংঘর্ষ (naming conflict) এড়ানো
  

### 3. What is purpose of a database schema in PostgreSQL?
**উত্তর:**
**Primary Key:** --
**Primary Key** একটি টেবিলের এমন কলাম বা কলাম সমষ্টি, যা প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে। এটি কখনো **NULL** হতে পারে না। 
* **উদাহরণ:** 
CREATE TABLE users (
Id SERIAL PRIMAR KEY,
Name VARCHAR(50)
); 

**Foreign Key:**
**Foreign Key** একটি টেবিলের এমন কলাম যা অন্য টেবিলের Primary Key এর উপর নির্ভরশীল। এটি টেবিলগুলোর মধ্যে সম্পর্ক স্থাপন করে। 
* **উদাহরণ:** 
CREATE TABLE posts(
Id SERIAL PRIMARY KEY,
Users_id INT REFERENCES users(id)
);

### 5. Explain the purpose of the **WHERE** clause in a **SELECT** statement.
**উত্তর:**
**WHERE** ক্লজ ব্যবহার করা হয় টেবিল থেকে নির্দিষ্ট শর্ত অনুযায়ী ডেটা ফিল্টার করতে।
* **উদাহরণ**: 
SELECT * FROM users WHERE age > 20;

* এই কোয়েরি শুধুমাত্র 20 বছরের উপরে যাদের বয়স তাদের রেকর্ড দেখাবে।

### 6. What are the **LIMIT** and **OFFSET** clauses used for?
**উত্তর:**
* **LIMIT** : কতটি রেকর্ড বা ডাটা ফেরত আসবে তা নির্ধারণ করে।
* **OFFSET**: কতটি রেকর্ড বা ডাটা  স্কিপ করা হবে তা নির্ধারণ করে।

**উদাহরণ**: 
  SELECT * FROM users LIMIT 3 OFFSET 5 ;

* এই কোয়েরি 6 থেকে 8 পর্যন্ত রেকর্ড দেখাবে।

### 7. How can you modify data using **UPDATE** statements?
**উত্তর:**
SQL ডাটাবেজে **UPDATE** একটি গুরুত্বপূর্ণ কি ওয়ার্ড। UPDATE দিয়ে টেবিলের বিদ্যমান ডেটা পরিবর্তন করা যায়।
**উদাহরণ**:
UPDATE users
SET name = ‘Siraj Uddin’
WHERE id = 2;
* এখানে  id = 2 ইজারের নাম পরিবর্তন করা হচ্ছে।



### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
**উত্তর**:
SQL ডাটাবেজে JOIN  দিয়ে একাধিক টেবিলের মধ্যে সম্পর্ক তৈরি করে ডেটা  একসাথে দেখা যায়।
**Common types**:
* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
**উদাহরণ**:
SELECT users.name, posts.name
FROM users
JOIN posts ON users.id = posts.user_id

*এখানে  দুইটি টেবিল থেকে সম্পর্কযুক্ত তথ্য  নিচ্ছি।
