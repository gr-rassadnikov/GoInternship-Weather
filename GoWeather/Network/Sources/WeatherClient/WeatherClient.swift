import Foundation
import UIKit

public class WeatherClient {
    public init() {}

    public func getWeatherInfo() -> StateResult {
        var charts = [(x: Double, y: Double)](repeating: (x: 0, y: 0), count: 24)
        for ind in 0 ..< 24 {
            charts[ind] = (x: Double(ind), y: Double(getRandomByHour(hour: ind)))
        }
        return StateResult(date: Date.now, charts: charts)
//            (x: 0, y: 13),
//            (x: 1, y: 14),
//            (x: 2, y: 15),
//            (x: 3, y: 15),
//            (x: 4, y: 17),
//            (x: 5, y: 17),
//            (x: 6, y: 18),
//            (x: 7, y: 20),
//            (x: 8, y: 21),
//            (x: 9, y: 24),
//            (x: 10, y: 27),
//            (x: 11, y: 28),
//            (x: 12, y: 29),
//            (x: 13, y: 28),
//            (x: 14, y: 27),
//            (x: 15, y: 28),
//            (x: 16, y: 25),
//            (x: 17, y: 22),
//            (x: 18, y: 22),
//            (x: 19, y: 20),
//            (x: 20, y: 17),
//            (x: 21, y: 15),
//            (x: 22, y: 14),
//            (x: 23, y: 14),
//        ])
    }

    public func getIconImage() -> UIImage? {
        return UIImage(named: "moonImage")
    }

    private func getRandomByHour(hour: Int) -> Int {
        switch hour {
        case 0 ..< 4:
            return Int.random(in: 15 ..< 18)
        case 4 ..< 8:
            return Int.random(in: 17 ..< 20)
        case 8 ..< 12:
            return Int.random(in: 19 ..< 22)
        case 12 ..< 14:
            return Int.random(in: 22 ..< 25)
        case 14 ..< 16:
            return Int.random(in: 24 ..< 28)
        case 16 ..< 20:
            return Int.random(in: 20 ..< 24)
        case 20 ..< 24:
            return Int.random(in: 16 ..< 19)
        default:
            return Int.random(in: 18 ..< 24)
        }
    }
}
