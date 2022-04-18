//
//  PersoneTableViewCell.swift
//  JsonHomeWork
//
//  Created by Максим Гурков on 17.04.2022.
//

import UIKit

class CellPersoneTableViewCell: UITableViewCell {
    
    @IBOutlet weak var personeImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    
    func configure(persone: Character) {
        nameLabel.text = "Name \(persone.name ?? "No")"
        statusLabel.text = "Status \(persone.status ?? "No")"
        
        DispatchQueue.global().async {
            guard let imageUrl = persone.image else { return }
            guard let url = URL(string: imageUrl ) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.personeImage.image = UIImage(data: imageData)
            }
        }
    }
    
    

}
