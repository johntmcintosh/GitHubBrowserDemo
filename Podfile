source 'https://github.com/CocoaPods/Specs.git'


platform :ios, '11.0'

target 'GitHubBrowser' do
    
    pod 'Result', '3.2.4'
    pod 'SwiftyJSON', '3.1.4'
    
    target 'GitHubBrowserTests' do
        inherit! :search_paths
        
        # This is a pod I'm developing on top of FBSnapshotTestCase that's not quite ready for public release yet.
        pod 'SnapshotKit', :git => 'git@github.com:johntmcintosh/SnapshotKit.git', :branch => 'master'
    end
end


use_frameworks!
inhibit_all_warnings!
