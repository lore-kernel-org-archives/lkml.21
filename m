Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993060;
	b=RuHQiyid23uCjqi4UPY/njdCkHV7rOlEQfwv3BrFFF3ZZh+1+6k5Vdq0CEzim9woSDBJ
	 dDiFVw/YoBDeq0ByNsh9TRzdgN8eKD527C+jGfckCUXALPMM4g0KHTsvCWFEVvPXpc8Fm
	 yqYT0vaP+p/Yss9HqGGaz1C6sx2tkVdVVyFS/1TrMxfJjTPpTVG3dtnqzxlDX6n9QbPbq
	 NJB4A6vug326oDNy1ntR7p1XeBBNCP2KCRstq2HfxjVH8uI5uRy6ZEc02mtzAnI2HZKdw
	 THhL+GsTiXmcU7wNqw+IZuIqEbYjoGjBTsy4PvB/PF5BMVPL19kjAlfXx4WaoWTSUzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993060;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=ate8wUETzvL0lwhdtRQOTCmsZ+0cFYfTp4JZFxSnxAM=;
	b=P6J1w+lrnPHe7/Dx6ry5ZGacOPEw7Stdn9O4folYjVj+HaC7GX9MGeLlyQsz45o5a4uL
	 hNZ8QngOUuva8YZsgBbWtI2ZoUnevgZ6mW6lWkLO3JkjM50EuKHGOdzZpNPRuDnzi4vjG
	 uANzntDWXLemkuFaata1wvP4kbXz+JXGVp3G+lCEy9+XqnCgKP/W4QZe2Bw/wU3SfbVpX
	 RxSEYm8jE4XxNuHUsdKh+7qYG55845lLJeAB1B3l4XL6C9hc5xrdj86rSiE6TerI+FT8o
	 0azgwKUVZppm3Zw+rK+8E/XZkO9QU3en1cTgxYXnhupeyE805wLePE/zuGA0S2djEkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kFF7mVW8;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579E606A33B
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6579E606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kFF7mVW8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=at
	e8wUETzvL0lwhdtRQOTCmsZ+0cFYfTp4JZFxSnxAM=; b=kFF7mVW8A65ZTd9K8z
	9bCJayKsRN+seVTOCwGe36E6W+kjAMy2xbh4s35vtk3V1SFxsO6v4pqiHAroX+IV
	137mBa8KfErqDpgshcfW/RFWPrUXgeRVTRjipYyRSemqT0edO274ngjBNcRAwJro
	yY+xSwKBpoJKuVfUBPmp195hU=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgD3UiuQa_1qEjvuGg--.61000S7;
	Wed, 18 Nov 2026 17:10:44 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 29/37] ntfs: report export parent reconstruction errors
Date: Wed, 18 Nov 2026 17:06:53 +0800
Message-Id: <20261118090701.1858849-30-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:PigvCgD3UiuQa_1qEjvuGg--.61000S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4kuF45CryrJF15JF1UWrg_yoW5Zr4kpF
	y3J39xKrZ5JF9F9rn3tFWkZ34Sv34fGa1UWr4fK3WSkws7trnFgF1fKF1jvr4SyrWrJ34Y
	qr4qg3s8Cw4UZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UTVb9UUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhQaA2r9a5QHsAAA3c

From: Xuewen Wang <wangxuewen@kylinos.cn>

Report missing required or malformed FILE_NAME attributes during export
parent reconstruction, while continuing past malformed candidates as
before. Report an unused parent as EFSCORRUPTED only for a linked,
non-deleting child. The preceding locking fix stabilizes these checks
against rename and rmdir.

Preserve ordinary stale-handle behavior. NTFS returns EFSCORRUPTED for a
confirmed corrupt parent reference; generic open_by_handle_at() decoding
still converts that error to ESTALE.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Keep parent-corruption reporting here; locking is now a preceding patch.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.

 fs/ntfs/namei.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 5a497807dda0..b66b82ba1646 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -1740,6 +1740,7 @@ const struct inode_operations ntfs_dir_inode_ops = {
  */
 static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 {
+	int report_err = 0;
 	struct inode *vi = d_inode(child_dent);
 	struct inode *parent;
 	struct ntfs_inode *ni = NTFS_I(vi);
@@ -1763,6 +1764,7 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	if (IS_ERR(ctx)) {
 		unmap_mft_record(ni);
 		err = PTR_ERR(ctx);
+		ctx = NULL;
 		goto unlock_err;
 	}
 try_next:
@@ -1771,20 +1773,27 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	if (unlikely(err)) {
 		ntfs_attr_put_search_ctx(ctx);
 		unmap_mft_record(ni);
-		if (err == -ENOENT)
+		if (err == -ENOENT && vi->i_nlink) {
+			err = -EFSCORRUPTED;
+			report_err = -EFSCORRUPTED;
 			ntfs_error(vi->i_sb,
 				   "Inode 0x%llx does not have a file name attribute.  Run chkdsk.",
 				   ni->mft_no);
+		}
 		goto unlock_err;
 	}
 	attr = ctx->attr;
-	if (unlikely(attr->non_resident))
+	if (unlikely(attr->non_resident)) {
+		report_err = -EFSCORRUPTED;
 		goto try_next;
+	}
 	fn = (struct file_name_attr *)((u8 *)attr +
 			le16_to_cpu(attr->data.resident.value_offset));
 	if (unlikely((u8 *)fn + le32_to_cpu(attr->data.resident.value_length) >
-	    (u8 *)attr + le32_to_cpu(attr->length)))
+	    (u8 *)attr + le32_to_cpu(attr->length))) {
+		report_err = -EFSCORRUPTED;
 		goto try_next;
+	}
 	/* Get the inode number of the parent directory. */
 	parent_ino = MREF_LE(fn->parent_directory);
 	/* Release the search context and the mft record of the child. */
@@ -1792,11 +1801,18 @@ static struct dentry *ntfs_get_parent(struct dentry *child_dent)
 	unmap_mft_record(ni);
 
 	parent = ntfs_iget(vi->i_sb, parent_ino);
+	if (IS_ERR(parent) && PTR_ERR(parent) == -ENOENT &&
+	    vi->i_nlink && !NInoBeingDeleted(ni)) {
+		report_err = -EFSCORRUPTED;
+		parent = ERR_PTR(-EFSCORRUPTED);
+	}
 	goto out;
 
 unlock_err:
 	parent = ERR_PTR(err);
 out:
+	if (report_err)
+		ntfs_report_file_metadata_error(vi, report_err);
 	mutex_unlock(&ni->mrec_lock);
 	return d_obtain_alias(parent);
 }
-- 
2.51.0

