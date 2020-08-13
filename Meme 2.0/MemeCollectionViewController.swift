//
//  MemeCollectionViewController.swift
//  Meme 2.0
//
//  Created by Adrian Gallardo on 25/07/20.
//  Copyright © 2020 adriangallardo. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
	
	@IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
	@IBOutlet var memeCollectionView: UICollectionView!
	
	var memes: [Meme]! {
		let object = UIApplication.shared.delegate
		let appDelegate = object as! AppDelegate
		return appDelegate.memes
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		let space:CGFloat = 3.0
		let dimensionW = (view.frame.size.width - (2 * space)) / 3.0
		let dimensionH = (view.frame.size.height - (2 * space)) / 3.0
		
		flowLayout.minimumInteritemSpacing = space
		flowLayout.minimumLineSpacing = space
		flowLayout.itemSize = CGSize(width: dimensionW, height: dimensionH)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		memeCollectionView.reloadData()
	}
	
	// MARK: - UICollectionViewDataSource

	override	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.memes.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
		let meme = self.memes[(indexPath as NSIndexPath).row]
		
		cell.memeImageView?.image = meme.memedImage
		
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
		
		let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
		detailController.meme = self.memes[(indexPath as NSIndexPath).row]
		self.navigationController!.pushViewController(detailController, animated: true)
		
	}

}

class MemeCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var memeImageView: UIImageView!
	
}
