//
//  ViewController.swift
//  IndexedTableSample
//
//  Copyright © 2017年 mbyk. All rights reserved.
//

import UIKit

class Store: NSObject {
    var branchName: String
    @objc var phoneticGuides: String
    var prefecture: String
    
    init(branchName: String, phoneticGuides: String, prefecture: String) {
        self.branchName = branchName
        self.phoneticGuides = phoneticGuides
        self.prefecture = prefecture
    }
}

struct SectionInfo {
    
    // セクションタイトル
    var sectionTitle: String

    // セクション内のデータ配列
    var items: [Store]
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    lazy var tempDatas: [Store] = {
        var _datas = [Store]()
        _datas.append(Store(
            branchName: "新宿店",
            phoneticGuides: "しんじゅく",
            prefecture: "東京都"))
        
        _datas.append(Store(
            branchName: "飯田橋店",
            phoneticGuides: "いいだばし",
            prefecture: "東京都"))
        
        _datas.append(Store(
            branchName: "立川店",
            phoneticGuides: "たちかわ",
            prefecture: "東京都"))
        _datas.append(Store(
            branchName: "川崎店",
            phoneticGuides: "かわさき",
            prefecture: "神奈川県"))
        _datas.append(Store(
            branchName: "横浜店",
            phoneticGuides: "よこはま",
            prefecture: "神奈川県"))
        _datas.append(Store(
            branchName: "奈良店",
            phoneticGuides: "なら",
            prefecture: "奈良県"))
        _datas.append(Store(
            branchName: "京都店",
            phoneticGuides: "きょうと",
            prefecture: "京都府"))
        _datas.append(Store(
            branchName: "新橋店",
            phoneticGuides: "しんばし",
            prefecture: "東京都"))
        _datas.append(Store(
            branchName: "船橋店",
            phoneticGuides: "ふなばし",
            prefecture: "千葉県"))
        _datas.append(Store(
            branchName: "福岡店",
            phoneticGuides: "ふくおか",
            prefecture: "福岡県"))
        _datas.append(Store(
            branchName: "大分店",
            phoneticGuides: "おおいた",
            prefecture: "大分県"))
        _datas.append(Store(
            branchName: "佐賀店",
            phoneticGuides: "さが",
            prefecture: "佐賀県"))
        _datas.append(Store(
            branchName: "熊本店",
            phoneticGuides: "くまもと",
            prefecture: "熊本県"))
        _datas.append(Store(
            branchName: "新宿店",
            phoneticGuides: "しんじゅく",
            prefecture: "東京都"))
        
        _datas.append(Store(
            branchName: "飯田橋店",
            phoneticGuides: "いいだばし",
            prefecture: "東京都"))
        
        _datas.append(Store(
            branchName: "立川店",
            phoneticGuides: "たちかわ",
            prefecture: "東京都"))
        _datas.append(Store(
            branchName: "川崎店",
            phoneticGuides: "かわさき",
            prefecture: "神奈川県"))
        _datas.append(Store(
            branchName: "横浜店",
            phoneticGuides: "よこはま",
            prefecture: "神奈川県"))
        _datas.append(Store(
            branchName: "奈良店",
            phoneticGuides: "なら",
            prefecture: "奈良県"))
        _datas.append(Store(
            branchName: "京都店",
            phoneticGuides: "きょうと",
            prefecture: "京都府"))
        _datas.append(Store(
            branchName: "新橋店",
            phoneticGuides: "しんばし",
            prefecture: "東京都"))
        _datas.append(Store(
            branchName: "船橋店",
            phoneticGuides: "ふなばし",
            prefecture: "千葉県"))
        _datas.append(Store(
            branchName: "福岡店",
            phoneticGuides: "ふくおか",
            prefecture: "福岡県"))
        _datas.append(Store(
            branchName: "大分店",
            phoneticGuides: "おおいた",
            prefecture: "大分県"))
        _datas.append(Store(
            branchName: "佐賀店",
            phoneticGuides: "さが",
            prefecture: "佐賀県"))
        _datas.append(Store(
            branchName: "熊本店",
            phoneticGuides: "くまもと",
            prefecture: "熊本県"))
        _datas.append(Store(
            branchName: "新宿店",
            phoneticGuides: "しんじゅく",
            prefecture: "東京都"))
        
        _datas.append(Store(
            branchName: "飯田橋店",
            phoneticGuides: "いいだばし",
            prefecture: "東京都"))
        
        _datas.append(Store(
            branchName: "立川店",
            phoneticGuides: "たちかわ",
            prefecture: "東京都"))
        _datas.append(Store(
            branchName: "川崎店",
            phoneticGuides: "かわさき",
            prefecture: "神奈川県"))
        _datas.append(Store(
            branchName: "横浜店",
            phoneticGuides: "よこはま",
            prefecture: "神奈川県"))
        _datas.append(Store(
            branchName: "奈良店",
            phoneticGuides: "なら",
            prefecture: "奈良県"))
        _datas.append(Store(
            branchName: "沖縄店",
            phoneticGuides: "おきなわ",
            prefecture: "沖縄"))
        _datas.append(Store(
            branchName: "京都店",
            phoneticGuides: "きょうと",
            prefecture: "京都府"))
        _datas.append(Store(
            branchName: "新橋店",
            phoneticGuides: "しんばし",
            prefecture: "東京都"))
        _datas.append(Store(
            branchName: "船橋店",
            phoneticGuides: "ふなばし",
            prefecture: "千葉県"))
        _datas.append(Store(
            branchName: "福岡店",
            phoneticGuides: "ふくおか",
            prefecture: "福岡県"))
        _datas.append(Store(
            branchName: "大分店",
            phoneticGuides: "おおいた",
            prefecture: "大分県"))
        _datas.append(Store(
            branchName: "佐賀店",
            phoneticGuides: "さが",
            prefecture: "佐賀県"))
        _datas.append(Store(
            branchName: "熊本店",
            phoneticGuides: "くまもと",
            prefecture: "熊本県"))
        return _datas
    }()
    
    lazy var collation: UILocalizedIndexedCollation = {
        var _collation = UILocalizedIndexedCollation.current()
        return _collation
    }()
    
    // セクション情報の配列
    var sectionInfos = [SectionInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // 各インデックスタイトルのセクション情報の配列を初期化する。
        var unsortedSectionInfos = collation.sectionTitles.map {
            SectionInfo(sectionTitle: $0, items: [Store]())
        }
        
        // 一時データを該当するセクション情報に割り当てる
        tempDatas.forEach {
            let index = collation.section(for: $0, collationStringSelector: #selector(getter: Store.phoneticGuides))
            unsortedSectionInfos[index].items.append($0)
        }
        
        // セクション情報内の配列をふりがな順でソートする。
        // データが１件もないセクションはセクション情報の配列から除外する。
        sectionInfos = unsortedSectionInfos.flatMap { info -> SectionInfo? in
            guard info.items.count != 0 else { return nil }
            guard let sortedSection = collation.sortedArray(from: info.items, collationStringSelector: #selector(getter: Store.phoneticGuides)) as? [Store] else { return nil }
            return SectionInfo(sectionTitle: info.sectionTitle, items: sortedSection)
        }
        
    }

}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let store = sectionInfos[indexPath.section].items[indexPath.row]
        cell.textLabel?.text = store.branchName
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionInfos[section].items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionInfos.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionInfos[section].sectionTitle
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionInfos.map {
            $0.sectionTitle
        }
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
}
