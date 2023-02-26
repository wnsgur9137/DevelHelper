//
//  TranslateViewController.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit
import RxSwift
import RxCocoa

final class TranslateViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private var sourceLanguage: Language = .ko
    
    private let rightBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            barButtonSystemItem: .bookmarks,
            target: self,
            action: nil
        )
        return button
    }()
    
    private let buttonStackView = LanguageButtonView()
    private let resultTextView = ResultTextView()
    private let sourceTextView = SourceTextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubviews()
        self.setupConstraints()
        self.configureView()
        self.bindAll()
    }
}

// MARK: Configure
extension TranslateViewController {
    private func configureView() {
        self.title = "Translate".localized()
        self.navigationItem.rightBarButtonItem = self.rightBarButton
    }
}

// MARK: Binding
extension TranslateViewController {
    private func bindAll() {
        self.bindButtonStackView()
        self.bindResultTextView()
        self.bindSourceTextView()
    }
    
    private func bindButtonStackView() {
        buttonStackView.changeLanguageButton.rx.tap
            .bind {
                print("changeLanguageButton is tapped")
            }
            .disposed(by: disposeBag)
    }
    
    private func bindResultTextView() {
        resultTextView.bookmarkButton.rx.tap
            .bind {
                print("bookmarkButton is tapped")
            }
            .disposed(by: disposeBag)
        
        resultTextView.copyButton.rx.tap
            .bind {
                print("copyButton is tapped")
            }
            .disposed(by: disposeBag)
    }
    
    private func bindSourceTextView() {
        sourceTextView.sourceTextView.rx.text.orEmpty
            .bind { [weak self] text in
                print("text: \(text)")
                if text == "" {
                    print("text is empty")
                    self?.sourceTextView.sourceTextView.text = "입력해 주십시오."
                    print(self?.sourceTextView.sourceTextView.text)
                }
            }
            .disposed(by: disposeBag)
        
        sourceTextView.sourceTextView.rx.didBeginEditing
            .bind {
                print("sourceTextView is didBeginEditing")
                let inputSourceTextView = InputSourceTextView()
            }
            .disposed(by: disposeBag)
    }
}
    

// MARK: Configure Layout
extension TranslateViewController {
    private func addSubviews() {
        [
            buttonStackView,
            resultTextView,
            sourceTextView
        ].forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: defaultSpacing),
            buttonStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            resultTextView.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            resultTextView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: defaultSpacing),
            resultTextView.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            resultTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            sourceTextView.leadingAnchor.constraint(equalTo: buttonStackView.leadingAnchor),
            sourceTextView.topAnchor.constraint(equalTo: resultTextView.bottomAnchor, constant: defaultSpacing),
            sourceTextView.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor),
            sourceTextView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -defaultSpacing),
            sourceTextView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
}
