Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411486;
	b=z2OgJZoAW7qLPHSUP3CZw/hZt+BV4t3Gw1saG4+D4q9TW6M8GXptNgc/NpbFCyOPJWmG
	 4IvYlrYs8iK8vqy+wnsPvdmvlf3SFF9cPeNAZupEAXR3K7GSlf6Kq0NC5F9c3gbseAO2H
	 CcHRiPst/fbxXTn08s8Tjhcnj7Z9lkbZtvuSzpbwD52tSQWxtpW8L5T72ju4DgYPQdZuo
	 sm5g/wq6eGMvx2EEUumM4BcLvjYgOBs/8bnArYscyBE1n4y7JNBccFjQ6ylAy9me2Stlr
	 tqRuqxVoZJmXtMmMQXfC+oomrFJmbY3x1EvoWE21FzrmXQkxcZzQN1QL/juos4dBakg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411486;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gpoGDk8txb07hMaGxfF0IDZNLe/tiUuwVHL2F331wag=;
	b=R7Yb8d20v1vXXTXJdntk3yGhjeew6NDT146AdQtLVegzQq356gkQ5BB9s+ZB7YlqNclo
	 sPMliZTV079Td/XwDjfYFEeM0pgg9fU8klJVYaWWW1il8iZUBCb4DTwizqlEAm0/rHM6T
	 ZLy0Ynk/4QIdXIWQyk/onNXgjYpGnii7bIa6rPFt7Zicloz/iN2Jy65xTkUp08X+wxsnS
	 WPrwgaAJ4zLI63ZPJ7xo3L/oFCcsVRs0KV+gUZDGDzcfrvbGkqyRo5poAuDES7lOWYroI
	 Yzv2AZcoAX5OWT2Bz11d9V/vnYxO8rA3GJS6zXglHB69VggRHRoFn9fHaBqiZAdezxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fDRljxkA;
	arc=none smtp.remote-ip=162.62.58.211
Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9398A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9398A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=fDRljxkA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795411479; bh=gpoGDk8txb07hMaGxfF0IDZNLe/tiUuwVHL2F331wag=;
	h=From:To:Cc:Subject:Date;
	b=fDRljxkAWmyPNfEtNMyArMPjFhZXm2LUJL0Vcj8J+Uz+5L62lfkWQ98S61Bbm9/N3
	 zg52dpJbLio4PuLJVFawC3khzuiRPTJjJeauIYcgpIFFWv1m4qMkk4NYwgfUfx5Uq6
	 YFZnzIt3+HLU9y1jO1lOl0RO/6WC5qQ0VLkEYTb8=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 6258823F; Mon, 23 Nov 2026 13:24:37 +0800
X-QQ-mid: xmsmtpt1795411477tnjo7hiq4
Message-ID: <tencent_9AD2892CFBF2854D36B81A626F13ADEE0508@qq.com>
X-QQ-XMAILINFO: MaaIYtAFx2QD48NbgGn2T/jvXIHz0SyAtFPce0EXBR1uh3G9k0t9p2pa62xfjw
	 OU20/CwlJejk0fNtBZK8ZWp1yow/a/pARbfDXyXz5zYfZdbey/xc4n+Z6HKlc+aVqcwdaiTAMS38
	 u3ud7IrGN0WeJDopxP/XysJjVI4xYwLeLRNCO2AC7Sa1OeTR2J2jTfWSY7jTGBQuCilzbnS8Admg
	 iOcU/QqupVuOzFP6G+GzoxnCrVunNovzjy7bQLujgQp3VEwWxXO6e1IKrfH7FoePad5IG8VsFL5w
	 5Ef8KnhXbMtJeE1kyupPrp4/wQdeVz0q44beX6dWtNWsbn845KHDOSfjbTLZHfCE784PuTVa3QJD
	 QZKSyNlFIeIiQVyeH6xlUkEhSqCQSGicNdsj4QFcbDwQvj8IOmZucquo7xXWIougfrujD1SMT2gu
	 2aC10+IEZqkRgGCVPBBCZ1XVR/Sw9qIBogiNOigRoAoPLlfERX0v6Ixuy/U1tzZRxlAJ7wG/RVqo
	 sYrT0xKegfpNjKR/gsy9BgtQAdrX01mmfT7/F3CEhQwuKW5J+C6bYgDh4XO1kqkD2lD+OGjlq793
	 g222OH1B0RDYOi3wgjfquwwwvSZac8XewGaEcUtDAoMx1YOQoE1XX5aQ4i1KsqwIO0WANnm5HseA
	 t9k94YOp2FdRnw2c1XHLCcwJJ9EFx11phhnjNcFgu346NOnmxBsoNbZ2T/G3sCDN5quChlPRQUFO
	 ofo6YhDch6NC39dvgqpjc0orgiX7zFcaSqmK0xtLAL5/i+1DLHAG7TaKSNmn/lTsaYmVkHAzcN2+
	 S4H+YbzLb+Re2pnhOHzFrrI2r+NVUBDw2x0taSx3fiDwci7XZkq425HNWO7leIsWY+5lmId91bb4
	 KTjOwV+wWn7ijb1YIViksUY524yREd4cEVaDn9qPnsgx5/OGuNJq4qd+WPS6qLyYO3KxhwXQtnWc
	 8mjsfYHQnX9RbbbHV28kPWfql6ngdWQ6TKtsA4NBMxUPHLq5ayN21h7blExRcoFuo08w29oi4XbM
	 YAqf6MMKpj96rKr/h5458FDaM8snqzsxiyqv4UV0jXL5ol/OSSlo9geGsHEZte8vjE4ubfKauT44
	 kYiRRe6nRqnXeJAHzPJI1DcpWpGOTmMqBlOTiv
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: jfs-discussion@lists.sourceforge.net
Cc: shaggy@kernel.org,
	yun.zhou@windriver.com,
	syzbot+ab18fa9c959320611727@syzkaller.appspotmail.com,
	syzbot+a67911c5a11315aa55a8@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH v2] jfs: add dmap integrity check to prevent out-of-bounds tree access
Date: Mon, 23 Nov 2026 13:24:37 +0800
X-OQ-MSGID: <20261123052437.1322377-1-847807867@qq.com>
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

Add check_dmap() to validate dmap structure integrity, mirroring
check_dmapctl() which already guards the dmapctl pages.

A corrupted on-disk dmap page (e.g. a fuzzed filesystem image) carries a
garbage dmaptree header.  The free path does not validate it before use:
dbFreeBits() -> dbJoin() reads tp->dmt_leafidx straight from the on-disk
tree header to locate the leaves, and dbAdjTree() then computes
lp = leafno + dmt_leafidx into the stree[] array.  With the observed
corruption leafidx = 0x5ff20055 (expected LEAFIND = 85) the computed
index reaches 0x5ff20056, far beyond TREESIZE (341), triggering the
WARN_ON_ONCE added to dbAdjTree() by commit a174706ba4da ("jfs: add a
check to prevent array-index-out-of-bounds in dbAdjTree") -- a
mitigation, not a fix.  The alloc path got a leafidx sanity check in
dbFindLeaf() by commit d64ff0d23067 ("jfs: check if leafidx greater
than num leaves per dmap tree") and the dmapctl pages are verified by
check_dmapctl() from commit cce219b203c4 ("jfs: add dmapctl integrity
check to prevent invalid operations"), but the dmap leaf pages
themselves are still trusted.

Validate the dmap tree header (nleafs, l2nleafs, leafidx, height,
budmin and the leaf values) in check_dmap() and call it when a dmap
page is about to be modified: dbAllocDmap(), dbFreeDmap() and
dbAllocDmapBU().  Return -EIO on corruption so the caller aborts the
map update instead of operating on a bogus tree.

Verified with the syzbot reproducer under QEMU (x86_64_defconfig +
CONFIG_JFS_FS=y): without the fix the jfsCommit thread reliably
triggers

    WARNING: fs/jfs/jfs_dmap.c:2962 at dbAdjTree+0x2fa/0x3f0, CPU#1: jfsCommit
      dbJoin+0x24b/0x2b0
      dbFreeBits+0x170/0x8d0
      dbFreeDmap+0x62/0x1c0
      dbFree+0x266/0x550
      txFreeMap+0x2d3/0xe10
      xtTruncate+0x24fe/0x2e20
      jfs_free_zero_link+0x262/0x4c0
      jfs_evict_inode+0x40a/0x4a0

with R12 = 0x5ff20056 (= 1 + corrupted dmt_leafidx), reproducing on
every run; with the check in place three consecutive runs complete the
mount and file operations with no WARNING, Oops or jfs_error report.

The same missing-validation hole is hit by a second still-active syzbot
report (WARNING in dbJoin, prio:high, last crash 2026-11-23), where the
computed index lands exactly at TREESIZE (lp = leafno + leafidx = 341).

Reported-by: syzbot+ab18fa9c959320611727@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
Reported-by: syzbot+a67911c5a11315aa55a8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a67911c5a11315aa55a8
Signed-off-by: Shuai Liu <847807867@qq.com>
---
Changes in v2:
 - Add Reported-by/Closes for the second syzbot report hit by the same
   missing dmap validation (WARNING in dbJoin, prio:high), which computes
   lp = leafno + leafidx = 341 = TREESIZE on the crafted image.

 fs/jfs/jfs_dmap.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a841cf21da7de..4616ded254ba6 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -220,6 +220,74 @@ static bool check_dmapctl(struct dmapctl *dcp)
 	return true;
 }
 
+/*
+ * check_dmap - Validate integrity of a dmap structure
+ * @dp: Pointer to the dmap structure to check
+ *
+ * Return: true if valid, false if corrupted
+ */
+static bool check_dmap(struct dmap *dp)
+{
+	s8 budmin = dp->tree.budmin;
+	u32 nleafs, l2nleafs, leafidx, height;
+	int i;
+
+	nleafs = le32_to_cpu(dp->tree.nleafs);
+	/* A dmap tree always covers LPERDMAP leaves */
+	if (unlikely(nleafs != LPERDMAP)) {
+		jfs_err("dmap: invalid nleafs %u (expected %u)",
+			nleafs, LPERDMAP);
+		return false;
+	}
+
+	l2nleafs = le32_to_cpu(dp->tree.l2nleafs);
+	if (unlikely(l2nleafs != L2LPERDMAP)) {
+		jfs_err("dmap: invalid l2nleafs %u (expected %u)",
+			l2nleafs, L2LPERDMAP);
+		return false;
+	}
+
+	leafidx = le32_to_cpu(dp->tree.leafidx);
+	/* Check leaf index matches expected position */
+	if (unlikely(leafidx != LEAFIND)) {
+		jfs_err("dmap: invalid leafidx %u (expected %u)",
+			leafidx, LEAFIND);
+		return false;
+	}
+
+	height = le32_to_cpu(dp->tree.height);
+	/* Check tree height is within valid range */
+	if (unlikely(height > (L2LPERDMAP >> 1))) {
+		jfs_err("dmap: invalid height %u (max %u)",
+			height, L2LPERDMAP >> 1);
+		return false;
+	}
+
+	/* Check budmin is valid (cannot be NOFREE for a full tree) */
+	if (unlikely(budmin < BUDMIN)) {
+		jfs_err("dmap: invalid budmin %d (min %d)",
+			budmin, BUDMIN);
+		return false;
+	}
+
+	/* Check leaf nodes have valid values */
+	for (i = leafidx; i < leafidx + nleafs; i++) {
+		s8 val = dp->tree.stree[i];
+
+		if (unlikely(val < NOFREE)) {
+			jfs_err("dmap: invalid leaf value %d at index %d",
+				val, i);
+			return false;
+		} else if (unlikely(val > 31)) {
+			jfs_err("dmap: leaf value %d too large at index %d",
+				val, i);
+			return false;
+		}
+	}
+
+	return true;
+}
+
 /*
  * NAME:	dbMount()
  *
@@ -2112,6 +2180,9 @@ static int dbAllocDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
 	s8 oldroot;
 	int rc;
 
+	if (unlikely(!check_dmap(dp)))
+		return -EIO;
+
 	/* save the current value of the root (i.e. maximum free string)
 	 * of the dmap tree.
 	 */
@@ -2167,6 +2238,9 @@ static int dbFreeDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
 	s8 oldroot;
 	int rc = 0, word;
 
+	if (unlikely(!check_dmap(dp)))
+		return -EIO;
+
 	/* save the current value of the root (i.e. maximum free string)
 	 * of the dmap tree.
 	 */
@@ -3338,6 +3412,9 @@ static int dbAllocDmapBU(struct bmap * bmp, struct dmap * dp, s64 blkno,
 	s8 oldroot;
 	struct dmaptree *tp = (struct dmaptree *) & dp->tree;
 
+	if (unlikely(!check_dmap(dp)))
+		return -EIO;
+
 	/* save the current value of the root (i.e. maximum free string)
 	 * of the dmap tree.
 	 */

base-commit: c41a6b8d553d977c7a6b996feab3150f1b5797e8
-- 
2.43.0

