
import 'package:demouserapp/utils.dart';
import 'package:demouserapp/view/dripple/drip_ui_01.dart';

void main() {
  //github test 2
  //bitbucket
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()..fetchUsers()),
      ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        //FirstUserList(),
        UserScreen(),
 
      ),
    ),
  );
}

