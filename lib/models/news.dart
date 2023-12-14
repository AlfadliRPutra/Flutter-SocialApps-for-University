class News {
  final String title;
  final String link;
  final String contentSnippet;
  final String isoDate;
  final Map<String, String> image;
  final String content;

  News({
    required this.title,
    required this.link,
    required this.contentSnippet,
    required this.isoDate,
    required this.image,
    this.content = '',
  });
}

List<News> newsList = [
  News(
    title: '\‘Batoku\’ Produk Kriya Ramah Lingkungan Karya Mahasiswa UNJA',
    link:
        'https://www.unja.ac.id/batoku-produk-kriya-ramah-lingkungan-karya-mahasiswa-unja/',
    contentSnippet:
        'Tim Program Mahasiswa Wirausaha (PMW) Universitas Jambi (UNJA) mendayagunaan Batok Kelapa menjadi seni kriya berbasis kearifan lokal ramah lingkungan di era modern hingga menjadi produk yang bernama \“Batoku Jambi\”.',
    isoDate: '2023-12-14T03:16:51.000Z',
    image: {
      'small':
          'https://www.unja.ac.id/wp-content/uploads/2023/12/WhatsApp-Image-2023-11-30-at-08.26.57-e1702452327336.jpeg',
      'large':
          'https://www.unja.ac.id/wp-content/uploads/2023/12/WhatsApp-Image-2023-11-30-at-08.26.57-e1702452327336.jpeg',
    },
  ),
  News(
    title:
        'Tim Mahasiswa FH UNJA, Raih Juara 1 Best Essay dan Penghargaan Best Group of FGD dalam Ajang Semar Law Fair 2023 di UNS Solo',
    link:
        'https://www.unja.ac.id/tim-mahasiswa-fh-unja-raih-juara-1-best-essay-dan-penghargaan-best-group-of-fgd-dalam-ajang-smart-law-fair-di-uns-solo/',
    contentSnippet:
        'Tim mahasiwa Fakultas Hukum (FH) Universitas Jambi (UNJA) berhasil meraih prestasi dalam Forum Mahasiswa Hukum Indonesia Tahun 2023 pada Ajang “Semar Law Fair Mahasiswa Fakultas Hukum” yang diselenggarakan oleh Universitas Sebelas Maret (UNS) SOLO kegiatan berlangsung di Surakarta, Hotel Lorin, 7-12 Desember 2023.',
    isoDate: '2023-12-14T02:16:01.000Z',
    image: {
      'small':
          'https://www.unja.ac.id/wp-content/uploads/2023/12/WhatsApp-Image-2023-12-13-at-08.28.44-scaled-e1702431292475.jpeg',
      'large':
          'https://www.unja.ac.id/wp-content/uploads/2023/12/WhatsApp-Image-2023-12-13-at-08.28.44-scaled-e1702431292475.jpeg',
    },
  ),
  News(
    title:
        'Cerita PMM 3 UNJA di Univeristas Mataram, Jelajahi 1001 Keindahan Alam di NTB',
    link:
        'https://www.unja.ac.id/cerita-pmm-3-unja-di-univeristas-mataram-jelajahi-1001-keindahan-alam-di-ntb/',
    contentSnippet:
        'Universitas Jambi (UNJA) secara serentak melakukan monitoring dan evaluasi Pertukaran Mahasiswa Merdeka (PMM) 3 ke 78 Perguruan Tinggi penerima yang tersebar diseluruh Indonesia, pada Senin, 27 November 2023.',
    isoDate: '2023-12-20T01:16:14.000Z',
    image: {
      'small':
          'https://www.unja.ac.id/wp-content/uploads/2023/12/WhatsApp-Image-2023-12-12-at-16.09.27-e1702372626121.jpeg',
      'large':
          'https://www.unja.ac.id/wp-content/uploads/2023/12/WhatsApp-Image-2023-12-12-at-16.09.27-e1702372626121.jpeg',
    },
  ),
  News(
    title: 'Siklon Tropis Melintas RI, Bisa Bikin Wilayah Jawa Kebagian Hujan?',
    link:
        'https://www.cnnindonesia.com/teknologi/20231019195220-199-1013577/siklon-tropis-melintas-ri-bisa-bikin-wilayah-jawa-kebagian-hujan',
    contentSnippet:
        'Siklon Tropis, yang biasanya membawa air hujan, terpantau melintas sekitar Natuna. Mungkinkah ini bikin sekitar Jawa basah?',
    isoDate: '2023-10-21T00:16:47.000Z',
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2021/10/27/ilustrasi-hujan_169.jpeg?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2021/10/27/ilustrasi-hujan_169.jpeg?w=360&q=100',
    },
  ),
  News(
    title: 'FOTO: Sisa-sisa Harta Karun Notre Dame Dipamerkan Lagi di Paris',
    link:
        'https://www.cnnindonesia.com/teknologi/20231019162724-201-1013497/foto-sisa-sisa-harta-karun-notre-dame-dipamerkan-lagi-di-paris',
    contentSnippet:
        'Empat tahun setelah katedral Notre-Dame terbakar, relik dan harta karunnya kembali dipamerkan di Musée du Louvre sejak 18 Oktober 2023 hingga 19 Januari 2024.',
    isoDate: '2023-10-20T14:26:52.000Z',
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2023/10/20/harta-karun-katedral-notre-dame-de-paris-yang-terbakar-5_169.jpeg?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2023/10/20/harta-karun-katedral-notre-dame-de-paris-yang-terbakar-5_169.jpeg?w=360&q=100',
    },
  ),
  News(
    title: 'Cerita Pemberantasan Judi Online dalam 3 Babak',
    link:
        'https://www.cnnindonesia.com/teknologi/20231019193045-192-1013569/cerita-pemberantasan-judi-online-dalam-3-babak',
    contentSnippet:
        'Pemberantasan judi online di Indonesia berjalan panjang dan melelahkan. Sampai saat ini Indonesia belum benar-benar bersih dari judi online.',
    isoDate: '2023-10-20T13:25:58.000Z',
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2022/08/01/ilustrasi-judi-online_169.jpeg?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2022/08/01/ilustrasi-judi-online_169.jpeg?w=360&q=100',
    },
  ),
  News(
    title: "Menkominfo Bongkar Lokasi Server Judi Online",
    link:
        "https://www.cnnindonesia.com/teknologi/20231020160241-192-1013905/menkominfo-bongkar-lokasi-server-judi-online",
    contentSnippet:
        "Kominfo kembali menyindir negara tetangga terkait hulu aliran dana dan server judi online di RI.",
    isoDate: "2023-10-20T12:25:31.000Z",
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2022/08/19/polisi-gerebek-judi-online-di-homestay-kuta-tangkap-9-orang-4_169.jpeg?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2022/08/19/polisi-gerebek-judi-online-di-homestay-kuta-tangkap-9-orang-4_169.jpeg?w=360&q=100',
    },
  ),
  News(
    title: "Cuap-cuap Manis saat Krisis Iklim Makin Menggila",
    link:
        "https://www.cnnindonesia.com/teknologi/20231017151433-199-1012342/cuap-cuap-manis-saat-krisis-iklim-makin-menggila",
    contentSnippet:
        "Sudah sembilan tahun menjabat sebagai presiden, apa saja langkah Joko Widodo dalam menangani krisis iklim di Indonesia?",
    isoDate: "2023-10-20T11:25:53.000Z",
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2021/09/24/presiden-tanam-mangrove-di-cilacap_169.jpeg?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2021/09/24/presiden-tanam-mangrove-di-cilacap_169.jpeg?w=360&q=100',
    },
  ),
  News(
    title: "Menkominfo: Indonesia Siap Jadi Pemimpin Digital Global",
    link:
        "https://www.cnnindonesia.com/teknologi/20231020171732-218-1013929/menkominfo-indonesia-siap-jadi-pemimpin-digital-global",
    contentSnippet:
        "Menkominfo Budi Arie Setiadi menyatakan bahwa Indonesia akan terus berbenah agar dapat menjadi kekuatan utama di dunia digital global.",
    isoDate: "2023-10-20T10:59:55.000Z",
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2023/10/20/bnr-kominfo_169.jpeg?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2023/10/20/bnr-kominfo_169.jpeg?w=360&q=100',
    },
  ),
  News(
    title: "Satelit HBS Dihentikan, Menkominfo Singgung Status Komersial",
    link:
        "https://www.cnnindonesia.com/teknologi/20231020162646-213-1013914/satelit-hbs-dihentikan-menkominfo-singgung-status-komersial",
    contentSnippet:
        "Proyek Satelit HBS, yang berorientasi komersial, diterminasi oleh pemerintah. Simak penjelasan Kominfo.",
    isoDate: "2023-10-20T10:25:44.000Z",
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2023/06/13/ilustrasi-satelit-satria-1-kominfo_169.png?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2023/06/13/ilustrasi-satelit-satria-1-kominfo_169.png?w=360&q=100',
    },
  ),
  News(
    title:
        "Studi Google Ungkap Mayoritas Warga RI 'Ngiler' dengan Ponsel Lipat",
    link:
        "https://www.cnnindonesia.com/teknologi/20231019143606-206-1013422/studi-google-ungkap-mayoritas-warga-ri-ngiler-dengan-ponsel-lipat",
    contentSnippet:
        "Merujuk studi terbaru Google, sebagian besar warga Indonesia penasaran dengan ponsel lipat dan berminat memilikinya. Simak penjelasannya.",
    isoDate: "2023-10-20T09:16:55.000Z",
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2023/07/27/galaxy-z-fold-5-1_169.png?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2023/07/27/galaxy-z-fold-5-1_169.png?w=360&q=100',
    },
  ),
  News(
    title: "FOTO: Deret 'UFO' Penangkap Energi Matahari di Pegunungan Swiss",
    link:
        "https://www.cnnindonesia.com/teknologi/20231020104729-201-1013712/foto-deret-ufo-penangkap-energi-matahari-di-pegunungan-swiss",
    contentSnippet:
        "Swiss mengubah antena satelit bekas menjadi panel surya raksasa yang dipasang di daerah pegunungan. Hasilnya, sumber energi alternatif ramah lingkungan.",
    isoDate: "2023-10-20T07:50:14.000Z",
    image: {
      'small':
          'https://akcdn.detik.net.id/visual/2023/10/20/swiss-sulap-antena-satelit-jadi-plts-6_169.jpeg?w=360&q=90',
      'large':
          'https://akcdn.detik.net.id/visual/2023/10/20/swiss-sulap-antena-satelit-jadi-plts-6_169.jpeg?w=360&q=100',
    },
  ),
];
