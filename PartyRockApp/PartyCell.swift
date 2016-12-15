//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Grant Rosario on 12/14/16.
//  Copyright © 2016 Grant Rosario. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image =
                        UIImage(data: data)
                }
            } catch {
                // handle the error
            }
        }
        
    }


}
