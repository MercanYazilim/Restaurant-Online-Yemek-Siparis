
CREATE TABLE [dbo].[Yonetici](
	[YoneticiID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Isim] [nvarchar](50) NULL,
	[Soyisim] [nvarchar](50) NULL,
 CONSTRAINT [PK_Yonetici_1] PRIMARY KEY CLUSTERED 
(
	[YoneticiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Yemek](
	[YemekID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NULL,
	[EklentiKatID] [int] NULL,
	[YemekAdi] [nvarchar](200) NULL,
	[Resim] [nvarchar](200) NULL,
	[Fiyat] [money] NULL,
	[UrunKodu] [nvarchar](50) NULL,
	[YemekAciklama] [nvarchar](max) NULL,
	[Hit] [int] NULL,
 CONSTRAINT [PK_Yemek] PRIMARY KEY CLUSTERED 
(
	[YemekID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[UyariAyar](
	[UyariAyarID] [int] IDENTITY(1,1) NOT NULL,
	[SesID] [int] NULL,
	[Sure] [int] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_UyariAyar] PRIMARY KEY CLUSTERED 
(
	[UyariAyarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Slider](
	[SliderID] [int] IDENTITY(1,1) NOT NULL,
	[YemekID] [int] NULL,
 CONSTRAINT [PK_Slider] PRIMARY KEY CLUSTERED 
(
	[SliderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[SiparisApp](
	[SiparisAppID] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_SiparisApp] PRIMARY KEY CLUSTERED 
(
	[SiparisAppID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Siparis](
	[SiparisID] [int] IDENTITY(1,1) NOT NULL,
	[YemekID] [int] NULL,
	[Miktar] [int] NULL,
	[OdemeID] [int] NULL,
	[AdSoyad] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Adres] [nvarchar](max) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[SiparisTarihi] [smalldatetime] NULL,
	[Toplam] [money] NULL,
	[Durum] [bit] NULL,
	[SiparisAppID] [int] NULL,
 CONSTRAINT [PK_Siparis] PRIMARY KEY CLUSTERED 
(
	[SiparisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Ses](
	[SesID] [int] IDENTITY(1,1) NOT NULL,
	[SesAdi] [nvarchar](50) NULL,
	[SesYolu] [nvarchar](150) NULL,
 CONSTRAINT [PK_Ses_1] PRIMARY KEY CLUSTERED 
(
	[SesID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Sayfa](
	[SayfaID] [int] IDENTITY(1,1) NOT NULL,
	[SayfaAdi] [nvarchar](50) NULL,
	[Resim] [nvarchar](150) NULL,
	[Icerik] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sayfa] PRIMARY KEY CLUSTERED 
(
	[SayfaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[OdemeTuru](
	[OdemeID] [int] IDENTITY(1,1) NOT NULL,
	[OdemeAdi] [nvarchar](50) NULL,
 CONSTRAINT [PK_OdemeTuru] PRIMARY KEY CLUSTERED 
(
	[OdemeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

SET IDENTITY_INSERT [dbo].[OdemeTuru] ON
INSERT [dbo].[OdemeTuru] ([OdemeID], [OdemeAdi]) VALUES (1, N'Kapıda Ödeme')
INSERT [dbo].[OdemeTuru] ([OdemeID], [OdemeAdi]) VALUES (2, N'Havale İle Ödeme')
SET IDENTITY_INSERT [dbo].[OdemeTuru] OFF

CREATE TABLE [dbo].[Mesaj](
	[MesajID] [int] IDENTITY(1,1) NOT NULL,
	[Kimden] [nvarchar](150) NULL,
	[Konu] [nvarchar](150) NULL,
	[Email] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
	[Mesaj] [nvarchar](max) NULL,
	[Tarih] [smalldatetime] NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Mesaj] PRIMARY KEY CLUSTERED 
(
	[MesajID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Menu](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[YemekID] [int] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Manset](
	[MansetID] [int] IDENTITY(1,1) NOT NULL,
	[Resim] [nvarchar](150) NULL,
 CONSTRAINT [PK_Manset] PRIMARY KEY CLUSTERED 
(
	[MansetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Kategori](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](150) NULL,
	[UstKategoriID] [int] NULL,
	[Resim] [nvarchar](150) NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Hizmet](
	[HizmetID] [int] IDENTITY(1,1) NOT NULL,
	[HizmetAdi] [nvarchar](150) NULL,
	[Resim] [nvarchar](150) NULL,
	[Icerik] [nvarchar](max) NULL,
 CONSTRAINT [PK_Hizmet] PRIMARY KEY CLUSTERED 
(
	[HizmetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Hatirlat](
	[HatirlatID] [int] IDENTITY(1,1) NOT NULL,
	[Baslik] [nvarchar](50) NULL,
	[Konu] [nvarchar](max) NULL,
	[Tarih] [smalldatetime] NULL,
 CONSTRAINT [PK_Hatirlat] PRIMARY KEY CLUSTERED 
(
	[HatirlatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Haber](
	[HaberID] [int] IDENTITY(1,1) NOT NULL,
	[Konu] [nvarchar](50) NULL,
	[Resim] [nvarchar](50) NULL,
	[icerik] [nvarchar](max) NULL,
	[icerikTarihi] [smalldatetime] NULL,
	[Hit] [int] NULL,
 CONSTRAINT [PK_Haber] PRIMARY KEY CLUSTERED 
(
	[HaberID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[EklentiSiparis](
	[EklentiSiparisID] [int] IDENTITY(1,1) NOT NULL,
	[EklentiKatID] [int] NULL,
	[SiparisAppID] [int] NULL,
	[Adet] [int] NULL,
	[Tarih] [smalldatetime] NULL,
	[Toplam] [money] NULL,
 CONSTRAINT [PK_EklentiSiparis] PRIMARY KEY CLUSTERED 
(
	[EklentiSiparisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[EklentiKat](
	[EklentiKatID] [int] IDENTITY(1,1) NOT NULL,
	[EklentiAdi] [nvarchar](150) NULL,
	[AltEklentiID] [int] NULL,
	[Resim] [nvarchar](150) NULL,
	[Fiyat] [money] NULL,
 CONSTRAINT [PK_EklentiKat] PRIMARY KEY CLUSTERED 
(
	[EklentiKatID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Ayar](
	[AyarID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Footer] [nvarchar](max) NULL,
	[Aciklama] [nvarchar](max) NULL,
	[AnahtarKelime] [nvarchar](max) NULL,
	[Adres] [nvarchar](max) NULL,
	[SabitTelefon] [nvarchar](50) NULL,
	[FaxTelefon] [nvarchar](50) NULL,
	[CepTelefon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Ayar] PRIMARY KEY CLUSTERED 
(
	[AyarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

