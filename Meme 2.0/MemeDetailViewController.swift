//
//  MemeDetailViewController.swift
//  Meme 2.0
//
//  Created by Adrian Gallardo on 28/07/20.
//  Copyright © 2020 adriangallardo. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

	var meme: Meme!
	
	@IBOutlet weak var imageView: UIImageView!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.tabBarController?.tabBar.isHidden = true
		
		self.imageView!.image = meme.memedImage
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.tabBarController?.tabBar.isHidden = false
	}

}
