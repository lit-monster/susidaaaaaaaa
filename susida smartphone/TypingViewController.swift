//
//  TypingViewController.swift
//  susida smartphone
//
//  Created by 中村太紀 on 2020/06/12.
//  Copyright © 2020 中村太紀. All rights reserved.
//

import UIKit

class TypingViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var typingtext: UITextField!
    @IBOutlet var kotobalabel: UILabel!
    @IBOutlet var timerlabel: UILabel!
    @IBOutlet var scorelabel: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    var score: Int = 0
  
    
    @IBOutlet var imageView: UIImageView!
    
    var kotobaArray :[String] = ["アイキャク", "イチハツ", "ウラジャク", "エラブツ", "オクデン", "ガラユキ", "カワダチ", "キクバン", "キュウカツ", "クニタミ", "コウタツ", "ザイカタ", "サトミチ", "ジャクジャク", "シャッツラ", "シュクユウ", "ジュンイツ", "ジリダカ", "シワバラ", "ズクニュウ", "スミガネ", "セッシツ", "ゼッタン", "ソウジン", "タカヒモ", "ダンツウ", "チュウニン", "チンガイ", "ツマカワ", "トップヤ", "ナガシオ", "ニュウシチ", "ニンガイ", "バチビン", "ハンバリ", "ビャクサン", "ヒャクライ", "ビルシャナ", "ヒンカン", "フツジン", "ブンラン", "マンピツ", "ミスガラ", "モリッコ", "ヤナグイ", "ユウハイ", "ヨウガイ", "ライバン", "リンガク", "ワタマシ", "アイバン", "イリガタ", "ウブスナ", "エキユウ", "ガクサン", "カユバラ", "カワヅラ", "ギャクエン", "キュウハン", "ギョクダイ", "キョクヒツ", "キンサツ", "グウイン", "クワシタ", "ケッサツ", "コクグラ", "サイワン", "ザッパク", "ジキミヤ", "シバハラ", "シャクジメ", "ジュウニク", "シュツザン", "ショウミツ", "ジョサイヤ", "スイヅツ", "ダイカク", "タキツセ", "チクハク", "チュウブル", "チョウダツ", "ツルダチ", "トウヂサ", "ナタマメ", "ニッカイ", "ハナヅナ", "バンプウ", "ヒカガミ", "ヒョウビン", "ビンズル", "フミガラ", "ブンユウ", "マルウチ", "ミズグシ", "ヤブハラ", "ユウヒツ", "ラクタイ", "リョウマツ", "リンポン", "ワイリン", "アサハン", "イシナギ", "ウタザワ", "エンパツ", "オモガイ", "ガイガイ", "カラカネ", "キンギレ", "クウカブ", "グウサク", "ケチガン", "ゴウタイ", "コウバナ", "サゲシオ", "ザンカン", "シマヤマ", "シャクダイ", "ジャクマク", "シュウドリ", "ジュクミン", "ジンジツ", "スギワイ", "セツヨウ", "ゾウタン", "ダイリキ", "タンジツ", "チンダン", "ツジマチ", "テッパツ", "トクジツ", "ナカシオ", "ニンイン", "ハシヂカ", "バンシツ", "ヒキアケ", "フナダマ", "ブンジャク", "ヘキスイ", "マチヤネ", "ミンダン", "ムシバラ", "メンプク", "モンガラ", "ヤマガツ", "ユキバラ", "ラクハツ", "リラビエ", "ルイハン", "ワタユミ", "ヒャッソク", "アダナミ", "イヤサカ", "オトガイ", "オバシマ", "ガイゲン", "カラアヤ", "キサンジ", "グリハマ", "ゲキタン", "ケンゼツ", "コツジキ", "サビアユ", "ザンサイ", "シコナシ", "シャクブク", "ジンズウ", "スミナワ", "センピツ", "ソンユウ", "タカマゲ", "ダラカン", "チクロク", "チャクハツ", "ツマダカ", "テイダン", "ドウヤク", "トシバイ", "ナキヨリ", "ニンゴク", "ネイジツ", "バイシツ", "ハカハラ", "ビンカツ", "フタナリ", "ブツバチ", "ヘイフウ", "マジライ", "ミズグキ", "メイメツ", "モクネン", "ヤサガタ", "ユイワタ", "ヨウギン", "ランリン", "リンバン", "ルイラン", "レイサツ", "ワルドメ", "クガタチ", "ウカブセ", "アカガシ", "イドガエ", "ウラモリ", "オタマヤ", "カネザシ", "ガンザン", "キャラボク", "キンゼツ", "クサモノ", "ゲンタツ", "ケンテツ", "ゴテドク", "コワイイ", "サヤドウ", "ザンケツ", "ジャクソツ", "シャクモン", "シラハリ", "ジンシャク", "スイザン", "セキマツ", "タワレメ", "ダンサイ", "ツネナミ", "テコマイ", "トウゴマ", "ドンブツ", "ナワノビ", "パーゴラ", "ハコセコ", "バツヨウ", "ヒコバエ", "フツホウ", "ヘラヅケ", "ベンベツ", "ボクタク", "ホシアイ", "マンチャク", "ミノガミ", "メイビン", "モロゴエ", "ヤクゲン", "ユウヘン", "ヨナゲヤ", "ライカイ*", "リャクボウ", "レンサツ", "ロウザン", "ワカトウ", "ソホンサ", "アリギレ", "インジゴ", "ウロクズ", "オメモジ", "カイボリ", "キキゴマ", "キュウツイ", "クネンボ", "ケイブツ", "ゲンゲツ", "ゴクネツ", "コシベン", "サゲビラ", "ジキトウ", "ジョウゴヤ", "ショウモノ", "シンミチ", "スギオリ", "セトビキ", "ゼンイツ", "ゾウシキ", "ソデショウ", "タネイタ", "チョキブネ", "チンセキ", "ツリドノ", "テツムジ", "デングン", "ドウモリ", "トシヨワ", "ニコポン", "ヌキホン", "ネコイタ", "ハクハン", "ヒトオト", "ビンデン", "フミウス", "ブンケツ", "ベイフン", "ヘキセツ", "ホウドク", "ミテグラ", "メリンス", "モクグウ", "ユウヨク", "ヨコホン", "リンペン", "ルイセイ", "レツリツ", "ロウジツ", "アトボウ", "イタゴト", "ウラジロ", "オハラメ", "ガイゼン", "カワヨド", "キセワタ", "クラツボ", "ゲキゼツ", "ケシクチ", "ゴウダン", "コヤガケ", "ザツゲキ", "サントメ", "シモタヤ", "スイネン", "セセナギ", "ゼンサツ", "ソラドケ", "タネガミ", "ダンリン", "ツノダル", "デズイリ", "テンジツ", "ドカヒン", "トメヤマ", "ナオライ", "ニンメン", "ネンナシ", "ノウヘイ", "ハンセツ", "バンソツ", "ビャクゴウ", "フクボツ", "ブツコウ", "ヘナブリ", "ホウヨク", "ボクセン", "マケバラ", "ミアカシ", "メンペキ", "モトゴエ", "ヤネウマ", "ユビシャク", "ヨウハツ", "ライトウ", "リンゲン", "レンダイ", "ワクデキ", "ジオンゴ", "アミハン", "イラツメ", "ウスバタ", "オニマシ", "ガクニン", "カラハフ", "キュウクン", "キリカミ", "ギンカン", "クカタチ", "ケツメイ", "ゴクソツ", "コモダレ", "ササワラ", "ザツカブ", "ジキラン", "シタダイ", "ジャクヤク", "ショクタイ", "スギハラ", "セキテン", "ソクゲン", "ダイツウ", "タワヤメ", "チンユウ", "ツウジツ", "テンポン", "トビクラ", "ナンキツ", "ニビイロ", "ネリコウ", "ノマオイ", "バイダイ", "ハナタケ", "ビンサツ", "ブツジョウ", "フンラン", "ヘイハン", "ボウサゲ", "ミミガネ", "ムナガイ", "メシジョウ", "モウダン", "ヤクワン", "ユウサリ", "ラクバク", "レンルイ", "ワザクレ", "キョウジヤ", "マグサバ", "アシハラ", "イマワリ", "ウタギレ", "オイバラ", "カタハク", "ガンニン", "キカヌキ", "キュウタン", "ギョクタイ", "クチナワ", "コクグウ", "ササナキ", "ザップン", "ジツカタ", "ジャッキュウ", "シュクガク", "ジュンピツ", "ジョウフク", "ショッキン", "シラアヤ", "ズイジュン", "スエフロ", "タマダレ", "ダンカン", "チュウユウ", "チョクダイ", "チリヅカ", "ツバギワ", "ナイシャク", "ニッシュツ", "ニュウジャク", "ヌクバイ", "バツザン", "ハナガメ", "ヒャクシュツ", "ヒョウユウ", "ヒラジロ", "ビンパツ", "フウガン", "ブンダイ", "ホッタイ", "マチハン", "ミチキリ", "ヤクダク", "ユウシン", "ランミン", "リュウニチ", "リンラク", "ワラバイ", "エビスメ", "アオダチ", "イレガミ", "ウラドシ", "オカボレ", "ガイブツ", "カワホネ", "キツゼン", "キュウロウ", "クマタカ", "ケムダシ", "ゴウマツ", "コメオリ", "サトバラ", "ザンゼン", "ジクソウ", "シナダマ", "ジャクドク", "シャクラン", "ステガナ", "セツマイ", "ゼンテツ", "ソトワニ", "タマヨビ", "ダンアン", "ツケザシ", "テキハイ", "ドウバツ", "トキワズ", "ナゲブシ", "ネツガン", "バクセツ", "ハンナガ", "ヒンセン", "フクハイ", "ヘイユウ", "ベニガラ", "ホンプク", "ボンブン", "マツヨウ", "ミツウン", "メリカリ", "モトゴメ", "ヤクタイ", "ユイシン", "ヨココウ", "ラシャメン", "リンゼン", "レツジャク", "ロウノウ", "ワケガラ", "アカハラ", "イカナゴ", "ウツバリ", "オニガミ", "カシャガタ", "ガンサツ", "キュウサン", "キリハク", "クラジリ", "ケツゾウ", "コシバメ", "ザイゾク", "サヤマキ", "シタバエ", "ジツマイ", "スキイレ", "セキガシ", "ゼンキン", "ゾクタイ", "ソンスウ", "ダイワレ", "タシマエ", "チクカン", "チャクジン", "ツボガリ", "テキサン", "ドウニン", "トマブキ", "ニクナン", "ネツライ", "ノリサク", "ハラカワ", "バンガタ", "ヒザカブ", "フウタク", "ベイマツ", "ヘンウン", "ボウハク", "ホウブン", "マイハダ", "ミササギ", "メイダン", "モンサツ", "ヤママユ", "ユウギン", "ランスイ", "リンバツ", "レンシツ", "ヨツダマ", "ナナツヤ", "アカブサ", "イマデキ", "ウチワニ", "オカヅリ", "ガイタン", "カミヅナ", "キュウハイ", "キョクタイ", "キリギシ", "クチスギ", "ケイシツ", "ゲンプウ", "ゴウブク", "コマグミ", "サスマタ", "ジャクメツ", "ショウコト", "ジンスイ", "スイダン", "セツゼン", "ゾクガン", "ソクサン", "ダイテン", "タルカム", "チンキン", "ツウユウ", "テツアン", "ドウナカ", "トウブツ", "ナルカミ", "ニクフン", "ヌイハク", "バツブン", "ハツヤク", "パンクロ", "ヒンプン", "フミヅラ", "ヘンチツ", "マルグケ", "ミズブネ", "ムラギエ", "メイタツ", "モロハク", "ヤキフデ", "ユウブン", "ヨウユウ", "ライリン", "リクタイ", "レキダン", "シキリショ", "アルミナ", "イリガワ", "ウラナミ", "オリジャク", "カミギワ", "カラヘタ", "キュウブツ", "キンキリ", "ギンリン", "グウカン", "クミハン", "ゲンパイ", "ケンピツ", "ゴウブン", "コクダチ", "ザイテン", "サスプロ", "シタツユ", "シャクシン", "ジンガネ", "スギナリ", "センニク", "ソウバナ", "ダイジリ", "タイユウ", "チンリン", "ツウフン", "ドウバチ", "トモウラ", "ナキミソ", "ニチアン", "ネツカン", "パイカン", "ハタグモ", "バンプク", "ヒラグケ", "フシヅケ", "ヘキスウ", "ボウグイ", "ホクテキ", "マクシツ", "ミノバン", "ムカバキ", "モツヤク", "ヤクヒツ", "ユウブツ", "ライダン", "レツレツ", "ワラヅト", "ブザツサ", "アクニチ", "イトゾコ", "ウドンゲ", "オビノコ", "カゴミミ", "キュウブン", "キヨブキ", "ギンネズ", "クロブサ", "ゲイブン", "ケツジン", "コウホネ", "ゴフショウ", "サオシカ", "シオガタ", "ジストマ", "ショクオヤ", "スイフロ", "ズクテツ", "セリモチ", "ソクギン", "タンガラ", "チンポン", "ツミゴエ", "デキブツ", "テンペラ", "ドクジン", "トシウラ", "ニチロク", "ヌケウラ", "ネツルイ", "ハツヨウ", "ビンゼン", "フウドウ", "ブンコン", "ヘイグシ", "ベンプク", "ホオゲタ", "ボンコツ", "ミツミツ", "メンセル", "モウネン", "ユウズツ", "ヨロシキ", "リクゴウ", "ルイコン", "レキホン", "ロウヨウ", "チョウズバ", "ヒロメヤ", "イリホガ", "ウネオリ", "オビテツ", "カツブツ", "キケモノ", "ギンヨク", "グウゲン", "クロゴメ", "ケツブツ", "ゲツメイ", "ゴトベイ", "コモバリ", "サクジバ", "ジツゲツ", "シモセキ", "ジョウゴワ", "ショクフク", "スウヨウ", "ゼンツウ", "センベン", "ソウフク", "ゾクデン", "タングツ", "チヨロズ", "ツルオト", "テイシキ", "ドウオヤ", "トコミセ", "ニンベツ", "ヌノソウ", "ネノホシ", "ノキドイ", "ハナミゾ", "ヒンセキ", "フウブン", "プレレコ", "ヘイモツ", "ベンシキ", "ホウギン", "ボンシツ", "ミズテン", "メンネル", "モウセツ", "ユウキン", "ヨリシロ", "ラクトウ", "リクゾク", "レイモツ", "ロンキツ", "アライシュ", "アオブサ", "イチミン", "ウスヨウ", "オンドル", "カドナミ", "ギンゼン", "キンプラ", "グウモク", "クビノザ", "ゲイセツ", "ケイヒツ", "ゴウフク", "サイワリ", "ジキソン", "シロシタ", "スキイロ", "ゼイブツ", "セツヨク", "ゾウニン", "ソツドク", "タキノミ", "チクテイ", "ツイフク", "デコモノ", "テンイタ", "ドウマル", "トキギヌ", "ナスコン", "ニブイロ", "ネイジン", "バクタイ", "ハンヅラ", "ヒントウ", "フクドウ", "ブンウン", "ヘギイタ", "ボテフリ", "ホンネル", "マツガク", "ミズゴリ", "メンキツ", "モミウラ", "ユキモチ", "ヨビジオ", "ランペキ", "リツゲン", "ルイオン", "レンペイ", "ロクボク", "コセツサ", "アクガタ", "ウツボツ", "オオトシ", "ガイソク", "カニババ", "キヨズリ", "クンイク", "ゲキサイ", "ケンウン", "ゴブイン", "サイヒツ", "シャクドウ", "シロブサ", "ジンオク", "ズブロク", "スンレツ", "ゼツイキ", "ソホウカ", "ダツロウ", "タンシツ", "ツノガキ", "デイネイ", "テンテツ", "ドクギン", "トリテキ", "ナミモノ", "ハグロメ", "バリコン", "ヒヨメキ", "フトオリ", "ベツゲン", "ヘンプク", "ボウテン", "ホウヘン", "マメギン", "ミズノテ", "メンキュウ", "モモダチ", "ヤクセキ", "ユウモン", "ランコン", "リクゲイ", "ルイドウ", "レイヒツ", "ロウダン", "イジズク", "コロモデ", "セジモノ", "チソワリ", "ヨモギウ", "アンペラ", "イエヅト", "ウマノス", "エビゴシ", "オハヅケ", "ガスオリ", "カワソウ", "グウセイ", "クレワリ", "ケイグン", "ゲバルト", "ゴクソク", "ザッパイ", "サンテツ", "ジュンブン", "シラハエ", "ジンボツ", "ズイジュウ", "スソワタ", "セッタク", "ソマゴヤ", "タカドノ", "ダツゾク", "チュウミツ", "ツバモト", "デガタリ", "テンユウ", "トクハツ", "ナマヨイ", "ネダイタ", "バイボク", "ハコミヤ", "ブッサツ", "フナグリ", "ベッケイ", "ヘンモク", "ホツガン", "ボテレン", "マナカイ", "ミノガメ", "モノノグ", "ヤッチャバ", "ユカボン", "ヨコザン", "ラクハク", "レイデン", "ワレボメ", "キノエネ", "コシャホン", "シュロチク", "アイヨメ", "イツユウ", "ウデガネ", "オロヌキ", "カクソデ", "ガクボク", "キクイモ", "キュウヘイ", "クレムツ", "ゲイダン", "ケツブン", "コトテン", "サシヌカ", "シンモス", "ジンレツ", "スイニン", "セキワン", "ゾウキュウ", "ソクヅミ", "タキジマ", "ダンゴク", "チンメン", "ツノマタ", "テキテキ", "トシトク", "ドブヅケ", "ナビロメ", "ニクテイ", "ヌリゴメ", "バイベン", "ハマオギ", "ビリケン", "ヒロブタ", "ベタグミ", "ヘナツチ", "ボールド", "ホリワリ", "マルバリ", "ミチシバ", "メイギン", "モクホン", "ユウフン", "ヨワミソ", "ラクルイ", "リンレツ", "ルイゲン", "レンギン", "ロウセツ", "ゴジソウ", "フジギヌ", "アカガネ", "イキシナ", "ウチダカ", "エンシキ", "オシタジ", "カブダチ", "キュウゲン", "キングチ", "グウユウ", "クニハラ", "ケンナワ", "ゲンビン", "コトブレ", "サカシマ", "シシムラ", "ジュウシュツ", "シュクツギ", "ジンケツ", "スイフク", "セミバン", "ソマヤマ", "タイサツ", "ダットウ", "チュウジキ", "チリッパ", "ツブギン", "ドウスイ", "トネリコ", "ナミバン", "ヌキズリ", "ハイズミ", "ヒワイロ", "フシイト", "プチブル", "ブンシュク", "ヘキタン", "ベンガラ", "ホウハイ", "ボウミン", "マキワラ", "ミンシン", "ムコガネ", "メッシツ", "モクヤク", "ヤツクチ", "ユウチク", "ヨウダン", "ライヨケ", "レイゲツ", "ロクヤネ", "アーモンド", "あかちゃん", "あかとんぼ", "あくりょく", "アドバイス", "あまのがわ", "アンケート", "いとでんわ", "イヤリング", "インテリア", "うきぶくろ", "うでどけい", "えいがかん", "えかきうた", "エネルギー", "おうどいろ", "おおそうじ", "おおみそか", "おかあさん", "おこづかい", "オットセイ", "おとうさん", "おとしだま", "おにごっこ", "おひめさま", "おべんとう", "オムライス", "オルゴール", "おんどけい", "かいじゅう", "かがくしゃ", "かぐやひめ", "かくれんぼ", "かざぐるま", "カスタード", "かたぐるま", "かたつむり", "カフェオレ", "カブトムシ", "かみしばい", "かみずもう", "カメレオン", "カルシウム", "カンガルー", "かんこうち", "かんそうき", "かんでんち", "キーボード", "きねんひん", "きのこがり", "きゅうけい", "きゃくせき", "キャプテン", "きょういく", "きょうそう", "キリギリス", "きれいずき", "きんメダル", "くさだんご", "くちげんか", "けいじばん", "ケチャップ", "けっしょう", "こいのぼり", "コガネムシ", "こどものひ", "コロンブス", "こんじょう", "コンセント", "こんちゅう", "サーキット", "サーフィン", "さいゆうき", "さかあがり", "さがしもの", "さかなつり", "さくらんぼ", "サバイバル", "サポーター", "しちごさん", "じどうしゃ", "しまもよう", "しゃかいか", "ジャムパン", "ジャンケン", "シャンプー", "しゅうさい", "じゅうたん", "じゅうどう", "しゅぎょう", "しゅくだい", "しゅんかん", "しょうかき", "しょうぐん", "しょうばい", "しょうらい", "しょくどう", "しょくパン", "シルエット", "しんごうき", "すきまかぜ", "スクーター", "スタジアム", "ストライク", "ストレート", "すなあそび", "すなどけい", "スニーカー", "スパゲティ", "すべりだい", "スポンサー", "せいでんき", "せいとかい", "ソーセージ", "ダイエット", "たいりょう", "たからばこ", "たからもの", "タキシード", "たけトンボ", "たまごやき", "たまてばこ", "ちからもち", "ちきゅうぎ", "ちとせあめ", "チャーハン", "ちゃくせき", "ちゃくりく", "ちゅうごく", "ちゅうもく", "ちゅうもん", "ちょくせん", "つなわたり", "つまようじ", "テクニック", "てんじょう", "でんちゅう", "とうきょう", "トースター", "とおまわり", "とおりみち", "ところてん", "としょかん", "トロピカル", "なかなおり", "ながれぼし", "なつまつり", "なつみかん", "なつやすみ", "ななふしぎ", "なんきょく", "にっちょく", "にんぎょう", "ねんりょう", "のうぎょう", "のうりょく", "のぼりざか", "ハーモニカ", "ハイキング", "はえたたき", "バスタオル", "はつひので", "はつめいか", "はつもうで", "はとどけい", "はなばたけ", "ハプニング", "はみがきこ", "はやうまれ", "はやとちり", "はらどけい", "ハリウッド", "はりねずみ", "はるやすみ", "はれすがた", "ハロウィン", "ひこうせん", "ひざこぞう", "ひざまくら", "ひとめぼれ", "ひとりごと", "ひとりじめ", "ひとやすみ", "ひなまつり", "ひるごはん", "ひややっこ", "びょういん", "ひょうたん", "ひょっとこ", "ファックス", "ファミコン", "ふくらはぎ", "ふくわらい", "ふゆやすみ", "フライパン", "フラダンス", "フラフープ", "フラメンコ", "ヘッドホン", "べんきょう", "ほいくえん", "ほうじちゃ", "ほうちょう", "ボウリング", "ほけんしつ", "ほたてがい", "ほととぎす", "マーケット", "マグネット", "マシュマロ", "マジシャン", "マシンガン", "マスカット", "まちあわせ", "まちぼうけ", "マッサージ", "マヨネーズ", "まんじゅう", "みえっぱり", "みずがめざ","みずたまり", "ミステリー", "みせいねん", "みちじゅん", "みどりのひ", "ミニトマト", "むしめがね", "むじんとう", "めだまやき", "メッセージ", "メモちょう", "メロンパン", "めんたいこ", "ものがたり", "モノレール","ものわすれ", "もようがえ", "もらいなき", "モルモット", "モンスター", "やきざかな", "やじろべえ", "やつあたり", "やっきょく", "やまのぼり", "ゆうえんち", "ゆうしゅう", "ゆうしょう", "ゆうじょう", "ゆうしょく", "ゆきおんな", "ゆきだるま", "ゆでたまご", "ヨーグルト", "らくしょう", "らっかせい", "ヨーロッパ", "ラブレター", "ランドセル", "ランニング", "リクエスト", "リコーダー", "りっこうほ", "りょうがえ", "りょうしん", "りょくちゃ", "リラックス", "りれきしょ", "ルーレット", "れいぞうこ", "レギュラー", "レストラン", "レスリング", "れんきゅう", "レンタカー", "ログハウス", "ろてんぶろ", "ワイシャツ"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        typingtext.delegate = self
        // Do any additional setup after loading the view.
        let toolbar = UIToolbar()
        let okButton: UIBarButtonItem = UIBarButtonItem(title: "OK", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tapOkButton(_:)))
        
        toolbar.setItems([okButton], animated: true)
        toolbar.sizeToFit()
        
        typingtext.inputAccessoryView = toolbar
        kotobaArray.shuffle()
        question()
    }
    func question(){
        print("test")
        let kotobaIndex = Int.random(in: 0...4)
        kotobalabel.text = kotobaArray[kotobaIndex]
        print("testaa")
    }
    
    @objc func up() {
        count = count + 0.01
        timerlabel.text = String(format:"%.2f",count)
    }
    
    @objc func tapOkButton(_ sender: UIButton){
        // キーボードを閉じる
        self.view.endEditing(true)
        
    }
    @IBAction func random(){
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.imageView.isHidden = false
        
        
        if textField.text == kotobalabel.text{
            
            imageView.image = UIImage(named:"icon_139-1-2.png")
            timer .invalidate()
            score = score + 10
    
            self.scorelabel.text = String(self.score)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.question()
                self.imageView.isHidden = true
            }
        }else{
            imageView.image = UIImage(named:"icon_140.png")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.score = self.score - 5
                self.scorelabel.text = String(self.score)
                self.imageView.isHidden = true
                 self.question()
            }
            /*
             // MARK: - Navigation
             
             // In a storyboard-based application, you will often want to do a little preparation before navigation
             override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
             // Get the new！教えて view controller using segue.destination.
             // Pass the selected object to the new view controller.
             }
             */
            
            
        }
        
        if score >= 30{
            self.performSegue(withIdentifier: "toresult", sender: nil)
        }
        
        
        return false
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector:  #selector(self.up), userInfo: nil, repeats: true)
        }
        return true
    }
    
}

