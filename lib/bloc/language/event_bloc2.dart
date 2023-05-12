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
  String dangKyTaiKhoan;
  String hoacDangNhap;
  String khiDangNhap;
  String dieuKhoanSuDung;
  String va;
  String chinhSachbaoMat;
  String cuaJoyBookie;
  String dangKy;
  String hoTen;
  String ngaySinh;
  String string83;
  String string84;
  String string85;
  String string86;
  String string87;
  String string88;
  String string89;
  String string90;
  String string91;
  String string92;
  String string93;
  String string94;
  String string95;
  String string96;
  String string97;
  String string98;
  String string99;
  String string100;

  Language({required String code})
      : string1 = code == 'en' ? 'English' : 'Tiếng Việt',
        co = code == 'en' ? 'coAnh.png' : 'coVN.png',
        codeNow = code == 'en' ? 'en' : 'vi',


        timKiem = code == 'en' ? '' : 'Tìm Kiếm',
        dichvu = code == 'en' ? '' : 'Dịch Vụ',
        khamPhaGanBan = code == 'en' ? '' : 'Khám Phá Gần Bạn',
        xemThem = code == 'en' ? '' : 'Xem Thêm',
        xemThem1 = code == 'en' ? '' : 'Xem Thêm',
        danhGiaCaoNhat = code == 'en' ? '' : 'Đánh Giá Cao Nhất',
        gioiThieu = code == 'en' ? '' : 'Giới Thiệu',
        hoTro = code == 'en' ? '' : 'Hỗ Trợ',
        gioHang = code == 'en' ? '' : 'Giỏ Hàng',
        ttTK = code == 'en' ? '' : 'Thông Tin Tài Khoản',
        thongBao = code == 'en' ? '' : 'Thông Báo',
        dieuKhoan = code == 'en' ? '' : 'Điều Khoản & Điều Kiện',
        homNay = code == 'en' ? '' : 'Hôm Nay',
        ganDay = code == 'en' ? '' : 'Gần đây',
        locKQ = code == 'en' ? '' : 'Lọc kết quả',
        xemBanDo = code == 'en' ? '' : 'Xem bản đồ',
        boLoc = code == 'en' ? '' : 'Bỏ lọc',
        loaiDV = code == 'en' ? '' : 'Loại dịch vụ',
        gia = code == 'en' ? '' : 'Giá',
        giaTu = code == 'en' ? '' : 'Giá từ',
        den = code == 'en' ? '' : 'đến',
        phamVi = code == 'en' ? '' : 'Phạm vi',
        chiSpaTrong = code == 'en' ? '' : 'Chỉ hiện spa còn trống',
        sapXepTheo = code == 'en' ? '' : 'SẮP XẾP THEO',
        danhGiaTotNhat = code == 'en' ? '' : 'Đánh giá tốt nhất',
        giaThapNhat = code == 'en' ? '' : 'Giá thấp nhất',
        khoangCachNganNhat = code == 'en' ? '' : 'Khoảng cách ngắn nhất',
        danhSachYeuThich = code == 'en' ? '' : 'Danh sách yêu thích',
        hienThi = code == 'en' ? '' : 'HIỂN THỊ',
        danhSach = code == 'en' ? '' : 'DANH SÁCH',
        luoi = code == 'en' ? '' : 'LƯỚI     ',
        apDung = code == 'en' ? '' : 'ÁP DỤNG',
        chiNhanh = code == 'en' ? '' : 'Chi Nhánh',
        trangThai = code == 'en' ? '' : 'Trạng Thái',
        khoangCach = code == 'en' ? '' : 'Khoảng Cách',
        thongTin = code == 'en' ? '' : 'THÔNG TIN',
        danhGia = code == 'en' ? '' : 'ĐÁNH GIÁ',
        diaChi = code == 'en' ? '' : 'Địa Chỉ',
        chiDuong = code == 'en' ? '' : 'Chỉ đường',
        dienThoai = code == 'en' ? '' : 'Điện Thoại ',
        website = code == 'en' ? '' : 'Website',
        gioHoatDOng = code == 'en' ? '' : 'Giờ Hoạt Động',
        ngayThuong = code == 'en' ? '' : 'Ngày thường',
        cuoiTuan = code == 'en' ? '' : 'Cuối tuần',
        lienHe = code == 'en' ? '' : 'LIÊN HỆ',

        chonLoaiDV = code == 'en' ? '' : 'Chọn loại dịch vụ',
        chiTiet = code == 'en' ? '' : 'Chi Tiết',
        dvKhac = code == 'en' ? '' : 'Dịch Vụ Khác',
        muaGoi = code == 'en' ? '' : 'MUA GÓI',
        datLichNgay = code == 'en' ? '' : 'ĐẶT LỊCH NGAY',
        thongTinDichVu = code == 'en' ? '' : 'THÔNG TIN DỊCH VỤ',
        chonDV = code == 'en' ? '' : 'Chọn Dịch Vụ',
        thuNho = code == 'en' ? '' : 'Thu Nhỏ',
        daHet = code == 'en' ? '' : 'Đã hết',
        datLich = code == 'en' ? '' : 'Đặt Lịch',
        chonChiNhanh = code == 'en' ? '' : 'Chọn chi nhánh',
        ngayThucHien = code == 'en' ? '' : 'Ngày Thực Hiện',
        gioGoiY = code == 'en' ? '' : 'Giờ Gợi Ý',
        yeuCauDacBiet = code == 'en' ? '' : 'Yêu Cầu Đặc Biệt',
        maGiamGia = code == 'en' ? '' : 'Mã giảm giá',
        tongThanhToan = code == 'en' ? '' : 'Tổng Thanh Toán',
        daThemVaoGioHang = code == 'en' ? '' : 'Đã Thêm Vào Giỏ Hàng',
        banDaThem = code == 'en' ? '' : 'Bạn đã thêm dịch vụ vào giỏ hàng, vui lòng thanh toán dịch vụ trước thời gian đặt lịch!',
        camOnBan = code == 'en' ? '' : 'Cảm ơn bạn đã sử dụng dịch vụ của Joy Bookie!',
        thanhToan = code == 'en' ? '' : 'Thanh toán',
        timDVKhac = code == 'en' ? '' : 'Tìm dịch vụ khác',
        dangNhap = code == 'en' ? '' : 'Đăng Nhập',
        soDienThoai = code == 'en' ? '' : 'Số Điện Thoại',
        matKhau = code == 'en' ? '' : 'Mật Khẩu',
        quenMK = code == 'en' ? '' : 'Quên mật khẩu',
        dangKyTaiKhoan = code == 'en' ? '' : 'Đăng ký tài khoản',
        hoacDangNhap = code == 'en' ? '' : 'hoặc đăng nhập bằng',
        khiDangNhap = code == 'en' ? '' : 'Khi đăng nhập, tôi đồng ý với các',
        dieuKhoanSuDung = code == 'en' ? '' : ' Điều khoản sử dụng',
        va = code == 'en' ? '' : 'và',
        chinhSachbaoMat = code == 'en' ? '' : ' Chính sách bảo mật',
        cuaJoyBookie = code == 'en' ? '' : ' của Joy Bookie.',
        dangKy = code == 'en' ? '' : 'Đăng Ký',
        hoTen = code == 'en' ? '' : 'Họ Tên',
        ngaySinh = code == 'en' ? '' : 'Ngày Sinh',
        string83 = code == 'en' ? '' : 'Giới Tính',
        string84 = code == 'en' ? '' : 'Xác Nhận Mật Khẩu',
        string85 = code == 'en' ? '' : 'Nam',
        string86 = code == 'en' ? '' : 'Nữ',
        string87 = code == 'en' ? '' : 'Nhận email khuyến mãi độc quyền từ Joy Bookie. Có thể hủy đăng ký này về sau như đã nêu trong Chính sách bảo mật.',
        string88 = code == 'en' ? '' : 'Tên thành phần con 88',
        string89 = code == 'en' ? '' : 'Tên thành phần con 89',
        string90 = code == 'en' ? '' : 'Tên thành phần con 90',
        string91 = code == 'en' ? '' : 'Tên thành phần con 91',
        string92 = code == 'en' ? '' : 'Tên thành phần con 92',
        string93 = code == 'en' ? '' : 'Tên thành phần con 93',
        string94 = code == 'en' ? '' : 'Tên thành phần con 94',
        string95 = code == 'en' ? '' : 'Tên thành phần con 95',
        string96 = code == 'en' ? '' : 'Tên thành phần con 96',
        string97 = code == 'en' ? '' : 'Tên thành phần con 97',
        string98 = code == 'en' ? '' : 'Tên thành phần con 98',
        string99 = code == 'en' ? '' : 'Tên thành phần con 99',
        string100 = code == 'en' ? '' : 'Tên thành phần con 100';
}

class getLang extends EventBloc2 {}

class sangE extends EventBloc2 {}

class sangVn extends EventBloc2 {}
