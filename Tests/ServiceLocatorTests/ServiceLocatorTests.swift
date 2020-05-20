import XCTest
@testable import ServiceLocator

final class ServiceLocatorTests: XCTestCase {
    struct Pump {
        func pump() -> String {
            return "pumping..."
        }
    }

    struct ElectricHeater {
        func heat() -> String {
            return "heating..."
        }
    }
    
    class CoffeeMakerViewModel{
        @Inject var heater: ElectricHeater?
        @Inject var pump: Pump?
        
        func makeCoffee() -> String {
            var result = ""
            result.append(self.heater?.heat() ?? "")
            result.append(self.pump?.pump() ?? "")
            result.append("Making coffee...")
            
            return result
        }
    }
    
    func testInjection() {
        ServiceLocator.shared.addService(ElectricHeater())
        ServiceLocator.shared.addService(Pump())
        let coffeeMaker = CoffeeMakerViewModel()
        let result = coffeeMaker.makeCoffee()
        
        XCTAssertEqual(result, "heating...pumping...Making coffee...", "Must inject 2 component")
    }
}
