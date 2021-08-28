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
- Setup hostname `login42`
- Setup root password following PDF's policy
- Setup user `login`
- Setup user password following PDF's policy
- Setup the partitions using encrypted LVM accordingly to mandatory or bonus
- Install only SSH server and standard system utilities
- Setup GRUB to start the disk

## Rules Setup

### Sudo

- Install Sudo
- Add your user to `sudo`
- Create `user42` group
- Add your user to `user42` group

- Edit `/etc/sudoers.d/<file>`

		Defaults	passwd_tries=3
		Defaults	badpass_message="`<custom-message>`"
		Defaults	iolog_dir="/var/log/sudo"
		Defaults	logfile="/var/log/sudo/`<file>`"
		Defaults	log_input,log_output
		Defaults	requiretty
		Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

### SSH

- Edit `/etc/ssh/sshd_config`

		#Port 22
		Port 4242
		#PermitRootLogin prohibit-password
		PermitRootLogin no

### UFW

- Install UFW
- Enable UFW
- Allow port 4242

### Network

- Edit `/etc/network/interfaces`

		iface enp0s3 inet dhcp
		iface enp0s3 inet static

- Edit `/etc/network/interfaces.d/<file>`

		iface enp0s3 inet static
		address `<vm-ip>`
		netmask `<vm-netmask>`
		gateway `<vm-gateway>`

### Password Policy

- Install libpam

- Edit `/etc/pam.d/common-password`

	password	requisite	pam_pwquality.so retry=3 minlen=10 ucredit=-1 dcredit=-1 maxrepeat=3 reject_username difok=7 enforce_for_root

- Edit `/etc/login.defs`

		ENV_SUBPATH add /snap/bin
		PASS_MAX_DAYS 30
		PASS_MIN_DAYS 2
		PASS_WARN_AGE 7

- OBS: Take a look at `chage` command

### Cron

- Create `monitoring.sh` in root

- Edit `crontab -e`

		`*/10 * * * * /bin/sleep $(last --time-format iso reboot | head -1 | awk -F ":" '{printf ("\%d", $2\%10*60+$3)}') && /root/monitoring.sh`

- OBS: My monitoring.sh needs `net-tools` and `sysstat` packages

### Remote Conection

- In your host machine: `ssh <user>@<vm-ip> -p 4242`
