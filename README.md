# ሱራ አል በቀራ በኡስታዝ ባህሩ ተካ (Quran Tefsir App)

የቁርኣን ተፍሲር (Quran Tefsir) ሞባይል አፕሊኬሽን በ **Flutter** ማዕቀፍ የተሰራ ሲሆን፣ ኡስታዝ ባህሩ ተካ ያቀረቡትን የሱራ አል በቀራ የ29 ክፍሎች የድምጽ (Audio) ተፍሲር በቀላሉ ማዳመጥ የሚያስችል ነው።

---

## 📱 ዋና ዋና ባህሪያት (Features)

* **29 የተፍሲር ክፍሎች፦** ከክፍል 1 እስከ ክፍል 29 ያሉት የድምጽ ክፍሎች ከነ ንዑስ ርዕሶቻቸው (የአንቀጽ ክልሎች) ተደራጅተዋል።
* **የድምጽ ማጫወቻ (Audio Playback):** እያንዳንዱን ክፍል መጫወት (Play) እና ማቆም (Pause) የሚያስችል ቀላል እና ፈጣን ሲስተም።
* **ውብ ዲዛይን (Modern UI):** ከባህላዊ እና ማራኪ የካርድ ግሪድ (Grid View) ንድፍ ጋር የተዋቀረ።
* **መስቀለኛ መድረክ (Cross-Platform):** ለ Android፣ iOS እና Web (Chrome) የሚሆን።

---

## 🛠️ የተጠቀሙባቸው ቴክኖሎጂዎች (Technologies Used)

* **Flutter** - ማዕቀፍ (Framework)
* **Dart** - የፕሮግራሚንግ ቋንቋ
* **audioplayers** - የድምጽ ፋይሎችን ከ Assets ለማጫወት የሚያገለግል ፓኬጅ

---

## 📂 የፕሮጀክት አወቃቀር (Folder Structure)

```text
quran_tefsir_app/
├── assets/
│   ├── audio/          # የድምጽ ፋይሎች (ክፍል_1.mp3 እስከ ክፍል_29.mp3)
│   └── images/         
├── lib/
│   └── main.dart       # ዋናው የኮድ ማህደር
├── pubspec.yaml        # የፓኬጅ እና አሴቶች ማስተካከያ ፋይል
└── README.md           # የፕሮጀክት መግለጫ