# Lab 10 - Entity Framework Core Database First

**Sinh viên:** Nguyễn Văn Hiệp — **MSSV:** 2410900035 — **Lớp:** K24CNT1  
Theo CodeDemo `TvcLesson10EFDbFirst`: https://github.com/tvchung/k24cnt1_netcore

## Nội dung
- Model và DbContext được sinh theo Database First.
- EF Core SQL Server.
- CRUD thành viên bất đồng bộ: List, Create, Details, Edit, Delete.
- Anti-forgery và Bind chống overposting.
- File SQL tạo `lab10Db` và bảng `TvcMember`.
- Chế độ InMemory trong Development để chạy demo không cần SQL Server.

## Chạy demo
Mở `lab10.sln`, Build rồi F5. `appsettings.Development.json` đang bật InMemory.

## Chạy SQL Server thật
1. Chạy `lab10/Database/TvcLesson10EFDb.sql`.
2. Sửa connection string trong `appsettings.json`.
3. Đổi `UseInMemoryDatabase` thành `false`.
