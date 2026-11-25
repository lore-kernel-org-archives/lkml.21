Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592403;
	b=XlqF0CeOwNtNAT0NRZwAIPHEjmtqWWRKd2RZlisIDJhb9P48Mkq6QvNOYCkeHg+XE/3k
	 phZmjHl9CXgdkYIyPRt9MD61AwI8y3v1yi1O+GOou2+LdDAqnTwhcIaKJwb2tT9EdGnRv
	 bXSR9ZNTDNt8j4jS/ClhM6CQ9kW0VMW9F31EoAaKa+vq5RtmgtGoiacAJ1Phx1/PQkbNV
	 Vm0CVWxKwx25MIGzmZKOL2MpewP0beE94m+AO4pVtvSndROd3khCOHBmo917BykMp+UEk
	 hrgBffQYm29OqvfwrKEiP6tDlWViapYTRpRJ7YG4/8k9f9rxpp9ABd/xVrQwKF1ZueA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ibF4F7cNLXhO57E2X85h4/Efme6fANRGzvwJmw8UpCU=;
	b=FD/NBbANrJcsZqcbIKgql0lCl3ZctBFoESyqx2u7/cm27Bnhv4HwtNXyeAzqJILUrrL1
	 mIBVbY8L3hdSAP1GEJwGrwKIcohRxCXVurqphjF2Qj42XiFjKok3AQHcfT3r/ZWhfI69n
	 VZlGxByQ1ir1iVdSQcdPWFSZVJVZWvI+6x0rWtRDSjqZ5j9FnGktiSoGdZoim5zdQhlvm
	 3HXfFGaSIJ6HpnGRGAvE5jyFBGx5Xaqo+XTowXN43ahgEyB9owYMqAWunuAgQ2WjvdFB/
	 ZZnvsqanHOeUXjGbiaZtapa54y9tWguXsuG53PUN4l/qhEdTwUVLvKjwoi4Y87WBxAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yn8zhuGE;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344BD606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 344BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yn8zhuGE
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cde84cb8803so1328286a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592402; x=1796197202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibF4F7cNLXhO57E2X85h4/Efme6fANRGzvwJmw8UpCU=;
        b=yn8zhuGEiYOBs+G0CA5akukskDI+rIipDX81IBJVIiJLqm0RB5JOepNYCAY3KD1Cia
         4fBN0zx0wekfGGSTEW+QKdDKGXtSi9ti/u0TkXEi4BrQwY8Fkm6yqe3oi3rqEMqCO/Rw
         MQIt+Vz3OwRhDUZe52DAd1wuGOxrfr/Wsi2Av70x8mRMNN73LwV8Lc0zesjj1jNWiF4q
         rf4Eiyvx7ygsJNMYRdZmoK1xrBaqSsNrl60JXhPFOwIFkdG31ZJjAYSjkLaz/Ha41HLQ
         E2EQayf7WDcBxoVHWIo2w3VyKfzoosATZcqanM7XcXrYs7mZsM3lirIG40K/X+WiwFEr
         Z3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592402; x=1796197202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibF4F7cNLXhO57E2X85h4/Efme6fANRGzvwJmw8UpCU=;
        b=YioqnteFfiiaInCMU1lcED962etUNvp01Bms+xYWCw6Xsq1tDRM5TWBS/XP7j5jJuM
         Wm7Px8N/iNihjQiO5DLB/P2PG8gyA3WUJ2k1TYhOs3bYMN/ACYqjn7vpZNqCoeW4giP2
         hMYIhrXZRTqzaP8uNc/MP8Y+ndopZDMkMQMEaEA8dv2cj6tHYTT1sGDrKIzkyOd1VPYR
         5lD88uqwTW2vy1Yo+Zi7SYvsGHDF/89pxmtlynEyA09RxZI54wQ2mobvMdk/iNDNf4kG
         5td4sMuT53PnT5nkBeqIp38bwp1znrEKPKVHp8lRbhUmQTxzmW4uX+eCJzpXpBnVcoxG
         E5WA==
X-Forwarded-Encrypted: i=1; AL+hErHTbYUgN8yZwmMGgnMcWg0kr/qeEyMFOAPIOsyeZRvGmYotAgOm1DWeuP6mVzlnf8+l+NFJBxAF0C3f3is=@vger.kernel.org
X-Gm-Message-State: APuU4Z8t5jPlnRCySIdXudLX/2S8/X9KxZwjiynbBjNjf6RkXUtr2avk
	EFw5cDOEMR/wnGVo5k0KnHwJcsWcEa1vfMKx3YsRlHt7Xd5VZls3nxV8
X-Gm-Gg: AZFdTZd5wS4EMkQzxHJGKUSrzKNq6TxghU7zrDKCrykR7Zfe3huY6uI5/ZF6pDk1OUA
	y75MBLgLFcl6j6lKkGjQcJG3sg4cWEM/TKuyQYIjD67DhE5tUv3RzxPlq+5cBqszO3ylqlKm9y7
	9ZOVzKmqNiGlgpvCJgevnDlJt5ipm845q8u6RgraKWcQ1Ock/jz/yCFTGO+NX9KXEcHJg7TSdra
	ohkpidVHySIkKvL7aqXossv0GugPMwouHCZaEpD/qtDk9WPv4vQzLnVJHLhjeAnbQMaFXgtwwAT
	7HAtJh3IyB1h2Bra7O6etEhMfcEO3My1ahVi95pb0ARgmR3eOBDfT/9Lsp5ar8f9Gz+qZ/Aqnfl
	J4L9DGs0JBxmTPRmoDFeAJOEPowiGq/+/pbwgwiy71+pq1ytmv9HnyPaq6aTku7z+W1LiE58G29
	uBU4OsOFyOrRbbO8TOXQj45mu9urQeZ35Tt9uLDMLEVB8+/XRy+2HTIj/jeDBS+doDcmiKv0N0A
	1TpHkZcy4aCAsxEuHU3jw9jC/y3a6BIAFaq8b1tjS5rzFETFnC6LiGvZ91Fcao6wj0nx1h8y/pH
	aTQB5Jx/K3Ix2igfJcVVVrvLRP36jK6IKIkAMrb7I5m7Kg==
X-Received: by 2002:a17:90b:48d0:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b41c96cef8mr16857502a91.58.1795592402400;
        Tue, 24 Nov 2026 23:40:02 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm26773960a91.2.2026.11.24.23.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:40:01 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: yangguikun19@qq.com,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: don't BUG_ON an inconsistent node ino in roll-forward recovery
Date: Wed, 25 Nov 2026 15:39:56 +0800
Message-ID: <20261125073956.2927907-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

do_recover_data() asserts that the ino in the NAT entry of the node it
recovers into matches the ino in the footer of the fsynced node block.
Both are read from disk and nothing checks one against the other
before, so mounting an image with a wrong ino in that NAT entry hits
the f2fs_bug_on(): a kernel BUG with CONFIG_F2FS_CHECK_FS, and without
it a warning, after which the NAT ino is written into the footer of the
recovered node.

To reproduce, create a file, sync, write and fsync it, crash, and change
the ino of the file's entry in the NAT journal of the checkpoint pack.
The next mount gives:

  kernel BUG at fs/f2fs/recovery.c:698!

Fail the recovery with -EFSCORRUPTED instead, as the ofs_of_node check
right after it does.

Reported-by: Guikun Yang <yangguikun19@qq.com>
Closes: https://lore.kernel.org/all/tencent_5CEF90115E2715D386A8349FCA28D7D4D607@qq.com/
Cc: stable@vger.kernel.org
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Tested on f2fs/dev b61a029304bb with CONFIG_F2FS_CHECK_FS and KASAN.
With the ino of the victim's NAT journal entry changed from 4 to 5:

  unfixed  kernel BUG at fs/f2fs/recovery.c:698
  fixed    "Inconsistent ino_of_node, nid:4, ino:5, 4", recovery fails
           with -EFSCORRUPTED, the mount is retried without
           roll-forward and succeeds, and fsck.f2fs reports the same
           mismatch for nid 4

The unmodified image recovers the same way with and without the patch.

 fs/f2fs/recovery.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 54b5246609de..c92da18f553f 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -695,7 +695,14 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	if (err)
 		goto err;
 
-	f2fs_bug_on(sbi, ni.ino != ino_of_node(sbi, entry));
+	if (ni.ino != ino_of_node(sbi, entry)) {
+		f2fs_warn(sbi, "Inconsistent ino_of_node, nid:%u, ino:%u, %u",
+			  dn.nid, ni.ino, ino_of_node(sbi, entry));
+		err = -EFSCORRUPTED;
+		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
+		fserror_report_file_metadata(dn.inode, err, GFP_NOFS);
+		goto err;
+	}
 
 	if (ofs_of_node(sbi, dn.node_entry) != ofs_of_node(sbi, entry)) {
 		f2fs_warn(sbi, "Inconsistent ofs_of_node, ino:%llu, ofs:%u, %u",
-- 
2.43.0

