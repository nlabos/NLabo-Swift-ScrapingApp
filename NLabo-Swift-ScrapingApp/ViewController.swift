//
//  ViewController.swift
//  NLabo-Swift-ScrapingApp
//
//  Created by 髙津悠樹 on 2022/09/29.
//



import UIKit
import Alamofire
import Kanna

class ViewController: UIViewController {
    
    //商品一覧
    private var names = [String]()
    
    //値段一覧
    private var prices = [String]()
    
    
    //データ表示用のTableView
    private var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView: do {
            tableView.frame = view.frame
            tableView.dataSource = self
            view.addSubview(tableView)
        }
        AF.request("https://stores.kourakuen.co.jp/grandmenu?gid=01").responseString {
            response in
            
            if let html = response.value {
                self.parserHTML(html: html)
                self.tableView.reloadData()
            }
        }
        
    }
    //挑戦問題で書き換えを行うので素のプログラムはコメントします
    /*
    func parserHTML(html: String) {
        if let doc = try? HTML(html: html, encoding: .utf8) {
            //HTML内のURLを抜き出す
            for node in doc.xpath("//div") {
                print(node["class"] ?? "classが存在しません")
            }
        }
    }
     */
    
    func parserHTML(html: String) {
        if let doc = try? HTML(html: html, encoding: .utf8){
            for node in doc.xpath("//div"){
                if(node["class"] == "Menu-itemName Body--menu" && node.text != "キッズメニューおまけ"){
                    names.append(node.text ?? "")
                }
                
                if(node["class"] == "Menu-itemPrice Body--menu"){
                    prices.append(node.text ?? "")
                }
            }
            
            for i in 0..<names.count {
                print("\(names[i]) : \(prices[i])")
            }
            
        }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let name = names[indexPath.row]
        let price = prices[indexPath.row]
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = price

        return cell
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }


    
}

