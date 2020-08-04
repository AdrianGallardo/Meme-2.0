//
//  MemeTableViewController.swift
//  Meme 2.0
//
//  Created by Adrian Gallardo on 02/08/20.
//  Copyright © 2020 adriangallardo. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var memeTableView: UITableView!
	
	var memes: [Meme]! {
		let object = UIApplication.shared.delegate
		let appDelegate = object as! AppDelegate
		return appDelegate.memes
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		memeTableView.reloadData()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print(self.memes.count)
  	return self.memes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell") as! MemeTableViewCell
		let meme = self.memes[(indexPath as NSIndexPath).row]

		// Set the name and image
		cell.setMeme(meme: meme)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
		detailController.meme = self.memes[(indexPath as NSIndexPath).row]
		self.navigationController!.pushViewController(detailController, animated: true)
	}
}
