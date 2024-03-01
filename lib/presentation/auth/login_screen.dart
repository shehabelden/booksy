import 'package:booksy/presentation/auth/login_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/theme/button/large_button.dart';
import '../../utils/theme/controllers/controllers.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';
import 'widget/facebook_auth_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formState = GlobalKey();
    // bool obscureText = false;
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    AuthCubit cubit= AuthCubit.get(context);
    return Scaffold(
      body:  BlocBuilder<AuthCubit,AuthMainState>(
        builder: (context,state) {
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(top: height*.10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: width*.0555555555555556),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(AppLocalizations.of(context)!.get_started,
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                        Text(AppLocalizations.of(context)!.login_to_book_and_manage_your_appointments,
                            style:
                                TextStyle(fontSize:
                                    height *.0125, color: Colors.grey.shade800)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height*.0125,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: width*.0555555555555556,right: width*.0555555555555556),
                      child: Form(
                        key: formState,
                      child: Column(
                        children: [
                          SizedBox(
                            height: height*.0875,
                            child: TextFormField(
                              controller:Controllers.emailControllerl ,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!.email_address,
                                  contentPadding:
                                      EdgeInsets.only(top: height*.0125, bottom: height*.0125, left: width*.0138888888888889),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              validator: (value){
                                if (!RegExp(
                                    r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
                                    .hasMatch(value!)) {
                                  return AppLocalizations.of(context)!.email_format_dosent_corect;
                                }
                                // if (loginCubit.email ==
                                //     "user not found") {
                                //   return AppLocalizations.of(context)!.your_email_or_password_dose_correct;
                                // }
                                else {
                                  return null;
                                }
                              },
                            ),
                          ),
                           SizedBox(
                            height: height*.0125,
                          ),
                          SizedBox(
                            height: height*.0875,
                            child: TextFormField(
                              controller: Controllers.passController,
                              decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)!.password,
                                  contentPadding:
                                      EdgeInsets.only(top: height*.0125, bottom: height*.0125, left: width*.0138888888888889),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              validator: (value) {
                                if (value!.isEmpty)
                                {
                                  return AppLocalizations.of(context)!.the_field_empty;
                                }
                                // if (loginCubit.passe ==
                                //     "Wrong password provided for that user") {
                                //   return "";
                                // }
                                else
                                {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: height *.05,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left:width*.1388888888888889),
                    child: InkWell(
                      onTap: () {
                        cubit.signInCubit(
                          Controllers.emailControllerl.text,
                          Controllers.passController.text,);
                        if (!formState.currentState!.validate()) {}
                      else{
                      }},
                      child: const LargeButton(
                        color: Color(0xFF43def0),
                        text: "continue",
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:height*.25 ),
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
                const  Padding(
                    padding:  EdgeInsets.only(left: 50.0),
                    child:  FaceBookAuthLoginButton(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child:  Row(
                      children: [
                          Text(
                          AppLocalizations.of(context)!.if_member,
                          style:const TextStyle(fontSize: 12),
                        ),
                        TextButton(
                          onPressed: ()async{
                          await  Navigator.pushNamed(context, "/Sign_Up");
                          },
                          child: Text(
                              AppLocalizations.of(context)!.register_now,
                            style:const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
