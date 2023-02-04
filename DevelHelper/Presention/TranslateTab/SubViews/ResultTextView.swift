//
//  ResultView.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class ResultTextView: UIView {
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18.0, weight: .bold)
        label.textColor = .tintColor
        label.numberOfLines = 0
        label.text = "Hello"
        label.backgroundColor = .gray
        return label
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "star"), for: .normal)
        button.tintColor = UIColor.yellow
        return button
    }()
    
    private lazy var copyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "doc.on.doc"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            bookmarkButton,
            copyButton
        ])
        stackView.spacing = 10.0
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var resultStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            resultLabel,
            buttonStackView
        ])
        stackView.axis = .vertical
        stackView.spacing = 10.0
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 10.0
        self.layer.borderColor = UIColor.blue.cgColor
        setupLayout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ResultTextView {
    func bind() {
        copyButton.rx.tap
            .bind {
                print("copyButton is tapped")
            }
            .dispose()
    }
    
    func setupLayout() {
        [
            resultLabel,
            buttonStackView
        ].forEach { addSubview($0) }
        
        resultLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(resultLabel.snp.bottom).offset(5.0)
            $0.leading.equalTo(resultLabel.snp.leading).offset(5.0)
        }
    }
}
