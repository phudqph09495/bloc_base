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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Const.size(context).width * 0.24358974359,
                color: ColorApp.darkGreen,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Const.size(context).width * 0.04615384615),
                  child: Row(
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
                            fontSize: 18, color: Colors.white),
                      ),
                      InkWell(
                        onTap: () => serviceTypeController.text = "",
                        child: Text(
                          lang.boLoc,
                          style: StyleApp.textStyle400(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Const.size(context).width * 0.04615384615,
                      vertical: Const.size(context).width * 0.04615384615),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${lang.loaiDV} :',
                        style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      InputText1(
                          onTap: () {
                            BottomSheetInforService.selecteRadioBottomSheet(
                                context,
                                lang.loaiDV,
                                checkListItems,
                                selectedIndex,
                                serviceTypeController);
                            // selecteServiceBottomSheet(context, lang);
                          },
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
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      InputText1(
                          labelSize: 14,
                          readOnly: true,
                          colorBg: ColorApp.background,
                          borderColor: ColorApp.borderEAEAEA,
                          controller: serviceTypeController,
                          hasSuffix: true,
                          radius: 10,
                          label: lang.loaiDV,
                          suffix: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 16,
                            color: ColorApp.dark252525,
                          )), // Container(

                      SizedBox(
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      Text(
                        '${lang.gia} :',
                        style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.01846153846,
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
                            style:
                                StyleApp.textStyle700(color: ColorApp.dark500),
                          ),
                          Text(
                            '${lang.den} ',
                            style: StyleApp.textStyle400(
                                color: ColorApp.dark252525),
                          ),
                          Text(
                            '${Const.ConvertPrice.format(toPrice.round())} đ',
                            style:
                                StyleApp.textStyle700(color: ColorApp.dark500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.01846153846,
                      ),
                      RangeSlider(
                          inactiveColor: ColorApp.dark252525,
                          activeColor: ColorApp.darkGreen,
                          values: RangeValues(fromPrice, toPrice),
                          min: 0,
                          labels: RangeLabels(range.start.round().toString(),
                              range.end.round().toString()),
                          max: 10000000,
                          onChanged: (value) {
                            stateSetter(() {
                              fromPrice = value.start;
                              toPrice = value.end;
                            });
                          }),
                      SizedBox(
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      Text(
                        '${lang.phamVi} :',
                        style:
                            StyleApp.textStyle700(color: ColorApp.dark252525),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.01846153846,
                      ),
                      GroupButton(
                        options: GroupButtonOptions(
                          elevation: 0,
                          selectedColor: ColorApp.darkGreen,
                          unselectedBorderColor: ColorApp.borderEAEAEA,
                          unselectedColor: ColorApp.background,
                          unselectedTextStyle:
                              StyleApp.textStyle600(color: ColorApp.dark500),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        isRadio: true,
                        onSelected: (name, index, isSelected) {
                          print(name);
                          print('$index button is selected');
                        },
                        buttons: const [
                          "3 km",
                          "5 km",
                          "8 km",
                          "10 km",
                        ],
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              shape: const CircleBorder(),
                              activeColor: ColorApp.darkGreen,
                              value: checkedValue,
                              onChanged: (val) {
                                stateSetter(() {
                                  checkedValue = val!;
                                });
                              }),
                          Text(
                            lang.chiSpaTrong,
                            style:
                                StyleApp.textStyle600(color: ColorApp.dark500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: InputText1(
                              radius: 10,
                              controller: dateTimeController,
                              onTap: () {
                                // DatePicker.showDatePicker(context,
                                //     currentTime: DateTime.now(),
                                //     locale: LocaleType.vi, onConfirm: (date) {
                                //   dateTimeController.text = Const.formatTime(
                                //       date.millisecondsSinceEpoch,
                                //       format: 'dd/MM/yyyy');
                                // });
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
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorApp.greyF6,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            '${lang.sapXepTheo} :',
                            style:
                                StyleApp.textStyle700(color: ColorApp.dark500),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listFilter
                            .length, // The number of RadioListTiles you want to display
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
                              const Divider()
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.03846153846,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorApp.greyF6,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            lang.hienThi,
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Const.size(context).width * 0.01846153846,
                      ),
                      Row(
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
                                      color: ColorApp.borderEAEAEA, width: 1),
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
                                      color: ColorApp.borderEAEAEA, width: 1),
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
                      SizedBox(
                        height: Const.size(context).width * 0.04846153846,
                      ),
                      ButtonWidget(
                        type: ButtonType.secondary,
                        text: lang.apDung,
                        onTap: () {
                          stateSetter(() {});

                          setState(() {});
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
              ))
            ],
          );
        });
      },
    );
  }
}
