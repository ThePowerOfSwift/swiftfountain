//
//  FeedViewController.swift
//  ExchangeAGram
//
//  Created by Stanley Chiang on 12/28/14.
//  Copyright (c) 2014 Stanley Chiang. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreData

class FeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

	@IBOutlet weak var collectionView: UICollectionView!
	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		return UICollectionViewCell()
	}
	@IBAction func cameraTapped(sender: UIBarButtonItem) {
		if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
			var camController = UIImagePickerController()
			camController.delegate = self
			camController.sourceType = UIImagePickerControllerSourceType.Camera
			let mediaTypes:[AnyObject] = [kUTTypeImage]
			camController.mediaTypes = mediaTypes
			camController.allowsEditing = false
			
			self.presentViewController(camController, animated: true, completion: nil)
		} else if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
			var photoLibController = UIImagePickerController()
			photoLibController.delegate = self
			photoLibController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
			let mediaTypes:[AnyObject] = [kUTTypeImage]
			photoLibController.mediaTypes = mediaTypes
			photoLibController.allowsEditing = false
			
			self.presentViewController(photoLibController, animated: true, completion: nil)
		} else {
			var alertController = UIAlertController(title: "Alert", message: "Your device does not have cameras or photo libraries. What's up wit dat?!?", preferredStyle: UIAlertControllerStyle.Alert)
			alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
			self.presentViewController(alertController, animated: true, completion: nil)
		}
	
	}
	
	//UIImagePickerControllerDelegate
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
		let image = info[UIImagePickerControllerOriginalImage] as UIImage
		let imageData = UIImageJPEGRepresentation(image, 1.0)
		
		let managedObjConxt = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
		let EntityDesc = NSEntityDescription.entityForName("FeedItem", inManagedObjectContext: managedObjConxt!)
//		let feedItem = FeedItem()
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
