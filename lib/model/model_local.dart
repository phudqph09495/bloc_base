class ModelLocal {
  String? id;
  String? title;

  ModelLocal({this.id, this.title});
}

class ModelLocal2 {
  String? id;
  String? name;
  bool? value;
  ModelLocal2({this.id, this.name, this.value = false});
}

class ModelCart {
  String name;
  int soLuong;
  int gia;
  bool? value;

  ModelCart(
      {required this.name,
      this.soLuong = 1,
      this.gia = 150000,
      this.value = false});
}

class SpaService {
  SpaService({
    this.listService,
    this.listPacket,
    required this.nameSpa,
    required this.indexMaximunPackget,
    required this.indexMaximunService,
    this.sumPricePackget = 0,
    this.sumPriceService = 0,
    this.isChoose = false,
    this.numberPackgetHasPick = 0,
    this.numberServiceHasPick = 0,
  });

  List<ModelCart>? listService;
  List<ModelCart>? listPacket;
  String nameSpa;
  int numberServiceHasPick;
  int numberPackgetHasPick;
  int sumPriceService;
  int sumPricePackget;
  bool isChoose;
  List<int> indexMaximunService;
  List<int> indexMaximunPackget;
}
