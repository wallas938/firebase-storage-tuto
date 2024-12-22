import 'package:firebase_storage_tuto/feature/authentication/domain/bloc/authentication_bloc.dart';
import 'package:firebase_storage_tuto/feature/authentication/domain/model/authentication.model.dart';
import 'package:firebase_storage_tuto/shared/form/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? togglePages;

  const SignUpPage({super.key, required this.togglePages});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<String> fieldNames = ['name', 'email', 'password', 'confirmedPassword'];
  final Map<String, FieldData> fieldsData = {};
  final Map<String, String?> errors = {};
  late RegExp regex = RegExp(emailPattern);
  String tempPassword = '';
  String serverError = '';
  bool formState = false;

  @override
  void initState() {
    initFieldsData(fieldNames);
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  void initFieldsData(List<String> fields) {
    for (var name in fields) {
      fieldsData.addAll({
        name: FieldData(
            textEditingController: TextEditingController(),
            focusNode: FocusNode(),
            isFocused: false,
            isDirty: false,
            errorMessage: null,
            hasError: FieldErrorState.initial)
      });
      fieldsData[name]?.focusNode.addListener(() {
        setState(() {
          fieldsData[name]?.isFocused = fieldsData[name]!.focusNode.hasFocus;
        });
      });
    }
  }

  void validateField(String field, String value) {
    setState(() {
      switch (field) {
        case 'name':
          {
            if (!fieldsData[field]!.isDirty) {
              fieldsData[field]!.isDirty = true;
            }
            if (value.isEmpty) {
              fieldsData[field]?.errorMessage = 'Name cannot be empty.';
              fieldsData[field]?.hasError = FieldErrorState.invalid;
            } else {
              fieldsData[field]?.errorMessage = null;
              fieldsData[field]?.hasError = FieldErrorState.valid;
            }
          }
        case 'email':
          {
            if (!fieldsData[field]!.isDirty) {
              fieldsData[field]!.isDirty = true;
            }

            if (value.isEmpty || !regex.hasMatch(value)) {
              fieldsData[field]?.errorMessage =
                  'Entered email is not correctly formated.';
              fieldsData[field]?.hasError = FieldErrorState.invalid;
            } else {
              fieldsData[field]?.errorMessage = null;
              fieldsData[field]?.hasError = FieldErrorState.valid;
            }
          }
        case 'password':
          {
            if (!fieldsData[field]!.isDirty) {
              fieldsData[field]!.isDirty = true;
            }

            if (value.length < 6) {
              fieldsData[field]?.errorMessage =
                  'Your password must be at least six characters long.';
              fieldsData[field]?.hasError = FieldErrorState.invalid;
            } else {
              fieldsData[field]?.errorMessage = null;
              fieldsData[field]?.hasError = FieldErrorState.valid;
            }
          }
        case 'confirmedPassword':
          {
            if (!fieldsData[field]!.isDirty) {
              fieldsData[field]!.isDirty = true;
            }

            if (tempPassword.isNotEmpty && value != tempPassword ||
                tempPassword.isEmpty) {
              fieldsData[field]?.errorMessage = 'Both passwords do not match.';
              fieldsData[field]?.hasError = FieldErrorState.invalid;
              errors[field] = 'Both passwords do not match';
            } else {
              fieldsData[field]?.errorMessage = null;
              fieldsData[field]?.hasError = FieldErrorState.valid;
            }
          }
      }
    });
    isAllFieldsAreValid();
  }

  void isAllFieldsAreValid() {
    setState(() {
      bool isValid = fieldNames.every((fieldName) =>
          fieldsData[fieldName]!.hasError == FieldErrorState.valid);
      if (isValid) {
        formState = true;
      } else {
        formState = false;
      }
    });
  }

  void showSnackBar(String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(errorMessage),
    ));
  }

  void disposeControllers() {
    fieldsData.forEach((fieldName, fieldData) {
      fieldsData[fieldName]?.textEditingController.dispose();
    });
  }

  void signup(AuthenticationBloc authBloc) async {
    final name = fieldsData['name']!.textEditingController.text;
    final email = fieldsData['email']!.textEditingController.text;
    final password = fieldsData['password']!.textEditingController.text;

    AppUserCredential appUserCredential =
        AppUserCredential(name: name, email: email, password: password);

    authBloc.add(RegisterUserEvent(credential: appUserCredential));
  }

  showEventPage() {
    GoRouter.of(context).go("/events");
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();

    final screenH = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: screenH / 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SizedBox(
            width: 500,
            child: Column(
              children: [
                // FIRSTNAME
                TextField(
                  onChanged: (text) {
                    validateField('name', text);
                  },
                  controller: fieldsData['name']?.textEditingController,
                  decoration: InputDecoration(
                      hintText: 'Enter your name',
                      labelText: "Name",
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: !fieldsData['name']!.isFocused &&
                              fieldsData['name']!.hasError ==
                                  FieldErrorState.invalid
                          ? fieldsData['name']?.errorMessage
                          : null),
                ),
                const SizedBox(
                  height: 40,
                ),
                // LASTNAME
                TextField(
                  onChanged: (text) {
                    validateField('email', text);
                  },
                  focusNode: fieldsData['email']?.focusNode,
                  controller: fieldsData['email']?.textEditingController,
                  decoration: InputDecoration(
                      hintText: 'Enter an email',
                      labelText: "Email",
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: !fieldsData['email']!.isFocused &&
                              fieldsData['email']!.hasError ==
                                  FieldErrorState.invalid
                          ? fieldsData['email']?.errorMessage
                          : null),
                ),
                const SizedBox(
                  height: 40,
                ),
                // PASSWORD
                TextField(
                  onChanged: (text) {
                    tempPassword = text;
                    validateField('password', text);
                    // If confirmed password field changed at least one time
                    if (fieldsData['confirmedPassword']!.isDirty) {
                      validateField(
                          'confirmedPassword',
                          fieldsData['confirmedPassword']!
                              .textEditingController
                              .text);
                    }
                  },
                  focusNode: fieldsData['password']?.focusNode,
                  controller: fieldsData['password']?.textEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter your password',
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: !fieldsData['password']!.isFocused &&
                              fieldsData['password']!.hasError ==
                                  FieldErrorState.invalid
                          ? fieldsData['password']?.errorMessage
                          : null),
                ),
                const SizedBox(
                  height: 40,
                ),
                // CONFIRMED PASSWORD
                TextField(
                  onChanged: (text) {
                    validateField('confirmedPassword', text);
                  },
                  controller:
                      fieldsData['confirmedPassword']?.textEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Repeat your password',
                      labelText: "Confirm Password",
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: !fieldsData['confirmedPassword']!.isFocused &&
                              fieldsData['confirmedPassword']!.hasError ==
                                  FieldErrorState.invalid
                          ? fieldsData['confirmedPassword']?.errorMessage
                          : null),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: formState ? () => signup(authBloc) : null,
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.disabled)) {
                          return Colors.grey;
                        }
                        return Colors.blue;
                      },
                    ),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  child: const Text("Submit"),
                ),
                const SizedBox(
                  height: 40,
                ),
                BlocListener<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      showEventPage();
                    }
                    if (state is RegisterFailureState) {
                      showSnackBar(state.firebaseAuthException.message!);
                    }
                  },
                  child: GestureDetector(
                      onTap: widget.togglePages!,
                      child: const Text("Already have an account?")),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
