//
//  ViewController.swift
//  coreDataDemo
//
//  Created by Amit on 17/09/19.
//  Copyright © 2019 sohel-MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnShow: UIButton!
    
    var i = Int()
    var isUpdate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSaveAction(_ sender: UIButton) {
        
        let dict = ["name":txtName.text ?? "",
                    "address":txtAddress.text ?? "",
                    "city":txtCity.text ?? "",
                    "mobile":txtMobile.text ?? ""]
        
        if isUpdate{
            DatabaseHelper.sharedInstance.editData(object: dict, i: i)
        }else{
            DatabaseHelper.sharedInstance.save(object: dict)
        }
    }
    
    @IBAction func btnShow_Action(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController")as! ListViewController
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ViewController:dataPass{
    func data(object: [String : String], index: Int, isEdit : Bool) {
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        i = index
        isUpdate = isEdit
    }
}

