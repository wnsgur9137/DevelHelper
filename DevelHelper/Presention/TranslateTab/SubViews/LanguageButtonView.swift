//
//  LanguageButtonView.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class LanguageButtonView: UIView {
    
    let disposeBag = DisposeBag()
    
    private lazy var sourceLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Korean".localized(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private lazy var targetLanguageButton: UIButton = {
        let button = UIButton()
        button.setTitle("English".localized(), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .bold)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private lazy var changeLanguageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left.arrow.right"), for: .normal)
        button.tintColor = .label
        return button
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.sourceLanguageButton,
            self.changeLanguageButton,
            self.targetLanguageButton
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        bind()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension LanguageButtonView {
    func bind() {
        changeLanguageButton.rx.tap
            .bind {
                print("changeLanguageButton is tapped")
            }
            .disposed(by: disposeBag)
    }
    
    func setupLayout() {
        [
            buttonStackView
        ].forEach { addSubview($0) }
        
        buttonStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

//        buttonStackView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(defaultSpacing)
//            $0.leading.equalToSuperview().offset(defaultSpacing)
//            $0.trailing.equalToSuperview().offset(-defaultSpacing)
//            $0.centerX.equalToSuperview()
//        }
    }
}
