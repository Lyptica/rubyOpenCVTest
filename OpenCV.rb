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

		#顔認識
		loop do
			image = capture.query
			image = image.resize OpenCV::CvSize.new 640, 360
			detector.detect_objects(image).each do |rect|
    			puts "detect!! : #{rect.top_left}, #{rect.top_right}, #{rect.bottom_left}, #{rect.bottom_right}"
    			image.rectangle! rect.top_left, rect.bottom_right, :color => OpenCV::CvColor::Red

    			#阿部さんを加工
    			image.set_roi rect
    			resize_abe = abe.resize rect
    			(image.rows*image.cols).times do |i|
    				image[i] = resize_abe[i]
    			end
    			image.reset_roi

			end
  			window.show image
  			break if OpenCV::GUI::wait_key(100)
		end
	end
end
OCV.new()