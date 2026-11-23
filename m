Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405451;
	b=IaP2rjNAX5Vbj7XuGd1O6jBU4q59Dk4gLXmegvGoL7yYZUQrOrWVjzSuDdKAFopAYYm3
	 YAOGobAwHzuP8d5NC+5cN7tgz2KG2B0bpi5bmrkWHFt9GtXk8uRuVMvTFUwn2F8O3Gvd/
	 fMSE+ccVIsMNK7+b8MAr5T8oVqGdpAM7L6N2Q8/q93wDDRjfSP3nb/JCbncY/o3dYGtjE
	 FB8UlC1qAePMChXPv6ANOghBfC3ALjrU/BP/J5GwJyp0iAkkoF48tnW/v4OBatUZR/iWM
	 hK1dCCxHoOTN9VN0LG6LKw1TqKlA6exQ1YWyZyrnsV24s47KfgqxnXnzL1etVDqFRvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405451;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=Tf25+vOP9zTNzY6gCBv/9IAPtFBcQO6viZrcwBE4HZI=;
	b=GuwwtpzpPnG4XCGaM8JLvrhttPgRKL29Ku902qneGakkkM6gvVFnmv9l5qG91wKLzErq
	 QiVoN+EYbQTRNKqvy1Q1Wdo27s91I/icj4bk89sBWTQ+ZNM/BLY8fO5EMEBnd02d4vLHe
	 Y+NMcO0SCV26g+WCJ5kLBkHrH/var0yimg7H/X+7ZEo6NmTkWCOtceiEaPX9ASzftnbix
	 sloDGOKGiXT2vocK3wFLulliyed3yCAsRyUe/ZnUQneiTwasAWrc5Q6OvisU6qxGih1RD
	 E0Ba3FXwav9WLjPP9tTdTUFpR+JK44JD0hg2ZbaPy8sOL6bOyktTpsfojzE31XmtpBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=sbUcuhdv;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=pBkYVlc3;
	arc=none smtp.remote-ip=92.204.81.42
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [92.204.81.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8B606A685
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B8B606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=sbUcuhdv;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=pBkYVlc3
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKyCxiqSR; Mon, 23 Nov 2026 03:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405437;
	bh=Tf25+vOP9zTNzY6gCBv/9IAPtFBcQO6viZrcwBE4HZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sbUcuhdvcV6ZTeMzrzLpbB2X94ZCiYwQGFISOP4kKRHPVY9w/yuxbPfYiNJx2pSvC
	 einJBPZ4vRT6nzE+geUZllP0Vb1i+G6MfLJ6lc1Err+rCaPpS7ERqMsXayRpJ0+lDW
	 lHjmV2r6eJtsXOYe2Y2Ths70QG/pgU+ma9UykTzKdaCBKLo6HmjW7YY/bO+AJwba6Q
	 6Wc/XrhKAHcZw2tIAOPOiWGA9VkI2LJd/ChN5EAOd15Ou1OlhX9/Wnm9zO8addjHnG
	 +nVvM3KaDZ79V0ouZ6t2xNtOVuYBYl3jN/t4WbWmPRt5d/MbrIezg9PBgRuXUT2kEU
	 gNLVai1yoGwBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405437;
	bh=Tf25+vOP9zTNzY6gCBv/9IAPtFBcQO6viZrcwBE4HZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=pBkYVlc3mqzaLuSKuc2JsYcH915aF6pbWWcQnNkTtw1ILyBXDWih20185owJpue30
	 ZL0olhQKSChOpos0opXq4/6tXP0iSdc2iNWYybqvHeaUNXocIS1S/bsaLCNGbw1wvk
	 mG8i1tTuwmvr9wrlyEswUoTJ6fQ7WeaL3RIrQBOkfJPlWI1cPdmwq4NsiRAhEK0h0h
	 JwwlVaGxd+4HJFZctKKVFhdcJMMLIy/ePKq1mwVRF7zRp4PFLL4EiwjKUFNhrfgBps
	 p0nXGtc6NLAuoUgZkqgCktwy7Od8WvamGLYlQPATjnaXUHeWtdDX4gOv/ISBbeAw8v
	 UdDhGuM6q81Gg==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b67d
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=7Zd2xgau2SnrXiwuqnEA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 3ae6d76fc3429529ec9b8234611d3c94:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 22/23] Squashfs: fix regression in squashfs_copy_cache()
Date: Mon, 23 Nov 2026 03:43:03 +0000
Message-ID: <20261123034304.261742-23-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123034304.261742-1-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfBWod+1746wUGuRH+eU5QaVSJhbfZRwutRCCB5McylpnTtaKHV+S1HdoS0hyU+xELpFrIHYBUXV6t6RJ0djdnzG/quLfrAQ5UoULODICktZYjWHBpvIo
 BobM1Hrzv8kLLzzTUZJUZJfN/MhSw7mJkn++e/D3WE33ApkY/15VN+tfbPIudxL7BRTLoWi4XTAlMPFa9Hp9X/T1miXM6l9pMxrlFToEQ6PStWwG4223IeR7
 lcGM1jGFAS7p6f6YvGRBtaPjdoMIzpPWXYCxRiI+OLJVLRW/Ld0ujtvAoi7i3BtN

In a recent commit updating the code to use folios, the bytes variable
was changed from signed to unsigned in squashfs_copy_cache().

The bytes variable is used in a loop where PAGE_SIZE bytes are
subtracted from it each time around the loop, and where the loop
terminates once bytes is less than or equal to zero.

The effect of the change in signedness is bytes no longer becomes
negative when it is not a multiple of PAGE_SIZE, and the loop does not
terminate when it should do, and instead folios are created and filled
after file EOF.

These beyond EOF folios are not visible to user-space and hence this is
a silent regression.

This commit fixes the code to only subtract the minimum of bytes or
PAGE_SIZE, and which ensures the variable does not underflow.

Fixes: 5641371fd0b3 ("squashfs; convert squashfs_copy_cache() to take a folio")
Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/file.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 0a8288a53b25..bfbcfd6f1035 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -410,6 +410,7 @@ void squashfs_copy_cache(struct folio *folio,
 	struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
 	s64 i, mask = (1 << (msblk->block_log - PAGE_SHIFT)) - 1;
 	s64 start_index = folio->index & ~mask, end_index = start_index | mask;
+	size_t avail;
 
 	/*
 	 * Loop copying datablock into pages.  As the datablock likely covers
@@ -417,12 +418,13 @@ void squashfs_copy_cache(struct folio *folio,
 	 * grab the pages from the page cache, except for the page that we've
 	 * been called to fill.
 	 */
-	for (i = start_index; i <= end_index && bytes > 0; i++,
-			bytes -= PAGE_SIZE, offset += PAGE_SIZE) {
+	for (i = start_index; i <= end_index && bytes; i++,
+			bytes -= avail, offset += avail) {
 		struct folio *push_folio;
-		size_t avail = buffer ? min(bytes, PAGE_SIZE) : 0;
 		bool updated = false;
 
+		avail = min(bytes, PAGE_SIZE);
+
 		TRACE("bytes %zu, i %lld, available_bytes %zu\n", bytes, i, avail);
 
 		push_folio = (i == folio->index) ? folio :
@@ -436,7 +438,7 @@ void squashfs_copy_cache(struct folio *folio,
 		if (folio_test_uptodate(push_folio))
 			goto skip_folio;
 
-		updated = squashfs_fill_page(push_folio, buffer, offset, avail);
+		updated = squashfs_fill_page(push_folio, buffer, offset, buffer ? avail : 0);
 skip_folio:
 		folio_end_read(push_folio, updated);
 		if (i != folio->index)
-- 
2.47.3

