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
# If you come up with some cool tools of your own, please send me a pull request on GitHub!
# Also, please consider sharing your rules with others via [the wiki](https://github.com/benjaminoakes/maid/wiki).
#
# For more help on Maid:
#
# * Run `maid help`
# * Read the README, tutorial, and documentation at https://github.com/benjaminoakes/maid#maid
# * Ask me a question over email (hello@benjaminoakes.com) or Twitter (@benjaminoakes)
# * Check out how others are using Maid in [the Maid wiki](https://github.com/benjaminoakes/maid/wiki)

# folders
folders = {
  downloads: '~/Downloads',
  tg: 'Telegram Desktop',
  images: '~/Pictures',
  video: '~/Video',
  music: '~/Musi',
  books: '~/01_Library/09_books/books/00_inbox',
  projects: '~/03_Drafts/02_projects',
  records: '~/01_Library/06_audio-records'
}

# FILETLYPES
BOOKS = ['epub', 'fb2', 'pdf', 'mobi']

AUDIO = [
  'mp4',
  'avi',
  'mkv',
  'mov',
  'm4p',
  'mpeg',
  'mpe',
  'm4v',
  'flv',
  'webm',
  'wmv'
]

IMAGES = [
  'png',
  'jpeg',
  'jpg',
  'tiff'
]

VIDEO = [
  'mp4',
  'avi',
  'mkv',
  'mov',
  'm4p',
  'mpeg',
  'mpe',
  'm4v',
  'flv',
  'webm',
  'wmv'
]

ARCHIVES = [
  'zip',
  'rar',
  '7zip',
  'tar',
  'gz'
]

VECTOR = [
  'svg',
  'svgz',
  'cdr',
  'ai'
]

DOWNLOADS = [
  'crdownload',
  'part',
  'download'
]

IMG = [
  'img',
  'iso',
  'ups'
]


Maid.rules do
  # **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing
  # what they do, you might run into unwanted results!

  # rule 'Linux ISOs, etc' do
  #   trash(dir('~/Downloads/*.iso'))
  # end

  # rule 'Linux applications in Debian packages' do
  #   trash(dir('~/Downloads/*.deb'))
  # end

  # rule 'Mac OS X applications in disk images' do
  #   trash(dir('~/Downloads/*.dmg'))
  # end

  # rule 'Mac OS X applications in zip files' do
  #   found = dir('~/Downloads/*.zip').select { |path|
  #     zipfile_contents(path).any? { |c| c.match(/\.app$/) }
  #   }

  #   trash(found)
  # end

  # rule 'Misc Screenshots' do
  #   dir('~/Desktop/Screen shot *').each do |path|
  #     if 1.week.since?(accessed_at(path))
  #       move(path, '~/Documents/Misc Screenshots/')
  #     end
  #   end
  # end

  # # NOTE: Currently, only Mac OS X supports `duration_s`.
  # rule 'MP3s likely to be music' do
  #   dir('~/Downloads/*.mp3').each do |path|
  #     if duration_s(path) > 30.0
  #       move(path, '~/Music/iTunes/iTunes Media/Automatically Add to iTunes/')
  #     end
  #   end
  # end

  # # NOTE: Currently, only Mac OS X supports `downloaded_from`.
  # rule 'Old files downloaded while developing/testing' do
  #   dir('~/Downloads/*').each do |path|
  #     if downloaded_from(path).any? { |u| u.match('http://localhost') || u.match('http://staging.yourcompany.com') } &&
  #         1.week.since?(accessed_at(path))
  #       trash(path)
  #     end
  #   end
  # end
  watch "#{folders[:downloads]}/#{folders[:tg]}" do
    rule 'Move books from Telegram folder' do
      BOOKS.each do |ext|
        5.minute.since?(last_accessed(ext)) && move(dir("#{folders[:downloads]}/#{folders[:tg]}/*.#{ext}"), mkdir(folders[:books].to_s))
      end
    end
    rule 'Move music from Telegram folder' do
      AUDIO.each do |ext|
        5.minute.since?(last_accessed(ext)) && move(dir("#{folders[:downloads]}/#{folders[:tg]}/*.#{ext}"), mkdir("#{folders[:music]}/telegram"))
      end
    end
    rule 'Trash an old TG files' do
      dir("#{folders[:downloads]}/#{folders[:tg]}/*").each do |path|
        1.week.since?(last_accessed(path)) && trash(path)
      end
    end
  end

  watch folders[:images].to_s do
    rule "Move screenshots to the \'Screenshots\' folder" do
      IMAGES.each do |ext|
        ["Снимок экрана","Screenshot", "screenshot", "Screen shot"].each do |screenshot|
          move(dir("#{folders[:images]}/#{screenshot}*.#{ext}"), mkdir("#{folders[:images]}/screenshots"))
        end
      end
    end
    rule "Move screencasts to the \'Screenshots\' folder" do
      VIDEO.each do |ext|
        ["Peek", "Screencast", "screencast"].each do |screencast|
          move(dir("#{folders[:images]}/#{screencast}*.#{ext}"), mkdir("#{folders[:images]}/screencasts"))
        end
      end
    end
  end

  watch "#{folders[:images]}/screenshots" do
    rule 'Trash screenshots older than 90 days' do
      dir("#{folders[:images]}/screen*s/*").each do |path|
        90.days.since?(created_at(path)) && trash(path)
      end
    end
  end

  watch folders[:downloads].to_s do
    rule "Move *.torrent files to torrent folder" do
      move(dir("#{folders[:downloads]}/*.torrent"), mkdir("#{folders[:downloads]}/torrents"))
    end
    rule "Move *.iso img to img_iso folder" do
      IMG.each do |ext|
        move(dir("#{folders[:downloads]}/*.#{ext}"), mkdir("#{folders[:downloads]}/img_iso"))
      end
    end
    rule "Move .pkg.tar.xz into app_inux folder"  do
      dir("#{folders[:downloads]}/*.pkg.tar.xz").each do |path|
        # filename = File.basename(path).to_s
        move(path, mkdir("#{folders[:downloads]}/app_linux"))
        # finalpath = "#{folders[:downloads]}/app_linux/ARCH-#{filename}"
        # FileUtils.mkdir_p(finalpath)
        # FileUtils.mv path, finalpath
      end
    end
  end

  watch folders[:records].to_s do
    rule 'Trash an old calls' do
      dir("#{folders[:records]}/**/calls/*").each do |path|
        3.week.since?(created_at(path)) && trash(path)
      end
    end

    rule 'Trash an old voice records' do
      dir("#{folders[:records]}/**/voice/*").each do |path|
        3.month.since?(created_at(path)) && trash(path)
      end
    end
  end

end

