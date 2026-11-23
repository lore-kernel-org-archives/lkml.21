Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795412069;
	b=YbV1hRL4dOpByslw71Oki6Qo61/DH1miBpjvkELmZNXaVNZmXW9NRyAuQSMlj+X0CPSH
	 QQ6Pe5W4cnodb9qPBzTMCtn3w56r/yDIrzZV9ax91EKzIV2XpnPEuSikK8U0qSASfnOwh
	 3RkVSqYz2X85jzTEtoUSdj31wMtPExEoSGWyzE1z6s8k1kLmLvQ5lgEPW39Xyhsg5I6M5
	 /ds7lEd4eHOOdhIObNOqPrGydGolEtHhZsmh/GRYJyDhkNUGSq/A0336X6OPIaYCNq0oL
	 vNQbQGnpDpsDPb904RK+DNbt6Xb7baVQs9PL8xWqa51NNqZr/6f7+CN8EZnf77u/yUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795412069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TL6UwEo4t7VzBEu1IbZXOdiAUAUzzK5wSbC1wgdlVr0=;
	b=oP8F1dPv68ql2QeJeqgVXsN/nyrzw7DRlX2Norte0iE8heo00QKgGqxZJTQqmgcRJir5
	 fnbQgtmDYtHFsninRg704iAJAcxJpN8HITL90XFUM+jpyupVkyHkXIrV3Twhh1OK9hB5B
	 KXPH/JZbPK05X6807GtTdb2ZAJtnaqySDmVzGH9UPzksm0E8xk44Ycg6LLKje9PHsd5tw
	 6tkWRtCrwNeE36BXNO3VUka4fl5ZM+lvjPPVYyf5IK1zsAi/6UNOUpVuxqhJYMqtmPOT1
	 3DzDysGCCLGTW4eCblfm+oBDp77X3J+2Hm60gUA/3nYdGgeLe8oR+cOBNg+s8EUEeKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bkh3Clqf;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA052606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA052606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bkh3Clqf
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so35069975e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795412067; x=1796016867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TL6UwEo4t7VzBEu1IbZXOdiAUAUzzK5wSbC1wgdlVr0=;
        b=Bkh3ClqfZW8YDFCp8x3h+qrByx9HiwGPmEHmKo5SOE/0SSUKA9gYOTUs7I4/IU92+Z
         tqFW0FZZ8SXDMGb9YQJK+rIqAsfImVCwYeIQDyMkHOC8bPr/sqgSFCApXNyf+3b6hboB
         fuCo7Ptp4EnspSR10dDuabgkfAM7fCEF8Yd5NDtmNdDp2rtqSrVu8pTAPMkBaMu79HbK
         gL+r1IhRgmrVwy5Eafk8URJH28nmAnOSHYo60/JbvUWbfVx5yU0BepF/cgwmH0F6p6sp
         wTMFX1UStr9g6gn9y7Mhvd0NmO5kmvG0PtIB9vsq//OB6SklOTc03UeGwbchLuI6NeRz
         j2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795412067; x=1796016867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TL6UwEo4t7VzBEu1IbZXOdiAUAUzzK5wSbC1wgdlVr0=;
        b=Vkjr7f4bZ29S1IMm2MU/8SNF6queGKGZgjjFfTx3pBsvTAnjzDFwaZfMDCXgcABcZi
         YwHsUZfwMIKVXOnrC8qReAGyTGDVjjOh1HZVaa880cI8Jq/A31pXvRL7aSbK8xlUZgzU
         Bd8ITzx6gc1rnNt0McNi5iT22pB7J8jzVQA27yZBqS+U6OsIveV0tE7n++GHgNtxZWxO
         eMyULThyVHDx+y23A28s8WgIYBjQRiR5PfztBc999ZnVi2Zzbs/pHAO9CUcDzz9BY6wa
         3WZ3O+pliDT251TwcnkguJ42El71DJGbIjPcjUcI6rY06FA+qlB3Z/OIEmp2J5pDzZBo
         tIiQ==
X-Forwarded-Encrypted: i=1; AL+hErEziM9TKSSFbCKrtRStuTV/JwMCytFU8FQD0d+p2ZE5MTMJ5XpYYSySP66HzyK7MopZX6Fx92RKaT3I7IE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fr9Nr0yU9g4ocF5ZP7p/ycUnfpR/3+mgAH1wNrHzgiWE99VY2
	sUlnkNHicPPINMxyrIKDg5Yn5tYu52+JP1kf7vYqIjRf4cSsbcFMfg/V
X-Gm-Gg: AZFdTZfC6p5hRydSI+jEpPNTPICQmBGzVrIX6tAAe4xkUtinMlLXQynkCuFhCc+6DrC
	6P7ojFg8yCdtClXhw3QDKGkXGvWF3vHC3j/d1RmBZ4ChxX3vjZ1HY/daCSmpIsByax/iPxAgAPa
	c8VslOZ2unHK9vEa++nkvQflxV/IBKq/cfEQ8SbIMzry4A27NxTegz3io0Xfe6rOWZUXRSF8+9h
	+hKmClaUXbjTnVfaEpoCSbqSt72bcCy2NK1JPtQdMluA2+rE2GYc2CkR8tIOuPlePcKKYa7tMQm
	IF32e6dZl8I7Z5QLY7wmAS/5wFIEiGg1/lCBkXI7BS/vh9eUvxAGvfq2vZPbYmBHIfKtuBocJd+
	gmqXzzV4ll8FKSGAf3x1s+/9nox4ktbCDj/y+rKlerh7JUTs6rY/ej+LyfiXwgCCuadqI+QAUKn
	SIxmhtagTMg//9iFeP+K+btY8Fzw2dxLzgwndav3q7RYy2RzWBbYtxNKMzpDTT6e0YjANm3HBvV
	kJC404G8gfrgtVHIYkXWOrigom+gbO2OrQuorfJKIiPlsr+CJK9VK3vTjNW+d/7nxCMyFVifm3O
	TLXQ7E8/8NogPanj6MpBpszZzRnHQbKVTpDz+Qrm0tSrQ58UpuHFXps=
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb88805c26mr190080905e9.8.1795412066659;
        Sun, 22 Nov 2026 21:34:26 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([37.111.157.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm273173265e9.4.2026.11.22.21.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:34:26 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+9c3df8acb6283d0cf12d@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH] jfs: validate inode link counts before decrementing in rmdir, unlink, and rename
Date: Mon, 23 Nov 2026 10:34:09 +0500
Message-ID: <20261123053409.53956-1-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
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

syzbot reported a WARN_ON(inode->i_nlink == 0) in drop_nlink() called
from jfs_rmdir() when removing subdirectories from a corrupted JFS
directory with an undercounted on-disk di_nlink:

  inode->i_nlink == 0
  WARNING: fs/inode.c:408 at drop_nlink+0xc5/0x110 fs/inode.c:408
  Call Trace:
   inode_dec_link_count include/linux/fs.h:2276 [inline]
   jfs_rmdir+0x416/0x850 fs/jfs/namei.c:395
   vfs_rmdir+0x3e9/0x700 fs/namei.c:5533

In JFS, every valid directory containing at least one subdirectory has
i_nlink >= 3 (its own entry, '.', and the child's '..'), and every valid
empty directory has i_nlink == 2.  If a corrupted on-disk directory has
an undercounted di_nlink, jfs_rmdir() decrements dip->i_nlink down to
0 and then underflows it on the next rmdir, triggering the drop_nlink()
warning and wrapping i_nlink to 0xffffffff.

The same link-count underflow can occur in jfs_unlink() if ip->i_nlink
is already 0, and in jfs_rename() when moving or overwriting a
directory (old_dir->i_nlink < 3 or target directory new_ip->i_nlink != 2)
or overwriting a non-directory with new_ip->i_nlink == 0.

Validate the expected link counts before starting a transaction in
jfs_rmdir(), jfs_unlink(), and jfs_rename(), reporting filesystem
corruption via jfs_error() and returning -EIO.

Tested locally in QEMU (x86_64, KASAN+UBSAN) using syzbot's C
reproducer and a corner-case suite covering corrupt rmdir (nlink=1, 2),
corrupt rename (parent nlink=1, target dir nlink=1), and valid rmdir
and directory-overwrite rename operations: triggered the exact
drop_nlink() warning before the patch, and returned -EIO cleanly with
zero warnings or regressions after the patch.

Reported-by: syzbot+9c3df8acb6283d0cf12d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9c3df8acb6283d0cf12d
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 fs/jfs/namei.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/jfs/namei.c b/fs/jfs/namei.c
index 8ab2e952c..5a06fd8c4 100644
--- a/fs/jfs/namei.c
+++ b/fs/jfs/namei.c
@@ -357,6 +357,14 @@ static int jfs_rmdir(struct inode *dip, struct dentry *dentry)
 		goto out;
 	}
 
+	if (dip->i_nlink < 3) {
+		jfs_error(dip->i_sb,
+			  "corrupt parent directory link count (%u)\n",
+			  dip->i_nlink);
+		rc = -EIO;
+		goto out;
+	}
+
 	if ((rc = get_UCSname(&dname, dentry))) {
 		goto out;
 	}
@@ -483,6 +491,12 @@ static int jfs_unlink(struct inode *dip, struct dentry *dentry)
 	if (rc)
 		goto out;
 
+	if (!ip->i_nlink) {
+		jfs_error(ip->i_sb, "corrupt inode link count (0)\n");
+		rc = -EIO;
+		goto out;
+	}
+
 	if ((rc = get_UCSname(&dname, dentry)))
 		goto out;
 
@@ -1135,13 +1149,33 @@ static int jfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 	}
 
 	if (S_ISDIR(old_ip->i_mode)) {
+		if ((new_ip || old_dir != new_dir) && old_dir->i_nlink < 3) {
+			jfs_error(old_dir->i_sb,
+				  "corrupt parent directory link count (%u)\n",
+				  old_dir->i_nlink);
+			rc = -EIO;
+			goto out3;
+		}
 		if (new_ip) {
 			if (!dtEmpty(new_ip)) {
 				rc = -ENOTEMPTY;
 				goto out3;
 			}
+			if (new_ip->i_nlink != 2) {
+				jfs_error(new_ip->i_sb,
+					  "corrupt target directory link count (%u)\n",
+					  new_ip->i_nlink);
+				rc = -EIO;
+				goto out3;
+			}
 		}
 	} else if (new_ip) {
+		if (!new_ip->i_nlink) {
+			jfs_error(new_ip->i_sb,
+				  "corrupt target inode link count (0)\n");
+			rc = -EIO;
+			goto out3;
+		}
 		IWRITE_LOCK(new_ip, RDWRLOCK_NORMAL);
 		/* Init inode for quota operations. */
 		rc = dquot_initialize(new_ip);
-- 
2.53.0

