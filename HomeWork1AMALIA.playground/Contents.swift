import Foundation
class Car {
    let brand: String
    let model: String
    let year: Int

    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    func printInfo(){
        print("Марка машины: \(brand)\n модель: \(model)\n год выпуска: \(year)")
    }
}

class CarAll: Car {
    let enginePower: Int
    let fuel: Double
    let color: String

    init(brand: String, model: String, year: Int, enginePower: Int, fuel: Double, color: String) {
        self.enginePower = enginePower
        self.fuel = fuel
        self.color = color
        super.init(brand: brand, model: model, year: year)
    }
}

class Matiz: CarAll {
    override func printInfo(){
        super.printInfo()
        print("У матизика мощность двигателя: \(enginePower),\n расход топлива: \(fuel)\n и цвет: \(color)")
    }
}


class BMW: CarAll {
    override func printInfo(){
        super.printInfo()
        print("У BMW мощность двигателя: \(enginePower),\n расход топлива: \(fuel)\n и цвет: \(color)")
    }
}

class Mercedes: CarAll {
    override func printInfo(){
        super.printInfo()
        print("У Mercedes мощность двигателя: \(enginePower),\n расход топлива: \(fuel)\n и цвет: \(color)")
    }
}

class Toyota: CarAll {
    override func printInfo(){
        super.printInfo()
        print("У Tayota мощность двигателя: \(enginePower),\n расход топлива: \(fuel)\n и цвет: \(color)")
    }
}

struct carGarage {
    var cars: [Car] = []
    mutating func addCar(brand: String, model: String, year: Int, enginePower: Int, fuel: Double, color: String, type: String) {
        switch type {
        case "Matiz":
            cars.append(Matiz(brand: brand, model: model, year: year, enginePower: enginePower, fuel: fuel, color: color))
        case "BMW":
            cars.append(BMW(brand: brand, model: model, year: year, enginePower: enginePower, fuel: fuel, color: color))
        case "Mercedes":
            cars.append(Mercedes(brand: brand, model: model, year: year, enginePower: enginePower, fuel: fuel, color: color))
        case "Toyota":
            cars.append(Toyota(brand: brand, model: model, year: year, enginePower: enginePower, fuel: fuel, color: color))
        default:
            print("Неизвестный тип машины.")
        }
    }
}

func createCars() -> [Car] {
    var myGarage = carGarage()
    myGarage.addCar(brand: "BMW", model: "M5", year: 2022, enginePower: 625, fuel: 10.5, color: "red", type: "BMW")
    myGarage.addCar(brand: "Mercedes", model: "C-class", year: 2023, enginePower: 585, fuel: 11.2, color: "gray", type: "Mercedes")
    myGarage.addCar(brand: "Mercedes", model: "E-class", year: 2024, enginePower: 650, fuel: 12.0, color: "white", type: "Mercedes")
    myGarage.addCar(brand: "Toyota", model: "Camry", year: 2020, enginePower: 387, fuel: 9.8, color: "black", type: "Toyota")
    myGarage.addCar(brand: "Matiz", model: "Daewoo", year: 2018, enginePower: 215, fuel: 7.4, color: "pink", type: "Matiz")
    myGarage.addCar(brand: "Matiz", model: "Daewoo", year: 2020, enginePower: 235, fuel: 7.6, color: "pink with lashes", type: "Matiz")
    myGarage.addCar(brand: "BMW", model: "X5", year: 2023, enginePower: 380, fuel: 8.5, color: "yellow", type: "BMW")
    myGarage.addCar(brand: "BMW", model: "I8", year: 2024, enginePower: 450, fuel: 10.0, color: "purple", type: "BMW")

    return myGarage.cars
}



func raceCars(cars: [Car]) {
    if cars.count % 2 != 0 {
        print("Нечетное количество автомобилей, поэтому невозможно провести гонки")
        return
    }

    var overallWinner: Car? = nil
    for i in 0..<cars.count {
        for j in i+1..<cars.count {
            if let car1 = cars[i] as? Matiz, let car2 = cars[j] as? Matiz {
                if car1.enginePower > car2.enginePower {
                    print("Победитель: \(car1.brand) \(car1.model) \(car1.color)")
                    overallWinner = car1
                } else if car1.enginePower < car2.enginePower {
                    print("Победитель: \(car2.brand) \(car2.model) \(car2.color)")
                    overallWinner = car2
                } else {
                    print("Победила дружба!!!")
                }
            } else if let car1 = cars[i] as? BMW, let car2 = cars[j] as? BMW {
                if car1.enginePower > car2.enginePower {
                    print("Победитель: \(car1.brand) \(car1.model)")
                    overallWinner = car1
                } else if car1.enginePower < car2.enginePower {
                    print("Победитель: \(car2.brand) \(car2.model)")
                    overallWinner = car2
                } else {
                    print("Победила дружба!!!")
                }
            } else if let car1 = cars[i] as? Mercedes, let car2 = cars[j] as? Mercedes {
                if car1.enginePower > car2.enginePower {
                    print("Победитель: \(car1.brand) \(car1.model)")
                    overallWinner = car1
                } else if car1.enginePower < car2.enginePower {
                    print("Победитель: \(car2.brand) \(car2.model)")
                    overallWinner = car2
                } else {
                    print("Победила дружба!!!")
                }
            } else if let car1 = cars[i] as? Toyota, let car2 = cars[j] as? Toyota {
                if car1.enginePower > car2.enginePower {
                    print("Победитель: \(car1.brand) \(car1.model)")
                    overallWinner = car1
                } else if car1.enginePower < car2.enginePower {
                    print("Победитель: \(car2.brand) \(car2.model)")
                    overallWinner = car2
                } else {
                    print("Победила дружба!!!")
                }
            } else {
                print("Эти автомобили не участвуют в гонке")
            }
        }
    }

    if let winner = overallWinner {
        print("Итоговый победитель: \(winner.brand) \(winner.model)")
    } else {
        print("Не удалось определить победителя")
    }
}

let cars = createCars()
raceCars(cars: cars)

