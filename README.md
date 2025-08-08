![Screenshot_20250808_123143_Chrome](https://github.com/user-attachments/assets/352afbac-0441-4d10-90e7-831e0b095e3d)

https://login.kiandent.ir/
 

------------------------------------------------
keytool -genkey -v -keystore C:\keystore_sigin.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
keytool -list -v -keystore C:\keystore_sigin.jks -alias upload -storepass 13691372 -keypass 13691372
------------------------------------------------

debug
SHA1: A4:C9:F6:D5:D0:4F:9D:42:DB:E9:91:72:50:F2:EB:E9:F2:27:54:24
Client ID: 995356823510-rucj102uqjmg4bdtria3voe00am30kre.apps.googleusercontent.com

cd android
./gradlew signingReport
----------------
relese
Client ID: 995356823510-hf0ispnor494kjvqb9rrv5niujjs0np6.apps.googleusercontent.com
SHA1:  F8:3F:B5:D2:5F:D5:98:A9:A9:55:A4:54:26:F4:34:14:14:2F:89:2D

----------------
<head>
  <meta name="google-signin-client_id" content="995356823510-is9p4904gpthvgvlb3hl66in0ppbakhr.apps.googleusercontent.com">
  <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
----------------



