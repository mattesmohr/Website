import Foundation

/// A temporarily shim til the formatter is supported on linux
class RelativeDateTimeFormatter {
 
    var unitsStyle: UnitsStyle = .short
    
    enum UnitsStyle: Int {

        case full = 0
        case spellOut = 1
        case short = 2
        case abbreviated = 3
    }
    
    public func localizedString(for date: Date, relativeTo referenceDate: Date) -> String {
        
        let delta = Calendar.current.dateComponents([.second,.minute,.hour,.day,.weekOfYear,.month,.year], from: date, to: referenceDate)
        
        func evaluate(year: Int?) -> String {
            
            if let year = year {
                
                if year == 0 {
                    return evaluate(month: delta.month)
                }
                
                if year >= 1 {
                    return "\(year) years ago"
                }
                
                return "A year ago"
            }
            
            return evaluate(month: delta.month)
        }
        
        func evaluate(month: Int?) -> String {
         
            if let month = month {
                
                if month == 0 {
                    return evaluate(day: delta.day)
                }
                
                if month >= 1 {
                    return "\(month) months ago"
                }
                
                return "A month ago"
            }
            
            return evaluate(day: delta.day)
        }
        
        func evaluate(day: Int?) -> String {
         
            if let day = day {
                
                if day == 0 {
                    return evaluate(hour: delta.hour)
                }
                
                if day >= 1 {
                    return "\(day) days ago"
                }
                
                return "A day ago"
            }
            
            return evaluate(hour: delta.hour)
        }
        
        func evaluate(hour: Int?) -> String {
            
            if let hour = hour {
                
                if hour == 0 {
                    return "A moment ago"
                }
                
                if hour >= 1 {
                    return "\(hour) hours ago"
                }
                
                return "A hour ago"
            }
            
            return "A moment ago"
        }
        
        return evaluate(year: delta.year)
    }
}
