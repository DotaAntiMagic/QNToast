Pod::Spec.new do |s|
    s.name         = 'QNToast'
    s.version      = '0.0.3'
    s.summary      = 'An easy way to use Toast'
    s.homepage     = 'https://github.com/DotaAntiMagic/QNToast'
    s.license      = { :type => "MIT" }
    s.authors      = {'MJ Lee' => '13701401981@139.com'}
    s.platform     = :ios
    s.source       = {:git => 'https://github.com/DotaAntiMagic/QNToast.git', :tag => s.version}
    s.source_files = 'QNToast/**/*.{h,m}'
    s.requires_arc = true
end