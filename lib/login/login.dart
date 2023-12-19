import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_8_9/login/repository/auth_repository.dart';
import '../navigation_bar/navigation_bar.dart';
import 'bloc/auth_bloc.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool hidePass = true;
    void hideStatus() {
      setState(() {
        hidePass = !hidePass;
      });
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
                child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/background.jpg"), // Укажите путь к вашему изображению
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 150,
                          ),
                          Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ThemeData().colorScheme.copyWith(
                                      primary: Colors.black,
                                    ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(16.0),
                                decoration: (BoxDecoration(
                                    color: Colors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(50))),
                                height: 300,
                                width: 380,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextFormField(
                                      style: TextStyle(color: Colors.black),
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                        labelText: "Email",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        hintText: "Напиши свою почту",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          color: Colors.black,
                                        ),
                                        // ignore: unnecessary_const
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                        // ignore: unnecessary_const
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      // validator: _validateEmail,
                                    ),
                                    TextFormField(
                                      controller: _passwordController,
                                      // obscureText: hidePass,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: const InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        labelText: "Пароль",
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                        hintText: "Напиши свой пароль",
                                        prefixIcon: Icon(
                                          Icons.security,
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 2.0),
                                        ),
                                      ),
                                    ),
                                    BlocProvider(
                                      create: (context) => LoginBloc(
                                        AuthRepository(),
                                      ),
                                      child: Center(
                                          child: BlocConsumer<LoginBloc,
                                                  LoginState>(
                                              listener: (context, state) {
                                        if (state is LoginSuccess) {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          NavigationnBar()));
                                        }
                                        if (state is LoginError) {
                                          final snackBar = SnackBar(
                                            content: Text(
                                              state.error,
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontFamily: 'Inter',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      }, builder: (context, state) {
                                        if (state is LoginLoading) {
                                          return const Center(
                                            child: SizedBox(
                                                width: 40,
                                                height: 40,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.purple,
                                                  strokeWidth: 4,
                                                )),
                                          );
                                        }
                                        return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.purple,
                                              fixedSize: Size(180, 50),
                                            ),
                                            onPressed: () async {
                                              BlocProvider.of<LoginBloc>(
                                                      context)
                                                  .add(LoginButtonPressed(
                                                      _emailController.text,
                                                      _passwordController
                                                          .text));
                                            },
                                            child: const Text(
                                              'Войти',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Inter',
                                                  fontSize: 20),
                                            ));
                                      })),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(),
                        ])))));
  }
}
