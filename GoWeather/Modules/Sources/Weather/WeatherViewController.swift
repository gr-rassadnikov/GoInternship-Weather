import Foundation
import UIKit
import DGCharts
import DomainModels
import WeatherClient
import DesignConstants
import CustomElements

public class WeatherViewController: UIViewController, ChartViewDelegate {
    
    private let client = WeatherClient()
    private var state: State?
    
    private lazy var lineChartView: LineChartView = {
       let chartView = LineChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        
        chartView.rightAxis.enabled = false
        chartView.leftAxis.labelFont = .boldSystemFont(ofSize: 10)
        chartView.leftAxis.setLabelCount(6, force: false)
        chartView.leftAxis.labelPosition = .outsideChart
        chartView.leftAxis.axisLineColor = DesignConstants.Color.axisCharts
        chartView.leftAxis.labelTextColor = DesignConstants.Color.axisCharts
        
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.labelFont = .boldSystemFont(ofSize: 10)
        chartView.xAxis.setLabelCount(6, force: false)
        chartView.xAxis.axisLineColor = DesignConstants.Color.axisCharts
        chartView.xAxis.labelTextColor = DesignConstants.Color.axisCharts
        
        chartView.animate(xAxisDuration: 2.5)
        
        return chartView
    }()
    
    private lazy var updateButton = CustomElements.Buttons.update
    private lazy var dateLabel = CustomElements.Labels.date
    private lazy var tempLabel = CustomElements.Labels.temp
    private lazy var iconImageView = CustomElements.Images.icon
    
    public override func loadView() {
        super.loadView()
        
        state = State(from: client.getRequest())
        configureIconImageView()
    }
    
   public override func viewDidLoad() {
        super.viewDidLoad()

       addSubviews()
       addConstraints()
       
       configureView()
       configureDateLabel()
       configureLineChartView()
       configureUpdateButton()
    }
    
    private func addSubviews(){
        view.addSubview(tempLabel)
        view.addSubview(dateLabel)
        view.addSubview(iconImageView)
        view.addSubview(lineChartView)
        view.addSubview(updateButton)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            
            tempLabel.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -4),
            tempLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            tempLabel.heightAnchor.constraint(equalToConstant: 55),
            tempLabel.widthAnchor.constraint(equalToConstant: 55),
            
            iconImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 4),
            iconImageView.centerYAnchor.constraint(equalTo: tempLabel.centerYAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 45),
            iconImageView.widthAnchor.constraint(equalToConstant: 45),
            
            
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 160),
            dateLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalToConstant: 15),
            
            lineChartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            lineChartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            lineChartView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 50),
            lineChartView.heightAnchor.constraint(equalToConstant: view.frame.width - 24),
            
            updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            updateButton.heightAnchor.constraint(equalToConstant: 50),
            updateButton.topAnchor.constraint(equalTo: lineChartView.bottomAnchor, constant: 70),
            ])
    }
    
    private func configureView() {
        view.backgroundColor = DesignConstants.Color.backgroundColor
    }
    
    private func configureDateLabel() {
        dateLabel.text = dateToString(date: state?.date)
    }
    
    private func dateToString(date: Date?) -> String{
        guard let date = date else{ return ""}
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss, dd.MM.yyyy"
        
        let myString = formatter.string(from: date)
    
        print("-D: date = \(myString)")
        return myString
        
    }
    
    private func configureIconImageView() {
        iconImageView.image = client.getImage()
    }
    
    private func configureUpdateButton() {
        updateButton.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
    }
    
    @objc private func didTapUpdateButton() {
        state = State(from: client.getRequest())
        configureDateLabel()
        configureLineChartView()
    }
    
    private func configureLineChartView() {
        let lineChartDataSet = LineChartDataSet(entries: state!.charts, label: "Температура")
        lineChartDataSet.drawCirclesEnabled = false
//        lineChartDataSet.valueFont = .boldSystemFont(ofSize: 20)
        lineChartDataSet.lineWidth = 3
        lineChartDataSet.setColor(DesignConstants.Color.yellow ?? .yellow)
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartData.setDrawValues(false)
        
        lineChartView.data = lineChartData
    }
    
    public func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry)
    }
    
}
