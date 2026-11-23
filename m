Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437805;
	b=LQ/PPslg7Os9oDggrE3SsQubjUwPLZ3hSkFvNTs5S5XpqbWHf9G+DQUGO8zx6QLhh2qs
	 e3Ur0Wxb9OG94Qcw5OPuDTAWb5iA6+I1kbh80LV/MpDq1xxrUGAazeC5e8uhwLDwBdF7P
	 Gu3wFZzfxZnmIhUjVT3SV3u0R874kTZVSmMk5tHNv55RipdZWdJ71z1IlqfCyQHxy9l1L
	 cQSbEVzSqkCO8zg8DO0r52pK4fdj9qytUA1veS4EJqRp8aLS+hsuvdILbBHWFxqexeOKJ
	 EhcjgAOOC/p0NKZANMzSMsxOKRDLRP484vtgs4CyDWaPltWqjhbwI5BUbi9Yd3EKy0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437805;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=nurLNsvhXtnd6T0cWQV7F3FEw1+K5Q7NyOeJPjQtAzU=;
	b=xtONENFs9yowj3YUp9WtBvaQrIqhXxWwe+iCnWW90tIIKYdWps1p1hF4GxwEOqZb2FEQ
	 m2Shrakz6Dwww3XXgd4fz1oCmhwi5VWuxUa6SEDlif5JUk8QKUxAHiBsMbLgkKDE8tAP+
	 TXdc7TrIK7cfBMveBUF9dkBFSYGKSgegcjsLTJpgM2viWsxuX1Xal+0h57QrGfVxQbwvq
	 Llav9oXiUt+KDyxGDI5Y+solMo5J1SF75cvsTfVlJsa3N0u2PARaHs71GZ3A2iMcPQCsm
	 hTAK58ixXnBy+dmhD6y6qpmBHa4xqdxkN+dkcsqq/g7rtSvb8pCjbkF1qEz03/760GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=LNbpaZuS;
	arc=none smtp.remote-ip=220.197.31.9
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27126606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27126606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=LNbpaZuS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=nu
	rLNsvhXtnd6T0cWQV7F3FEw1+K5Q7NyOeJPjQtAzU=; b=LNbpaZuSzV+MPMtDZ3
	4qKB9vn5uzmuiR1nnvhbQ16BSqlD3ThNk6gRE0akdk7SIUek3SuMCElB/c0TOxJq
	0LycWmtcAwQx5Op6fX6v6Mo4C7bTmiFkwgsgakZWi2W/n6wUaM9WV3vFwfciedgY
	YkWZVCG/gCb+PEgeLJL3qUHZk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgA35uu4NARrP97wDw--.65328S5;
	Mon, 23 Nov 2026 20:42:47 +0800 (CST)
From: Genjian <zhanggenjian@126.com>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanggenjian@126.com,
	Genjian Zhang <zhanggenjian@kylinos.cn>
Subject: [PATCH 2/2] dm-integrity: don't mark the bitmap clean on a failed target
Date: Mon, 23 Nov 2026 20:42:13 +0800
Message-Id: <20261123124213.1102958-2-zhanggenjian@126.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123124213.1102958-1-zhanggenjian@126.com>
References: <20261123124213.1102958-1-zhanggenjian@126.com>
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
X-CM-TRANSID:PikvCgA35uu4NARrP97wDw--.65328S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4ktr4UWr1rJr1rAF4Utwb_yoW8XrW7pr
	1xK3yFk3ykAF429a1xCF43CFyrKa4Ikry3CrZIkw1fK345ur17Xw1kGFyUJryUGF4fXF1U
	ZF1Yka4Uur4DWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRZF4_UUUUU=
X-CM-SenderInfo: x2kd0wxjhqyxldq6ij2wof0z/xtbBtAcamGsENMfS1AAA3r

From: Genjian Zhang <zhanggenjian@kylinos.cn>

In bitmap mode, dm_integrity_postsuspend() clears SB_FLAG_DIRTY_BITMAP
and writes the superblock even when the target has already failed. If
resume rejected a changed superblock, this write can overwrite it with
the constructor's saved copy.

Check the target's failure state after init_journal() so that a journal
write error during initialization also prevents the bitmap from being
marked clean.

Fixes: 468dfca38b1a ("dm integrity: add a bitmap mode")
Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
---
 drivers/md/dm-integrity.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index b17bb9da9195..0964d21c3c44 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -3852,10 +3852,12 @@ static void dm_integrity_postsuspend(struct dm_target *ti)
 #if 1
 		/* set to 0 to test bitmap replay code */
 		init_journal(ic, 0, ic->journal_sections, 0);
-		ic->sb->flags &= ~cpu_to_le32(SB_FLAG_DIRTY_BITMAP);
-		r = sync_rw_sb(ic, REQ_OP_WRITE | REQ_FUA);
-		if (unlikely(r))
-			dm_integrity_io_error(ic, "writing superblock", r);
+		if (!dm_integrity_failed(ic)) {
+			ic->sb->flags &= ~cpu_to_le32(SB_FLAG_DIRTY_BITMAP);
+			r = sync_rw_sb(ic, REQ_OP_WRITE | REQ_FUA);
+			if (unlikely(r))
+				dm_integrity_io_error(ic, "writing superblock", r);
+		}
 #endif
 	}
 
-- 
2.25.1

