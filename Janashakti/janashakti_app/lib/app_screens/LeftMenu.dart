import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiclapp/app_modals/DBHelper.dart';
import 'package:jiclapp/app_util/UserManager.dart';
import 'package:jiclapp/app_util/Utility.dart';
import 'package:jiclapp/app_util/constant.dart';

class MenuViewModel{
  final String icon;
  final String title;
  final String route;
  MenuViewModel({ this.icon, this.title, this.route });
}

final List<MenuViewModel> menuItems = [
  MenuViewModel(icon: "home.png", title: "Home", route: homeRoute),
  MenuViewModel(icon: "recruitment.png", title: "Recruitment", route: recruitmentRoute,),
  MenuViewModel(icon: "admin.png", title: "Admin", route: adminRoute,),
  MenuViewModel(icon: "new_business.png", title: "New Business", route: newBusinessRoute,),
  MenuViewModel(icon: "hierarchy.png", title: "Hierarchy", route: hierarchyRoute,),
  MenuViewModel(icon: "payment.png", title: "Payment", route: paymentRoute,),
  MenuViewModel(icon: "claims.png", title: "Claims", route: claimsRoute,),
  MenuViewModel(icon: "knowledge.png", title: "Knowledge Centre", route: knowledgeCentreRoute,),
  MenuViewModel(icon: "ic_changePassword.png", title: "Change Password", route: changePassword,),
  MenuViewModel(icon: "logout.png", title: "Logout", route: logoutRoute,),
  MenuViewModel(icon: "setting.png", title: "Setting", route: jiclSeeting),
  MenuViewModel(icon: "sync.png", title: "Master Update", route: launchRoute)
];

class LeftMenu extends StatefulWidget {
  @override
  _DisplayListViewState createState() => _DisplayListViewState();
}

class _DisplayListViewState extends State {

  @override
  Widget build(BuildContext context) {
    const IconData arrow_forward_ios = IconData(0xe5e1, fontFamily: 'MaterialIcons', matchTextDirection: true);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 178,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Utility().returnThemColorWithIndex(Utility().returnThemColorIndex())),
              child: Container(
                decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [BoxShadow(
                            color:
                            Colors.grey.withOpacity(0.6),
                            blurRadius: 18,
                            offset: Offset(6.0, 6.0))]
                    ),
                    child:  Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                            Image.asset('assets/images/launchLogo.png', alignment: Alignment.center),
                       ],
                     ), 
               
              )
             
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                for(var item in menuItems)
                  new Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        border: Border(bottom: BorderSide(color:Utility().returnThemColorWithIndex(Utility().returnThemColorIndex())))
                    ),
                    child: ListTile(
                      leading: Image.asset('assets/images/' + item.icon),
                      title: Text(item.title,
                      style: Utility().returnNormalTextStyle()),
                      trailing: Icon(arrow_forward_ios),
                      onTap: () => {
                        _onMenuBtnTapped(item)
                        // if(item.route == logoutRoute){
                        //   DBHelper().deleteLoginDataWithUsername(UserManager().userID)
                        // },
                        // Navigator.pushNamed(context, item.route)
                      },
                    ),
                  ),
              ],
              padding: EdgeInsets.zero,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onMenuBtnTapped(MenuViewModel _menuViewModel) async {
    switch (_menuViewModel.route) {
      case logoutRoute:
       Navigator.pop(context);
       DBHelper().deleteLoginDataWithUsername(UserManager().userID);
        Navigator.pushNamed(context, _menuViewModel.route);
      break;
       case launchRoute:
        Utility().activity(context);
        Future.delayed(const Duration( microseconds: 600),() async{
            final _isValid = await DBHelper().deleteCSVMasters();
          if(_isValid){
             Navigator.pop(context);
            Navigator.pushNamed(context, _menuViewModel.route);
          }
        });
      break;
      default:
       Navigator.pop(context);
       Navigator.pushNamed(context, _menuViewModel.route);
    }
  }
}

