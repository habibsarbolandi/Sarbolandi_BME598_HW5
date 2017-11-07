//
//  medTVC.swift
//  Sarbolandi_HW5
//
//  Created by Habib Sarbolandi on 10/24/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//

import UIKit

//protocol CellSelectedDelegate {
//    func read(med: Med)
//}

var newMedName = ""
var newMedDosage = ""
var newMedDaily = ""

class medTVC: UITableViewController {

    var meds = [Med]()
    //var addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addMed))
    
    @IBAction func addButton(_ sender: Any) {
    print("adding a med")
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        let alertName = UIAlertController(title: "Medication", message: "Please type the name of the medication", preferredStyle: .alert)
        let confirmName = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: ({
            (_) in
            
            let alertDosage = UIAlertController(title: "Dosage", message: "Please type the dosage of the medication (ex. 120, 250, 750)", preferredStyle: .alert)
            let confirmDosage = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: ({
                (_) in
                
                let alertDaily = UIAlertController(title: "Daily Intake", message: "Please type the number of times you take the medication", preferredStyle: .alert)
                let confirmDaily = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: ({
                    (_) in
                    
                    if let dailyField = alertDaily.textFields?[0] {
                        newMedDaily = dailyField.text!
                        self.meds.append(Med(name: newMedName, dosage: newMedDosage, daily: newMedDaily))
                        self.tableView.reloadData()
                        medNames.append(newMedName)
                    }
                }))
                alertDaily.addTextField(configurationHandler: ({
                    (UITextField) in
                    
                    UITextField.placeholder = "Daily Intake of Medication"
                }))
                alertDaily.addAction(confirmDaily)
                alertDaily.addAction(cancelButton)
                self.present(alertDaily, animated: true, completion: nil)
                
                if let dosageField = alertDosage.textFields?[0] {
                    newMedDosage = dosageField.text!
                }
            }))
            alertDosage.addTextField(configurationHandler: ({
                (UITextField) in
                
                UITextField.placeholder = "Dosage of Medication"
            }))
            alertDosage.addAction(confirmDosage)
            alertDosage.addAction(cancelButton)
            self.present(alertDosage, animated: true, completion: nil)
            
            if let nameField = alertName.textFields?[0] {
                newMedName = nameField.text!
            }
        }))
        alertName.addTextField(configurationHandler: ({
            (UITextField) in
            
            UITextField.placeholder = "Name of Medication"
        }))
        alertName.addAction(confirmName)
        alertName.addAction(cancelButton)
        self.present(alertName, animated: true, completion: nil)
    }
    
    func saveMeds() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        //self.navigationItem.rightBarButtonItem = addButton
    }
    
    //@objc func addMed() {
   //     print("adding a med")
        
   // }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meds.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //let selectedMed = meds[indexPath.row]
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medCell", for: indexPath)

        // Configure the cell...
        let currentMed = meds[indexPath.row]
        cell.textLabel?.text = currentMed.name
        cell.detailTextLabel?.text = "Dosage: \(currentMed.dosage)mg   Taken: \(currentMed.daily) times per day"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //print("deleting med")
            meds.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
