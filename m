Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795039335;
	b=v+yQtYiLULKlDUzCh67HJQ5Euv69/ogi/y65/7POPz4/qq6Fk9tWTiRtD+bLR6B0tZw4
	 3oNgaB3k0GMnFk2lQWV3M+XaYpX+jpPYrVhyKuK/aL1xOnrCaZHedMi0InbA55mCxu834
	 Yd9ilPPvYiaA3fIdx9aY9rn1diEOrv2qOz0/X1kjWMxSnrwXZffanFOWJA3Y8Wn5d4rSo
	 GXS+wTVQHSYqHV4VG4LqdR2mEPwHml37cC/L71Umaqko3CdPE5h6w17DXUMhYrbWIYWO2
	 vTxUtqrlyQKxQjWWw301qn2CP2ZBuHC8Mw6V5/Xmou1/MxiizvixCYr7wHCJ6fkA2Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795039335;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0XpQgPfzz91bC+Ytjlo7UbbBYusCW9hUg8wtpu39DmY=;
	b=aUzYUNhH/QGch3AVFtAui2/qikxv8FdMSGoQcT8IBiw8CZPB3r0DFaUtUCoNrmGoKZB4
	 2lnT3iuz8SejkR7gvAuboiQFBy/qah4/CunsgxjyZTlgX3OYvq0cU7r7iC4PwIO4mKiwV
	 esrgCSV3PKtRRd33N8mY5jF6w2ljzID3NY2gXyQSwOqGwP6TSVa8FsMrOE5QTN/OD0sZa
	 clnuAuLOi4gPSS/XAIFkWzrCvNrtaVKUUM+OYaypXH+Y4tF26KPljMpfF4IMuE3g7uO0c
	 GwKtT//wqooS5CBWcrAfwP+6rPzikZI1AaN8AoiTGhf06o0ZgOphl2lIVJm1EWL4OJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="b+y/HyLK";
	arc=none smtp.remote-ip=95.215.58.153
Received: from mta1.migadu.com (out-153.mta1.migadu.com [95.215.58.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E7060A2621
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E7060A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b+y/HyLK
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wPJFqCh3ssVP9dOgl/9TbS9is4kwh2hoieF8pl8/yRs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795039332; v=1; x=1795644132;
 b=b+y/HyLKKhUGIdGGqYKrv1mzn/Cx+4N4SK93IZYmVjnmXkbGe9cQ6RCo4vYtCfWoehLoXS4f
 tn/yZTT73kPlsd6g9n3wbkghlYSR7uNGwxznmTXceh+NoK5GfjPPbe4uMPmKYECcS+cVLrO6T+H
 Qlc1fbPFrrK+a2bKioklXTPA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9290b7ae36d3fbbe;
	Wed, 18 Nov 2026 22:02:12 +0000
X-Mizu-Trace-ID: 9290b7ae36d3fbbe
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Christian Brauner <brauner@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Ian Kent <raven@themaw.net>,
	"T . J . Mercier" <tjmercier@google.com>,
	Meta kernel team <kernel-team@meta.com>,
	linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] kernfs: update a directory's times without kernfs_iattr_rwsem
Date: Wed, 18 Nov 2026 14:01:52 -0800
Message-ID: <20261118220154.2965621-6-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261118220154.2965621-1-shakeel.butt@linux.dev>
References: <20261118220154.2965621-1-shakeel.butt@linux.dev>
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

kernfs_add_one() and __kernfs_remove() update the parent's ctime and
mtime under kernfs_iattr_rwsem for writing, inside kernfs_rwsem.  This
is where cgroup mkdirs block on Meta fleet: the writer waits for every
path walk's permission check while it holds kernfs_rwsem and
cgroup_mutex.

The lock keeps the times stable for getattr, now their only reader, and
a timespec64 is too wide for a single store.  Give the three times a
seqlock instead.  setattr takes it in addition to kernfs_iattr_rwsem,
adding or removing an entry takes only the seqlock, and getattr retries
if a write was in progress.  Adding or removing an entry reads the clock
with the seqlock held, so updates store their times in the order they
happen.  A racing stat() can see the new link count with the old times,
or the reverse.

A directory without iattrs still skips the update.  So that an update
racing with setting up the iattrs is not lost, take the seqlock of new
iattrs before publishing them and set their times after.  An update
that found no iattrs ran before the times were set, and a writer that
finds the new iattrs waits for them. mkdir no longer takes
kernfs_iattr_rwsem for writing.

kernfs_iattr_rwsem write acquisitions (lock_stat), before -> after:

  5 dummy netdevs created and removed      740 ->  370
  100 cgroup mkdirs and 100 rmdirs        3000 -> 1500

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 fs/kernfs/dir.c             | 26 ++----------
 fs/kernfs/inode.c           | 85 ++++++++++++++++++++++++++++++-------
 fs/kernfs/kernfs-internal.h |  2 +
 3 files changed, 75 insertions(+), 38 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 890aca5d8d70..8686219b826f 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -825,7 +825,6 @@ struct kernfs_node *kernfs_find_and_get_node_by_id(struct kernfs_root *root,
 int kernfs_add_one(struct kernfs_node *kn)
 {
 	struct kernfs_root *root = kernfs_root(kn);
-	struct kernfs_iattrs *ps_iattr;
 	struct kernfs_node *parent;
 	bool has_ns;
 	int ret;
@@ -853,16 +852,7 @@ int kernfs_add_one(struct kernfs_node *kn)
 	if (ret)
 		goto out_unlock;
 
-	/* Update timestamps on the parent */
-	down_write(&root->kernfs_iattr_rwsem);
-
-	ps_iattr = parent->iattr;
-	if (ps_iattr) {
-		ktime_get_real_ts64(&ps_iattr->ia_ctime);
-		ps_iattr->ia_mtime = ps_iattr->ia_ctime;
-	}
-
-	up_write(&root->kernfs_iattr_rwsem);
+	kernfs_dir_update_times(parent);
 
 	/*
 	 * Activate the new node unless CREATE_DEACTIVATED is requested.
@@ -1635,20 +1625,12 @@ static void __kernfs_remove(struct kernfs_node *kn)
 		 * to decide who's responsible for cleanups.
 		 */
 		if (!parent || kernfs_unlink_sibling(pos)) {
-			struct kernfs_iattrs *ps_iattr =
-				parent ? parent->iattr : NULL;
-
 			down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
-
 			kernfs_clear_inode_nlink(pos);
-
-			/* update timestamps on the parent */
-			if (ps_iattr) {
-				ktime_get_real_ts64(&ps_iattr->ia_ctime);
-				ps_iattr->ia_mtime = ps_iattr->ia_ctime;
-			}
-
 			up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
+
+			if (parent)
+				kernfs_dir_update_times(parent);
 			kernfs_put(pos);
 		}
 
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index ca234f69882b..580095e0fad9 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -24,6 +24,22 @@ static const struct inode_operations kernfs_iops = {
 	.listxattr	= kernfs_iop_listxattr,
 };
 
+/* Copy the times of @attrs.  Writers hold ia_time_lock. */
+static void kernfs_iattrs_get_times(struct kernfs_iattrs *attrs,
+				    struct timespec64 *atime,
+				    struct timespec64 *mtime,
+				    struct timespec64 *ctime)
+{
+	unsigned int seq;
+
+	do {
+		seq = read_seqbegin(&attrs->ia_time_lock);
+		*atime = attrs->ia_atime;
+		*mtime = attrs->ia_mtime;
+		*ctime = attrs->ia_ctime;
+	} while (read_seqretry(&attrs->ia_time_lock, seq));
+}
+
 static struct kernfs_iattrs *__kernfs_iattrs(struct kernfs_node *kn, bool alloc)
 {
 	struct kernfs_iattrs *ret __free(kfree) = NULL;
@@ -41,16 +57,28 @@ static struct kernfs_iattrs *__kernfs_iattrs(struct kernfs_node *kn, bool alloc)
 	/* assign default attributes */
 	ret->ia_uid = GLOBAL_ROOT_UID;
 	ret->ia_gid = GLOBAL_ROOT_GID;
-
-	ktime_get_real_ts64(&ret->ia_atime);
-	ret->ia_mtime = ret->ia_atime;
-	ret->ia_ctime = ret->ia_atime;
+	seqlock_init(&ret->ia_time_lock);
 
 	simple_xattr_limits_init(&ret->xattr_limits);
 
+	/*
+	 * Publish with ia_time_lock held and set the times after.  An entry
+	 * added or removed while @kn had no iattrs is then covered, and a
+	 * writer that finds the new iattrs waits instead of being
+	 * overwritten.
+	 */
+	write_seqlock(&ret->ia_time_lock);
+
 	/* If someone raced us, recognize it. */
-	if (!try_cmpxchg(&kn->iattr, &attr, ret))
+	if (!try_cmpxchg(&kn->iattr, &attr, ret)) {
+		write_sequnlock(&ret->ia_time_lock);
 		return READ_ONCE(kn->iattr);
+	}
+
+	ktime_get_real_ts64(&ret->ia_atime);
+	ret->ia_mtime = ret->ia_atime;
+	ret->ia_ctime = ret->ia_atime;
+	write_sequnlock(&ret->ia_time_lock);
 
 	return no_free_ptr(ret);
 }
@@ -78,12 +106,16 @@ int __kernfs_setattr(struct kernfs_node *kn, const struct iattr *iattr)
 		attrs->ia_uid = iattr->ia_uid;
 	if (ia_valid & ATTR_GID)
 		attrs->ia_gid = iattr->ia_gid;
-	if (ia_valid & ATTR_ATIME)
-		attrs->ia_atime = iattr->ia_atime;
-	if (ia_valid & ATTR_MTIME)
-		attrs->ia_mtime = iattr->ia_mtime;
-	if (ia_valid & ATTR_CTIME)
-		attrs->ia_ctime = iattr->ia_ctime;
+	if (ia_valid & (ATTR_ATIME | ATTR_MTIME | ATTR_CTIME)) {
+		write_seqlock(&attrs->ia_time_lock);
+		if (ia_valid & ATTR_ATIME)
+			attrs->ia_atime = iattr->ia_atime;
+		if (ia_valid & ATTR_MTIME)
+			attrs->ia_mtime = iattr->ia_mtime;
+		if (ia_valid & ATTR_CTIME)
+			attrs->ia_ctime = iattr->ia_ctime;
+		write_sequnlock(&attrs->ia_time_lock);
+	}
 	if (ia_valid & ATTR_MODE)
 		kn->mode = iattr->ia_mode;
 	return 0;
@@ -159,6 +191,29 @@ static inline void set_inode_attr(struct inode *inode,
 	inode->i_gid = attrs->ia_gid;
 }
 
+/**
+ * kernfs_dir_update_times - set a directory's ctime and mtime to now
+ * @kn: the directory, kept alive by the caller
+ *
+ * Call after adding or removing an entry, with kernfs_rwsem held for
+ * writing.  Does nothing if @kn has no iattrs yet.
+ */
+void kernfs_dir_update_times(struct kernfs_node *kn)
+{
+	struct kernfs_iattrs *attrs = kernfs_iattrs_noalloc(kn);
+
+	lockdep_assert_held_write(&kernfs_root(kn)->kernfs_rwsem);
+
+	if (!attrs)
+		return;
+
+	/* Read the clock under the lock, so updates store times in order. */
+	write_seqlock(&attrs->ia_time_lock);
+	ktime_get_real_ts64(&attrs->ia_ctime);
+	attrs->ia_mtime = attrs->ia_ctime;
+	write_sequnlock(&attrs->ia_time_lock);
+}
+
 /*
  * Get a directory's link count: its subdirectories plus two, or 0 once
  * its removal has started.  Return false for other nodes.
@@ -208,11 +263,9 @@ int kernfs_iop_getattr(const struct mnt_idmap *idmap,
 	 * Report them from the node.
 	 */
 	attrs = kernfs_iattrs_noalloc(kn);
-	if (attrs) {
-		stat->atime = attrs->ia_atime;
-		stat->mtime = attrs->ia_mtime;
-		stat->ctime = attrs->ia_ctime;
-	}
+	if (attrs)
+		kernfs_iattrs_get_times(attrs, &stat->atime, &stat->mtime,
+					&stat->ctime);
 	if (kernfs_dir_nlink(kn, &nlink))
 		stat->nlink = nlink;
 	up_read(&root->kernfs_iattr_rwsem);
diff --git a/fs/kernfs/kernfs-internal.h b/fs/kernfs/kernfs-internal.h
index 2e364b626c1e..9bba1fc8acfd 100644
--- a/fs/kernfs/kernfs-internal.h
+++ b/fs/kernfs/kernfs-internal.h
@@ -25,6 +25,7 @@ struct kernfs_iattrs {
 	struct timespec64	ia_atime;
 	struct timespec64	ia_mtime;
 	struct timespec64	ia_ctime;
+	seqlock_t		ia_time_lock;	/* protects the times above */
 
 	struct list_head	xattrs;
 	struct simple_xattr_limits xattr_limits;
@@ -188,6 +189,7 @@ int kernfs_iop_getattr(const struct mnt_idmap *idmap,
 		       u32 request_mask, unsigned int query_flags);
 ssize_t kernfs_iop_listxattr(struct dentry *dentry, char *buf, size_t size);
 int __kernfs_setattr(struct kernfs_node *kn, const struct iattr *iattr);
+void kernfs_dir_update_times(struct kernfs_node *kn);
 
 /*
  * dir.c
-- 
2.53.1-Meta

