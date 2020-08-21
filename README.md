h1 Wireguard Для Linux Mint (+Gnome) Network Manager

Используем [репозиторий] (https://github.com/max-moser/network-manager-wireguard)

Первым делом установить все зависимости и библиотеки:

```sh
sudo apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf
```
Далее клонируем репозиторий и компилируем:

```sh
git clone https://github.com/max-moser/network-manager-wireguard
cd network-manager-wireguard
./autogen.sh --without-libnm-glib
./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var
make   
sudo make install
```

Перезагружаем network manager

```sh
sudo systemctl restart NetworkManager.service
```
Теперь у вас пояаится Wireguard в писке VPN, а также возможность ипортировать настройки из conf файла
