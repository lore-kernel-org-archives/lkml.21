Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575311;
	b=qgy2UEezkts+HW2KsSU6ae8ons8fsPK74BQJQLKnFD5FApxkQUTTm//l3Ga0nFyYtcgC
	 RNclVDWcO0krhKRXtYLZV2jxQIQ8FZfXGsIj73l3fdQXZA4+1sG9au32gDIPwI+jznDpi
	 jyl87nrHasV9VqJXtvcuvnMSjbkN0zLhJdUIkOzYM//anLgDj9E2rGnL2yl5m7NTshT9a
	 ViIGsBZXYKQriT4wxs7PkM/QErKvjEjGNZ3H0bQ8rHRcjVKLdR66JWev/mWlgrrYmv62f
	 i+v8CxU0g4ahzz4VHeckhgMOc/jS85iJ5A7MBTOLNoY4FY7TUYudz+lhRnp08d7D5pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575311;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7erDcdDpY9NgN6nZQZC3/oBpIWFULdc3fCICAN/BOIA=;
	b=nfoUQwOQcm7sd0PY8Z6PetDEWxWmqjQt3mE09sxHP9aQskFbxtdLCMpceCtzsjAgQhdO
	 t+F3Lr3qrlTet3Ram/oLxzHhxWFPAYS20bAZM6FCeP7AvzbgZiaRSCJMD1dwpGY//cYCT
	 T10p6pvpzJXub3rv2CKxeNfn87MtFgWoo4a36oksymLmdGtUbeU5WymZ6lpYZVaO8a0xK
	 OgVFSGlO6eEMgEGK6drx3U/D8yLHvrsHOGcVkVyEntHQMpn5LaAcQUPElU+5gcWRz7dk4
	 mElQZhLC56m2TsAMbMwfJ/90gXzhzvUnizNv9qSmTEu3csKdHiSuljCJWe0o/mQ2mCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NnZ9gMHZ;
	arc=none smtp.remote-ip=115.124.30.110
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECEB606A331
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CECEB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NnZ9gMHZ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795575309; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=7erDcdDpY9NgN6nZQZC3/oBpIWFULdc3fCICAN/BOIA=;
	b=NnZ9gMHZZ2ZpX7gMR0Y9k6gljIGMpK5+Ypg77fDSif0tNWseB/rrwo+0vxZ42FgJkzWJzge4678hsKnI8WxqtRVjIyWM4n8YaUOom/VTPBbju5SkMqnVXN3NzsZjU8m5s9wMlzikw+eHyqWMlTt+FlaTV3mT/oORKwuAIv02gyM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R691e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XFQ97YH_1795575307;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XFQ97YH_1795575307 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 10:55:07 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ocfs2: check chain allocator clusters per group in online filecheck
Date: Wed, 25 Nov 2026 10:55:05 +0800
Message-Id: <20261125025505.343454-3-joseph.qi@linux.alibaba.com>
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
index 0ef1e06840f0..bf3b30da86d2 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -2221,6 +2221,15 @@ static int ocfs2_filecheck_validate_inode_block(struct super_block *sb,
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

