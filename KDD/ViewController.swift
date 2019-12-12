//
//  ViewController.swift
//  KDD
//
//  Created by wipro on 11/12/19.
//  Copyright © 2019 wipro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var contentView: UIView!
    var scrollView: UIScrollView!
    var slip1: UITableView!
    var slipArray = [String]()
    var tableCount: CGFloat!
    var scrollCount: CGFloat!
    var x: CGFloat!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableCount = 4
        scrollCount = tableCount/3
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: contentView.frame.size.height))
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * scrollCount, height: contentView.frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(scrollView)
        x = 0
        self.setupSlipTableview()
    }
    
    func setupSlipTableview(){
        
        print(x!,Int(scrollCount))
        for i in 1...Int(tableCount){
            print(x!)
            slip1 = UITableView(frame: CGRect(x: x, y: 0, width: self.view.frame.size.width/3, height: contentView.frame.size.height), style: UITableView.Style.plain)
            slip1.register(UITableViewCell.self, forCellReuseIdentifier: "id")
            slip1.tag = i
            slip1.delegate = self
            slip1.dataSource = self
            slip1.isScrollEnabled = false
            slip1.layer.masksToBounds = true
            slip1.layer.borderColor = UIColor( red: 0/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            slip1.layer.borderWidth = 2.0
            scrollView.addSubview(slip1)
            x = slip1.frame.origin.x + slip1.frame.size.width
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getSlipArrayCount(tag: tableView.tag)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "id", for: indexPath)
        cell.textLabel?.text = self.getSlipArray(tag: tableView.tag)[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        headerLbl.backgroundColor = UIColor.lightGray
        headerLbl.textAlignment = NSTextAlignment.center
        headerLbl.font = UIFont .boldSystemFont(ofSize: 20)
        headerLbl.textColor = UIColor.black
        headerLbl.text = self.getSlipTitle(tag: tableView.tag)
      return headerLbl
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
    /* data should be provided as below mentioned format we should pass the tableview tag to get array and array count since we are reusing single table view or want to check by creating json format */
    
    func getSlipArray(tag:Int) -> [String] {
        if (tag == 1) {
            slipArray = ["item1","item2","item3","item4","item5","item6","item7","item8","item9","item10","item11","item12","item13","item14","item15","item16","item17","item18","item19","item20","item21","item22","item23","item24","item25","item26","item27","item28","item29","item30"]
        }else if (tag == 2){
            slipArray = ["item1","item2","item3","item4","item5"]
        }else if (tag == 3){
            slipArray = ["item1","item2","item3","item4","item5","item6","item7","item8","item9","item10"]
        }else{
            slipArray = ["checking"]
        }
        return slipArray
    }
    
    func getSlipArrayCount(tag:Int) -> Int {
        if (tag == 1) {
            slipArray = ["item1","item2","item3","item4","item5","item6","item7","item8","item9","item10","item11","item12","item13","item14","item15","item16","item17","item18","item19","item20","item21","item22","item23","item24","item25","item26","item27","item28","item29","item30"]
        }else if (tag == 2){
            slipArray = ["item1","item2","item3","item4","item5"]
        }else if (tag == 3){
            slipArray = ["item1","item2","item3","item4","item5","item6","item7","item8","item9","item10"]
        }else{
            slipArray = ["checking"]
        }
        return slipArray.count
    }
    
    func getSlipTitle(tag:Int) -> String {
        let slipTitle:String!
        
        if (tag == 1) {
            slipTitle = "Table1"
        }else if (tag == 2){
           slipTitle = "Table2"
        }else if (tag == 3){
            slipTitle = "Table3"
        }else{
            slipTitle = "default"
        }
        return slipTitle
    }
}

