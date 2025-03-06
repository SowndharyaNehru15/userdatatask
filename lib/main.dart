
import 'package:demouserapp/utils.dart';
import 'package:demouserapp/view/dripple/drip_ui_01.dart';

void main() {
  //initial push1
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

