# Uncomment the next line to define a global platform for your project
# platform :ios, '12.0'

target 'NotebookSummerPractice' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for NotebookSummerPractice
pod 'SnapKit', '~> 5.0'
pod 'RealmSwift', '~>10'
pod 'SwiftLint'
pod 'FSCalendar'

  target 'NotebookSummerPracticeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NotebookSummerPracticeUITests' do
    # Pods for testing
  end

end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
               end
          end
   end
end