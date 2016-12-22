//
//  ARExtensions.swift
//  ArmiesSwift
//
//  Created by Ramiro Ramirez on 04/10/15.
//  Copyright (c) 2015 RAM. All rights reserved.
//

import Foundation

extension UIColor {

	class func defaultColor() -> UIColor {
		return UIColor(red: 0/255.0, green: 58/255.0, blue: 80/255.0, alpha: 1.0)
	}
}

extension UIDevice {
    
    // MARK: - Get current device
    class func getPlatform() -> String? {
    
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return UIDevice.platformType(String(cString: machine))
    }
    
    class func platformType(_ platform: String?) -> String? {
        if (platform == "iPhone1,1") {  return "iPhone 1G"              }
        if (platform == "iPhone1,2") {  return "iPhone 3G"              }
        if (platform == "iPhone2,1") {  return "iPhone 3GS"             }
        if (platform == "iPhone3,1") {  return "iPhone 4"               }
        if (platform == "iPhone3,3") {  return "Verizon iPhone 4"       }
        if (platform == "iPhone4,1") {  return "iPhone 4S"              }
        if (platform == "iPhone5,1") {  return "iPhone 5 (GSM)"         }
        if (platform == "iPhone5,2") {  return "iPhone 5 (GSM+CDMA)"    }
        if (platform == "iPhone5,3") {  return "iPhone 5c (GSM)"        }
        if (platform == "iPhone5,4") {  return "iPhone 5c (GSM+CDMA)"   }
        if (platform == "iPhone6,1") {  return "iPhone 5s (GSM)"        }
        if (platform == "iPhone6,2") {  return "iPhone 5s (GSM+CDMA)"   }
        if (platform == "iPhone7,2") {  return "iPhone 6"               }
        if (platform == "iPhone7,1") {  return "iPhone 6 Plus"          }
        if (platform == "iPhone8,1") {  return "iPhone 6s"              }
        if (platform == "iPhone8,2") {  return "iPhone 6s Plus"         }
        if (platform == "iPod1,1")   {  return "iPod Touch 1G"          }
        if (platform == "iPod2,1")   {  return "iPod Touch 2G"          }
        if (platform == "iPod3,1")   { return "iPod Touch 3G"           }
        if (platform == "iPod4,1")   { return "iPod Touch 4G"           }
        if (platform == "iPod5,1")   {  return "iPod Touch 5G"          }
        if (platform == "iPad1,1")   {   return "iPad"                  }
        if (platform == "iPad2,1")   {  return "iPad 2 (WiFi)"          }
        if (platform == "iPad2,2")   {  return "iPad 2 (GSM)"           }
        if (platform == "iPad2,3")   {  return "iPad 2 (CDMA)"          }
        if (platform == "iPad2,4")   {  return "iPad 2 (WiFi)"          }
        if (platform == "iPad2,5")   {  return "iPad Mini (WiFi)"       }
        if (platform == "iPad2,6")   {  return "iPad Mini (GSM)"        }
        if (platform == "iPad2,7")   {  return "iPad Mini (GSM+CDMA)"   }
        if (platform == "iPad3,1")   {   return "iPad 3 (WiFi)"         }
        if (platform == "iPad3,2")   {   return "iPad 3 (GSM+CDMA)"     }
        if (platform == "iPad3,3")   {   return "iPad 3 (GSM)"          }
        if (platform == "iPad3,4")   {  return "iPad 4 (WiFi)"          }
        if (platform == "iPad3,5")   { return "iPad 4 (GSM)"            }
        if (platform == "iPad3,6")   {return "iPad 4 (GSM+CDMA)"        }
        if (platform == "iPad4,1")   {  return "iPad Air (WiFi)"        }
        if (platform == "iPad4,2")   {  return "iPad Air (Cellular)"    }
        if (platform == "iPad4,3")   {  return "iPad Air"               }
        if (platform == "iPad4,4")   {  return "iPad Mini 2G (WiFi)"    }
        if (platform == "iPad4,5")   {  return "iPad Mini 2G (Cellular)"}
        if (platform == "iPad4,6")   { return "iPad Mini 2G"            }
        if (platform == "iPad4,7")   { return "iPad Mini 3 (WiFi)"      }
        if (platform == "iPad4,8")   {  return "iPad Mini 3 (Cellular)" }
        if (platform == "iPad4,9")   {  return "iPad Mini 3 (China)"    }
        if (platform == "iPad5,3")   {  return "iPad Air 2 (WiFi)"      }
        if (platform == "iPad5,4")   {  return "iPad Air 2 (Cellular)"  }
        if (platform == "AppleTV2,1"){  return "Apple TV 2G"            }
        if (platform == "AppleTV3,1"){  return "Apple TV 3"             }
        if (platform == "AppleTV3,2"){  return "Apple TV 3 (2013)"      }
        if (platform == "i386")      {  return "Simulator"              }
        if (platform == "x86_64")    {  return "Simulator"              }
        return platform;
    }
    
    class func isBigDevice() -> Bool? {
        if let platform = UIDevice.getPlatform() {
            return (platform.contains("iPhone 6") || platform.contains("Simulator") || platform.contains("iPad"))
        }
        return false
    }

}
