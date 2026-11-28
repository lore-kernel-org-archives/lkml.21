Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.164.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795841566;
	b=XID4F/uZE4qUBPeEc/KYJiYe0irMU+1pf3B9uS4m6Y5ck4uOYCD1xROETW2NFa5ajl/P
	 q9bRjgtkc3pAmVbU5Xm8T2nzDLzMZdvQUsV2Fxv9pZHK1/elCGHMeAVCuEmPL/jyi4WRf
	 HVj5pIR9Q233/AgiRCDXFFeRFn1N5dpBOjyfMS0ZeBnhcGpiwGubaexhhQQ13QN3EJA0p
	 avnYOaYtTVHjcPn+337C3Aa4g5FO+4nM978giB4Vi1nagF2uhMQA/nd2Aga/9KJ3DVCxD
	 /rP/dA+ATcgYe+q7dwEcBVtE33Aq4STXSOEGG8VBtBD06TZBPwji7pG7p5zaIuH3nhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795841566;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Z3Eg/TDgQlbuYBlVYpaUHQDisAK33SjWZFw9CvUkfew=;
	b=pr6h6pD3FcE3LW7cHcDnDhXYAOnszwETy1AjFmCg9u+LHgevyBhGShJ+HurTmxseZIya
	 H0lxwCdT6b1Qz9e1gUZj1OBhXFzIuyYA4iVrHKSQ6G067yd+YGigc3PYg50ROFsLQ7jZ1
	 MMIZO6Cf6LTpbA8iJWiyBonwcVAZsNlZeS6wNb7eP/5LGmkne7PJdv6CTQnGyTZlVE+QG
	 NjWbr9hVHG0Oif4SmPcE7ALL4EZO3krBP6ks8Etni81HzSjYnRdoiL/J0cs7lvfV+hBSx
	 pcjWBr60Q44W1BhDr1PR3tC4ofVthN9linMkqT+qLPozWAGalGLFUTRnPWwanPr/Fgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=stu.xidian.edu.cn;
	spf=pass smtp.mailfrom=stu.xidian.edu.cn;
	arc=none smtp.remote-ip=162.243.164.118
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22DF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=stu.xidian.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stu.xidian.edu.cn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=stu.xidian.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-Id:MIME-Version:Content-Transfer-Encoding; bh=Z3Eg/TDgQl
	buYBlVYpaUHQDisAK33SjWZFw9CvUkfew=; b=kc50YQnGZkY1IMYBoSic5n39Mt
	fTaS6HF8QF6+767+Yi+aGb6A39JMb/0EmHpkCrHQSeoMWEZmC3/LzZMhXlxqcf19
	CXuHzJ/YWwgJ8Zf/BhmdesWCfTC6E6sTi1bum30Ar0hTtyo0nUpZA//0OIC8arkw
	Qh3AQFYmMgvMCOPRY=
Received: from LAPTOP-FRMFRHCN.localdomain (unknown [240e:454:4310:1b87:e5a4:80eb:60e9:9d2b])
	by hzbj-edu-front-4.icoremail.net (Coremail) with UTF8SMTPA id BrQMCkAWPAIJXgprVulaAg--.2142S2;
	Sat, 28 Nov 2026 12:52:26 +0800 (CST)
From: Haoli Zhang <26031212468@stu.xidian.edu.cn>
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+706dff62c3dd6a366ff9@syzkaller.appspotmail.com,
	25031212117@stu.xidian.edu.cn,
	byu@xidian.edu.cn
Subject: [PATCH] jfs: skip metapage cleanup for rebound BTROOT locks
Date: Sat, 28 Nov 2026 12:52:21 +0800
Message-Id: <20261128045221.2824867-1-26031212468@stu.xidian.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:BrQMCkAWPAIJXgprVulaAg--.2142S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw43uFWxXryrXF1kKr4fAFb_yoW5Cw4fpF
	WrCF4UKrWDGrZrJwn3Jwsru39Yya9avFWUAry7trn7Z3ZxKw4IkF1Sq34q9F13CrWIyrWY
	qF45tw4kWF4UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4AK6IIF6r45MxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjTRC89MDUUUU
X-CM-SenderInfo: yswqjiasrskluy6v33wo0lvxldqovvfxof0/1tbiAgUKEWsITcul2wABsG

When a transaction is aborted after diWrite() has processed an inode, an
inline B-tree root tlock can point at the same on-disk inode metapage as
the regular inode-page tlock. diWrite() marks the root tlock with
tlckBTROOT but does not acquire another nohomeok reference for the
metapage.

If a later diWrite() in the transaction fails, txAbort() currently clears
mp->lid and calls LogSyncRelease() for both tlocks. When the page already
has an lsn from an earlier lazy commit, this releases the nohomeok
reference twice. The count can reach zero while the lazy transaction
still has a tlock pointing at the metapage, allowing reclaim to free it
before txUnlock() uses it.

An inline root that has not yet been processed by diWrite() still points
at the pseudo-metapage overlaid on bxflag; its lid aliases blid and must
be cleared. Skip the metapage cleanup only for a BTROOT tlock that
retains its inode-lock flag but now points at a real COMMIT_PAGE. In that
case, leave the shared page state to the regular inode-page tlock. This
preserves cleanup of unprocessed inline roots and prevents the rebound
root tlock from releasing page state it does not own.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+706dff62c3dd6a366ff9@syzkaller.appspotmail.com
Closes: https://syzbot.org/bug?extid=706dff62c3dd6a366ff9
Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
Co-developed-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Bin Yu <byu@xidian.edu.cn>
Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
---
 fs/jfs/jfs_txnmgr.c |  30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -2604,28 +2604,38 @@
 	 */
 	for (lid = tblk->next; lid; lid = next) {
 		tlck = lid_to_tlock(lid);
 		next = tlck->next;
 		mp = tlck->mp;
 		JFS_IP(tlck->ip)->xtlid = 0;
 
 		if (mp) {
-			mp->lid = 0;
-
 			/*
-			 * reset lsn of page to avoid logwarap:
-			 *
-			 * (page may have been previously committed by another
-			 * transaction(s) but has not been paged, i.e.,
-			 * it may be on logsync list even though it has not
-			 * been logged for the current tx.)
+			 * diWrite() rebinds an inline-root tlock to the on-disk
+			 * inode page. Its lid and nohomeok reference belong to the
+			 * inode-page tlock; the inline root pseudo-page lid still
+			 * needs to be cleared.
 			 */
-			if (mp->xflag & COMMIT_PAGE && mp->lsn)
-				LogSyncRelease(mp);
+			if (!(tlck->type & tlckBTROOT) ||
+			    !(tlck->flag & tlckINODELOCK) ||
+			    !(mp->xflag & COMMIT_PAGE)) {
+				mp->lid = 0;
+
+				/*
+				 * reset lsn of page to avoid logwarap:
+				 *
+				 * (page may have been previously committed by another
+				 * transaction(s) but has not been paged, i.e.,
+				 * it may be on logsync list even though it has not
+				 * been logged for the current tx.)
+				 */
+				if (mp->xflag & COMMIT_PAGE && mp->lsn)
+					LogSyncRelease(mp);
+			}
 		}
 		/* insert tlock at head of freelist */
 		TXN_LOCK();
 		txLockFree(lid);
 		TXN_UNLOCK();
 	}
 
 	/* caller will free the transaction block */

