<!-- README.md -->
<!-- 20220225 -->

# WechatTools

## Image_Decoder.jl (20220223)

���� Windows ΢�ſͻ����յ���ͼƬ�ļ���ת���� JPG / PNG ��ʽ��

### ʹ�÷���

�� `os_id` �� `wx_id` �ֱ�ֵΪϵͳ�û�����΢�� ID��Ȼ������ `decode_all!(path)`��
`Image` �ļ������������� `yyyy-mm` �����ļ����е����� `.dat` �ļ�����ԭλ���滻Ϊ `.jpg`��`.png` �� `.data`��δ֪��ʽ�����ܲ���ͼƬ�ļ�����ͬʱ�ļ�����ʱ�䡢�޸�ʱ�䱣�ֲ��䡣

### ����

- `mask(key::UInt8, stream::Vector{UInt8})`��
	���ֽ� `key` ���ֽ�����ֽ��� `stream`��
- `get_heads(path::AbstractString)`��
	�ռ�·�� `path` ������ `.dat` �ļ���ǰ 2 ���ֽڡ�·�� `path` ���� `.../Image/2022-02`��
- `get_key(path::AbstractString)`��
	��·�� `path` ������ `.dat` �ļ�Ϊ���ģ���������Կ��·�� `path` ���� `.../Image/2022-02`��
- `decode!(path::AbstractString, key::UInt8)`��
	����Կ `key` ����·�� `path` ������ `.dat` �ļ����޸ĺ�׺��������ʱ������䡣·�� `path` ���� `.../Image/2022-02`��
- `decode_all!(path::AbstractString, key=nothing)`��
	����Կ���������� `.../Image` ��·�� `path` ������ƥ�� `r"\d{4}-\d\d$"` �����ļ��н��ܡ�

### �ο�����

- https://blog.csdn.net/huichendelvxing/article/details/117118022
- https://blog.csdn.net/a386115360/article/details/103215560
- https://blog.csdn.net/Zhanglw882/article/details/110221075
