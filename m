Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.43.8.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200686;
	b=MN3TM4dW1dUSK8tdT40/VuFL5nPicJ4BOusyBjizYkAPxkxp0rB1/kI7t85BMIWcuJ3e
	 IumiiXYSNV21vk6d09VxvenQlZLPYz0IFPSKxgJEdp6vO9D8TqLqdsJTZHNuTRoTq44p/
	 K9l2CBtvD493dV8zVtm5TppFLnzoYl1sdFMrU+2HZQChby1KZPL0xmYkA0qZzm0zb7zEr
	 G24mh7FqqPs5jpuc28bgMlDae1vY0uDvL6CnPm5E0Ct9LQ/m4HeV5Wm65VO9NbBThsefg
	 QRXybqcdIJd8VVq8Jick/8vNxNaEkZytIRv+IF1X7g4iFBXvinpGOcjMEjhwUDZlrgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200686;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-Spam;
	bh=f0NPUJ892xaj0+0KhMNZGFUOB30Dh3J4cZ6PGJ5pzlo=;
	b=bpLByFQ5M3EMmzi0SX4ent4dAM5CKmQC4yyisI/RjOkiX6AX+lpHhOYMZQ4s9njrnMp+
	 by6WrqYPuEQED6J0YRVJBNUqywgMx2As98xiywxqCCBEIa9NBc1I0nxk1P8jXqvbz84au
	 S5zBSUgSX6vj88p9HCMG0Enf0Rz02FDa0vzosuMtf2QSxTGh/BCQ0FqxcTcP79jxZNKsz
	 rkYnlv8YPeieaL5fSk53Zr3hj6KV1QRBoz0Yd96OlC6gy12VSCS4nC0B/mE0lEckHFdbz
	 fhBavBOmlR1IFUYxpt123LbxJ80r3WOSlk8unVZne9zGSxKJDGwcFTU3DAE4MnaQs1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=altlinux.org;
	spf=pass smtp.mailfrom=altlinux.org;
	arc=none smtp.remote-ip=193.43.8.18
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2860A260C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C2860A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 870EF2337B;
	Fri, 20 Nov 2026 21:51:23 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] dm-verity: give each FEC buffer slab cache a unique name
Date: Fri, 20 Nov 2026 21:51:23 +0300
Message-ID: <20261120185123.614550-1-kovalev@altlinux.org>
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
X-Spam: Yes

verity_fec_ctr() creates a slab cache for the FEC buffers of every
verity target that uses FEC, always under the name
"dm_verity_fec_buffers". With CONFIG_DEBUG_VM=y, as soon as two such
targets exist at the same time, for example two FEC-enabled devices or
a table reload of one, the second kmem_cache_create() trips the
duplicate name check:

kmem_cache of name 'dm_verity_fec_buffers' already exists
WARNING: mm/slab_common.c:111 at kmem_cache_sanity_check mm/slab_common.c:111 [inline], CPU#2: syz.1.18/4545
WARNING: mm/slab_common.c:111 at __kmem_cache_create_args+0xab/0x450 mm/slab_common.c:352, CPU#2: syz.1.18/4545
Modules linked in:
CPU: 2 UID: 0 PID: 4545 Comm: syz.1.18 Not tainted 7.4.0-rc1-next-20261104-alt-syz-box-drivers_md_bcache #1 PREEMPT(lazy)
RIP: 0010:kmem_cache_sanity_check mm/slab_common.c:111 [inline]
RIP: 0010:__kmem_cache_create_args+0xae/0x450 mm/slab_common.c:352
Call Trace:
 <TASK>
 __kmem_cache_create include/linux/slab.h:402 [inline]
 verity_fec_ctr+0x9eb/0x1070 drivers/md/dm-verity-fec.c:709
 verity_ctr+0x1a6a/0x1ed0 drivers/md/dm-verity-target.c:1650
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
RIP: 0033:0x00007f213c87a829
 </TASK>

The buffer size depends on the number of RS roots of each target, so a
single cache can't be created at module init. Append a unique sequence
number to the name, as dm-bufio does. The slab core copies the name, so
a stack buffer is enough.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 4c39529663b9 ("slab: Warn on duplicate cache names when DEBUG_VM=y")
Cc: stable@vger.kernel.org
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
With panic_on_warn the warning panics the kernel.

 drivers/md/dm-verity-fec.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-verity-fec.c b/drivers/md/dm-verity-fec.c
index c79f60df3a90..dfe44f25a5eb 100644
--- a/drivers/md/dm-verity-fec.c
+++ b/drivers/md/dm-verity-fec.c
@@ -594,6 +594,8 @@ int verity_fec_ctr(struct dm_verity *v)
 	struct dm_target *ti = v->ti;
 	u64 hash_blocks;
 	int ret;
+	char cache_name[64];
+	static atomic_t seqno = ATOMIC_INIT(0);
 
 	if (!verity_fec_is_enabled(v)) {
 		verity_fec_dtr(v);
@@ -706,7 +708,9 @@ int verity_fec_ctr(struct dm_verity *v)
 		return ret;
 	}
 
-	f->cache = kmem_cache_create("dm_verity_fec_buffers",
+	snprintf(cache_name, sizeof(cache_name), "dm_verity_fec_buffers-%d",
+		 atomic_inc_return(&seqno));
+	f->cache = kmem_cache_create(cache_name,
 				     f->rs_k << DM_VERITY_FEC_BUF_RS_BITS,
 				     0, 0, NULL);
 	if (!f->cache) {
-- 
2.50.1

