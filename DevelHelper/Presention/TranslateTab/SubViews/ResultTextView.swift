//
//  ResultView.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit

final class ResultTextView: UIView {
    
    private let resultTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 18.0, weight: .bold)
        textView.textColor = .tintColor
        textView.textContainerInset = UIEdgeInsets(
            top: 18.0,
            left: 18.0,
            bottom: 18.0,
            right: 18.0
        )
        textView.text = "HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello"
        textView.backgroundColor = .gray
        textView.isEditable = false
        return textView
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = UIColor.yellow
        return button
    }()
    
    let copyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            bookmarkButton,
            copyButton,
            UIView()
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10.0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 5.0
        stackView.layer.borderColor = UIColor.red.cgColor
        return stackView
    }()
    
    private lazy var resultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            resultTextView,
            buttonStackView
        ])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.setConstraints()
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configure
extension ResultTextView {
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

// MARK: Configure Layout
extension ResultTextView {
    private func addSubviews() {
        addSubview(resultStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            resultTextView.heightAnchor.constraint(equalToConstant: 250.0),
        ])
        
        NSLayoutConstraint.activate([
            resultStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            resultStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
