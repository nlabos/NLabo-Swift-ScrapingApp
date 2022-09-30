//
//  NewsViewController.swift
//  NLabo-Swift-ScrapingApp
//
//  Created by 髙津悠樹 on 2022/09/30.
//

import UIKit
import Alamofire
import Kanna

class NewsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://news.yahoo.co.jp/articles/4075e5f80b36bddace5cc45ead817888acd337c3").responseString { response in
            if let html = response.value {
                self.parserHTML(html: html)
            }
            
        }
    }
    
    //ここは練習問題で書き換えるけど完成品として残すのでコメントで全て残します
    /*
    func parserHTML(html: String) {
        if let doc = try? HTML(html: html, encoding: .utf8){
            for metaNode in doc.css("meta") {
                print(metaNode["name"] ?? "nameが存在しません")
                print(metaNode["content"] ?? "contentが存在しません")
            }
        }
    }*/
    
    func parserHTML(html: String) {
        if let doc = try? HTML(html: html, encoding: .utf8) {
            for metaNode in doc.css("meta"){
                if(metaNode["name"] == "description") {
                    print(metaNode["content"] ?? "contentが存在しません")
                }
            }
        }
    }
    


}


