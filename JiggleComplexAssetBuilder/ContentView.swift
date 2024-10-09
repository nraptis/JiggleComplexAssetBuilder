//
//  ContentView.swift
//  JiggleIconAssetBundler
//
//  Created by Nicky Taylor on 6/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            
            //strings.append("mode_switch_arrow_small_left")
            //strings.append("mode_switch_arrow_small_right")
            //strings.append("mode_switch_arrow_large_left")
            //strings.append("mode_switch_arrow_large_right")
            //strings.append("mode_switch_graph")
            //strings.append("mode_switch_polygon")
            //strings.append("mode_switch_jelly")
            
            
            MeasureTool.framedLongBuildAsset(prefix: "accessory", name: "lock")
            MeasureTool.framedLongBuildAsset(prefix: "accessory", name: "uncolored_lock")
            
            //accessory_lock_pad_0l_dark_1_0.png
            //accessory_uncolored_lock_pad_2l_dark_disabled_3_0.png
            
            
            
            //MeasureTool.framedConvertibleBuildAsset(prefix: "framed", name: "test_arrow_left")
            //MeasureTool.framedConvertibleBuildAsset(prefix: "framed", name: "test_arrow_right")
            
            //MeasureTool.framedConvertibleBuildAsset(prefix: "framed", name: "menu_a")
            //MeasureTool.framedConvertibleBuildAsset(prefix: "framed", name: "menu_b")
            //MeasureTool.framedConvertibleBuildAsset(prefix: "framed", name: "menu_c")
            
            //MeasureTool.looseConvertibleBuildAsset(prefix: "loose", name: "menu_a")
            //MeasureTool.looseConvertibleBuildAsset(prefix: "loose", name: "menu_b")
            //MeasureTool.looseConvertibleBuildAsset(prefix: "loose", name: "menu_c")
            
            
            //MeasureTool.mainTabBuildAsset(prefix: "mode_switch", name: "check_box_check")
            //MeasureTool.mainTabBuildAsset(prefix: "mode_switch", name: "check_box_square")
            
            //MeasureTool.FramedConvertibleBuildAsset(prefix: "sexy_check", name: "jiggles")
            
            
            //MeasureTool.sexyButtonBuildAsset(prefix: "sexy_button", name: "delete")
            //MeasureTool.sexyButtonBuildAsset(prefix: "sexy_button", name: "zoom_jiggle")
            
            //MeasureTool.sexyButtonBuildAsset(prefix: "sexy_button", name: "menu")
            //MeasureTool.sexyButtonBuildAsset(prefix: "sexy_button", name: "rotate_left")
            //MeasureTool.sexyButtonBuildAsset(prefix: "sexy_button", name: "rotate_right")
            
            //mode_switch_glass_pad_0l_light_1_0.png
            //mode_switch_zoom_phone_ls_0l_dark_disabled_1_0.png
            
            //MeasureTool.sexyButtonBuildAsset(prefix: "sexy_button", name: "redo")
            //MeasureTool.sexyButtonBuildAsset(prefix: "sexy_button", name: "undo")
            
            
            /*
            MeasureTool.mainTabBuildAsset(prefix: "mode_switch",
                                          name: "pinch")
            */
            

            

            

            

            

            

            

            

            

            
            
            
            
            
            
            //MeasureTool.segmentBoxBuildAsset(name: "mode_weights_edit_centers")
            
            
            //MeasureTool.checkBoxBuildAsset(name: "sample")
            //MeasureTool.checkBoxBuildAsset(name: "remove_points")
            
            
            //MeasureTool.checkBoxBuildAsset(name: "remove_points")
            //MeasureTool.checkBoxBuildAsset(name: "add_points")
            
            
            //mode_document_edit_weights
            //mode_document_edit_jiggles
            //mode_document_edit_points
            //mode_jiggle_edit_affine
            //mode_weights_edit_affine
            //mode_weights_edit_points
            //mode_weights_edit_centers
            
            
            //MeasureTool.textButtonBuildAsset(name: "remove_point")
            
            
            //MeasureTool.textButtonBuildAsset(name: "redo")
            
            
            //MeasureTool.goTextIconButtonButton(filePrefix: "interface_text_button_box", variableName: "dice")

            
            
            
            /*
            interface_text_button_box
            
            let filePath1 = FileUtils.shared.getMainBundleFilePath(fileName: "dimp_01.png")
            if let image = FileUtils.shared.loadImage(filePath1) {
                if let cgImage = image.cgImage(forProposedRect: nil,
                                               context: nil,
                                               hints: nil) {
                    let bitmap = Bitmap(cgImage: cgImage)
                    bitmap.printData()
                    let edges = bitmap.getInsets()
                    print("edges.left: \(edges.left)")
                    print("edges.right: \(edges.right)")
                    print("edges.top: \(edges.top)")
                    print("edges.bottom: \(edges.bottom)")
                    
                    
                }
            }
            let filePath2 = FileUtils.shared.getMainBundleFilePath(fileName: "dimp_02.png")
            if let image = FileUtils.shared.loadImage(filePath2) {
                if let cgImage = image.cgImage(forProposedRect: nil,
                                               context: nil,
                                               hints: nil) {
                    let bitmap = Bitmap(cgImage: cgImage)
                    let edges = bitmap.getInsets()
                    print("2 edges.left: \(edges.left)")
                    print("2 edges.right: \(edges.right)")
                    print("2 edges.top: \(edges.top)")
                    print("2 edges.bottom: \(edges.bottom)")
                }
            }
            let filePath3 = FileUtils.shared.getMainBundleFilePath(fileName: "dimp_03.png")
            if let image = FileUtils.shared.loadImage(filePath3) {
                if let cgImage = image.cgImage(forProposedRect: nil,
                                               context: nil,
                                               hints: nil) {
                    let bitmap = Bitmap(cgImage: cgImage)
                    let edges = bitmap.getInsets()
                    print("3 edges.left: \(edges.left)")
                    print("3 edges.right: \(edges.right)")
                    print("3 edges.top: \(edges.top)")
                    print("3 edges.bottom: \(edges.bottom)")
                }
            }
            let filePath4 = FileUtils.shared.getMainBundleFilePath(fileName: "dimp_04.png")
            if let image = FileUtils.shared.loadImage(filePath4) {
                if let cgImage = image.cgImage(forProposedRect: nil,
                                               context: nil,
                                               hints: nil) {
                    let bitmap = Bitmap(cgImage: cgImage)
                    let edges = bitmap.getInsets()
                    print("4 edges.left: \(edges.left)")
                    print("4 edges.right: \(edges.right)")
                    print("4 edges.top: \(edges.top)")
                    print("4 edges.bottom: \(edges.bottom)")
                }
            }
            
            
            //dimp_04.png
            //dimp_03.png
            //dimp_02.png
            
            exit(0)
            */
        }
    }
}
