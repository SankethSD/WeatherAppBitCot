//
//  APIManager.swift
//  WeatherAppBitCot
//
//  Created by Sanketh S Deshpande on 08/03/23.
//

import Foundation
import ObjectMapper

protocol APIManagerDelegate: AnyObject{
    func onDataReceived()
    func onErrorReceived(_ error: String)
}

final class APIManager{
    weak var delegate: APIManagerDelegate!
    
    var currData: CurrentData?
    var forecastData: ForecastData?
    
    func getCurrentData(){
        let url = "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=4cd569ffb3ecc3bffe9c0587ff02109f"
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
            guard let data = data, error == nil else{
                self.delegate?.onErrorReceived(error?.localizedDescription ?? "***ERROR***")
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                self.currData = Mapper<CurrentData>().map(JSON: json as! [String : Any])
            }catch{
                
            }
            
            self.delegate?.onDataReceived()
            
        }.resume()
    }
    
    func getImage(icon: String) -> Data?{
        let url = "https://openweathermap.org/img/wn/\(icon).png"
        if let data = try? Data(contentsOf: URL(string: url)!){
            return data
        }
        return nil
    }
    
    func getAllData(){
        let url = "https://api.openweathermap.org/data/2.5/onecall?lat=35&lon=139&appid=4cd569ffb3ecc3bffe9c0587ff02109f"
        
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: url)!)) { data, response, error in
            guard let data = data, error == nil else{
                self.delegate?.onErrorReceived(error?.localizedDescription ?? "***ERROR***")
                return
            }
            do{
                let json = try JSONSerialization.jsonObject(with: data)
                self.forecastData = Mapper<ForecastData>().map(JSON: json as! [String : Any])
            }catch{
                
            }
            
            self.delegate?.onDataReceived()
            
        }.resume()
    }
    
}
