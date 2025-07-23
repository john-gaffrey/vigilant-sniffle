//
//  ViewController.swift
//  testsDemo
//
//  Created by Itsuki on 2023/10/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var repositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.allowsSelection = false

    }
    


}


extension ViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }


    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        Task {
            print("here")
            do {
                repositories = try await GitHubService.fetchRepositories(query:"test")
            } catch (let error) {
                print(error)
                repositories = []
            }
            
            DispatchQueue.main.async {[weak self] in
                guard let self = self else {return}
                self.tableView.reloadData()
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell")! as UITableViewCell
        cell.textLabel?.text = repositories[indexPath.row].fullName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
            else { return }
        detailViewController.fullName = repositories[indexPath.row].fullName
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
