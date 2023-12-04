import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
part 'facebook_signin_state.dart';

class FacebookSigninCubit extends Cubit<FacebookSigninState> {
  FacebookSigninCubit() : super(FacebookSigninInitial());
  // void signInWithFacebook() async {
  //   emit(FacebookSignLoading());
  //   // Trigger the sign-in flow
  //   try {
  //     final LoginResult loginResult = await FacebookAuth.instance
  //         .login(permissions: (["public_profile", "email"]));
  //     final token = loginResult.accessToken!.token;
  //     // Create a credential from the access token

  //     if (loginResult == null) {
  //       emit(const FacebookSignFaild("User account is null"));
  //     } else {
  //       final graphResponse = await http.get(Uri.parse(
  //           "https://graph.facebook.com/USER-ID?fields=id,name,email,picture&access_token=${token}"));
  //       final profile = jsonDecode(graphResponse.body);
  //       print("profile is equal to $profile ");

  //       final OAuthCredential facebookAuthCredential =
  //           FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //       final authCredential = await FirebaseAuth.instance
  //           .signInWithCredential(facebookAuthCredential);
  //       emit(FacebookSignLoaded(authCredential.user!));
  //     }
  //   } catch (e) {
  //     emit(FacebookSignFaild(e.toString()));
  //   }
  // }
  void signInWithFacebook() async {
    emit(FacebookSignLoading());

    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);

      if (loginResult == null) {
        emit(const FacebookSignFaild("User account is null"));
      } else {
        final token = loginResult.accessToken!.token;
        final graphResponse = await http.get(Uri.parse(
            "https://graph.facebook.com/USER-ID?fields=id,name,email,picture&access_token=${token}"));

        final profile = jsonDecode(graphResponse.body);
        print("profile is equal to $profile ");

        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(token);

        final authCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        emit(FacebookSignLoaded(authCredential.user!));
      }
    } catch (e) {
      emit(FacebookSignFaild(e.toString()));
    }
  }
}
