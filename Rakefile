#!/usr/bin/rake

require 'fileutils'
require 'colorize'

task :style_correct do
  system("swiftformat .")
  system("swiftlint autocorrect")
end

task :release_check do
  puts "Running tests".colorize(:cyan)
  system("swift test")

  puts "Building for release".colorize(:cyan)
  system("swift build -c release")

  puts "Compiling Carthage project".colorize(:cyan)
  system("xcodebuild -project xcodeproj-Carthage.xcodeproj -scheme xcodeproj")
end

task :arhive_carthage do
  system("carthage build --no-skip-current --platform macOS")
  system("carthage archive xcodeproj")
end

task :carthage_update_dependencies do
  system("carthage update --platform macOS")
end

def system(*args)
  Kernel.system(*args) || abort
end