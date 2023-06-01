abstract class EventBloc2 {}

class Language {
  String string1;
  String codeNow;
  String co;
  String timKiem;
  String dichvu;
  String khamPhaGanBan;
  String xemThem;
  String xemThem1;
  String danhGiaCaoNhat;
  String gioiThieu;
  String hoTro;
  String gioHang;
  String ttTK;
  String thongBao;
  String dieuKhoan;
  String homNay;
  String ganDay;
  String locKQ;
  String xemBanDo;
  String boLoc;
  String loaiDV;
  String gia;
  String giaTu;
  String den;
  String phamVi;
  String chiSpaTrong;
  String sapXepTheo;
  String danhGiaTotNhat;
  String giaThapNhat;
  String khoangCachNganNhat;
  String danhSachYeuThich;
  String hienThi;
  String danhSach;
  String luoi;
  String apDung;
  String chiNhanh;
  String trangThai;
  String khoangCach;
  String thongTin;
  String danhGia;
  String diaChi;
  String chiDuong;
  String dienThoai;
  String website;
  String gioHoatDOng;
  String ngayThuong;
  String cuoiTuan;
  String lienHe;

  String chonLoaiDV;
  String chiTiet;
  String dvKhac;
  String muaGoi;
  String datLichNgay;
  String thongTinDichVu;
  String chonDV;
  String thuNho;
  String daHet;
  String datLich;
  String chonChiNhanh;
  String ngayThucHien;
  String gioGoiY;
  String yeuCauDacBiet;
  String maGiamGia;
  String tongThanhToan;
  String daThemVaoGioHang;
  String banDaThem;
  String camOnBan;
  String thanhToan;
  String timDVKhac;
  String dangNhap;
  String soDienThoai;
  String matKhau;
  String quenMK;
  String quenMK2;
  String dangKyTaiKhoan;
  String hoacDangNhap;
  String khiDangNhap;
  String khiDangKy;
  String dieuKhoanSuDung;
  String va;
  String chinhSachbaoMat;
  String cuaJoyBookie;
  String dangKy;
  String hoTen;
  String ngaySinh;
  String gioiTinh;
  String xacNhanMatKhau;
  String nam;
  String nu;
  String nhanEmail;
  String canhBao;
  String nhapMagiamGia;
  String phuongThucThanhToan;
  String theTinDung;
  String goiDaDat;
  String soThe;
  String ngayHetHan;
  String xemLichSu;
  String viMomo;
  String thanhToanBangDiem;
  String thongtinLienHe;
  String taoTaiKhoanMoi;
  String lichDaDat;
  String yeuThich;
  String dangKyDoiTac;
  String taiKhoan;
  String ngonNgu;
  String danhGiaCuaToi;
  String tinNhan;
  String uuDai;
  String ttHT;
  String cauHoiThuongGap;
  String string14;
  String caiDat;
  String dangXuat;
  String xinChao;
  String datThem;
  String caiDatThongBao;
  String nhanThongBao;
  String tat;
  String bat;
  String ttCN;
  String thayDoiMK;
  String matKhauCu;
  String matKhauMoi;
  String luuThayDoi;
  String spa;
  String lichSu;
  String dkDoiTac;
  String nhapTTDK;
  String tenSpa;
  String nguoiDaiDien;
  String fanpage;
  String gui;
  String vuiLongNhap;
  String maOTP;
  String nhap;

  Language({required String code})
      : string1 = code == 'en' ? 'English' : 'Tiếng Việt',
        co = code == 'en' ? 'coAnh.png' : 'coVN.png',
        codeNow = code == 'en' ? 'en' : 'vi',
        timKiem = code == 'en' ? '' : 'Tìm Kiếm',
        dichvu = code == 'en' ? 'Service' : 'Dịch Vụ',
        khamPhaGanBan =
            code == 'en' ? 'Explore around you' : 'Khám Phá Gần Bạn',
        xemThem = code == 'en' ? 'See more' : 'Xem Thêm',
        xemThem1 = code == 'en' ? 'See more' : 'Xem Thêm',
        danhGiaCaoNhat = code == 'en' ? 'Highest rated' : 'Đánh Giá Cao Nhất',
        gioiThieu = code == 'en' ? 'About' : 'Giới Thiệu',
        hoTro = code == 'en' ? 'Support' : 'Hỗ Trợ',
        gioHang = code == 'en' ? 'Cart' : 'Giỏ Hàng',
        ttTK = code == 'en' ? 'Account' : 'Thông Tin Tài Khoản',
        thongBao = code == 'en' ? 'Notifications' : 'Thông Báo',
        dieuKhoan =
            code == 'en' ? 'Terms and conditions' : 'Điều Khoản & Điều Kiện',
        homNay = code == 'en' ? '' : 'Hôm Nay',
        ganDay = code == 'en' ? '' : 'Gần đây',
        locKQ = code == 'en' ? 'Filters' : 'Lọc kết quả',
        xemBanDo = code == 'en' ? 'See map' : 'Xem bản đồ',
        boLoc = code == 'en' ? 'Clear' : 'Bỏ lọc',
        loaiDV = code == 'en' ? '' : 'Loại dịch vụ',
        gia = code == 'en' ? 'Price' : 'Giá',
        giaTu = code == 'en' ? '' : 'Giá từ',
        den = code == 'en' ? '' : 'đến',
        phamVi = code == 'en' ? '' : 'Phạm vi',
        chiSpaTrong = code == 'en' ? '' : 'Chỉ hiện spa còn trống',
        sapXepTheo = code == 'en' ? 'Sort by' : 'SẮP XẾP THEO',
        danhGiaTotNhat = code == 'en' ? '' : 'Đánh giá tốt nhất',
        giaThapNhat = code == 'en' ? '' : 'Giá thấp nhất',
        khoangCachNganNhat = code == 'en' ? '' : 'Khoảng cách ngắn nhất',
        danhSachYeuThich = code == 'en' ? '' : 'Danh sách yêu thích',
        hienThi = code == 'en' ? 'View' : 'HIỂN THỊ',
        danhSach = code == 'en' ? 'List' : 'DANH SÁCH',
        luoi = code == 'en' ? 'Grid' : 'LƯỚI     ',
        apDung = code == 'en' ? 'Apply' : 'ÁP DỤNG',
        chiNhanh = code == 'en' ? '' : 'Chi Nhánh',
        trangThai = code == 'en' ? 'Status' : 'Trạng Thái',
        khoangCach = code == 'en' ? 'Distance' : 'Khoảng Cách',
        thongTin = code == 'en' ? 'About' : 'THÔNG TIN',
        danhGia = code == 'en' ? 'Reviews' : 'ĐÁNH GIÁ',
        diaChi = code == 'en' ? '' : 'Địa Chỉ',
        chiDuong = code == 'en' ? '' : 'Chỉ đường',
        dienThoai = code == 'en' ? 'Phone number' : 'Điện Thoại ',
        website = code == 'en' ? '' : 'Website',
        gioHoatDOng = code == 'en' ? '' : 'Giờ Hoạt Động',
        ngayThuong = code == 'en' ? '' : 'Ngày thường',
        cuoiTuan = code == 'en' ? '' : 'Cuối tuần',
        lienHe = code == 'en' ? 'Contact' : 'LIÊN HỆ',
        chonLoaiDV = code == 'en' ? '' : 'Chọn loại dịch vụ',
        chiTiet = code == 'en' ? 'See more' : 'Chi Tiết',
        dvKhac = code == 'en' ? '' : 'Dịch Vụ Khác',
        muaGoi = code == 'en' ? 'Purchase package' : 'MUA GÓI',
        datLichNgay = code == 'en' ? 'Book now' : 'ĐẶT LỊCH NGAY',
        thongTinDichVu =
            code == 'en' ? 'About the service' : 'THÔNG TIN DỊCH VỤ',
        chonDV = code == 'en' ? '' : 'Chọn Dịch Vụ',
        thuNho = code == 'en' ? '' : 'Thu Nhỏ',
        daHet = code == 'en' ? '' : 'Đã hết',
        datLich = code == 'en' ? 'Book' : 'Đặt Lịch',
        chonChiNhanh = code == 'en' ? '' : 'Chọn chi nhánh',
        ngayThucHien = code == 'en' ? '' : 'Ngày Thực Hiện',
        gioGoiY = code == 'en' ? '' : 'Giờ Gợi Ý',
        yeuCauDacBiet = code == 'en' ? '' : 'Yêu Cầu Đặc Biệt',
        maGiamGia = code == 'en' ? '' : 'Mã giảm giá',
        tongThanhToan = code == 'en' ? '' : 'Tổng Thanh Toán',
        daThemVaoGioHang = code == 'en' ? '' : 'Đã Thêm Vào Giỏ Hàng',
        banDaThem = code == 'en'
            ? ''
            : 'Bạn đã thêm dịch vụ vào giỏ hàng, vui lòng thanh toán dịch vụ trước thời gian đặt lịch!',
        camOnBan =
            code == 'en' ? '' : 'Cảm ơn bạn đã sử dụng dịch vụ của Joy Bookie!',
        thanhToan = code == 'en' ? 'Payment' : 'Thanh toán',
        timDVKhac = code == 'en' ? 'Browse more services' : 'Tìm dịch vụ khác',
        dangNhap = code == 'en' ? 'Log in' : 'Đăng Nhập',
        soDienThoai = code == 'en' ? 'Phone number' : 'Số Điện Thoại',
        matKhau = code == 'en' ? '' : 'Mật Khẩu',
        quenMK = code == 'en' ? '' : 'Quên mật khẩu',
        quenMK2 = code == 'en' ? '' : 'Quên Mật Khẩu',
        dangKyTaiKhoan = code == 'en' ? '' : 'Đăng ký tài khoản',
        hoacDangNhap = code == 'en' ? '' : 'hoặc đăng nhập bằng',
        khiDangNhap = code == 'en' ? '' : 'Khi đăng nhập, tôi đồng ý với các',
        khiDangKy = code == 'en' ? '' : 'Khi đăng ký, tôi đồng ý với các',
        dieuKhoanSuDung =
            code == 'en' ? 'Terms and conditions' : ' Điều khoản sử dụng',
        va = code == 'en' ? '' : 'và',
        chinhSachbaoMat = code == 'en' ? '' : ' Chính sách bảo mật',
        cuaJoyBookie = code == 'en' ? '' : ' của Joy Bookie.',
        dangKy = code == 'en' ? '' : 'Đăng Ký',
        hoTen = code == 'en' ? 'Full name' : 'Họ Tên',
        ngaySinh = code == 'en' ? 'DOB' : 'Ngày Sinh',
        gioiTinh = code == 'en' ? 'Gender' : 'Giới Tính',
        xacNhanMatKhau = code == 'en' ? '' : 'Nhập lại mật khẩu',
        nam = code == 'en' ? '' : 'Nam',
        nu = code == 'en' ? '' : 'Nữ',
        nhanEmail = code == 'en'
            ? ''
            : 'Nhận email khuyến mãi độc quyền từ Joy Bookie. Có thể hủy đăng ký này về sau như đã nêu trong Chính sách bảo mật.',
        canhBao = code == 'en'
            ? ''
            : 'Số lượng tối đa có thể chọn: 3. Vui lòng nhập lại.',
        nhapMagiamGia = code == 'en' ? '' : 'Nhập mã giảm giá',
        phuongThucThanhToan = code == 'en' ? '' : 'Phương thức thanh toán',
        theTinDung = code == 'en' ? '' : 'Thẻ tín dụng / ghi nợ',
        goiDaDat = code == 'en' ? '' : 'Gói Đã Đặt',
        soThe = code == 'en' ? '' : 'Số Thẻ',
        ngayHetHan = code == 'en' ? '' : 'Ngày hết hạn',
        xemLichSu = code == 'en' ? '' : 'Xem lịch sử',
        viMomo = code == 'en' ? '' : 'Ví Momo',
        thanhToanBangDiem = code == 'en' ? '' : 'Thanh toán bằng điểm',
        thongtinLienHe = code == 'en' ? '' : 'Thông tin liên hệ',
        taoTaiKhoanMoi = code == 'en' ? '' : 'Tạo tài khoản mới',
        lichDaDat = code == 'en' ? '' : 'Lịch Đã Đặt',
        yeuThich = code == 'en' ? 'English' : 'Yêu Thích',
        dangKyDoiTac = code == 'en' ? 'English' : 'Đăng ký đối tác',
        taiKhoan = code == 'en' ? 'English' : 'Tài Khoản',
        ngonNgu = code == 'en' ? 'English' : 'Ngôn Ngữ',
        danhGiaCuaToi = code == 'en' ? 'English' : 'Đánh giá của tôi',
        tinNhan = code == 'en' ? 'English' : 'Tin nhắn',
        uuDai = code == 'en' ? 'English' : 'Ưu đãi',
        ttHT = code == 'en' ? 'English' : 'Trung tâm hỗ trợ',
        cauHoiThuongGap = code == 'en' ? 'English' : 'Câu hỏi thường gặp',
        string14 = code == 'en' ? 'English' : '',
        caiDat = code == 'en' ? 'English' : 'Cài đặt',
        dangXuat = code == 'en' ? 'English' : 'Đăng Xuất',
        xinChao = code == 'en' ? 'Hello' : 'Xin Chào',
        datThem = code == 'en' ? 'English' : 'Mua Thêm',
        caiDatThongBao = code == 'en' ? 'English' : 'Cài Đặt Thông Báo',
        nhanThongBao = code == 'en' ? 'English' : 'Nhận thông báo',
        tat = code == 'en' ? 'English' : 'Tắt',
        ttCN = code == 'en' ? 'English' : 'Thông Tin Cá Nhân',
        thayDoiMK = code == 'en' ? 'English' : 'Thay Đổi Mật Khẩu',
        matKhauCu = code == 'en' ? 'English' : 'Mật khẩu cũ',
        matKhauMoi = code == 'en' ? 'English' : 'Mật khẩu mới',
        luuThayDoi = code == 'en' ? 'English' : 'Lưu thay đổi',
        spa = code == 'en' ? 'English' : 'Spa & Salon',
        lichSu = code == 'en' ? 'English' : 'Lịch Sử',
        dkDoiTac = code == 'en' ? 'English' : 'Đăng Ký Trở Thành Đối Tác',
        nhapTTDK = code == 'en' ? 'English' : 'Nhập Thông Tin Để Đăng Ký',
        tenSpa = code == 'en' ? 'English' : 'Tên Spa',
        nguoiDaiDien = code == 'en' ? 'English' : 'Người Đại Diện',
        fanpage = code == 'en' ? 'English' : 'Fanpage (nếu có)',
        gui = code == 'en' ? 'English' : 'GỬI',
        vuiLongNhap = code == 'en' ? 'English' : 'Vui lòng nhập mã OTP đã được gửi tới số điện thoại của Quý khách để xác thực',
        maOTP = code == 'en' ? 'English' : 'Mã OTP của quý khách',
        nhap = code == 'en' ? 'English' : 'Nhập',

        bat = code == 'en' ? 'English' : 'Bật';
}

class getLang extends EventBloc2 {}

class sangE extends EventBloc2 {}

class sangVn extends EventBloc2 {}
