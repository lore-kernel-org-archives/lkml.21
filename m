Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425580;
	b=TMMy6c15HiW5aAbUtl7btFC5Rdx87BhJ5Z9L5Qic6lqNtgwFYOwy4gb7JRjpTpEtvQAs
	 eoIJsDvbTF6PM3oirravKCglmTMtyZ7VokQ40ppKA2Ot+0nYp+osYoRwx57hKyN0e8pfX
	 vhHVjoD0zQuSizIW4wbxxaRwxmBRngNgNOWev8Lq/XyZP+rtk7Bj6B5pCpLC7sb1Av4+h
	 w7cxME+QH+z/FyXxgHjl0ZoOLLJ/PhIGNNEn2dRojeZjZugRLM+L8hFz7qVU78p8hd+Fv
	 b38KONq70OSM19xcjlsVo32TBtK+NudJ4P2s1himBAM2zNCSIBG4xqr8s9LZERPppXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w4eBVmv0cgiAo+f4muzjsPkDg46ilkFNyKsWRMKGZus=;
	b=SyW46a2w4UNmX0g6UJHBkn7ri7RbulsGDJYyVuzOOEyS/epwvaaXhC7JSilyX1RdFxGt
	 h/kcOPfadlz/FJkrFXYjMrl44hDNoSWRNjtHie7IEnWQNZNcc09ZJkylBNHCHfETt33it
	 4qnWafl4ScAQI+XcnJPc622HDHP6BWrpLF7r6t4lZWsOsobzwxu4Mk+C2Qnxjogw8gzYz
	 vOZFwteaXjPk5BQQ2kE7U3qePT/838CdXM4pFrdUcP2QnkDQ5+mKJF4HdTbU/5iwP4HoU
	 Tb5Q0sRniPAQxoy6fDUUVcxCooI8jYWcSopsicu6Q9+lIHkfJis/wgjjJtGhWcPi//A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrSzzmfu;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51308606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51308606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MrSzzmfu
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cde5a7d7849so1266738a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425578; x=1796030378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4eBVmv0cgiAo+f4muzjsPkDg46ilkFNyKsWRMKGZus=;
        b=MrSzzmfuIIAnsBltN4sOsDzyb95+wF/QCijmT0skqP3TwyofmheUocZKPy1o+SWh05
         zG0HaEulySzNasstx9C43pUJxHcoDLkPvVSLfEbLKHRI9xJiw4nRz0Re542Mzlo3sl43
         vrhbSHTX6huVSqTJ94qVaqTZ0pISEbDDxhSQpkpmY9nJcUOiRXfkjrByLjRnK+KOD/JR
         QpFYZ8us2gK8xp0NCHVPoQksZa8EuFCedRlqwuq94xSXCRiBKI+d+WYARg7U/P2cvOCD
         mPB2OW044v5X1yQFWQKdSL4IawqXx/3GJLF5t4Q+FKMaX0XVrR0eNYrX8pPbfl+CW3mC
         z46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425578; x=1796030378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4eBVmv0cgiAo+f4muzjsPkDg46ilkFNyKsWRMKGZus=;
        b=VWHjnsRyTmx/joQ6JIhujfkX73XhltkSyYEUiY0eEfVC20Sws61/PwudrqoJFTctTj
         wtKp9keBts53818mIHwI292clvfCZM7yr4bTrJPY7AWtXiZP87e1m0YSrTpe6yz3D1Kr
         xp6Tjky+KLgUvWMvKDEV6kTPskkFFxaI4kPkKAD8mmqNGqWSTT6UL9gtYv2TVn1R4fPI
         8dWfZGaLSm44gNPR/EqLA3Kgk+0sRv/Arv/DABM5qdTxAijTDGld9zH4FtGhdRex0IBB
         KlFEkyGUJWr/+K2QwbN0XU3+qSmiq7jeY0hUfI5Sfq7QdmigCYw0qMDO7z3RtvXMofpR
         /+Ew==
X-Forwarded-Encrypted: i=1; AL+hErG1I/4Kv4LMCOlUhPrUgtnH+sxPR6b9eODD9yNSImT2NMVoYgyLUSMLxsgcRQDv/8HakXk+oNwi4N7txT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kf/wrLs22hdfmunhLf5kGVTVTseTJQZx39Nx87D3/7a6BAjGd
	QgTQS9c/Te7W2KcvbLvP61/MZ66CyqkBbDEN6xMpCPm7aN3Al0BM7+0Ufbai3Q==
X-Gm-Gg: AZFdTZc0VQiudAOZeDlDh2/eGMJwxRQncwDXm0NzC5TixG/h4fDmvXOvYuoheBbGayZ
	3WqKLWIWOHeAErXkg2JhtzArfu4h+Hv3zZgc5I9Hh2sr9K+L9joTapBVOT06R36lA9k23Owbr1g
	C+R0fipV3C4uekMiFQUx+UW2eE/dgyrhLPcBRiNtFSS382g6QBtBR5NvLXnaHI5iL3hU18ZHHTI
	GwQy8zSWlKAigaKxziD7iZoWtuEoFyxbKXByHYp7Wq5onaQKdeZNMe12zuilRLP/MvdGsOvq7Z6
	FlO00Tb17yF+7QNSoTa9SD0Sdhwmbos9eU9AyHqbwflExav7nP3UaE9N+X3JP4IxwT++U6DX4iD
	rdMYTVXz9Vkg2O30r6P9gYXqDlPB5Zh6tDvTUXIeQps/djSRQ4913Z0NyAjjTdb2qGO56agSznn
	MWREz7bYJTNNZWOThtRQS4Hnu528aCaD2YN2iPI5ehBUE80Aa9lZ5b4IA6bYJBf2QO7s88xWH0s
	wq0L4VhEYh+ThZSqfJVgcuPWaisKwLknBPLvO/bXqM5+V30Sn0k3XPEX0pYbvtHOlrEIu9phe9H
	jjakeYiUw+Nx++C0BjeEzZHazfB+2Q==
X-Received: by 2002:a17:90b:1f91:b0:3b4:1cb1:e7ae with SMTP id 98e67ed59e1d1-3b41cb1e88bmr11170233a91.45.1795425578378;
        Mon, 23 Nov 2026 01:19:38 -0800 (PST)
Received: from thangnn-ASUS.. ([2a09:bac5:d452:16c8::245:e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d97356sm19617738a91.13.2026.11.23.01.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:19:38 -0800 (PST)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>
Cc: Heming Zhao <heming.zhao@suse.com>,
	Cen Zhang <zzzccc427@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+38fdbb551940270021f1@syzkaller.appspotmail.com
Subject: [PATCH] ocfs2: don't destroy the jbd2 journal under journal_shutdown_sem
Date: Mon, 23 Nov 2026 16:19:33 +0700
Message-ID: <20261123091933.42057-1-ngocthang2710.1999@gmail.com>
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

ocfs2_journal_shutdown() holds journal_shutdown_sem for write across
jbd2_journal_destroy(), which frees the journal's shrinker and takes
shrinker_mutex. ocfs2_clear_inode() takes the same rwsem for read and
can run from reclaim via super_cache_scan(). Lockdep reports the cycle:

  journal_shutdown_sem -> shrinker_mutex -> fs_reclaim
    -> journal_shutdown_sem

The write side only has to keep the journal alive while
ocfs2_clear_inode() calls jbd2_journal_release_jbd_inode(). The journal
has been flushed by then, so inodes cleaned up afterwards have nothing to
release. Detach j_journal under the rwsem and destroy it outside, and
make ocfs2_clear_inode() skip the release once j_journal is gone. The
lock now only covers pointer updates and the final kfree().

Reported-by: syzbot+38fdbb551940270021f1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=38fdbb551940270021f1
Fixes: f277230d002d ("ocfs2: serialize inode journal access with shutdown")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
Tested in QEMU (x86_64, syzbot config) with the syzbot C reproducer:
without this patch lockdep reports the circular dependency on the first
run; with it, 9 runs (3 boots x 3) are clean, debug_locks stays 1 and
journal_shutdown_sem no longer has shrinker_mutex or fs_reclaim among
its forward dependencies in /proc/lockdep.

 fs/ocfs2/inode.c   |  7 ++++---
 fs/ocfs2/journal.c | 17 ++++++++++-------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index e225a96d37535..8a26964472521 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -1320,11 +1320,12 @@ static void ocfs2_clear_inode(struct inode *inode)
 	/*
 	 * ip_jinode is used to track txns against this inode. The journal is
 	 * flushed before it is shut down, so an inode cleaned up after that
-	 * has nothing left to release. Hold the shutdown lock so a journal
-	 * found here stays allocated until the release has finished.
+	 * has nothing left to release; shutdown detaches j_journal first.
+	 * Hold the shutdown lock so a journal found here stays allocated
+	 * until the release has finished.
 	 */
 	down_read(&osb->journal_shutdown_sem);
-	if (osb->journal)
+	if (osb->journal && osb->journal->j_journal)
 		jbd2_journal_release_jbd_inode(osb->journal->j_journal,
 					       &oi->ip_jinode);
 	up_read(&osb->journal_shutdown_sem);
diff --git a/fs/ocfs2/journal.c b/fs/ocfs2/journal.c
index 9c4a48887c9a3..2529138918bc1 100644
--- a/fs/ocfs2/journal.c
+++ b/fs/ocfs2/journal.c
@@ -1064,6 +1064,7 @@ static int ocfs2_journal_toggle_dirty(struct ocfs2_super *osb,
 void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 {
 	struct ocfs2_journal *journal = NULL;
+	journal_t *j_journal;
 	int status = 0;
 	struct inode *inode = NULL;
 	int num_running_trans = 0;
@@ -1076,10 +1077,8 @@ void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 
 	inode = journal->j_inode;
 
-	if (journal->j_state != OCFS2_JOURNAL_LOADED) {
-		down_write(&osb->journal_shutdown_sem);
+	if (journal->j_state != OCFS2_JOURNAL_LOADED)
 		goto free;
-	}
 
 	/* need to inc inode use count - jbd2_journal_destroy will iput. */
 	if (!igrab(inode))
@@ -1116,13 +1115,17 @@ void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 	}
 
 	/*
-	 * Exclude the final JBD2 inode cleanup in ocfs2_clear_inode() while
-	 * the journal is destroyed and freed.
+	 * The journal is flushed, so ocfs2_clear_inode() has nothing left to
+	 * release. Detach it under the lock but destroy it outside: freeing
+	 * its shrinker must not nest in a lock that reclaim takes.
 	 */
 	down_write(&osb->journal_shutdown_sem);
+	j_journal = journal->j_journal;
+	journal->j_journal = NULL;
+	up_write(&osb->journal_shutdown_sem);
 
 	/* Shutdown the kernel journal system */
-	if (!jbd2_journal_destroy(journal->j_journal) && !status) {
+	if (!jbd2_journal_destroy(j_journal) && !status) {
 		/*
 		 * Do not toggle if flush was unsuccessful otherwise
 		 * will leave dirty metadata in a "clean" journal
@@ -1131,7 +1134,6 @@ void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 		if (status < 0)
 			mlog_errno(status);
 	}
-	journal->j_journal = NULL;
 
 	OCFS2_I(inode)->ip_open_count--;
 
@@ -1144,6 +1146,7 @@ void ocfs2_journal_shutdown(struct ocfs2_super *osb)
 	journal->j_state = OCFS2_JOURNAL_FREE;
 
 free:
+	down_write(&osb->journal_shutdown_sem);
 	/* Serialize the removal with ocfs2_ci_fully_checkpointed(). */
 	spin_lock(&trans_inc_lock);
 	osb->journal = NULL;
-- 
2.43.0

