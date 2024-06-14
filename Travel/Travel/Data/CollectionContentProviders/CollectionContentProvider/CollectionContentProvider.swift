//
//  CollectionContentProvider.swift
//  Travel
//
//  Created by Ruslan Mishyn on 13.06.2024.
//

import Foundation

protocol CollectionContentProvider<ItemType> {
    associatedtype ItemType
    
    var items: [[ItemType]] {get}
}
