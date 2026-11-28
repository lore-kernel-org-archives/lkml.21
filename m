Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795854541;
	b=bGP698Y+oR0bcPaooWjNQE2zy2hrO710zKFiGf0CP5t9JpY1aMzbBpE9Nokdsa/LLO7Q
	 B0uUzJP7fOqfS0RHjBGB9iF1qxKUCni8Vxr3ABS1c62ZzXBIww6eeNsRqbZo4eArIBnKT
	 0dye2tMK3+PDtsrUb0TZF7WVcYDlo47nj4P8zGtJMgkdnkytv8E6WvqQlaw9EQik0aVv6
	 6wy5loIdWjY0EhVhIdQJ+2ixOLL7jI5f0WtcjGLnsuHLCEgzigj4/M4+ft3z4Z+gOmAdP
	 2MZKnfmi3gz+CHv981ktIgmS3q+8bapv6W3KdeyOXeJBVw9qXme+oxK8vQ4CkqJ5GPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854541;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=jdRWsaTvcpI4mUbUn8eU6/56ViyxoCfLiGBfHAikWzU=;
	b=z4qnH7VHhW1tQWPbQ84WL9O5I3zqR4r0H9tC8rqlifvz29k06/SVY7sJVjvb1pyOMxBO
	 Zxt4SGrQrvMOo24/J6MXV4AJdo5JmX//fHwGhSArzM5N325kyY+xKeCsrrePQcjcQMNrf
	 TeHKQooCUuxnjvaLTTxjMGkETxFQXIF6bOZv+3UFcJbOU99cAcgk9bH9/lalell0cJN/F
	 2ry93gSnoQEEz7XuLSF1I2grjQgAbabiUttVaU1f9XSq3H0M0l6VM5V0JdxIFdT5Z4Tur
	 Xz6TwLGZ91mZhs/lG3lUq70r5A55IXYPPVcyW67Vo0gIDTWjF01Z7dny1INkosW4OPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c7dMA8rs;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF76606A338
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAF76606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=c7dMA8rs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=jd
	RWsaTvcpI4mUbUn8eU6/56ViyxoCfLiGBfHAikWzU=; b=c7dMA8rsLk3V8q24Wu
	/Zo+gyxWmDW3rR1A6v+16L8g5ucMeQilfInb4JZlyvr2GWIox8dIAtfEfQ8fYT84
	oA2J7WSc5Sk3gcFz/k0yIbU+4WlxEhRCy+bwb6JIwYBcgfAC1PaD+zVDe1OT2R1I
	UCCwdqbEdrqVKzaRKQs/yVSVw=
Received: from shaos.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t62rkAprABteKw--.31868S2;
	Sat, 28 Nov 2026 16:28:28 +0800 (CST)
From: shaos <shawnq1@163.com>
To: linkinjeon@kernel.org
Cc: Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] exfat: do not free clusters from vendor extensions
Date: Sat, 28 Nov 2026 08:28:27 +0000
Message-Id: <20261128082827.3075096-1-shawnq1@163.com>
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
X-CM-TRANSID:_____wD3t62rkAprABteKw--.31868S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFyfGFy8JFyDXw1ftF47Jwb_yoWrKF4kpF
	Z0k3yrWr18tF1UJws7KF48Za45uw4kK34UG3WDWw17ua9xtr1Ikr1Ik34YvFW8u395Wr4F
	vF4Y9a48W3Zxu3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwuc_UUUUU=
X-CM-SenderInfo: pvkd40jtr6il2tof0z/xtbCzwysumsKkKwT+QAA3i

Hello,

exfat_remove_entries() treats every benign secondary entry as a possible
cluster allocation descriptor.  TYPE_VENDOR_EXT is also classified as a
benign secondary, but a Vendor Extension entry does not describe an
allocation.  The exFAT specification requires AllocationPossible to be
zero for this entry type (section 7.8.2.1):

https://learn.microsoft.com/en-us/windows/win32/fileio/exfat-specification

A crafted image with a Vendor Extension entry whose AllocationPossible
bit is set makes exfat_free_benign_secondary_clusters() interpret bytes
in the extension as a start cluster and size.  Removing the entry frees
those clusters in the allocation bitmap.  A later file allocation can
then reuse and overwrite clusters belonging to another file.

The reproducer mounts a small crafted image writable, removes the planted
entry, creates a replacement file, and remounts the image.  On the
vulnerable kernel, the replacement data overwrites the original contents
of /mnt/userdata.  The patch excludes only TYPE_VENDOR_EXT; other benign
secondary entries retain the existing cleanup behavior.

Validation for TYPE_VENDOR_ALLOC is separate: the malformed entry here is
TYPE_VENDOR_EXT, whose payload does not describe a cluster allocation.

This requires a privileged writable mount of a crafted exFAT image and
causes data corruption within that volume.  It does not demonstrate
memory corruption or access outside the mounted filesystem.

Tested source revision:
HEAD commit:    8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
git tree:       fe970b05333fb8e41da21e9e289f652abcc7cba7
source version: Linux 7.4.0-rc4
compiler:       gcc (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0,
                GNU ld 2.38

console output:
https://gist.githubusercontent.com/shaos26/d37a3a0fa824e655160c05e7ada5fd84/raw/74a0a85aae35462dfd5cdb8dc1ae87ad9226a32a/console-output.txt
kernel config:
https://gist.githubusercontent.com/shaos26/d37a3a0fa824e655160c05e7ada5fd84/raw/d63b446bf570fc993d04b3ffeae979b3db4a6eec/kernel-config.txt
reproducer:
https://gist.githubusercontent.com/shaos26/d37a3a0fa824e655160c05e7ada5fd84/raw/0f93b4c22ac04f5674776f799e449eef097810b8/poc.c
patched-kernel config:
https://gist.githubusercontent.com/shaos26/d37a3a0fa824e655160c05e7ada5fd84/raw/d204ab19c4a8824c83293b94741f80cc0fa52b0a/patched-kernel-config.txt

Build the kernel at the tested revision with the attached configuration.
The reproducer builds its image and attaches it through /dev/loop0.  Build
it as a static init program and boot it from a minimal initramfs:

    gcc -O2 -Wall -Wextra -static -o poc poc.c
    mkdir -p rootfs
    cp poc rootfs/init
    chmod 0755 rootfs/init
    (cd rootfs && find . -print0 | cpio --null -o -H newc) |
        gzip -9 > initramfs.cpio.gz
    timeout 45 qemu-system-x86_64 -m 2G -smp 1 \
        -kernel <linux-tree>/arch/x86/boot/bzImage \
        -initrd initramfs.cpio.gz \
        -append 'console=ttyS0 rdinit=/init panic=-1 oops=panic quiet loglevel=4 acpi=off' \
        -nographic -monitor none -no-reboot

To run the negative control, compile with -DMODE_CONTROL=1 and use that
binary as /init.  On the vulnerable kernel, the trigger reports
RESULT TRIGGER PASS and /mnt/userdata contains OVERWRITE_PATTERN.  With
this patch, the trigger reports RESULT TRIGGER FAIL because the original
data remains intact; the negative control reports RESULT CONTROL PASS.

Do not interpret the fixed trigger's FAIL as a patch failure: the
reproducer defines PASS as observing the corruption.  The fixed-kernel
console log confirms that ORIGINAL_USER_DATA_0123456789AB is preserved.

Do not pass Vendor Extension entries to the cluster-freeing helper:

Fixes: 8258ef28001a ("exfat: handle unreconized benign secondary entries")
Signed-off-by: shaos <shawnq1@163.com>
---
 fs/exfat/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/dir.c b/fs/exfat/dir.c
index 46514b13bebda..3633d33efd5ef 100644
--- a/fs/exfat/dir.c
+++ b/fs/exfat/dir.c
@@ -542,12 +542,16 @@ void exfat_remove_entries(struct inode *inode, struct exfat_entry_set_cache *es,
 		int order, bool free_benign)
 {
 	int i;
+	unsigned int type;
 	struct exfat_dentry *ep;
 
 	for (i = order; i < es->num_entries; i++) {
 		ep = exfat_get_dentry_cached(es, i);
+		type = exfat_get_entry_type(ep);
 
-		if (free_benign && (exfat_get_entry_type(ep) & TYPE_BENIGN_SEC))
+		/* Vendor extensions have no allocation fields. */
+		if (free_benign && type != TYPE_VENDOR_EXT &&
+		    (type & TYPE_BENIGN_SEC))
 			exfat_free_benign_secondary_clusters(inode, ep);
 
 		exfat_set_entry_type(ep, TYPE_DELETED);
-- 
2.34.1

Thanks,

shaos

