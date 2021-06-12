platform :ios, '11.0'

def ui_pods
  pod 'SwiftMessages'
end

target 'Cryptoku' do
  use_frameworks!

  pod 'Alamofire', '4.9.1'
  pod 'SnapKit', '~> 5.0.0'
  pod 'SwiftyJSON'
  
  ui_pods


  target 'CryptokuTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
