Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795867772;
	b=A+UavLjAJBjsN2+P5BkMUCZOIrx9hz+K9GOcwSYFq23TFta+iX1qPG1DB7sL9DvUJA2y
	 BLaFTaQni3vf2ELSuV2MxeyXS8klCaSsv5Qhvv+UHTX8AYpgo3ajkbYKdYabWz2QvLny7
	 vbF2WP8+7JZFiDfL7r2jnly4u4eelIfMMm1sBamBZ+IIJY5hOSQkvLJ9/kCJSS9C4v+2R
	 /xV2CVcGTw2Uyz5b/OnUGt65mkNEudPFR5nZEC9TK2SOUvQWD4OBeiqZyPe/uCmC6BQ5V
	 pc14oHW/PXEXQ05dTi8Fh8Kd66dI81s/Uq/ZoVmTpbS9bSu1QGExP6e3JaNdYW/JjnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795867772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject;
	bh=8Jiv9ZXJd4/e6+6mw3fXtRxAM/JyvESKbOC/jJ1aZtE=;
	b=sbsPMRmjyWc2amnQ9TZDVtliZ1T3YqBTglXJR5RN62GhxWIoET3OvL8/c1Y5m72tDmGN
	 HwZMlVenHS6rcTslJgFamlATQ6zmfyw4jVN9zWqZ26jN3SB9oje7fpaS1PjbsJG3BYcKi
	 5D/lGbwAwdA8J6MMilN07N0YpY+0T7PyDVlPvug+lmmxZ18vof8i91WEa7XWZTnCxVXMC
	 UUkysZ7G2sgBb7NjEqnKJkEMCbbQpXYm+4rh4nZ2+8P2qEWRLgLzbTunkFagQwjj3Rsi2
	 Xd1BE46chKEH+h3dzxijczZmMYCoKiTlSX2K3/kT1xI6dEOWv2oKWbS0eBs+swhU3vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQ2yu4K1;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5628606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 12:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5628606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQ2yu4K1
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso12328846c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 04:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795867771; x=1796472571; darn=vger.kernel.org;
        h=subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Jiv9ZXJd4/e6+6mw3fXtRxAM/JyvESKbOC/jJ1aZtE=;
        b=wQ2yu4K1xGJFahXgUYxs2cXgm1bggJF0AJK5N+XuavuNimIiGIOJmzE5sNXXpCEf8F
         QvOIum7phump5PKE1dY9BnBHOhn/fTc88Y7oZu97LtC0NQEAIWmApYN/Yujv7uHlbWob
         yTEJ1NPh4jPJ9pVgps1Ws5GwZ09IE2x7/S9oQjOj3G2beLccVTeebVCEPl/hKzyD4mc+
         8WkLTj2tgQCgfwazOHstCMmopz2b1Lqbb5bNKQyaAGlxSsMBl1D2OcFq2vhw9Vi/lykq
         I56PJ9/bajPtfzgjuORKErxfKkwpl40zqkSNhtI76ihV7RzjDPwl2a4b65+4xlrvBw93
         loOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795867771; x=1796472571;
        h=subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Jiv9ZXJd4/e6+6mw3fXtRxAM/JyvESKbOC/jJ1aZtE=;
        b=2QuF1GQUtqcC3N/EeST0qRG0pCulbZfRLIkbx+NpUqhoYVl+3E6OQvCDVAflCluIz7
         fWuENvux5qe1RVcvCvRZYXW8xlgZVSL8aeW0s6HCc2tr5Js8i5oHakAU2ABSpJ4rXnXJ
         G7KGUCCR6uSvcDKHEitgLtwR1apGTEOmjYxHlkfWBucZ2H6WBbDRoaWSt8pPwN9tr+Rz
         hhrwn7uXJ7WUGPSnqt3z2JdjoM4yr68bljmBXV0JktHWtFd759qqYnHnFM25cbVxem6H
         z4Lt9vvtLR0OLgk9TPCqBuqnNp+kSq6lh8NSf1eubl5RcMu1ua2Xgu7rgbL0G38+8UDb
         FsVA==
X-Forwarded-Encrypted: i=1; AL+hErETD6rU4s3ODxoA0qnCOV81AMea+b4GBHMwnr9RWbsWKNMc2JFuD3fcs4HQUnzc//cN3MBDNWMjhnH7Q80=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lX97uSHfNKReZA277daxg+A2RKy5MHSGkRXT5qOco7Hp6ljwl
	6EL3iCOw0XgEiVqLJ6fQpTLk7baymFrHxHV6ZWhIT05955N9K7YAlP6V
X-Gm-Gg: AZFdTZfccSdI18ChYcJNocxpbv6MVTCiYwJvrjdUKyhmzlICfSQKewqZQU+KzAGWNkI
	beGTCz4Q5LCOFvIOEonRWyRKOuECULprNBc045xWSLkPftJROcY8wXpk83XSjNEq47PjxSYuMfk
	YOCVNF8P3nXL3FeliDaokoQNyUBZnLVunf0t/5dH9jSr18glsEUqRfGcsKnY/sh0KTdazlJi3Wi
	Dh3WH+i/XwNZDqioF/GXhWn6V9ikB2tf4Ojw0IaWmiqJxRD7VkV1uo9i7j19JkCL5ggT+jI5Puz
	iu1kZwKlSEXiHKGfAPFj9Myv0eaM66ldbEksDvKFa8+YjOzG4RA/lc+4JgCdmjpZ/iASVaCWVpS
	6A36kXo+7oFMdsXl6oWl9tQP7HSkyrpCi+GkCwst53GhuenG8RKgDyUkUXuxuDsZUc8UqSi1YDH
	78bAhlNwwKPX8wZRLRUPIG33ZE/aZGYlvrrdhUPqq2o/vrEWXxkB/DyyDP3tOtgYYJo2o2vYJj5
	WRVDV21Cv31N5VAcBmmYxbjVOTarjTpCLPdgNU2CrzwwO9nmxDASi0Rd3fTuGs6yTDfFkUarahJ
	rG0p/RAGt8nDjTBQbD2w6A9T4maqBUH5maE=
X-Received: by 2002:a05:701b:2901:b0:1b5:5fe5:78d1 with SMTP id a92af1059eb24-1b55fe57b02mr24641685c88.11.1795867770728;
        Sat, 28 Nov 2026 04:09:30 -0800 (PST)
Received: from [192.168.45.62] ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm96587180c88.14.2026.11.28.04.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 04:09:30 -0800 (PST)
Date: Sat, 28 Nov 2026 21:09:28 +0900
Message-ID: <179586776810.146060.16432032400935006500.c113-v3@gmail.com>
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] mm/secretmem: Keep locked memory accounting until inode eviction
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

A secretmem inode can outlive its original file. An O_PATH descriptor
opened through /proc/self/fd keeps the inode and its unevictable folios
alive after the mapping and original descriptor are closed. The file
release path nevertheless drops the locked-memory charge, allowing the
same user to reuse RLIMIT_MEMLOCK while those folios remain allocated.

Move private-state and locked-memory accounting cleanup to inode eviction,
after truncating the page cache. Keep secretmem_users active over the same
lifetime so that the hibernation guard covers retained secret pages.

Allocate private state before inode creation. If the secure-inode helper
fails, release that unattached state and its user reference at a dedicated
error label. Once attached, an alloc_file_pseudo() failure drops the inode
with iput(); secretmem_evict_inode() then frees the state and user
reference.
An LSM denial inside the helper can evict an inode before i_private is set,
so eviction skips private cleanup for such inodes.

In an arm64 QEMU/KVM guest with an 8 KiB RLIMIT_MEMLOCK, the
baseline allowed an additional 4 KiB secretmem fault while O_PATH
retained two pages. With this change, that fault raises SIGBUS until
the last O_PATH reference closes.

Fixes: 97d34aa65c29 ("mm/secretmem: properly account locked pages")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Changes in v3:
  - Move cleanup of state allocated before inode creation to a goto label.

Link to v2: https://lore-kernel.gnuweeb.org/linux-mm/20261121164020.1465498-1-pocj8ur4in@gmail.com/

If alloc_path_pseudo() fails, the caller keeps its inode reference. If
alloc_file() fails after d_instantiate(), alloc_file_pseudo() takes
another inode reference with ihold(inode) before path_put() releases the
dentry. In both cases, the caller's iput(inode) drops the remaining
reference. On eviction, secretmem_evict_inode() calls
secretmem_destroy_inode_priv() to release state->user. Calling that
destructor after iput() could dereference a freed inode.

Tests in v3:
  - On arm64 QEMU/KVM, the baseline allowed an extra fault while O_PATH
    retained two secretmem pages. V2 and v3 rejected it until the last
    O_PATH close, then allowed it.
  - Injected secure-inode helper failure returned EACCES after
    NULL-state eviction and err_free_state cleanup. Injected file
    allocation failure returned ENOMEM; inode eviction ran free_uid().
  - In the product Image, /sys/power/state listed "disk" before
    secretmem use, omitted it while O_PATH alone retained a populated
    inode, and listed it again after the last O_PATH close.
  - The product Image built and booted after removing the test hooks.
    W=1 used KCFLAGS=-Wno-error for unrelated GCC 16 warnings;
    mm/secretmem.c had none. checkpatch.pl --strict reported no issues.
  - KASAN, lockdep, a full hibernation cycle and long-running
    concurrency were not tested.


 mm/secretmem.c | 63 +++++++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index b3f79ad56790..433d31392379 100644
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
 
@@ -264,39 +256,33 @@ static const struct inode_operations secretmem_iops = {
 
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
-		return ERR_CAST(inode);
+	if (IS_ERR(inode)) {
+		err = PTR_ERR(inode);
+		goto err_free_state;
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
@@ -309,14 +295,14 @@ static struct file *secretmem_file_create(unsigned long flags)
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
+err_free_state:
+	free_uid(state->user);
+	kfree(state);
+	return ERR_PTR(err);
 }
 
 SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
@@ -335,6 +321,20 @@ SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
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
@@ -342,6 +342,7 @@ static int secretmem_init_fs_context(struct fs_context *fc)
 	ctx = init_pseudo(fc, SECRETMEM_MAGIC);
 	if (!ctx)
 		return -ENOMEM;
+	ctx->ops = &secretmem_super_ops;
 
 	return 0;
 }
-- 
2.55.0

