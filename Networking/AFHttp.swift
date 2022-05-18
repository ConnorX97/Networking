
import Foundation
import Alamofire

private let IS_TESTER = true
private let DEP_SER = "https://dummy.restapiexample.com/"
private let DEV_SER = "https://dummy.restapiexample.com/"

let headers: HTTPHeaders = [
    "Accept": "application/json",
]

class AFHttp {
    
    // MARK : - AFHttp Requests
    
    class func get(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .get, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func post(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .post, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func put(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .put, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    class func del(url:String,params: Parameters,handler: @escaping (AFDataResponse<Any>) -> Void){
        AF.request(server(url: url), method: .delete, parameters: params,headers: headers).validate().responseJSON(completionHandler: handler)
    }
    
    // MARK : - AFHttp Methods
    class func server(url: String) -> URL{
        if(IS_TESTER){
            return URL(string: DEV_SER + url)!
        }
        return URL(string: DEP_SER + url)!
    }
    
    // MARK : - AFHttp Apis
    static let API_EMPLOYEE_LIST = "api/v1/employees"
    static let API_EMPLOYEE_SINGLE = "api/v1/employee/" //id
    static let API_EMPLOYEE_CREATE = "api/v1/create"
    static let API_EMPLOYEE_UPDATE = "api/v1/update/" //id
    static let API_EMPLOYEE_DELETE = "api/v1/delete" //id
    
    
    // MARK : - AFHttp Params
    class func paramsEmpty() -> Parameters {
        let parameters: Parameters = [
            :]
        return parameters
    }
    
    
    class func paramsEmployeeCreate(employee: Employee) -> Parameters {
        let parameters: Parameters = [
            "employee_name": employee.employee_name!,
            "employee_salary": employee.employee_salary!,
            "employee_age": employee.employee_age!,
            "profile_image": employee.profile_image!,
        ]
       return parameters
    }
    
    class func paramsEmployeeUpdate(employee: Employee) -> Parameters {
        let parameters: Parameters = [
            "id": employee.id!,
            "employee_name": employee.employee_name!,
            "employee_salary": employee.employee_salary!,
            "employee_age": employee.employee_age!,
            "profile_image": employee.profile_image!,
        ]
       return parameters
    }

}
