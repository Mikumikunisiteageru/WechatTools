<!-- README.md -->
<!-- 20220225 -->

# WechatTools

## Image_Decoder.jl (20220223)

解码 Windows 微信客户端收到的图片文件，转换成 JPG / PNG 格式。

### 使用方法

将 `os_id` 和 `wx_id` 分别赋值为系统用户名和微信 ID，然后运行 `decode_all!(path)`。
`Image` 文件夹下所有形如 `yyyy-mm` 的子文件夹中的所有 `.dat` 文件会在原位置替换为 `.jpg`、`.png` 或 `.data`（未知格式，可能不是图片文件），同时文件创建时间、修改时间保持不变。

### 函数

- `mask(key::UInt8, stream::Vector{UInt8})`：
	用字节 `key` 逐字节异或字节流 `stream`。
- `get_heads(path::AbstractString)`：
	收集路径 `path` 下所有 `.dat` 文件的前 2 个字节。路径 `path` 形如 `.../Image/2022-02`。
- `get_key(path::AbstractString)`：
	以路径 `path` 下所有 `.dat` 文件为密文，穷举求出密钥。路径 `path` 形如 `.../Image/2022-02`。
- `decode!(path::AbstractString, key::UInt8)`：
	用密钥 `key` 解密路径 `path` 下所有 `.dat` 文件，修改后缀，并保持时间戳不变。路径 `path` 形如 `.../Image/2022-02`。
- `decode_all!(path::AbstractString, key=nothing)`：
	求密钥，并对形如 `.../Image` 的路径 `path` 下所有匹配 `r"\d{4}-\d\d$"` 的子文件夹解密。

### 参考资料

- https://blog.csdn.net/huichendelvxing/article/details/117118022
- https://blog.csdn.net/a386115360/article/details/103215560
- https://blog.csdn.net/Zhanglw882/article/details/110221075
