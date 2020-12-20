import Foundation
import RxSwift

protocol RestaurantServiceType {
    func fetchRestaurants() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantServiceType {
    
    func fetchRestaurants() -> Observable<[Restaurant]> {
        return Observable.create { (observer) -> Disposable in // MARK: - Create an observable
            
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create()
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let restuarants = try decoder.decode([Restaurant].self, from: data)
                
                observer.onNext(restuarants)
            } catch {
                observer.onError(error)
            }
            return Disposables.create() // MARK: - Creates an Observable Disposable, create is an operator making something Observable
        }
    }
    
}
