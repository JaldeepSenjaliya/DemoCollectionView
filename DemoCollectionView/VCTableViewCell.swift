//
//  VCTableViewCell.swift
//  DemoCollectionView
//
//  Created by Jaldeep Patel on 2021-06-21.
//

import UIKit

class VCTableViewCell: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    
    let citiesName = ["Toronto", "Vancouver", "Calgary", "Banff", "Ahmedabad", "Mississauga", "Brampton"]
    
    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension VCTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citiesName.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.citiesImageView.image = UIImage(named: citiesName[indexPath.row])
        cell.citiesNameLabel.text = citiesName[indexPath.row]
        
        cell.citiesImageView.layer.cornerRadius = 8
        cell.collectionView.layer.borderWidth = 1
        cell.collectionView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 159)
    }

}
