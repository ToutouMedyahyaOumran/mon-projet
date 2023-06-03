import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'hello': 'Hello World', "welcomeText": " welcomme ",
           "message":"With mauriUrgence your life is closer \n to safety, you just have to inform us \n to take the necessary measures",
           "message1":"Ambulances equipped with a trained rescue \n team for critical cases'",
           "message2":"A medical rescue team equipped with the latest \n medical tools"
        },
        'fr': {
          'hello': 'Hallo Welt',
          "welcomeText": " Salut  bienvenue ",
          "message":
              "Avec mauriUrgence votre vie est  plus proche \n de la securite, Il vous suffit de nous  informer \n pour prendre les mesures nécessaires ",
          "message1":
              "Ambulances équipées d'une équipe \n de secours formée pour les cas critiques'",
              "message2":"Une équipe de secours médical équipée des derniers\n outils médicaux, avec une voiture médicale qui\n vous atteindra où que vous soyez"
        },
        'ar': {
          "welcomeText": " اهلا وسهلا ",
          "message":
              "  مع mauriUrgence حياتك أقرب إلى الأمان ، ما عليك سوى إبلاغنا  لاتخاذ الإجراءات اللازمة",
          "message1": 'سيارات إسعاف مجهزة  بفريق إنقاذ مدرب للحالات الحرجة)',
          "message2":"فريق إنقاذ طبي مجهز بأحدث  الأدوات الطبية ، وسيارة طبية  ستصل إليك أينما كنت"
        },

        // 'hi': {'hello': 'Hello World', "welcomeText": " स्वागत है "},
      };
}
