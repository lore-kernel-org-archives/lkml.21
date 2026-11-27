Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809306;
	b=OrVEiDtFwWQOzKpC7Vk+kaOtdU+YCxp8ltCuBvOI+wclIo2j+BYjg4w7iz+VmNLBi5p2
	 luyMbdI/4PfLdyqYXNHnDTq0tJOJRhlXpBGxhXuKmcWuGEy/feNkjqCq7kLK7KqQel26v
	 X7VhpES16JGu26C0Fpp3j4xMGmPUgjIRP0Ci32XcO6ik0vjUTJm1S3MegbwsFjsZl4tPA
	 FaLVFVO/76XxCWJD/K4kDFzM17cwXCDplBt9ZoF8OFD0RuXod+lkArLfYUQ6Tag/VbbZg
	 +eHqhJ1gXZ0I4Y8WWANMiQI6IH8r+9aQ1+uWMsIu7DxEbEjPFzZdyEe4q86l8zlGQgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qVdKB6ysJiSAbj8SLymcIGNswAU+A4sxB14ghGct7M=;
	b=FyZLNLdKvlsIVjjMY53RafQacGY5nItvUl3gDpfywqQNCrv9RY7+ZocQ5G2uwupu4vEX
	 jqgZRJvv9zR1n4jbCiQ3nXrUKNdK2SkkYZpXBPKZY34+v10/DZ44jPXWeJT9cvGgjBb+i
	 fnTfjuJ4nTJ+1Sp61APTVvKFC4mT8E8EEVkrsBLw29FuCnhAcIpHlieU9LDA4xB7szxtT
	 r8lC6JNg7sKCYznd0bnoJ/dCzHCTsttWbBMw0ea3FnJvvz8VnmGiorueZJ0FQldp9fYjZ
	 dmbKGSBmcWA3ul71dLYGTax7vwlCZq2UcmgvemL5EP9VCXRlg+Z4ynw+3o4M3TU7iVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfgwHbng;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184B4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184B4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfgwHbng
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb606491faso44783945e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795809303; x=1796414103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qVdKB6ysJiSAbj8SLymcIGNswAU+A4sxB14ghGct7M=;
        b=OfgwHbngyoP01J2mXTqm0yZjJp119A+MugO2h36TV9PYJG/god+vKoHsBwVKykQaVq
         Kf6vfsUOUux5wWmQDX92x2QgZHy5hje4OXK1VW6zTLOkOvyPIeV5PiepvuJlCXcv9W+4
         YeD45yil0FOIcnucvld0/QyU6DaxFTITn1jQNLfIKiDmTHiV6CJic7Ju2VqnQqDpzn8p
         WFMCRb98E6LCKdY3OyJ3cXO4fCsXieDlbX6H8XP6TWc7oyql7XghG7yNs5L0j3AcobAI
         q+xETJUu5XZog1JY4pVnpgdVSRszns53gyPxaZX9Ae1tfRIGsdbUyxEt+ziWM3zFk9KD
         0q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795809303; x=1796414103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qVdKB6ysJiSAbj8SLymcIGNswAU+A4sxB14ghGct7M=;
        b=UoKOjlk93d6XMMFI8eQMOGk4bzJlN07R3whYBOmWsvjhODep7dUFennvHL6FMkVWw9
         t3hr0PQeB4GdM9kEw6b/sW+ZZlNuB0GqhvmmTvDW5983fSMqeDELqM7NKishJa/sfG0/
         ThlXD9cLaIwWyuYZkYQWmsH6xjws+g8tNUF0SoyBlXGkCExg2b8FKhuJg6XE9aJUojr5
         /KBzrBBEl05WXxAmK/O9ONZgX86C4rYGezSvjHm3D2OaRUWIldk1i0wE++x3pqveiz79
         AYkcf/MID3928KzrbWGYQknPdY1SN7i3XN0dcVLAhvlv8FgNZw2LsbKmIL+ec4eIJJ1K
         xILQ==
X-Forwarded-Encrypted: i=1; AL+hErFp08b6Q881AzeyzZ/EBrmd/TVIHuYyRBshRaegDaMgwnkCf4/OcqrDE23PLowbD/lqrayxVvj+NfSZDwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nDdj/oAXoC0hHJAEfFCQChVSnN2aujX29fvS+IbovuB5m15Vr
	vHzkM3t8sl/xnzpAsghr/agw0+N1jbnQ36u4R9IkRXt2uZCGyE+SwEZgBTs0YYL+
X-Gm-Gg: AZFdTZcLL04Lt9sqpPlSRF4ycwmffl397FyqS/AucN+S6ljU9Q9mLJ1I3XO9AipNZKo
	rRfJ0L+z2Qif6kOfokXuG7n+zJlxVMRnUZJ5Uu0spI4MHuqXE0Q+akWlpkcnXF5w5x3zO/dO4PM
	45T9I+MwyDj2zCGQpojM9HFsxo3l0s/s2XbcPhdNRU1gDKjscWOQe+dS5s+K2jMNA3xn6EYwpxz
	sRYY0SbMfR7Dj5mR4zO6JjfCjrtCrHTRWM+FBMgvDvh2cOLgsdpG+/heYzZRz/OFrWl/Nc5tn/W
	uto6G//VzCjgXKmfoFabKCsH+s6DUbHQ20QRQICRsMWMrqfx0ckfLfxwmfQABlJF47gYBnT3+GL
	MHAQRcYUkuNpI4Gq/J++9ili+tGN+wcnBUkk0/CkRKf7cG5DBNpt2cvLRIqiXQYSF+mK5OOFCYC
	dBuVRvVh/sDifWtZwNEqLOVMWI/bnpXdxmfCwfs31mDF2YOW5uCMKdhOzMtajT0gFG9KFTVcI22
	RTzgWXoTECzvqaVAULax2J6+4jUant+Bia0EMPii7Pkl67r2MK/ImYQmCZo7/DDiaMJwStkZLup
	JerUXCFT88dKtkpRdgPJuv163/iy9aINcgTwUpxQOQ5Lx6m+eA6Wiwye+xZ2fE9qaZPrlTIgucb
	tXGbgqvW8srDgkYnuJlAslM9SfY7PWH+pXBDbqpkOraPMvfqU6g==
X-Received: by 2002:a05:600c:1d86:b0:4bb:6a5a:7824 with SMTP id 5b1f17b1804b1-4bb8892099amr557005455e9.30.1795809303067;
        Fri, 27 Nov 2026 11:55:03 -0800 (PST)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.211.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm702231675e9.5.2026.11.27.11.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:55:02 -0800 (PST)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Tyler Hicks <code@tyhicks.com>,
	Christian Brauner <brauner@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jan Kara <jack@suse.cz>,
	Seth Forshee <sforshee@kernel.org>,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] ecryptfs: freeze protection fixes for ecryptfs
Date: Fri, 27 Nov 2026 20:54:59 +0100
Message-ID: <20261127195500.1414-1-drifabdelmalekmohamedsaid@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261114-kranich-banknoten-anheuern-5d0a2354a51d@brauner>
References: <20261114-kranich-banknoten-anheuern-5d0a2354a51d@brauner>
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

The VFS only takes freeze protection on the eCryptfs superblock.
Operations like mkdir, rename and chmod can still change the lower
filesystem while it is frozen. On ext4 this can trigger a warning in
ext4_journal_check_start().

Add helpers to take and drop write access on the lower mount. Take it
before locking the lower inodes and drop it after unlocking.

Use one helper for the lower notify_change() calls in setattr and
truncate.

Use mnt_want_write_file() when writing the inode size xattr. The lower
file is already open.

Keep the new holds separate from kernel_write(). It takes its own freeze
protection, and taking it twice on the same superblock can deadlock
if a freeze is pending.

Fixes: eb04c28288bb ("fs: Add freezing handling to mnt_want_write() / mnt_drop_write()")
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 fs/ecryptfs/crypto.c          |   4 ++
 fs/ecryptfs/ecryptfs_kernel.h |  15 +++++
 fs/ecryptfs/inode.c           | 121 +++++++++++++++++++++++++++-------
 fs/ecryptfs/mmap.c            |   9 ++-
 4 files changed, 124 insertions(+), 25 deletions(-)

diff --git a/fs/ecryptfs/crypto.c b/fs/ecryptfs/crypto.c
index e67119b6029c..52fa02ed0fba 100644
--- a/fs/ecryptfs/crypto.c
+++ b/fs/ecryptfs/crypto.c
@@ -995,12 +995,16 @@ ecryptfs_write_metadata_to_xattr(struct dentry *ecryptfs_dentry,
 		goto out;
 	}
 
+	rc = ecryptfs_want_write(ecryptfs_dentry);
+	if (rc)
+		goto out;
 	inode_lock(lower_inode);
 	rc = __vfs_setxattr(&nop_mnt_idmap, lower_dentry, lower_inode,
 			    ECRYPTFS_XATTR_NAME, page_virt, size, 0);
 	if (!rc && ecryptfs_inode)
 		fsstack_copy_attr_all(ecryptfs_inode, lower_inode);
 	inode_unlock(lower_inode);
+	ecryptfs_drop_write(ecryptfs_dentry);
 out:
 	return rc;
 }
diff --git a/fs/ecryptfs/ecryptfs_kernel.h b/fs/ecryptfs/ecryptfs_kernel.h
index 58165928ed1e..aae51cb465c0 100644
--- a/fs/ecryptfs/ecryptfs_kernel.h
+++ b/fs/ecryptfs/ecryptfs_kernel.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/fs_stack.h>
 #include <linux/hex.h>
+#include <linux/mount.h>
 #include <linux/namei.h>
 #include <linux/scatterlist.h>
 #include <linux/hash.h>
@@ -463,6 +464,20 @@ ecryptfs_superblock_to_private(struct super_block *sb)
 	return (struct ecryptfs_sb_info *)sb->s_fs_info;
 }
 
+static inline int ecryptfs_want_write(struct dentry *dentry)
+{
+	struct ecryptfs_sb_info *sbi = ecryptfs_superblock_to_private(dentry->d_sb);
+
+	return mnt_want_write(sbi->lower_mnt);
+}
+
+static inline void ecryptfs_drop_write(struct dentry *dentry)
+{
+	struct ecryptfs_sb_info *sbi = ecryptfs_superblock_to_private(dentry->d_sb);
+
+	mnt_drop_write(sbi->lower_mnt);
+}
+
 static inline void
 ecryptfs_set_superblock_private(struct super_block *sb,
 				struct ecryptfs_sb_info *sb_info)
diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
index 48e520960d66..4bd767b4bd95 100644
--- a/fs/ecryptfs/inode.c
+++ b/fs/ecryptfs/inode.c
@@ -149,9 +149,14 @@ static int ecryptfs_do_unlink(struct inode *dir, struct dentry *dentry,
 	struct inode *lower_dir;
 	int rc;
 
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return rc;
 	lower_dentry = ecryptfs_start_removing_dentry(dentry);
-	if (IS_ERR(lower_dentry))
-		return PTR_ERR(lower_dentry);
+	if (IS_ERR(lower_dentry)) {
+		rc = PTR_ERR(lower_dentry);
+		goto out_drop_write;
+	}
 
 	lower_dir = lower_dentry->d_parent->d_inode;
 	rc = vfs_unlink(&nop_mnt_idmap, lower_dir, lower_dentry, NULL);
@@ -166,6 +171,8 @@ static int ecryptfs_do_unlink(struct inode *dir, struct dentry *dentry,
 	end_removing(lower_dentry);
 	if (!rc)
 		d_drop(dentry);
+out_drop_write:
+	ecryptfs_drop_write(dentry);
 	return rc;
 }
 
@@ -273,8 +280,12 @@ ecryptfs_create(const struct mnt_idmap *idmap,
 	struct inode *ecryptfs_inode;
 	int rc;
 
+	rc = ecryptfs_want_write(ecryptfs_dentry);
+	if (rc)
+		return rc;
 	ecryptfs_inode = ecryptfs_do_create(directory_inode, ecryptfs_dentry,
 					    mode);
+	ecryptfs_drop_write(ecryptfs_dentry);
 	if (IS_ERR(ecryptfs_inode)) {
 		ecryptfs_printk(KERN_WARNING, "Failed to create file in"
 				"lower filesystem\n");
@@ -436,9 +447,14 @@ static int ecryptfs_link(struct dentry *old_dentry, struct inode *dir,
 
 	file_size_save = i_size_read(d_inode(old_dentry));
 	lower_old_dentry = ecryptfs_dentry_to_lower(old_dentry);
+	rc = ecryptfs_want_write(new_dentry);
+	if (rc)
+		return rc;
 	lower_new_dentry = ecryptfs_start_creating_dentry(new_dentry);
-	if (IS_ERR(lower_new_dentry))
-		return PTR_ERR(lower_new_dentry);
+	if (IS_ERR(lower_new_dentry)) {
+		rc = PTR_ERR(lower_new_dentry);
+		goto out_drop_write;
+	}
 	lower_dir = lower_new_dentry->d_parent->d_inode;
 	rc = vfs_link(lower_old_dentry, &nop_mnt_idmap, lower_dir,
 		      lower_new_dentry, NULL);
@@ -454,6 +470,8 @@ static int ecryptfs_link(struct dentry *old_dentry, struct inode *dir,
 	i_size_write(d_inode(new_dentry), file_size_save);
 out_lock:
 	end_creating(lower_new_dentry);
+out_drop_write:
+	ecryptfs_drop_write(new_dentry);
 	return rc;
 }
 
@@ -473,9 +491,14 @@ static int ecryptfs_symlink(const struct mnt_idmap *idmap,
 	size_t encoded_symlen;
 	struct ecryptfs_mount_crypt_stat *mount_crypt_stat = NULL;
 
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return rc;
 	lower_dentry = ecryptfs_start_creating_dentry(dentry);
-	if (IS_ERR(lower_dentry))
-		return PTR_ERR(lower_dentry);
+	if (IS_ERR(lower_dentry)) {
+		rc = PTR_ERR(lower_dentry);
+		goto out_drop_write;
+	}
 	lower_dir = lower_dentry->d_parent->d_inode;
 
 	mount_crypt_stat = &ecryptfs_superblock_to_private(
@@ -500,6 +523,8 @@ static int ecryptfs_symlink(const struct mnt_idmap *idmap,
 	end_creating(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
+out_drop_write:
+	ecryptfs_drop_write(dentry);
 	return rc;
 }
 
@@ -511,9 +536,14 @@ static struct dentry *ecryptfs_mkdir(const struct mnt_idmap *idmap, struct inode
 	struct dentry *lower_dir_dentry;
 	struct inode *lower_dir;
 
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return ERR_PTR(rc);
 	lower_dentry = ecryptfs_start_creating_dentry(dentry);
-	if (IS_ERR(lower_dentry))
-		return lower_dentry;
+	if (IS_ERR(lower_dentry)) {
+		rc = PTR_ERR(lower_dentry);
+		goto out_drop_write;
+	}
 	lower_dir_dentry = dget(lower_dentry->d_parent);
 	lower_dir = lower_dir_dentry->d_inode;
 	lower_dentry = vfs_mkdir(&nop_mnt_idmap, lower_dir,
@@ -535,6 +565,8 @@ static struct dentry *ecryptfs_mkdir(const struct mnt_idmap *idmap, struct inode
 	end_creating(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
+out_drop_write:
+	ecryptfs_drop_write(dentry);
 	return ERR_PTR(rc);
 }
 
@@ -544,9 +576,14 @@ static int ecryptfs_rmdir(struct inode *dir, struct dentry *dentry)
 	struct inode *lower_dir;
 	int rc;
 
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return rc;
 	lower_dentry = ecryptfs_start_removing_dentry(dentry);
-	if (IS_ERR(lower_dentry))
-		return PTR_ERR(lower_dentry);
+	if (IS_ERR(lower_dentry)) {
+		rc = PTR_ERR(lower_dentry);
+		goto out_drop_write;
+	}
 	lower_dir = lower_dentry->d_parent->d_inode;
 
 	rc = vfs_rmdir(&nop_mnt_idmap, lower_dir, lower_dentry, NULL);
@@ -558,6 +595,8 @@ static int ecryptfs_rmdir(struct inode *dir, struct dentry *dentry)
 	end_removing(lower_dentry);
 	if (!rc)
 		d_drop(dentry);
+out_drop_write:
+	ecryptfs_drop_write(dentry);
 	return rc;
 }
 
@@ -569,9 +608,14 @@ ecryptfs_mknod(const struct mnt_idmap *idmap, struct inode *dir,
 	struct dentry *lower_dentry;
 	struct inode *lower_dir;
 
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return rc;
 	lower_dentry = ecryptfs_start_creating_dentry(dentry);
-	if (IS_ERR(lower_dentry))
-		return PTR_ERR(lower_dentry);
+	if (IS_ERR(lower_dentry)) {
+		rc = PTR_ERR(lower_dentry);
+		goto out_drop_write;
+	}
 	lower_dir = lower_dentry->d_parent->d_inode;
 
 	rc = vfs_mknod(&nop_mnt_idmap, lower_dir, lower_dentry, mode, dev, NULL);
@@ -586,6 +630,8 @@ ecryptfs_mknod(const struct mnt_idmap *idmap, struct inode *dir,
 	end_creating(lower_dentry);
 	if (d_really_is_negative(dentry))
 		d_drop(dentry);
+out_drop_write:
+	ecryptfs_drop_write(dentry);
 	return rc;
 }
 
@@ -616,9 +662,12 @@ ecryptfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 	rd.mnt_idmap  = &nop_mnt_idmap;
 	rd.old_parent = lower_old_dir_dentry;
 	rd.new_parent = lower_new_dir_dentry;
-	rc = start_renaming_two_dentries(&rd, lower_old_dentry, lower_new_dentry);
+	rc = ecryptfs_want_write(old_dentry);
 	if (rc)
 		return rc;
+	rc = start_renaming_two_dentries(&rd, lower_old_dentry, lower_new_dentry);
+	if (rc)
+		goto out_drop_write;
 
 	rc = vfs_rename(&rd);
 	if (rc)
@@ -631,6 +680,8 @@ ecryptfs_rename(const struct mnt_idmap *idmap, struct inode *old_dir,
 		fsstack_copy_attr_all(old_dir, d_inode(lower_old_dir_dentry));
 out_lock:
 	end_renaming(&rd);
+out_drop_write:
+	ecryptfs_drop_write(old_dentry);
 	return rc;
 }
 
@@ -718,6 +769,22 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
 	return lower_size;
 }
 
+static int ecryptfs_notify_change(struct dentry *dentry, struct iattr *lower_ia)
+{
+	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
+	struct inode *lower_inode = d_inode(lower_dentry);
+	int rc;
+
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return rc;
+	inode_lock(lower_inode);
+	rc = notify_change(&nop_mnt_idmap, lower_dentry, lower_ia, NULL);
+	inode_unlock(lower_inode);
+	ecryptfs_drop_write(dentry);
+	return rc;
+}
+
 /**
  * __ecryptfs_truncate
  * @dentry: The ecryptfs layer dentry
@@ -732,7 +799,6 @@ upper_size_to_lower_size(struct ecryptfs_crypt_stat *crypt_stat,
  */
 static int __ecryptfs_truncate(struct dentry *dentry, const struct iattr *ia)
 {
-	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	struct inode *inode = d_inode(dentry);
 	struct ecryptfs_crypt_stat *crypt_stat;
 	loff_t i_size = i_size_read(inode);
@@ -820,9 +886,7 @@ static int __ecryptfs_truncate(struct dentry *dentry, const struct iattr *ia)
 	lower_ia.ia_size = lower_size_after_truncate;
 set_size:
 	lower_ia.ia_valid |= ATTR_SIZE;
-	inode_lock(d_inode(lower_dentry));
-	rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia, NULL);
-	inode_unlock(d_inode(lower_dentry));
+	rc = ecryptfs_notify_change(dentry, &lower_ia);
 out:
 	ecryptfs_put_lower_file(inode);
 	return rc;
@@ -873,7 +937,6 @@ static int ecryptfs_setattr(const struct mnt_idmap *idmap,
 			    struct dentry *dentry, struct iattr *ia)
 {
 	struct inode *inode = d_inode(dentry);
-	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	struct inode *lower_inode = ecryptfs_inode_to_lower(inode);
 	struct ecryptfs_crypt_stat *crypt_stat;
 	int rc;
@@ -928,11 +991,7 @@ static int ecryptfs_setattr(const struct mnt_idmap *idmap,
 		struct iattr lower_ia;
 
 		ecryptfs_iattr_to_lower(&lower_ia, ia);
-
-		inode_lock(d_inode(lower_dentry));
-		rc = notify_change(&nop_mnt_idmap, lower_dentry, &lower_ia,
-				NULL);
-		inode_unlock(d_inode(lower_dentry));
+		rc = ecryptfs_notify_change(dentry, &lower_ia);
 	}
 out:
 	fsstack_copy_attr_all(inode, lower_inode);
@@ -1000,9 +1059,13 @@ ecryptfs_setxattr(struct dentry *dentry, struct inode *inode,
 		rc = -EOPNOTSUPP;
 		goto out;
 	}
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		goto out;
 	inode_lock(lower_inode);
 	rc = __vfs_setxattr_locked(&nop_mnt_idmap, lower_dentry, name, value, size, flags, NULL);
 	inode_unlock(lower_inode);
+	ecryptfs_drop_write(dentry);
 	if (!rc && inode)
 		fsstack_copy_attr_all(inode, lower_inode);
 out:
@@ -1066,9 +1129,13 @@ static int ecryptfs_removexattr(struct dentry *dentry, struct inode *inode,
 		rc = -EOPNOTSUPP;
 		goto out;
 	}
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		goto out;
 	inode_lock(lower_inode);
 	rc = __vfs_removexattr(&nop_mnt_idmap, lower_dentry, name);
 	inode_unlock(lower_inode);
+	ecryptfs_drop_write(dentry);
 out:
 	return rc;
 }
@@ -1084,7 +1151,11 @@ static int ecryptfs_fileattr_set(const struct mnt_idmap *idmap,
 	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	int rc;
 
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return rc;
 	rc = vfs_fileattr_set(&nop_mnt_idmap, lower_dentry, fa);
+	ecryptfs_drop_write(dentry);
 	fsstack_copy_attr_all(d_inode(dentry), d_inode(lower_dentry));
 
 	return rc;
@@ -1105,8 +1176,12 @@ static int ecryptfs_set_acl(const struct mnt_idmap *idmap,
 	struct dentry *lower_dentry = ecryptfs_dentry_to_lower(dentry);
 	struct inode *lower_inode = d_inode(lower_dentry);
 
+	rc = ecryptfs_want_write(dentry);
+	if (rc)
+		return rc;
 	rc = vfs_set_acl(&nop_mnt_idmap, lower_dentry,
 			 posix_acl_xattr_name(type), acl);
+	ecryptfs_drop_write(dentry);
 	if (!rc)
 		fsstack_copy_attr_all(d_inode(dentry), lower_inode);
 	return rc;
diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index 07a6c8448100..8daba46907fd 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -375,8 +375,8 @@ static int ecryptfs_write_inode_size_to_xattr(struct inode *ecryptfs_inode)
 {
 	ssize_t size;
 	void *xattr_virt;
-	struct dentry *lower_dentry =
-		ecryptfs_inode_to_private(ecryptfs_inode)->lower_file->f_path.dentry;
+	struct file *lower_file = ecryptfs_inode_to_private(ecryptfs_inode)->lower_file;
+	struct dentry *lower_dentry = lower_file->f_path.dentry;
 	struct inode *lower_inode = d_inode(lower_dentry);
 	int rc;
 
@@ -391,6 +391,9 @@ static int ecryptfs_write_inode_size_to_xattr(struct inode *ecryptfs_inode)
 		rc = -ENOMEM;
 		goto out;
 	}
+	rc = mnt_want_write_file(lower_file);
+	if (rc)
+		goto out_free;
 	inode_lock(lower_inode);
 	size = __vfs_getxattr(lower_dentry, lower_inode, ECRYPTFS_XATTR_NAME,
 			      xattr_virt, PAGE_SIZE);
@@ -400,9 +403,11 @@ static int ecryptfs_write_inode_size_to_xattr(struct inode *ecryptfs_inode)
 	rc = __vfs_setxattr(&nop_mnt_idmap, lower_dentry, lower_inode,
 			    ECRYPTFS_XATTR_NAME, xattr_virt, size, 0);
 	inode_unlock(lower_inode);
+	mnt_drop_write_file(lower_file);
 	if (rc)
 		printk(KERN_ERR "Error whilst attempting to write inode size "
 		       "to lower file xattr; rc = [%d]\n", rc);
+out_free:
 	kmem_cache_free(ecryptfs_xattr_cache, xattr_virt);
 out:
 	return rc;
-- 
2.47.3

