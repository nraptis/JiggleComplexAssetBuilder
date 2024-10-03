//
//  IconPackSlice.swift
//  JiggleIconAssetBundler
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

class AnyTextIcon {
    let fileName: String
    var device: Device
    var orientation: Orientation?
    let orientationName: String
    let deviceName: String
    init(fileName: String,
         device: Device,
         orientation: Orientation?,
         orientationName: String,
         deviceName: String) {
        self.fileName = fileName
        self.device = device
        self.orientation = orientation
        self.orientationName = orientationName
        self.deviceName = deviceName
    }
}
