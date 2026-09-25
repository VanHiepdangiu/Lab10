/* Lab 10 - Entity Framework Core Database First
   Sinh viên: Nguyễn Văn Hiệp - 2410900035 - K24CNT1 */
IF DB_ID(N'lab10Db') IS NULL CREATE DATABASE lab10Db;
GO
USE lab10Db;
GO
IF OBJECT_ID(N'dbo.TvcMember', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.TvcMember (
        Id BIGINT IDENTITY(1,1) PRIMARY KEY,
        TvcUserName VARCHAR(20) NULL,
        TvcPassword VARCHAR(50) NULL,
        TvcFullName NVARCHAR(50) NULL,
        TvcEmail VARCHAR(50) NULL,
        TvcPhone CHAR(12) NULL,
        TvcStatus BIT NULL
    );
END;
GO
IF NOT EXISTS (SELECT 1 FROM dbo.TvcMember)
BEGIN
    INSERT INTO dbo.TvcMember(TvcUserName,TvcPassword,TvcFullName,TvcEmail,TvcPhone,TvcStatus) VALUES
    ('nguyenvanhiep','123456',N'Nguyễn Văn Hiệp - 2410900035','hiep2410900035@gmail.com','0988089376',1),
    ('tranthib','123456',N'Trần Thị Bình','tranthib@example.com','0901234567',1);
END;
GO
SELECT * FROM dbo.TvcMember;
GO

/* Lệnh scaffold tham khảo (Package Manager Console):
Scaffold-DbContext "Name=ConnectionStrings:TvcLesson10EfConnectionString" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models -Context TvcLesson10EfdbContext -Force
*/
