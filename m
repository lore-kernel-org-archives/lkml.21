Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437800;
	b=QgPgoZNAIzmJwhqZYp0k2bx5x1RszK2kuHv7mxiv7vbOiBz3RJ2Q4nnfqXGR4N0w39FM
	 7hTd/FZBfII/+215JT7tKYYHgANXPWxFxO4jGcUiHNQzCbqkEEjTeOvT75pSYmJv3Fhea
	 cFRnS0/n5EussMkV4zoXU6U5gjPWXZnKuqU7NUsQxaNY39o17ALxFp5rQc9zE1BxYAKER
	 gvkdR03ryr8GziN/uyefufozdP8+iIlk2haoYVsmQyGxzuhNR9ljHKxO6COho0mf1YBCB
	 9taKinaLkWlTjOxFLrR8H4Y0fyr+SZhZMXYZ533JK7QHqysON3AI2SnZHI5xc2v6Nlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437800;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=F3x2hyRVvbjgatOz+Sql58/PtWQnfM88Ketp0Y4MQZs=;
	b=SZyW3dbzi53upgflUkT0u2h2o5O73fv6R7SfoYcFOmS6OzSrpAfu/LafEKDoL9+blbHz
	 U5AN2rzRVSx604/s/NhPF/aQnv7yAC0N6mDlWQl1kiMEzPbA5Bx8hmeoVcE5yqs63igqZ
	 vEnLFqPxWRbH7gjTc1F1uFKwVvZY6hk7+GdhV8dpZEUks2et6NZeXLzdlBrQryaWD7fDI
	 eyVcHh6A/p50g4pS4aMV3qVOEfeZl1YGOsY+cG1WHp58Fu9USIl4q3TD95twlqHfUTd1f
	 f+xJ4pIfQJLA/XT/Gd7TxOUJluHLqmdebQEWVnKJLbQQ+MVNCCb26KTV0Mr26B+QG2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=126.com;
	spf=pass smtp.mailfrom=126.com;
	dkim=pass header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=j+OAcLmP;
	arc=none smtp.remote-ip=220.197.31.9
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667E9606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 667E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=j+OAcLmP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=F3
	x2hyRVvbjgatOz+Sql58/PtWQnfM88Ketp0Y4MQZs=; b=j+OAcLmPnit9649Wzm
	MNMGekAiUnFT/lcLXsUN1RP6m+/ljGAgX871pv8sU18Cji9rMpIm4SzQ99gFpcr2
	9DTQW3CtHMDUAJmuTkzHAhTq5ZiN0gz2o4trgs9PvRXGjdM30iGTZmM1kMNOjdys
	xTnIx5aCrVUQ6eqT5M++rBoBA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgA35uu4NARrP97wDw--.65328S4;
	Mon, 23 Nov 2026 20:42:44 +0800 (CST)
From: Genjian <zhanggenjian@126.com>
To: agk@redhat.com,
	snitzer@kernel.org,
	mpatocka@redhat.com,
	bmarzins@redhat.com
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhanggenjian@126.com,
	Genjian Zhang <zhanggenjian@kylinos.cn>
Subject: [PATCH 1/2] dm-integrity: skip the superblock reread in recovery mode
Date: Mon, 23 Nov 2026 20:42:12 +0800
Message-Id: <20261123124213.1102958-1-zhanggenjian@126.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:PikvCgA35uu4NARrP97wDw--.65328S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4kXF1fKFWrWr1UWF4kZwb_yoW8tr48pr
	4ktas5C3ykJa1F9a18ZF4xZFW5JayrCrW3AryY9wnaqryYyr13Xas5JFy5AryUGF4fAF1S
	vF4Yg3yDAF1vqr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziZYFtUUUUU=
X-CM-SenderInfo: x2kd0wxjhqyxldq6ij2wof0z/xtbBtQQamGsENMTKSgAA3s

From: Genjian Zhang <zhanggenjian@kylinos.cn>

When the on-disk superblock identifier is invalid, the recovery-mode
constructor rebuilds the superblock in memory without writing it to
disk. On first activation, resume rereads the on-disk superblock and
compares it with the reconstructed copy. The identifiers differ, so
the driver marks the target failed and recovery reads fail, even though
the disk contents have not changed since construction.

Skip the superblock reread in recovery mode so recovery reads use the
block layout established by the constructor.

Fixes: fc79aeb86a2c ("dm-integrity: validate the superblock on resume")
Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
---
 drivers/md/dm-integrity.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 6968e38888db..b17bb9da9195 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -3865,8 +3865,8 @@ static void dm_integrity_postsuspend(struct dm_target *ti)
 }
 
 /*
- * The superblock is re-read from the device on every resume, so that we pick
- * up the flags and the recalculate position. The geometry described by the
+ * Outside recovery mode, resume re-reads the superblock to pick up the
+ * flags and the recalculate position. The geometry described by the
  * superblock must not change though - the in-memory structures (and the
  * journal in particular) were sized according to the superblock that was
  * validated in the constructor. Reject a superblock that was modified behind
@@ -3922,6 +3922,9 @@ static void dm_integrity_resume(struct dm_target *ti)
 
 	ic->wrote_to_journal = false;
 
+	if (ic->mode == 'R')
+		goto skip_writes;
+
 	flags = ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING);
 	if (ic->discard_keyed)
 		flags |= cpu_to_le32(SB_FLAG_DISCARD_KEYED);
@@ -3941,9 +3944,6 @@ static void dm_integrity_resume(struct dm_target *ti)
 		goto skip_writes;
 	}
 
-	if (ic->mode == 'R')
-		goto skip_writes;
-
 	if ((ic->sb->flags & flags) != flags) {
 		ic->sb->flags |= flags;
 		r = sync_rw_sb(ic, REQ_OP_WRITE | REQ_FUA);
-- 
2.25.1

