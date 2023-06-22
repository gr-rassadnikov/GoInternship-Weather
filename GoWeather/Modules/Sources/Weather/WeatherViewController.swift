import Foundation
import UIKit
import DGCharts
import DomainModels
import WeatherClient
import DesignConstants

public class WeatherViewController: UIViewController, ChartViewDelegate {
    
    private var state: State?
    
    private lazy var lineChartView: LineChartView = {
       let chartView = LineChartView()
        chartView.backgroundColor = .blue
        chartView.translatesAutoresizingMaskIntoConstraints = false
        return chartView
    }()
    
    
    public override func loadView() {
        super.loadView()
        
        let client = WeatherClient()
        state = State(from: client.getRequest())
    }
    
   public override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = DesignConstants.Color.backgroundColor
        
        view.addSubview(lineChartView)
        NSLayoutConstraint.activate([
            lineChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            lineChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            lineChartView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            lineChartView.heightAnchor.constraint(equalToConstant: 300),
            
            ])
       
       lineChartView.data = LineChartData(dataSet: LineChartDataSet(entries: state!.charts, label: "LABEL"))
        
        
    }
    
    public func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
}
