use campusx;
select * from insurance ;

/*
1. Show records of 'male' patient from 'southwest' region.
2. Show all records having bmi in range 30 to 45 both inclusive.
3. Show minimum and maximum bloodpressure of diabetic patient who smokes. Make column names as MinBP and MaxBP respectively.
4. Find no of unique patients who are not from southwest region.
5. Total claim amount from male smoker.
6. Select all records of south region.
7. No of patient having normal blood pressure. Normal range[90-120]
8. No of pateint below 17 years of age having normal blood pressure as per below formula -
    - BP normal range = 80+(age in years × 2) to 100 + (age in years × 2)

    - Note: Formula taken just for practice, don't take in real sense.
9. What is the average claim amount for non-smoking female patients who are diabetic?
10. Write a SQL query to update the claim amount for the patient with PatientID = 1234 to 5000.
11. Write a SQL query to delete all records for patients who are smokers and have no children.
*/

-- 1.
select * from insurance where gender='male' and region='southwest';

-- 2.
select * from insurance where bmi between 30 and 45;

-- 3.
select min(bloodpressure) as MinBP,max(bloodpressure) as MaxBP from insurance where diabetic='Yes' and smoker='Yes' ;

-- 4.
select count(distinct PatientID) from insurance where region!='southwest';

-- 5.
select sum(claim) from insurance where gender='male' and smoker='Yes';

-- 6.
select * from insurance where region like 'south%';

-- 7.
select count(*) from insurance where bloodpressure between 90 and 120;

-- 8.
SELECT COUNT(*) AS PatientCount
FROM insurance
WHERE age < 17
  AND bloodpressure BETWEEN (80 + age * 2)
                        AND (100 + age * 2);
                        
-- 9.
select avg(claim) from insurance where gender='female' and diabetic='Yes' and smoker='No';

-- 10.
update insurance 
set claim=5000 where PatientID=1234;
select * from insurance where PatientID=1234;

-- 11.
delete from insurance where smoker='Yes' and children=0;

SHOW FULL COLUMNS
FROM insurance;
/*
# MYSQL CASE SENSITIVITY NOTES

1. String Comparisons in MySQL

In most MySQL installations:

```
'Yes' = 'yes' = 'YES'
```

This happens because MySQL commonly uses Case-Insensitive Collations.

Examples:

```
SELECT * FROM insurance
WHERE smoker = 'Yes';

SELECT * FROM insurance
WHERE smoker = 'yes';
```

Both queries usually return the same result.

---

2. What is a Collation?

Collation controls how MySQL compares and sorts text.

Common Collations:

```
utf8mb4_general_ci
utf8mb4_unicode_ci
```

Where:

```
ci = Case Insensitive
```

Meaning:

```
'A' = 'a'
'Yes' = 'yes'
```

---

3. Case-Sensitive Collations

Examples:

```
utf8mb4_bin
utf8mb4_0900_as_cs
```

Where:

```
cs = Case Sensitive
```

Meaning:

```
'Yes' != 'yes'
```

In these collations, case matters.

---

4. Check Column Collation

   SHOW FULL COLUMNS
   FROM insurance;

Look at the "Collation" column.

---

5. Interview Best Practice

Even though MySQL may be case-insensitive:

```
smoker = 'yes'
```

usually works.

It is better to write values exactly as stored in the data:

```
smoker = 'Yes'
diabetic = 'No'
gender = 'Male'
```

Reason:

* Improves readability.
* Works across different databases.
* Avoids issues with case-sensitive collations.

---

6. Quick Interview Question

Q: Why does WHERE smoker='yes' give the same result as WHERE smoker='Yes'?

Answer:
Because the column is using a case-insensitive collation (ci), so MySQL treats 'yes' and 'Yes' as equal.

---

7. Placement Interview One-Liner

MySQL string comparisons are usually case-insensitive because most text columns use collations such as utf8mb4_general_ci or utf8mb4_unicode_ci. However, it is recommended to match the exact case of the stored data for portability and readability.
*/