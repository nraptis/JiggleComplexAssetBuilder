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
    
    static func FramedConvertibleBuildAsset(prefix: String, name: String) {
        let classifications = FramedConvertibleClassifications()
        let scales = getScales()
        let asset = getAsset(prefix: prefix,
                             name: name,
                             classifications: classifications,
                             scales: scales)
        export(asset: asset)
        FramedConvertibleLogAsset(prefix: prefix, name: name, asset: asset)
    }
    
    static func sexyButtonBuildAsset(prefix: String, name: String) {
        let classifications = sexyButtonClassifications()
        let scales = getScales()
        let asset = getAsset(prefix: prefix,
                             name: name,
                             classifications: classifications,
                             scales: scales)
        export(asset: asset)
        sexyButtonLogAsset(prefix: prefix, name: name, asset: asset)
    }
    
    static func mainTabBuildAsset(prefix: String, name: String) {
        let classifications = mainTabClassifications()
        let scales = getScales()
        let asset = getAsset(prefix: prefix,
                             name: name,
                             classifications: classifications,
                             scales: scales)
        export(asset: asset)
        mainTabLogAsset(prefix: prefix, name: name, asset: asset)
    }
    
    static func getAsset(prefix: String, name: String, classifications: [Classification], scales: [Scale]) -> Asset {
        var iconSets = [IconSet]()
        
        for classification in classifications {
            var pages = [IconSetPage]()
            for scale in scales {
                let pageName = prefix + "_" + name + "_" + classification.nameComponent + "_" + scale.nameComponent
                let fileName = pageName + ".png"
                let filePath = FileUtils.shared.getMainBundleFilePath(fileName: fileName)
                if let imageData = FileUtils.shared.load(filePath) {
                    if let image = NSImage(data: imageData) {
                        if let cgImage = image.cgImage(forProposedRect: nil,
                                                       context: nil,
                                                       hints: nil) {
                            let page = IconSetPage(name: pageName,
                                                   scale: scale,
                                                   width: cgImage.width,
                                                   height: cgImage.height,
                                                   imageData: imageData,
                                                   imageFileName: filePath)
                            pages.append(page)
                        } else {
                            print("[[ BAD IMAGE ]] @ \(fileName) from \(name)")
                            //exit(0)
                        }
                    } else {
                        print("[[ BAD FILE DATA ]] @ \(fileName) from \(name)")
                        //exit(0)
                    }
                } else {
                    print("[[ BAD FILE PATH ]] @ \(fileName) from \(name)")
                    //exit(0)
                }
            }
            let iconSetFileName = prefix + "_" + name + "_" + classification.nameComponent
            let iconSet = IconSet(fileName: iconSetFileName,
                                  classification: classification,
                                  device: classification.device,
                                  pages: pages)
            iconSets.append(iconSet)
        }
        return Asset(iconSets: iconSets,
                     name: prefix + "_" + name)
    }
    
    static func FramedConvertibleClassifications() -> [Classification] {
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
    
    static func sexyButtonClassifications() -> [Classification] {
        let classifications: [Classification] = [
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
    
    static func mainTabClassifications() -> [Classification] {
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
    
    static func sexyButtonLogAsset(prefix: String,
                                 name: String,
                                   asset: Asset) {
        
        guard let iconSetPad1Line = asset.getIconSet(classification: .pad1LineDark) else {
            fatalError("iconSetPad1Line doesn't exist")
        }
        
        guard let iconSetPad2Lines = asset.getIconSet(classification: .pad2LinesDark) else {
            fatalError("iconSetPad2Lines doesn't exist")
        }
        
        guard let iconSetPhoneLandscape1Line = asset.getIconSet(classification: .phoneLandscape1LineDark) else {
            fatalError("iconSetPhoneLandscape1Line doesn't exist")
        }
        
        guard let iconSetPhoneLandscape2Lines = asset.getIconSet(classification: .phoneLandscape2LinesDark) else {
            fatalError("iconSetPhoneLandscape2Lines doesn't exist")
        }
        
        guard let iconSetPhonePortrait1Line = asset.getIconSet(classification: .phonePortrait1LineDark) else {
            fatalError("iconSetPhonePortrait1Line doesn't exist")
        }
        
        guard let iconSetPhonePortrait2Lines = asset.getIconSet(classification: .phonePortrait2LinesDark) else {
            fatalError("iconSetPhonePortrait2Lines doesn't exist")
        }
        
        let widthPad1Line = iconSetPad1Line.getWidth1()
        let heightPad1Line = iconSetPad1Line.getHeight1()
        
        let widthPhonePortrait1Line = iconSetPhonePortrait1Line.getWidth1()
        let heightPhonePortrait1Line = iconSetPhonePortrait1Line.getHeight1()
        
        let widthPhoneLandscape1Line = iconSetPhoneLandscape1Line.getWidth1()
        let heightPhoneLandscape1Line = iconSetPhoneLandscape1Line.getHeight1()
        
        let widthPad2Lines = iconSetPad2Lines.getWidth1()
        let heightPad2Lines = iconSetPad2Lines.getHeight1()
        
        let widthPhonePortrait2Lines = iconSetPhonePortrait2Lines.getWidth1()
        let heightPhonePortrait2Lines = iconSetPhonePortrait2Lines.getHeight1()
        
        let widthPhoneLandscape2Lines = iconSetPhoneLandscape2Lines.getWidth1()
        let heightPhoneLandscape2Lines = iconSetPhoneLandscape2Lines.getHeight1()
        
        let variableName = snakeToCamel(string: name)
        
        let output = """

static var \(variableName): SexyButtonIconPack {
    let name = "\(prefix)_\(name)"
    let widthPad1Line = \(widthPad1Line)
    let heightPad1Line = \(heightPad1Line)
    let widthPhonePortrait1Line = \(widthPhonePortrait1Line)
    let heightPhonePortrait1Line = \(heightPhonePortrait1Line)
    let widthPhoneLandscape1Line = \(widthPhoneLandscape1Line)
    let heightPhoneLandscape1Line = \(heightPhoneLandscape1Line)
    
    let widthPad2Lines = \(widthPad2Lines)
    let heightPad2Lines = \(heightPad2Lines)
    let widthPhonePortrait2Lines = \(widthPhonePortrait2Lines)
    let heightPhonePortrait2Lines = \(heightPhonePortrait2Lines)
    let widthPhoneLandscape2Lines = \(widthPhoneLandscape2Lines)
    let heightPhoneLandscape2Lines = \(heightPhoneLandscape2Lines)
    
    return Self.build(name: name, widthPad1Line: widthPad1Line, heightPad1Line: heightPad1Line,
                      widthPhoneLandscape1Line: widthPhoneLandscape1Line, heightPhoneLandscape1Line: heightPhoneLandscape1Line,
                      widthPhonePortrait1Line: widthPhonePortrait1Line, heightPhonePortrait1Line: heightPhonePortrait1Line,
                      widthPad2Lines: widthPad2Lines, heightPad2Lines: heightPad2Lines,
                      widthPhoneLandscape2Lines: widthPhoneLandscape2Lines, heightPhoneLandscape2Lines: heightPhoneLandscape2Lines,
                      widthPhonePortrait2Lines: widthPhonePortrait2Lines, heightPhonePortrait2Lines: heightPhonePortrait2Lines)
}
"""
        
        print("")
        print(output)
        print("")
        
    }
    
    static func mainTabLogAsset(prefix: String,
                                 name: String,
                                 asset: Asset) {
        
        guard let iconSetPad = asset.getIconSet(classification: .pad0LinesDark) else {
            fatalError("iconSetPad0Lines doesn't exist")
        }
        
        guard let iconSetPhoneLandscape = asset.getIconSet(classification: .phoneLandscape0LinesDark) else {
            fatalError("iconSetPad0Lines doesn't exist")
        }
        
        guard let iconSetPhonePortrait = asset.getIconSet(classification: .phonePortrait0LinesDark) else {
            fatalError("iconSetPad0Lines doesn't exist")
        }
        
        let widthPad = iconSetPad.getWidth1()
        let heightPad = iconSetPad.getHeight1()
        
        let widthPhonePortrait = iconSetPhonePortrait.getWidth1()
        let heightPhonePortrait = iconSetPhonePortrait.getHeight1()
        
        let widthPhoneLandscape = iconSetPhoneLandscape.getWidth1()
        let heightPhoneLandscape = iconSetPhoneLandscape.getHeight1()
        
        let variableName = snakeToCamel(string: name)
        
        let output = """
static var \(variableName): MainTabIconPack {
    let name = "\(prefix)_\(name)"
    let widthPad = \(widthPad)
    let heightPad = \(heightPad)
    let widthPhonePortrait = \(widthPhonePortrait)
    let heightPhonePortrait = \(heightPhonePortrait)
    let widthPhoneLandscape = \(widthPhoneLandscape)
    let heightPhoneLandscape = \(heightPhoneLandscape)
    return Self.build(name: name, widthPad: widthPad, heightPad: heightPad,
                      widthPhoneLandscape: widthPhoneLandscape, heightPhoneLandscape: heightPhoneLandscape,
                      widthPhonePortrait: widthPhonePortrait, heightPhonePortrait: heightPhonePortrait)
}
"""
        
        print("")
        print(output)
        print("")
        
    }
    
    static func FramedConvertibleLogAsset(prefix: String,
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
