## 支持java
依赖项目:
1. coc-java: 提供语法支持和智能提示
2. nvim-treesitter: 提供java等多种语言的语法颜色渲染

### 安装步骤
1. 首先要有coc插件，插件完成后，使用命令安装java server, `:CocInstall coc-java`
2. treesitter 安装语法插件，大陆网络遇到多次的网络连接问题，多试几次才行
3. java支持lombok，需要下载lombok，然后配置coc文件。

（1）下载保存lombok：
```
mkdir /usr/local/share/lombok
wget https://projectlombok.org/downloads/lombok.jar -O /usr/local/share/lombok/lombok.jar
```
(2) 配置coc中的jdt项，使用`:CocConfig`，编辑coc-settings.json
```
{
			"codeLens.enable": true,
			"java.referencesCodeLens.enabled": true,
			"java.jdt.ls.vmargs": "-javaagent:/usr/local/share/lombok/lombok.jar",

}
```
