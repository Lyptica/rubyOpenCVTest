require 'opencv'
include OpenCV

class OCV
	def initialize()
		p "hi"

		if ARGV.length < 1
			p "引数に阿部さんがほしいところである。"
			exit
		end

		#初期化
		window = OpenCV::GUI::Window.new "face detect"
		capture = OpenCV::CvCapture.open
		detector = OpenCV::CvHaarClassifierCascade::load "./haarcascade_frontalface_alt.xml"

		#阿部さん召喚
		abe = CvMat.load(ARGV[0]) # Read the file.
		#abe = CvMat.load("abe.png") # Read the file.

		#顔認識
		loop do
			image = capture.query
			image = image.resize OpenCV::CvSize.new 1280, 720
			detector.detect_objects(image).each do |rect|
    			puts "detect!! : #{rect.top_left}, #{rect.top_right}, #{rect.bottom_left}, #{rect.bottom_right}"
    			image.rectangle! rect.top_left, rect.bottom_right, :color => OpenCV::CvColor::Red

    			#阿部さんを加工
    			image.set_roi rect
    			resize_abe = abe.resize rect
    			(image.rows*image.cols).times do |i|
    				image[i] = resize_abe[i] if resize_abe[i][0] != 241.0 && resize_abe[i][1] != 242.0 && resize_abe[i][2] != 243.0
    			end
    			image.reset_roi

			end
  			window.show image
  			break if OpenCV::GUI::wait_key(100)
		end
	end
end
OCV.new()