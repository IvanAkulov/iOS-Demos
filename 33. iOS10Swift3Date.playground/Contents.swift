
import UIKit



let calendar = Calendar.current

var dateComponents = DateComponents()
dateComponents.year = 2017
dateComponents.month = 3
dateComponents.day = 1

let date = calendar.date(from: dateComponents)

let dateNow = Date()
let dateComponentsNow = calendar.dateComponents([.year, .month, .weekday, .day], from: dateNow)
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "EEEE"
let weekday = dateFormatter.string(from: dateNow)

let dateNow_ = calendar.date(from: dateComponentsNow)

let timeInterval = dateNow.timeIntervalSince(dateNow_!) / 60 / 60


var dc1 = DateComponents()
dc1.year = 2016
dc1.month = 2
dc1.day = 1
let date1 = calendar.date(from: dc1)

var dc2 = DateComponents()
dc2.year = 2016
dc2.month = 3
dc2.day = 1
let date2 = calendar.date(from: dc2)

let daysInFeb = (date2?.timeIntervalSince(date1!))! / 60 / 60 / 24













