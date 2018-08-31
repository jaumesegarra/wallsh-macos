//
//  utils.swift
//  wallsh
//
//  Created by Jaume Segarra on 31/8/18.
//  Copyright © 2018 Jaume Segarra. All rights reserved.
//

import Foundation
import AppKit

func getWallpaper() -> Int32{
    var result: Int32 = 1;
    
    let workspace = NSWorkspace.shared
    
    if let screen = NSScreen.main {
        let desktopWallpaper = workspace.desktopImageURL(for: screen);
        
        var path: String? = desktopWallpaper?.absoluteString;
        path?.removeFirst(7);
        
        if(path != nil){
            print(path!)
            result = 0
        }else{
            print("ERROR: Path no found")
        }
    }else{
        print("ERROR: No wallpaper found")
    }
    
    return result
}

func setWallpaper(path: String) -> Int32{
    var result: Int32 = 1;
    
    do {
        let imgurl = NSURL.fileURL(withPath: path)
        
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: imgurl.path) {
            let workspace = NSWorkspace.shared
            if let screen = NSScreen.main {
                try workspace.setDesktopImageURL(imgurl, for: screen, options: [:])
                result = 0;
            }
        }else{
            print("ERROR: Wallpaper doesn't exist")
        }
    } catch {
        print("ERROR: ", error)
    }
    
    return result
}
