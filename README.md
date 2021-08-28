# Born2beRoot

This project focus on understanding how a Virtual Machine works, setting up an ssh server using Debian or CentOS, following strict rules.

## Subjects

Here are some important topics you should search for the project, basically understand what you use.

- Virtual Machine
- Debian vs CentOS
- SELinux and DNF vs AppArmor
- APT vs Aptitude
- Password Policy
- Sudo
- LVM
- SSH
- UFW
- Cron

## VM Setup

- Create a VM with your chosen distro, in VirtualBox
- Choose amount of RAM
- Create a virtual hard disk, VDI, dynamically allocated
- Choose amount of storage
- Choose Bridge Adapter mode in Network Settings
- Install ISO from chosen system, without graphical interface
- Setup hostname (login42)
- Setup root password following PDF's policy
- Setup user (login)
- Setup user password following PDF's policy
- Setup the partitions using encrypted LVM accordingly to mandatory or bonus
- Install only SSH server and standard system utilities
- Setup GRUB to start the disk

## Rules Setup

### Sudo

- Install Sudo
- Add your user to Sudo
- Edit /etc/sudoers.d/(FILE)
	Defaults	passwd_tries=3 \
	Defaults	badpass_message="(CUSTOM MESSAGE)" \
	Defaults	iolog_dir="/var/log/sudo" \
	Defaults	logfile="/var/log/sudo/(FILE)" \
	Defaults	log_input,log_output \
	Defaults	requiretty \
	Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" \

## References


