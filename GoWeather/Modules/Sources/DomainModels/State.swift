
import Foundation
import DGCharts
import WeatherClient

public struct State {
    public private (set) var date: Date
    public private (set) var charts: [ChartDataEntry]
    
    public init(date: Date, charts: [ChartDataEntry]) {
        self.date = date
        self.charts = charts
    }
    
    public init(from: StateResult) {
        self.date = from.date
        self.charts = from.charts.map {ChartDataEntry(x: $0.x, y: $0.y)}
    }
}
