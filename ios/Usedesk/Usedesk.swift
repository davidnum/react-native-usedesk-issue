import UIKit
import UseDesk_SDK_Swift


@objc(Usedesk)
class Usedesk: UIViewController {
  
  private var usedesk = UseDeskSDK()
  private var successCb: RCTResponseSenderBlock? = nil
  private var errorCb: RCTResponseSenderBlock? = nil
  
  
  @objc
  func closeChat() {
    usedesk.closeChat();
  }
  
  func _extractParams(params: NSDictionary, key: String) -> String? {
    return params[key] != nil ? params[key] as? String : nil;
  }
  
  @objc
  func start(_ params: NSDictionary, successCb: @escaping RCTResponseSenderBlock, errorCb: @escaping RCTResponseSenderBlock) {
    print("[Usedesk::start(params)]", params);
    
    self.successCb = successCb;
    self.errorCb = errorCb
    
    let withCompanyID = params["withCompanyID"] as! String;
    let chanelId = params["chanelId"] as! String;
    let urlAPI = params["urlAPI"] as! String;
    let knowledgeBaseID = _extractParams(params: params, key: "knowledgeBaseID")
    let api_token = params["api_token"] as! String;
    let email = _extractParams(params: params, key: "email")
    let phone = _extractParams(params: params, key: "phone")
    let url = params["url"] as! String;
    let urlToSendFile = _extractParams(params: params, key: "urlToSendFile")
    let port = _extractParams(params: params, key: "port")
    let name = _extractParams(params: params, key: "name")
    let operatorName = _extractParams(params: params, key: "operatorName")
    let nameChat = _extractParams(params: params, key: "nameChat")
    let firstMessage = _extractParams(params: params, key: "firstMessage")
    let note = _extractParams(params: params, key: "note")
    let token = _extractParams(params: params, key: "token")
    let localeIdentifier = _extractParams(params: params, key: "localeIdentifier")
    
    DispatchQueue.main.async {
      let appDelegate = UIApplication.shared.delegate as! UIApplicationDelegate
      let viewController = appDelegate.window??.rootViewController as! UIViewController;
      
      self.usedesk.configurationStyle = ConfigurationStyle(
        chatStyle: ChatStyle(backgroundColor: UIColor.white),
        baseStyle: BaseStyle(backColor: UIColor.white)
      )
      
      self.usedesk.start(
        withCompanyID: withCompanyID,
        chanelId: chanelId,
        urlAPI: urlAPI,
        // knowledgeBaseID: knowledgeBaseID,
        api_token: api_token,
        email: email,
        phone: phone,
        url: url,
        urlToSendFile: urlToSendFile,
        port: port,
        name: name,
        operatorName: operatorName,
        nameChat: nameChat,
        firstMessage: firstMessage,
        note: note,
        token: token,
        localeIdentifier: localeIdentifier,
        presentIn: viewController,
        connectionStatus: { success, status, token in
          if success {
            if(self.successCb != nil) {
              successCb([token]);
            }
          } else {
            if(self.errorCb != nil) {
              errorCb([["code": "Not success"]]);
            }
          }
          self.successCb = nil;
          self.errorCb = nil;
        },
        errorStatus: { error, errorText in
          if(self.errorCb != nil) {
            errorCb([["code": errorText]]);
          }
          self.successCb = nil;
          self.errorCb = nil;
        }
      );
    }
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
