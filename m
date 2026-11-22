Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795377546;
	b=gSSoVurrZiddHFM+GN5A63meZLM05uggJ7IHXu5ycoS0Ll9GXDVcfBNqZQwyi2wf8zsO
	 MHFNuKL/rKaMpMq2Zq0dRPBxfNwsm9zvtEoJwpmQUuvKrqexVDnhh+rRoHtRqlkiNTbLn
	 lZ7712ZW24Wgtg2f7jOHE7wEcOI9hPYcF8I4sU72vo3p4Y8OIf2wXMWzD6+l0ejfm7F4l
	 2yRsbQmj808I7yzOUYlooZwCrzzi1deOTGW2CGA1N6TmyfPvLJhRqViM97DAycb/bdQqb
	 4+zHqUCJKE7m/oTzxeqeo5rg80x3HGrTWSLfSjsNdrQQ717nzHU8wLVfoFO2FYXQldw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9486t8MDZh9CRWIIRPLLQLKLk1aMMjjsLJKjWbdp8Do=;
	b=eJbXMtvRO/9Bu6pH1ZxRoggOMhptwItFJhiPti/4V7we+4RjJfC1ixp0dO+EhovPaLe6
	 YoXDxrGUI5qmJzw6SW6YDxMrRlm/fZioWmQdjheQTHxS7ZU5d+DTHwjU24N4LEf/FsxtT
	 90E+gANXBek5p2ogyZpqR6MxGTZ6vdU6/qLIu3/D1/VU+fO19OxizOFZi/b9S2lBMUuTw
	 hubikV8H24dihg/lo2uQ2wYsHD6+SiOA+EnfYPwCaGkKmnjr4D8N5OLZRZ/a4XM41grvP
	 xVkPrupZ4mxQRH1pLJFC0bo9sLmysF5SniJ6xUf4jAy5tysS5XxGQ5psR6jSjYzEC1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkPD0MQq;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5322D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5322D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NkPD0MQq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so10235985e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795377545; x=1795982345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9486t8MDZh9CRWIIRPLLQLKLk1aMMjjsLJKjWbdp8Do=;
        b=NkPD0MQq6shm1P6WXzCt9PBbua/tZdJvjpcery2bsGBOJ0EvWPvyi/7EOaS7A2Ajbc
         p980qjvF3+xj3MGa6vobnV9thburPoRiImDLxDCcsoROrSrTzQU3J3NncteuWCJZ+9XM
         TEST2Dsr/1wqCjHT+aci5RXhwxRtGwe19S+ZZNpgH4iWtTaWv5O2L9JWLIrdb30IScIy
         ecEIWOGbX2iECi+rQBBnHvI6MriNC5PuNIaemx/k3nXuTr8NF+tCDHf4ig8fSLB0VICt
         aXaxkxkw/JBjD7hpnF3PeuI1fgZavehgZpti7qxhTsjiLtahqj5UUpq2LkwIZWe0mAWj
         lNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377545; x=1795982345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9486t8MDZh9CRWIIRPLLQLKLk1aMMjjsLJKjWbdp8Do=;
        b=kwxj9GiHwhAN8nvPX4hrfATmCJisaH3E68q2u7MHpR5GCtb8i7ebz1VkAf/8LX0Cpy
         3pdSOxZ3NpeSvTr7yGHh7/q94tmsueK0AAukNmD04NztCVy5K92QoB8E8FLbMdWfll91
         LggLaTMuaW7RFPV9FqqjbNuQ1PdqtB8En1l0kef3qUsBmubT8kDX7EYQywFmXOV7XaD7
         kBi6Y0vFJe/670dU4cCSADZ7dgER10EYvskTTe/Wu78LCrQZCWQyLyWsO8LOpkEwzsC2
         taXXomMYDMOPdE3+PxGr0lAIfL2qtSZOM4IvrOb/VN40+sR7LilD/DxLITMkFEv4mxX7
         qaXQ==
X-Forwarded-Encrypted: i=1; AL+hErEvu54faWdq/G9DSMtzkC0p6W3Lf/SI4f9u7oJ4o7MwQvd0xMRgd2ohMDFOqpWXMnv5TO/z1iPQJAHoONc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DSkfS/6V1gvTPa0Vb4wfxMBggZrJ8WR9WQebaulzCuzedUphP
	UJ7sRMG1p4TX1vQG2qnBZJiakCLd6zY81oBQIm0r3CCExNMDm/veMqhL
X-Gm-Gg: AZFdTZfJQkEsI9XekFeMlJlCeDvYMzob09sbRp1uX825/e7+EKBnOj42CcyYUtvKtnI
	gEZbtkeFWme3+s/HgWnGyU9uvtzfYcFSoQvKPcRKa3bnLBqCX25YrbcI/iOxLVyoegvkshFZAQF
	2MprE2oXWf3CbuPC9rCLI/OCRenHtE2ocKdfzwxmw7Mzz31CLXaChw6gZYdJ+RgK+0P5Q4QPql5
	u6jfrkBDlkThyjWbhvkhKDz4/rpERIwZ/HHPocAgA3PsnYrsBoYz87BB5woTg9ddKLPMf5NtCrl
	WGdPL0ztqfhlfjgkKrn7h0JzWnLSUQ1PQSEm9kAD3OrEnQQ7TQyIK/jap9tkyV1zn1H70en1ORq
	K2XZP69hmiISsihRKFGqP42FmzVgYWAoYCbzq1GBsLSnm6oifDq0kaA8quMpQbdBt3fuAft5Rsj
	cAFzY+lA/6KTNbTt25k4BRukUEwuWWEdJ21LDVdQsqhn8CQ6qgXlRAsW9yZf7KAZN7nAyHF0w6c
	sKmYQjD1YYKOPh4Azziib0yCCUAIzagKhYnEDRBlWlvDaxefegNyxpVFgQcrFOpXjPtgs9yaxRZ
	z0ctPVCD0i1gVwrOOFr59fqidmR1BPJEkA+ddCAu3OZGzfoGeOP6n38GCjuSb88EY6D/HW+HE/D
	uBw==
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4bb8882375cmr203166315e9.32.1795377544621;
        Sun, 22 Nov 2026 11:59:04 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([103.125.177.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm536568555e9.4.2026.11.22.11.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:59:04 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+d7ffeb5538fe5c793f74@syzkaller.appspotmail.com,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH] jfs: handle NULL folio->mapping in metapage_write_one() and release_metapage()
Date: Mon, 23 Nov 2026 00:57:58 +0500
Message-ID: <20261122195758.32692-2-arbabhaider649@gmail.com>
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

syzbot reported a NULL pointer dereference in metapage_write_folio()
called from metapage_write_one() during lazy commit teardown:

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  RIP: 0010:metapage_write_folio+0xa7/0xcf0 fs/jfs/jfs_metapage.c:428
  Call Trace:
   metapage_write_one+0x2c8/0x520 fs/jfs/jfs_metapage.c:818
   release_metapage+0x5b9/0xab0 fs/jfs/jfs_metapage.c:884
   txUnlock+0x509/0xdc0 fs/jfs/jfs_txnmgr.c:948
   jfs_lazycommit+0x52c/0xa10 fs/jfs/jfs_txnmgr.c:2734

During unmount or inode eviction, truncate_inode_pages_final() can
remove a folio from its address_space (setting folio->mapping to NULL)
while jfsCommit still holds a reference to a dirty metapage on that
folio.  When jfsCommit subsequently runs txUnlock() -> release_metapage():

1. If META_sync is set, metapage_write_one() proceeds with a NULL
   mapping and calls metapage_write_folio(), which dereferences
   folio->mapping->host (and filemap_check_errors(mapping) would also
   dereference NULL).
2. If META_dirty is set without META_sync, folio_mark_dirty() is a
   no-op on an unmapped folio, leaving META_dirty set and the metapage
   stranded on log->synclist; drop_metapage() then skips freeing it and
   jfs_flush_journal() stalls waiting for log->synclist to empty.

Fix both paths under the folio lock:
- In metapage_write_one(), if !mapping, clear META_dirty and call
  remove_from_logsync() on any attached metapages, clear the folio
  dirty state, unlock the folio, and return 0.
- In release_metapage(), if META_dirty is set on an unmapped folio,
  clear META_dirty and META_sync and remove the metapage from logsync
  so drop_metapage() can release it cleanly.

Tested locally in QEMU (x86_64, 4 CPUs, KASAN+UBSAN) using syzbot's C
reproducer with per-iteration mount namespaces: crashed in <1s before
the patch, and completed 56 mount/remount/unmount iterations in 15s
with zero hangs, KASAN, Oops, or synclist warnings after the patch.

Reported-by: syzbot+d7ffeb5538fe5c793f74@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d7ffeb5538fe5c793f74
Fixes: 35474d52c605 ("jfs: Convert metapage_writepage to metapage_write_folio")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 fs/jfs/jfs_metapage.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_metapage.c b/fs/jfs/jfs_metapage.c
index 41fe12e64..9df810c97 100644
--- a/fs/jfs/jfs_metapage.c
+++ b/fs/jfs/jfs_metapage.c
@@ -812,6 +812,23 @@ static int metapage_write_one(struct folio *folio)
 
 	BUG_ON(!folio_test_locked(folio));
 
+	if (unlikely(!mapping)) {
+		struct metapage *mp;
+		unsigned int offset;
+
+		for (offset = 0; offset < PAGE_SIZE; offset += PSIZE) {
+			mp = folio_to_mp(folio, offset);
+			if (!mp)
+				continue;
+			clear_bit(META_dirty, &mp->flag);
+			if (mp->lsn)
+				remove_from_logsync(mp);
+		}
+		folio_clear_dirty_for_io(folio);
+		folio_unlock(folio);
+		return 0;
+	}
+
 	folio_wait_writeback(folio);
 
 	if (folio_clear_dirty_for_io(folio)) {
@@ -879,12 +896,19 @@ void release_metapage(struct metapage * mp)
 	}
 
 	if (test_bit(META_dirty, &mp->flag)) {
-		folio_mark_dirty(folio);
-		if (test_bit(META_sync, &mp->flag)) {
+		if (unlikely(!folio->mapping)) {
+			clear_bit(META_dirty, &mp->flag);
 			clear_bit(META_sync, &mp->flag);
-			if (metapage_write_one(folio))
-				jfs_error(mp->sb, "metapage_write_one() failed\n");
-			folio_lock(folio);
+			if (mp->lsn)
+				remove_from_logsync(mp);
+		} else {
+			folio_mark_dirty(folio);
+			if (test_bit(META_sync, &mp->flag)) {
+				clear_bit(META_sync, &mp->flag);
+				if (metapage_write_one(folio))
+					jfs_error(mp->sb, "metapage_write_one() failed\n");
+				folio_lock(folio);
+			}
 		}
 	} else if (mp->lsn)	/* discard_metapage doesn't remove it */
 		remove_from_logsync(mp);
-- 
2.53.0

