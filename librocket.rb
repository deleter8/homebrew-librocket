require 'formula'

class Librocket < Formula
  # current head, 26/Nov/2016
  head 'https://github.com/deleter8/libRocket.git', :using => :git, :revision => '4c811fdc4bfd84efb845f70f24b5b058ac6b449a'
  homepage 'http://librocket.com'

  depends_on 'cmake'
  depends_on 'boost'
  depends_on 'boost-python'

  def install
    system "cd Build && cmake . -G Xcode -DBUILD_PYTHON_BINDINGS=On -DBUILD_FRAMEWORK=On"
    system "cd Build && xcodebuild -project libRocket.xcodeproj/ -configuration Release"
    system "mkdir -p #{prefix}/lib/python2.7/site-packages/"
    # system "cp -a Build/Release/*.dylib #{prefix}/lib/"
    # system "cp bin/rocket.py #{prefix}/lib/python2.7/site-packages/"
    # system "cp Build/Release/_rocketcore.so #{prefix}/lib/python2.7/site-packages/"
    # system "cp Build/Release/_rocketcontrols.so #{prefix}/lib/python2.7/site-packages/"
    system "cp -r Include #{prefix}/include"
  end
end
