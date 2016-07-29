Pod::Spec.new do |s|
  s.name         = 'LTMToolbox'
  s.summary      = 'The iOS toolbox that grows only as fast as its documentation'
  s.version      = '1.0.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = {
    'wangzhiwei' => 'wangzhiwei01@youku.com',
    'wangxiaoxiang' => 'wangxiangxiang@youku.com',
    'liyangming' => 'v-liyanming@youku.com'
    }
  s.social_media_url = 'https://github.com/LaiFengiOS'
  s.homepage     = 'https://github.com/LaiFengiOS'
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => 'https://github.com/LaiFengiOS/LTMToolbox.git', :tag => s.version.to_s }
  
  s.requires_arc = true

  s.subspec 'LTMCoreKit' do |ss|
    ss.source_files = 'src/LTMCoreKit/src'
  end

  s.subspec 'LTMSecurity' do |ss|
    ss.source_files = 'src/LTMSecurity/src'
  end

  s.subspec 'LTMFoundation' do |ss|
    ss.source_files = 'src/LTMFoundation/src/**/*.{h,m}'
    ss.dependency 'LTMToolbox/LTMCoreKit'
    ss.dependency 'LTMToolbox/LTMSecurity'
  end

  s.subspec 'LTMiOS' do |ss|
    ss.source_files = 'src/LTMiOS/src'
    ss.dependency 'LTMToolbox/LTMCoreKit'
    ss.dependency 'LTMToolbox/LTMFoundation'
  end

  s.subspec 'LTMBlocksKit' do |ss|
    ss.source_files = 'src/LTMBlocksKit/src/**/*.{h,m}'
  end


  s.libraries = 'z'
end
