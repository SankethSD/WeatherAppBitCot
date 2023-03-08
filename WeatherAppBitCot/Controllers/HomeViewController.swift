//
//  HomeViewController.swift
//  WeatherAppBitCot
//
//  Created by Sanketh S Deshpande on 08/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var curImg: UIImageView!
    
    @IBOutlet weak var curLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var curTempLabel: UILabel!
    
    @IBOutlet weak var windLabel: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    
    @IBOutlet weak var indexUvLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var colView: UICollectionView!
    
    private let apiManager: APIManager = APIManager()
    var currentData: CurrentData?
    var forecastData: ForecastData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        colView.delegate = self
        colView.dataSource = self
        apiManager.getCurrentData()
        apiManager.getAllData()
    }

    @IBAction func nextBtnClicked(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        vc.forecastData = self.forecastData
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension HomeViewController: APIManagerDelegate{
    
    func onErrorReceived(_ error: String) {
        
    }
    
    func onDataReceived() {
        self.currentData = apiManager.currData
        self.forecastData = apiManager.forecastData
        
        let iconData = self.apiManager.getImage(icon: self.currentData?.weather?.first?.icon ?? "")
        let date = dateConverter(date: self.currentData?.dt ?? 0)
        
        DispatchQueue.main.async {
            self.cityLabel.text = "\(self.currentData?.name ?? ""),"
            self.countryLabel.text = self.currentData?.sys?.country
            if iconData != nil{
                self.curImg.image = UIImage(data: iconData!)
            }
            self.curLabel.text = self.currentData?.weather?.first?.main
            self.dateLabel.text = date
            self.curTempLabel.text = self.tempToCelsius(temp: self.currentData?.main?.temp ?? 0)
            self.windLabel.text = "\(self.currentData?.wind?.speed ?? 0)km/j"
            self.feelsLikeLabel.text = self.tempToCelsius(temp: self.currentData?.main?.feelsLike ?? 0)
            self.pressureLabel.text = "\(self.currentData?.main?.pressure ?? 0)"
            self.indexUvLabel.text = self.timeConverter(date: self.currentData?.sys?.sunrise ?? 0)
            self.colView.reloadData()
        }
    }
    
}

extension HomeViewController{
    func dateConverter(date: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMM"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        
        return localDate
    }
    
    func timeConverter(date: Int) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(date))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = .current
        let localDate = dateFormatter.string(from: date)
        
        return localDate
    }
    
    func tempToCelsius(temp: Int) -> String{
        let fah = Measurement(value: Double(temp), unit: UnitTemperature.fahrenheit)
        let cel = fah.converted(to: .celsius).value
        let cels = String(format: "%.1f", cel)
        let celsius = Measurement(value: Double(cels) ?? 0, unit: UnitTemperature.celsius)
        
        return celsius.description
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.timeLabel.text = timeConverter(date: self.forecastData?.hourly?[indexPath.row].dt ?? 0)
        let iconData = self.apiManager.getImage(icon: self.forecastData?.hourly?[indexPath.row].weather?.first?.icon ?? "")
        if iconData != nil{
            cell.imgView.image = UIImage(data: iconData!)
        }
        if indexPath.row == 0{
            cell.allView.backgroundColor = UIColor(named: "themeBlue")
            cell.dateLabel.textColor = .white
            cell.dateLabel.text = "Now"
        }else{
            cell.allView.backgroundColor = UIColor.white
            cell.dateLabel.textColor = .black
            cell.dateLabel.text = tempToCelsius(temp: self.forecastData?.hourly?[indexPath.row].temp ?? 0)
        }
        
        return cell
    }
    
}

