//
//  timeTVC.swift
//  Sarbolandi_HW5
//
//  Created by Habib Sarbolandi on 10/25/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//

import UIKit
import EventKit

var medNames = ["Ibuprofen","Viagra","Amicilin","Oxycodone"]

class timeTVC: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var medReminders = [MedReminder]()
    var currentMed = ""
    var row: Int = 0
    
    var reminders = [Reminder]()
    let dateFormatter = DateFormatter()
    let local = NSLocale.current
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return medNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return medNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow: Int, inComponent: Int) {
         currentMed = medNames[didSelectRow]
    }
    
    @IBAction func addButton(_ sender: Any) {
        let medNameVC = UIViewController()
        medNameVC.preferredContentSize = CGSize(width: 250, height: 150)
        let pickVC = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
        pickVC.dataSource = self
        pickVC.delegate = self
        medNameVC.view.addSubview(pickVC)
        let alertName = UIAlertController(title: "Medication list", message: "Please choose a medication", preferredStyle: UIAlertControllerStyle.alert)
        alertName.setValue(medNameVC, forKey: "contentViewController")
        let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let confirmName = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: ({
            (_) in
            if self.currentMed == "" {
                self.currentMed = medNames[0]
            }
            
            let alertTime = UIAlertController(title: "Time", message: "Pleace choose a time to take the medication", preferredStyle: UIAlertControllerStyle.alert)
            
            let confirmTime = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: ({
                (_) in
                
                self.medReminders.append(MedReminder(name: self.currentMed, time: "3:00 Am"))
                self.tableView.reloadData()
                weekDays.updateValue(self.medReminders, forKey: selectedRow)
            }))
            alertTime.addAction(cancelButton)
            alertTime.addAction(confirmTime)
            self.present(alertTime, animated: true, completion: nil)
            
        }))
        
        alertName.addAction(cancelButton)
        alertName.addAction(confirmName)
        self.present(alertName, animated: true, completion: nil)
        
    }
    
   // let medDictionary: [String:Array<Med>] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItems![1] = self.editButtonItem
        
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
    }

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
        return medReminders.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)

        //let keywords = Array(medDictionary.keys)
        //let currentReminder = reminders[indexPath.row]
        //cell.textLabel?.text = currentReminder.title
        //cell.detailTextLabel?.text = "Take at: " + dateFormatter.string(from: currentReminder.time as Date)
        
        let currentReminder = medReminders[indexPath.row]
        cell.textLabel?.text = currentReminder.name
        cell.detailTextLabel?.text = "Take at: \(currentReminder.time)"
        
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
            medReminders.remove(at: indexPath.row)
            weekDays.updateValue(self.medReminders, forKey: selectedRow)
            
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
