//
//  MemeTableViewController.swift
//  Meme 2.0
//
//  Created by Adrian Gallardo on 25/07/20.
//  Copyright © 2020 adriangallardo. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
	
	var memes: [Meme]! {
		let object = UIApplication.shared.delegate
		let appDelegate = object as! AppDelegate
		return appDelegate.memes
	}

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	// MARK: - Table view data source

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.memes.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
	  let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
		let meme = self.memes[(indexPath as NSIndexPath).row]
		
		// Set the name and image
		cell.textLabel?.text = meme.topText + meme.bottomText
		cell.imageView?.image = meme.memedImage
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
		detailController.meme = self.memes[(indexPath as NSIndexPath).row]
		self.navigationController!.pushViewController(detailController, animated: true)
	}

	// MARK: - Actions
	
	
}
