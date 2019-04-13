import app from 'firebase/app';
import 'firebase/auth';

const config = {
  apiKey: "AIzaSyCdsg5hGee52xdDqe5KzMB9YMXqM5t2T3w",
  authDomain: "beetle-ac9ce.firebaseapp.com",
  databaseURL: "https://beetle-ac9ce.firebaseio.com",
  projectId: "beetle-ac9ce",
  storageBucket: "beetle-ac9ce.appspot.com",
  messagingSenderId: "280164629619"
};

  class Firebase {
    constructor() {
      app.initializeApp(config);

      this.auth = app.auth();
    }

    // *** Auth API ***

  doCreateUserWithEmailAndPassword = (email, password) =>
  this.auth.createUserWithEmailAndPassword(email, password);

  doSignInWithEmailAndPassword = (email, password) =>
  this.auth.signInWithEmailAndPassword(email, password);

  doSignOut = () => this.auth.signOut();
  doPasswordReset = email => this.auth.sendPasswordResetEmail(email);

  doPasswordUpdate = password =>
    this.auth.currentUser.updatePassword(password);
  }
  
  export default Firebase;