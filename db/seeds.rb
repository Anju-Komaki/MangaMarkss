# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comic.create!(
  title: 'エースをねらわない',
  isbn_code: '9786543211234',
  author: '山本すみ',
  publisher: '分英社',
  title_en: 'Do not aim the ace',
  author_en: 'Sumi Yamamoto',
  publisher_en: 'BUNEI.Inc',
  body: '説明文'
)

Comic.create!(
  title: '自滅の刃',
  isbn_code: '9786543214321',
  author: '五峠小春',
  publisher: '分英社',
  title_en: 'Blade of ruining oneself',
  author_en: 'Koharu Gotouge',
  publisher_en: 'BUNEI.Inc',
  body: '説明文'
)

Comic.create!(
  title: 'ツーピース',
  isbn_code: '9786543215678',
  author: '小田一郎',
  publisher: '分英社',
  title_en: 'Two piece',
  author_en: 'Ichiro Oda',
  publisher_en: 'BUNEI.Inc',
  body: '説明文'
)

Comic.create!(
  title: '地球兄弟',
  isbn_code: '9786543218765',
  author: '地山中也',
  publisher: '能談社',
  title_en: 'Brother earth',
  author_en: 'Tyuya Chiyama',
  publisher_en: 'NOUDAN.Inc',
  body: '説明文'
)

Comic.create!(
  title: '君へ届く',
  isbn_code: '9786543212345',
  author: '椎名かほ',
  publisher: '分英社',
  title_en: 'To you',
  author_en: 'Kaho Shiina',
  publisher_en: 'BUNEI.Inc',
  body: '説明文'
)

Comic.create!(
  title: 'しのぶれど',
  isbn_code: '9786543215432',
  author: '末次ゆい',
  publisher: '能談社',
  title_en: 'Shinoburedo',
  author_en: 'Yui Suetugu',
  publisher_en: 'NOUDAN.Inc',
  body: '説明文'
)

Comic.create!(
  title: 'Orange Fish',
  isbn_code: '9786543213456',
  author: '吉田秋',
  publisher: '中学館',
  title_en: 'Orange Fish',
  author_en: 'Aki Yoshida',
  publisher_en: 'TYUGAKUKAN.Inc',
  body: '説明文'
)

Comic.create!(
  title: 'ベルサイユの桜',
  isbn_code: '9786543216543',
  author: '池田よりこ',
  publisher: '分英社',
  title_en: 'Sakura of Versailles',
  author_en: 'Yoriko Ikeda',
  publisher_en: 'BUNEI.Inc',
  body: '説明文'
)

Comic.create!(
  title: 'ミステリーと説くことなかれ',
  isbn_code: '9786543217891',
  author: '田村由紀',
  publisher: '中学館',
  title_en: 'Do not explain mystery',
  author_en: 'Yuki Tamura',
  publisher_en: 'TYUGAKUKAN.Inc',
  body: '説明文'
)

Comic.create!(
  title: '明日なに食べる？',
  isbn_code: '9786543211987',
  author: 'ながよしみふ',
  publisher: '能談社',
  title_en: 'Will you eat tomorrow',
  author_en: 'Mifu Nagayoshi',
  publisher_en: 'NOUDAN.Inc',
  body: '説明文'
)
