//
//
//  Created by Hoang Le on 18/12/2021.
//

import Foundation
import Alamofire

protocol HomeViewable: class {
}

class HomePresenter {
    unowned var viewable: HomeViewable
    
    init(viewable: HomeViewable) {
        self.viewable = viewable
    }
}
