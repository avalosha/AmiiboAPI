//
//  ViewController.swift
//  AmiiboAPI
//
//  Created by Álvaro Ávalos Hernández on 7/3/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AmiiboListViewController: UITableViewController {
    
    var amiibos: [Amiibo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getAmiiboData(from: "https://www.amiiboapi.com/api/amiibo/")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: -Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amiibos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AmiiboTableViewCell
        cell.nameLabel?.text = amiibos[indexPath.row].name
        cell.seriesLabel?.text = amiibos[indexPath.row].amiiboSeries
        
        let url = URL(string: amiibos[indexPath.row].image)
        let data = try? Data(contentsOf: url!)
        if let data = data {
            let image = UIImage(data: data)
            cell.amiiboImageView.image = image
        }
 
        /*
        Alamofire.request(amiibos[indexPath.row].image).response { response in
            if let data = response.data {
                let image = UIImage(data: data)
                cell.amiiboImageView.image = image
            } else {
                print("Data is nil. I don't know what to do :(")
            }
        }
 */
        return cell
    }
    
    // MARK: -Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: -Web Services API
    
    func getAmiiboData(from url: String) {
        Alamofire.request(url).responseJSON { response in
            if response.result.isSuccess {
                
                let amiiboJSON: JSON = JSON(response.result.value!)
                self.updateAmiiboData(json: amiiboJSON)
                
            } else {
                print("Error \(String(describing: response.result.error))")
            }
        }
    }
    
    // MARK: -JSON Parsing
    
    func updateAmiiboData(json: JSON) {
        for item in json["amiibo"].arrayValue {
            let amiibo = Amiibo(
                name: item["name"].stringValue,
                image: item["image"].stringValue,
                amiiboSeries: item["amiiboSeries"].stringValue)
            amiibos.append(amiibo)
        }
        tableView.reloadData()
        print("Count: ",amiibos.count)
    }
}

