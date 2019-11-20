import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:navigation_drawer/AboutUsPage.dart';
import 'package:navigation_drawer/CategoryService.dart';
import 'package:navigation_drawer/HomePage.dart';
import 'package:navigation_drawer/ProductListPage.dart';
import 'package:navigation_drawer/SubCategoryService.dart';
import 'package:navigation_drawer/model/CatDataModel.dart';
import 'package:navigation_drawer/model/CategoryList.dart';
import 'package:navigation_drawer/model/SubCategoryList.dart';
import 'package:navigation_drawer/user_info.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}



class NavigationPage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Cart", Icons.shopping_cart),
    new DrawerItem("Top catgories", Icons.category),
    new DrawerItem("About us", Icons.info_outline)
  ];
  int index;

  NavigationPage(this.index);

  @override
  State<StatefulWidget> createState() {
    print("createState");
    return new NavigationPageState(index);
  }
}

class NavigationPageState extends State<NavigationPage> {
  int _selectedDrawerIndex = 0;
  int _counter = 0;
  TextEditingController phoneController;
  String phone = "";
  List<CategoryModel> categoryDataList = new List();
  List<CatDataModel> catDataList = new List();
  List<Widget> drawerItems = [];
  List<String> drawerTitle = [];
  final Key expandedIconKey = UniqueKey();
  int totalCount = 0;
  ProductsListPage productListPage;
  bool _isDrawerOpen = false;

  NavigationPageState(int index) {
    _selectedDrawerIndex = index;
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();
//      case 1:
//        return new Checkout();
      case 2:
        return  productListPage;
      default:
        return new AboutUs();
//      default:
//        return new Text("Error");
    }
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
    //cartBadges();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies");
   // cartBadges();
    super.didChangeDependencies();
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    setState(() => _isDrawerOpen = false); // close the drawer
    print("select normal item");
  }

  _onSelectExpandedItem(String title, String sCatId) {
    setState(() {
      _isDrawerOpen = false;
      _selectedDrawerIndex = 2;
      // subCatId = sCatId.toString();
      productListPage = new ProductsListPage(sCatId.toString());
    });
//    setState(() => _isDrawerOpen = false); // close the drawer
    print("SELECTED title:" + title + ",Id:" + sCatId.toString());

//    Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) =>
//              ProductsListPage(subCatId)),
//    );
  }

//  cartBadges() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    Set<String> preference = prefs.getKeys();
//    int total = 0;
//    for (final key in preference) {
//      if (key.startsWith("PROD")) {
//        total++;
//      }
//    }
//    setState(() {
//      _counter = total;
//    });
//  }

  openCheckoutPage() {
    setState(() => _selectedDrawerIndex = 1);
  }

/*
DUE TO APPLE POLICY HIDE IT
  asyncInputDialog(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _subscribe = (prefs.getBool('SUBSCRIBE') ?? false);
    if (!_subscribe)
      await showDialog<String>(
        context: context,
        barrierDismissible: false,
        // dialog is dismissible with a tap on the barrier
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Enter your phone no.'),
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                  autofocus: true,
                  controller: phoneController,
                  decoration: new InputDecoration(
                      labelText: 'Phone:', hintText: 'eg. 1234567890'),
                  keyboardType: TextInputType.phone,
                ))
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('SUBMIT'),
                textColor: Color(0xffcf201d),
                onPressed: () async {
                  setState(() {
                    this.phone = phoneController.text;
                  });
                  if (phone.length < 10) {
                    Fluttertoast.showToast(
                        msg: 'Please enter valid Phone number!',
                        toastLength: Toast.LENGTH_SHORT);
                  } else {
                    print('submit called');
                    final response = await http.get(
                        Constants.API_ROOT + '/subscribe.php?mob=' + phone);

                    if (response.statusCode == 200) {
                      prefs.setBool('SUBSCRIBE', true);
                      prefs.setString('PHONE', phone);
                      prefs.commit();
                      Navigator.of(context).pop();
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Something want to wrong Please try again!',
                          toastLength: Toast.LENGTH_SHORT);
                    }
                  }
                },
              ),
              FlatButton(
                textColor: Color(0xffcf201d),
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );
  }
*/

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    phoneController = new TextEditingController();
    super.initState();
    productListPage = new ProductsListPage("0");
    //  Future.delayed(Duration.zero, () => asyncInputDialog(context));
    getCategoryData();
  }

  void getCategoryData() async {
    try {
      var data = await fetchCategory();

      setState(() {
        categoryDataList = data.categories;
      });
      getSubCategoryData();
    } catch (e) {
//      Fluttertoast.showToast(
//          msg: 'Please check your internet connectivity!',
//          toastLength: Toast.LENGTH_SHORT);
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

  void getSubCategoryData() async {
    try {
      if (categoryDataList == null || categoryDataList.length < 1) return;
      catDataList = [];
      totalCount = widget.drawerItems.length - 1;
      for (int i = 0; i < categoryDataList.length; i++) {
        var data = await fetchSubCategory(categoryDataList[i].id);
        if (data.status == 1) {
          setState(() {
            CatDataModel catDataModel = new CatDataModel();
            catDataModel.categoryId = categoryDataList[i].id;
            catDataModel.categoryName = categoryDataList[i].name;
            catDataModel.subCategoryList = data.subCategories;
            totalCount += data.subCategories.length;
            catDataList.add(catDataModel);
          });
        }
      }
      createDrawer();
    } catch (e) {
      /*Fluttertoast.showToast(
          msg: 'Please check your internet connectivity!',
          toastLength: Toast.LENGTH_SHORT);*/
      displayDialog();
    }
  }

  void createDrawer() {
    List<Widget> drawerOptions = [];
    List<String> drawerTitle = [];
    int count = 0;
    int catcount = widget.drawerItems.length + catDataList.length - 1;
    for (var i = 0; i < catcount; i++) {
      if (i >= 2 && i < catcount - 1) {
        drawerOptions.add(createExpandableItem(catDataList[count], i));
        catDataList[count]
            .subCategoryList
            .forEach((data) => drawerTitle.add(data.subcategoryname));
        count++;
      } else {
        var d = (i < (catcount - 1))
            ? widget.drawerItems[i]
            : widget.drawerItems[widget.drawerItems.length - 1];
        drawerOptions.add(createListItem(d.icon, d.title, i));
        drawerTitle.add(d.title);
      }
    }
    setState(() {
      drawerItems = drawerOptions;
      this.drawerTitle = drawerTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor:Colors.white,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: CupertinoNavigationBar(
              backgroundColor:  Color(0xFFB42827),
              border: Border.all(
                style: BorderStyle.none,
              ),
              actionsForegroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () => setState(() => _isDrawerOpen = true),
                child: Icon(
                  IconData(0xF394,
                      fontFamily: CupertinoIcons.iconFont,
                      fontPackage: CupertinoIcons.iconFontPackage),
                ),
              ),
              middle: new Text(
                  widget
                      .drawerItems[
                          (_selectedDrawerIndex > 2) ? 3 : _selectedDrawerIndex]
                      .title,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600)),
            ),
          ),
          Positioned(
              top: 90.0,
              left: 0.0,
              right: 0.0,
              child: _getDrawerItemWidget(_selectedDrawerIndex)),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            top: 0.0,
            bottom: 0.0,
            left: _isDrawerOpen
                ? 0.0
                : -(MediaQuery.of(context).size.width / 3) * 2,
            child: Container(
              width: (MediaQuery.of(context).size.width / 3) * 2,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5.0,
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height / 1.8 - 90.0) -
                        180.0,
                    color: Color(0xFFB42827),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 20.0,
                          left: 20.0,
                          child: GestureDetector(
                            onTap: () => setState(() => _isDrawerOpen = false),
                            child: Icon(
                              CupertinoIcons.clear,
                              color: Colors.white,
                              size: 45.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 46.0, bottom: 0.0),
                            child: UserInfo(
                              picture:
                                  'http://ugoldi.in/image/FinalLogo.png',
                              name: '',
                              id: '',
                              company: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height / 1.8 + 90.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 46.0, top: 0.0),
                          child: Scaffold(
                              body: ListView(
                                  shrinkWrap: true, children: drawerItems)),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    /* ---------------------------------------------------
    return new CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        middle: new Text(
            widget
                .drawerItems[
                    (_selectedDrawerIndex > 2) ? 3 : _selectedDrawerIndex]
                .title,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600)),
//        iconTheme: new IconThemeData(color: Colors.white),
        trailing: new Row(children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search, color: Colors.white),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          GestureDetector(
              onTap: () {
                setState(() => _selectedDrawerIndex = 1);
              },
              child: Badge(
                badgeContent: Text(
                  _counter.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                badgeColor: Color(0xff901614),
                child: new Icon(Icons.shopping_cart, color: Colors.white),
              )),
        ]),
      ),
      child: new Drawer(
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/transparent_logo.png"),
                  radius: 10,
                ),
                accountName: null,
                accountEmail: null),
            new Column(children: drawerItems)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );*/
  }

  ListTile createListItem(IconData icon, String title, int pos) {
    return new ListTile(
      leading: (icon != null) ? new Icon(icon) : null,
      title: new Text(title,
          style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              backgroundColor: Colors.white)),
      selected: pos == _selectedDrawerIndex,
      onTap: () => _onSelectItem(pos),
    );
  }

  ListTile createExpandListItem(
      IconData icon, String title, String subcat_id, int pos) {
    return new ListTile(
      leading: (icon != null) ? new Icon(icon) : null,
      title: new Text(title,
          style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
      selected: pos == _selectedDrawerIndex,
      onTap: () {
        _onSelectExpandedItem(title, subcat_id);
      },
    );
  }

  ExpansionTile createExpandableItem(CatDataModel d, int pos) {
    return new ExpansionTile(
      backgroundColor: Colors.grey,
      leading: new Icon(Icons.category),
      title: new Text(d.categoryName,
          style: TextStyle(
              //color: isExpanded ? Color(0xff901614) : Colors.green,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600)),
      children: getExpandableCategory(d.subCategoryList, pos),
    );
  }

  getExpandableCategory(List<SubCategoryModel> subCatModel, int pos) {
    List<Widget> expandlist = [];
    int counter = 1;
    subCatModel.forEach((data) => expandlist.add(createExpandableView(
        data.subcategoryname, data.subcategoryid, pos + (counter++))));
    return expandlist;
  }

  createExpandableView(String title, String id, int pos) {
    return createExpandListItem(null, "             " + title, id, pos);
    /*return Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: new Text(title,
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            style:
                TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600)));*/
  }
}

/*
class MenuItem extends StatelessWidget {
  final Icon icon;
  final String label;

  MenuItem({
    @required this.icon,
    @required this.label,
    int selected,
    Function() onTap,
  })  : assert(icon != null),
        assert(label != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 42.0),
        child: GestureDetector(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon.icon,
                color: Color(0xFFB42827),
              ),
              SizedBox(
                width: 8.0,
              ),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ));
  }
}
*/
