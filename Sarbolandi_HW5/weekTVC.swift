//
//  weekTVC.swift
//  Sarbolandi_HW5
//
//  Created by Habib Sarbolandi on 10/25/17.
//  Copyright © 2017 Habib Sarbolandi. All rights reserved.
//

import UIKit

var weekDays: [Int: Array<MedReminder>] = [:]
var selectedRow = 0

class weekTVC: UITableViewController {
    
    var selectedDay = [MedReminder]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return 7
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekCell", for: indexPath)
        
        let day = Array(weekDays.keys).sorted()
        if day[indexPath.row] == 0 {
            cell.textLabel?.text = "Monday"
        }
        else if day[indexPath.row] == 1 {
            cell.textLabel?.text = "Tuesday"
        }
        else if day[indexPath.row] == 2 {
            cell.textLabel?.text = "Wednesday"
        }
        else if day[indexPath.row] == 3 {
            cell.textLabel?.text = "Thursday"
        }
        else if day[indexPath.row] == 4 {
            cell.textLabel?.text = "Friday"
        }
        else if day[indexPath.row] == 5 {
            cell.textLabel?.text = "Saturday"
        }
        else if day[indexPath.row] == 6 {
            cell.textLabel?.text = "Sunday"
        }
        
        //cell.textLabel?.text = day[indexPath.row]
        
      
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: react to user selecting row
        //I want the detail view controller to update based on the row that I selected
        
       // print("In didSelectRowAt")
        //TODO: get cell information
        let day = Array(weekDays.keys)
        selectedRow = day[indexPath.row]
        //selectedRow = day[indexPath.row]
        
        let remindersOfDays = Array(weekDays.values)
        selectedDay = remindersOfDays[indexPath.row]
        
        //call segue manually
        performSegue(withIdentifier: "cellSelected", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destVC = segue.destination as! timeTVC
        destVC.medReminders=selectedDay
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
