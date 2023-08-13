part of '../favourite_screen.dart';

class CardShopItem extends StatelessWidget {
  const CardShopItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                flex: 8, child: Image.asset('assets/images/searchImgList.png')),
            const Gap(10),
            Expanded(
                flex: 20,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sorella Beauty Spa',
                          style:
                          StyleApp.textStyle600(color: ColorApp.dark252525),
                        ),
                        Icon(
                          Icons.clear,
                          color: ColorApp.dark500.withOpacity(0.7),
                          size: 12,
                        )
                      ],
                    ),
                    Text(
                      'Trung tâm chăm sóc sức khoẻ cộng đồng',
                      maxLines: 2,
                      style: StyleApp.textStyle500(
                          color: ColorApp.dark500,
                          decoration: TextDecoration.none),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: ColorApp.bottomBarABCA74,
                              size: 12,
                            ),
                            Text(
                              ' 2.3 km',
                              style: StyleApp.textStyle500(
                                color: ColorApp.bottomBarABCA74,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox()
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}