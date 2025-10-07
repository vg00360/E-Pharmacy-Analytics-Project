# E-Pharmacy Analytics Project

## Overview
This project demonstrates end-to-end **customer churn prediction and digital marketing analytics** for a fictional e-pharmacy.  
It uses MySQL for data storage and feature engineering, Python for predictive modeling, and prepares dashboards for Power BI.

## Dataset
- `customers`: >100 rows with signup date, city, age group, chronic condition, first-touch channel.
- `products`: >50 products with category, price, prescription requirement.
- `orders`: >300 orders linking customers to products, including promo codes.
- `digital_marketing`: >120 campaigns with clicks, impressions, cost, promo codes.

## Methodology
1. **Data Cleaning & Feature Engineering** – done in SQL:
   - RFM features, avg days between orders, promo usage %, prescription rate, recency, tenure, churn label.
2. **Predictive Modeling** – Python:
   - Logistic Regression with preprocessing pipeline.
   - ROC-AUC and classification report evaluation.
3. **Export Predictions** – MySQL table `customer_churn_predictions`.
4. **Visualization / Dashboarding** – Power BI:
   - KPIs: Churn %, Total Customers, Avg Revenue.
   - RFM Segments, Geographic Insights, Digital Marketing ROI & CAC.

## Tools & Tech
- MySQL, SQL
- Python: Pandas, scikit-learn, SQLAlchemy
- Power BI

## Business Impact
- Identifies high-risk churn customers (ROC-AUC ~0.82).  
- Customers with chronic conditions are 30% less likely to churn.  
- Optimized marketing spend: Google Ads ROI 120%, Email CAC ₹450/customer.  
- Targeted retention campaigns can potentially save ₹2.5 lakh/month in lost revenue.
