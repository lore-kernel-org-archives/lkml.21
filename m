Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575311;
	b=Wx8xnJ82scz3ZrX38mPoFC8yoP2emRV1yr07heG2mobcBGQs0TJPQHAaSMTW3GMjiPXK
	 9YxHlzdPewsgEQZ8silgC4apVAo7uU6wHz4XRJNpqBfhdZUIbqSE6EtZxYTeMlriTAWw7
	 BVYf8PefxUlAvxvs7HZsKU7BjmYJuNbVVPgmS2mnox9SKec9UWt+01iRYjda9ZP3/wzQH
	 8QO8uCTGG6Xmujk8YAXGqIONGELtufK6vxhVHuOd7zJnYdd1R7q7tAPYxwvTQ7z3fUZr8
	 vaCf4OJtLlAe5hR9NhTc7zHXWFn5q8bPWjvsFNxHavIB7jvQlq1Y/XmfZcxZnTnvNZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575311;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1fYbACuI6RO6BWzsO1stcp3DOPqpCQsAzi86dIx1gLc=;
	b=S1Ui5ctmqOaFTD36GWVppdYkJxvCg0jzmss7IiriR1og/OvZAsYwlBmWvrQ40gwJMyye
	 whIoBF/0uo1Q2ehT7kzZy7fykjklXLkIF+dFZXKg8gVSELqEA60ARv7D5sGVRJTD0CllB
	 txsexrB42QLFTvMCE885StJH0mGxQaqmhQjRvmdklpfKbFMAxjKYJuCZNxaYp2kHd1zMF
	 d3BhwNI2yvFZfiFpcgEJswJYPc8znl26JK38ckDrAg4J7XMhuHOX7xU950kQGu+UnonGP
	 qAMD66jSluvIVRDhbDHf78hu1sc4rYWxAIQbG+Ei1PJOEIwMibQhVeOmdXMCnjvC9+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=raNQ1+nM;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A95606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A95606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=raNQ1+nM
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795575307; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1fYbACuI6RO6BWzsO1stcp3DOPqpCQsAzi86dIx1gLc=;
	b=raNQ1+nMlwHl1Yt/CN0vN1c75i/0z4cLK4/8E7BtuleeKMAHO9Hs/rgav658aVF6SKyTNUnCtkkRwDxOOpd6SIJ8+1FOY8aIxKHIlQwg7Z2f4x+7UNvMe5WejUePZ0YOx2WIYcHFsF7IW/hDYzA2S96kq2rrWIeYlbszpuGYhBY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R431e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFQ4N.z_1795575306;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFQ4N.z_1795575306 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 10:55:06 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] ocfs2: validate chain allocator clusters per group
Date: Wed, 25 Nov 2026 10:55:04 +0800
Message-Id: <20261125025505.343454-2-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261125025505.343454-1-joseph.qi@linux.alibaba.com>
References: <20261125025505.343454-1-joseph.qi@linux.alibaba.com>
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

Reject a bits_per_group below 2 or above
ocfs2_suballoc_bits_per_block(sb) on every chain allocator but the
global bitmap, which is exempted exactly as in
ocfs2_dinode_has_bad_chain_bpc().  The lower bound is the invariant
the group extend relies on: bit 0 of a new group is its own
descriptor, so a group of fewer than two bits has nothing to hand
out.

The upper bound is the bitmap a suballocator group descriptor can
actually hold, the same limit ocfs2_validate_gd_parent() enforces on
bg_bits.  A larger product still fits the u16 bg_bits store, but lets
ocfs2_test_suballoc_bit() index past the end of the single-block group
buffer, since it bounds i_suballoc_bit by ocfs2_bits_per_group() alone,
and makes ocfs2_block_group_fill() commit a descriptor that
ocfs2_validate_gd_parent() then rejects.

No valid volume is affected.  mkfs writes the same cl_cpg into the
initial groups it creates, and geometry that did not fit the group
bitmap or left no allocatable bit would have made the allocator
unusable from the start.

The dinode is now rejected at read time, so iget fails and the
operation returns an error instead of reaching the suballocator.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
v2: use ocfs2_suballoc_bits_per_block(sb) as the upper bound rather than
U16_MAX for suballocator bits_per_group, pointed out by sashiko.

 fs/ocfs2/inode.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index 8e5f7a240381..0ef1e06840f0 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -254,6 +254,27 @@ static bool ocfs2_dinode_has_bad_chain_bpc(struct super_block *sb,
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
+	 * own descriptor, so fewer than two leaves nothing to allocate.  A
+	 * suballocator group descriptor is a single block, so the count must
+	 * also fit the bitmap size ocfs2_validate_gd_parent() enforces on
+	 * bg_bits.  The global bitmap is exempt as in the bits-per-cluster
+	 * check above: it never grows, and its group size comes from
+	 * ocfs2_group_bitmap_size() rather than from cl_cpg.
+	 */
+	return OCFS2_SB(sb)->bitmap_blkno &&
+		OCFS2_SB(sb)->bitmap_blkno != le64_to_cpu(di->i_blkno) &&
+		(bits_per_group < 2 ||
+		 bits_per_group > ocfs2_suballoc_bits_per_block(sb));
+}
+
 static bool ocfs2_dinode_has_refcount_without_loc(struct ocfs2_dinode *di)
 {
 	return (le16_to_cpu(di->i_dyn_features) & OCFS2_HAS_REFCOUNT_FL) &&
@@ -1919,6 +1940,12 @@ int ocfs2_validate_inode_block(struct super_block *sb,
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

