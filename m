Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021425;
	b=sAtAlTOKBvOlox04DVMlgvr/g4WKoBdGcZbKBvHcVFgRJcS412rRb+JNiuu8aEXaNQGd
	 Isw9qE25581DAixUtRBqcUIOnksjPDJTxx1+4tCXGnuT84CU/skqyTyJ5G3CyBQsdH3Jz
	 e0dxhpJbxL80Nj/ZwBUUaWjEkW/4BD/bTOG9+ybLWGKPoKuumxPEfE5GHdEHTXF+R1Itq
	 HOtWuzD7oE118IvlRaraFAcU8hUdF3gzD4YsUtDgwR5AFusGamCR2RVvU6S4+q7Zw2S8G
	 aBQ4v+2DQ1Fe2r2DKi4GreumpEVoaF20PX2CevWIX2N8JQPC1n4bGHPG/o7FFHp7yfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GDaftTZG2qoD8d5JNs4QEnlOuUEcrK2xcraqbRaCDJg=;
	b=LipWpsayxYOTme0XLGYW3hiqRP7oYz2JfIFcEldWzUnPkeL7D1781xdZx0n/GGr+OpGr
	 6a/VtYgUhVTmS38xlZ4f85xSrS1FkjJsLiWwxHkFCVjU8KsqQeC7ncWSfuxqe7D70bzf+
	 t2/Ob5A+VDF8mKhjr4RUIoVuLmhHhbpBohaSv9+7udx8wr8Qrrtn9Nlge1NKH63wkntNd
	 49r7E0gFqeshMgsKxhbWAsTW2t/6Y4C1s/YS5C8QKW+n/rqNqGMjR67HZNIpr+sgJBXL4
	 QGEO6M3l3/oNHc/q16/WuiHJNUEzsp/LMZtEuip2shnFKLyCJ8Ze2DWqIAUgodI7Ong==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kpkGONn7;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86760A5BFD
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA86760A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kpkGONn7
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso12362377b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1795021424; x=1795626224; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDaftTZG2qoD8d5JNs4QEnlOuUEcrK2xcraqbRaCDJg=;
        b=kpkGONn7RLILDNmnhNLGBgd/HmKU4U2G+A+nbt6T7shuqZDw83TkR8kcQ+o09mCHHr
         a9hjwoRxj2eRp8Pvp7EmSl2aTkosi8JfqlgLSNoAhlDh9ONWKpCSbjEHfQ6ThvVLz2aq
         rVSjt6TMDpCrMgn6n7kje5j+MvklKhCjV8PCWiKN43iNC/AFfBZnBD/Vng7Gm9vhZHFU
         UlEPyIDjPCqWpgZNJfqqTs/McVOfiJQG1r2D3QewxQ9r0ph+R/8oiNrgSUyLbT0nKDlb
         Zv4q9f8muhQ+zoubIBW/qLqwNHLReNsk1nmdo5oHPww8rLFgk9V2TEkY8GXrEa1g5C6P
         QD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021424; x=1795626224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDaftTZG2qoD8d5JNs4QEnlOuUEcrK2xcraqbRaCDJg=;
        b=B9rfMiTISVQH89g+kfrM/AU222yFHcABdY9TJwYTsKh40ESu2LBDGmIjiXyELG5bEq
         Vg66NNAvklDvWFq+9gWZRWq+bTyDLHOCT/hQ1GnSL/PqpskGA/lpLXfw+FO0SaCg3LGd
         dUHSH0QxA17QNyezQGWUatkHSaQsIKS0X/Iqy8mukl7iLHLVRQEuNJ+ZYj7qpwAubdSM
         ZfCQT2QItoYdWYRZ2OyTgU5JuiIZJDMzQp4iNr4fITZhn1yyJg89iwZr9pklzdFpoP5C
         81w3oUMQIzK/pYaD7tlSzWnpbRNkneGNHLQxBBS59eC3oyc5IAPvbScOXKf8KE3LlP/i
         CRuQ==
X-Forwarded-Encrypted: i=1; AL+hErGAEuLEQADdRePSIYc4DMp1k4edShDLeYLsXvXZZjr9DJ5rBb9T6hs7r8XjTOdzxzQH8Y/i8/ZPU4ZAKTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9atN+fp3mNkm2r2ip4Yt7bvNiU1GGAOBJ3s+dUa1ZjWwmZpkbc
	/M/WjKV3Q4iD+3v9kjLC+N/LaSS9PyNK0gLe0MStnoJBtQ4F3e3D7sHJoAO5/88Ulns=
X-Gm-Gg: AZFdTZfA9jh4nlSjKfLbEsk9/fPyNj99g+3Vwfb8LH0H8xvxInH/CMvtDL1I0vWJYm7
	3ERdapi8u/exkeI9U2ir1EpQXPYwOxGzoPce+qJjh5FHFtFxFjzusju+KvEywV2CXK3QFLltH2Z
	6adP/vnmQhsKdf2zBQGnM7lGSRWXieapXZVn7SguGOb02oCVQxp3V6B1jRZZiu4FY9NRZTcbNCm
	zG83I/epwyd6094fFlP4+8Jag26BAKYqlwdu68Jct2TIwreumbQOSkIlMCxACwRHpDGA4McA+3y
	VjMNnRlBiDsWwhuUM8m1hNAPhCeVKAQ8/Zu4ThSA39Up9YZzIZ3kKo05GGmmLkhyEnRbSay302l
	vGSj/WtxECrTibt4fVMvxqep9+GN6BFSQXeAtxAFw8sYz2Opt1EwMwMahiG/gLk2GIRxa/F0ZbE
	daoUkO3/fvTuKFT1tvUVYJiIIBBCLHTSZ6As6AJ8DSpy9/J5nn7gROe5hvXFN2QY70fXhxYgwEd
	+riDaPmJqQjFeLMU3ZsPDPi/y2ll4367ZD0fs9ouu9xNqiCaXKfyW7DoKqWn/RrAaYu9qY++wj/
	taZDIPsZYDPZQ53HHBwmnVfMaepJcmR5HovSVsTyK703qA==
X-Received: by 2002:a05:690c:6987:b0:8b0:a8c1:b203 with SMTP id 00721157ae682-8b4fed186bamr13298507b3.29.1795021423355;
        Wed, 18 Nov 2026 09:03:43 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bb7125sm3914951cf.16.2026.11.18.09.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:03:42 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 18 Nov 2026 17:03:30 +0000
Subject: [PATCH v7 7/7] ovl: implement containerized syncfs for overlayfs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-b4-ovl-containerized-sync-v7-7-54f45743fe55@toxicpanda.com>
References: <20261118-b4-ovl-containerized-sync-v7-0-54f45743fe55@toxicpanda.com>
In-Reply-To: <20261118-b4-ovl-containerized-sync-v7-0-54f45743fe55@toxicpanda.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
 Chengguang Xu <cgxu519@mykernel.net>, linux-unionfs@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chengguang Xu <charliecgxu@tencent.com>, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1795021413; l=13738;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=xwQopqxAspN2Y7uS8EZ8sE3hY8fEG+A084bV3fjgQR8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEPNbGuvH/0gkRcepth3B5DQwgGs5rbVfSl/WtuZu45diccdoGHBVxsXqqEIp3d4s8EgXMXEPBA
 PYLYCVr5bfgU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

From: Chengguang Xu <charliecgxu@tencent.com>

Now overlayfs can only sync own dirty inodes during syncfs,
so remove unnecessary sync_filesystem() on upper file system.

Do that with fsync=relaxed only, which is what the default, fsync=auto,
selects on most filesystems.  fsync=on brings the old behaviour back.

Take the steps of sync_filesystem() for the upper filesystem, but only for
the tracked inodes, and go about it like the page cache does.

Without wait, ->sync_fs() gives every inode that is marked dirty the
towrite mark.  That is what this sync has to write.  Then it starts
writeback of the upper inode of each of them, and replaces dirty and
towrite by the writeback mark.

With wait, for every inode with the writeback mark, it calls
write_inode_for_sync(), which also hands over the timestamps that lazytime
has deferred, and waits for the data, whoever has started to write it.

Both end with sync_fs_and_bdev(), which is what sync_filesystem() does
after the inodes.  Do the same for unmount and for a read-only remount.

A sync tags once, so tasks that modify files do not keep it going.  The
marks are shared by all syncs that are running, so it also writes and waits
for what another one tags ahead of it.  A walk only goes up, so it ends.

In the page cache the completion of the I/O clears the writeback mark.
Here whoever has waited does, and another sync may have started the inode
again meanwhile.  So the mark only goes if the upper inode is seen clean.
Until then every sync sees the inode and waits for it as well, so they do
not have to wait for each other.  Otherwise the inode is marked dirty
again, which also covers an upper inode that is open for writing: stores
through a shared mapping do not call into overlayfs.

That does not cover pages that are pinned through such a mapping.  A direct
read into it that completes after the last munmap() and close() dirties
them when the inode may have left the set, and the next syncfs() does not
write them.

syncfs() now also returns the error of writeback that the flusher of the
upper filesystem has done before, which it did not do so far.  It compares
the wb_err of the upper mapping with what it was when the inode entered the
set.  Unlike the error flags of the mapping, nobody can take that away, an
fsync() for one.  The error is recorded in the superblock of the overlay
under the lock that protects the cursor, so another syncfs() that runs at
the same time gets it as well.

A read-only remount of the overlay syncs it the same way, so it now fails
with such an error, once.

Keep a freeze and a read-only remount of the upper filesystem out while an
inode is handed over.  If one has already begun when ->sync_fs() is to
wait, sync the whole upper filesystem, like before.  If one kept it from
starting an inode and has gone away since, start that inode then.

Upper inodes that have no overlay inode, like whiteouts and the work
directories, are not tracked.  It is up to ->sync_fs() and the block device
to get them to disk.  ext4, xfs and btrfs log all metadata, and ext4
without a journal keeps it in the buffers of the block device.

With many containers on one upper filesystem, stopping one of them no
longer writes out the dirty data of all the others.

Signed-off-by: Chengguang Xu <charliecgxu@tencent.com>
[josef: everything after the first paragraph]
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 Documentation/filesystems/overlayfs.rst |   7 +-
 fs/overlayfs/overlayfs.h                |   1 +
 fs/overlayfs/params.c                   |  14 +--
 fs/overlayfs/super.c                    |   3 +
 fs/overlayfs/sync.c                     | 217 ++++++++++++++++++++++++++++++++
 5 files changed, 230 insertions(+), 12 deletions(-)

diff --git a/Documentation/filesystems/overlayfs.rst b/Documentation/filesystems/overlayfs.rst
index 8a007fbc5257..00e2cba65e2c 100644
--- a/Documentation/filesystems/overlayfs.rst
+++ b/Documentation/filesystems/overlayfs.rst
@@ -830,7 +830,12 @@ Traditionally, syncfs(2) and unmount of an overlay sync the entire upper
 filesystem, including the dirty data of other overlays that share it.
 Overlayfs can be told to only write back the files that were modified
 through the overlay, and then ask the upper filesystem to commit its
-metadata.
+metadata and write its block device.
+
+In that mode syncfs(2) also returns the error of writeback of such a file
+that has failed earlier, like fsync(2) on the file does.  As after fsync(2),
+a file that is opened on the upper filesystem later does not get that error
+any more.  A read-only remount of the overlay fails with such an error once.
 
 On traditional local filesystems with a single journal (e.g. ext4, xfs),
 fsync on a file also persists the parent directory changes, because they
diff --git a/fs/overlayfs/overlayfs.h b/fs/overlayfs/overlayfs.h
index f4770b4c0222..63200551a7d0 100644
--- a/fs/overlayfs/overlayfs.h
+++ b/fs/overlayfs/overlayfs.h
@@ -899,6 +899,7 @@ void ovl_forget_inode(struct inode *inode);
 void ovl_drop_tracked(struct ovl_fs *ofs);
 long ovl_nr_cached_objects(struct super_block *sb, struct shrink_control *sc);
 long ovl_free_cached_objects(struct super_block *sb, struct shrink_control *sc);
+int ovl_sync_tracked(struct super_block *sb, int wait);
 
 /* vfs fileattr flags read from overlay.protattr xattr to ovl inode */
 #define OVL_PROT_I_FLAGS_MASK  (S_APPEND | S_IMMUTABLE)
diff --git a/fs/overlayfs/params.c b/fs/overlayfs/params.c
index 370dd6341392..90111c480440 100644
--- a/fs/overlayfs/params.c
+++ b/fs/overlayfs/params.c
@@ -774,22 +774,14 @@ static int ovl_reconfigure(struct fs_context *fc)
 {
 	struct super_block *sb = fc->root->d_sb;
 	struct ovl_fs *ofs = OVL_FS(sb);
-	struct super_block *upper_sb;
-	int ret = 0;
 
 	if (!(fc->sb_flags & SB_RDONLY) && ovl_force_readonly(ofs))
 		return -EROFS;
 
-	if (fc->sb_flags & SB_RDONLY && !sb_rdonly(sb)) {
-		upper_sb = ovl_upper_mnt(ofs)->mnt_sb;
-		if (ovl_should_sync(ofs)) {
-			down_read(&upper_sb->s_umount);
-			ret = sync_filesystem(upper_sb);
-			up_read(&upper_sb->s_umount);
-		}
-	}
+	if (fc->sb_flags & SB_RDONLY && !sb_rdonly(sb) && ovl_should_sync(ofs))
+		return sync_filesystem(sb);
 
-	return ret;
+	return 0;
 }
 
 static const struct fs_context_operations ovl_context_ops = {
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index 7f7d3993bc7a..a2d527f62d75 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -287,6 +287,9 @@ static int ovl_sync_fs(struct super_block *sb, int wait)
 	if (!ret)
 		return ret;
 
+	if (!ovl_should_sync_upper_fs(ofs))
+		return ovl_sync_tracked(sb, wait);
+
 	/*
 	 * Not called for sync(2) call or an emergency sync (SB_I_SKIP_SYNC).
 	 * All the super blocks will be iterated, including upper_sb.
diff --git a/fs/overlayfs/sync.c b/fs/overlayfs/sync.c
index 03dfd903bf08..55d40cde8984 100644
--- a/fs/overlayfs/sync.c
+++ b/fs/overlayfs/sync.c
@@ -372,3 +372,220 @@ long ovl_free_cached_objects(struct super_block *sb, struct shrink_control *sc)
 
 	return 0;
 }
+
+/*
+ * Keep a freeze and a read-only remount of the upper filesystem out.  Do not
+ * wait for either.
+ */
+static bool ovl_upper_start_write(struct ovl_fs *ofs)
+{
+	struct vfsmount *mnt = ovl_upper_mnt(ofs);
+
+	if (!sb_start_write_trylock(mnt->mnt_sb))
+		return false;
+	if (mnt_get_write_access(mnt)) {
+		sb_end_write(mnt->mnt_sb);
+		return false;
+	}
+	return true;
+}
+
+/*
+ * Like tag_pages_for_writeback(): what is dirty now is what this sync has to
+ * write.
+ */
+static void ovl_tag_for_writeback(struct ovl_fs *ofs)
+{
+	XA_STATE(xas, &ofs->tracked, 0);
+	unsigned int tagged = 0;
+	struct inode *inode;
+
+	xas_lock(&xas);
+	xas_for_each_marked(&xas, inode, ULONG_MAX, OVL_X_DIRTY) {
+		xas_set_mark(&xas, OVL_X_TOWRITE);
+		if (++tagged % XA_CHECK_SCHED)
+			continue;
+
+		xas_pause(&xas);
+		xas_unlock(&xas);
+		cond_resched();
+		xas_lock(&xas);
+	}
+	xas_unlock(&xas);
+}
+
+/*
+ * Start to write the data of the upper inode.  OVL_X_WRITEBACK is set before
+ * OVL_X_DIRTY is cleared, so that a sync always finds one of them, and
+ * OVL_X_DIRTY is cleared before the write, so that a modification that comes
+ * later sets it again.
+ */
+static void ovl_start_inode(struct super_block *sb, struct inode *inode)
+{
+	struct ovl_fs *ofs = OVL_FS(sb);
+	unsigned long id = ovl_slot(inode);
+	bool start;
+	int err;
+
+	spin_lock(&inode->i_lock);
+	/* It may have been unlinked, or another sync was here first */
+	start = xa_get_mark(&ofs->tracked, id, OVL_X_TOWRITE);
+	if (start) {
+		xa_set_mark(&ofs->tracked, id, OVL_X_WRITEBACK);
+		ovl_clear_dirty(ofs, inode);
+	}
+	spin_unlock(&inode->i_lock);
+
+	if (!start)
+		return;
+
+	/* Tags the pages first, so it does not follow an appender */
+	err = filemap_fdatawrite(ovl_inode_upper(inode)->i_mapping);
+	/* If ->sync_fs() returned it the VFS would not call again to wait */
+	if (err)
+		errseq_set(&sb->s_wb_err, err);
+}
+
+/*
+ * Write the upper inode and wait for its data, whoever has started to write it.
+ *
+ * After that OVL_X_WRITEBACK goes if the upper inode is clean.  If it is not,
+ * another sync may have started it again and relies on the mark, or it is open
+ * for writing and the next sync has to write it again.
+ *
+ * Writeback of the upper inode that has failed since @inode has entered the
+ * set, whoever has done it, shows in the wb_err of the mapping.  Nobody takes
+ * that away, unlike the error flags.  It is recorded in the superblock of the
+ * overlay under the lock that protects the cursor.  So another syncfs() that is
+ * here at the same time finds the one or the other.
+ *
+ * btrfs records an error after it has ended writeback.  If that is too late for
+ * the look here, the error is reported once the inode is modified again.
+ */
+static int ovl_wait_inode(struct super_block *sb, struct inode *inode)
+{
+	struct ovl_fs *ofs = OVL_FS(sb);
+	struct inode *upper = ovl_inode_upper(inode);
+	struct address_space *mapping = upper->i_mapping;
+	unsigned long id = ovl_slot(inode);
+	bool drop = false;
+	int err, err2 = 0;
+
+	err = write_inode_for_sync(upper);
+	if (err)
+		errseq_set(&sb->s_wb_err, err);
+	filemap_fdatawait_keep_errors(mapping);
+
+	spin_lock(&inode->i_lock);
+	if (xa_get_mark(&ofs->tracked, id, OVL_X_WRITEBACK)) {
+		err2 = errseq_check_and_advance(&mapping->wb_err,
+						&OVL_I(inode)->wb_err);
+		if (err2)
+			errseq_set(&sb->s_wb_err, err2);
+
+		if (ovl_upper_clean(inode)) {
+			xa_clear_mark(&ofs->tracked, id, OVL_X_WRITEBACK);
+			drop = !ovl_marked(ofs, id);
+			if (drop)
+				atomic_long_dec(&ofs->nr_tracked);
+		} else {
+			ovl_set_dirty(ofs, inode);
+		}
+	}
+	spin_unlock(&inode->i_lock);
+
+	if (drop)
+		iput(inode);
+	return err ? err : err2;
+}
+
+/*
+ * Start every inode that has OVL_X_TOWRITE, or finish every inode that has
+ * OVL_X_WRITEBACK.
+ *
+ * Do not write to an upper filesystem that is frozen or read-only, or on its
+ * way there.  Keep a freeze and a read-only remount out meanwhile, inode by
+ * inode, because writers wait behind a freeze that waits for us.
+ *
+ * Returns false if one of the two has begun.
+ */
+static bool ovl_walk_marked(struct super_block *sb, xa_mark_t mark, int *error)
+{
+	struct ovl_fs *ofs = OVL_FS(sb);
+	struct inode *inode;
+	unsigned long id = 0;
+	int err;
+
+	for (;;) {
+		if (!ovl_upper_start_write(ofs))
+			return false;
+
+		inode = ovl_next_marked(ofs, &id, mark);
+		if (inode && mark == OVL_X_TOWRITE) {
+			ovl_start_inode(sb, inode);
+		} else if (inode) {
+			err = ovl_wait_inode(sb, inode);
+			if (err && !*error)
+				*error = err;
+		}
+		iput(inode);
+		mnt_drop_write(ovl_upper_mnt(ofs));
+
+		if (!inode)
+			return true;
+		id++;
+		cond_resched();
+	}
+}
+
+/*
+ * This tags once, so tasks that modify files do not keep it going.  The marks
+ * are shared with every other sync that is running, and what those tag ahead of
+ * a walk is written and waited for as well.  But a walk only goes up, so it
+ * comes to an end.
+ */
+static bool ovl_sync_inodes(struct super_block *sb, int wait, int *error)
+{
+	if (!wait)
+		ovl_tag_for_writeback(OVL_FS(sb));
+
+	/*
+	 * With @wait this is for what the call before could not start, because
+	 * of a freeze or a remount that has gone away again.
+	 */
+	if (!ovl_walk_marked(sb, OVL_X_TOWRITE, error))
+		return false;
+
+	return !wait || ovl_walk_marked(sb, OVL_X_WRITEBACK, error);
+}
+
+/*
+ * syncfs(), unmount or a read-only remount of an overlay with fsync=relaxed.
+ * sync_filesystem() calls this without @wait first and then with.  The steps
+ * are those that it takes itself for the upper filesystem, except that only the
+ * tracked inodes are written.
+ */
+int ovl_sync_tracked(struct super_block *sb, int wait)
+{
+	struct super_block *upper_sb = ovl_upper_mnt(OVL_FS(sb))->mnt_sb;
+	int ret, err = 0;
+	bool done;
+
+	done = ovl_sync_inodes(sb, wait, &err);
+
+	down_read(&upper_sb->s_umount);
+	/*
+	 * If the upper filesystem is frozen or read-only, or on its way there,
+	 * sync all of it when asked to wait, like without fsync=relaxed.
+	 *
+	 * Otherwise this has to take care of the upper inodes that have no
+	 * overlay inode, like whiteouts and the work directories.
+	 */
+	if (wait && !done)
+		ret = sync_filesystem(upper_sb);
+	else
+		ret = sync_fs_and_bdev(upper_sb, wait);
+	up_read(&upper_sb->s_umount);
+
+	return err ? err : ret;
+}

-- 
2.55.0

