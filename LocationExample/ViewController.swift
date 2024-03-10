//
//  ViewController.swift
//  LocationExample
//
//  Created by Fatih Gümüş on 10.03.2024.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var labelEnlem: UILabel!
    @IBOutlet weak var labelBoylam: UILabel!
    @IBOutlet weak var labelHiz: UILabel!
    
    @IBOutlet weak var locationView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // en iyi konum değerini vermesi için
        locationManager.requestWhenInUseAuthorization() // lokasyon izni için
        locationManager.startUpdatingLocation()// lokasyon değerinin güncellenmesi için
        locationManager.delegate = self
        
        //41.03700175,28.974792
        
    }

}
extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // güncel olarak konum değerlerini bize verecek.
        
        let sonKonum = locations[locations.count-1]// dizi içindeki son konum değerini bu şekilde alıyoruz.
        
        let latitude = sonKonum.coordinate.latitude
        let longitude = sonKonum.coordinate.longitude
        
        
        labelEnlem.text = "ENLEM : \(latitude)"
        labelBoylam.text = "BOYLAM : \(longitude)"
        labelHiz.text = "HIZ : \(sonKonum.speed)"
        
        let konum = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)//yakınlık dereces,
        let bolge = MKCoordinateRegion(center: konum, span: span)
        locationView.setRegion(bolge, animated: true)
        
        
//        canlı konumu pin ekleyerek gösterir
        
//        let pin = MKPointAnnotation()
//        pin.coordinate = konum
//        pin.title = "\(latitude) - \(longitude)"
//        pin.subtitle = "Şuanda Buradasınız"
//        locationView.addAnnotation(pin)
        
        locationView.showsUserLocation = true // konumu canlı hareket ederken mavi şekilde gösteren kod
        
        
    }
    
}
