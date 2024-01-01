//
//  CircleView.swift
//  themovies
//
//  Created by Luis Domingues on 20/11/23.
//

import Foundation
import UIKit

class CircleView: UIView {
    private let border = CAShapeLayer()

    private lazy var circularView: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 52, height: 52)
        view.clipsToBounds = true
        view.layer.cornerRadius = view.frame.height / 2
        view.backgroundColor = UIColor(red: 0.08, green: 0.09, blue: 0.11, alpha: 1.00)
        return view
    }()
    
    private lazy var averageScore: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "0.0"
        lbl.textColor = .white
        lbl.textAlignment = .center
        lbl.font = UIFont.Inter(.regular, size: 16)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInit()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) { nil }
    
    private func setupInit() {
        configureCircle()
        addSubview(circularView)
        circularView.addSubview(averageScore)
        
        NSLayoutConstraint.activate([
            circularView.topAnchor.constraint(equalTo: topAnchor),
            circularView.trailingAnchor.constraint(equalTo: trailingAnchor),
            circularView.bottomAnchor.constraint(equalTo: bottomAnchor),
            circularView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            averageScore.centerYAnchor.constraint(equalTo: circularView.centerYAnchor),
            averageScore.centerXAnchor.constraint(equalTo: circularView.centerXAnchor),
        ])
    }
    
    private func configureCircle() {
        let radius = circularView.frame.height / 2
        border.path = UIBezierPath(roundedRect: circularView.bounds, cornerRadius: radius).cgPath

        border.strokeStart = .zero

        border.strokeColor = UIColor(red: 1.00, green: 0.12, blue: 0.54, alpha: 1.00).cgColor
        border.lineWidth = 4
        border.fillColor = UIColor(red: 0.19, green: 0.20, blue: 0.26, alpha: 1.00).cgColor
        circularView.layer.addSublayer(border)
    }
    
    public func configureCircleView(averageScore: Double, color: UIColor) {
        self.averageScore.text = "\(averageScore)"
        border.strokeEnd = averageScore / 10
    }
}
