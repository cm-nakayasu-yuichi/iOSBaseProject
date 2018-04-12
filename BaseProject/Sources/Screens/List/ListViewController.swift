//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

class ListViewController: UIViewController {
    
    var presenter: ListPresentable!
    
    class func create(presenter: ListPresentable? = nil) -> UIViewController {
        let vc = instantiate(self)
        vc.presenter = (presenter != nil) ? presenter! : ListPresenter(view: vc)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListViewController: ListViewable {
    
}
