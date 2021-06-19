importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyBHdA_zzbym9h8DC6MwTAO7AAM70lC7uo0",
    authDomain: "housebarber-a6696.firebaseapp.com",
    projectId: "housebarber-a6696",
    storageBucket: "housebarber-a6696.appspot.com",
    messagingSenderId: "338911072044",
    appId: "1:338911072044:web:c7c14263e7ad96a38c2689",
    measurementId: "G-4WYL2Y5KDW"
});

const messaging = firebase.messaging();

// Optional:

messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});