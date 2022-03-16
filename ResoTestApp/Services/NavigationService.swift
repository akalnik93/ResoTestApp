import UIKit

enum ViewControllerName {
    
    case home
    case list

}

class NavigationService {
    
    static var shared = NavigationService()
    
    private var viewControllers = [HomeViewController(), ListOfficesViewController()]

    func getViewController(_ name: ViewControllerName) -> UIViewController {
        switch name {
        case .home:
            return viewControllers[0]
        case .list:
            return viewControllers[1]
        }
    }

}
