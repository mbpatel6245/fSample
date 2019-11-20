import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:navigation_drawer/OfferService.dart';
import 'package:navigation_drawer/ProductListService.dart';
import 'package:navigation_drawer/model/OfferModel.dart';
import 'package:navigation_drawer/model/ProductListTopCategoryModel.dart';
import 'package:navigation_drawer/products_list_item.dart';

class ProductsListPage extends StatefulWidget {
  String subcat_id;

  ProductsListPage(this.subcat_id);

  @override
  ProductsListPageState createState() => ProductsListPageState();
}

class ProductsListPageState extends State<ProductsListPage> {
  BuildContext context;
  List<ProductTopCategoryModel> product_data;
  List<OfferBanner> bannerOfferList = new List();
  String subCatId;

  @override
  void initState() {
//    setState(() {
    subCatId = widget.subcat_id;
//    });
    super.initState();
    getOfferData();
  }

  void getOfferData() async {
    try {
      var dataForOffer = await fetchBannerForOffers();

      setState(() {
        bannerOfferList = dataForOffer.banners;
      });
    } catch (e) {
      /*Fluttertoast.showToast(
          msg: 'Please check your internet connectivity!',
          toastLength: Toast.LENGTH_SHORT);*/
      displayDialog();
    }
  }

  void displayDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Connection Info"),
          content: new Text("Please check your internet connection!"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Okay",
                style:
                    TextStyle(color: Color(0xffcf201d), fontFamily: 'Poppins'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return CupertinoPageScaffold(
        child: Container(
            child: CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverList(
            delegate: SliverChildListDelegate(
          [
            _buildListView(),
//            (bannerOfferList.length > 0)
//                ? buildOfferBannerProduct()
//                : new Container()
          ],
        ))
      ],
    )));
    /*return Scaffold(
        body: Column(
      children: <Widget>[
        _buildListView(),
        (bannerOfferList.length > 0)
            ? buildOfferBannerProduct()
            : new Container()
      ],
    ) //_buildListView(),
        );*/
  }

  _buildListView() {
    try {
      return FutureBuilder<List>(
          future: fetchProductList(subCatId),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return new Padding(
                  padding: const EdgeInsets.all(4.0),
                  //this is what you actually need
                  child: new StaggeredGridView.count(
                    crossAxisCount: 4,
                    // I only need two card horizontally
                    padding: const EdgeInsets.all(2.0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: snapshot.data.map<Widget>((item) {
                      //Do you need to go somewhere when you tap on this card, wrap using InkWell and add your route
                      return new ProductsListItem(false, item);
                    }).toList(),

                    //Here is the place that we are getting flexible/ dynamic card for various images
                    staggeredTiles: snapshot.data
                        .map<StaggeredTile>((_) => StaggeredTile.fit(2))
                        .toList(),
                    mainAxisSpacing: 3.0,
                    crossAxisSpacing: 4.0, // add some space
                  ),
                );
              } else if (!snapshot.hasData || snapshot.hasError)
                return Center(
                    child: Text("Oops! Products Not Available.",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                        )));
              //buildInfoMsg("Oops! Products Not Available.");
              else
                return Center(
                    child: new CircularProgressIndicator(
                  valueColor:
                      new AlwaysStoppedAnimation<Color>(Color(0xffcf201d)),
                ));
            } else if (snapshot.connectionState == ConnectionState.waiting)
              return Center(
                  child: new CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Color(0xffcf201d)),
              ));
            else
              return Center(
                  child: Text("Oops! Please check internet connectivity.",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                      )));
            //buildInfoMsg("Oops! Please check internet connectivity.");
          });
    } catch (e) {
//      Fluttertoast.showToast(
//          msg: 'Please check your internet connectivity!',
//          toastLength: Toast.LENGTH_SHORT);
    }
  }

//  buildOfferBannerProduct() {
//    return new Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          BannerOfferListItem(oBanner: bannerOfferList[0], isDoubleView: false),
//          new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                BannerOfferListItem(
//                    oBanner: bannerOfferList[1], isDoubleView: true),
//                BannerOfferListItem(
//                    oBanner: bannerOfferList[2], isDoubleView: true),
//              ]),
//          BannerOfferListItem(oBanner: bannerOfferList[3], isDoubleView: false),
//          new Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                BannerOfferListItem(
//                    oBanner: bannerOfferList[4], isDoubleView: true),
//                BannerOfferListItem(
//                    oBanner: bannerOfferList[5], isDoubleView: true),
//              ]),
//          // BannerOfferListItem(oBanner: bannerOfferList[6],isDoubleView: false),
//        ]);
//  }

  buildInfoMsg(String msg) {
    return Center(
        child: Text(msg,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 18,
              fontFamily: 'Poppins',
            )));
  }

  buildCircularIndicator() {
    return Center(
        child: new CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xffcf201d)),
    ));
  }
}
