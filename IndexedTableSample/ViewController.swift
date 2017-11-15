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

struct SectionInfo<T> {
    
    // セクションタイトル
    var sectionTitle: String

    // セクション内のデータ配列
    var items: [T]
}

protocol SectionIndexedProvider {
    associatedtype Item
    var sectoinDataSource: [Item] { get set }
    
    func unsortedSectionInfos(sortSelector: Selector) -> [SectionInfo<Item>]
    func sortedSectionInfos(sortSelector: Selector) -> [SectionInfo<Item>]
}

extension SectionIndexedProvider {
    
    func unsortedSectionInfos(sortSelector: Selector) -> [SectionInfo<Item>] {
        // 各インデックスタイトルのセクション情報の配列を初期化する。
        var sectionInfos = UILocalizedIndexedCollation.current().sectionTitles.map {
            SectionInfo<Item>(sectionTitle: $0, items: [Item]())
        }
        
        // 一時データを該当するセクション情報に割り当てる
        sectoinDataSource.forEach {
            let index = UILocalizedIndexedCollation.current().section(for: $0, collationStringSelector: sortSelector)
            sectionInfos[index].items.append($0)
        }
        
        return sectionInfos
    }
    
    func sortedSectionInfos(sortSelector: Selector) -> [SectionInfo<Item>] {
        return unsortedSectionInfos(sortSelector: sortSelector).flatMap { info -> SectionInfo<Item>? in
            guard info.items.count != 0 else { return nil }
            guard let sortedSection = UILocalizedIndexedCollation.current().sortedArray(from: info.items, collationStringSelector: sortSelector) as? [Item] else { return nil }
            return SectionInfo<Item>(sectionTitle: info.sectionTitle, items: sortedSection)
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    lazy var sectoinDataSource: [Store] = {
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
    
    // セクション情報の配列
    var sectionInfos = [SectionInfo<Store>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        // セクション情報内の配列をふりがな順でソートする。
        // データが１件もないセクションはセクション情報の配列から除外する。
        sectionInfos = sortedSectionInfos(sortSelector: #selector(getter: Store.phoneticGuides))
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

extension ViewController: SectionIndexedProvider {}
