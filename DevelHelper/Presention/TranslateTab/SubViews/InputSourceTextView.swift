//
//  InputSourceTextView.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/05.
//

import UIKit
import RxSwift
import RxCocoa

final class InputSourceTextView: UIView {
    let disposeBag = DisposeBag()
    
    private lazy var inputSourceTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 18.0)
        textView.textColor = .label
        textView.textAlignment = .left
        let insetValue = 18.0
        textView.textContainerInset = UIEdgeInsets(
            top: insetValue,
            left: insetValue,
            bottom: insetValue,
            right: insetValue
        )
        return textView
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
extension InputSourceTextView {
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.borderWidth = 2.0
    }
}

// MARK: Configure Layout
private extension InputSourceTextView {
    private func addSubviews() {
        self.addSubview(inputSourceTextView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            inputSourceTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            inputSourceTextView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
