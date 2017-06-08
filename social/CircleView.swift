//
//  CircleView.swift
//  social
//
//  Created by Subhankar Dee Raj on 08/06/17.
//  Copyright © 2017 Subhankar. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
    }

}
