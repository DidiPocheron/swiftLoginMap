//
//  MapView.swift
//  swiftLoginMap
//
//  Created by Didi on 28/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @Binding var centerCoordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        let centerLocation = CLLocationCoordinate2D(latitude: 47.3215, longitude: 5.04147)
        let region = MKCoordinateRegion(center: centerLocation, latitudinalMeters: CLLocationDistance(exactly: 30000)!, longitudinalMeters: CLLocationDistance(exactly: 30000)!)
        mapView.setRegion(mapView.regionThatFits(region), animated: true)
        
        for appartment in appartmentData {
            let annotation = MKPointAnnotation()
            annotation.title = appartment.name
            annotation.subtitle = appartment.description
            annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(appartment.latitude), longitude: CLLocationDegrees(appartment.longitude))
            mapView.addAnnotation(annotation)
        }
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
       
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent:MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoordinate = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Placermark"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
                annotationView?.image = UIImage(named:"immoPicto")
            }else{
                annotationView?.annotation = annotation
            }
            return annotationView
        }
    }
}
