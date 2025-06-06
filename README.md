# win-compression-del

這個專案提供了一個簡單的 PowerShell 腳本，可將 `D:\elemental_chronicles\public\content` 目錄中的資料壓縮成 ZIP 檔案，並在檔案超過 500MB 時自動分割，僅保留 7 天內產生的壓縮檔。

## 使用方式
1. 確定電腦已安裝 [7-Zip](https://www.7-zip.org/) 並將 `7z.exe` 加入系統 `PATH`。
2. 執行 `compress_and_cleanup.ps1`：
   ```powershell
   powershell -ExecutionPolicy Bypass -File compress_and_cleanup.ps1
   ```
   這會在 `D:\elemental_chronicles\public\backups` 目錄產生 `content_yyyyMMdd_HHmmss.zip` 檔案，並自動分割為 500MB 的分卷。
3. 腳本同時會刪除 `backups` 目錄下超過 7 天的舊壓縮檔案。

## 產生可執行檔
若需要將腳本包成單一執行檔，可使用 [PS2EXE](https://github.com/MScholtes/PS2EXE) 進行轉換：

```powershell
Install-Module -Name ps2exe -Scope CurrentUser
Invoke-ps2exe compress_and_cleanup.ps1 compress_and_cleanup.exe
```

產生的 `compress_and_cleanup.exe` 即為可直接執行的檔案。
