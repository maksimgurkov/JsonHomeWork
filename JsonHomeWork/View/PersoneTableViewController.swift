//
//  PersoneTableViewController.swift
//  JsonHomeWork
//
//  Created by Максим Гурков on 17.04.2022.
//

import UIKit

class PersoneTableViewController: UITableViewController {
    
    private var persons: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let infoVC = segue.destination as? InfoViewController else {return}
        guard let index = tableView.indexPathForSelectedRow else { return }
        infoVC.persone = persons[index.row]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personeCell", for: indexPath) as! CellPersoneTableViewCell
        let persone = persons[indexPath.row]
        cell.configure(persone: persone)
        cell.personeImage.layer.cornerRadius = 20
        return cell
    }
    
    private func fetchData() {
        guard let url = URL(string: Linc.rickAndMorty.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error")
                return
            }
            
            do {
                
                let results = try JSONDecoder().decode(RickAndMorty.self, from: data)
                self.persons = results.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            } catch let error {
                print(error.localizedDescription)
            }

        }.resume()
    }
    
}
