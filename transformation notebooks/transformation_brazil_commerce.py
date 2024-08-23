#!/usr/bin/env python
# coding: utf-8

# ## transformation_brazil_commerce
# 
# New notebook

# In[14]:


from pyspark.sql.functions import *
from pyspark.sql.types import *

df_OrderItems = spark.read.table("LH_BrazilCommerce.dbo_OrderItems")
df_Orders = spark.read.table("LH_BrazilCommerce.dbo_Orders")
df_Payments = spark.read.table("LH_BrazilCommerce.dbo_Payments")


# In[15]:


df_OrderItems = df_OrderItems.withColumn("TotalCosts", col("Price") + col("FreightValue"))
df_Orders = df_Orders.withColumn("DeliveryDays", datediff(col("PurchaseTimeStamp"), col("CustomerDeliveryTimeStamp")))
df_Payments = df_Payments.withColumn("MonthlyPayments", col("Value") / col("Installments"))


# In[16]:


df_Payments = df_Payments.drop("Sequential")


# In[17]:


df_Payments.write.mode("overwrite").option("overwriteSchema", "true").saveAsTable("LH_BrazilCommerce.dbo_Payments")
df_Orders.write.mode("overwrite").option("overwriteSchema", "true").saveAsTable("LH_BrazilCommerce.dbo_Orders")
df_OrderItems.write.mode("overwrite").option("overwriteSchema", "true").saveAsTable("LH_BrazilCommerce.dbo_OrderItems")

