import Foundation
import UIKit

public class WeatherClient {
    
    public init(){}
    
    public func getRequest() -> StateResult {
        print("-D: getRequest at WeatherClient")
//        sleep(10)
        return StateResult(date: Date.now, charts: [
            (x: 0, y: 13),
            (x: 1, y: 14),
            (x: 2, y: 15),
            (x: 3, y: 15),
            (x: 4, y: 17),
            (x: 5, y: 17),
            (x: 6, y: 18),
            (x: 7, y: 20),
            (x: 8, y: 21),
            (x: 9, y: 24),
            (x: 10, y: 27),
            (x: 11, y: 28),
            (x: 12, y: 29),
            (x: 13, y: 28),
            (x: 14, y: 27),
            (x: 15, y: 28),
            (x: 16, y: 25),
            (x: 17, y: 22),
            (x: 18, y: 22),
            (x: 19, y: 20),
            (x: 20, y: 17),
            (x: 21, y: 15),
            (x: 22, y: 14),
            (x: 23, y: 14),
        ])
    }
    
    public func getImage() -> UIImage? {
        return UIImage(named: "moonImage")
    }
}
