
import 'package:demouserapp/utils.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<UserModel> _filteredUsers = []; 
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _isSearching = _searchController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(23, 23, 22, 1),
      backgroundColor: const Color.fromRGBO(16, 29, 47, 1),
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: const Color.fromRGBO(16, 29, 47, 1),
          title: const Text(
            "User List",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 21,
                letterSpacing: 2),
          )),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;

          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchBarAnimation(
                    textEditingController: _searchController,
                    isOriginalAnimation: true,
                    enableKeyboardFocus: true,
                    onExpansionComplete: () {},
                    onCollapseComplete: () {},
                    onPressButton: (isSearchBarOpens) {},
                    trailingWidget: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black,
                    ),
                    secondaryButtonWidget: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black,
                    ),
                    buttonWidget: const Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black,
                    ),
                  )),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWideScreen = constraints.maxWidth > 600;

                    return Consumer<UserViewModel>(
                      builder: (context, viewModel, child) {
                        if (viewModel.isLoading) {
                          return const Center(child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        }

                        if (_isSearching) {
                          _filteredUsers = viewModel.users
                              .where((user) => user.id
                                  .toString()
                                  .contains(_searchController.text))
                              .toList();


                          if (_filteredUsers.isEmpty) {
                            return Center(
                                child: Text(
                                    'No results found for ID ${_searchController.text}',style:const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                                    );
                          }
                        } else {
                          _filteredUsers = viewModel.users;
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: isWideScreen
                              ? GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 3,
                                  ),
                                  itemCount: _filteredUsers.length,
                                  itemBuilder: (context, index) {
                                    final user = _filteredUsers[index];
                                    return UserCard(user: user);
                                  },
                                )
                              : ListView.builder(
                                  itemCount: _filteredUsers.length,
                                  itemBuilder: (context, index) {
                                    final user = _filteredUsers[index];
                                    return UserCard(user: user);
                                  },
                                ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

