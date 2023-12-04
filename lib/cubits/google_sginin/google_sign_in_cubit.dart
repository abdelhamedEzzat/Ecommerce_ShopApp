import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit() : super(GoogleSignInInitial());

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _auth = FirebaseAuth.instance;

  void signInWithGoogle() async {
    emit(GoogleSignLoading());

    try {
      final GoogleSignInAccount? userAccount = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      if (userAccount == null) {
        emit(const GoogleSignFaild("User account is null"));
      } else {
        final GoogleSignInAuthentication googleAuth =
            await userAccount.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final userCredential = await _auth.signInWithCredential(credential);
        emit(GoogleSignLoaded(userCredential.user!));
      }
    } catch (e) {
      emit(GoogleSignFaild(e.toString()));
    }
  }
}
