//
//  ViewController.swift
//  Search_Bar_TableView
//
//  Created by CodeInfoWay CodeInfoWay on 4/21/23.
//

import UIKit

class SearchTebleviewExample: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
   
    var data:[String] = ["india","srilanka","pakistan","nepal","bangladesh","newzelamd","thailand","canada"]
    var filterdata = [String]()
    
    @IBOutlet weak var mySearchText: UISearchBar!
    
    @IBOutlet weak var mytable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filterdata = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "cell", for : indexPath)
        cell.textLabel?.text = filterdata[indexPath.row]
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty
         {
             filterdata = data.filter { $0.lowercased().hasPrefix(searchText.lowercased())}
             mytable.reloadData()
          }
        else
         {
        print("kindly Enter Text First")
        filterdata = data
            mytable.reloadData()
         }

    }

}

