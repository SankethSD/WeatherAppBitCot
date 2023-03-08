//
//  NextViewController.swift
//  WeatherAppBitCot
//
//  Created by Sanketh S Deshpande on 08/03/23.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var apiManager: APIManager = APIManager()
    var forecastData: ForecastData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension NextViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastData?.daily?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let dailyData = self.forecastData?.daily?[indexPath.row]
        let iconData = self.apiManager.getImage(icon: dailyData?.weather?.first?.icon ?? "")
        if iconData != nil{
            cell.imgView.image = UIImage(data: iconData!)
        }
        cell.curTempLabel.text = tempToCelsius(temp: dailyData?.temp?.min ?? 0)
        cell.avgTempLabel.text = "/ \(tempToCelsius(temp: dailyData?.temp?.max ?? 0))"
        cell.dayLabel.text = "\(dayConverter(date: dailyData?.dt ?? 0)),"
        cell.dateLabel.text = dateConverter(date: dailyData?.dt ?? 0)
        return cell
    }
    
}

extension NextViewController{
    func dateConverter(date: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        
        return localDate
    }
    
    func dayConverter(date: Int) -> String{
        let day = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.timeZone = .current
        let localDay = dateFormatter.string(from: day)
        
        return localDay
    }
    
    func tempToCelsius(temp: Int) -> String{
        let fah = Measurement(value: Double(temp), unit: UnitTemperature.fahrenheit)
        let cel = fah.converted(to: .celsius).value
        let cels = String(format: "%.1f", cel)
        
        return cels
    }
}
