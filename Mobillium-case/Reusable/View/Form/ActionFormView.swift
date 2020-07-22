//
//  ActionFormView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class ActionFormView: FormView {
    
    enum ActionType {
        case `default`
        case go
        
        var colors: [UIColor] {
            content.colors
        }
        
        var symbol: String {
            content.symbol
        }
        
        var actionButton: OvalGradientActionButton {
            OvalGradientActionButton(colors: colors, symbol: symbol)
        }
        
        private var content: (colors: [UIColor], symbol: String) {
            switch self {
            case .default:  return ([UIColor(named: "primaryFormColor-regular")!, UIColor(named: "primaryFormColor-light")!], "✓")
            case .go:       return ([UIColor(named: "primaryFormColor-regular")!, UIColor(named: "primaryFormColor-light")!], "→")
            }
        }
    }
    
    let actionType: ActionType
    
    lazy var actionButton = actionType.actionButton
    
    init(
        actionType: ActionType,
        items: [FormItemView],
        title: MCLabel
    ) {
        self.actionType = actionType
        super.init(items, title: title)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        addSubview(actionButton)
        actionButton.set(.rightOf(self, 16), .centerYOf(containerView), .width(48), .height(48))
    }
    
}
