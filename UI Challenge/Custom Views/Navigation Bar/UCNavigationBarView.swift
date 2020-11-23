//
//  UCNavigationBar.swift
//  UI Challenge
//
//  Created by Hansa Anuradha on 2020-11-23.
//

import UIKit

class UCNavigationBarView: UIView {
    
    //MARK: Properties
    var title: String?
    var masterView: UCNavigationBarView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    convenience init(frame: CGRect,
                     title: String?) {
        
        self.init(frame: frame)
        let view = Bundle.main.loadNibNamed("UCNavigationBarView", owner: self, options: nil)?.first as! UCNavigationBarView
        view.frame = frame
//        view.titleLabel.text = title
//        view.delegate = delegate
        masterView = view
        self.addSubview(view)
    }
}
