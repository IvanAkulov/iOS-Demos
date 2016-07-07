//
//  ViewController.swift
//  CollectionView
//
//  Created by Ivan Akulov on 01/07/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {


  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = UIColor.whiteColor()

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 100
    
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as! CollectionViewCell
    cell.backgroundColor = UIColor.greenColor()
    cell.label.text = String(indexPath.row)
    
    return cell
  }
  
//  Use for size
  func collectionView(collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                             sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    let size = CGSize(width: 100, height: 100)
    return size
    
  }
  //hotizontal
  func collectionView(collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                             minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 5.0
  }
  
//  vertical
  func collectionView(collectionView: UICollectionView, layout
    collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 5.0
  }

}

