import Foundation
import UIKit

public struct CustomElements {
    
    public struct Buttons {
        public static let update: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle("Обновить", for: .normal)
            button.setTitleColor(UIColor(named: "updateTextColor"), for: .normal)
            button.backgroundColor = UIColor(named: "yellowColor")
            button.layer.cornerRadius = 20
            button.layer.masksToBounds = false
            button.layer.shadowColor = UIColor(named: "grayMediumColor")?.cgColor
            button.layer.shadowOpacity = 0.8
            button.layer.shadowRadius = 8
            return button
        }()
    }
    
    public struct Labels {
        
        public static let date: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
            label.textColor = UIColor(named: "currentDateColor")
            return label
        }()
        
        public static let temp: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont(name: "HelveticaNeue-Bold", size: 28)
            label.textColor = UIColor(named: "currentTempColor")
            return label
        }()
    }
    
    public struct Images {
        public static let icon: UIImageView = {
            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
    }
}
