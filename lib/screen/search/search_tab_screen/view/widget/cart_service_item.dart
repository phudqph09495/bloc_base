part of '../search_tab_screen.dart';

class CardServiceItem extends StatelessWidget {
  const CardServiceItem({
    super.key,
    required this.index,
    this.isFavorite = true,
    required this.state,
  });

  final int index;
  final bool isFavorite;
  final LoadSuccessState state;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.infoSpaScreen);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorApp.background),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    state.serviceModel.data![index].imageUrl ?? "",
                    fit: BoxFit.cover,
                    height: Const.sizeHeight(context, 85),
                    width: Const.sizeWidth(context, 100),
                  ),
                ),
              ),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                  flex: 10,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.serviceModel.data![index].description ?? "",
                            style: StyleApp.textStyle600(
                              color: ColorApp.dark252525,
                              fontSize: 16,
                            ),
                          ),
                          isFavorite
                              ? Icon(
                                  Icons.favorite,
                                  size: 14,
                                  color: index % 2 == 1
                                      ? ColorApp.whiteF0.withOpacity(0.5)
                                      : ColorApp.orangeFFC94D,
                                )
                              : const Icon(
                                  Icons.close,
                                  color: ColorApp.dark500,
                                  size: 14,
                                )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'đ ${Const.ConvertPrice.format(1450000)} ',
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark500,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Text(
                            '${Const.ConvertPrice.format(1200000)} đ',
                            style: StyleApp.textStyle700(
                                color: ColorApp.dark252525,
                                decoration: TextDecoration.none),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: ColorApp.yellow,
                              ),
                              Text(
                                '4.7  ',
                                style: StyleApp.textStyle700(
                                  color: ColorApp.yellow,
                                ),
                              ),
                              Text(
                                '(86)',
                                style: StyleApp.textStyle700(
                                  color: ColorApp.greyAD,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.watch_later_rounded,
                                color: ColorApp.greyAD,
                                size: 12,
                              ),
                              const Gap(3),
                              Text(
                                ' 125 phút',
                                style: StyleApp.textStyle500(
                                    color: ColorApp.greyAD,
                                    fontSize: 13,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.home,
                                size: 14,
                                color: ColorApp.darkGreen,
                              ),
                              const Gap(6),
                              Text(
                                state.serviceModel.data![index].title ?? "",
                                style: StyleApp.textStyle500(
                                  color: ColorApp.darkGreen,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: ColorApp.greyAD,
                                size: 12,
                              ),
                              Text(
                                ' 2.3 km',
                                style: StyleApp.textStyle500(
                                    color: ColorApp.greyAD,
                                    fontSize: 12,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
