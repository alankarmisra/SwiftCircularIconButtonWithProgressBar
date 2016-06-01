Pod::Spec.new do |s|
  s.name             = 'SwiftCircularIconButtonWithProgressBar'
  s.version          = '1.0.1'
  s.summary          = 'A lightweight, highly-customizable, circular button with animated progress bar, and a settable icon with subtle transitions on icon change.'

  s.description      = <<-DESC
A lightweight, highly-customizable, well-documented circular button with an animated progress bar, and a settable icon with subtle transitions when the icon is changed. Perfect for download buttons, audio player buttons and the customary "much much more!". Written in pure Swift. 
                       DESC

  s.homepage         = 'https://github.com/alankarmisra/SwiftCircularIconButtonWithProgressBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alankar Misra' => 'alankarmisra@gmail.com' }
  s.source           = { :git => 'https://github.com/alankarmisra/SwiftCircularIconButtonWithProgressBar.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.linkedin.com/in/alankarmisra'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SwiftCircularIconButtonWithProgressBar/Classes/**/*'
end
