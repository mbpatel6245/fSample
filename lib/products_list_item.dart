import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer/model/ProductListTopCategoryModel.dart';

class ProductsListItem extends StatefulWidget {
  final ProductTopCategoryModel product;
  final bool isSearch;

  ProductsListItem(@required this.isSearch, @required this.product);

  ProductsListItemState createState() => ProductsListItemState();
}

class ProductsListItemState extends State<ProductsListItem> {
  ProductTopCategoryModel productModel;
  bool isSearch;
  String p_id, p_image, p_name, p_price, p_discount;

  @override
  void initState() {
    setState(() {
      productModel = widget.product;
      isSearch = widget.isSearch;
      p_id = (productModel.ProdcutID != '') ? productModel.ProdcutID : '0';
      p_image = (productModel.Image != '')
          ? productModel.Image
          : 'https://uae.microless.com/cdn/no_image.jpg';

      p_name = (productModel.ProductName != '') ? productModel.ProductName : '';
      p_price = (productModel.Price != '') ? productModel.Price : '';
      p_discount = (productModel.Discount != '') ? productModel.Discount : '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Text(p_name);
    return _buildProductItemCard(context);
    /*return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildProductItemCard(context),
      ],
    );*/
  }

  _buildProductItemCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) {
//              return SecondScreen();
             // if (isSearch)
                //return new ProductDetailPage(p_id);
//              else
//                return new ProductListDetailPage(p_id);
            },
          ),
        );
      },
      child: new Card(
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        semanticContainer: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        elevation: 0.5,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.circular(5.0),
              child: Image.network(
                p_image,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height / 4.5,
//                color: Colors.black12,
                width: MediaQuery.of(context).size.width / 2.2,
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width / 2.29,
                      child: Text(
                        p_name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      )),
                  SizedBox(
                    height: 2.0,
                  ),
                  /* Container(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: new Center(
                        child: new Html(
                          data:
                              product.Description,
                        ),
                      )),*/
//                  Text(
//                    product.Description,
//                    textAlign: TextAlign.left,
//                    style: TextStyle(
//                      fontSize: 16,
//                      color: Color(0xff8b8b8b),
//                      fontFamily: 'Poppins',
//                    ),
//                    overflow: TextOverflow.ellipsis,
//                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        "Rs.${int.parse(p_price == null || p_price.isEmpty ? "0" : p_price) - int.parse(p_discount == null || p_discount.isEmpty ? "0" : p_discount)}",
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xffcf201d),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      (int.parse(p_discount == null || p_discount.isEmpty
                                  ? "0"
                                  : p_discount) >
                              0)
                          ? Text(
                              "Rs.${p_price == null || p_price.isEmpty ? "0" : p_price}",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xffa7a6b2),
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            )
                          : new Container(),
                      SizedBox(
                        width: 8.0,
                      ),
                      (int.parse(p_discount == null || p_discount.isEmpty
                                  ? "0"
                                  : p_discount) >
                              0)
                          ? Text(
                              "Rs.${p_discount == null || p_discount.isEmpty ? "0" : p_discount} off",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Color(0xffa7a6b2),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400),
                            )
                          : new Container(),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
