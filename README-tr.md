# Lxqt-l10n

## Genel Bakış

LXQt projesi bu depo, tarafından sağlanan tüm bileşenlerin Qt [TS dosyaları]
terimlerine (http://doc.qt.io/qt-5/linguist-ts-file-format.html) tercüme ederek
("yerelleştirme") sağlamaktadır.

Bileşenlerin farklı depolarından bu tekliğe aktarılması, uzun vadeli bir hedef
olan Pootle veya Transifex gibi sistemlerin çevirileri kolaylaştırmak için yapıldı.

Masaüstü Giriş dosyaları (`* .desktop`) şu an için Pootle veya Transifex tarafından
henüz kapatılamadığından şimdilik farklı bileşenler deposunda kalırlar.

Bu depoda özetlenen çevirileri kullanmanın iki yolu vardır.
Bileşenler, yapı zamanında çevirileri bu depodan alabilir. Bu depo tarafından
kapsanan tüm bileşenler şu anda varsayılan olarak yapıyor. Depo, diğer bileşenlerden
bağımsız olarak oluşturulabilir. Bu, inşa zamanında indirme yapmadan çevirilerin
oluşturulmasını sağlar ve bu da yapı sistemlerinin kısıtlamalarını hafifletebilir.
Deponun performans açısından olumlu olabileceği gibi, deponun kendisi mimari olarak
da agnostiktir; bu nedenle çeviriler, bileşen ve mimari başına bir kez değil yalnızca
bir kez inşa edilmelidir. Depo bir bütün olarak inşa edilebilir, birkaç paket halinde
bölünebilir de mümkündür.

## Derleme

### Genel

Çeviriler oluşturmak için Git, CMake, qttools ve LXQt bileşeni
[liblxqt] (https://github.com/lxqt/liblxqt) ve bağımlılığı
[libqtxdg] (https://github.com/lxqt/libqtxdg) gereklidir Bu depodan, bileşenlerin
bu depodan çekilip çekilmediğine bakılmaksızın depo kendisi inşa edilir.

### Çeviriler oluşturma zamanında çekme

Aşağı doğru paketlemeyle ilgili olarak, yukarıda belirtilen ön koşulların,
ComptonConf gibi, çalışma zamanında bunlara ihtiyaç duymayan bileşenleri sağlayan
paketlere eklenmesi gerekebileceğini ve dolayısıyla şimdiye kadar hiç gerekmediğini
belirtmek gerekir.

Tüm bileşenler varsayılan olarak çevirilerini şu anda oluşturma zamanında çekiyorlar.
Bu, bir boolean CMake değişkeni 'PULL_TRANSLATIONS' ile değiştirilebilir.

### Deponun kendisi kuruluyor

Bileşenler dikkate alınacak bir seçim, bir boolean CMake değişkeni 'WITH_ <bileşen>'
ile yapılabilir, örn. g. `WITH_LXQT_PANEL`. Bu depoda bulunan tüm bileşenler için
varsayılan olarak `ON` olur. Yukarıda belirtildiği gibi 'PULL_TRANSLATIONS'
değişkeninin CMake değişkeni, dosya çakışmaları aksine sonuçlanacağı için lxqt-l10n
depo tarafından kapsanması tasarlanan tüm bileşenlerde 'KAPALI' olarak ayarlanmalıdır.

Çalıştırma trias 'cmake`, `make` ve` make install' komutlarını her zamanki gibi
inşa etmek. Hedef kurulumda bir değişkeni `DESTDIR = <yol>` kabul eder.

## Katkı

Pootle veya Transifex gibi araçlar henüz uygulanmadığından, kullanıcılardan yerel
kaynak kodu kontrolleriyle uğraşmayı içeren çok kolay olmayan bir yaklaşımda
bulunmalarını istemeliyiz.
Wiki sayfasında [Translation] (https://github.com/lxqt/lxqt/wiki/Translation)
konu anlatılmıştır.
