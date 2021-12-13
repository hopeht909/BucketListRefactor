//
//  TableViewDelegate.swift
//  BucketListRefactor
//
//  Created by admin on 13/12/2021.
//

import UIKit

protocol TableViewDelegate: AnyObject{
    
    func cancelButtonPressed(by controller: AddItemViewController)
    func itemSaved(by controller: AddItemViewController, with text: String, at indexPath: NSIndexPath?)
}
