part of '../search_tab_screen.dart';

class GridServiceItem extends StatelessWidget {
  const GridServiceItem({
    super.key,
    required this.index,
    required this.state,
  });
  final int index;
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
          padding: EdgeInsets.only(
              top: Const.sizeWidth(context, 10),
              left: Const.sizeWidth(context, 10),
              right: Const.sizeWidth(context, 10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(
                      state.serviceModel.data![index].imageUrl ?? "",
                      fit: BoxFit.cover,
                      height: Const.sizeHeight(context, 105),
                      width: (Const.size(context).width - 18 * 2 - 10 * 2) / 2,
                    ),
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: Icon(Icons.favorite,
                          size: 16,
                          color: index % 2 == 1
                              ? ColorApp.background.withOpacity(0.5)
                              : ColorApp.orangeFFC94D)),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorApp.dark252525.withOpacity(.75),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: ColorApp.orangeFFC94D,
                              size: 12,
                            ),
                            const Gap(3),
                            Text(
                              '4.5',
                              style: StyleApp.textStyle500(
                                  color: ColorApp.yellow, fontSize: 12),
                            ),
                            const Gap(3),
                            Text(
                              '(54)',
                              style: StyleApp.textStyle500(
                                  color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                state.serviceModel.data![index].description ?? "",
                style: StyleApp.textStyle600(color: ColorApp.dark252525),
              ),
              Row(
                children: [
                  Text(
                    'đ ${Const.ConvertPrice.format(1450000)}  ',
                    style: StyleApp.textStyle600(
                        color: ColorApp.dark500,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Expanded(
                    child: Text(
                      '${Const.ConvertPrice.format(1200000)} đ',
                      overflow: TextOverflow.ellipsis,
                      style: StyleApp.textStyle700(
                          color: ColorApp.dark252525,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.home,
                    color: ColorApp.darkGreen,
                    size: 14,
                  ),
                  const Gap(3),
                  Text(
                    state.serviceModel.data![index].title ?? "",
                    style: StyleApp.textStyle600(
                      color: ColorApp.darkGreen,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: ColorApp.greyAD,
                          size: 11,
                        ),
                        Text(
                          ' 2.3km',
                          style: StyleApp.textStyle500(
                              color: ColorApp.greyAD, fontSize: 13),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_rounded,
                          color: ColorApp.greyAD,
                          size: 11,
                        ),
                        Text(
                          ' 90 phút',
                          style: StyleApp.textStyle500(
                              color: ColorApp.greyAD, fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
