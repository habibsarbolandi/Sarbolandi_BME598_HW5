//
//  timePD.swift
//  Sarbolandi_HW5
//
//  Created by Habib Sarbolandi on 11/6/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//

import UIKit



class timePD: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let pickVC2Data = [["1","2","3","4","5","6","7","8","9","10","11","12"],["00","05","10","15","20","25","30","35","40","45","50","55"],["AM","PM"]]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickVC2Data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickVC2Data[component][row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
