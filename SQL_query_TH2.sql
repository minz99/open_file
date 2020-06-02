INSERT INTO KHACHHANG VALUES('KH0001', N'Hoàng Thùy Linh', 'GD0001', N'Hồ Chí Minh', '', '', ''),
							('KH0002', N'Lê Thị Thành Đạt', 'GD0002', N'Bình Định', '', '', ''),
							('KH0003', N'Phạm Khanh', 'GD0003', N'Quy Nhơn', '', '', ''),
							('KH0004', N'Nguyễn Bành', 'GD0004', N'Tào Lao', '', '', ''),
							('KH0005', N'Quốc Màn Tang', 'GD0005', N'Mẽo', '', '', '')

INSERT INTO NHANVIEN VALUES ('NV0001', N'Lê Minh', N'Khang', '2001-05-16', '2019-12-29', N'Phước Nghĩa', '', '', ''),
							('NV0002', N'Nguyễn Hoàng', N'Thành', '2000-01-25', '2019-12-29', N'Phước Thành', '', '', ''),
							('NV0003', N'Cao Minh', N'Nhật', '2000-02-28', '2019-12-29', N'Phước Quang', '', '', ''),
							('NV0004', N'Hàn Thanh', N'Đa', '2001-12-05', '2019-12-29', N'Phước Thắng', '', '', ''),
							('NV0005', N'Quất Chí', N'Tài', '2000-10-02', '2019-12-29', N'Phước Thuận', '', '', '')

INSERT INTO DONDATHANG VALUES ('10001', 'KH0001', 'NV0001', '2020-06-13', '2019-06-14', '2019-06-15', N'Hồ Chí Minh'),
							  ('10002', 'KH0001', 'NV0002', '2020-01-20', '2020-01-21', '2020-01-22', N'Hồ Chí Minh'),
							  ('10003', 'KH0002', 'NV0001', '2020-02-24', '2020-03-25', '2020-01-26', N'Bình Định'),
							  ('10004', 'KH0003', 'NV0003', '2020-01-05', '2020-01-06', '2020-01-07', N'Quy Nhơn'),
							  ('10005', 'KH0004', 'NV0004', '2020-03-09', '2020-03-10', '2020-03-11', N'Tào Lao'),
							  ('10006', 'KH0005', 'NV0005', '2020-04-17', '2020-04-18', '2020-04-19', N'Mẽo')

INSERT INTO NHACUNGCAP VALUES ('CT0001', N'Công ty Bia Sài Gòn', 'GD0001', N'Hồ Chí Minh', '', '', ''),
							  ('CT0002', N'Công ty Chăn nuôi Gà Minh Dư', 'GD0002', N'Bình Định', '', '', ''),
							  ('CT0003', N'Công ty phần mềm FPT', 'GD0003', N'Hà Nội', '', '', ''),
							  ('CT0004', N'Công ty TNHH nửa thành viên', 'GD0004', N'Mẽo', '', '', ''),
							  ('CT0005', N'Công ty bán Đậu hũ Đậu que', 'GD0005', N'Đà Lạt', '', '', '')

INSERT INTO LOAIHANG VALUES ('LH0001', N'Bia'),
							('LH0002', N'Trứng'),
							('LH0003', N'Gà'),
							('LH0004', N'Phần mềm'),
							('LH0005', N'Nửa'),
							('LH0006', N'Bún')
INSERT INTO MATHANG VALUES ('MH0001', N'Bia Sài Gòn', 'CT0001', 'LH0001', 60, N'kết', 23000000),
							('MH0002', N'Trứng Gà', 'CT0002', 'LH0002', 250, N'quả', 3500000),
							('MH0003', N'Gà nguyên con', 'CT0002', 'LH0003', 200, N'con', 1000000),
							('MH0004', N'Phần mềm chỉnh', 'CT0003', 'LH0004', 1, N'none', 20000000),
							('MH0005', N'Vầng trăng', 'CT0004', 'LH0005', 1, N'nửa', 999999),
							('MH0006', N'Bún đậu mắm tôm', 'CT0005', 'LH0006', 51, N'bịch', 3000000)
INSERT INTO CHITIETDATHANG VALUES (10001, 'MH0001', 50000, 20, 5),
								  (10002, 'MH0002', 900000, 2, 0.3),
								  (10003, 'MH0003', 60000, 5, 1),
								  (10004, 'MH0004', 60000, 5, 1),
								  (10005, 'MH0005', 60000, 5, 1)
--1. danh sách các đối tác cung cấp hàng cho công ty 
SELECT MACONGTY, TENCONGTY
FROM NHACUNGCAP
--2. Mã hàng, tên hàng và số lượng của các mặt hàng hiện có trong công ty 
SELECT MAHANG, TENHANG, COUNT(MH.MAHANG) AS SO_HANG
FROM MATHANG MH
GROUP BY MH.MAHANG, MH.TENHANG
--3. Họ tên, địa chỉ và năm bắt đầu làm việc của các nhân viên trong cty 
SELECT HO, TEN, DIACHI,FORMAT(NV.NGAYLAMVIEC, 'dd-MM-yyyy') AS NGAYLAMVIEC
FROM NHANVIEN NV
--4. Địa chỉ, điện thoại của nhà cung cấp có tên giao dịch VINAMILK 
SELECT DIACHI, DIENTHOAI
FROM NHACUNGCAP
WHERE TENGIAODICH like 'GD0004'
--5. Mã và tên của các mặt hàng có giá trị lớn hơn 2000000 và số lượng hiện có ít hơn 100 
SELECT MAHANG, TENHANG
FROM MATHANG
WHERE GIAHANG > 2000000 AND SOLUONG <100
--6. Cho biết mỗi mặt hàng trong công ty do ai cung cấp
SELECT MH.MAHANG, MH.TENHANG, NCC.TENCONGTY
FROM MATHANG MH JOIN NHACUNGCAP NCC
ON MH.MACONGTY = NCC.MACONGTY
--7. Công ty Việt Tiến đã cung cấp những mặt hàng nào 
SELECT MH.MAHANG, MH.TENHANG, NCC.TENCONGTY
FROM MATHANG MH JOIN NHACUNGCAP NCC
ON MH.MACONGTY = NCC.MACONGTY
WHERE NCC.TENCONGTY LIKE 'Công ty Bia Sài Gòn'
--8. Loại hàng thực phẩm do những công ty nào cung cấp, địa chỉ của công ty đó 
--9. Những khách hàng nào (tên giao dịch) đã đặt mua mặt hàng sữa hộp của công ty 
--10. Đơn đặt hàng số 1 do ai đặt và do nhân viên nào lập, thời gian và địa điểm giao hàng là ở đâu 
--11. Hãy cho biết số tiền lương mà công ty phải trả cho mỗi nhân viên là bao nhiêu (lương=lương cơ bản+phụ cấp) 
--12. Trong đơn đặt hàng số 3 đặt mua những mạt hàng nào và số tiền mà khách hàng phải trả cho
-- mỗi mặt hàng là bao nhiêu(số tiền phải trả=số lượng x giá bán – số lượng x giá bán x mức giảm giá/100) 
--13. Hãy cho biết có những khách hàng nào lại chính là đối tác cung cấp hàng cho công ty (tức là có cùng tên giao dịch)
--14. Trong công ty có những nhân viên nào có cùng ngày sinh 
--15. Những đơn hàng nào yêu cầu giao hàng ngay tại công ty đặt hàng và những đơn đó là của công ty nào 
--16. Cho biết tên công ty, tên giao dịch, địa chỉ và điện thoại của các khách hàng và nhà cung cấp hàng cho công ty 
--17. Những mặt hàng nào chưa từng được khách hàng đặt mua 
--18. Những nhân viên nào của công ty chưa từng lập hóa đơn đặt hàng nào 
--19. Những nhân viên nào của công ty có lương cơ bản cao nhất 
--20. Tổng số tiền mà khách hàng phải trả cho mỗi đơn đặt hàng là bao nhiêu 
--21. Trong năm 2006 những mặt hàng nào đặt mua đúng một lần 
--22. Mỗi khách hàng phải bỏ ra bao nhiêu tiền để đặt mua hàng của công ty 
--23. Mỗi nhân viên của công ty đã lập bao nhiêu đơn đặt hàng (nếu chưa hề lập hóa đơn nào thì cho kết quả là 0) 
--24. Tổng số tiền hàng mà công ty thu được trong mỗi tháng của năm 2006 (thời gian được tính theo ngày đặt hàng) 
--25. Tông số tiền lời mà công ty thu được từ mỗi mặt hàng trong năm 2006 
--26. Số lượng hàng còn lại của mỗi mặt hàng mà công ty đã có (tổng số lượng hàng hiện có và đã bán) 
--27. Nhân viên nào của công ty bán được số lượng hàng nhiều nhất và số lượng hàng bán được của mhữmg
-- nhân viên này là bao nhiêu 
--28. Đơn đặt hàng nào có số lượng hàng được đặt mua ít nhất 
--29. Số tiền nhiều nhất mà khách hàng đã từng bỏ ra để đặt hàng trong các đơn đặt hàng là bao nhiêu 
--30. Mỗi một đơn đặt hàng đặt mua những mặt hàng nào và tổng số tiền của đơn đặt hàng 
--31. Mỗi một loại hàng bao gồm những mặt hàng nào, tổng số lượng của mỗi loại và tổng số lượng của tất cả
-- các mặt hàng hiện có trong cty 
--32.Thông kê trong năm 2006 mỗi một mặt hàng trong mỗi tháng và trong cả năm bán được với số 
-- lượng bao nhiêu (Yêu cầu kết quả hiểu thị dưới dạng bảng, hai cột đầu là mã hàng, tên hàng, các cột
-- còn lại tương ứng từ tháng 1 đến tháng 12 và cả năm. Như vậy mỗi dòng trong kết quả cho biết
--============UPDATE
-- số lượng hàng bán được mỗi tháng và trong cả năm của mỗi mặt hàng 
--33. Cập nhật lại giá thị trường NGAYCHUYENHANG của những bản ghi có NGAYCHUYENHANG 
-- chưa xác định (NULL) trong bảng DONDATHANG bằng với giá trị của trường NGAYDATHANG 
--34. Tăng số lượng hàng của những mặt hàng do công ty VINAMILK cung cấp lên gấp đôi 
--35. Cập nhật giá trị của trường NOIGIAOHANG trong bảng DONDATHANG bằng địa chỉ của khách hàng đối với
-- những đơn đặt hàng chưa xác định được nơi giao hàng (giá trị trường NOIGIAOHANG bằng NULL).
--36. Cập nhật lại dữ liệu trong bảng KHACHHANG sao cho nếu tên công ty và tên giao dịch của khách
-- hàng trùng với tên công ty và tên giao dịch của một nhà cung cấp nào đó thì địa chỉ, điện thoại,
-- fax và e-mail phải giống nhau
--37. Tăng lương lên gấp rưỡi cho những nhân viên bán được số lượng hàng nhiều hơn 100 trong năm 2003. 
--38. Tăng phụ cấp lên bằng 50% lương cho những nhân viên bán được hàng nhiều nhất. 
--39. Giảm 25% lương của những nhân viên trong năm 2003 không lập được bất kỳ đơn đặt hàng nào. 
--40. Giả sử trong bảng DONDATHANG có thêm trường SOTIEN cho biết số tiền mà khách 
-- hàng phải trả trong mỗi đơn đặt hàng. Hãy tính giá trị cho trường này.
--=============DELETE
--41. Xoá khỏi bảng NHANVIEN những nhân viên đã làm việc trong công ty quá 40 năm. 
--42. Xoá những đơn đặt hàng trước năm 2000 ra khỏi cơ sở dữ liệu. 
--43. Xoá khỏi bảng LOAIHANG những loại hàng hiện không có mặt hàng. 
--44. Xoá khỏi bảng KHACHHANG những khách hàng hiện không có bất kỳ đơn đặt hàng nào cho công ty.
--45. Xoá khỏi bảng MATHANG những mặt hàng có số lượng bằng 0 và không được đặt mua trong bất kỳ đơn đặt hàng nào. 