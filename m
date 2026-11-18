Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961535;
	b=xj4lsLYnuLorWr9X/XeWVBRp3YTMFqZx+/mSfqEhZQp4ATB3e+MLJHhhbP4X5Iih8mSI
	 +NoytszfZVERrQf1GXc1ZoEFvwMydIsHXID0qjkQaroNd7W2zAr8Ct0vaI4jRRsQjhhgZ
	 EA1jA3RFOUuQig9eCsXqOXSCCjKT7rjmv1TufFPqoaMkj5Mxo6NbJyOr5Tp6eq1vm5GY2
	 UB/+cLWrOOfXReNuAnjPGW0Im9Y68UoZ1BRC3cQIGwcWChyjR1gQ4Nd/0+LDvixGj8F1e
	 mTnWp2Jph3YvwYsk4slXvu3zCZU3qyvtF0e3k7est7sXPvo1dtxxXl2pv098wlUfG9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Z+N2Sizs3DgoA4nmWWFLDvklML3guJTnnLBvLJVgIbY=;
	b=UF+Dg+yaRvvgRJu7Ilajlq6KRHR8hPaK8ERWRUJGUtr64o44avdU+tQOuaARsa/nqIXn
	 0ztVNR/Rzq1yLZjkJZ7i7XWsKHV9JkUIyRda190C452GWTgpSbuitZA5m6HrQVm6bB5r9
	 SbEXKjFIpqI4uHyFGwmm6B06RjZ3zJt70AEMdoW7UJDAccVQ2t7+fqTc+EaeE7TqSyRQI
	 +AlVD6X1YllDi9pdbpaJP/SNqi2g9gt+W16s+0iZwwKA+ge5oAHE3hE8+9868n5WwNQYR
	 NQs8OWtU30/5ydcL2MipoORVQk8sfFX7FdQP8xzeCDStWH8AYUN1laNKp2DvCSdopUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmu20wZ5;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A4606A880
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 610A4606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmu20wZ5
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so322773a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961535; x=1795566335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+N2Sizs3DgoA4nmWWFLDvklML3guJTnnLBvLJVgIbY=;
        b=bmu20wZ5lXC+T9AYEFLwsA8BVxMCihqGCwXzxaskLrCErvzjh5tj7X0bvjyyguw4rc
         Jr8h5t6Cw0yr4ux3uoJFOSZIxPjQlzDA0S8m26Olw1wOm1DIVuPgKIYvlK9KaKo72kvo
         DKylv7wsCVJhOfOAlctpDKpwSCKinK4AZPPpRkXYGBHj5deFtC9C39a2D0pPVLwpm64y
         +kSEXh/oS/T/2outLOKbcJXb+T4dmT1jgqZBESP3zssXr/IDrs4igb1PAtq1D7IFshBu
         4OHdpWngYA6vlyNqcAgTQEN6BCg9w1oYS5bJyJdAeujumT3gUoiJ1+MWpDIuzrdayKLn
         t8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961535; x=1795566335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z+N2Sizs3DgoA4nmWWFLDvklML3guJTnnLBvLJVgIbY=;
        b=k2kFpIEKEsz9StOSDZFuqRHOj63A2/pd6YHwvBZrfJVByeb2VHBT37DYBnVU56yF0L
         E1sA9xUkOv/Jb1oPs+Th2fgBCTc3XEJMpEhvufQz1EdgUBi9gBepW/EfIOLFZeKmt1nw
         lBYDfdgqV/rv+nukexSmjky8dKoneo68Qxgrxd5Y/Md7WZ8cIV1LKMsXmjzxJe/26EYW
         mNKXy4YtD9xBfCYYpYsqcq1UCePIwhArcRUmN0K2rypeaZZ5qWF5zJo0r3R5TFeWlwBg
         3z1EoZi7T+GnLB4wNcYDnO2eLS48NOIBBWX43df0iuVcreQb9x/z5wdlQgQVPte2SNPi
         Vj5Q==
X-Forwarded-Encrypted: i=1; AL+hErFi6nEexMjHvW14If6F4kv+4MXQMOdO1vr48JsopveeIrmDWBcwiKvnOxXkI2qIhFUyS18uNeY4QNVQzzI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/gJBh9Afyjdxjb6IJHDcBiRCHl1kRy86phrvP4FIz2Jk95Hqe
	QTSAp6KEffZQkRzO9+XUAQBFFW8tJXyZTo0AHTtj8GZgJ/rZJr71IvU/
X-Gm-Gg: AZFdTZdf/bLbeA8u74GYjNFXJVbnDmLpES/b5Tjyb/sutfePW42uYy9hwq5NWPWVKRs
	5g2mWjaQ3vJppaG6KMRKGIF5ov6oL0oSmisHlf79lhhcHG17zP0rlNv/ZNIsfzrUmoko1UccMBi
	jj8VWQ87BENLrrDQ218ePCU0vYfn9tqpjmh6mKbnKDvb8JZfF5nysapVxuMY25FmQX2akQ1u/qF
	f9UGseVmn4w/HBT3h1ak582snKG4SLfuHKABrDRxRjXuHLJYVTs4yVSwfoQE8I9Tw/TV+O59knG
	coEcS63h7OVGMq0saZvJBOreT1ibPyYoE3GTDz5qJzxcbJVA8yMsvBYx3UZp3VorSMUG81albra
	nEdZhKzl74MLVmdHqbmlXnoXLazsuVRHfovhp3uQLotY7LqXC3xEmuJk1ljMkBkNEkaBEziMLgB
	HUbDoaW3lQyYg4rMEfJ8WkTGdHX2RrDargT60M3xGAHEUoCSNksILc5BZ8SQdRN4ukDUShbaaVk
	tu3S9kswrNPSQmyJhWVAN+yZq5LbOa4+3txmLT3kcmDObWXV8vlbW7qJ14tVcOKLOjfERgmDu0P
	Y2RboT0W7lOXRAzSxyZjICW3nICbN94CsAhlSvvIqKN5op4rm6dLPJFuQVBhOfSEC9fGcV0IGec
	zBDEHdxQOn090LjBadYf5eyqEhmd7dG8u5wFhXmqn2MLiECIuaJ+PxpENG+kOdDKWOBAKhkz24y
	/G/j/lWNNVxB/34vhPrSc2XxsBBitPHjTJvGpDlz9P
X-Received: by 2002:a17:90b:384a:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3b3d079ffd2mr797101a91.19.1794961534698;
        Tue, 17 Nov 2026 16:25:34 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c04020sm1212211a91.17.2026.11.17.16.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:25:34 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>,
	Allen Pais <apais@microsoft.com>,
	Rachel Menge <rachelmenge@linux.microsoft.com>,
	Hardik Garg <hargar@linux.microsoft.com>,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>,
	Gillian Laming <glaming@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] smb: client: fix busy dentry on unmount from cancelled deferred close
Date: Wed, 18 Nov 2026 00:25:29 +0000
Message-ID: <20261118002529.250616-3-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118002529.250616-1-sidchintamaneni@gmail.com>
References: <20261118002529.250616-1-sidchintamaneni@gmail.com>
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

When cifs_close_deferred_file(), cifs_close_all_deferred_files(), or
cifs_close_deferred_file_under_dentry() cancels a pending deferred close
via cancel_delayed_work(&cfile->deferred), the cifsFileInfo is moved to
a thread-local stack list (file_head) before open_file_lock is dropped
and _cifsFileInfo_put() is called outside the lock.

Because tcon->openFileList is shared across superblocks using the same
tree connection, a concurrent operation or unmount on a sibling mount
sharing the tcon can cancel a deferred close work item belonging to a
superblock that is concurrently unmounting. Once cancel_delayed_work()
removes the work from deferredclose_wq, cifs_kill_sb() observes neither
a pending delayed work item on deferredclose_wq nor a non-zero
outstanding_rreq counter, and proceeds to kill_anon_super() before
_cifsFileInfo_put() drops cfile->dentry:

  Thread 1 (umount sb1)            Thread 2 (sibling mount / rename)
  ---------------------            ---------------------------------
                                   cifs_close_all_deferred_files(tcon)
                                     spin_lock(&tcon->open_file_lock)
                                     cancel_delayed_work(&cfile->deferred)
                                     list_add_tail(..., &file_head)
                                     spin_unlock(&tcon->open_file_lock)
  cifs_kill_sb(sb1)
    cifs_close_all_deferred_files_sb()
      [delayed_work_pending == false]
    flush(cifsoplockd_wq)
    flush(deferredclose_wq)
    wait(outstanding_rreq == 0)
    flush(serverclose_wq)
    flush(fileinfo_put_wq)
    kill_anon_super(sb1)
      -> generic_shutdown_super()
         BUG: Dentry still in use (1)
         VFS: Busy inodes after unmount!
                                     _cifsFileInfo_put(cfile, true, false)
                                       dput(cfile->dentry) [too late]

Fix this by incrementing cifs_sb->outstanding_rreq while still holding
open_file_lock whenever cancel_delayed_work(&cfile->deferred) succeeds,
and decrementing it (waking any waiter in cifs_kill_sb()) after
_cifsFileInfo_put() completes.

Fixes: 5efdd9122eff ("smb3: allow deferred close timeout to be configurable")
Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
---
 fs/smb/client/misc.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
index 72a986bfaefc4..5072efd0ea568 100644
--- a/fs/smb/client/misc.c
+++ b/fs/smb/client/misc.c
@@ -502,15 +502,19 @@ cifs_close_deferred_file(struct cifsInodeInfo *cifs_inode)
 {
 	struct cifsFileInfo *cfile = NULL, *failed_cfile = NULL;
 	struct file_list *tmp_list, *tmp_next_list;
+	struct cifs_sb_info *cifs_sb;
 	LIST_HEAD(file_head);
 
 	if (cifs_inode == NULL)
 		return;
 
+	cifs_sb = CIFS_SB(cifs_inode->netfs.inode.i_sb);
+
 	spin_lock(&cifs_inode->open_file_lock);
 	list_for_each_entry(cfile, &cifs_inode->openFileList, flist) {
 		if (delayed_work_pending(&cfile->deferred)) {
 			if (cancel_delayed_work(&cfile->deferred)) {
+				atomic_inc(&cifs_sb->outstanding_rreq);
 				spin_lock(&cifs_inode->deferred_lock);
 				cifs_del_deferred_close(cfile);
 				spin_unlock(&cifs_inode->deferred_lock);
@@ -528,11 +532,16 @@ cifs_close_deferred_file(struct cifsInodeInfo *cifs_inode)
 	}
 	spin_unlock(&cifs_inode->open_file_lock);
 
-	if (failed_cfile)
+	if (failed_cfile) {
 		_cifsFileInfo_put(failed_cfile, false, false);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
+	}
 
 	list_for_each_entry_safe(tmp_list, tmp_next_list, &file_head, list) {
 		_cifsFileInfo_put(tmp_list->cfile, false, false);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
 		list_del(&tmp_list->list);
 		kfree(tmp_list);
 	}
@@ -543,12 +552,15 @@ cifs_close_all_deferred_files(struct cifs_tcon *tcon)
 {
 	struct cifsFileInfo *cfile, *failed_cfile = NULL;
 	struct file_list *tmp_list, *tmp_next_list;
+	struct cifs_sb_info *cifs_sb;
 	LIST_HEAD(file_head);
 
 	spin_lock(&tcon->open_file_lock);
 	list_for_each_entry(cfile, &tcon->openFileList, tlist) {
 		if (delayed_work_pending(&cfile->deferred)) {
 			if (cancel_delayed_work(&cfile->deferred)) {
+				cifs_sb = CIFS_SB(d_inode(cfile->dentry)->i_sb);
+				atomic_inc(&cifs_sb->outstanding_rreq);
 				spin_lock(&CIFS_I(d_inode(cfile->dentry))->deferred_lock);
 				cifs_del_deferred_close(cfile);
 				spin_unlock(&CIFS_I(d_inode(cfile->dentry))->deferred_lock);
@@ -566,11 +578,18 @@ cifs_close_all_deferred_files(struct cifs_tcon *tcon)
 	}
 	spin_unlock(&tcon->open_file_lock);
 
-	if (failed_cfile)
+	if (failed_cfile) {
+		cifs_sb = CIFS_SB(d_inode(failed_cfile->dentry)->i_sb);
 		_cifsFileInfo_put(failed_cfile, true, false);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
+	}
 
 	list_for_each_entry_safe(tmp_list, tmp_next_list, &file_head, list) {
+		cifs_sb = CIFS_SB(d_inode(tmp_list->cfile->dentry)->i_sb);
 		_cifsFileInfo_put(tmp_list->cfile, true, false);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
 		list_del(&tmp_list->list);
 		kfree(tmp_list);
 	}
@@ -618,6 +637,7 @@ void cifs_close_deferred_file_under_dentry(struct cifs_tcon *tcon,
 {
 	struct file_list *tmp_list, *tmp_next_list;
 	struct cifsFileInfo *cfile, *failed_cfile = NULL;
+	struct cifs_sb_info *cifs_sb = CIFS_SB(dentry->d_sb);
 	LIST_HEAD(file_head);
 
 	spin_lock(&tcon->open_file_lock);
@@ -625,6 +645,7 @@ void cifs_close_deferred_file_under_dentry(struct cifs_tcon *tcon,
 		if ((cfile->dentry == dentry) &&
 		    delayed_work_pending(&cfile->deferred) &&
 		    cancel_delayed_work(&cfile->deferred)) {
+			atomic_inc(&cifs_sb->outstanding_rreq);
 			spin_lock(&CIFS_I(d_inode(cfile->dentry))->deferred_lock);
 			cifs_del_deferred_close(cfile);
 			spin_unlock(&CIFS_I(d_inode(cfile->dentry))->deferred_lock);
@@ -640,11 +661,16 @@ void cifs_close_deferred_file_under_dentry(struct cifs_tcon *tcon,
 	}
 	spin_unlock(&tcon->open_file_lock);
 
-	if (failed_cfile)
+	if (failed_cfile) {
 		_cifsFileInfo_put(failed_cfile, true, false);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
+	}
 
 	list_for_each_entry_safe(tmp_list, tmp_next_list, &file_head, list) {
 		_cifsFileInfo_put(tmp_list->cfile, true, false);
+		if (atomic_dec_and_test(&cifs_sb->outstanding_rreq))
+			wake_up_var(&cifs_sb->outstanding_rreq);
 		list_del(&tmp_list->list);
 		kfree(tmp_list);
 	}
-- 
2.43.0

