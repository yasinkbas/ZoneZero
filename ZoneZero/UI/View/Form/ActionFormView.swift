//
//  ActionFormView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

protocol ActionFormViewDelegate: class {
    func actionFormViewDelegate(_ actionFormView: ActionFormView, didTapActionButton actionButton: ZZButton)
}

class ActionFormView: FormView {
    
    weak var delegate: ActionFormViewDelegate?
    
    enum ActionType {
        case `default`
        case go
        
        var colors: [UIColor] {
            content.colors
        }
        
        var symbol: String {
            content.symbol
        }
        
        var actionButton: CircleGradientButton {
            CircleGradientButton(colors: colors, symbol: symbol)
        }
        
        private var content: (colors: [UIColor], symbol: String) {
            switch self {
            case .default:  return ([UIColor(named: "primaryColor-regular")!, UIColor(named: "primaryColor-light")!], "✓")
            case .go:       return ([UIColor(named: "primaryColor-regular")!, UIColor(named: "primaryColor-light")!], "→")
            }
        }
    }
    
    let actionType: ActionType
    
    lazy var actionButton = actionType.actionButton
    
    init(
        actionType: ActionType,
        items: [FormItemView],
        title: ZZLabel
    ) {
        self.actionType = actionType
        super.init(items, title: title)
        actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        addSubview(actionButton)
        actionButton.set(.rightOf(self, 16), .centerYOf(containerView), .width(48), .height(48))
    }
    
    @objc
    private func didTapActionButton(_ sender: ZZButton) {
        delegate?.actionFormViewDelegate(self, didTapActionButton: sender)
    }
    
}
