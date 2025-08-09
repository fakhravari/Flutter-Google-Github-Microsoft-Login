https://login.kiandent.ir/


1) ساخت keystore دیباگ و ریلیز و رفتن sha1
2) تنظیمات keystore در build.gradle.kts
3) وب بدون تغیر است

------------------------------------------------
keytool -genkey -v -keystore C:\keystore\keystore_sigin.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias upload
keytool -list -v -keystore C:\keystore\keystore_sigin.jks -alias upload -storepass 13691372 -keypass 13691372
------------------------------------------------

debug
SHA1: A4:C9:F6:D5:D0:4F:9D:42:DB:E9:91:72:50:F2:EB:E9:F2:27:54:24
Client ID: 995356823510-rucj102uqjmg4bdtria3voe00am30kre.apps.googleusercontent.com


1) cmd>    cd /d D:\Repositories\GitHub\Flutter-Google-Github-Microsoft-Login\android 
2) gradlew signingReport

keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore -storepass android -keypass android
----------------
relese
Client ID: 995356823510-hf0ispnor494kjvqb9rrv5niujjs0np6.apps.googleusercontent.com
SHA1:  BA:FE:15:3E:2B:74:13:DD:A7:95:7E:DB:E4:78:EE:9F:4E:8F:1E:BC

----------------
<head>
  <meta name="google-signin-client_id" content="995356823510-is9p4904gpthvgvlb3hl66in0ppbakhr.apps.googleusercontent.com">
  <script src="https://accounts.google.com/gsi/client" async defer></script>
</head>
----------------
git add file 
use folder android > git add -f key.properties
git commit -m "Add key.properties to repo"
git push
--------------------------------------------------
flutter run -d web-server
