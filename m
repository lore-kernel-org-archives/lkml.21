Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521271;
	b=CsMav+fRu1MS7W3EgUAeQncY4QaJb0TaDexmw/tfb4+BCTvgQHzmnjfJ2oCcL6QkNQ+C
	 vXh7jcZQA96OjbwzF7WDfCmoMpaHaUMsU0z22xGduwBO0uHz6ih1fLJmHkoMfNQPVBDiO
	 dSVfqcoLvuqgsZj4kueNkOkQPbZ6mI/emWL4OTqp4z7dDLiUcXz2NclYnM+7utoaY8Mjc
	 9SzwkAF+jExkAEC06G5jvJVJWAyf2mz6cN6bFAlmg3ex3H6PAAYH6JTBR2xKUrMqbpOAJ
	 9Ai/I1KLCmsBX5ched4R/6C1rYzcH1PxauGKTNspsuBX2CD4Efv8GdkaZDPnfdy60OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521271;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6ltJ1pW0PzJoIGvio6joo7Ad0slsGETinD5fSZDgy8s=;
	b=BFeg7wV2wJttyV1WmowoKLwj3kz4wJzicxm0vG6P6jaQEA//MSimqxmEJbSaaScT/QLD
	 Jeyh4WxQn0gjYFqs+OmVhEb62IHLkOw4yz2vk+flaUdSJOem2ZaAVX66M4M5pHIL3Hofl
	 sCaW0oyS9GELKo84doO6d6xwd2LXJoTUnJtgHTamm5PcBjPiiwvwRz/0ZfS35x3lHeobc
	 U+TnrXUZnQwNeD3m9pfgU/xONv/thXF79bT9PhXPdhJMQw3VsTfos9qKT8z+K6sQldWlt
	 GPRChTuJwLII3lST9KxKN30/TkHZnHQPr42jkpw/P55fbWntjeIz2yJ2OxNohAMRvIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="MyNVq/NR";
	arc=none smtp.remote-ip=115.124.30.130
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12338606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12338606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MyNVq/NR
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795521267; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=6ltJ1pW0PzJoIGvio6joo7Ad0slsGETinD5fSZDgy8s=;
	b=MyNVq/NR1NdDgfqv1B+X++xr6Y1lcHgbr4Y1rde0U09H1AIHaZ6HVRB63KetfP6B2dyNCVS4YenKUM38oDKXY+zAR9tRudy6kMJ4n+95Jg5PENoiimzOjD8Y4WMQUwqSl9DjiqTB4NyZePsGXHEWUD1uI+/4Vmefv22q03w6bKY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XFOMde4_1795521266;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFOMde4_1795521266 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Nov 2026 19:54:26 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH 3/3] ocfs2: check chain allocator clusters per group in online filecheck
Date: Tue, 24 Nov 2026 19:54:04 +0800
Message-Id: <20261124115404.2937581-3-joseph.qi@linux.alibaba.com>
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

The online filecheck validator reports every dinode condition that
ocfs2_validate_inode_block() checks, with its own message and an
-OCFS2_FILECHECK_ERR_INVALIDINO code instead of ocfs2_error().

Add the clusters per group check there too, so a corrupt cl_cpg is
reported by the filecheck interface as well rather than only being
discovered when the suballocator extends the allocator.  As for the
other chain list conditions this is not repairable, so it reports
INVALIDINO and leaves the block untouched.

Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/inode.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index e6f89d1e3091..c653b6aee256 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2220,6 +2220,15 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
 			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
 			goto bail;
 		}
+
+		if (ocfs2_dinode_has_bad_chain_cpg(sb, di)) {
+			mlog(ML_ERROR,
+			     "Filecheck: invalid dinode #%llu: clusters per group %u\n",
+			     (unsigned long long)bh->b_blocknr,
+			     le16_to_cpu(cl->cl_cpg));
+			rc = -OCFS2_FILECHECK_ERR_INVALIDINO;
+			goto bail;
+		}
 	}
 
 	if (ocfs2_dinode_has_refcount_without_loc(di)) {
-- 
2.39.3

