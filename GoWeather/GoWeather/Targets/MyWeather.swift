import Foundation
import Weather
import UIKit

final class MyWeather {
    let weatherVC = WeatherViewController()
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        window.rootViewController = weatherVC
        window.makeKeyAndVisible()
//        startFirstVC()
    }

//    private func startFirstVC() {
//        tabBarCoordinator = TabBarCoordinator(tabBarController)
//        tabBarCoordinator?.start()
//    }
}
