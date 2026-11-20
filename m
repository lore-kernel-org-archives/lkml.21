Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.43.8.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200644;
	b=mJPuNs8CPTV+Kbzd+q1Ycg1jH3+nlNTnBF6qSpSLe/oRT1jcJYuH2k2WLtAAgyU5RGSD
	 IOGVGb8LKBT9X+xVlSWW+5HxbAvMLxzZvo4e2AFKUknR2bLFH5GQ6FqYN23YRqLR+cY/X
	 y8r+OU46J6q03wQUtMet11QmuI17iYHpJMjkiI8p5jPRp3Wx2bFdhzTNskTu/IMAy5807
	 TrL/1UmvMzYzRagyoiFZxzdZaGmMkciFmsHQEF+r/EBVjiJINMOrucF395MsF3u8bYuXC
	 eg6SU6larCgo/kjgYMod0YgeZo7bMY/2zsOEgf5MbLg5ZdChQ7dPHI7o4dLebeltHTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200644;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6N+EXJI4Dy+T2ZX1vwniFs2XRa31yIRuqEE8O0WaxGw=;
	b=rsuJ+XzLabOq1KkigTN1ENdJlvn/P7ZSBASyDqBEF2cuQEe7FtVNLAaxHpPvKv3crX4+
	 IaP3Fv0ke3Bu7J+AKhgMracCqGifZ0JIH0S9tpLOj9EFqP0/XTlRn5tK5As2xEyyks1HX
	 BvUVSdoQDhZ4U8w5MdckVbEWVHT2GffLzVinnP8MEnjDfxOP4fbwskP/vqz6H624q/jce
	 MlUWF56VDaqOMeQZRUX72DidL865tHZ1XQYvhkNd28U/sdv0SXYTP78v4XbLYIbhL0kwX
	 Hyu37gwISgwoys49+1i3ZxAfmp14ssz6ZL794M307VOExd0U4D2+w3je03FRu2V7T0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=altlinux.org;
	spf=pass smtp.mailfrom=altlinux.org;
	arc=none smtp.remote-ip=193.43.8.18
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3EC60A2629
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA3EC60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 2D3932337B;
	Fri, 20 Nov 2026 21:50:38 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] dm zoned: fix NULL pointer dereference in dmz_load_sb()
Date: Fri, 20 Nov 2026 21:50:37 +0300
Message-ID: <20261120185037.614445-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.50.1
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

When the primary super block is not valid, dmz_load_sb() searches for
the secondary one with dmz_lookup_secondary_sb(). If the search fails,
zmd->sb[1].dev is NULL, and the error is then reported with
dmz_dev_err(zmd->sb[1].dev, ...), which dereferences the device to
print its bdev:

device-mapper: zoned metadata: (ram0): Invalid meta magic (needed 0x445a4244, got 0x00000000)
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 2 UID: 0 PID: 1412 Comm: syz.1.17 Not tainted 7.4.0-rc1-next-20261104-alt-syz-box-drivers_md_bcache #1 PREEMPT(lazy)
RIP: 0010:dmz_load_sb drivers/md/dm-zoned-metadata.c:1259 [inline]
RIP: 0010:dmz_ctr_metadata+0x2389/0x4a20 drivers/md/dm-zoned-metadata.c:2897
Call Trace:
 <TASK>
 dmz_ctr+0xb53/0x1df0 drivers/md/dm-zoned-target.c:873
 dm_table_add_target+0x7c2/0xf30 drivers/md/dm-table.c:749
 populate_table drivers/md/dm-ioctl.c:1602 [inline]
 table_load+0x38b/0x910 drivers/md/dm-ioctl.c:1645
 ctl_ioctl+0x4d2/0xd70 drivers/md/dm-ioctl.c:2221
 dm_ctl_ioctl+0x1e/0x30 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18a/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x630 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f443b88a829
 </TASK>

Loading a "zoned" table on top of devices that carry no dm-zoned
metadata is enough to trigger it.

The secondary super block always resides on the same device as the
primary one, so report the failure against zmd->sb[0].dev, which is
always set at this point.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 977ff73e6415 ("dm-zoned: remove the ->name field in struct dmz_dev")
Cc: stable@vger.kernel.org
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/md/dm-zoned-metadata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 094b63215882..f7aa04954d2f 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1256,7 +1256,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
 		ret = dmz_lookup_secondary_sb(zmd);
 
 	if (ret) {
-		dmz_dev_err(zmd->sb[1].dev, "Read secondary super block failed");
+		dmz_dev_err(zmd->sb[0].dev, "Read secondary super block failed");
 		return ret;
 	}
 
-- 
2.50.1

