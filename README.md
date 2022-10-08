# Demo Todo App

## Backend
- upgrade backend dengan command ```npm install```
- Database MongoDB 
  - Nama database: ```todolist```
- jalankan server dengan command ```node index```
- Selesai

## Frontend - Debugging
- upgrade ```pubspec.yaml``` dengan command ```flutter pub get```
- Klik run pada class ```main.dart```
- Selesai

## Frontend Build Web
- masuk ke folder ```demo app``` dengan command ```cd demo_app```
- upgrade ```pubspec.yaml``` dengan perintah ```flutter pub get```
- jalankan perintah ```flutter build web```
- command diatas akan men-generate folder ```build/web```
- upload folder ke server
- selesai


selengkapnya cek di [Flutter build and release web app](https://docs.flutter.dev/deployment/web)

## Frontend Build Android
- masuk ke folder ```demo app``` dengan command ```cd demo_app```
- upgrade ```pubspec.yaml``` dengan perintah ```flutter pub get```
- generate keystore baru, jika sudah punya keystore silahkan skip saja.
  - Di Linux/Mac jalankan command ```keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload```
  - Di Windows jalankan command ```keytool -genkey -v -keystore %userprofile%\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload```
- Edit file ```android/key.properties``` dengan informasi keystore yang sudah di generate
- build ke .apk dengan command ```flutter build apk --split-per-abi```
- command diatas akan men-generate file .apk di  ```build/app/outputs/flutter-apk/```
- selesai.

selengkapnya cek di [Flutter build and release android app](https://docs.flutter.dev/deployment/web](https://docs.flutter.dev/deployment/android))

