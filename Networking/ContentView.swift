//
//  ContentView.swift
//  Networking
//
//  Created by Sherzod Fayziev on 2022/05/18.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    
     func apiEmpiloyeeList() {
         AFHttp.get(url: AFHttp.API_EMPLOYEE_LIST, params: AFHttp.paramsEmpty(), handler: { response in
             
             switch response.result {
             case .success:
                 print(response.result)
             case let .failure(error):
                 print(error)
                 
             }
         })
     }
    
    func apiEmpiloyeeSingle(id: Int) {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_SINGLE + String(id), params: AFHttp.paramsEmpty(), handler: { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
                
            }
        })
    }
    
    func apiEmpiloyeeCreate(employee: Employee) {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_CREATE, params: AFHttp.paramsEmployeeCreate(employee: employee), handler: { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
                
            }
        })
    }
    
    func apiEmpiloyeeUpdate(employee: Employee) {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_UPDATE + String(employee.id!), params: AFHttp.paramsEmployeeUpdate(employee: employee), handler: { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
                
            }
        })
    }
    func apiEmpiloyeeDelete(employee: Employee) {
        AFHttp.get(url: AFHttp.API_EMPLOYEE_DELETE + String(employee.id!), params: AFHttp.paramsEmpty(), handler: { response in
            
            switch response.result {
            case .success:
                print(response.result)
            case let .failure(error):
                print(error)
                
            }
        })
    }

    
    var body: some View {
        VStack{
        Text("Hello, world!")
            .padding()
        }.onAppear{
            
            apiEmpiloyeeSingle(id: 1)
           
        }.onDisappear{
            print("Screen is Disappeared!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
