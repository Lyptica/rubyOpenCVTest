# rubyOpenCVTest
OpenCV、この私にも使いこなせるというのか！？

##OpenCV.rb
自分の顔を写すとジバニャンとか阿部さんに乗っ取られるやつでう。

参考:
* ruby-opencvをインストールして顔認識した
http://shokai.org/blog/archives/8627
* ruby-opencvでプロ生ちゃん！
http://qiita.com/menphim/items/5a4b586d5ac27630dabd

## 新規PCでopencvをインストールするまで:
参考:
* さんじゃらっと OSX + ruby でOpenCV
http://qiita.com/araya/items/e7ffbd7e757b3c0de056

```bash:install_opencv
$ brew search opencv
$ brew tap homebrew/science
$ brew install opencv
$ gem install ruby-opencv
```

##これでうまく行かなかったらrubyを更新してみよう。
参考:
* Homebrewのインストールとrbenvのインストール Mac編
http://qiita.com/issobero/items/e0443b79da117ed48294

```bash:install_ruby_from_rbenv
$ rbenv install 2.2.3
$ rbenv rehash
$ rbenv global 2.2.3
```

##Developer tools の再インストール辺りがうまくいくかも？
* 手段1: XCodeごと再インストール
1. XCodeがアンインストール。なんか動作が変なので
http://takuya-1st.hatenablog.jp/entry/20120503/1336029443
2. Xcode の Command Line Tools をインストール
http://qiita.com/tanakahisateru/items/c0eaa25dbde669b282cb
* 手段2: Command Line tools だけインストール
1. Yosemiteにコマンドラインツールを入れる
http://karabun.hatenablog.com/entry/2015/01/08/073737

##このREADMEを書くときに見たやつ
Qiitaでコンソール(シェル)のコマンド実行を書くときとかのコードブロック
http://qiita.com/5t111111/items/8bf740e5d1e013c415b1

