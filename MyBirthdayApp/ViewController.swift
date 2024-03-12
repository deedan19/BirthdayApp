//
//  ViewController.swift
//  MyBirthdayApp
//
//  Created by Daniel Dennis on 12/03/2024.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    private(set) var verticalLabelAnchorConstraint: NSLayoutConstraint!
    private(set) var bottomLabelBottomAnchorConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIViews()
        setupUIConstraints()
        performAnimation()
    }
    
    let textLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "🎉 Happy Birthday 🎉 \nDaniel"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.systemBlue
        label.font = UIFont(name: "GillSans-SemiBoldItalic", size: 30)
        return label
    }()
    
    let plusOneLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "+1"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor.systemBlue
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 60)
        return label
    }()
    
    let bottomTextLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enjoy your day!\n♥"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "GillSans-SemiBoldItalic", size: 20)
        return label
    }()
    
    lazy var lottieAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "hooray")
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        return animationView
    }()
    
    private func setupUIViews(){
        view.addSubview(textLabel)
        view.addSubview(lottieAnimationView)
        view.addSubview(bottomTextLabel)
    }
    
    private func setupUIConstraints(){
        textLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        verticalLabelAnchorConstraint = textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        verticalLabelAnchorConstraint.isActive = true
        
        let width = view.frame.size.width - 20
        let height = width
        lottieAnimationView.heightAnchor.constraint(equalToConstant: height).isActive = true
        lottieAnimationView.widthAnchor.constraint(equalToConstant: width).isActive = true
        lottieAnimationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        lottieAnimationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        lottieAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        lottieAnimationView.isHidden = true
        
        bottomTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bottomTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        bottomLabelBottomAnchorConstraint = bottomTextLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 70)
        bottomLabelBottomAnchorConstraint.isActive = true
        bottomTextLabel.isHidden = true
    }
    
    private func performAnimation(){
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {[weak self] in
            self?.animateUIConstraints()
        })
    }
    
    private func animateUIConstraints(){
        let height = (view.frame.size.height/2) - 180
        UIView.animate(withDuration: 1, delay: 0) {[weak self] in
            self?.verticalLabelAnchorConstraint.constant = -height
            self?.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 1, delay: 1) {[weak self] in
            self?.lottieAnimationView.isHidden = false
            self?.view.layoutIfNeeded()
        }
        
        UIView.animate(withDuration: 2, delay: 2) {[weak self] in
            self?.bottomTextLabel.isHidden = false
            self?.bottomLabelBottomAnchorConstraint.constant = -150
            self?.view.layoutIfNeeded()
        }
    }


}

