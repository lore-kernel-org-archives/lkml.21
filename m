Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521274;
	b=rzUQhwHkcxXeLHJZjkMbdknY+UgtCQchJzttAYFCj8g5u9OENQQYRiyf4JPguGynD6EM
	 xLuBHZSJWFTdrUo6uFj3lfLTmpJXA1sh3PEEb6Ydij57vd8qEBYKA6X7b8OpX895GAV1D
	 IOM/8xHuavIC/DksWdj1u/MI+Nh+EjdCNfe3mMCPzq0HjQ/I5Isb2Z/RJgnfIeWqFQpVM
	 OmKUjjnweg0qJG9axVHPaj6yjjLl7jcmaDu0q3JEZo/Cu+uE6h27r08cBZ+rvcn4yz3op
	 TXI2w1sWhKXFkOqjyH38OSibfGzx7wzJYcpRZFk8MqGhBlCiX3YmqSTAIi0OcrBfpWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521274;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n+bbDitwFOC5zeuyG/CW8fmalYtQ3G5tL/oxdvJcz8M=;
	b=xcNt9sZ/JlSZfSfLwxXI/hemFNTakvnF+HzwORwjXokVBbqKpJ5zef4PXj2EvMbYDAOe
	 aapzNvkA5C+kPXG5ihp15WwhyaH787zPcHQ7y+FaAWOleyVV+E9/p6yuHjO4Ovws58vuV
	 EngIjPxUlf4T0FBXmVwSlqkKNSn181Y8wzGQX+PMaAnCMNPVPs+A6LrjgeTBOANrS/W/u
	 D5pfzI5GFiDIov5T+unkIv7WunuQwAouqIfhLX6+LK1b3Xg59XKWY0iDljqIP0nfYuZ56
	 ZYlUU3OJITEnGKzW85OSzGpFZ8Ef5yf7LMm56VegpD/3L+9XbNfBgh9Vs8H+t8LcPUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SNn2JYWy;
	arc=none smtp.remote-ip=115.124.30.133
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E86606A685
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97E86606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=SNn2JYWy
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795521265; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=n+bbDitwFOC5zeuyG/CW8fmalYtQ3G5tL/oxdvJcz8M=;
	b=SNn2JYWyfNmpKMBKYEg0KMdMiqDb5BurCtBbd7Rsblp6ao4aldxHxDEKkgzYZ6xCqaDvVIJFZqTwfll28u7ni7qUtLROFVp7D0g+dc5GIIE8Bbu+Yfw2Qf2T6EmzpSGRQYXdAth5oNgs9+f9uorAOAMe4NdUldQGx1Xb74IV+YM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XFOMddf_1795521264;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFOMddf_1795521264 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Nov 2026 19:54:25 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 2/3] ocfs2: validate chain allocator clusters per group
Date: Tue, 24 Nov 2026 19:54:03 +0800
Message-Id: <20261124115404.2937581-2-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261124115404.2937581-1-joseph.qi@linux.alibaba.com>
References: <20261124115404.2937581-1-joseph.qi@linux.alibaba.com>
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

ocfs2_validate_inode_block() checks cl_count, cl_next_free_rec and
cl_bpc on a chain allocator dinode, but never cl_cpg, even though the
suballocator reads it straight off disk to size every new block group.
A crafted value therefore survives all of the read time checks.

cl_cpg of 0 makes ocfs2_bits_per_group() return 0.  The cluster
reservation then succeeds with ac_bits_wanted of 0, and
__ocfs2_claim_clusters() trips BUG_ON(ac->ac_bits_given >=
ac->ac_bits_wanted) on the same open(O_CREAT) path that extends a
metadata allocator.

Reject a bits_per_group outside [2, U16_MAX] on every chain allocator
but the global bitmap, which is exempted exactly as in
ocfs2_dinode_has_bad_chain_bpc().  The lower bound is the invariant
the group extend relies on: bit 0 of a new group is its own
descriptor, so a group of fewer than two bits has nothing to hand
out.  The upper bound catches the product being truncated when
ocfs2_block_group_fill() stores it through cpu_to_le16() into the u16
bg_bits, which otherwise updates i_total, i_used and
bg_free_bits_count with a count that does not match the group
actually built.

No valid volume is affected.  mkfs writes the same cl_cpg into the
initial groups it creates, and geometry that either did not fit the
u16 bg_bits or left no allocatable bit would have made the allocator
unusable from the start.

The dinode is now rejected at read time, so iget fails and the
operation returns an error instead of reaching the suballocator.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 8e5f7a240381..e6f89d1e3091 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -254,6 +254,26 @@ static bool ocfs2_dinode_has_bad_chain_bpc(struct super_block *sb,
 		le16_to_cpu(di->id2.i_chain.cl_bpc) != bpc;
 }
 
+static bool ocfs2_dinode_has_bad_chain_cpg(struct super_block *sb,
+					   struct ocfs2_dinode *di)
+{
+	u32 bits_per_group = (u32)le16_to_cpu(di->id2.i_chain.cl_cpg) *
+		(u32)le16_to_cpu(di->id2.i_chain.cl_bpc);
+
+	/*
+	 * A block group holds cl_cpg * cl_bpc bits, the first of which is its
+	 * own descriptor, and records that count in the u16 bg_bits.  Outside
+	 * [2, U16_MAX] the group either has no allocatable bit at all or
+	 * silently truncates the allocator accounting.  The global bitmap is
+	 * exempt as in the bits-per-cluster check above: it never grows, and
+	 * its group size comes from ocfs2_group_bitmap_size() rather than
+	 * from cl_cpg.
+	 */
+	return OCFS2_SB(sb)->bitmap_blkno &&
+		OCFS2_SB(sb)->bitmap_blkno != le64_to_cpu(di->i_blkno) &&
+		(bits_per_group < 2 || bits_per_group > U16_MAX);
+}
+
 static bool ocfs2_dinode_has_refcount_without_loc(struct ocfs2_dinode *di)
 {
 	return (le16_to_cpu(di->i_dyn_features) & OCFS2_HAS_REFCOUNT_FL) &&
@@ -1919,6 +1939,12 @@ int ocfs2_validate_inode_block(struct super_block *sb,
 					 le16_to_cpu(cl->cl_bpc));
 			goto bail;
 		}
+		if (ocfs2_dinode_has_bad_chain_cpg(sb, di)) {
+			rc = ocfs2_error(sb, "Invalid dinode %llu: clusters per group %u\n",
+					 (unsigned long long)bh->b_blocknr,
+					 le16_to_cpu(cl->cl_cpg));
+			goto bail;
+		}
 	}
 
 	if (ocfs2_dinode_has_refcount_without_loc(di)) {
-- 
2.39.3

