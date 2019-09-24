//
//  ListViewController.swift
//  coreDataDemo
//
//  Created by Amit on 17/09/19.
//  Copyright © 2019 sohel-MAC. All rights reserved.
//

import UIKit

protocol dataPass {
    func data(object:[String:String], index:Int, isEdit : Bool)
}

class ListViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    var student = [Student]()
    
    var delegate : dataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblView.delegate = self
        tblView.dataSource = self
        
        student = DatabaseHelper.sharedInstance.getStudentData()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ListTableViewCell
        
//        cell.lblName.text = student[indexPath.row].name
//        cell.lblAddress.text = student[indexPath.row].address
//        cell.lblCity.text = student[indexPath.row].city
//        cell.lblMobile.text = student[indexPath.row].mobile
        cell.student = student[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            student = DatabaseHelper.sharedInstance.deleteData(index: indexPath.row)
            
            self.tblView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict = ["name":student[indexPath.row].name,"address":student[indexPath.row].address,"city":student[indexPath.row].city,"mobile":student[indexPath.row].mobile]
        
        delegate.data(object: dict as! [String : String], index: indexPath.row, isEdit: true)
        self.navigationController?.popViewController(animated: true)
    }
}
