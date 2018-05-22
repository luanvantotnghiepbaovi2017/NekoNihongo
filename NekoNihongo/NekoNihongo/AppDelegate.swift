//
//  AppDelegate.swift
//  NekoNihongo
//
//  Created by Bao on 9/11/17.
//  Copyright © 2017 ViBao. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    static let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    
    static var minnaNihongoLesson01Array = [NekoModel]()
    
    static var minnaNihongoLesson02Array = [NekoModel]()
    
    static var countOfMinnaLessons = 0;
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        Thread.sleep(forTimeInterval: 2.0)
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor(red: 254.0/255.0, green: 196.0/255.0, blue: 44.0/255.0, alpha: 1.0)
        let navbarFont = UIFont(name: "BalsamiqSansBold", size: 22) ?? UIFont.systemFont(ofSize: 17)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: navbarFont, NSAttributedStringKey.foregroundColor:UIColor.white]
        
        self.initMinnaNihongoLesson01()
        
        self.initMinnaNihongoLesson02()
        
        return true
    }
    
    func initMinnaNihongoLesson01() {
        
        AppDelegate.countOfMinnaLessons = AppDelegate.countOfMinnaLessons + 1
        
        AppDelegate.minnaNihongoLesson01Array = [
            NekoModel(nekoJapanese: "わたし", nekoLatin: "watashi", nekoKanji: "私", nekoKanjiHanViet: "Tư", nekoVietNamese: "tôi", nekoEnglish: "I", nekoSound: "私"),
            
            NekoModel(nekoJapanese: "わたしたち", nekoLatin: "watashitachi", nekoKanji: "私たち", nekoKanjiHanViet: "Tư", nekoVietNamese: "chúng tôi, chúng ta", nekoEnglish: "we", nekoSound: "私たち"),
            
            NekoModel(nekoJapanese: "あなた", nekoLatin: "anata", nekoKanji: "貴方", nekoKanjiHanViet: "Quý Phương", nekoVietNamese: "anh/ chị/ ông/ bà, bạn ngôi thứ 2 số ít", nekoEnglish: "you", nekoSound: "貴方"),
            
            NekoModel(nekoJapanese: "あのひと", nekoLatin: "anohito", nekoKanji: "あの人", nekoKanjiHanViet: "Nhân", nekoVietNamese: "người kia, người đó", nekoEnglish: "that person, he, she", nekoSound: "あの人"),
            
            NekoModel(nekoJapanese: "あのかた", nekoLatin: "anokata", nekoKanji: "あの方", nekoKanjiHanViet: "Phương", nekoVietNamese: "あのかた là cách nói lịch sự của あのひと , vị kia", nekoEnglish: "あのかた is the polite equivalent of あのひと", nekoSound: "あの方"),
            
            NekoModel(nekoJapanese: "みなさん", nekoLatin: "minasan", nekoKanji: "皆さん", nekoKanjiHanViet: "Giai", nekoVietNamese: "các anh chị, các ông bà, các bạn, quý vị", nekoEnglish: "ladies and gentlemen, all of you", nekoSound: "皆さん"),
            
            NekoModel(nekoJapanese: "〜さん", nekoLatin: "san", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "anh, chị, ông, bà (cách gọi người khác một cách lịch sự bằng cách thêm từ này vào sau tên của người đó)", nekoEnglish: "Mr., Ms. (title of respect added to a name)", nekoSound: "さん"),
            
            NekoModel(nekoJapanese: "〜ちゃん", nekoLatin: "chan", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "(hậu tố thêm vào sau tên của trẻ em thay cho ～さん, dùng cho bé gái)", nekoEnglish: "(suffix often added to a child's name instead of ～さん)", nekoSound: "ちゃん"),
            
            NekoModel(nekoJapanese: "〜くん", nekoLatin: "kun", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "(hậu tố thêm vào sau tên của bé trai)", nekoEnglish: "(suffix often added to a boy's name", nekoSound: "くん"),
            
            NekoModel(nekoJapanese: "〜じん", nekoLatin: "jin", nekoKanji: "～人", nekoKanjiHanViet: "Nhân", nekoVietNamese: "(hậu tố mang nghĩa “người (nước)~”; ví dụ アメリカじん: Người Mỹ)", nekoEnglish: "suffix meaning a national of; e.g., アメリカじん, an American", nekoSound: "じん"),
            
            NekoModel(nekoJapanese: "せんせい", nekoLatin: "sensei", nekoKanji: "先生", nekoKanjiHanViet: "Tiên Sinh", nekoVietNamese: "thầy/ cô (không dùng khi nói về nghề nghiệp giáo viên của mình)", nekoEnglish: "teacher, instructor (not use when referring to one's own job)", nekoSound: "先生"),
            
            NekoModel(nekoJapanese: "きょうし", nekoLatin: "kyoushi", nekoKanji: "教師", nekoKanjiHanViet: "Giáo Sư", nekoVietNamese: "giáo viên", nekoEnglish: "teacher, instructor", nekoSound: "教師"),
            
            NekoModel(nekoJapanese: "がくせい", nekoLatin: "gakusei", nekoKanji: "学生", nekoKanjiHanViet: "Học Sinh", nekoVietNamese: "học sinh, sinh viên", nekoEnglish: "student", nekoSound: "学生"),
            
            NekoModel(nekoJapanese: "かいしゃいん", nekoLatin: "kaishain", nekoKanji: "会社員", nekoKanjiHanViet: "Hội Xã Viên", nekoVietNamese: "nhân viên công ty", nekoEnglish: "company employee", nekoSound: "会社員"),
            
            NekoModel(nekoJapanese: "しゃいん", nekoLatin: "shain", nekoKanji: "社員", nekoKanjiHanViet: "Xã Viên", nekoVietNamese: "nhân viên công ty ～ (dùng với tên công ty. Vd: IMCの しゃいん)", nekoEnglish: "employee of ～ Company (used with a company's name; e.g., IMCの しゃいん)", nekoSound: ""),
            
            NekoModel(nekoJapanese: "ぎんこういん", nekoLatin: "ginkouin", nekoKanji: "銀行員", nekoKanjiHanViet: "Ngân Hàng Viên", nekoVietNamese: "nhân viên ngân hàng", nekoEnglish: "bank employee", nekoSound: "銀行員"),
            
            NekoModel(nekoJapanese: "いしゃ", nekoLatin: "isha", nekoKanji: "医者", nekoKanjiHanViet: "Y Giả", nekoVietNamese: "bác sĩ", nekoEnglish: "medical doctor", nekoSound: "医者"),
            
            NekoModel(nekoJapanese: "けんきゅうしゃ", nekoLatin: "kenkyuusha", nekoKanji: "研究者", nekoKanjiHanViet: "Nghiên Cứu Giả", nekoVietNamese: "nhà nghiên cứu", nekoEnglish: "researcher, scholar", nekoSound: "研究者"),
            
            NekoModel(nekoJapanese: "エンジニア", nekoLatin: "enjinia", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "kỹ sư", nekoEnglish: "engineer", nekoSound: "エンジニア"),
            
            NekoModel(nekoJapanese: "だいがく", nekoLatin: "daigaku", nekoKanji: "大学", nekoKanjiHanViet: "Đại Học", nekoVietNamese: "đại học, trường đại học", nekoEnglish: "university", nekoSound: "大学"),
            
            NekoModel(nekoJapanese: "びょういん", nekoLatin: "byouin", nekoKanji: "病院", nekoKanjiHanViet: "Bệnh Viện", nekoVietNamese: "bệnh viện", nekoEnglish: "hospital", nekoSound: "病院"),
            
            NekoModel(nekoJapanese: "でんき", nekoLatin: "denki", nekoKanji: "電気", nekoKanjiHanViet: "Điện Khí", nekoVietNamese: "điện, đèn điện", nekoEnglish: "electricity, light", nekoSound: "電気"),
            
            NekoModel(nekoJapanese: "だれ (どなた)", nekoLatin: "dare donata", nekoKanji: "誰何方", nekoKanjiHanViet: "Hà Phương", nekoVietNamese: "ai (どなた là cách nói lịch sự của だれ, vị nào)", nekoEnglish: "who (どなた is the polite equivalent of だれ)", nekoSound: "だれ、どなた"),
            
            NekoModel(nekoJapanese: "〜さい", nekoLatin: "sai", nekoKanji: "～歳", nekoKanjiHanViet: "Tuế", nekoVietNamese: "― tuổi", nekoEnglish: "― years old", nekoSound: "さい"),
            
            NekoModel(nekoJapanese: "なんさい(おいくつ)", nekoLatin: "nansai oikutsu", nekoKanji: "何歳", nekoKanjiHanViet: "Hà Tuế", nekoVietNamese: "mấy tuổi, bao nhiêu tuổi (おいくつ là cách nói lịch sự của なんさい)", nekoEnglish: "how old (おいくつ is the polite equivalent of なんさい)", nekoSound: "何歳ですか"),
            
            NekoModel(nekoJapanese: "はい", nekoLatin: "hai", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "vâng, dạ", nekoEnglish: "yes", nekoSound: "はい"),
            
            NekoModel(nekoJapanese: "いいえ", nekoLatin: "iie", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "không", nekoEnglish: "no", nekoSound: "いいえ"),
            
            NekoModel(nekoJapanese: "しつれいですが", nekoLatin: "shitsuredesuga", nekoKanji: "失礼ですが", nekoKanjiHanViet: "Thất Lễ", nekoVietNamese: "xin lỗi,…", nekoEnglish: "Excuse me, but", nekoSound: ""),
            
            NekoModel(nekoJapanese: "おなまえは？", nekoLatin: "onamaewa", nekoKanji: "お名前は？", nekoKanjiHanViet: "Danh Tiền", nekoVietNamese: "Tên anh/chị là gì?", nekoEnglish: "May I have your name?", nekoSound: ""),
            
            NekoModel(nekoJapanese: "はじめまして", nekoLatin: "hajimemashite", nekoKanji: "初めまして", nekoKanjiHanViet: "Sơ", nekoVietNamese: "Rất hân hạnh được gặp anh/chị", nekoEnglish: "How do you do? (I am meeting you for the first time. Usually used as the first phrase when introducing oneself)", nekoSound: ""),
            
            NekoModel(nekoJapanese: "どうぞよろしく(おねがいします)", nekoLatin: "douzoyoroshiku onegaishimasu", nekoKanji: "どうぞよろしく(お願いします)", nekoKanjiHanViet: "Nguyện", nekoVietNamese: "Rất mong được sự giúp đỡ của anh/chị", nekoEnglish: "Pleased to meet you. (Please be nice to me. Usually used at the end of a self-introduction)", nekoSound: ""),
            
            NekoModel(nekoJapanese: "こちらは～です。", nekoLatin: "kochirawa～desu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Đây là anh/chị/ông/bà ～.", nekoEnglish: "This is Mr./Ms.～", nekoSound: ""),
            
            NekoModel(nekoJapanese: "〜からきました。", nekoLatin: "～karakimashita", nekoKanji: "～から来ました", nekoKanjiHanViet: "Lai", nekoVietNamese: "(tôi) đến từ ～", nekoEnglish: "I came (come) from ～", nekoSound: ""),
            
            NekoModel(nekoJapanese: "アメリカ", nekoLatin: "amerika", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Mỹ", nekoEnglish: "U.S.A", nekoSound: "アメリカ"),
            
            NekoModel(nekoJapanese: "イギリス", nekoLatin: "igirisu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Anh", nekoEnglish: "U.K", nekoSound: "イギリス"),
            
            NekoModel(nekoJapanese: "インド", nekoLatin: "indo", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Ấn Độ", nekoEnglish: "India", nekoSound: "インド"),
            
            NekoModel(nekoJapanese: "インドネシア", nekoLatin: "indoneshia", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Indonesia", nekoEnglish: "Indonesia", nekoSound: "インドネシア"),
            
            NekoModel(nekoJapanese: "かんこく", nekoLatin: "kankoku", nekoKanji: "韓国", nekoKanjiHanViet: "Hàn Quốc", nekoVietNamese: "Nước Hàn Quốc", nekoEnglish: "South Korea", nekoSound: "韓国"),
            
            NekoModel(nekoJapanese: "タイ", nekoLatin: "tai", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Thái Lan", nekoEnglish: "Thailand", nekoSound: "タイ"),
            
            NekoModel(nekoJapanese: "ちゅうごく", nekoLatin: "chuugoku", nekoKanji: "中国", nekoKanjiHanViet: " Trung Quốc", nekoVietNamese: "Nước Trung Quốc", nekoEnglish: "China", nekoSound: "中国"),
            
            NekoModel(nekoJapanese: "ドイツ", nekoLatin: "doitsu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Đức", nekoEnglish: "Germany", nekoSound: "ドイツ"),
            
            NekoModel(nekoJapanese: "にほん", nekoLatin: "nihon", nekoKanji: "日本", nekoKanjiHanViet: "Nhật Bản", nekoVietNamese: "Nước Nhật Bản", nekoEnglish: "Japan", nekoSound: "日本"),
            
            NekoModel(nekoJapanese: "フランス", nekoLatin: "furansu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Pháp", nekoEnglish: "France", nekoSound: "フランス"),
            
            NekoModel(nekoJapanese: "ブラジル", nekoLatin: "burajiru", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Braxin", nekoEnglish: "Brazil", nekoSound: "ブラジル"),
            
            NekoModel(nekoJapanese: "エジプト", nekoLatin: "ejiputo", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Ai Cập", nekoEnglish: "Egypt", nekoSound: "エジプト"),
            
            NekoModel(nekoJapanese: "オーストラリア", nekoLatin: "osutoraria", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Úc", nekoEnglish: "Australia", nekoSound: "オーストラリア"),
            
            NekoModel(nekoJapanese: "カナダ", nekoLatin: "canada", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Canada", nekoEnglish: "Canada", nekoSound: "カナダ"),
            
            NekoModel(nekoJapanese: "サウジアラビア", nekoLatin: "saujiarabia", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Ả Rập Saudi", nekoEnglish: "Saudi Arabia", nekoSound: "サウジアラビア"),
            
            NekoModel(nekoJapanese: "シンガポール", nekoLatin: "shingaporu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Singapore", nekoEnglish: "Singapore", nekoSound: "シンガポール"),
            
            NekoModel(nekoJapanese: "スペイン", nekoLatin: "supein", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Tây Ban Nha", nekoEnglish: "Spain", nekoSound: "スペイン"),
            
            NekoModel(nekoJapanese: "フィリピン", nekoLatin: "firipin", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Philippines", nekoEnglish: "Philippines", nekoSound: "フィリピン"),
            
            NekoModel(nekoJapanese: "ベトナム", nekoLatin: "betonamu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Việt Nam", nekoEnglish: "Vietnam", nekoSound: "ベトナム"),
            
            NekoModel(nekoJapanese: "マレーシア", nekoLatin: "mareshia", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Malaysia", nekoEnglish: "Malaysia", nekoSound: "マレーシア"),
            
            NekoModel(nekoJapanese: "メキシコ", nekoLatin: "mekishiko", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Mexico", nekoEnglish: "Mexico", nekoSound: "メキシコ"),
            
            NekoModel(nekoJapanese: "ロシア", nekoLatin: "roshia", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Nước Nga", nekoEnglish: "Russia", nekoSound: "ロシア"),
            
            NekoModel(nekoJapanese: "さくらだいがく", nekoLatin: "sakuradaigaku", nekoKanji: "桜大学", nekoKanjiHanViet: "Anh Đại Học", nekoVietNamese: "Trường Đại học Sakura (giả tưởng)", nekoEnglish: "Sakura University (fictitious university)", nekoSound: ""),
            
            NekoModel(nekoJapanese: "ふじだいがく", nekoLatin: "fujidaigaku", nekoKanji: "富士大学", nekoKanjiHanViet: "Phú Sĩ Đại Học", nekoVietNamese: "Trường Đại học Fuji (giả tưởng)", nekoEnglish: "Fuji University (fictitious university)", nekoSound: ""),
            
            NekoModel(nekoJapanese: "パワーでんき", nekoLatin: "pawa denki", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Công ty điện Power", nekoEnglish: "fictitious company", nekoSound: ""),
            
            NekoModel(nekoJapanese: "ブラジルエアー", nekoLatin: "burajiruea", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Hãng hàng không Brazin", nekoEnglish: "fictitious company", nekoSound: ""),
            
            NekoModel(nekoJapanese: "IMC", nekoLatin: "IMC", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Công ty IMC", nekoEnglish: "fictitious company", nekoSound: ""),
            
            NekoModel(nekoJapanese: "こうべびょういん", nekoLatin: "koubebyouin", nekoKanji: "神戸病院", nekoKanjiHanViet: "Thần Hộ Bệnh Viện", nekoVietNamese: "Bệnh viện Kobe (giả tưởng)", nekoEnglish: "Kobe Hospital (fictitious Hospital)", nekoSound: "")
            
        ]
        
    }
    
    func initMinnaNihongoLesson02() {
        
        AppDelegate.countOfMinnaLessons = AppDelegate.countOfMinnaLessons + 1
        
        AppDelegate.minnaNihongoLesson02Array = [
            NekoModel(nekoJapanese: "これ", nekoLatin: "kore", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "cái này, đây (vật ở gần người nói)", nekoEnglish: "this (thing here)", nekoSound: "これ"),
            
            NekoModel(nekoJapanese: "それ", nekoLatin: "sore", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "cái đó, đó (vật ở gần người nghe)", nekoEnglish: "that (thing near you)", nekoSound: "それ"),
            
            NekoModel(nekoJapanese: "あれ", nekoLatin: "are", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "cái kia, kia (vật ở xa cả người nói và người nghe)", nekoEnglish: "that (thing over there)", nekoSound: "あれ"),
            
            NekoModel(nekoJapanese: "この～", nekoLatin: "kono", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "～ này", nekoEnglish: "this ～ , this ～ here", nekoSound: ""),
            
            NekoModel(nekoJapanese: "その～", nekoLatin: "sono", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "～ đó", nekoEnglish: "that ～ , that ～ near you", nekoSound: ""),
            
            NekoModel(nekoJapanese: "あの～", nekoLatin: "ano", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "～ kia", nekoEnglish: "that ～ , that ～ over there", nekoSound: ""),
            
            NekoModel(nekoJapanese: "ほん", nekoLatin: "hon", nekoKanji: "本", nekoKanjiHanViet: "Bản", nekoVietNamese: "sách", nekoEnglish: "book", nekoSound: "本"),
            
            NekoModel(nekoJapanese: "じしょ", nekoLatin: "jisho", nekoKanji: "辞書", nekoKanjiHanViet: "Từ Thư", nekoVietNamese: "từ điển", nekoEnglish: "dictionary", nekoSound: "辞書"),
            
            NekoModel(nekoJapanese: "ざっし", nekoLatin: "zasshi", nekoKanji: "雑誌", nekoKanjiHanViet: "Tạp Chí", nekoVietNamese: "tạp chí", nekoEnglish: "magazine", nekoSound: "雑誌"),
            
            NekoModel(nekoJapanese: "しんぶん", nekoLatin: "shinbun", nekoKanji: "新聞", nekoKanjiHanViet: "Tân Văn", nekoVietNamese: "báo", nekoEnglish: "newspaper", nekoSound: "新聞"),
            
            NekoModel(nekoJapanese: "ノート", nekoLatin: "noto", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "tập, vở", nekoEnglish: "notebook", nekoSound: "ノート"),
            
            NekoModel(nekoJapanese: "てちょう", nekoLatin: "techou", nekoKanji: "手帳", nekoKanjiHanViet: "Thủ Trướng", nekoVietNamese: "sổ tay", nekoEnglish: "pocket notebook", nekoSound: "手帳"),
            
            NekoModel(nekoJapanese: "めいし", nekoLatin: "meishi", nekoKanji: "名詞", nekoKanjiHanViet: "Danh Từ", nekoVietNamese: "danh thiếp", nekoEnglish: "business card", nekoSound: "名詞"),
            
            NekoModel(nekoJapanese: "カード", nekoLatin: "kado", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "thẻ, cạc", nekoEnglish: "card", nekoSound: "カード"),
            
            NekoModel(nekoJapanese: "テレホンカード", nekoLatin: "terehonkado", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "thẻ điện thoại", nekoEnglish: "telephone card", nekoSound: "テレホンカード"),
            
            NekoModel(nekoJapanese: "えんぴつ", nekoLatin: "enpitsu", nekoKanji: "鉛筆", nekoKanjiHanViet: "Duyên Bút", nekoVietNamese: "bút chì", nekoEnglish: "pencil", nekoSound: "鉛筆"),
            
            NekoModel(nekoJapanese: "ボールペン", nekoLatin: "borupen", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "bút bi", nekoEnglish: "ballpoint pen", nekoSound: "ボールペン"),
            
            NekoModel(nekoJapanese: "シャープペンシル", nekoLatin: "shapupenshiru", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "bút chì kim, bút chì bấm", nekoEnglish: "mechanical pencil, propelling pencil", nekoSound: "シャープペンシル"),
            
            NekoModel(nekoJapanese: "かぎ", nekoLatin: "kagi", nekoKanji: "鍵", nekoKanjiHanViet: "Kiện", nekoVietNamese: "chìa khóa", nekoEnglish: "key", nekoSound: "かぎ"),
            
            NekoModel(nekoJapanese: "とけい", nekoLatin: "tokei", nekoKanji: "時計", nekoKanjiHanViet: "Thời Kế", nekoVietNamese: "đồng hồ", nekoEnglish: "watch, clock", nekoSound: "時計"),
            
            NekoModel(nekoJapanese: "かさ", nekoLatin: "kasa", nekoKanji: "傘", nekoKanjiHanViet: "Tản", nekoVietNamese: "ô, dù", nekoEnglish: "umbrella", nekoSound: "傘"),
            
            NekoModel(nekoJapanese: "かばん", nekoLatin: "kaban", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "cặp sách, túi sách", nekoEnglish: "bag, briefcase", nekoSound: "かばん"),
            
            NekoModel(nekoJapanese: "「カセット」テープ", nekoLatin: "kasettotepu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "băng [cát-xét]", nekoEnglish: "[cassette] tape", nekoSound: "カセットテープ"),
            
            NekoModel(nekoJapanese: "テープルコーダー", nekoLatin: "tepurecoda", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "máy ghi âm", nekoEnglish: "tape recorder", nekoSound: "テープルコーダー"),
            
            NekoModel(nekoJapanese: "テレビ", nekoLatin: "terebi", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "tivi", nekoEnglish: "television", nekoSound: "テレビ"),
            
            NekoModel(nekoJapanese: "ラジオ", nekoLatin: "rajio", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "radio", nekoEnglish: "radio", nekoSound: "ラジオ"),
            
            NekoModel(nekoJapanese: "カメラ", nekoLatin: "kamera", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "máy ảnh", nekoEnglish: "camera", nekoSound: "カメラ"),
            
            NekoModel(nekoJapanese: "コンピューター", nekoLatin: "konpyuta", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "máy vi tính", nekoEnglish: "computer", nekoSound: "コンビューター"),
            
            NekoModel(nekoJapanese: "じどうしゃ", nekoLatin: "jidousha", nekoKanji: "自動車", nekoKanjiHanViet: "Tự Động Xa", nekoVietNamese: "ô tô, xe hơi", nekoEnglish: "automobile, car", nekoSound: "自動車"),
            
            NekoModel(nekoJapanese: "つくえ", nekoLatin: "tsukue", nekoKanji: "机", nekoKanjiHanViet: "Cơ", nekoVietNamese: "cái bàn", nekoEnglish: "desk", nekoSound: "机"),
            
            NekoModel(nekoJapanese: "いす", nekoLatin: "isu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "cái ghế", nekoEnglish: "chair", nekoSound: "いす"),
            
            NekoModel(nekoJapanese: "チョコレート", nekoLatin: "chokoreto", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "chocolate", nekoEnglish: "chocolate", nekoSound: "チョコレート"),
            
            NekoModel(nekoJapanese: "コーヒー", nekoLatin: "kohi", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "cà phê", nekoEnglish: "coffee", nekoSound: "コーヒー"),
            
            NekoModel(nekoJapanese: "えいご", nekoLatin: "eigo", nekoKanji: "英語", nekoKanjiHanViet: "Anh Ngữ", nekoVietNamese: "Tiếng Anh", nekoEnglish: "the English language", nekoSound: "英語"),
            
            NekoModel(nekoJapanese: "にほんご", nekoLatin: "nihongo", nekoKanji: "日本語", nekoKanjiHanViet: "Nhật Bản Ngữ", nekoVietNamese: "Tiếng Nhật", nekoEnglish: "the Japanese language", nekoSound: "日本語"),
            
            NekoModel(nekoJapanese: "～ご", nekoLatin: "go", nekoKanji: "語", nekoKanjiHanViet: "Ngữ", nekoVietNamese: "Tiếng~", nekoEnglish: "～ language", nekoSound: "語"),
            
            NekoModel(nekoJapanese: "なん", nekoLatin: "nan", nekoKanji: "何", nekoKanjiHanViet: "Hà", nekoVietNamese: "Cái gì", nekoEnglish: "what", nekoSound: "何"),
            
            NekoModel(nekoJapanese: "そう", nekoLatin: "sou", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Đúng vậy", nekoEnglish: "so", nekoSound: ""),
            
            NekoModel(nekoJapanese: "ちがいます", nekoLatin: "chigaimasu", nekoKanji: "違います", nekoKanjiHanViet: "Vi", nekoVietNamese: "Nhầm rồi", nekoEnglish: "No, it isn't./ You are wrong.", nekoSound: ""),
            
            NekoModel(nekoJapanese: "そうですか", nekoLatin: "soudesuka", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Thế à?", nekoEnglish: "I see./ Is that so?", nekoSound: ""),
            
            NekoModel(nekoJapanese: "ほんのきもちです", nekoLatin: "honno kimochidesu", nekoKanji: "ほんの気持ちです", nekoKanjiHanViet: "Khí Trì", nekoVietNamese: "Đây là chút lòng thành của tôi", nekoEnglish: "It's nothing./ It's a token of my gratitude.", nekoSound: ""),
            
            NekoModel(nekoJapanese: "どうぞ", nekoLatin: "douzo", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Xin mời", nekoEnglish: "Please./ Here you are. (used when offering someone something)", nekoSound: ""),
            
            NekoModel(nekoJapanese: "どうも", nekoLatin: "doumo", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Cảm ơn", nekoEnglish: "Well, thanks.", nekoSound: ""),
            
            NekoModel(nekoJapanese: "「どうも」ありがとう「ございます」", nekoLatin: "doumo arigatou gozaimasu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Cảm ơn rất nhiều", nekoEnglish: "Thank you [very much].", nekoSound: ""),
            
            NekoModel(nekoJapanese: "これからおせわになります", nekoLatin: "korekara osewani narimasu", nekoKanji: "これからお世話になります", nekoKanjiHanViet: "Thế Thoại", nekoVietNamese: "Từ đây về sau mong được anh/chị giúp đỡ", nekoEnglish: "I hope for your kind assistance hereafter", nekoSound: ""),
            
            NekoModel(nekoJapanese: "こちらこそよおろしく", nekoLatin: "kochirakoso onegaishimasu", nekoKanji: "", nekoKanjiHanViet: "", nekoVietNamese: "Chính tôi mới mong được anh/chị giúp đỡ", nekoEnglish: "I am pleased to meet you. (response to どうぞ よおろしく)", nekoSound: ""),
            
        ]
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "NekoNihongo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

