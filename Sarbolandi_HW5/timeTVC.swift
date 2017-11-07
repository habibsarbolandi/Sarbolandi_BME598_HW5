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
let pickVC2Data = [["1","2","3","4","5","6","7","8","9","10","11","12"],["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"],["AM","PM"]]

class timeTVC: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var medReminders = [MedReminder]()
    var currentMed = ""
    var row: Int = 0
    var timeHour = ""
    var timeMinutes = ""
    var timeDay = ""
    var medTime = ""
    
    //var reminders = [Reminder]()
    //let dateFormatter = DateFormatter()
    //let local = NSLocale.current
    
    let medNameVC = UIViewController()
    let pickVC = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
    let medTimeVC = UIViewController()
    let pickVC2 = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == pickVC {
            return 1
        }
        if pickerView == pickVC2 {
            return 3
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickVC {
            return medNames.count
        }
        if pickerView == pickVC2 {
            if component == 0 {
                return pickVC2Data[0].count
            }
            if component == 1 {
                return pickVC2Data[1].count
            }
            if component == 2 {
                return pickVC2Data[2].count
            }
        }
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickVC {
            return medNames[row]
        }
        if pickerView == pickVC2 {
            if component == 0 {
                return pickVC2Data[0][row]
            }
            if component == 1 {
                return pickVC2Data[1][row]
            }
            if component == 2 {
                return pickVC2Data[2][row]
            }
            //return pickVC2Data[component][row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow: Int, inComponent: Int) {
        if pickerView == pickVC {
            currentMed = medNames[didSelectRow]
        }
        if pickerView == pickVC2 {
            if inComponent == 0 {
                timeHour = pickVC2Data[0][didSelectRow]
            }
            if inComponent == 1 {
                timeMinutes = pickVC2Data[1][didSelectRow]
            }
            if inComponent == 2 {
                timeDay = pickVC2Data[2][didSelectRow]
            }
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        medNameVC.preferredContentSize = CGSize(width: 250, height: 150)
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
            
            self.medTimeVC.preferredContentSize = CGSize(width: 250, height: 150)
            self.pickVC2.dataSource = self
            self.pickVC2.delegate = self
            self.medTimeVC.view.addSubview(self.pickVC2)
            
            let alertTime = UIAlertController(title: "Time", message: "Pleace choose a time to take the medication", preferredStyle: UIAlertControllerStyle.alert)
            alertTime.setValue(self.medTimeVC, forKey: "contentViewController")
            
            let confirmTime = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: ({
                (_) in
                if self.timeHour == "" {
                    self.timeHour = "1"
                }
                if self.timeMinutes == "" {
                    self.timeMinutes = "00"
                }
                if self.timeDay == "" {
                    self.timeDay = "AM"
                }
                
                self.medTime = self.timeHour+":"+self.timeMinutes+" "+self.timeDay
                
                self.medReminders.append(MedReminder(name: self.currentMed, time: self.medTime))
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
        
        //DateFormatter.locale = NSLocale.current
        //dateFormatter.dateStyle = .medium
        //dateFormatter.timeStyle = .short
        
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
