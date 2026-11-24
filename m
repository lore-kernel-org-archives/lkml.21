Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550084;
	b=C2T8jYmiUVwgBqRFUNDpSyQcCjiFnpEKaObQKUZZA2ERdvzylQH+6rDaE1SmCIVLt8Hd
	 jJz4iakGq+WkjUEOLmDjBbHNdVa0YSXVk0iruBHK6wUwufAxAY9m4XpgVFNGJwhQPQgqb
	 /OW5IalpOGbxRlFiqBKGHFefdqnT47drE/qB9vhM+lXo3EZN4y1hbNojizRTiYFzqKFMH
	 0H9uYzh+qIfd8DsFezogQUxCsHhy1nvoagQ9huZQrdsVPncWgR1VvR5LalsNf6XE18Mih
	 67zPp8asH/FxiLnvi6yX27QeuAduLT9q9YiyEQbywP8kfI+O7dBcG3yz2+d3tIcD2BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CMRL7IAFTXqZ9ddm2mkT9rLkzrVp3O3yLJXKdJzaMHw=;
	b=zOeXoQaLxvBBoU251WnGxKejWgG/X1VgVsCOlg7MOZ0la9r6vwJ4EEoyHObDX2p+q7kE
	 jHZj1J2Od0/UsBS2arpPMIVpFwrEcBA+oxYnHm+ZVD/Y9Jn12bG4EWJNGUI27nswAhMri
	 JwMtRUjSvqZq1tmM8Hpfgo+1GoiqpH/Hq9ZN9FOFh0wP1UUM/USxSsVJ/fqnZsGy71tFc
	 Ne0bdW3i4UCo8oP3Msfmv87xJgDCy+j4izAVPaSYeBDnhIesmxRaECKREQLcs7SJmBBTn
	 lV9t17NxBO0Hjgf67yLXQcec7RUPjnuGaXLrJxRPa4GshE7FnE/t/5AsS0t/3/JoTwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HwF08vE8;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA57606A333
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA57606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HwF08vE8
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a357b1c649so2919991f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1795550082; x=1796154882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMRL7IAFTXqZ9ddm2mkT9rLkzrVp3O3yLJXKdJzaMHw=;
        b=HwF08vE8pTntd6ebrHbTMoSPpoWYr18xwDyN09ucSsKYQAsnMjh5JfMToykcXZTLWb
         fq8FxhScBcP9Fyj7wc6yq/GnqCTxqEzu9ke3XMel0xx4fo3VgJvHxAm4LivZK5srCgXU
         bLpyyl2zZ7j1RRJUneUQuyRJeN5c067KX9YOtgnsBU0/gKmoDC4aOjlDXbQcaWGlCyWh
         hjsIqolz+TOYnPlKLN6X77d65g3YKloMIeyQ2w9rZI8sYTT5kAODBi62DEKTuLowOJJn
         utILCQNfu5pQgRMoHfVWyoiefQNEG4VoKJnjQQqbuJbpgukWgeaJjbWOfCWKyRmL2alA
         4Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550082; x=1796154882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMRL7IAFTXqZ9ddm2mkT9rLkzrVp3O3yLJXKdJzaMHw=;
        b=PzLBU3MN5n8Oh4Ul9NRgHFvfqLCBfL1PUkbOOvIH7wDtbaBCiVDz3K0EEdJeOKl0zG
         pguYTi/JpNFQBt3KT6v2Ih0JuYnqr7kNSn+VGe3UUp4ZFMT1LxylvnHjt6VYbcTeyKiW
         NEJ5Z8abq2NcCAiAbbaPhx+K3t63zgjY7exlO0ua5qxcHoCYLtA+N05UU2sbO4JXKmcy
         LxuwHYP+lab+ia+4VTEhiKQJ9LYuK0O0Btn8myzy+gE1k/mCIiVssbTWxYwHJIAGCMJ6
         ovjtFnjJww3bDw/XWrAM/UIeLnPDXQot4A6fzfkdXdLqLDyRK/CC1CChGn4xDeHE7MUC
         wuoA==
X-Forwarded-Encrypted: i=1; AL+hErGMV/qtUyxMtclBtAViXXFEQc5E8pc17zykkIb2olHo0VBnRletyvuNJnuIRp5ncdgH7j+q7cVKQdDjONQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J22TBRZODJPvBBonm53MFHeFcCm+tNHpyY/6mOew14Msl0E0v
	p4r6MZXiLCv8feQ8cp6sA+oUTkJrI5PCkYmm9q30OyVHMIYwsOyinfz0X6Stvf25DZ08
X-Gm-Gg: AZFdTZfdUfxk3fCdrhGvG1edQ6GHmlHsG4SNusHc/7JFxZnO9unVd70MZaKHxrCKYud
	wpHXRZ+dPr9zFoXyTE1vydU+yCP1HUGpiUCjSpt0/zDXUAzsnc6phTKncmhkOvGNv+6+PAfg2IT
	n+bOJEXcQ3lrXt55l3khf/RhggNOAy8pkQ2byn+/GOAMqSE3PrWDXYXVef8usdG5M07+pveHRvN
	IfWFM8VneKugAGWGkoyHPD13ZK3FcdnnFHIBLA/Ub9lTlX9uo/TwoyaiWGLYUHXp01/Cn5Jy2qE
	I5pdiVTVHYy9l7YBdlySr9fMkSdXV54Wlj3l1NBqAEDeyMycJW0Nc1yU7rPbiHD/DNu7ZII8bEA
	rzNDOdwVz2macZEhVZ73dsvCQTjz+DmxUJT/tpo9UV0CpRX0DDK3BSULs/2mQ5OhmOdP1DeiYBU
	6kjfXbLnPlO9OEIZU1tLv4hoJDOFFWaHBsoQAKhgFN845zXOfmjKUiAsnx6Ile70kSIiJ8fSvLM
	D3q3V8qD0s0bjq29iIStVHfnxLEHeoQHIgfyuExPykyRfaGsHU+X0dKW7W3lVOOFWks/DLm2EiI
	P6MhE9951dAV2kcsOnb0Io6P+0agu/fKKYUbKfg0IvsQ4v6L7riSzolcdHklLM1EQOC32tw3NkK
	O7+uaG4YUse3KZGY1mfGTIFHOl3f1XAhgYJGy
X-Received: by 2002:a05:6000:2dc5:b0:4b3:71c7:42bb with SMTP id ffacd0b85a97d-4b371c74483mr14127763f8f.19.1795550082102;
        Tue, 24 Nov 2026 11:54:42 -0800 (PST)
Received: from alex-t14g7.lan (p200300cf572c2800fb4fa6aa0455ce36.dip0.t-ipconnect.de. [2003:cf:572c:2800:fb4f:a6aa:455:ce36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm30622222f8f.53.2026.11.24.11.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:54:41 -0800 (PST)
From: Alexander Mikhalitsyn <alex@amutable.com>
To: code@tyhicks.com
Cc: brauner@kernel.org,
	ecryptfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>,
	Jan Kara <jack@suse.cz>,
	Seth Forshee <sforshee@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ecryptfs: release inode on error path in ecryptfs_lookup_interpose
Date: Tue, 24 Nov 2026 20:54:29 +0100
Message-ID: <20261124195430.105522-1-alex@amutable.com>
X-Mailer: git-send-email 2.47.3
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

Currently, when ecryptfs_i_size_read() fails we only do make_bad_inode()
which only removes the inode from a hash. So it's not getting released
and on umount we get "VFS: Busy inodes after unmount of ecryptfs" (see below).

Let's fix it by using iget_failed() when inode is I_NEW and iput() when it's not.

This was accidentally found while working on SB_I_PSEUDO fix.

------------[ cut here ]------------
VFS: Busy inodes after unmount of ecryptfs (ecryptfs)
WARNING: fs/super.c:731 at generic_shutdown_super+0x117/0x1a0, CPU#11: umount/402
Modules linked in:
CPU: 11 UID: 0 PID: 402 Comm: umount Not tainted 7.4.0-rc1-virtme #9 PREEMPT(lazy)
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:generic_shutdown_super+0x125/0x1a0
Code: 5d 5d c3 cc cc cc cc e8 19 d0 f3 ff 48 8b bb 18 01 00 00 eb d7 48 8d 3d a9 93 d1 01 48 8b 43 50 48 8d b3 d8 03 00 00 48 8b 10 <67> 48 0f b9 3a 4c 8d ab 40 05 00 00 4c 89 ef e8 17 6c b0 00 48 8b
RSP: 0018:ffffccc0406bbcf8 EFLAGS: 00010283
RAX: ffffffff87d54a20 RBX: ffff8a7bc2358800 RCX: 00000000000000b5
RDX: ffffffff873e7853 RSI: ffff8a7bc2358bd8 RDI: ffffffff87e52550
RBP: ffffccc0406bbd10 R08: ffff8a7bc235d408 R09: fffff12a00000000
R10: ffffccc0406bbcf0 R11: ffffffff87d209d8 R12: ffff8a7bc2358d48
R13: ffff8a7bc2388824 R14: 0000000000000000 R15: 0000000000000000
FS:  00007fd846e02840(0000) GS:ffff8a7c76af9000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd84716e8e0 CR3: 00000000037d8000 CR4: 0000000000350eb0
Call Trace:
 <TASK>
 kill_anon_super+0x1c/0x80
 ecryptfs_kill_block_super+0x1a/0x50
 deactivate_locked_super+0x39/0xc0
 deactivate_super+0x47/0x60
 cleanup_mnt+0x3b/0x80
 __cleanup_mnt+0x16/0x20
 task_work_run+0x64/0x90
 exit_to_user_mode_loop+0x177/0x570
 do_syscall_64+0x352/0x410
 ? up_read+0x1f/0xe0
 ? schedule+0x27/0xb0
 ? schedule+0x27/0xb0
 ? schedule+0x27/0xb0
 ? trace_preempt_on+0x28/0x80
 ? schedule+0x38/0xb0
 ? preempt_count_sub+0x4d/0x70
 ? irqentry_exit+0x2e1/0x700
 ? exc_page_fault+0x8d/0x170
 ? do_syscall_64+0x33/0x410
 entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7fd84705c1d7
Code: 0d 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 09 3c 0d 00 f7 d8 64 89 02 b8
RSP: 002b:00007ffd3839fae8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 000055b7f819dbf8 RCX: 00007fd84705c1d7
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055b7f819df30
RBP: 0000000000000000 R08: 00007ffd3839e8d0 R09: 00000000ffffffff
R10: 0000000000000103 R11: 0000000000000246 R12: 00007fd8471ba26c
R13: 000055b7f819df30 R14: 0000000000000000 R15: 000055b7f819daf0
 </TASK>
---[ end trace 0000000000000000 ]---

Fixes: 3b06b3ebf441 ("eCryptfs: Fix new inode race condition")
Signed-off-by: Alexander Mikhalitsyn <alex@amutable.com>
---
 fs/ecryptfs/inode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 48e520960d66..3a966348a578 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -362,7 +362,10 @@ static struct dentry *ecryptfs_lookup_interpose(struct dentry *dentry,
 	if (S_ISREG(inode->i_mode)) {
 		rc = ecryptfs_i_size_read(dentry, inode);
 		if (rc) {
-			make_bad_inode(inode);
+			if (inode_state_read_once(inode) & I_NEW)
+				iget_failed(inode);
+			else
+				iput(inode);
 			return ERR_PTR(rc);
 		}
 	}
-- 
2.47.3

