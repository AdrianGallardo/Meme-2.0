//
//  MemeTableViewCell.swift
//  Meme 2.0
//
//  Created by Adrian Gallardo on 04/08/20.
//  Copyright © 2020 adriangallardo. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
	@IBOutlet weak var memeImageView: UIImageView!
	@IBOutlet weak var memeLabelView: UILabel!
	
	func setMeme (meme: Meme){
		self.memeImageView.image = meme.memedImage
		self.memeLabelView.text = meme.topText + " " + meme.bottomText
	}
}
