## [ Sourcery ] ################################################################

task :sourcery do
    ARGV.each { |a| task a.to_sym do ; end }
    version = ARGV[1].to_s.strip
    print_info "Downloading Sourcery #{version}"
    url = "https://github.com/krzysztofzablocki/Sourcery/releases/download/#{version}/Sourcery-#{version}.zip"
    sh "mkdir -p .bin"
    sh "wget -O .bin/sourcery.zip #{url}"
    sh "unzip .bin/sourcery.zip -d .bin"
end

## [ Helpers ] #################################################################

def print_info(str)
    (red,clr) = (`tput colors`.chomp.to_i >= 8) ? %W(\e[33m \e[m) : ["", ""]
    puts red, "== #{str.chomp} ==", clr
end
