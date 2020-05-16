# spresense-cli ツール for Windows

[Arduinoマルチコア環境](https://developer.sony.com/develop/spresense/docs/arduino_tutorials_ja.html#_tutorial_multicore) の各コアごとにバッチファイルを用意しました。

|Filename|Description|
|--------|-----------|
|spresense-cli-main.bat| MainCore用バッチファイル |
|spresense-cli-sub1.bat| SubCore1用バッチファイル |
|spresense-cli-sub2.bat| SubCore2用バッチファイル |
|spresense-cli-sub3.bat| SubCore3用バッチファイル |
|spresense-cli-sub4.bat| SubCore4用バッチファイル |
|spresense-cli-sub5.bat| SubCore5用バッチファイル |

自分の環境では、書き込みのボーレート`500000`でOKなのですが、エラーが出る場合は`115200`に変更してください。

```powershell:spresense-cli-main.bat
@echo off
setlocal enabledelayedexpansion
cd %~dp0

set BAUDRATE=500000
```

## 使い方

お好きな方法でどうぞ。

**MS-DOSコマンドプロンプト上で、スケッチフォルダを引数に指定してバッチファイルを実行する**
![dos2.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/432852/7416ef3e-fd4c-bb5b-a6a5-5f289b8904ba.png)

**バッチファイルをダブルクリックして開いたDOS窓にスケッチフォルダを指定（ドラッグ&ドロップも可）する**
![enter.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/432852/d92d46b8-8d60-e7e7-97de-fee3cc112c63.png)

**スケッチフォルダをバッチファイルにドラッグ＆ドロップする**
![drop.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/432852/246f715a-11c7-0c91-ee70-50c6e7a50750.png)

## その他

既にビルド済みの状態で、コンパイルは省略して**アップロードだけを行いたい**ケースもあると思います。
Arduino IDEだとこれができないんですよね。。

ビルドに成功するとスケッチフォルダ内に `スケッチ名.SPRESENSE.spresense.spresense.spk` というファイルが生成されています。バッチファイルの引数に、スケッチフォルダの代わりに、この spk ファイルを指定すると、アップロードのみを行います。
