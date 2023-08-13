import 'package:bloc_base/bloc/language/bloc_lang.dart';
import 'package:bloc_base/bloc/language/event_bloc2.dart';
import 'package:bloc_base/router/router.dart';
import 'package:bloc_base/screen/search/search_tab_screen/bloc/search_tab_bloc.dart';
import 'package:bloc_base/screen/search/search_tab_screen/bloc/search_tab_state.dart';
import 'package:bloc_base/widget/drawler.dart';
import 'package:bloc_base/widget/item/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:gap/gap.dart';
import '../../../../bloc/state_bloc.dart';
import '../../../../config/const.dart';
import '../../../../model/model_local.dart';
import '../../../../styles/init_style.dart';
import '../../../../widget/item/button.dart';
import '../../../home/home_screen/widget/icon_button.dart';
import '../../../../widget/item/input/bottom_sheet.dart';
import '../../../../widget/item/input/text_filed.dart';
import 'package:group_button/group_button.dart';
import '../bloc/search_tab_event.dart';

part 'widget/grid_service_item.dart';

part 'widget/cart_service_item.dart';

part 'widget/filler_bottom_sheet.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({Key? key}) : super(key: key);

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController serviceTypeController = TextEditingController();
  TextEditingController detailServiceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  int selectedIndex = 0;
  bool isSelected = false;
  bool typeList = true;
  List<ModelLocal2> listFilter = [
    ModelLocal2(name: 'Đánh giá tốt nhất', id: 'filterIcon1.svg'),
    ModelLocal2(name: 'Giá thấp nhất', id: 'filterIcon2.svg'),
    ModelLocal2(name: 'Khoảng cách ngắn nhất', id: 'filterIcon3.svg'),
    ModelLocal2(name: 'Danh sách yêu thích', id: 'filterIcon4.svg')
  ];
  List<ModelLocal2> listService = [
    ModelLocal2(name: 'Tắm trắng toàn thân', id: '1'),
    ModelLocal2(name: 'Trị liệu khử mùi', id: '2'),
    ModelLocal2(name: 'Trị liệu thâm nám', id: '3'),
    ModelLocal2(name: 'Tẩy da chết', id: '4'),
    ModelLocal2(name: 'Trị liệu sẹo giỗ', id: '5'),
    ModelLocal2(name: 'Trị liệu quầng thâm mắt', id: '6'),
    ModelLocal2(name: 'Trị liệu gò má cao', id: '7'),
    ModelLocal2(name: 'Trị liệu mồ hôi nách ', id: '8')
  ];
  List<ModelLocal2> listAddress = [
    ModelLocal2(name: 'Hoài Đức', id: '1'),
    ModelLocal2(name: 'Ba Đình', id: '2'),
    ModelLocal2(name: 'Hoàng Mai', id: '3'),
    ModelLocal2(name: 'Hà Đông', id: '4'),
    ModelLocal2(name: 'Vĩnh Tuy', id: '5'),
    ModelLocal2(name: 'Cầu Giấy', id: '6'),
    ModelLocal2(name: 'Nhổm', id: '7'),
    ModelLocal2(name: 'Trần Duy Hưng', id: '8'),
    ModelLocal2(name: 'Gia Lâm', id: '9'),
    ModelLocal2(name: 'Giáp Bát', id: '10'),
    ModelLocal2(name: 'Linh Đàm', id: '11'),
    ModelLocal2(name: 'Kim Giang', id: '12')
  ];

  List<ModelLocal2> checkListItems = [
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Trị liệu thâm nám',
      id: '2',
    ),
    ModelLocal2(
      name: 'Liệu trình tắm trắng',
      id: '3',
    ),
    ModelLocal2(
      name: 'Liệu trình giảm cân',
      id: '4',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(name: 'Chăm sóc da mặt', id: '1',
    ),
    ModelLocal2(name: 'Chăm sóc da mặt', id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
    ModelLocal2(
      name: 'Chăm sóc da mặt',
      id: '1',
    ),
  ];
  double fromPrice = 10000;
  double toPrice = 1000000;
  bool checkedValue = true;

  @override
  void initState() {
    super.initState();
    context.read<SearchTabBloc>().add(GetDataSearchTabEvent());
  }

  @override
  void dispose() {
    dateTimeController.dispose();
    serviceTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RangeValues range = RangeValues(fromPrice, toPrice);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorApp.backgroundF6F6EF,
        drawer: const ItemDrawer(),
        key: _scaffoldKey,
        body: BlocBuilder<BlocLanguage, StateBloc>(
            builder: (context, StateBloc state) {
          if (state is LoadSuccess) {
            Language lang = state.data;
            return Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/images/bgApp.png',
                          fit: BoxFit.fitHeight,
                          width: double.infinity,
                        ),
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorApp.bottomBarABCA74
                                                .withOpacity(0.3),
                                            blurRadius: 4,
                                            spreadRadius: 1, //New
                                          ),
                                        ]),
                                    child: InputText1(
                                      borderColor: ColorApp.background,
                                      colorBg: ColorApp.background,
                                      label: lang.timKiem,
                                      hasLeading: true,
                                      iconPreFix: const Icon(Icons.search,
                                          color: ColorApp.bottomBarABCA74),
                                      hasSuffix: false,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: SvgPicture.asset(
                                    'assets/svg/Vector.svg',
                                    width: 22,
                                  ),
                                ),
                              ),
                              const Gap(6),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouterName.notifyScreen);
                                },
                                child: const NotificationButton(),
                              ),
                              const Gap(16),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 3),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorApp.bottomBarABCA74
                                          .withOpacity(0.3),
                                      blurRadius: 4,
                                      spreadRadius: 1, //New
                                    ),
                                  ]),
                              child: IconButtonWidget(
                                onTap: () => _fillerResultBottomSheet(
                                    context, lang, range),
                                text: lang.locKQ,
                                imageUrl: 'assets/svg/filterIcon.svg',
                              ),
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorApp.bottomBarABCA74
                                          .withOpacity(0.3),
                                      blurRadius: 4,
                                      spreadRadius: 1, //New
                                    ),
                                  ]),
                              child: IconButtonWidget(
                                isPrefixIcon: false,
                                text: lang.xemBanDo,
                                imageUrl: 'assets/svg/mapIcon.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
                Expanded(
                    child: BlocConsumer<SearchTabBloc, SearchTabState>(
                  listener: (context, state) {
                    if (state is LoadFailState) {
                      // showDialog(
                      //   context: context,
                      //   builder: (context) => AlertDialog(
                      //     title: Text(
                      //       'Thông báo',
                      //       style: StyleApp.styleGilroy700(
                      //           fontSize: 22, color: ColorApp.red),
                      //     ),
                      //     content: Text(
                      //       'Lỗi kết nối server',
                      //       style: StyleApp.styleGilroy700(
                      //           color: ColorApp.dark252525),
                      //     ),
                      //     actions: [
                      //       TextButton(
                      //           onPressed: () => Navigator.pop(context),
                      //           child: const Text('Đóng'))
                      //     ],
                      //   ),
                      // );
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is LoadSuccessState) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            const Gap(25),
                            typeList
                                ? ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const Gap(8),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    itemBuilder: (context, index) {
                                      return CardServiceItem(
                                        index: index,
                                        state: state,
                                      );
                                    },
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: state.serviceModel.data!.length,
                                  )
                                : GridView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: 200,
                                            childAspectRatio: 0.7,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10),
                                    itemCount: state.serviceModel.data!.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext ctx, index) {
                                      return GridServiceItem(
                                        index: index,
                                        state: state,
                                      );
                                    }),
                            const SizedBox(height: 80
                                // Const.size(context).width * 0.3,
                                ),
                          ],
                        ),
                      );
                    } else if (state is DataEmptyState) {
                      return Text(
                        "Data Empty",
                        style: StyleApp.textStyle600(fontSize: 16),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ))
              ],
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
