//
//  MemeCollectionViewController.swift
//  Meme 2.0
//
//  Created by Adrian Gallardo on 25/07/20.
//  Copyright © 2020 adriangallardo. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
	
	var memes: [Meme]! {
		let object = UIApplication.shared.delegate
		let appDelegate = object as! AppDelegate
		return appDelegate.memes
	}

	override func viewDidLoad() {
			super.viewDidLoad()
	}
	
	// MARK: - UICollectionViewDataSource

	override	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.memes.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeViewCell", for: indexPath) as! MemeViewCell
		let meme = self.memes[(indexPath as NSIndexPath).row]
		
		// Set the name and image
//		cell.nameLabel.text = villain.name
		cell.memeImageView?.image = meme.memedImage
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
		
		let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
		detailController.meme = self.memes[(indexPath as NSIndexPath).row]
		self.navigationController!.pushViewController(detailController, animated: true)
		
	}

}
