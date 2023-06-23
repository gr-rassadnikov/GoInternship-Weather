import Foundation
import DGCharts
import WeatherClient

public struct WeatherInfo {
    public private (set) var date: Date
    public private (set) var charts: [ChartDataEntry]
    public private (set) var currentTemp: Int
    
    public init(from: StateResult) {
        self.date = from.date
        self.charts = from.charts.map {ChartDataEntry(x: $0.x, y: $0.y)}
        
        Constants.formatter.dateFormat = "HH"
        
        let currentHour = Int(Constants.formatter.string(from: date)) ?? 0
        self.currentTemp = Int(from.charts[currentHour].y)
    }
    
    private struct Constants {
        static let formatter = DateFormatter()
    }
}
