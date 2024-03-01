import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/theme/button/large_button.dart';
import '../../utils/theme/controllers/controllers.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'widget/facebook_auth_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = AuthCubit.get(context);
    GlobalKey<FormState> formState = GlobalKey();
    bool obscureText = false;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: BlocBuilder<AuthCubit, AuthMainState>(builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(AppLocalizations.of(context)!.get_started,
                          style:const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      Text(AppLocalizations.of(context)!.signup_to_book_and_manage_your_appointments,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade800)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Form(
                    key: formState,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: Controllers.nameController,
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.user_name,
                                contentPadding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                              validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.the_field_empty;
                              }
                              if (!RegExp(r'^[a-zA-Z0-9_]+$')
                                  .hasMatch(value)) {
                                return AppLocalizations.of(context)!.name_dosent_corect;
                              } else {
                                return null;
                              }
    }
    ),

                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: Controllers.emailControllerl,
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.email_address,
                                contentPadding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.the_field_is_empty;
                              }
                            // if (loginCubit.emilv == "email already exist") {
                            // return AppLocalizations.of(context)!.emailalreadyexist;
                            // }
                              if (!RegExp(
                                r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$').hasMatch(value)) {
                                return "email format dosent corect";
                              } else {
                                return null;
                            }
                          },

                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.the_field_is_empty;
                              }
                              if (value.length < 6) {
                                return AppLocalizations.of(context)!.password_must_beat_most_characters_short;
                              }
                              if (!RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$')
                                  .hasMatch(value)) {
                                return AppLocalizations.of(context)!.password_format_dosent_correct;
                              }
                              if (value.length > 16) {
                                return AppLocalizations.of(context)!.password_must_beat_least_characters_long;
                              } else {
                                return null;
                              }
                            },
                            controller: Controllers.passController,
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.password,
                                contentPadding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 60,
                          child: TextFormField(
                            controller: Controllers.passTowController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return AppLocalizations.of(context)!.the_field_is_empty;
                              }
                              if (value.length < 6) {
                                return AppLocalizations.of(context)!.password_must_beat_most_characters_short;
                              }
                              if (!RegExp(r'^(?=.*[A-Z])(?=.*\d).{8,}$')
                                  .hasMatch(value)) {
                                return AppLocalizations.of(context)!.password_format_dosent_correct;
                              }
                              if (value.length > 16) {
                                return AppLocalizations.of(context)!.password_must_beat_least_characters_long;
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)!.password2,
                                contentPadding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 5),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: InkWell(
                    onTap: (){
    if (!formState.currentState!.validate()) {
    cubit.signUpCubit(Controllers.emailControllerl.text,
                          Controllers.passController.text,Controllers.nameController.text);
                    }else{

    }},
                    child: const LargeButton(
                      color: Color(0xFF43def0),
                      text: "continue",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.grey.shade300,
                          height: .5,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.o_r,
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          color: Colors.grey.shade300,
                          height: .5,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: FaceBookAuthLoginButton(),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Padding(
                  padding:const EdgeInsets.only(left: 100.0),
                  child: Row(
                    children: [
                       Text(
                         AppLocalizations.of(context)!.if_member,
                        style:const TextStyle(fontSize: 12),
                      ),
                      TextButton(
                        onPressed: ()async{
                          await  Navigator.pushNamed(context, "/login");
                        },
                        child: Text(
                          AppLocalizations.of(context)!.login_now,
                          style:const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
