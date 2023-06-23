import CustomElements
import DesignConstants
import DGCharts
import DomainModels
import Foundation
import UIKit
import WeatherClient

public class WeatherViewController: UIViewController, ChartViewDelegate {
    private let client = WeatherClient()
    private var weatherInfo: WeatherInfo?

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

        return chartView
    }()

    private lazy var updateButton = CustomElements.Buttons.update
    private lazy var dateLabel = CustomElements.Labels.date
    private lazy var tempLabel = CustomElements.Labels.temp
    private lazy var iconImageView = CustomElements.Images.icon

    override public func loadView() {
        super.loadView()

        weatherInfo = WeatherInfo(from: client.getWeatherInfo())
        configureIconImageView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        addConstraints()

        configureView()
        configureDateLabel()
        configureTempLabel()
        configureLineChartView()
        configureUpdateButton()
    }

    private func addSubviews() {
        view.addSubview(tempLabel)
        view.addSubview(dateLabel)
        view.addSubview(iconImageView)
        view.addSubview(lineChartView)
        view.addSubview(updateButton)
    }

    private func addConstraints() {
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
        view.backgroundColor = DesignConstants.Color.background
    }

    private func configureTempLabel() {
        guard let weatherInfo = weatherInfo else { return }
        let currentTemp = weatherInfo.currentTemp
        tempLabel.text = "\(currentTemp > 0 ? "+" : "")\(currentTemp)"
    }

    private func configureDateLabel() {
        dateLabel.text = dateToString(date: weatherInfo?.date)
    }

    private func dateToString(date: Date?) -> String {
        guard let date = date else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss, dd.MM.yyyy"
        return formatter.string(from: date)
    }

    private func configureIconImageView() {
        iconImageView.image = client.getIconImage()
    }

    private func configureUpdateButton() {
        updateButton.addTarget(self, action: #selector(didTapUpdateButton), for: .touchUpInside)
    }

    @objc private func didTapUpdateButton() {
        weatherInfo = WeatherInfo(from: client.getWeatherInfo())
        configureDateLabel()
        configureTempLabel()
        configureLineChartView()
    }

    private func configureLineChartView() {
        let lineChartDataSet = LineChartDataSet(entries: weatherInfo!.charts, label: "Температура")
        lineChartDataSet.drawCirclesEnabled = false
        lineChartDataSet.lineWidth = 3
        lineChartDataSet.setColor(DesignConstants.Color.lineChart)

        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        lineChartData.setDrawValues(false)
        lineChartView.data = lineChartData
        lineChartView.animate(xAxisDuration: 1.8)
    }
}
