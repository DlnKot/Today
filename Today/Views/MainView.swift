//
//  ViewController.swift
//  Today
//
//  Created by Daniil on 15.06.2025.
//

import UIKit

class MainView: UIViewController {

    lazy var cityLabel: UILabel = {
        $0.text = "Саратов"
        $0.font = .systemFont(ofSize: 24, weight: .bold)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var dateLabel: UILabel = {
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var burgerButton: UIButton = {
        $0.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        $0.tintColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setPreferredSymbolConfiguration(.init(pointSize: 24, weight: .regular), forImageIn: .normal)
        return $0
    }(UIButton())
    
    lazy var weatherImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.max.fill")
        imageView.tintColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var tempLabel: UILabel = {
        $0.text = "26°"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 64, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMMM, yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        dateLabel.text = formatter.string(from: Date())
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            burgerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            burgerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            weatherImg.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            weatherImg.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weatherImg.widthAnchor.constraint(equalToConstant: 80),
            weatherImg.heightAnchor.constraint(equalToConstant: 80),
            
            tempLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
            tempLabel.leadingAnchor.constraint(equalTo: weatherImg.trailingAnchor, constant: 20),
        ])
       
    }
    
    
    func setup() {
        view.backgroundColor = .mainBackground
        view.addSubview(cityLabel)
        view.addSubview(burgerButton)
        view.addSubview(dateLabel)
        view.addSubview(weatherImg)
        view.addSubview(tempLabel)
    }
}
