Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795841568;
	b=Za+THLsPEY6Wu6Vj5YTA4TSZU2doEZ2h3gup+k4aTsnbQJxgx5N4kkXNBmZiZZXTJvu/
	 DkvaeFP9JeZ1RYX/Sl3i9R+MwUGnYDQefGUwf7U6+p3z1Le8XBXEoMfPRuV8TPAzlPa+E
	 Arb5zaRBm+ZJirhfNWe53k9J5Ju1K/mMALezHtH01AIh5K+/zS7KJlffNnFhZvdBttuVm
	 NEemXKgEva/RGkw9gly76nPVMe/fTqZBQuh1Ltp7R/Y+Ej68l3OQz1sqT9lnQ33bt3yTp
	 JCf4u+RDoBURvs95m/wF+m7gSABla8UQ0y/r5qSQiDaPvWDlpx/7P5P1+00cNfBAFBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795841568;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=+CuZajAI7pcqVST/U2ZvT8Udyeh9SB999vpnUpHCrgE=;
	b=CQlxdlMa/NL8gbg2kKF8MPeab86SsSZMEa5RBy116SBrl58KQ8QrS5dVc98cDP2Z0q3k
	 MVPkABauyn10jLlLkGNsd4zwfi1E9meXcLJCCftM8jvfm1Emwei859Z5u73AuDCEH1XEo
	 wnhZ59CylD7sHn9rUWmYfVn7lfAL5OnJ6WbYryIFpMRSNbGkuhYixhB72OhkP/K5vULxk
	 v29Ob5N/tvTZJyUTej6JZpuBKtk/i7CLqJ6qAOOzQOzmFcK4Cmphnr0P1JNQpGOKYumRS
	 eypBSzWD+U4BubK7Alb0EzZi4rkwMUQWnyJw4xrFkhXjwdqwBgDVjBhV7Udwag9/MUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=e2xLt1h1;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764F5606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 764F5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=e2xLt1h1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=+C
	uZajAI7pcqVST/U2ZvT8Udyeh9SB999vpnUpHCrgE=; b=e2xLt1h1x2Xs14gVCV
	Teu1TgD4WyKPBF3XNFZYSmji7GOxdL97XjKJf9InbhQNwJo9fvifEVSqMZXoaqhR
	lQeceDvtjWtL+DTgi0InlRSDjQ9wC4o4daG8Cu747q0+yEcojrEKq34IxFOZz/Uz
	cewMnwNx93T0hSsgKQvk+vTj0=
Received: from shaos.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgA3l48PXgprZ5VZIg--.14379S2;
	Sat, 28 Nov 2026 12:52:31 +0800 (CST)
From: shaos <shawnq1@163.com>
To: mikulas@artax.karlin.mff.cuni.cz
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] hpfs: return an error instead of hitting BUG()
Date: Sat, 28 Nov 2026 04:52:31 +0000
Message-Id: <20261128045231.2664989-1-shawnq1@163.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgA3l48PXgprZ5VZIg--.14379S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFWkJr45tFyrWFykJr43Wrg_yoWrtr47pa
	9Ik393Kw4vqF15J34kKF18uF1ak39rX3yjq34DGr4kXa15tw4fAw1xKw45ZF42vrZ5Wr4U
	A3WkuF1Sqa1YvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uu89_UUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbC0A-3BmsKXg88+AAA3a

Hello,

When hpfs_get_block() is asked to create a block that does not match
mmu_private, it executes BUG() even though the function has an existing
-EIO return path immediately below. The mismatch is reachable when a
write follows a failed lookup of a sector in a malformed HPFS image.
The write therefore oopses the kernel instead of returning an I/O
error.

Remove the BUG() and use the existing error path. The trigger mounts a
crafted HPFS image read-write and writes one byte to a file. With the
patch, pwrite() returns -EIO and the kernel remains alive; writing to
the valid control image succeeds.

HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
source version: v7.3-23088-g8d7fe9885c62f (Linux 7.4.0-rc4)
compiler:       gcc 11.4.0, GNU ld 2.38

console output:
https://gist.githubusercontent.com/shaos26/384b45e91d728eb7cda8291e3f7f996c/raw/8d91f0fa714fecba04be70a22b69bb5f42fc4213/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/384b45e91d728eb7cda8291e3f7f996c/raw/8d91f0fa714fecba04be70a22b69bb5f42fc4213/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/384b45e91d728eb7cda8291e3f7f996c/raw/8d91f0fa714fecba04be70a22b69bb5f42fc4213/poc.c
image generator:
https://gist.githubusercontent.com/shaos26/384b45e91d728eb7cda8291e3f7f996c/raw/8d91f0fa714fecba04be70a22b69bb5f42fc4213/hpfs_image_gen.c
initramfs init:
https://gist.githubusercontent.com/shaos26/384b45e91d728eb7cda8291e3f7f996c/raw/8d91f0fa714fecba04be70a22b69bb5f42fc4213/init

Download the Gist files into one working directory:

    gist_id=384b45e91d728eb7cda8291e3f7f996c
    gist_revision=8d91f0fa714fecba04be70a22b69bb5f42fc4213
    gist_base=https://gist.githubusercontent.com/shaos26
    gist=$gist_base/$gist_id/raw/$gist_revision
    for file in console-output.txt kernel-config.txt poc.c \
        hpfs_image_gen.c init; do
        curl -fL "$gist/$file" -o "$file"
    done

Clone the kernel and build it from the specified revision and config:

    git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
    cd linux
    git checkout 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
    mkdir build
    cp ../kernel-config.txt build/.config
    make O=build olddefconfig
    make O=build -j"$(nproc)" bzImage
    cd ..

Build the image and initramfs:

    gcc -O2 -Wall -Wextra -Werror -o hpfs_image_gen hpfs_image_gen.c
    gcc -O2 -static -Wall -Wextra -Werror -o poc poc.c
    ./hpfs_image_gen /tmp/hpfs-positive.img 513
    ./hpfs_image_gen /tmp/hpfs-control.img 513 mapped
    mkdir -p root/bin root/usr/bin root/mnt
    cp /usr/bin/busybox root/bin/busybox
    root/bin/busybox --install -s root/bin
    cp poc root/usr/bin/poc
    cp init root/init
    (cd root && find . -print0 | cpio --null -o -H newc) | gzip -9 \
        > initramfs.cpio.gz

Run the positive and mapped-extent control images:

    timeout 60 qemu-system-x86_64 -m 2048 -smp 1 \
        -kernel linux/build/arch/x86/boot/bzImage \
        -initrd initramfs.cpio.gz \
        -append 'console=ttyS0,115200 panic=1 oops=panic loglevel=4 rdinit=/init' \
        -drive file=/tmp/hpfs-positive.img,format=raw,if=virtio \
        -display none -serial file:/tmp/hpfs-positive.log -monitor none -no-reboot
    timeout 60 qemu-system-x86_64 -m 2048 -smp 1 \
        -kernel linux/build/arch/x86/boot/bzImage \
        -initrd initramfs.cpio.gz \
        -append 'console=ttyS0,115200 panic=1 oops=panic loglevel=4 rdinit=/init' \
        -drive file=/tmp/hpfs-control.img,format=raw,if=virtio \
        -display none -serial file:/tmp/hpfs-control.log -monitor none -no-reboot

With the patch, the malformed image's write returns -EIO and the kernel
survives. The mapped-extent control returns one byte written. The
unfixed kernel hits BUG() in hpfs_get_block() for the positive image.

Mounting the crafted image requires CAP_SYS_ADMIN. This reproduces a
kernel BUG on malformed filesystem data; it does not demonstrate
privilege escalation or memory disclosure.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: shaos <shawnq1@163.com>

Thanks,

shaos

---
diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
index ef7eb601be09b..13f375a8b2c1a 100644
--- a/fs/hpfs/file.c
+++ b/fs/hpfs/file.c
@@ -99,7 +99,6 @@ static int hpfs_get_block(struct inode *inode, sector_t iblock, struct buffer_he
 	}
 	if (!create) goto ret_0;
 	if (iblock<<9 != hpfs_i(inode)->mmu_private) {
-		BUG();
 		r = -EIO;
 		goto ret_r;
 	}

