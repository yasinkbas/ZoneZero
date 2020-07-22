//
//  FormTextFieldItem.swift
//  Mobillium-case
//
//  Created by yasinkbas on 21.07.2020.
//

import UIKit

class FormTextFieldItem: UITextField, FormItem {
    let image: UIImage
    
    init(
        image: UIImage,
        placeholder: String = .none,
        isSecured: Bool = false
    ) {
        self.image = image
        super.init(frame: .zero)
        self.placeholder        = placeholder
        self.isSecureTextEntry  = isSecured
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAppearance() {
        leftViewMode = .always
        
        let customizedImage = image.withRenderingMode(.automatic)
        customizedImage.withTintColor(.darkGray)
        leftView = UIImageView(image: customizedImage)
    }
}

extension FormTextFieldItem {
    var padding: UIEdgeInsets { UIEdgeInsets(top: 0, left: 35, bottom: 0, right: 5) }

      override open func textRect(forBounds bounds: CGRect) -> CGRect {
          return bounds.inset(by: padding)
      }

      override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
          return bounds.inset(by: padding)
      }

      override open func editingRect(forBounds bounds: CGRect) -> CGRect {
          return bounds.inset(by: padding)
      }
}
