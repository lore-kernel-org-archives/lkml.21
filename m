Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279225;
	b=uvEPM9IvDnQb82Oq2YuegLrUOkmet515+/qxdSY9f9vaFdS6JYJd0/aP/EgnM56zJivw
	 csD5xwuCYUFIgLVYn+FWsktx+pNOZlOq3wnkxD93wmQ61IikFuE9xmAZ9z/FIQwCBBBzM
	 24KXzKtBAllKHioj3Jhf6UpuxRseZUUcu7lvqOFQyOEfWZ7UyRTxf6Tz0/eJd70rIcil/
	 lPoLQECUmrZwjGmuoZhtZkUqRVOGHtdX9VuAiyJgTdZ8o4HJqRRwSN35H/mZk+rO8WULR
	 C4VlW58UdS0vGPdF4uDZrMnyBj0z21O87jHCWP4SbWVzJnkvjmccZprquqVYHyqqJ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VF70xVoqzD2NvrvaiuYe3HOvhAKV5aI6KvFLBn3iiJM=;
	b=LBQ7TirckJ6mcbdy5gSf11drlzAqgR+2VNyko8UNg+jIpv+G/vXSqQgWIiXMAXtTEgbI
	 cL/M8go5AMjJtdU0ipcng0z3e7X3hLhZZFKa/zOBhKdEqXTExE03WMTdGvs3N9eEvyEzz
	 PnqrJoBwW8+dOYZkfRSsr5xMt+uoNDE4ImpwTjZxlq7hPIXUXSwusHViaqws1w8AtbqgW
	 NXWiVhHXHpqVebwYISzR6Gg4DnXaIGgAmKZfxZAE4lkioT8kvbixPeSD0US+k+PBnJoBJ
	 IA2ahgATcJmMm58HXy1bWIV6KC8CIgnkBlPtzCFsIm/E6GB4vdteA5Ej6ucXJUowgCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3snNuAD;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AC4606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44AC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3snNuAD
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-380b40319bdso2578795eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 08:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279224; x=1795884024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VF70xVoqzD2NvrvaiuYe3HOvhAKV5aI6KvFLBn3iiJM=;
        b=k3snNuADsgbixZgwz8fYwWJWOfUIOuMtSxvBK86C7cg72pyDC5qb7/yxZ6Za3IROom
         iNjlwLdLxOMKFCf5lLPu79oXHcj6+lhm0281eQF5jQyFRnrozDXnKPTfxQZHTs6xfLfS
         5v7W9cm2vt6u3v93YYAG+Tui1swTGlgVO87IqGww7pxXS8yERxWH2cmC8IKrD1dnt3st
         6f6fiTYR3y1Ygx1V88bbqjpjvFyhO4NYvdXC/Q06NBUt4FSYcUJbV5zScOzrYgqOm6mM
         KLTyBQ+IHHqtrg0wBVGF7FYYnvsuFFtDizMX5Ca5w4DpUDDuAogJFJ6qDhSdrLlORqGH
         uMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279224; x=1795884024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VF70xVoqzD2NvrvaiuYe3HOvhAKV5aI6KvFLBn3iiJM=;
        b=AG4DFR4L/F8Gj/e6WV4yjcMU5szI5Wabt089ddWPRF2Cylg9Oa2DlS2bMBAP08WxNf
         nBWdbfS5BqDSTfBCjFAhRd+2NdWC+vUzuPiVPJQ7gGl+EkIIz87BpVt13lhVK13oWFLE
         gWPBGYY+0FdcOvcXBLOFCWhrO6pvdZsf+PPMfCryoXQD5zjGDr+AXYkqdB5fXl/giBK4
         ddUQuXl9bRWxT5PmUqBI2g7CglPd+O1w/KZj2FepLNkc+YC0NMPK1vu1Axff9I37qD9V
         BZAvCsPUKWn1QF6LPwLAwXSmmNZcWmkEp0mNgItcmk65Hzsb0FgCm/SsvY6cpj8Fil5/
         z+0A==
X-Forwarded-Encrypted: i=1; AL+hErHTM/2828e7C4QWnouZbxft6Tb6nw8uoCnkPmYclx4h+zIxsUxBFAFiizimf6vjUv4k+SiwodqQrQ3Gy+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UO0nbZ6sD4pnP2seW7vkv36u9tfHU12DGOC78ysxfZCUiNrT+
	RdW39vvtwPbZIXwZZ7VYRe42Ec/GRlgAlG3Jxxxx9H7s5aUK54jv+WINnVJlFTZqUtQ=
X-Gm-Gg: AZFdTZfI81yG89dlyHSFFId29nvFsOGpLEG7PBS1HutQyABLjGuqHfYsKpZo5tJgG9P
	ux0uvgJwRgs7ugUrohCBw59d5lIyrwlNC6qzreeomHjlf3qB3tUkiWC5DtK0P9wMxqp2lML6rMI
	JIt4DhVzn7IEsHnCpcaSOOlWiwFAmlBPYyjWwGqvv8osl7XGjtRuLB24bcvQva/JnWtT+HXoSH1
	lc08mKuaH2LQEwn/F/aLeZqc5M6gTbY6kMOKdol2liMwUhl7uDTJn28qJhl3tssCrOPss2Xdqc5
	X3JuGuKOZI6JTXHpP3lVs7c4qsaVYlZKkg+RvPNQC2GCsQe9QWrfGVeyWNi3D8wI0n1X31pjQLZ
	D/VNhdTX5E9O3WXr1Ca5IyB8TjOlHTB83Ymfe7Wr5z0GUQOEZRuIYz0uSqJCRwXFjIAGOZubW7d
	E7ZNUwewer5UDBHOfY+vZHaC6kHgnCbX5DZ2GVOdJxVmqXxhNLPAygfscaA5CiLG9Xg/SQLp83K
	hDvZ/jlYjO8HOAfC59C9XZVKzZ/rb8NXl+YJ3/kwNrOxv7dzUU6/zxl/UZfD+oh2nabU64zUeai
	e7WpVGwj55J81sb1tQDNPbNbcEa6gTWDSiaa8AzFMibY2w==
X-Received: by 2002:a05:7301:9a81:b0:384:7a8f:3bc1 with SMTP id 5a478bee46e88-3856fd555eamr7609789eec.17.1795279224072;
        Sat, 21 Nov 2026 08:40:24 -0800 (PST)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm18710807eec.23.2026.11.21.08.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:40:23 -0800 (PST)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm/secretmem: Keep locked memory accounting until inode eviction
Date: Sun, 22 Nov 2026 01:40:20 +0900
Message-ID: <20261121164020.1465498-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030152407.113568-1-pocj8ur4in@gmail.com>
References: <20261030152407.113568-1-pocj8ur4in@gmail.com>
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

A secretmem inode can outlive its original file. An O_PATH descriptor
opened through /proc/self/fd keeps the inode and its unevictable folios
alive after the mapping and original descriptor are closed. The file
release path nevertheless drops the locked-memory charge, allowing the
same user to reuse RLIMIT_MEMLOCK while those folios remain allocated.

Move private-state and locked-memory accounting cleanup to inode eviction,
after truncating the page cache. Keep secretmem_users active over the same
lifetime so that the hibernation guard covers retained secret pages.

Allocate private state before inode creation and release it if the
secure-inode helper fails. Attach it immediately after creation so
later failures can use iput() for cleanup. An LSM denial inside the
helper can call iput() before i_private is set; skip private cleanup
at eviction when i_private is NULL.

On arm64 QEMU with an 8 KiB RLIMIT_MEMLOCK, the original kernel allowed
an additional 4 KiB secretmem fault while O_PATH retained two pages.
v2 rejected that fault with SIGBUS and allowed it after O_PATH closed.
Injected LSM denial and file-allocation failure completed without a
crash; file-allocation cleanup returned secretmem_users to zero.
KASAN, lockdep, hibernation and long-running concurrency were not
tested in this v2 run.

Fixes: 97d34aa65c29 ("mm/secretmem: properly account locked pages")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Changes in v2:
  - Allocate state before inode creation, as Mike Rapoport suggested,
    and free it if the secure-inode helper fails.
  - Guard private-state cleanup in secretmem_evict_inode() because an
    LSM denial can call iput() before i_private is set.

Link to v1: https://lists.openwall.net/linux-kernel/2026/10/30/1883

 mm/secretmem.c | 58 ++++++++++++++++++++++++++++------------------------------
 1 file changed, 28 insertions(+), 30 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index b3f79ad56790..5a7378b62bb2 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -189,14 +189,7 @@ static void secretmem_destroy_inode_priv(struct inode *inode)
 	free_uid(state->user);
 	kfree(state);
 	inode->i_private = NULL;
-}
-
-static int secretmem_release(struct inode *inode, struct file *file)
-{
 	atomic_dec(&secretmem_users);
-	secretmem_destroy_inode_priv(inode);
-
-	return 0;
 }
 
 static int secretmem_mmap_prepare(struct vm_area_desc *desc)
@@ -216,7 +209,6 @@ bool vma_is_secretmem(struct vm_area_struct *vma)
 }
 
 static const struct file_operations secretmem_fops = {
-	.release	= secretmem_release,
 	.mmap_prepare	= secretmem_mmap_prepare,
 };
 
@@ -264,39 +256,34 @@ static const struct inode_operations secretmem_iops = {
 
 static struct vfsmount *secretmem_mnt;
 
-static int secretmem_init_inode_priv(struct inode *inode)
-{
-	struct secretmem_inode_state *state;
-
-	state = kzalloc_obj(*state);
-	if (!state)
-		return -ENOMEM;
-
-	state->user = get_uid(current_user());
-	inode->i_private = state;
-	return 0;
-}
-
 static struct file *secretmem_file_create(unsigned long flags)
 {
+	struct secretmem_inode_state *state;
 	struct file *file;
 	struct inode *inode;
 	const char *anon_name = "[secretmem]";
 	int err;
 
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+	state->user = get_uid(current_user());
+
 	inode = anon_inode_make_secure_inode(secretmem_mnt->mnt_sb, anon_name, NULL);
-	if (IS_ERR(inode))
+	if (IS_ERR(inode)) {
+		free_uid(state->user);
+		kfree(state);
 		return ERR_CAST(inode);
+	}
 
-	err = secretmem_init_inode_priv(inode);
-	if (err)
-		goto err_free_inode;
+	inode->i_private = state;
+	atomic_inc(&secretmem_users);
 
 	file = alloc_file_pseudo(inode, secretmem_mnt, "secretmem",
 				 O_RDWR | O_LARGEFILE, &secretmem_fops);
 	if (IS_ERR(file)) {
 		err = PTR_ERR(file);
-		goto err_free_priv;
+		goto err_free_inode;
 	}
 
 	mapping_set_gfp_mask(inode->i_mapping, GFP_USER);
@@ -309,11 +296,7 @@ static struct file *secretmem_file_create(unsigned long flags)
 	inode->i_mode |= S_IFREG;
 	inode->i_size = 0;
 
-	atomic_inc(&secretmem_users);
-
 	return file;
-err_free_priv:
-	secretmem_destroy_inode_priv(inode);
 err_free_inode:
 	iput(inode);
 	return ERR_PTR(err);
@@ -335,6 +318,20 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
 	return FD_ADD(flags & O_CLOEXEC, secretmem_file_create(flags));
 }
 
+static void secretmem_evict_inode(struct inode *inode)
+{
+	truncate_inode_pages_final(&inode->i_data);
+	clear_inode(inode);
+	/* The filesystem root and failed secure inodes have no private state. */
+	if (inode->i_private)
+		secretmem_destroy_inode_priv(inode);
+}
+
+static const struct super_operations secretmem_super_ops = {
+	.statfs		= simple_statfs,
+	.evict_inode	= secretmem_evict_inode,
+};
+
 static int secretmem_init_fs_context(struct fs_context *fc)
 {
 	struct pseudo_fs_context *ctx;
@@ -342,6 +339,7 @@ static int secretmem_init_fs_context(struct fs_context *fc)
 	ctx = init_pseudo(fc, SECRETMEM_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
+	ctx->ops = &secretmem_super_ops;
 
 	return 0;
 }
