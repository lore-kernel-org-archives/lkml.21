Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992868;
	b=32JsC20uceVnih429jaq8btfLGh9o3K7XzGAVr0MPfG6rin6W/9vaupTtrVpWgpBzosD
	 gQqHP4vw081TaQ4IhUkJp+a+ArRb1ID4wELm1VmKSJIonlfT43fJAwqqPQdA9WYlxtDWr
	 /szDh9WRIM7wFKHIb5pnn/7wT8W976g7RoFAl62l2iUSP0evYv1UdMr3DwQ7Tz2L3QCe9
	 2VJe/nBxQbNzeEse4Arctwlqb47kFUZOtZA56vrBABg8/6mN0BHUm1int6pww18ru+s31
	 p49GzKbhzFwpwP5bMBcNg19sBptGTqWVbt93wRZO4eFshhEmkVw6ay8QipFIT7Y3lIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992868;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=0rf03u9hyEOPIeJB9Of8Za+ffwRf4OprtyAZCKFnhco=;
	b=0ryouQOt9n0gkJrscKArzwpicYvIBkDmEHBpyPzUtzkVW+CIDKHSmMZN9oqRF2dEDROI
	 IcadP14yM05PXFrF30ZO9HDAlYclZ+riOFoiqsuTXv42TA1umdzjyXGydWVBmICkoY5bm
	 PxyOnVAC9Nm8zuCZr+Svl4n0jGOaahlNOF3QEBJly+1XvFMIfeugL7vUFIGuK53XgED1U
	 dgxBKlgrfjDzZ3t0f1WsoYDVN6v2s4Z3t3uogKZZAqfRaK05PvGsMpQ9mC7GjTRCslLmV
	 snDXgzklB1OUBtfxfhtTQhvNbikx0BN7/9k74QTNmnib2zd/h/C2n7sGK8FGPy7qeYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ecr4HdTc;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36323606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36323606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ecr4HdTc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0r
	f03u9hyEOPIeJB9Of8Za+ffwRf4OprtyAZCKFnhco=; b=ecr4HdTcY/BPfAbwTc
	x5IP/1gf0zk0obm5IXPqI8o8lEh+jNjVYGuqQ3q9jupaCn53qVYJjvj4DkFee7gd
	YOY97o/KzLFzR8JsngOP73IaNQrQLEOzg+1uKkQTLgYC2CTVuuI5wPcxbkuNz2wM
	7oFJaPM00wjj1ltCXCSmwtpqM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S5;
	Wed, 18 Nov 2026 17:07:27 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 03/37] ntfs: handle source record removal failure during attribute moves
Date: Wed, 18 Nov 2026 17:06:27 +0800
Message-Id: <20261118090701.1858849-4-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr4rZw4xXw4xJr4kXrWUurg_yoW5Zw1kpF
	93C3sxKw4DAF17tanakw4jva4Ig34xWr4UXry3Gw13uan5twnFqry8tFyxZa4fKF95Kws8
	Jr4UJ3y3CFW5Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0nmiUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbC7w-n0Gr9as+0UAAA3B

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_attr_record_move_to() ignores failure to remove the source attribute
after copying it. It can update the attribute-list reference and return
success with both copies present.

Check source removal before changing the list entry. On failure, attempt
to remove the destination copy, dirty and unmap its record, and leave the
list pointing to the source. Record both failures with the existing volume
error bit and log messages after releasing the destination search context.

Shrinking a record to zero needs no extra space, so failure indicates
inconsistent record accounting. Return EFSCORRUPTED even if cleanup fails.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Split v5 patch 11: use only the existing volume error bit and diagnostics.
The final patch adds FAN_FS_ERROR reporting at these sites.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.
- Eight controlled attribute-move cases passed for this stage,
  including source removal and independent destination cleanup failure.

 fs/ntfs/attrib.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 72e0c94c878e..ad2691c3457d 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -3466,6 +3466,7 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	struct ntfs_attr_search_ctx *nctx;
 	struct attr_record *a;
 	int err;
+	int remove_err = 0, cleanup_err = 0;
 	u32 ic;
 	struct mft_record *ni_mrec;
 	struct super_block *sb;
@@ -3520,7 +3521,7 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	/* Make space and move attribute. */
 	ni_mrec = map_mft_record(ni);
 	if (IS_ERR(ni_mrec)) {
-		err = -EIO;
+		err = PTR_ERR(ni_mrec);
 		goto put_err_out;
 	}
 
@@ -3535,7 +3536,16 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	nctx->attr->instance = nctx->mrec->next_attr_instance;
 	nctx->mrec->next_attr_instance =
 		cpu_to_le16((le16_to_cpu(nctx->mrec->next_attr_instance) + 1) & 0xffff);
-	ntfs_attr_record_resize(ctx->mrec, a, 0);
+	err = ntfs_attr_record_resize(ctx->mrec, a, 0);
+	if (err) {
+		err = -EFSCORRUPTED;
+		remove_err = err;
+		if (ntfs_attr_record_resize(ni_mrec, nctx->attr, 0))
+			cleanup_err = -EFSCORRUPTED;
+		mark_mft_record_dirty(ni);
+		unmap_mft_record(ni);
+		goto put_err_out;
+	}
 	mark_mft_record_dirty(ctx->ntfs_ino);
 	mark_mft_record_dirty(ni);
 
@@ -3546,6 +3556,14 @@ int ntfs_attr_record_move_to(struct ntfs_attr_search_ctx *ctx, struct ntfs_inode
 	unmap_mft_record(ni);
 put_err_out:
 	ntfs_attr_put_search_ctx(nctx);
+	if (remove_err) {
+		NVolSetErrors(ni->vol);
+		ntfs_error(sb, "Failed to remove source attribute record");
+	}
+	if (cleanup_err) {
+		NVolSetErrors(ni->vol);
+		ntfs_error(sb, "Failed to remove destination attribute copy");
+	}
 	return err;
 }
 
-- 
2.51.0

