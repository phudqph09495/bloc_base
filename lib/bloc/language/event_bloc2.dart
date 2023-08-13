abstract class EventBloc2 {}

class Language {
  String string1;
  String myRatting;
  String upload;
  String taxNumber;
  String representative;
  String email;
  String fanpageOrWebsite;
  String phoneNumber;
  String picture;
  String doYouWantDeleteAccount;
  String deleteAccount;
  String khong;
  String dongY;
  String codeNow;
  String co;
  String timKiem;
  String dichvu;
  String khamPhaGanBan;
  String xemThem;
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
  String danhGiaDichVu;
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
  String ttHT2;
  String cauHoiThuongGap;
  String timHieuThem;
  String caiDat;
  String danhGia2;
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
  String nhapLaiMatKhauMoi;
  String luuThayDoi;
  String spa;
  String lichSu;
  String dkDoiTac;
  String nhapTTDK;
  String tenSpa;
  String nguoiDaiDien;
  String gui;
  String vuiLongNhap;
  String maOTP;
  String nhap;
  String maDatLich;
  String xemthemMaDatLich;
  String soBooking;
  String luuY;
  String day;
  String xemthemDV;
  String xacnhanBooking;
  String vuiLongKT;
  String huyBo;
  String xacNhan;
  String commomViewCart;
  String acceptTermsAndConditions;
  String successConfirm;
  String dichVuDaXacNhan;
  String goHome;
  String myService;
  String target;
  String commonAsk;
  String lamSaoDatLich;
  String toiCoTheHuyDichVu;
  String thanhToanAnToan;
  String serviceQuestion;
  String comeBack;
  String plsConnectToNetwork;
  String youDoNotHaveNetwork;
  String later;
  String tksForUseMyService;
  String plsRattingForHelpUs;
  String emptyData;
  String searchMoreSpaAndSalon;
  String getNotifications;
  String plsJustChoiseOneServiec;
  String chatLuongDV;
  String themHinhAnh;
  String guiDanhGia;
  String noidung;
  String vietDanhGia;
  String uuDaiThanhVien;
  String uuDaiKhac;
  String uuDaiThanhVienMoi;
  String nhanNgay;
  String levelMemBer;
  String quan;

  Language({required String code})
      : string1 = code == 'en' ? 'English' : 'Tiếng Việt',
        quan = code == 'en' ? 'district' : "Quận",
        levelMemBer = code == 'en' ? 'Level MemBer' : 'Hạng Thành Viên',
        nhanNgay = code == 'en' ? 'Get now' : 'Nhận Ngay',
        uuDaiThanhVienMoi =
            code == 'en' ? 'Sale New Member' : 'Ưu đãi thành viên mới',
        uuDaiThanhVien = code == 'en' ? 'Sale Member' : 'Ưu Đãi Thành Viên',
        uuDaiKhac = code == 'en' ? 'Sale Other' : 'Ưu Đãi Khác',
        plsJustChoiseOneServiec = code == 'en'
            ? 'Please select only 1 spa or salon at a time.'
            : 'Vui lòng chỉ chọn 1 spa hoặc salon trong một lần thanh toán.',
        myRatting = code == 'en' ? 'My Ratting' : 'Đánh giá của tôi',
        noidung = code == 'en' ? '' : 'Nội dung',
        chatLuongDV = code == 'en' ? 'Rating' : 'Chất lượng dịch vụ',
        themHinhAnh = code == 'en' ? 'Add images' : 'Thêm hình ảnh',
        guiDanhGia = code == 'en' ? 'Send review' : 'Gửi đánh giá',
        nhapLaiMatKhauMoi =
            code == 'en' ? 'ReEnter the password' : 'Nhập lại mật khẩu',
        vietDanhGia = code == 'en' ? 'Write your comment' : 'Viết đánh giá',
        danhGiaDichVu = code == 'en' ? 'Review service' : 'Đánh giá dịch vụ',
        upload = code == 'en' ? 'Upload' : 'Tải lên',
        representative = code == 'en' ? 'Representative' : 'Người đại diện',
        email = code == 'en' ? 'Email' : 'Email',
        phoneNumber = code == 'en' ? 'Phone Number' : 'Số điện thoại',
        fanpageOrWebsite =
            code == 'en' ? 'Fanpage Or Website' : 'Fanpage hoặc website',
        picture = code == 'en' ? 'Picture' : 'Ảnh',
        taxNumber = code == 'en' ? 'Tax Number' : 'Mã số thuế',
        co = code == 'en' ? 'coAnh.png' : 'coVN.png',
        codeNow = code == 'en' ? 'en' : 'vi',
        timKiem = code == 'en' ? 'Search' : 'Tìm kiếm...',
        dichvu = code == 'en' ? ' Service ' : '  Dịch Vụ  ',
        khamPhaGanBan =
            code == 'en' ? 'Explore around you' : 'Khám Phá Gần Bạn',
        xemThem = code == 'en' ? 'See more' : 'Xem Thêm',
        danhGiaCaoNhat = code == 'en' ? 'Highest rated' : 'Đánh Giá Cao Nhất',
        gioiThieu = code == 'en' ? 'About' : 'Giới Thiệu',
        hoTro = code == 'en' ? 'Support' : 'Hỗ Trợ',
        gioHang = code == 'en' ? 'Cart' : 'Giỏ Hàng',
        ttTK = code == 'en' ? 'Account' : 'Thông Tin Tài Khoản',
        thongBao = code == 'en' ? 'Notifications' : 'Thông Báo',
        dieuKhoan =
            code == 'en' ? 'Terms and conditions' : 'Điều Khoản & Điều Kiện',
        homNay = code == 'en' ? 'Today' : 'Hôm Nay',
        ganDay = code == 'en' ? 'Recently' : 'Gần đây',
        locKQ = code == 'en' ? 'Filters' : 'Lọc kết quả',
        xemBanDo = code == 'en' ? 'See map' : 'Xem bản đồ',
        boLoc = code == 'en' ? 'Clear' : 'Bỏ lọc',
        loaiDV = code == 'en' ? 'Type Of Service' : 'Loại dịch vụ',
        gia = code == 'en' ? 'Price' : 'Giá',
        giaTu = code == 'en' ? 'Price from' : 'Giá từ',
        den = code == 'en' ? 'to' : 'đến',
        phamVi = code == 'en' ? 'Limit' : 'Phạm vi',
        chiSpaTrong = code == 'en'
            ? 'Only spa is available now'
            : 'Chỉ hiện spa còn trống',
        sapXepTheo = code == 'en' ? 'Sort by' : 'SẮP XẾP THEO',
        danhGiaTotNhat = code == 'en' ? 'Best Rating' : 'Đánh giá tốt nhất',
        giaThapNhat = code == 'en' ? 'Lowest price' : 'Giá thấp nhất',
        khoangCachNganNhat =
            code == 'en' ? 'Shortest Distance' : 'Khoảng cách ngắn nhất',
        danhSachYeuThich =
            code == 'en' ? 'Favourite List' : 'Danh sách yêu thích',
        hienThi = code == 'en' ? 'View' : 'HIỂN THỊ',
        danhSach = code == 'en' ? 'List' : 'DANH SÁCH',
        luoi = code == 'en' ? 'Grid' : 'LƯỚI     ',
        apDung = code == 'en' ? 'Apply' : 'ÁP DỤNG',
        chiNhanh = code == 'en' ? 'Branch' : 'Chi Nhánh',
        trangThai = code == 'en' ? 'Status' : 'Trạng Thái',
        khoangCach = code == 'en' ? 'Distance' : 'Khoảng Cách',
        thongTin = code == 'en' ? 'About' : 'THÔNG TIN',
        danhGia = code == 'en' ? 'Reviews :' : 'ĐÁNH GIÁ',
        danhGia2 = code == 'en' ? 'Reviews' : 'Đánh giá',
        diaChi = code == 'en' ? 'Location' : 'Địa Chỉ',
        chiDuong = code == 'en' ? 'Direct' : 'Chỉ đường',
        dienThoai = code == 'en' ? 'Phone number' : 'Điện Thoại ',
        website = code == 'en' ? 'Website' : 'Website',
        gioHoatDOng = code == 'en' ? 'Hours of Operation' : 'Giờ Hoạt Động',
        ngayThuong = code == 'en' ? 'Weekdays' : 'Ngày thường',
        cuoiTuan = code == 'en' ? 'Weekend' : 'Cuối tuần',
        lienHe = code == 'en' ? 'Contact' : 'LIÊN HỆ',
        chonLoaiDV = code == 'en' ? 'Select Service Type' : 'Chọn loại dịch vụ',
        chiTiet = code == 'en' ? 'See more' : 'Chi Tiết',
        dvKhac = code == 'en' ? 'Other services' : 'Dịch Vụ Khác',
        muaGoi = code == 'en' ? 'Purchase package' : 'MUA GÓI',
        datLichNgay = code == 'en' ? 'Book now' : 'ĐẶT LỊCH NGAY',
        thongTinDichVu =
            code == 'en' ? 'About the service' : 'THÔNG TIN DỊCH VỤ',
        chonDV = code == 'en' ? 'Select Service' : 'Chọn Dịch Vụ',
        thuNho = code == 'en' ? 'Miniature' : 'Thu Nhỏ',
        daHet = code == 'en' ? 'Its over' : 'Đã hết',
        datLich = code == 'en' ? 'Book' : 'Đặt Lịch',
        chonChiNhanh = code == 'en' ? 'Pick Branch' : 'Chọn chi nhánh',
        ngayThucHien = code == 'en' ? 'Implementation Date' : 'Ngày Thực Hiện',
        gioGoiY = code == 'en' ? 'Hour of Hints' : 'Giờ Gợi Ý',
        yeuCauDacBiet =
            code == 'en' ? 'Special Requirements' : 'Yêu Cầu Đặc Biệt',
        maGiamGia = code == 'en' ? 'Discount' : 'Mã giảm giá',
        tongThanhToan = code == 'en' ? 'Total Payment' : 'Tổng Thanh Toán',
        daThemVaoGioHang =
            code == 'en' ? 'Added to Cart' : 'Đã Thêm Vào Giỏ Hàng',
        banDaThem = code == 'en'
            ? 'You have added the service to the cart, please pay for the service before the scheduled time!'
            : 'Bạn đã thêm dịch vụ vào giỏ hàng, vui lòng thanh toán dịch vụ trước thời gian đặt lịch!',
        camOnBan = code == 'en'
            ? '''Thank you for using Joy Bookie's service!'''
            : 'Cảm ơn bạn đã sử dụng dịch vụ của Joy Bookie!',
        thanhToan = code == 'en' ? 'Payment' : 'Thanh toán',
        commomViewCart = code == 'en' ? 'View Cart' : 'Xem Giỏ Hàng',
        timDVKhac = code == 'en' ? 'Browse more services' : 'Tìm dịch vụ khác',
        dangNhap = code == 'en' ? 'Log in' : 'Đăng Nhập',
        soDienThoai = code == 'en' ? 'Phone number' : 'Số Điện Thoại',
        matKhau = code == 'en' ? 'Password' : 'Mật Khẩu',
        quenMK = code == 'en' ? 'Forgot Password' : 'Quên mật khẩu',
        dangKyTaiKhoan =
            code == 'en' ? 'Sign up for an account' : 'Đăng ký tài khoản',
        hoacDangNhap = code == 'en' ? 'or login with' : 'hoặc đăng nhập bằng',
        khiDangNhap = code == 'en'
            ? 'By logging in, I agree to the'
            : 'Khi đăng nhập, tôi đồng ý với các',
        khiDangKy = code == 'en'
            ? 'By registering, I agree to the'
            : 'Khi đăng ký, tôi đồng ý với các',
        dieuKhoanSuDung =
            code == 'en' ? 'Terms and conditions' : ' Điều khoản sử dụng',
        va = code == 'en' ? 'and' : 'và',
        chinhSachbaoMat =
            code == 'en' ? 'Privacy Policy' : ' Chính sách bảo mật',
        cuaJoyBookie = code == 'en' ? 'of Joy Bookie' : ' của Joy Bookie.',
        dangKy = code == 'en' ? 'Register' : 'Đăng Ký',
        hoTen = code == 'en' ? 'Full name' : 'Họ Tên',
        ngaySinh = code == 'en' ? 'DOB' : 'Ngày Sinh',
        gioiTinh = code == 'en' ? 'Gender' : 'Giới Tính',
        xacNhanMatKhau = code == 'en' ? 'Retype Password' : 'Nhập lại mật khẩu',
        nam = code == 'en' ? 'Male' : 'Nam',
        nu = code == 'en' ? 'Female' : 'Nữ',
        nhanEmail = code == 'en'
            ? 'Receive exclusive promotional emails from Joy Bookie. This subscription can be canceled at a later date as outlined in the Privacy Policy.'
            : 'Nhận email khuyến mãi độc quyền từ Joy Bookie. Có thể hủy đăng ký này về sau như đã nêu trong Chính sách bảo mật.',
        canhBao = code == 'en'
            ? 'Maximum number that can be selected: 3. Please re-enter.'
            : 'Số lượng tối đa có thể chọn: 3. Vui lòng nhập lại.',
        nhapMagiamGia =
            code == 'en' ? 'Enter discount code' : 'Nhập mã giảm giá',
        phuongThucThanhToan =
            code == 'en' ? 'Payment Methods' : 'Phương thức thanh toán',
        theTinDung =
            code == 'en' ? 'Credit / Debit Card' : 'Thẻ tín dụng / ghi nợ',
        goiDaDat = code == 'en' ? 'Packages Purchased' : 'Gói Đã Đặt',
        soThe = code == 'en' ? 'Card Number' : 'Số Thẻ',
        ngayHetHan = code == 'en' ? 'Expiration date' : 'Ngày hết hạn',
        xemLichSu = code == 'en' ? 'View History' : 'Xem lịch sử',
        viMomo = code == 'en' ? 'Momo Wallet' : 'Ví Momo',
        thanhToanBangDiem =
            code == 'en' ? 'Pay with points' : 'Thanh toán bằng điểm',
        thongtinLienHe = code == 'en' ? 'Contact Info' : 'Thông tin liên hệ',
        taoTaiKhoanMoi =
            code == 'en' ? 'Create a new account' : 'Tạo tài khoản mới',
        lichDaDat = code == 'en' ? 'Booked Calendar' : 'Lịch Đã Đặt',
        yeuThich = code == 'en' ? 'Favourite' : 'Yêu Thích',
        dangKyDoiTac =
            code == 'en' ? 'Partner Registration' : 'Đăng ký đối tác',
        taiKhoan = code == 'en' ? 'Account' : 'Tài Khoản',
        ngonNgu = code == 'en' ? 'Language' : 'Ngôn Ngữ',
        danhGiaCuaToi = code == 'en' ? 'My Rating' : 'Đánh giá của tôi',
        tinNhan = code == 'en' ? 'Message' : 'Tin nhắn',
        uuDai = code == 'en' ? 'Endow' : 'Ưu đãi',
        ttHT = code == 'en' ? 'Support Center' : 'Trung tâm hỗ trợ',
        ttHT2 = code == 'en' ? 'Support Center' : 'Trung Tâm Hỗ Trợ',
        cauHoiThuongGap =
            code == 'en' ? 'Frequently asked questions' : 'Câu hỏi thường gặp',
        timHieuThem = code == 'en' ? 'Find out more' : 'Tìm hiểu thêm',
        caiDat = code == 'en' ? 'Setting' : 'Cài đặt',
        dangXuat = code == 'en' ? 'Log Out' : 'Đăng Xuất',
        xinChao = code == 'en' ? 'Hello' : 'Xin Chào',
        datThem = code == 'en' ? 'Buy More' : 'Mua Thêm',
        caiDatThongBao =
            code == 'en' ? 'Setting Notifications' : 'Cài Đặt Thông Báo',
        nhanThongBao = code == 'en' ? 'Get Notifications' : 'Nhận thông báo',
        tat = code == 'en' ? 'Turn off' : 'Tắt',
        ttCN = code == 'en' ? 'Personal Information' : 'Thông Tin Cá Nhân',
        thayDoiMK = code == 'en' ? 'Change Password' : 'Thay Đổi Mật Khẩu',
        matKhauCu = code == 'en' ? 'Old Password' : 'Mật khẩu cũ',
        matKhauMoi = code == 'en' ? 'New Password' : 'Mật khẩu mới',
        luuThayDoi = code == 'en' ? 'Save Changes' : 'Lưu thay đổi',
        spa = code == 'en' ? 'Spa & Salon' : 'Spa & Salon',
        lichSu = code == 'en' ? 'History' : 'Lịch Sử',
        dkDoiTac = code == 'en'
            ? 'Sign Up to Become a Partner'
            : 'Đăng Ký Trở Thành Đối Tác',
        nhapTTDK = code == 'en'
            ? 'Enter Information To Register'
            : 'Nhập Thông Tin Để Đăng Ký',
        tenSpa = code == 'en' ? 'Spa Name' : 'Tên Cơ sở kinh doanh',
        nguoiDaiDien = code == 'en' ? 'Representative' : 'Người Đại Diện',
        gui = code == 'en' ? 'Send' : 'Gửi',
        vuiLongNhap = code == 'en'
            ? 'English'
            : 'Vui lòng nhập mã OTP đã được gửi tới số điện thoại của Quý khách để xác thực',
        maOTP = code == 'en' ? 'Your OTP' : 'Mã OTP của quý khách',
        nhap = code == 'en' ? 'Enter' : 'Nhập',
        maDatLich = code == 'en' ? 'Booking Code' : 'Mã Đặt Lịch',
        bat = code == 'en' ? 'Turn On' : 'Bật',
        soBooking = code == 'en' ? 'Booking Number' : 'Số Booking:',
        luuY = code == 'en'
            ? 'Note: Your appointment needs to be confirmed, see the confirmation and check-in process at'
            : 'Lưu ý: Lịch hẹn của quý khách cần được xác nhận, xem quy trình xác nhận và check in tại ',
        day = code == 'en' ? 'here' : 'đây.',
        xemthemDV =
            code == 'en' ? 'See more services' : 'Xem thêm dịch vụ khác',
        xacnhanBooking =
            code == 'en' ? 'Booking confirmation!' : 'Xác nhận booking!',
        vuiLongKT = code == 'en'
            ? 'Please double check the information and confirm the customer service'
            : 'Vui lòng kiểm tra lại thông tin và xác nhận dịch vụ của khách hàng',
        huyBo = code == 'en' ? 'Cancel' : 'Huỷ bỏ',
        xacNhan = code == 'en' ? 'Confirm' : 'Xác nhận',
        goHome = code == 'en' ? 'Go Home' : 'Về trang chủ',
        successConfirm = code == 'en'
            ? 'Successfully confirmed!'
            : 'Đã xác nhận thành công!',
        dichVuDaXacNhan = code == 'en'
            ? 'Service has been confirmed successfully.\nThank you!'
            : 'Dịch vụ đã được xác nhận thành công. \nXin cảm ơn!',
        xemthemMaDatLich = code == 'en' ? 'English' : 'Xem mã đặt lịch của bạn',
        acceptTermsAndConditions = code == 'en'
            ? 'Accept terms and conditions .'
            : 'Chấp nhận điều khoản điều kiện.',
        target = code == 'en' ? 'Target' : 'Mục tiêu',
        myService = code == 'en' ? 'My Service' : 'Dịch vụ của chúng tôi',
        commonAsk = code == 'en' ? 'Common Ask' : 'Câu Hỏi Chung',
        toiCoTheHuyDichVu = code == 'en'
            ? 'Can I cancel the service?'
            : 'Tôi có hủy được dịch vụ không?',
        thanhToanAnToan =
            code == 'en' ? 'How to make payment?' : 'Làm sao để thanh toán?',
        lamSaoDatLich = code == 'en'
            ? 'How to make an appointment?'
            : 'Làm thế nào để đặt lịch?',
        youDoNotHaveNetwork = code == 'en'
            ? 'You do not have an internet connection'
            : 'Quý khách không có kết nối mạng',
        plsConnectToNetwork = code == 'en'
            ? 'Please connect to the network to make changes or view updates'
            : 'Vui lòng kết nối vào mạng để tạo thay đổi hoặc xem thông tin cập nhật',
        comeBack = code == 'en' ? 'Come Back' : 'Quay lại',
        tksForUseMyService = code == 'en'
            ? 'Thank you for using our service'
            : 'Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi',
        serviceQuestion =
            code == 'en' ? 'Service Question' : 'Câu Hỏi Về dịch vụ',
        plsRattingForHelpUs = code == 'en'
            ? 'Please rate to help us improve service quality'
            : 'Vui lòng đánh giá để giúp chúng tôi cải thiện chất lượng dịch vụ',
        emptyData = code == 'en' ? 'Empty Data' : 'Hiện tại không có Data',
        later = code == 'en' ? 'Later' : 'Để sau',
        searchMoreSpaAndSalon = code == 'en'
            ? 'Search more Spa & Salon'
            : 'Tìm kiếm thêm spa & Salon',
        getNotifications =
            code == 'en' ? 'Get Notifications' : 'Nhận thông báo',
        deleteAccount = code == 'en' ? 'Delete Account' : 'Xóa tài khoản',
        doYouWantDeleteAccount = code == 'en'
            ? 'Do You Want Delete Account'
            : 'Bạn có chắc chắn muốn xóa tài khoản không?',
        khong = code == 'en' ? 'No' : 'Không',
        dongY = code == 'en' ? 'Yes' : 'Đồng Ý';
}

class GetLanguage extends EventBloc2 {}

class ConvertToEngEvent extends EventBloc2 {}

class ConvertToVNEvent extends EventBloc2 {}
