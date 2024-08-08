USE [msdb]
GO

/****** Object:  Job [daily_insert_multiple_tables_brazil_commerce]    Script Date: 8/8/2024 4:04:36 PM ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 8/8/2024 4:04:36 PM ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'daily_insert_multiple_tables_brazil_commerce', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Data insert in the Orders, OrderItems,Customers, Payments, Reviews and Sellers tables within the BrazilCommerceDB database. The data insert is done every 4 hours.', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'LAPTOP-E44HM49P\ACER', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Bulk Insert TempCustomers]    Script Date: 8/8/2024 4:04:36 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Bulk Insert TempCustomers', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BULK INSERT TempCustomers
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\customers.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = '','',
ROWTERMINATOR = ''\n'',
TABLOCK,
FORMAT =  ''CSV''
)
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Insert into Customers]    Script Date: 8/8/2024 4:04:36 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert into Customers', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'INSERT INTO Customers (
CustomerID,
ZipCode,
City,
State
)
SELECT CustomerID,
t.ZipCode,
t.City,
t.State
FROM TempCustomers t
LEFT JOIN Customers c
ON t.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Bulk Insert Sellers]    Script Date: 8/8/2024 4:04:37 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Bulk Insert Sellers', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BULK INSERT Sellers
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\sellers.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = '','',
ROWTERMINATOR = ''\n'',
TABLOCK,
FORMAT =  ''CSV''
)
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Bulk Insert Orders]    Script Date: 8/8/2024 4:04:37 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Bulk Insert Orders', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BULK INSERT Orders
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\orders.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = '','',
ROWTERMINATOR = ''0x0a'',
TABLOCK,
FORMAT =  ''CSV''
)
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Bulk Insert TempOrderItems]    Script Date: 8/8/2024 4:04:37 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Bulk Insert TempOrderItems', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BULK INSERT TempOrderItems
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\order_items.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = '','',
ROWTERMINATOR = ''0x0a'',
TABLOCK,
FORMAT =  ''CSV''
)
;', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Insert Into OrderItems]    Script Date: 8/8/2024 4:04:37 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert Into OrderItems', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'INSERT INTO OrderItems (
OrderID,
ProductID,
SellerID,
ShippingLimitDate,
Price,
FreightValue
)
SELECT t.OrderID,
t.ProductID,
t.SellerID,
t.ShippingLimitDate,
t.Price,
t.FreightValue
FROM TempOrderItems t
LEFT JOIN OrderItems o
ON t.OrderID =o.OrderID
WHERE o.OrderID IS NULL
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Bulk Insert Payments]    Script Date: 8/8/2024 4:04:37 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Bulk Insert Payments', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BULK INSERT Payments
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\payments.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = '','',
ROWTERMINATOR = ''0x0a'',
TABLOCK,
FORMAT =  ''CSV''
)
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Bulk Insert TempReviews]    Script Date: 8/8/2024 4:04:37 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Bulk Insert TempReviews', 
		@step_id=8, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BULK INSERT TempReviews
FROM "C:\Users\ACER\Documents\GitHub\Brazilian-ecommerce\raw data\reviews.csv"
WITH (
FIRSTROW = 2,
FIELDTERMINATOR = '','',
ROWTERMINATOR = ''\n'',
TABLOCK,
FORMAT =  ''CSV''
)
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Insert into Reviews]    Script Date: 8/8/2024 4:04:37 PM ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert into Reviews', 
		@step_id=9, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'INSERT INTO Reviews (
ReviewID,
OrderID,
Score,
DateTimeStamp,
AnswerTimeStamp
)
SELECT ReviewID,
t.OrderID,
t.Score,
t.DateTimeStamp,
t.AnswerTimeStamp
FROM TempReviews t
LEFT JOIN Reviews r
ON t.ReviewID = r.ReviewID
WHERE r.ReviewID IS NULL
;
', 
		@database_name=N'BrazilCommerceDB', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Data Insert scheduling', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=8, 
		@freq_subday_interval=4, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20240814, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'bf5040ee-f7de-40e7-879d-db34b2f835d1'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO

