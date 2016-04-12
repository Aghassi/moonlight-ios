//
//  Settings+CoreDataProperties.swift
//  Moonlight
//
//  Created by David Aghassi on 4/11/16.
//  Copyright © 2016 Moonlight Stream. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Settings {

    @NSManaged var bitrate: NSNumber?
    @NSManaged var framerate: NSNumber?
    @NSManaged var height: NSNumber?
    @NSManaged var onscreenControls: NSNumber?
    @NSManaged var uniqueId: String?
    @NSManaged var width: NSNumber?

}
