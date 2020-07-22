//
//  FormView.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class FormView: UIView {
    
    typealias FormItemView = FormItem & UIView
    
    var layout = Layout.shared

    var titleLabel: MCLabel
    var items: [FormItemView]
    
    lazy var containerView = UIView().then { view in
        view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.804309677)
        view.layer.cornerRadius = 20
    }
    
    init(
        _ items: [FormItemView],
        title: MCLabel
    ) {
        self.items = items
        self.titleLabel = title
        super.init(frame: .zero)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAppearance() {
        addSubview(titleLabel)
        titleLabel.set(.top(self.top, 8), .centerXOf(self), .widthOf(self))
        
        addSubview(containerView)
        containerView.set(.top(titleLabel.bottom, 40), .leading(self.leading), .trailing(self.trailing), .bottom(self.bottom))
        
        items.enumerated().forEach { index, item in
            let topInset = CGFloat(40 + index * 50)
            
            containerView.addSubview(item)
            item.set(.top(containerView.top, topInset), .leading(containerView.leading, 16), .trailing(containerView.trailing, 16))
        }
    }
    
    func suggestedSize(_ super: UIView) -> CGSize {
        let bounds = `super`.bounds
        let itemsInsets = layout.eachItem_topInset * CGFloat(items.count)
        let width: CGFloat  = bounds.width - 60
        let height: CGFloat =
            layout.titleLabel_topInset      +
            titleLabel.requiredHeight       +
            layout.containerView_topInset   +
            itemsInsets                     +
            layout.containerView_topInset
        
        return CGSize(width: width, height: height)
    }
    
    func getItem(with id: String) -> FormItemView? {
        let optionalIndex = items.firstIndex { $0.id == id }
        guard let index = optionalIndex else { return nil }
        return items[index]
    }
    
    func getTextFieldText(with id: String) -> String? {
        if let item = getItem(with: id), let textField = item as? UITextField {
            return textField.text
        }
        
        return nil
    }
}

extension FormView {
    struct Layout {
        static var shared = Layout()
        
        let titleLabel_topInset: CGFloat    = 8
        let containerView_topInset: CGFloat = 40
        let eachItem_topInset: CGFloat      = 50
        let item_leadingInset: CGFloat      = 16
        let item_trailingInset: CGFloat     = 16
    }
}


