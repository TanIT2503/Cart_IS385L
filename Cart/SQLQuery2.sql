﻿SELECT [kh.EMAIL], [kh.FULLNAME], [kh.ADDRESS], [kh.PHONENUMBER], [hd.TENSP], [hd.DONGIA], [hd.SOLUONG], [hd.TONGTIEN], [hd.NGAYDAT], [hd.TOTAL] FROM [HOADON] as hd JOIN [ACCOUNTS] as kh on [hd.EMAIL]=[kh.EMAIL]