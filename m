Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571332;
	b=HTCUipka4kPx0Vd4oTgKT8Ht8mc03y0AK1ndVKEq5AlA2gkoNN8JAM/wNE7FFUjqYyvG
	 k/gb4gw7scLDTbWqe1H29jwKg6h6AQA2SuAw38uq6jv/QDl98Xw8hdmiJf76DW09wDY4y
	 tXQewslxtXuqudthdGkM/0pmeOUIuxk5KUuPeWtFVG7t0Wd8JtMlV2eUu9aIUI6nyTi8y
	 r3SDisbWOwNkHZTbOKIOs6PdfQizouadij/8U+baryK+JhHXmOYzXrdv8aNOzxDIXwknb
	 4hBFJ2ugKD88IW6lu8BzGU0yv5RCFBQLeAnlVoY0TitNwQRMsTNPwOimrG63zDhaqOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571332;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=XGWq71ugEc8RaUz+VPeMkGAU7sXldlHLHp6GKXMEWWg=;
	b=4Wq+xmoEKY2ukCWziIQyjYsd19c+w28T/WqJ9CQhgbWmGJlgc2h1AhOisB9ANARhT051
	 Flg3R/KkCtqjTNkkVmmSqMzWx8EOL1rGLD28pl03xbKVyDgX8bOxRxewfi5/yNVFUXTzM
	 VBZMiJcoXGBErbiEHiohNIqqwNQ1Q7VUC8ZmlT92SEmgnx8XIfWax0/liEOOCnRuBDPf+
	 kIey1zjlsRCTzNJuUf7h3TEPM/iV5tWEdY/9kYPxyivXaDZ5XHX8GT/ukuWF6u6/RKmCt
	 cWpWiwZlXTL81BLdkf4niAw7K9oZVWaM5U4txIB0Lil/R24w4caZsr2nDIKrnDnRvIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=cETSHNw+;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=JHEuw2SM;
	arc=none smtp.remote-ip=92.204.81.34
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [92.204.81.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84165606A6BF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84165606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=cETSHNw+;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=JHEuw2SM
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27gxX8PE; Wed, 25 Nov 2026 01:48:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571318;
	bh=XGWq71ugEc8RaUz+VPeMkGAU7sXldlHLHp6GKXMEWWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cETSHNw+afcDi1gZJwv1nNPZsPSp6XbCe5wdoLbnHGCDIGNAY/ZAcAtwHOxX0Pltx
	 YKUvYf6R8ENVDT7EFfNUL01gPRK5j6WUOgnB7oeDbrWIaBMLtjAHiGj0PSfu3osWHB
	 hE3vOdZXrbwKZkOVhV6fV6RRSIbLXRKrieUoGZ41l+ovLAelXyMI2LBCCA+eXbxoNf
	 oBH1ndOAOq2+8+4BsinIjNT+2MNPqBS3PUcn/HBY2hnUh9Qmns8clTg0Qmh+5wqwne
	 UoiikLB55pff/YoaQcnB8h/dmzcv9tU+bHkdfAphzEwIdb6ZzJz8XSHOOhfWpQFhOc
	 tb+/jcwdO7hyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571318;
	bh=XGWq71ugEc8RaUz+VPeMkGAU7sXldlHLHp6GKXMEWWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JHEuw2SMxx5UzWASSWfVrMef8Xok7BaE20iOVDvtCm1XiUw/Q0qNqWzcf184ysC72
	 fykr/MlWDqAvHTVWuCxh8LFB4GYUGh7o0KTGXNaqf8Tn+jNKQr6ny7cZrCgOXrpAkD
	 Tlzk+TeCUakGejKWxntR3Hwgsdz6nilmjXu1Ru/tBheqZl+dMh4VO7WhlkbYXpQPjK
	 xK0kUZghSA0XEYup/af9TkNwkVaO4J1I8yMy1JJGXNSqMUa+tZXMiJuFy83i7V+lJR
	 edmwJovZa9mUS2RDc0bY4rAQkF/r3gwHj/xxVNSMnRoGUBFP7ul0cC+qVnMHc/o0LN
	 g08gSWXw+ccOw==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e75
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=SGndz2--h1XmRaCoFccA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 4a4eb783aeb31c084df830fbcf3173b6:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 22/23] Squashfs: fix regression in squashfs_copy_cache()
Date: Wed, 25 Nov 2026 01:47:36 +0000
Message-ID: <20261125014737.347231-23-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014737.347231-1-phillip@squashfs.org.uk>
References: <20261125014737.347231-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfI26gdRapMtm/2esWFxZrDqNeQy/HBrCLQ2DCMZW9+9W5NcrK1Y4wT2WxfwktCDq1IerjccNf3ww9FPYAJ46C96j5gWOznCQUgkhSIars7K9NuQ9TxBU
 pwR+kC+2KBLB5WUJhLbWelZzXNZSGpwL1SxUj+khOpVrfYFwMTpx9tU5ly7p5EJ5e5GDLD6WZUARfAdP16v77EbYHskcXwuGdjAZPXQZ121KCkE0Sy7SmKtZ
 luIZYJ7KTHreaRCZQhtnCK+Wi2UQDCmGtHkx1MZM8r5L4qASD1YfPXl/iBlhzB0D

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

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/file.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 322caced468f..f969d7b204d5 100644
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

