require 'formula'

class Librocket < Formula
  # current head, 26/Nov/2016
  head 'https://github.com/deleter8/libRocket.git', :using => :git, :revision => 'e64913e82963a6db2760f63d76785b8c7ff39284'
  homepage 'http://librocket.com'

  depends_on 'cmake'
  depends_on 'boost'
  depends_on 'boost-python'

  def install
    system "cd Build && cmake . -G Xcode -DBUILD_PYTHON_BINDINGS=On -DBUILD_SHARED_LIBS=off"
    system "cd Build && xcodebuild -project libRocket.xcodeproj/ -configuration Release"
    system "mkdir -p #{prefix}/lib/python2.7/site-packages/"
    system "cp -a Build/Release/*.a #{prefix}/lib/"
    system "cp bin/rocket.py #{prefix}/lib/python2.7/site-packages/"
    system "cp Build/Release/_rocketcore.so #{prefix}/lib/python2.7/site-packages/"
    system "cp Build/Release/_rocketcontrols.so #{prefix}/lib/python2.7/site-packages/"
    system "cp -r Include #{prefix}/include"
  end
end
