import 'package:flutter/cupertino.dart';

class Slide {

  final String slogan;
  final String imgUrl;

  Slide({

    @required this.slogan,
    @required this.imgUrl
});
}

final slideList = [
  Slide( slogan: 'Evinin rahatında, tüm kaygılardan uzak, bebeğin ve kendin için en iyi olanı bil.', imgUrl: 'assets/images/rahat.jpg'),
  Slide( slogan: 'Aklındaki sorulara doğru cevaplar bul.', imgUrl: 'assets/images/soru.jpg'),
  Slide( slogan: 'Hamilelik döneminde ve anne olduktan sonra beslenme tüyoları al.', imgUrl: 'assets/images/beslenme.jpg'),
  Slide( slogan: 'Bu süreçte girebileceğin stres ya da sıkıntılarla tek başına uğraşma.', imgUrl: 'assets/images/stres.jpg'),
  Slide( slogan: 'Ayrıca, bilmediklerini öğren, bildiklerini doğrula.', imgUrl: 'assets/images/bilgi.jpg'),
  Slide( slogan: 'Hazırsan kayıt olmaya geçebiliriz.', imgUrl: 'assets/images/kayit.jpg'),
];