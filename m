Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795351245;
	b=BLk91cDs4gYwzPO9E4MouTIxFZQbxq0RS0+TDABtfNNrnqhHuVgj6OU1LqXQtRKVg7Nc
	 gEUiAUNN5Ph2W/WGaWIBo5RwPuy6mRpERk1urjSYZCpHfONwBoiQxNEnhPc7KmD5p4ygX
	 9XxZxoyzykFbrVPlmUiPi/VhMpRHuAhpmpE9qpubgoQa0Pkk+ClGhodm+dhFiWXTkikod
	 qfOQXgiWtk5vgbjExSWOSANAYwD9yItcHcn8hfI0FDljCH5N2GXsNGzIfESg9jpOKDVOA
	 qCbWoO+/P7ga1t5FEBYgkblBCl9ohBNEQvPhxQxnVWaa4ADz/61PD755tYe1JtkM+tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795351245;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-type:
	 Content-Transfer-Encoding;
	bh=cdSgugpkftqzOIkaqIninFyN6NpM7RgXI07YueRjrWI=;
	b=FJvq4jZ6/dyCVvyzKlvyF8XnEuiUr2q+Y43fL07WTlY8rbk4jidGxaQ0fPZwXrf4kqAi
	 5GMmgYE9mHR92iXGRMOZP1X+OMcPJEP5UGkUDRTCFYmoXv+NhtFtOvd72pGAru1wi2INS
	 yA6u3xysynCAZkqrC5ZMSWMSUWjxBpOGQhICSHcMUu2yg3p/8L8+WDCWV3lFqfPIkN4FC
	 iEfwXw6BpVRE/fI1iLXkD6AvEgT8xzTiyO25jaUKgWy/5lM52HI2ErNGWJbCwJ84cKC8l
	 bU6+Iv35pIfrooDAWEXSKweMXF9GHly5zF/lC3K79h54Rfpu1S6wBDd75gCbefNPTLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aHpDgaMz;
	arc=none smtp.remote-ip=91.218.175.43
Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF434606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF434606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aHpDgaMz
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6klAZhcqi6Lxv1H5Iuh6bSjCwyF2IL6jR8nNZYpIyqE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795351242; v=1; x=1795956042;
 b=aHpDgaMzlfD73k3KY3zOu87nI/GDWFDUWarV96phsglq5sY3cVqWsG4OKDcQRjtJAKkP7/th
 GwiPMa1gRo2avyH6+AmW27Zz2d3hUq3kqStcKbsamakRJVtJ+ilZ958krXydilkxEPMQVsmvWU7
 hr/eYPs7r64a4NRxJonCpCT8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 5f704cb376f548c0;
	Sun, 22 Nov 2026 12:40:32 +0000
X-Mizu-Trace-ID: 5f704cb376f548c0
X-Migadu-Flow: FLOW_OUT
From: Baoquan He <baoquan.he@linux.dev>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	urezki@gmail.com,
	chrisl@kernel.org,
	kasong@tencent.com,
	nphamcs@gmail.com,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	hannes@cmpxchg.org,
	yosry@kernel.org,
	chengming.zhou@linux.dev,
	corbet@lwn.net,
	kunwu.chan@gmail.com,
	klarasmodin@gmail.com,
	linux-kernel@vger.kernel.org,
	baoquan.he@linux.dev,
	Baoquan He <hebaoquan@kylinos.cn>
Subject: [PATCH v6 07/14] mm, swap: refactor swapoff and add xswap_destroy
Date: Sun, 22 Nov 2026 20:39:11 +0800
Message-ID: <20261122123918.3486916-8-baoquan.he@linux.dev>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261122123918.3486916-1-baoquan.he@linux.dev>
References: <20261122123918.3486916-1-baoquan.he@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

From: Baoquan He <hebaoquan@kylinos.cn>

Extract __swapoff() from sys_swapoff() so the teardown logic can be
shared, and make it work for file-less devices.

Add xswap_destroy(), reached through the name /proc/swaps prints.
"xswap" is not a path, so the name cannot be opened, and "swapoff -a"
passes it back unchanged.

A real file or directory keeps precedence: only a name that cannot be
opened (-ENOENT) is taken for the device, so a plain file is never
mistaken for it.  The name is compared with strcmp() against the one
name the kernel prints, so there is no parsing.

Destroy is serialized with create by xswap_ctl_lock, and it refuses a
device that is pinned for hibernation.

Signed-off-by: Baoquan He <hebaoquan@kylinos.cn>
---
 mm/swapfile.c | 148 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 127 insertions(+), 21 deletions(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 4e598ab8da65..1f319e365b68 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -69,6 +69,8 @@
 
 static int xswap_create(int prio);
 static int xswap_create_by_name(const char *name, int swap_flags);
+static int xswap_destroy(void);
+static int xswap_destroy_by_name(const char *name);
 
 /* Serializes create and destroy: at most one xswap device exists. */
 static DEFINE_MUTEX(xswap_ctl_lock);
@@ -77,6 +79,11 @@ static inline int xswap_create_by_name(const char *name, int swap_flags)
 {
 	return -ENOENT;
 }
+
+static inline int xswap_destroy_by_name(const char *name)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_XSWAP */
 
 static void swap_range_alloc(struct swap_info_struct *si,
@@ -3360,13 +3367,14 @@ static void flush_percpu_swap_cluster(struct swap_info_struct *si)
 	}
 }
 
+static int swap_info_remove(struct swap_info_struct *p);
+static int __swapoff(struct swap_info_struct *p);
 
 SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 {
 	struct swap_info_struct *p = NULL;
-	struct file *swap_file, *victim;
+	struct file *victim;
 	struct address_space *mapping;
-	struct inode *inode;
 	int err, found = 0;
 
 	if (!capable(CAP_SYS_ADMIN))
@@ -3375,15 +3383,30 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	BUG_ON(!current->mm);
 
 	CLASS(filename, pathname)(specialfile);
+	if (IS_ERR(pathname))
+		return PTR_ERR(pathname);
+
 	victim = file_open_name(pathname, O_RDWR|O_LARGEFILE, 0);
-	if (IS_ERR(victim))
-		return PTR_ERR(victim);
+	if (IS_ERR(victim)) {
+		/*
+		 * /proc/swaps shows a name that cannot be opened; accept it
+		 * so swapoff -a works.  Only -ENOENT means "no such path",
+		 * so a file of that name keeps precedence.
+		 */
+		if (PTR_ERR(victim) != -ENOENT)
+			return PTR_ERR(victim);
+
+		err = xswap_destroy_by_name(pathname->name);
+		if (err == -ENOENT)
+			return PTR_ERR(victim);
+		return err;
+	}
 
 	mapping = victim->f_mapping;
 	spin_lock(&swap_lock);
 	plist_for_each_entry(p, &swap_active_head, list) {
 		if (p->flags & SWP_WRITEOK) {
-			if (p->swap_file->f_mapping == mapping) {
+			if (p->swap_file && p->swap_file->f_mapping == mapping) {
 				found = 1;
 				break;
 			}
@@ -3402,20 +3425,50 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 		goto out_dput;
 	}
 
-	if (!security_vm_enough_memory_mm(current->mm, p->pages))
-		vm_unacct_memory(p->pages);
-	else {
-		err = -ENOMEM;
+	err = swap_info_remove(p);
+	if (err) {
 		spin_unlock(&swap_lock);
 		goto out_dput;
 	}
+	spin_unlock(&swap_lock);
+
+	err = __swapoff(p);
+
+out_dput:
+	filp_close(victim, NULL);
+	return err;
+}
+
+/*
+ * Drop @p from the avail and active lists and undo its accounting.  The
+ * caller must hold swap_lock and have checked that @p is WRITEOK and not
+ * pinned for hibernation.
+ *
+ * Returns 0, or -ENOMEM with swap_lock still held.
+ */
+static int swap_info_remove(struct swap_info_struct *p)
+{
+	if (!security_vm_enough_memory_mm(current->mm, p->pages))
+		vm_unacct_memory(p->pages);
+	else
+		return -ENOMEM;
+
 	spin_lock(&p->lock);
 	del_from_avail_list(p, true);
 	plist_del(&p->list, &swap_active_head);
 	atomic_long_sub(p->pages, &nr_swap_pages);
 	total_swap_pages -= p->pages;
 	spin_unlock(&p->lock);
-	spin_unlock(&swap_lock);
+	return 0;
+}
+
+/* Common swap teardown after list removal; shared by sys_swapoff() and
+ * xswap_destroy().
+ */
+static int __swapoff(struct swap_info_struct *p)
+{
+	struct file *swap_file = NULL;
+	int err;
 
 	wait_for_allocation(p);
 
@@ -3426,7 +3479,7 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	if (err) {
 		/* re-insert swap space back into swap_list */
 		reinsert_swap_info(p);
-		goto out_dput;
+		return err;
 	}
 
 	/*
@@ -3466,15 +3519,21 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	kfree(p->global_cluster);
 	p->global_cluster = NULL;
 	free_swap_cluster_info(p);
+	/*
+	 * The device is off swap_active_head and no longer WRITEOK, so no
+	 * reader can observe these; clearing them here needs no lock.
+	 */
 	p->max = 0;
 	p->cluster_info = NULL;
 
-	inode = mapping->host;
+	if (swap_file) {
+		struct inode *inode = swap_file->f_mapping->host;
 
-	inode_lock(inode);
-	inode->i_flags &= ~S_SWAPFILE;
-	inode_unlock(inode);
-	filp_close(swap_file, NULL);
+		inode_lock(inode);
+		inode->i_flags &= ~S_SWAPFILE;
+		inode_unlock(inode);
+		filp_close(swap_file, NULL);
+	}
 
 	/*
 	 * Clear the SWP_USED flag after all resources are freed so that swapon
@@ -3485,13 +3544,10 @@ SYSCALL_DEFINE1(swapoff, const char __user *, specialfile)
 	p->flags = 0;
 	spin_unlock(&swap_lock);
 
-	err = 0;
 	atomic_inc(&proc_poll_event);
 	wake_up_interruptible(&proc_poll_wait);
 
-out_dput:
-	filp_close(victim, NULL);
-	return err;
+	return 0;
 }
 
 #ifdef CONFIG_PROC_FS
@@ -4114,7 +4170,57 @@ static int xswap_create(int prio)
 	goto out;
 }
 
-/* A name, not a path: only -ENOENT from opening it gets here. */
+/* Tear down the file-less xswap device. */
+static int xswap_destroy(void)
+{
+	struct swap_info_struct *p = NULL;
+	unsigned int type;
+	int err;
+
+	mutex_lock(&xswap_ctl_lock);
+
+	spin_lock(&swap_lock);
+	/* Only a fully enabled device; a half-created one does not count. */
+	for (type = 0; type < nr_swapfiles; type++) {
+		struct swap_info_struct *q = swap_info[type];
+
+		if (q && (q->flags & (SWP_XSWAP | SWP_WRITEOK)) ==
+			 (SWP_XSWAP | SWP_WRITEOK)) {
+			p = q;
+			break;
+		}
+	}
+	if (!p) {
+		spin_unlock(&swap_lock);
+		err = -ENOENT;
+		goto out;
+	}
+	/* Refuse swapoff while the device is pinned for hibernation */
+	if (p->flags & SWP_HIBERNATION) {
+		spin_unlock(&swap_lock);
+		err = -EBUSY;
+		goto out;
+	}
+
+	err = swap_info_remove(p);
+	spin_unlock(&swap_lock);
+	if (!err)
+		err = __swapoff(p);
+out:
+	mutex_unlock(&xswap_ctl_lock);
+	return err;
+}
+
+/* /proc/swaps shows XSWAP_NAME; accept it so swapoff -a works. */
+static int xswap_destroy_by_name(const char *name)
+{
+	if (strcmp(name, XSWAP_NAME))
+		return -ENOENT;
+
+	return xswap_destroy();
+}
+
+/* The swapon counterpart of xswap_destroy_by_name(). */
 static int xswap_create_by_name(const char *name, int swap_flags)
 {
 	int prio = DEF_XSWAP_PRIO;
-- 
2.54.0

