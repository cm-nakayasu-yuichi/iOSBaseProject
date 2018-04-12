//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

protocol ListPresentable: class {
    
}

protocol ListViewable: class {
    
}

class ListPresenter: ListPresentable {
    
    weak var view: ListViewable!
    
    init(view: ListViewable) {
        self.view = view
    }
}
