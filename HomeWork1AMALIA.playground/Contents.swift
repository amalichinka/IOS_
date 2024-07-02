class Car {
    let brand: String
    let model: String
    let year: Int

    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
    func printInfo() -> String {
        return "Марка машины: \(brand)\n модель: \(model)\n год выпуска: \(year)"
        // мне кажется метод printInfo должен печатать строку в консоль, а не просто возвращать её, судя по названию...
    }
}

class Matiz: Car {
    let enginePower: Int
    let fuel: Double
    let color: String


    init(brand: String, model: String, year: Int, enginePower: Int, fuel: Double, color: String) {
        self.enginePower = enginePower
        self.fuel = fuel
        self.color = color
        super.init(brand: brand, model: model, year: year)
    }
    
    override func printInfo() -> String {
        return super.printInfo() + "У матизика мощность двигателя: \(enginePower) и расход топлива: \(fuel)"
    }
}

class BMW: Car {
    let enginePower: Int
    let fuel: Double
    let color: String


    init(brand: String, model: String, year: Int, enginePower: Int, fuel: Double, color: String) {
        self.enginePower = enginePower
        self.fuel = fuel
        self.color = color
        super.init(brand: brand, model: model, year: year)
    }
    override func printInfo() -> String {
        return super.printInfo() + "У BMW мощность двигателя: \(enginePower) и расход топлива: \(fuel)"
    }
}


class Mercedes: Car {
    let enginePower: Int
    let fuel: Double
    let color: String


    init(brand: String, model: String, year: Int, enginePower: Int, fuel: Double, color: String) {
        self.enginePower = enginePower
        self.fuel = fuel
        self.color = color
        super.init(brand: brand, model: model, year: year)
    }
    
    override func printInfo() -> String {
        return super.printInfo() + "У Mercedes мощность двигателя: \(enginePower) и расход топлива: \(fuel)"
    }
}


class Toyota: Car {
    let enginePower: Int
    let fuel: Double
    let color: String


    init(brand: String, model: String, year: Int, enginePower: Int, fuel: Double, color: String) {
        self.enginePower = enginePower
        self.fuel = fuel
        self.color = color
        super.init(brand: brand, model: model, year: year)
    }
    
    override func printInfo() -> String {
        return super.printInfo() + "У Tayota мощность двигателя: \(enginePower) и расход топлива: \(fuel)"
    }
}

/*
 Все машины имеют одинаковые поля, это нарушает правило дублирования кода, можно было бы тут также создать отдельный класс, типа CarDop, который бы наследовался от Car, а все марки уже наследовать от CarDop и был бы у тебя там 1 метод init, который бы вызывал super.init
 
 */


import Foundation
// import`ы всегда должны быть вначале файла

func createCars() -> [Car] {
    var cars: [Car] = []

    cars.append(BMW(brand: "BMW", model: "M5", year: 2022, enginePower: 625, fuel: 10.5, color: "red"))
    cars.append(Mercedes(brand: "Mercedes", model: "C-class", year: 2023, enginePower: 585, fuel: 11.2, color: "gray"))
    cars.append(Mercedes(brand: "Mercedes", model: "E-class", year: 2024, enginePower: 650, fuel: 12.0, color: "white"))
    cars.append(Toyota(brand: "Toyota", model: "Camry", year: 2020, enginePower: 387, fuel: 9.8, color: "black"))
    cars.append(Matiz(brand: "Matiz", model: "Daewoo", year: 2018, enginePower: 215, fuel: 7.4, color: "pink"))
    cars.append(Matiz(brand: "Matiz", model: "Daewoo", year: 2020, enginePower: 235, fuel: 7.6, color: "pink with lashes"))
    cars.append(BMW(brand: "BMW", model: "X5", year: 2023, enginePower: 380, fuel: 8.5, color: "yellow"))
    cars.append(BMW(brand: "BMW", model: "I8", year: 2024, enginePower: 450, fuel: 10.0, color: "purple"))

    return cars
}

/*
 Есть ощущение, что в задании просили написать метод, который бы по введённым параметрам от пользователя/от тебя создавал бы машины.
 То есть не нужно было создавать массив машин, в этом случае ты можешь воспользоваться методом единожды, если ты захочешь добавить ещё автомобили, то тебе прийдётся менять сам метод, это не эффективно
 Тут самым лучшим вариантом было бы создать структуру, в ней был бы массив машин и метод мутационный, который бы добавлял по параметрам новую машину
 */


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


/*
 Тут метод конечно хороший, много краевых случаев учла, но при этом ты сравниваешь только автомобили одной марки, а в задании про гонки может участвовать любая пара
 */

let cars = createCars()
raceCars(cars: cars)

