part of '../search_tab_screen.dart';

extension FillerBottomSheet on _SearchTabScreenState {
  Future<dynamic> _fillerResultBottomSheet(
      BuildContext context, Language lang, RangeValues range) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter stateSetter) {
          return Column(
            children: [
              Container(
                height: Const.size(context).width * 0.24358974359,
                color: ColorApp.darkGreen,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Const.size(context).width * 0.04615384615,
                      vertical: Const.sizeHeight(context, 15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.clear,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        lang.locKQ,
                        style: StyleApp.textStyle700(
                            fontSize: 20, color: Colors.white),
                      ),
                      InkWell(
                        onTap: () => serviceTypeController.text = "",
                        child: Text(
                          lang.boLoc,
                          style: StyleApp.textStyle400(
                              color: Colors.white, fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                Const.size(context).width * 0.04615384615,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${lang.loaiDV} :',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03846153846,
                              ),
                              InputText1(
                                  onTap: () {
                                    BottomSheetInforService
                                        .selecteRadioBottomSheet(
                                            context,
                                            lang.loaiDV,
                                            checkListItems,
                                            selectedIndex,
                                            serviceTypeController);
                                  },
                                  controller: serviceTypeController ,
                                  labelSize: 14,
                                  readOnly: true,
                                  colorBg: ColorApp.background,
                                  borderColor: ColorApp.borderEAEAEA,
                                  hasSuffix: true,
                                  radius: 10,
                                  label: lang.loaiDV,
                                  suffix: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 16,
                                    color: ColorApp.dark252525,
                                  )),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03846153846,
                              ),
                              InputText1(
                                  onTap: () {
                                    BottomSheetInforService
                                        .selecteRadioBottomSheet(
                                            context,
                                            'Dịch vụ',
                                            listService,
                                            selectedIndex,
                                            detailServiceController);
                                  },
                                  labelSize: 14,
                                  readOnly: true,
                                  colorBg: ColorApp.background,
                                  borderColor: ColorApp.borderEAEAEA,
                                  controller: detailServiceController,
                                  hasSuffix: true,
                                  radius: 10,
                                  label: lang.loaiDV,
                                  suffix: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 16,
                                    color: ColorApp.dark252525,
                                  )),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03846153846,
                              ),
                              Text(
                                '${lang.gioiTinh}',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                              const Gap(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 45,
                                        child: RadioListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          value: 0,
                                          activeColor: ColorApp.darkGreen,
                                          groupValue: selectedIndex,
                                          onChanged: (int? value) {
                                            stateSetter(() {
                                              selectedIndex = value!;
                                            });
                                          },
                                        ),
                                      ),
                                      Text(
                                        'Cả hai',
                                        style: StyleApp.textStyle400(),
                                      )
                                    ],
                                  ),
                                  Gap(23),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 45,
                                        child: RadioListTile(
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          contentPadding: EdgeInsets.zero,
                                          activeColor: ColorApp.darkGreen,
                                          value: 1,
                                          groupValue: selectedIndex,
                                          onChanged: (int? value) =>
                                              stateSetter(() {
                                            selectedIndex = value!;
                                          }),
                                        ),
                                      ),
                                      Text('Nam',
                                          style: StyleApp.textStyle400()),
                                    ],
                                  ),
                                  Gap(23),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 45,
                                        child: RadioListTile(
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                            contentPadding: EdgeInsets.zero,
                                            activeColor: ColorApp.darkGreen,
                                            value: 2,
                                            groupValue: selectedIndex,
                                            onChanged: (int? value) =>
                                                stateSetter(() {
                                                  selectedIndex = value!;
                                                })),
                                      ),
                                      Text('Nữ',
                                          style: StyleApp.textStyle400()),
                                    ],
                                  )
                                ],
                              ),
                              const Gap(10),
                              Text(
                                '${lang.gia} :',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.01846153846,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${lang.giaTu} ',
                                    style: StyleApp.textStyle400(
                                        color: ColorApp.dark252525),
                                  ),
                                  Text(
                                    '${Const.ConvertPrice.format(fromPrice.round())} đ ',
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark500),
                                  ),
                                  Text(
                                    '${lang.den} ',
                                    style: StyleApp.textStyle400(
                                        color: ColorApp.dark252525),
                                  ),
                                  Text(
                                    '${Const.ConvertPrice.format(toPrice.round())} đ',
                                    style: StyleApp.textStyle700(
                                        color: ColorApp.dark500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.01846153846,
                              ),
                              FlutterSlider(
                                values: [fromPrice, toPrice],
                                rangeSlider: true,
                                max: 10000000,
                                min: 10000,
                                step: const FlutterSliderStep(step: 10000),
                                trackBar: const FlutterSliderTrackBar(
                                  activeTrackBarHeight: 5,
                                  activeTrackBar: BoxDecoration(
                                      color: ColorApp.bottomBarABCA74),
                                  inactiveTrackBarHeight: 5,
                                  inactiveTrackBar:
                                      BoxDecoration(color: ColorApp.dark500),
                                ),
                                handler: FlutterSliderHandler(
                                  decoration: const BoxDecoration(),
                                  child: Container(
                                    height: 23,
                                    width: 23,
                                    decoration: BoxDecoration(
                                        color: ColorApp.background,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: ColorApp.bottomBarABCA74,
                                            width: 4)),
                                  ),
                                ),
                                rightHandler: FlutterSliderHandler(
                                  decoration: const BoxDecoration(),
                                  child: Container(
                                    height: 23,
                                    width: 23,
                                    decoration: BoxDecoration(
                                        color: ColorApp.background,
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: ColorApp.bottomBarABCA74,
                                            width: 4)),
                                  ),
                                ),
                                disabled: false,
                                onDragging:
                                    (handlerIndex, starValue, endValue) {
                                  fromPrice = starValue;
                                  toPrice = endValue;
                                  stateSetter(() {});
                                },
                              ),
                              Gap(20),
                              Text(
                                '${lang.quan} :',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                              Gap(10),
                              InputText1(
                                  onTap: () {
                                    BottomSheetInforService
                                        .selecteRadioBottomSheet(
                                            context,
                                            'Chọn Quận',
                                            listAddress,
                                            selectedIndex,
                                            addressController);
                                  },
                                  labelSize: 14,
                                  readOnly: true,
                                  colorBg: ColorApp.background,
                                  borderColor: ColorApp.borderEAEAEA,
                                  controller: addressController,
                                  hasSuffix: true,
                                  radius: 10,
                                  label: 'Chọn Quận',
                                  suffix: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 16,
                                    color: ColorApp.dark252525,
                                  )),
                              Gap(10),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03846153846,
                              ),
                              Text(
                                '${lang.phamVi} :',
                                style: StyleApp.textStyle700(
                                    color: ColorApp.dark252525),
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.01846153846,
                              ),
                              GroupButton(
                                options: GroupButtonOptions(
                                  elevation: 0,
                                  selectedColor: ColorApp.darkGreen,
                                  unselectedBorderColor: ColorApp.borderEAEAEA,
                                  unselectedColor: ColorApp.background,
                                  unselectedTextStyle: StyleApp.textStyle600(
                                      color: ColorApp.dark500),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                isRadio: true,
                                onSelected: (name, index, isSelected) {},
                                buttons: const [
                                  "3 km",
                                  "5 km",
                                  "8 km",
                                  "10 km",
                                ],
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03846153846,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                    child: Switch(
                                      activeColor: ColorApp.darkGreen,
                                      value: isSelected,
                                      onChanged: (value) {
                                        stateSetter(() {
                                          isSelected = value;
                                        });
                                      },
                                    ),
                                  ),
                                  Gap(10),
                                  Text(
                                    lang.chiSpaTrong,
                                    style: StyleApp.textStyle600(
                                        color: ColorApp.dark500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03846153846,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: InputText1(
                                      radius: 10,
                                      controller: dateTimeController,
                                      onTap: () {
                                        DatePicker.showDatePicker(
                                          context,
                                          locale: DateTimePickerLocale.vi,
                                          dateFormat: 'dd MMMM yyyy',
                                          initialDateTime: DateTime.now(),
                                          minDateTime: DateTime(2000),
                                          maxDateTime: DateTime(2050),
                                          onConfirm:
                                              (dateTime, List<int> index) {
                                            dateTimeController.text =
                                                Const.formatTime(
                                                    dateTime
                                                        .millisecondsSinceEpoch,
                                                    format: 'dd/MM/yyyy');
                                          },
                                        );
                                      },
                                      label: Const.formatTime(
                                          DateTime.now().millisecondsSinceEpoch,
                                          format: 'dd/MM/yyyy'),
                                      hasSuffix: true,
                                      readOnly: true,
                                      colorBg: ColorApp.backgroundF9F9F4,
                                      suffix: Transform.scale(
                                          scale: 0.5,
                                          child: SvgPicture.asset(
                                              'assets/svg/notiIcon.svg')),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 5,
                                    child: SizedBox(),
                                  )
                                ],
                              ),
                              SizedBox(
                                height:
                                    Const.size(context).width * 0.03846153846,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: ColorApp.background,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Text(
                              '${lang.sapXepTheo} :',
                              style: StyleApp.textStyle700(
                                  color: ColorApp.dark500),
                            ),
                          ),
                        ),
                        ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: listFilter.length,
                          // The number of RadioListTiles you want to display
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                RadioListTile<int>(
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                  contentPadding: EdgeInsets.zero,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/svg/${listFilter[index].id}',
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        '${listFilter[index].name}',
                                        style: StyleApp.textStyle600(
                                            color: ColorApp.dark500),
                                      ),
                                    ],
                                  ),
                                  value: index,
                                  activeColor: ColorApp.darkGreen,
                                  groupValue: selectedIndex,
                                  onChanged: (int? value) {
                                    stateSetter(() {
                                      selectedIndex = value!;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                        Container(
                          color: ColorApp.background,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Text(
                              '${lang.hienThi} :',
                              style: StyleApp.textStyle700(
                                  color: ColorApp.dark500),
                            ),
                          ),
                        ),
                        const Gap(15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    typeList = true;
                                    stateSetter(() {
                                      // chooseList = true;
                                    });
                                    // setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: ColorApp.borderEAEAEA,
                                          width: 1),
                                      color: typeList == true
                                          ? ColorApp.darkGreen
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/listIcon.svg',
                                            color: typeList == true
                                                ? Colors.white
                                                : ColorApp.darkGreen,
                                          ),
                                          Text(
                                            lang.danhSach,
                                            style: StyleApp.textStyle600(
                                                color: typeList == true
                                                    ? Colors.white
                                                    : ColorApp.darkGreen),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    typeList = false;
                                    stateSetter(() {
                                      // chooseList = false;
                                    });

                                    // setState(() {});
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: typeList == false
                                          ? ColorApp.darkGreen
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: ColorApp.borderEAEAEA,
                                          width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/gridIcon.svg',
                                            color: typeList == false
                                                ? Colors.white
                                                : ColorApp.darkGreen,
                                          ),
                                          Text(
                                            lang.luoi,
                                            style: StyleApp.textStyle600(
                                                color: typeList == false
                                                    ? Colors.white
                                                    : ColorApp.darkGreen),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ButtonWidget(
                            type: ButtonType.secondary,
                            text: lang.apDung,
                            onTap: () {
                              stateSetter(() {});
                              Navigator.pop(context, typeList);
                            },
                          ),
                        ),
                        const Gap(30),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        });
      },
    );
  }
}
