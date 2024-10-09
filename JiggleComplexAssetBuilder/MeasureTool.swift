//
//  TextIconMeasureTool.swift
//  JiggleIconAssetBundler
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation
#if os(macOS)
import Cocoa
#else
import UIKit
#endif

struct Asset {
    let iconSets: [IconSet]
    let name: String
    func getIconSet(classification: Classification) -> IconSet? {
        for iconSet in iconSets {
            if iconSet.classification == classification {
                return iconSet
            }
        }
        return nil
    }
}

struct IconSetPage {
    let name: String
    let scale: Scale
    let width: Int
    let height: Int
    let imageData: Data
    let imageFileName: String
}

struct IconSet {
    let fileName: String
    let classification: Classification
    let device: Device
    let pages: [IconSetPage]
    func getPage(scale: Scale) -> IconSetPage? {
        for page in pages {
            if page.scale == scale {
                return page
            }
        }
        return nil
    }
    
    func getWidth1() -> Int {
        if let page = getPage(scale: .X1_0) {
            return page.width
        }
        return 0
    }
    
    func getHeight1() -> Int {
        if let page = getPage(scale: .X1_0) {
            return page.height
        }
        return 0
    }
    
}

class MeasureTool {
    
    static func framedConvertibleBuildAsset(prefix: String, name: String) {
        let classifications = convertibleClassifications()
        let scales = getScales()
        let asset = getAsset(prefix: prefix,
                             name: name,
                             classifications: classifications,
                             scales: scales)
        export(asset: asset)
        framedConvertibleLogAsset(prefix: prefix, name: name, asset: asset)
    }
    
    static func looseConvertibleBuildAsset(prefix: String, name: String) {
        let classifications = convertibleClassifications()
        let scales = getScales()
        let asset = getAsset(prefix: prefix,
                             name: name,
                             classifications: classifications,
                             scales: scales)
        export(asset: asset)
        looseConvertibleLogAsset(prefix: prefix, name: name, asset: asset)
    }
    
    static func framedLongBuildAsset(prefix: String, name: String) {
        let classifications = longClassifications()
        let scales = getScales()
        let asset = getAsset(prefix: prefix,
                             name: name,
                             classifications: classifications,
                             scales: scales)
        export(asset: asset)
        framedLongLogAsset(prefix: prefix, name: name, asset: asset)
    }
    
    static func convertibleClassifications() -> [Classification] {
        let classifications: [Classification] = [
            .pad0LinesDark,
            .phoneLandscape0LinesDark,
            .phonePortrait0LinesDark,
            .pad0LinesLight,
            .phoneLandscape0LinesLight,
            .phonePortrait0LinesLight,
            .pad0LinesDarkDisabled,
            .phoneLandscape0LinesDarkDisabled,
            .phonePortrait0LinesDarkDisabled,
            .pad0LinesLightDisabled,
            .phoneLandscape0LinesLightDisabled,
            .phonePortrait0LinesLightDisabled,
            
            .pad1LineDark,
            .phoneLandscape1LineDark,
            .phonePortrait1LineDark,
            .pad1LineLight,
            .phoneLandscape1LineLight,
            .phonePortrait1LineLight,
            .pad1LineDarkDisabled,
            .phoneLandscape1LineDarkDisabled,
            .phonePortrait1LineDarkDisabled,
            .pad1LineLightDisabled,
            .phoneLandscape1LineLightDisabled,
            .phonePortrait1LineLightDisabled,
            
            .pad2LinesDark,
            .phoneLandscape2LinesDark,
            .phonePortrait2LinesDark,
            .pad2LinesLight,
            .phoneLandscape2LinesLight,
            .phonePortrait2LinesLight,
            .pad2LinesDarkDisabled,
            .phoneLandscape2LinesDarkDisabled,
            .phonePortrait2LinesDarkDisabled,
            .pad2LinesLightDisabled,
            .phoneLandscape2LinesLightDisabled,
            .phonePortrait2LinesLightDisabled,
        ]
        return classifications
    }
    
    static func longClassifications() -> [Classification] {
        let classifications: [Classification] = [
            .pad0LinesDark,
            .phoneLandscape0LinesDark,
            .phonePortrait0LinesDark,
            .pad0LinesLight,
            .phoneLandscape0LinesLight,
            .phonePortrait0LinesLight,
            .pad0LinesDarkDisabled,
            .phoneLandscape0LinesDarkDisabled,
            .phonePortrait0LinesDarkDisabled,
            .pad0LinesLightDisabled,
            .phoneLandscape0LinesLightDisabled,
            .phonePortrait0LinesLightDisabled,
        ]
        return classifications
    }
    
    static func getScales() -> [Scale] {
        let scales: [Scale] = [
            .X1_0,
            .X2_0,
            .X3_0,
        ]
        return scales
    }
    
    static func snakeToCamel(string: String) -> String {
        let parts = string.split(separator: "_")
        var result = ""
        
        var index = 0
        while index < parts.count {
            let part = parts[index]
            if part.count > 0 {
                if index == 0 {
                    result += part
                } else {
                    result += part.capitalized
                }
            }
            index += 1
        }
        
        return result
    }
    
    static func framedConvertibleLogAsset(prefix: String,
                                          name: String,
                                          asset: Asset) {
        
        guard let iconSetPad_0 = asset.getIconSet(classification: .pad0LinesDark) else {
            fatalError("iconSetPad_0 doesn't exist")
        }
        
        guard let iconSetPad_1 = asset.getIconSet(classification: .pad1LineDark) else {
            fatalError("iconSetPad_1 doesn't exist")
        }
        
        guard let iconSetPad_2 = asset.getIconSet(classification: .pad2LinesDark) else {
            fatalError("iconSetPad_2 doesn't exist")
        }
        
        guard let iconSetPhoneLandscape_0 = asset.getIconSet(classification: .phoneLandscape0LinesDark) else {
            fatalError("iconSetPhoneLandscape_0 doesn't exist")
        }
        
        guard let iconSetPhoneLandscape_1 = asset.getIconSet(classification: .phoneLandscape1LineDark) else {
            fatalError("iconSetPhoneLandscape_1 doesn't exist")
        }
        
        guard let iconSetPhoneLandscape_2 = asset.getIconSet(classification: .phoneLandscape2LinesDark) else {
            fatalError("iconSetPhoneLandscape_2 doesn't exist")
        }
        
        guard let iconSetPhonePortrait_0 = asset.getIconSet(classification: .phonePortrait0LinesDark) else {
            fatalError("iconSetPhonePortrait_0 doesn't exist")
        }
        
        guard let iconSetPhonePortrait_1 = asset.getIconSet(classification: .phonePortrait1LineDark) else {
            fatalError("iconSetPhonePortrait_1 doesn't exist")
        }
        
        guard let iconSetPhonePortrait_2 = asset.getIconSet(classification: .phonePortrait2LinesDark) else {
            fatalError("iconSetPhonePortrait_2 doesn't exist")
        }
        
        let widthPad_0 = iconSetPad_0.getWidth1()
        let heightPad_0 = iconSetPad_0.getHeight1()
        
        let widthPhonePortrait_0 = iconSetPhonePortrait_0.getWidth1()
        let heightPhonePortrait_0 = iconSetPhonePortrait_0.getHeight1()
        
        let widthPhoneLandscape_0 = iconSetPhoneLandscape_0.getWidth1()
        let heightPhoneLandscape_0 = iconSetPhoneLandscape_0.getHeight1()
        
        let widthPad_1 = iconSetPad_1.getWidth1()
        let heightPad_1 = iconSetPad_1.getHeight1()
        
        let widthPhonePortrait_1 = iconSetPhonePortrait_1.getWidth1()
        let heightPhonePortrait_1 = iconSetPhonePortrait_1.getHeight1()
        
        let widthPhoneLandscape_1 = iconSetPhoneLandscape_1.getWidth1()
        let heightPhoneLandscape_1 = iconSetPhoneLandscape_1.getHeight1()
        
        let widthPad_2 = iconSetPad_2.getWidth1()
        let heightPad_2 = iconSetPad_2.getHeight1()
        
        let widthPhonePortrait_2 = iconSetPhonePortrait_2.getWidth1()
        let heightPhonePortrait_2 = iconSetPhonePortrait_2.getHeight1()
        
        let widthPhoneLandscape_2 = iconSetPhoneLandscape_2.getWidth1()
        let heightPhoneLandscape_2 = iconSetPhoneLandscape_2.getHeight1()
        
        let variableName = snakeToCamel(string: name)
        
        let output = """
static var \(variableName): FramedConvertibleIconPack {
    Self.build(prefix: "\(prefix)",
              name: "\(name)",
              widthPad_0: \(widthPad_0), heightPad_0: \(heightPad_0),
              widthPhoneLandscape_0: \(widthPhoneLandscape_0), heightPhoneLandscape_0: \(heightPhoneLandscape_0),
              widthPhonePortrait_0: \(widthPhonePortrait_0), heightPhonePortrait_0: \(heightPhonePortrait_0),
              widthPad_1: \(widthPad_1), heightPad_1: \(heightPad_1),
              widthPhoneLandscape_1: \(widthPhoneLandscape_1), heightPhoneLandscape_1: \(heightPhoneLandscape_1),
              widthPhonePortrait_1: \(widthPhonePortrait_1), heightPhonePortrait_1: \(heightPhonePortrait_1),
              widthPad_2: \(widthPad_2), heightPad_2: \(heightPad_2),
              widthPhoneLandscape_2: \(widthPhoneLandscape_2), heightPhoneLandscape_2: \(heightPhoneLandscape_2),
              widthPhonePortrait_2: \(widthPhonePortrait_2), heightPhonePortrait_2: \(heightPhonePortrait_2))
}
"""
        
        print("")
        print(output)
        print("")
        
    }
    
    static func looseConvertibleLogAsset(prefix: String,
                                         name: String,
                                         asset: Asset) {
        
        guard let iconSetPad_0 = asset.getIconSet(classification: .pad0LinesDark) else {
            fatalError("iconSetPad_0 doesn't exist")
        }
        
        guard let iconSetPad_1 = asset.getIconSet(classification: .pad1LineDark) else {
            fatalError("iconSetPad_1 doesn't exist")
        }
        
        guard let iconSetPad_2 = asset.getIconSet(classification: .pad2LinesDark) else {
            fatalError("iconSetPad_2 doesn't exist")
        }
        
        guard let iconSetPhoneLandscape_0 = asset.getIconSet(classification: .phoneLandscape0LinesDark) else {
            fatalError("iconSetPhoneLandscape_0 doesn't exist")
        }
        
        guard let iconSetPhoneLandscape_1 = asset.getIconSet(classification: .phoneLandscape1LineDark) else {
            fatalError("iconSetPhoneLandscape_1 doesn't exist")
        }
        
        guard let iconSetPhoneLandscape_2 = asset.getIconSet(classification: .phoneLandscape2LinesDark) else {
            fatalError("iconSetPhoneLandscape_2 doesn't exist")
        }
        
        guard let iconSetPhonePortrait_0 = asset.getIconSet(classification: .phonePortrait0LinesDark) else {
            fatalError("iconSetPhonePortrait_0 doesn't exist")
        }
        
        guard let iconSetPhonePortrait_1 = asset.getIconSet(classification: .phonePortrait1LineDark) else {
            fatalError("iconSetPhonePortrait_1 doesn't exist")
        }
        
        guard let iconSetPhonePortrait_2 = asset.getIconSet(classification: .phonePortrait2LinesDark) else {
            fatalError("iconSetPhonePortrait_2 doesn't exist")
        }
        
        let widthPad_0 = iconSetPad_0.getWidth1()
        let heightPad_0 = iconSetPad_0.getHeight1()
        
        let widthPhonePortrait_0 = iconSetPhonePortrait_0.getWidth1()
        let heightPhonePortrait_0 = iconSetPhonePortrait_0.getHeight1()
        
        let widthPhoneLandscape_0 = iconSetPhoneLandscape_0.getWidth1()
        let heightPhoneLandscape_0 = iconSetPhoneLandscape_0.getHeight1()
        
        let widthPad_1 = iconSetPad_1.getWidth1()
        let heightPad_1 = iconSetPad_1.getHeight1()
        
        let widthPhonePortrait_1 = iconSetPhonePortrait_1.getWidth1()
        let heightPhonePortrait_1 = iconSetPhonePortrait_1.getHeight1()
        
        let widthPhoneLandscape_1 = iconSetPhoneLandscape_1.getWidth1()
        let heightPhoneLandscape_1 = iconSetPhoneLandscape_1.getHeight1()
        
        let widthPad_2 = iconSetPad_2.getWidth1()
        let heightPad_2 = iconSetPad_2.getHeight1()
        
        let widthPhonePortrait_2 = iconSetPhonePortrait_2.getWidth1()
        let heightPhonePortrait_2 = iconSetPhonePortrait_2.getHeight1()
        
        let widthPhoneLandscape_2 = iconSetPhoneLandscape_2.getWidth1()
        let heightPhoneLandscape_2 = iconSetPhoneLandscape_2.getHeight1()
        
        let variableName = snakeToCamel(string: name)
        
        let output = """
static var \(variableName): LooseConvertibleIconPack {
    Self.build(prefix: "\(prefix)",
              name: "\(name)",
              widthPad_0: \(widthPad_0), heightPad_0: \(heightPad_0),
              widthPhoneLandscape_0: \(widthPhoneLandscape_0), heightPhoneLandscape_0: \(heightPhoneLandscape_0),
              widthPhonePortrait_0: \(widthPhonePortrait_0), heightPhonePortrait_0: \(heightPhonePortrait_0),
              widthPad_1: \(widthPad_1), heightPad_1: \(heightPad_1),
              widthPhoneLandscape_1: \(widthPhoneLandscape_1), heightPhoneLandscape_1: \(heightPhoneLandscape_1),
              widthPhonePortrait_1: \(widthPhonePortrait_1), heightPhonePortrait_1: \(heightPhonePortrait_1),
              widthPad_2: \(widthPad_2), heightPad_2: \(heightPad_2),
              widthPhoneLandscape_2: \(widthPhoneLandscape_2), heightPhoneLandscape_2: \(heightPhoneLandscape_2),
              widthPhonePortrait_2: \(widthPhonePortrait_2), heightPhonePortrait_2: \(heightPhonePortrait_2))
}
"""
        
        print("")
        print(output)
        print("")
        
    }
    
    static func framedLongLogAsset(prefix: String,
                                          name: String,
                                   asset: Asset) {
        
        guard let iconSetPad_0 = asset.getIconSet(classification: .pad0LinesDark) else {
            fatalError("iconSetPad_0 doesn't exist")
        }
        
        guard let iconSetPhoneLandscape_0 = asset.getIconSet(classification: .phoneLandscape0LinesDark) else {
            fatalError("iconSetPhoneLandscape_0 doesn't exist")
        }
        
        guard let iconSetPhonePortrait_0 = asset.getIconSet(classification: .phonePortrait0LinesDark) else {
            fatalError("iconSetPhonePortrait_0 doesn't exist")
        }
        
        let widthPad_0 = iconSetPad_0.getWidth1()
        let heightPad_0 = iconSetPad_0.getHeight1()
        
        let widthPhonePortrait_0 = iconSetPhonePortrait_0.getWidth1()
        let heightPhonePortrait_0 = iconSetPhonePortrait_0.getHeight1()
        
        let widthPhoneLandscape_0 = iconSetPhoneLandscape_0.getWidth1()
        let heightPhoneLandscape_0 = iconSetPhoneLandscape_0.getHeight1()
        
        let variableName = snakeToCamel(string: name)
        
        let output = """
static var \(variableName): FramedLongIconPack {
    Self.build(prefix: "\(prefix)",
               name: "\("\(name)")",
               widthPad_0: \(widthPad_0), heightPad_0: \(heightPad_0),
               widthPhoneLandscape_0: \(widthPhoneLandscape_0), heightPhoneLandscape_0: \(heightPhoneLandscape_0),
               widthPhonePortrait_0: \(widthPhonePortrait_0), heightPhonePortrait_0: \(heightPhonePortrait_0))
}
"""
        print("")
        print(output)
        print("")
    }
    
    static func getIconPackSlice(iconSet: IconSet) -> AnyTextIcon {
        
        var orientationName = "nil"
        if let orientation = iconSet.classification.orientation {
            switch orientation {
            case .landscape:
                orientationName = ".landscape"
            case .portrait:
                orientationName = ".portrait"
            }
        }
        
        return AnyTextIcon(fileName: iconSet.fileName,
                           device: iconSet.device,
                           orientation: iconSet.classification.orientation,
                           orientationName: orientationName,
                           deviceName: ((iconSet.classification.device == .pad) ? ".pad" : ".phone"))
    }
    
    
    
}
