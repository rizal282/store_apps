import 'package:flutter/material.dart';
import 'package:store_apps/src/constants/label_name.dart';
import 'package:store_apps/src/screens/home_store.dart';
import 'package:store_apps/src/services/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  void loginStore() async {
    final resultLogin =
        await LoginService.loginUser(username.text, password.text);

    if (resultLogin) {
      // print(resultLogin);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeStore()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                TextFormField(
                  controller: username,
                  decoration: const InputDecoration(
                      hintText: LabelName.hintUsername,
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: LabelName.hintPassword,
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => loginStore(),
                  child: Card(
                    elevation: 2,
                    child: Container(
                      height: 45,
                      decoration: const BoxDecoration(color: Colors.blueAccent),
                      child: const Center(
                        child: Text(LabelName.labelLogin),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
