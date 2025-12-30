//
//  Int+String+Double+Ex.swift
//  MoviesHub
//
//  Created by MacBook Pro on 18/12/2025.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone.current
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        return date
    }
    
    
    var double:Double{
        return Double(self) ?? 0.0
    }
    
    var int:Int{
        return Int(self) ?? 0
    }
}

extension Int{
    var double:Double{
        return Double(self) ?? 0.0
    }
    
    var string:String{
        return String(self) ?? ""
    }
}

extension Double{
    var int:Int{
        return Int(self) ?? 0
    }
    
    var string:String{
        return String(self) ?? ""
    }
}
