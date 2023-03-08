//
//  CollectionViewCell.swift
//  WeatherAppBitCot
//
//  Created by Sanketh S Deshpande on 08/03/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var allView: RoundTopLeftBottomRightView!
}
