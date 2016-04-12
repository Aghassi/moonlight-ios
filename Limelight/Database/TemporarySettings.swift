//
//  TemporarySettings.swift
//  Moonlight
//
//  Created by David Aghassi on 4/12/16.
//  Copyright © 2016 Moonlight Stream. All rights reserved.
//

import Foundation
import CoreData

@objc
protocol TempSettings {
  var parent: Settings { get set }
  
  var bitrate: NSNumber { get set }
  var framerate: NSNumber { get set }
  var height: NSNumber { get set }
  var width: NSNumber { get set }
  var onscreenControls: NSNumber { get set }
  var uniqueId: NSString { get set }
  
  func initFromSettings(settings: Settings) -> AnyObject
}

@objc
class TemporarySettings: NSObject, TempSettings {
  // Swift requires defaults to be initialized
  var parent: Settings = Settings()
  var bitrate: NSNumber = 0.0
  var framerate: NSNumber = 0.0
  var height: NSNumber = 0.0
  var width: NSNumber = 0.0
  var onscreenControls: NSNumber = 0.0
  var uniqueId: NSString = ""
  
  func initFromSettings(settings: Settings) -> AnyObject {
    parent = settings
    
    if let settingsBitrate = settings.bitrate {
      bitrate = settingsBitrate
    }
    if let settingsFramerate = settings.framerate {
      framerate = settingsFramerate
    }
    if let settingsHeight = settings.height {
      height = settingsHeight
    }
    if let settingsWidth = settings.width {
      width = settingsWidth
    }
    if let settingsOnscreenControls = settings.onscreenControls {
      onscreenControls = settingsOnscreenControls
    }
    if let settingsUniqueID = settings.uniqueId {
      uniqueId = settingsUniqueID
    }
    
    return self
  }
}