//
//  LanguageButtonView.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit

final class LanguageButtonView: UIView {
    
    let sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Korean".localized(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    let targetLanguageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("English".localized(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    let changeLanguageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left.arrow.right"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.sourceLanguageButton,
            self.changeLanguageButton,
            self.targetLanguageButton
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
        self.addSubviews()
        self.setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure
extension LanguageButtonView {
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: Configure Layout
extension LanguageButtonView {
    private func addSubviews() {
        self.addSubview(buttonStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonStackView.topAnchor.constraint(equalTo: self.topAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
