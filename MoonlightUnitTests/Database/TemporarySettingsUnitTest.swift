//
//  TemporarySettingsUnitTest.swift
//  Moonlight
//
//  Created by David Aghassi on 4/12/16.
//  Copyright © 2016 Moonlight Stream. All rights reserved.
//

import XCTest
import CoreData
@testable import Moonlight

class TemporarySettingsUnitTest: XCTestCase {
  var temporarySettingsUnderTest: TemporarySettings!
  var inMemoryObjectContext: NSManagedObjectContext!
  var testSettings: Settings!
  
  override func setUp() {
    super.setUp()
    
    // Create object under test and a temporary MoC
    temporarySettingsUnderTest = TemporarySettings()
    inMemoryObjectContext = setUpInMemoryManagedObjectContext()
    XCTAssertNotNil(inMemoryObjectContext, "In memory object context failed to initialize properly. Should not be nil. See line \(#line) \n.")
    
    // Instantiate the test object to be passed in
    testSettings = NSEntityDescription.insertNewObjectForEntityForName("Settings", inManagedObjectContext: inMemoryObjectContext) as! Settings
    testSettings.bitrate = 20
    testSettings.framerate = 30
    testSettings.height = 1920
    testSettings.width = 1080
    testSettings.onscreenControls = 5
    testSettings.uniqueId = "0123456789"
    
    // Save to the MoC
    do {
      try inMemoryObjectContext.save()
    } catch {
      fatalError("Failed to save Settings for TemporarySettingsUnitTest. See line \(#line) \n")
    }
  }
  
  override func tearDown() {
    super.tearDown()
    
    // Clear MoC
    inMemoryObjectContext.deleteObject(testSettings)
  }
  
  func test_Assert_initFromSettings_Returns_AnyObject_Of_Type_TemporarySettings() {
    let returnObject = temporarySettingsUnderTest.initFromSettings(testSettings)
    XCTAssertTrue(returnObject.dynamicType == TemporarySettings.self, "initFromSettings did not return TemporarySettings \n. Expected: \(TemporarySettings.self) \n, Actual: \(returnObject.dynamicType) \n")
  }
}
