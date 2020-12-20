import Foundation
import RxSwift

protocol RestauarantsListViewModelType {
    func getRestaurents()
}

final class RestauarantsListViewModel {
    
    private let service: RestaurantServiceType
    
    init(service: RestaurantServiceType = RestaurantService()) {
        self.service = service
    }
    
    let title = "Restaurants" // MARK: - Use a loclalized version
    
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        service.fetchRestaurants() //when suscibed it will send a stream of restaurants
            .map { $0.map { RestaurantViewModel(restaurant: $0) }
            }
    }
}
