//
//  ViewController.swift
//  JsonHomeWork
//
//  Created by Максим Гурков on 17.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var imagePersone: UIImageView!
    
    @IBOutlet weak var namePersoneLabel: UILabel!
    @IBOutlet weak var statusPersoneLabel: UILabel!
    @IBOutlet weak var speciesPersoneLabel: UILabel!
    @IBOutlet weak var genderPersoneLabel: UILabel!
    
    var persone: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePersone.layer.cornerRadius = imagePersone.bounds.width / 2
        configure(persone: persone)
    }
        
   private func configure(persone: Character) {
            fetchImage(from: persone.image ?? "Nil")
            self.namePersoneLabel.text = "Name \(persone.name ?? "No")"
            self.statusPersoneLabel.text = "Status \(persone.status ?? "No")"
            self.speciesPersoneLabel.text = "Species \(persone.species ?? "No")"
            self.genderPersoneLabel.text = "Gender \(persone.gender ?? "No")"
            self.title = persone.name ?? "No"
    }
    
    private func fetchImage(from imageUrl: String) {
        guard let imageResult = ImageManager.shered.fetchImage(from: imageUrl) else { return }
        DispatchQueue.main.async {
            self.imagePersone.image = UIImage(data: imageResult)
        }
    }
}

