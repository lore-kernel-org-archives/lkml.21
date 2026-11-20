Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.43.8.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200559;
	b=saz02cFfB6N4VNkr8MZNMWcVc/punZBelX10qifT28F5ClICYo2uMBbShRJSAI7ltHd7
	 LZOmrpvaPJotg/XOeyW/1BMvE6vJjiClO/VwjBsTSxNhkMlWcvojq4eJi1u8bA0HsRbiO
	 SH3j57Dp4VsAclrA/e8lTfHbp9l3UIryRW81Ud2PecS7auQxTQkdSPTEl8JKXDEc6r5be
	 1FsNEl5CHL5bR/bOJgYYF8B3UQqQxkvJ1F62GRc0Oz+s+616magDcxXqrezOQSZb7Oz/8
	 ncCKpyb5lCSNaRtkUT85ADHEBE7+e4y/afIDBE/RP0YE+Qc+bz6DVCYux/J5X47OEAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200559;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-Spam;
	bh=x8H2tKO0C0PdsM1jNymnO3uaSjF7/flYmxM47M7+lu4=;
	b=yRvD9w+7GYQyx+f3vrsxDX0H04w8dsrpdJ7vpy0cCItmC2mQg2aSx7ofVHpy7aNql8/7
	 qifNP6i5h1mrpIUlNsgzpXrH0YsyIWnmzkGe88vZTGS/wf2j6u12yEI7rWp7nWwzRGxmg
	 QNe6U1ytr29411wMy14gboOT4jER5kz9+h4dVrLVqmWgmkDiYD5cuznVfRaTESrMQkH1e
	 84plwL9+ESlKdw6uEPGHoMTtW9lhoi4VbTik1XdsL7mmkUhYS9mKbOQJ36wGlj+fwUHOo
	 LpC11bLZKLnDxXqVO7Kmbj/AOfbjZ3vfvByK0hRG0j7XmRX/4MkF4Wmcoay/GwAX9iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=altlinux.org;
	spf=pass smtp.mailfrom=altlinux.org;
	arc=none smtp.remote-ip=193.43.8.18
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C8360A2615
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C8360A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
	(Authenticated sender: kovalevvv)
	by air.basealt.ru (Postfix) with ESMTPSA id 184BD23372;
	Fri, 20 Nov 2026 21:49:09 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	kovalev@altlinux.org
Subject: [PATCH] dm-unstripe: terminate the status string for STATUSTYPE_INFO
Date: Fri, 20 Nov 2026 21:49:08 +0300
Message-ID: <20261120184908.614271-1-kovalev@altlinux.org>
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

unstripe_status() writes nothing to the result buffer for
STATUSTYPE_INFO. retrieve_status() then runs strlen() on that buffer,
which still holds whatever the caller passed in the ioctl payload. If
the payload contains no NUL byte, strlen() runs past the end of the
kernel copy of the ioctl buffer:

BUG: KASAN: slab-out-of-bounds in strlen+0x8f/0xa0 lib/string.c:402
Read of size 1 at addr ffff888109690566 by task syz.1.18/1420

CPU: 0 UID: 0 PID: 1420 Comm: syz.1.18 Not tainted 7.4.0-rc1-next-20261104-alt-syz-box-drivers_md_bcache #1 PREEMPT(lazy)
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xc2/0x120 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xce/0x640 mm/kasan/report.c:482
 kasan_report+0xdc/0x110 mm/kasan/report.c:595
 strlen+0x8f/0xa0 lib/string.c:402
 __fortify_strlen include/linux/fortify-string.h:218 [inline]
 retrieve_status+0x483/0x8c0 drivers/md/dm-ioctl.c:1442
 dev_wait+0x1ba/0x210 drivers/md/dm-ioctl.c:1496
 ctl_ioctl+0x4d2/0xd70 drivers/md/dm-ioctl.c:2221
 dm_ctl_ioctl+0x1e/0x30 drivers/md/dm-ioctl.c:2243
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18a/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x112/0x630 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f6a853ea829
 </TASK>

retrieve_status() then also reports a data_size past the end of the
payload, and ctl_ioctl() copies the bytes behind it back to userspace.
The same happens with DM_TABLE_STATUS.

Other targets emit at least an empty string here; do the same as for
STATUSTYPE_IMA.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: 18a5bf270532 ("dm: add unstriped target")
Cc: stable@vger.kernel.org
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 drivers/md/dm-unstripe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm-unstripe.c b/drivers/md/dm-unstripe.c
index 770a9958def0..708640a8f6d4 100644
--- a/drivers/md/dm-unstripe.c
+++ b/drivers/md/dm-unstripe.c
@@ -150,6 +150,7 @@ static void unstripe_status(struct dm_target *ti, status_type_t type,
 
 	switch (type) {
 	case STATUSTYPE_INFO:
+		*result = '\0';
 		break;
 
 	case STATUSTYPE_TABLE:
-- 
2.50.1

