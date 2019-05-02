# Sample Maid rules file -- some ideas to get you started.
#
# To use, remove ".sample" from the filename, and modify as desired.  Test using:
#
#     maid clean -n
#
# **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing
# what they do, you might run into unwanted results!
#
# Don't forget, it's just Ruby!  You can define custom methods and use them below:
#
#     def magic(*)
#       # ...
#     end
#
# If you come up with some cool tools of your own, please send me a pull request on GitHub!  Also, please consider sharing your rules with others via [the wiki](https://github.com/benjaminoakes/maid/wiki).
#
# For more help on Maid:
#
# * Run `maid help`
# * Read the README, tutorial, and documentation at https://github.com/benjaminoakes/maid#maid
# * Ask me a question over email (hello@benjaminoakes.com) or Twitter (@benjaminoakes)
# * Check out how others are using Maid in [the Maid wiki](https://github.com/benjaminoakes/maid/wiki)


require "fileutils"

Maid.rules do

  # rule "debian packages" do
  #   move(dir("~/Загрузки/*.deb"), "~/Загрузки/deb")
  # end

  # rule "compressed" do
  #   move(dir("~/Загрузки/*.(zip|tar.gz|rar|tar.bz2|tgz)"), "~/Загрузки/compressed")
  # end

  # rule "PDFs" do
  #   move(dir("~/Загрузки/*.(pdf|mobi)"), "~/Загрузки/pdfs")
  # end

  # rule "images" do
  #   move(dir("~/Загрузки/*.(jpg|jpeg|gif|png|eps)"), "~/Загрузки/images")
  # end

  # rule "videos" do
  #   move(dir("~/Загрузки/*.(mkv|mp4|avi)"), "~/Загрузки/videos")
  # end

  # rule "audio" do
  #   move(dir("~/Загрузки/*.mp3"), "~/Загрузки/audio")
  # end

  # rule "screenshots" do
  #   Dir.foreach("/home/evgeniy/Изображения") {
  #     |filename|
  #     fullpath = "/home/evgeniy/Изображения/#{filename}"
  #     create_time = (/\w+-\w+-\w+[[:blank:]]\w+:\w+:\w+/.match(filename)).to_s
  #     date = create_time.split[0].to_s
  #     year = date.split("-")[0].to_s
  #     month = date.split("-")[1].to_s
  #     if year and month != ""
  #       finalpath = "/home/evgeniy/Изображения/Screenshots/#{year}/#{month}"
  #       FileUtils.mkdir_p(finalpath)
  #       FileUtils.mv fullpath, finalpath
  #     end
  #   }
  # end
  rule "Move books from Telegram folder" do
    move(dir("~/Загрузки/Telegram Desktop/*.(epub|fb2|pdf|mobi)"), "~/Документы/Mega/Книги/Книг/00_inbox")
  end

  rule "Move music from Telegram folder" do
    move(dir("~/Загрузки/Telegram Desktop/*.(mp3|wav|ogg|flac|m4a)"), "~/Музыка/telegram")
  end

  rule "Move screenshots into \'Screenshots\' folder" do
    move(dir("~/Изображения/(Снимок экрана|Screenshot)*.(png|jpeg|jpg|tiff)"), "~/Изображения/screenshots")
  end

end
