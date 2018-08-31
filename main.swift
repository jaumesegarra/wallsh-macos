//
//  main.swift
//  wallsh
//
//  Created by Jaume Segarra on 31/8/18.
//  Copyright © 2018 Jaume Segarra. All rights reserved.
//

import Foundation
import AppKit

var arguments = CommandLine.arguments
arguments.removeFirst(1)

func help() {
    let message: String =
        "\n wallsh (v0.1): get and set the desktop wallpaper of the current workspace." +
            "\n\n Usage:\twallsh [options]" +
            "\n\n Options:" +
            "\n -h, --help\t\t\tprint help" +
            "\n -g      \t\t\tget the current wallpaper" +
            "\n -s [path]\t\t\tset a wallpaper" +
    "\n\n Created by Jaume Segarra"
    
    print(message)
}

if(arguments.count > 0){
    switch arguments[0]{
    case "--help", "-h":
        help()
    case "-s":
        if(arguments.count == 2){
            exit(setWallpaper(path: arguments[1]))
        }else{
            print("No wallpaper path introduced...")
            exit(1)
        }
    case "-g":
        exit(getWallpaper())
    default:
        help()
    }
}else { help() }
