import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  BuildContext context;

//  List<BannerModel> bannerDataList = new List();
//  List<SliderModel> sliderDataList = new List();
//  List<FeaturedProduct> featureProductDataList = new List();
//  List<FeaturedProduct> hotdealDataList = new List();
//
//  List<OfferBanner> bannerOfferList = new List();

//  List<OfferBanner> bImageList = new List();
  List<NetworkImage> sImageList = new List();

/*
  void getData() async {
    try {
      var data = await fetchHomeList();
      var dataForOffer = await fetchBannerForOffers();

      setState(() {
        bannerDataList = data.BannerList;
        sliderDataList = data.SliderList;
        featureProductDataList = data.FeaturedProductList;
        hotdealDataList = data.HotdealList;
        bannerOfferList = dataForOffer.banners;
      });
//    bannerDataList
//        .forEach((data) =>
//          bImageList.add(new NetworkImage(data.image));
//        );
      sliderDataList
          .forEach((data) => sImageList.add(new NetworkImage(data.image)));
//    bannerOfferList
//        .forEach((data) => bOfferList.add(new NetworkImage(data.image)));
    } catch (e) {
//      Fluttertoast.showToast(
//          msg: 'Please check your internet connectivity!',
//          toastLength: Toast.LENGTH_SHORT);
      displayDialog();
    }
  }
*/

  @override
  void initState() {
    super.initState();
    //getData();
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return buildHomeDetailsPage(context);
  }

  final List<String> items = [
    'apple1',
    'banana2',
    'orange3',
    'lemon4',
    'apple5',
    'banana6',
    'orange7',
    'lemon8',
    'apple9',
    'banana10',
    'orange11',
    'lemon12',
    'apple13',
    'banana14',
    'orange15',
    'lemon16',
    'apple17',
    'banana18',
    'orange19',
    'lemon20'
  ];

  buildHomeDetailsPage(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          for (var item in items) buildCurrentOfferTitle(item)

//                (bannerDataList.length > 0)
//                    ? buildBannerOffer(bannerDataList)
//                    : new Container(),
//                (hotdealDataList.length > 0)
//                    ? buildCurrentOfferTitle('Hot Deals')
//                    : new Container(),
//                (hotdealDataList.length > 0)
//                    ? buildHotDealProduct()
//                    : new Container(),
//                SizedBox(height: 12.0),
//                (bannerOfferList.length > 0)
//                    ? buildCurrentOfferTitle('Best Offers')
//                    : new Container(),
//                (bannerOfferList.length > 0)
//                    ? buildOfferBannerProduct()
//                    : new Container()
        ]);
  }

//  buildBannerOffer(List<BannerModel> listBanner) {
//    OfferBanner oBanner = new OfferBanner();
//    oBanner.image = listBanner[0].image;
//    oBanner.subcatagoryID = listBanner[0].subcatagoryID;
//    return BannerOfferListItem(oBanner: oBanner, isDoubleView: false);
//  }

//  buildTopSliderImages(var list) {
//    return new Container(
//      child: Padding(
//          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//          child: Card(
//            elevation: 5,
//            child: new SizedBox(
//                height: 180.0,
//                width: double.infinity,
//                child: new Carousel(
//                  images: list,
//                  boxFit: BoxFit.fitWidth,
//                  borderRadius: true,
//                  noRadiusForIndicator: false,
//                  indicatorBgPadding: 5,
////              overlayShadow: true,
//                  animationCurve: Curves.fastOutSlowIn,
//                  animationDuration: Duration(seconds: 1),
//                )),
//          )),
//    );
//  }

/*
  buildLatestProductTitle() {
    return new Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'New Arrival',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => NavigationPage(2)),
                    );
                  },
                  child: Text(
                    'See All >',
                    textAlign: TextAlign.right,
                    style:
                        TextStyle(color: Colors.black, fontFamily: 'Poppins'),
                  ))
            ],
          ),
        ));
  }
*/

  buildCurrentOfferTitle(title) {
    return new Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ));
  }

/*
  buildLatestProduct() {
    return new Container(
        //height: 500.0, //MuSt Needed
        child: new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: new ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: featureProductDataList.length,
                // itemExtent: 10.0,
                // reverse: true, //makes the list appear in descending order
                itemBuilder: (BuildContext context, int index) {
                  return LatestListItem(
                      fProduct: featureProductDataList[index]);
                })));
  }
*/

/*
  buildHotDealProduct() {
    return new Container(
//        height: 550.0, //MuSt Needed
        child: new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: new ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotdealDataList.length,
                // itemExtent: 10.0,
                // reverse: true, //makes the list appear in descending order
                itemBuilder: (BuildContext context, int index) {
                  return HotDealListItem(hProduct: hotdealDataList[index]);
                })));
  }
*/

/*
  buildOfferBannerProduct() {
//    return SliverList(
//      delegate: SliverChildListDelegate(
//        [
//          BannerOfferListItem(oBanner: bannerOfferList[0]),
//          BannerOfferListItem(oBanner: bannerOfferList[1]),
//        ],
//      ),
//    );
    return new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BannerOfferListItem(oBanner: bannerOfferList[0], isDoubleView: false),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BannerOfferListItem(
                    oBanner: bannerOfferList[1], isDoubleView: true),
                BannerOfferListItem(
                    oBanner: bannerOfferList[2], isDoubleView: true),
              ]),
          BannerOfferListItem(oBanner: bannerOfferList[3], isDoubleView: false),
          new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BannerOfferListItem(
                    oBanner: bannerOfferList[4], isDoubleView: true),
                BannerOfferListItem(
                    oBanner: bannerOfferList[5], isDoubleView: true),
              ]),
          // BannerOfferListItem(oBanner: bannerOfferList[6],isDoubleView: false),
        ]);
    */
/*return new Container(
        height: 500.0, //MuSt Needed
        child: new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: new ListView.builder(
                scrollDirection: Axis.vertical,
//                shrinkWrap: true,
//                physics: const ClampingScrollPhysics(),
                itemCount: hotdealDataList.length,
                // itemExtent: 10.0,
                // reverse: true, //makes the list appear in descending order
                itemBuilder: (BuildContext context, int index) {
                  return BannerOfferListItem(oBanner: bannerOfferList[index]);
                })));*/ /*

  }
*/
}
