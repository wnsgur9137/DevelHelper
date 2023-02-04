//
//  TranslateViewController.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit
import SnapKit

final class TranslateViewController: UIViewController {
    
    private var sourceLanguage: Language = .ko
    
    private lazy var rightBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .bookmarks,
            target: self,
            action: nil
        )
        return button
    }()
    
    private var buttonStackView = LanguageButtonView()
    private var resultTextView = ResultTextView()
    private var sourceTextView = SourceTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Translate".localized()
        self.navigationItem.rightBarButtonItem = self.rightBarButton
        self.setupLayout()
    }
}

private extension TranslateViewController {
    func setupLayout() {
        [
            buttonStackView,
            resultTextView,
            sourceTextView
        ].forEach { view.addSubview($0) }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(defaultSpacing)
            $0.leading.equalToSuperview().offset(defaultSpacing)
            $0.trailing.equalToSuperview().offset(-defaultSpacing)
            $0.centerX.equalToSuperview()
        }
        
        resultTextView.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(defaultSpacing)
            $0.leading.equalTo(buttonStackView)
            $0.trailing.equalTo(buttonStackView)
            $0.centerX.equalToSuperview()
        }
        
        sourceTextView.snp.makeConstraints {
            $0.top.equalTo(resultTextView.snp.bottom).offset(defaultSpacing)
            $0.leading.equalTo(buttonStackView)
            $0.trailing.equalTo(buttonStackView)
            $0.centerX.equalToSuperview()
        }
    }
}
