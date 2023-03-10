//
//  SourceTextView.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit

final class SourceTextView: UIView {
    let sourceTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = .systemFont(ofSize: 20.0)
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
extension SourceTextView {
    private func configureView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1.0
    }
}

// MARK: Configure Layout
extension SourceTextView {
    private func addSubviews() {
        addSubview(sourceTextView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            sourceTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sourceTextView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
