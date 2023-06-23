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
