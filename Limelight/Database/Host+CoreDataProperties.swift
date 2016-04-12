//
//  Host+CoreDataProperties.swift
//  Moonlight
//
//  Created by David Aghassi on 4/12/16.
//  Copyright © 2016 Moonlight Stream. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Host {

    @NSManaged var address: String?
    @NSManaged var externalAddress: String?
    @NSManaged var localAddress: String?
    @NSManaged var mac: String?
    @NSManaged var name: String?
    @NSManaged var pairState: NSNumber?
    @NSManaged var uuid: String?
    @NSManaged var appList: NSSet?

}
