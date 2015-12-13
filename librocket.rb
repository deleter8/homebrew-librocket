require 'formula'

class Librocket < Formula
  # current head, 13/Dec/2015
  head 'https://github.com/libRocket/libRocket.git', :using => :git, :revision => 'f164420c505a073fc878be9b5e238e3a2a2955f8'
  homepage 'http://librocket.com'

  depends_on 'cmake'
  depends_on 'boost'
  depends_on 'boost-python'

  def install
    system "cd Build && cmake . -G Xcode -DBUILD_PYTHON_BINDINGS=On"
    system "cd Build && xcodebuild -project libRocket.xcodeproj/ -configuration Release"
    system "mkdir -p #{prefix}/lib/python2.7/site-packages/"
    system "cp -a Build/Release/*.dylib #{prefix}/lib/"
    system "cp bin/rocket.py #{prefix}/lib/python2.7/site-packages/"
    system "cp Build/Release/_rocketcore.so #{prefix}/lib/python2.7/site-packages/"
    system "cp Build/Release/_rocketcontrols.so #{prefix}/lib/python2.7/site-packages/"
    system "cp -r Include #{prefix}/include"
  end
end
