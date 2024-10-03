//
//  Classification.swift
//  JiggleIconAssetBundler
//
//  Created by Nicky Taylor on 6/10/24.
//

import Foundation

enum Classification {
    
    case pad0LinesDark
    case phoneLandscape0LinesDark
    case phonePortrait0LinesDark
    case pad0LinesLight
    case phoneLandscape0LinesLight
    case phonePortrait0LinesLight
    case pad0LinesDarkDisabled
    case phoneLandscape0LinesDarkDisabled
    case phonePortrait0LinesDarkDisabled
    case pad0LinesLightDisabled
    case phoneLandscape0LinesLightDisabled
    case phonePortrait0LinesLightDisabled
    
    case pad1LineDark
    case phoneLandscape1LineDark
    case phonePortrait1LineDark
    case pad1LineLight
    case phoneLandscape1LineLight
    case phonePortrait1LineLight
    case pad1LineDarkDisabled
    case phoneLandscape1LineDarkDisabled
    case phonePortrait1LineDarkDisabled
    case pad1LineLightDisabled
    case phoneLandscape1LineLightDisabled
    case phonePortrait1LineLightDisabled
    
    case pad2LinesDark
    case phoneLandscape2LinesDark
    case phonePortrait2LinesDark
    case pad2LinesLight
    case phoneLandscape2LinesLight
    case phonePortrait2LinesLight
    case pad2LinesDarkDisabled
    case phoneLandscape2LinesDarkDisabled
    case phonePortrait2LinesDarkDisabled
    case pad2LinesLightDisabled
    case phoneLandscape2LinesLightDisabled
    case phonePortrait2LinesLightDisabled
    
    var scales: [Scale] {
        switch self {
        case .pad0LinesDark, 
                .pad0LinesLight,
                .pad0LinesDarkDisabled,
                .pad0LinesLightDisabled:
            return [.X1_0, .X2_0]
        case .phoneLandscape0LinesDark, 
                .phoneLandscape0LinesLight,
                .phoneLandscape0LinesDarkDisabled,
                .phoneLandscape0LinesLightDisabled:
            return [.X1_0, .X2_0, .X3_0]
        case .phonePortrait0LinesDark,
                .phonePortrait0LinesLight,
                .phonePortrait0LinesDarkDisabled,
                .phonePortrait0LinesLightDisabled:
            return [.X1_0, .X2_0, .X3_0]
            
        case .pad1LineDark,
                .pad1LineLight,
                .pad1LineDarkDisabled,
                .pad1LineLightDisabled:
            return [.X1_0, .X2_0]
        case .phoneLandscape1LineDark,
                .phoneLandscape1LineLight,
                .phoneLandscape1LineDarkDisabled,
                .phoneLandscape1LineLightDisabled:
            return [.X1_0, .X2_0, .X3_0]
        case .phonePortrait1LineDark,
                .phonePortrait1LineLight,
                .phonePortrait1LineDarkDisabled,
                .phonePortrait1LineLightDisabled:
            return [.X1_0, .X2_0, .X3_0]
            
        case .pad2LinesDark,
                .pad2LinesLight,
                .pad2LinesDarkDisabled,
                .pad2LinesLightDisabled:
            return [.X1_0, .X2_0]
        case .phoneLandscape2LinesDark,
                .phoneLandscape2LinesLight,
                .phoneLandscape2LinesDarkDisabled,
                .phoneLandscape2LinesLightDisabled:
            return [.X1_0, .X2_0, .X3_0]
        case .phonePortrait2LinesDark,
                .phonePortrait2LinesLight,
                .phonePortrait2LinesDarkDisabled,
                .phonePortrait2LinesLightDisabled:
            return [.X1_0, .X2_0, .X3_0]
            
        }
    }
    
    var nameComponent: String {
        
        switch self {
        case .pad0LinesDark:
            "pad_0l_dark"
        case .phoneLandscape0LinesDark:
            "phone_ls_0l_dark"
        case .phonePortrait0LinesDark:
            "phone_po_0l_dark"
        case .pad0LinesLight:
            "pad_0l_light"
        case .phoneLandscape0LinesLight:
            "phone_ls_0l_light"
        case .phonePortrait0LinesLight:
            "phone_po_0l_light"
        case .pad0LinesDarkDisabled:
            "pad_0l_dark_disabled"
        case .phoneLandscape0LinesDarkDisabled:
            "phone_ls_0l_dark_disabled"
        case .phonePortrait0LinesDarkDisabled:
            "phone_po_0l_dark_disabled"
        case .pad0LinesLightDisabled:
            "pad_0l_light_disabled"
        case .phoneLandscape0LinesLightDisabled:
            "phone_ls_0l_light_disabled"
        case .phonePortrait0LinesLightDisabled:
            "phone_po_0l_light_disabled"
            
        case .pad1LineDark:
            "pad_1l_dark"
        case .phoneLandscape1LineDark:
            "phone_ls_1l_dark"
        case .phonePortrait1LineDark:
            "phone_po_1l_dark"
        case .pad1LineLight:
            "pad_1l_light"
        case .phoneLandscape1LineLight:
            "phone_ls_1l_light"
        case .phonePortrait1LineLight:
            "phone_po_1l_light"
        case .pad1LineDarkDisabled:
            "pad_1l_dark_disabled"
        case .phoneLandscape1LineDarkDisabled:
            "phone_ls_1l_dark_disabled"
        case .phonePortrait1LineDarkDisabled:
            "phone_po_1l_dark_disabled"
        case .pad1LineLightDisabled:
            "pad_1l_light_disabled"
        case .phoneLandscape1LineLightDisabled:
            "phone_ls_1l_light_disabled"
        case .phonePortrait1LineLightDisabled:
            "phone_po_1l_light_disabled"
            
        case .pad2LinesDark:
            "pad_2l_dark"
        case .phoneLandscape2LinesDark:
            "phone_ls_2l_dark"
        case .phonePortrait2LinesDark:
            "phone_po_2l_dark"
        case .pad2LinesLight:
            "pad_2l_light"
        case .phoneLandscape2LinesLight:
            "phone_ls_2l_light"
        case .phonePortrait2LinesLight:
            "phone_po_2l_light"
        case .pad2LinesDarkDisabled:
            "pad_2l_dark_disabled"
        case .phoneLandscape2LinesDarkDisabled:
            "phone_ls_2l_dark_disabled"
        case .phonePortrait2LinesDarkDisabled:
            "phone_po_2l_dark_disabled"
        case .pad2LinesLightDisabled:
            "pad_2l_light_disabled"
        case .phoneLandscape2LinesLightDisabled:
            "phone_ls_2l_light_disabled"
        case .phonePortrait2LinesLightDisabled:
            "phone_po_2l_light_disabled"
            
        }
    }
    
    var device: Device {
        switch self {
        case .pad0LinesDark,
                .pad0LinesLight,
                .pad0LinesDarkDisabled,
                .pad0LinesLightDisabled:
            return .pad
        case .phoneLandscape0LinesDark,
                .phoneLandscape0LinesLight,
                .phoneLandscape0LinesDarkDisabled,
                .phoneLandscape0LinesLightDisabled:
            return .phone
        case .phonePortrait0LinesDark,
                .phonePortrait0LinesLight,
                .phonePortrait0LinesDarkDisabled,
                .phonePortrait0LinesLightDisabled:
            return .phone
            
        case .pad1LineDark,
                .pad1LineLight,
                .pad1LineDarkDisabled,
                .pad1LineLightDisabled:
            return .pad
        case .phoneLandscape1LineDark,
                .phoneLandscape1LineLight,
                .phoneLandscape1LineDarkDisabled,
                .phoneLandscape1LineLightDisabled:
            return .phone
        case .phonePortrait1LineDark,
                .phonePortrait1LineLight,
                .phonePortrait1LineDarkDisabled,
                .phonePortrait1LineLightDisabled:
            return .phone
            
        case .pad2LinesDark,
                .pad2LinesLight,
                .pad2LinesDarkDisabled,
                .pad2LinesLightDisabled:
            return .pad
        case .phoneLandscape2LinesDark,
                .phoneLandscape2LinesLight,
                .phoneLandscape2LinesDarkDisabled,
                .phoneLandscape2LinesLightDisabled:
            return .phone
        case .phonePortrait2LinesDark,
                .phonePortrait2LinesLight,
                .phonePortrait2LinesDarkDisabled,
                .phonePortrait2LinesLightDisabled:
            return .phone
        }
    }
    
    var orientation: Orientation? {
        switch self {
        case .pad0LinesDark,
                .pad0LinesLight,
                .pad0LinesDarkDisabled,
                .pad0LinesLightDisabled:
            return nil
        case .phoneLandscape0LinesDark,
                .phoneLandscape0LinesLight,
                .phoneLandscape0LinesDarkDisabled,
                .phoneLandscape0LinesLightDisabled:
            return .landscape
        case .phonePortrait0LinesDark,
                .phonePortrait0LinesLight,
                .phonePortrait0LinesDarkDisabled,
                .phonePortrait0LinesLightDisabled:
            return .portrait
            
            
        case .pad1LineDark,
                .pad1LineLight,
                .pad1LineDarkDisabled,
                .pad1LineLightDisabled:
            return nil
        case .phoneLandscape1LineDark,
                .phoneLandscape1LineLight,
                .phoneLandscape1LineDarkDisabled,
                .phoneLandscape1LineLightDisabled:
            return .landscape
        case .phonePortrait1LineDark,
                .phonePortrait1LineLight,
                .phonePortrait1LineDarkDisabled,
                .phonePortrait1LineLightDisabled:
            return .portrait
            
        case .pad2LinesDark,
                .pad2LinesLight,
                .pad2LinesDarkDisabled,
                .pad2LinesLightDisabled:
            return nil
        case .phoneLandscape2LinesDark,
                .phoneLandscape2LinesLight,
                .phoneLandscape2LinesDarkDisabled,
                .phoneLandscape2LinesLightDisabled:
            return .landscape
        case .phonePortrait2LinesDark,
                .phonePortrait2LinesLight,
                .phonePortrait2LinesDarkDisabled,
                .phonePortrait2LinesLightDisabled:
            return .portrait
        }
    }
}
