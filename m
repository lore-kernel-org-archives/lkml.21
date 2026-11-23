Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=92.204.81.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405425;
	b=obEyrya2f0b98PphOPsjlS1Xcp96W2KYwKwKHVVSj2BgHxOEbNJqvzS3OXBRIz5DH+Rh
	 gGJquIIBXnhjxvzf3usBDKTmlvNTqJk9Yxtww88YhZlEd4g6iMyACxELrg0bS7yE480MS
	 RHTy8SmV66WLj1uHsfJsgKj9V63LHtMHxYbsb27GdFyeN6LStdTTD3vc/kTDXJrOmwuGQ
	 AHSrUEsf2xw/sdlkaVFp3Hm6rCJeWn4kLeOgyuW/7eRKdY9+16hRZG5eFDvxTUzgE93Hy
	 5Z6cvImcUlzWWtSC6mGyW5rEKJt0jWNkXq1QNa4T77+CgCBKC3DocdYiF2jpCAjMexQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405425;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=wys9Wx99ZC2EDRSVcGeNB0fz3DNJiTOwnUvw3iVwC5w=;
	b=s3TlUhYMbvsAwTbpZDMvIaSvVf9x3cRlh9JcDKe575OkV+V7s4F9pnA+AgL4OkPB67v5
	 fFQeLEMTX6cPPWMof6TPrYYy0qARy06bZxw9vLiUnf03brIxxpbzPKvxwzu29m2k1tEht
	 YaJrsNFa7f33cwaT6MAiy7qcV5tCnpPTdFee6mpehTNmbs2zhxJRxn+f5KQoUBXYHCWbQ
	 0RWlNDCqPTY34xnGqMlKNKOOcgPjk9JRg1RveEtzfe/iKaVNwhkOJY9E1vz8X924U4SVj
	 iGGp/ec//DVT8iK0Xu8ugbaPVD7EabcOlS3JY760g0+hPibebd3Q/EMcpdws56siKqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=inbvzu44;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=bESHICnM;
	arc=none smtp.remote-ip=92.204.81.43
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [92.204.81.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A16606A68C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71A16606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=inbvzu44;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=bESHICnM
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxlxiqQF; Mon, 23 Nov 2026 03:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405411;
	bh=wys9Wx99ZC2EDRSVcGeNB0fz3DNJiTOwnUvw3iVwC5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=inbvzu44hzn9so6/bQxl60yjq92VAtgzwn5ron8DhiWQfw3LLaoq4VzGywWa3PWek
	 dCMyYHhtX7BcDJccnhNf1REbeQBzpGCuOfBZHORiHGx3pqPp42fBXaUZpL/pQeALru
	 ze1B11r0uFmNd4vGhV32B9PRUH6/3tmciZ5CAMOs0CZ7POYsauijDu10OAskFVPgp0
	 UNZ4lkwI6bQ7rkdA9hJq1Z74ms2EsmlyR7knYh/a1+x4PDtZ2bEl8aqcMfZ1w+JUSU
	 aA3Mza+GW9X8Nhb85Pwt0toEVazIOTB+U7DyNWN9D9u7BtWdi78iBvdv1j3V7M3lip
	 MIvTnOC8+Pnuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405411;
	bh=wys9Wx99ZC2EDRSVcGeNB0fz3DNJiTOwnUvw3iVwC5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bESHICnMGBDaS2Vn7s2i3idC68sU5mZYOi5k8FmsHgRzqeDs7jJDmy2eWGokWa3VA
	 TMGi0X/LNU1CjqEcnyPAnnvlC+fGHbDodIRJVfUr4mNM3Xxn2ss49piGelMFNaGMxg
	 gOfceGG7bBJAI0tu2tA9oKGiyhpcTXt0kazyiA+lwJIdLIIWApLxfQSVG4MOrAE5EI
	 JZem9W4mpgdfx1CUEI4gqtz2uXJ/Q124XaMIC/xfV+5dEZp7GVjNLTA42ty7i/kqVF
	 fb6WfKivfrReFKqqZ/yiUE9vZsNab4YLiqOs/K7/cnUWdoqomkkngu9MAfQDmZME+w
	 Vy3Zo26Z6tJvw==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b662
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=1h8doul4msz9IIiYaa0A:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 0b0d3cd8c1c257d9f766ad6bd70d49cf:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 03/23] Squashfs: convert SQUASHFS_FRAGMENT_* to inline functions
Date: Mon, 23 Nov 2026 03:42:44 +0000
Message-ID: <20261123034304.261742-4-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123034304.261742-1-phillip@squashfs.org.uk>
References: <20261123034304.261742-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfJBo9PF2FfPchnYlBdEcqIe6dggd1wT3WlaEKBFnVZBLVszRfSAb5jbUWijG4TneiHgQQCrEChSjg+9uneIGRvBpG8w8eGlidSf8N9j5QY51sd1rp08C
 27PKP+B2sb/pb3rAMNDSrkZZ+OCFDNeRR4/ZnHjtPcWxugLUqZfFyKMGVapUSMKy4Prx+XkNU1W9Ud53elcEa64Bnjhtvi1Tw9EYVJASfesY4JRF8mNZBrtT
 YlaV3Oqxo8p8j5/w+6229BEV/GT9MSOiD8mZrBlzOVQuEI2+mYdE8lcJubWt2+zN

Convert old fashioned #define macros into inline functions.  This has
the following improvements:

1. Inline functions are typed, which makes the width and signedness of
   input and outputs explicit, which reduces errors.

2. The inline functions enable more sanity checking to be added in
   later commits.

3. Inline functions are easier to read than #define macros, which
   improves code comprehension.

Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
---
 fs/squashfs/fragment.c         |  7 ++++---
 fs/squashfs/squashfs_fs.h      | 17 -----------------
 fs/squashfs/squashfs_helpers.h | 27 +++++++++++++++++++++++++++
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/fs/squashfs/fragment.c b/fs/squashfs/fragment.c
index 49602b9a42e1..e945d045d55e 100644
--- a/fs/squashfs/fragment.c
+++ b/fs/squashfs/fragment.c
@@ -26,6 +26,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 /*
@@ -42,8 +43,8 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 
 	if (fragment >= msblk->fragments)
 		return -EIO;
-	block = SQUASHFS_FRAGMENT_INDEX(fragment);
-	offset = SQUASHFS_FRAGMENT_INDEX_OFFSET(fragment);
+	block = squashfs_fragment_index(fragment);
+	offset = squashfs_fragment_index_offset(fragment);
 
 	start_block = le64_to_cpu(msblk->fragment_index[block]);
 
@@ -63,7 +64,7 @@ int squashfs_frag_lookup(struct super_block *sb, unsigned int fragment,
 __le64 *squashfs_read_fragment_index_table(struct super_block *sb,
 	u64 fragment_table_start, u64 next_table, unsigned int fragments)
 {
-	unsigned int length = SQUASHFS_FRAGMENT_INDEX_BYTES(fragments);
+	unsigned int length = squashfs_fragment_index_bytes(fragments);
 	__le64 *table;
 
 	/*
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 6d993531a5df..3dbd174b5f21 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,23 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* fragment and fragment table defines */
-#define SQUASHFS_FRAGMENT_BYTES(A)	\
-				((A) * sizeof(struct squashfs_fragment_entry))
-
-#define SQUASHFS_FRAGMENT_INDEX(A)	(SQUASHFS_FRAGMENT_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_FRAGMENT_INDEX_OFFSET(A)	(SQUASHFS_FRAGMENT_BYTES(A) % \
-						SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_FRAGMENT_INDEXES(A)	((SQUASHFS_FRAGMENT_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_FRAGMENT_INDEX_BYTES(A)	(SQUASHFS_FRAGMENT_INDEXES(A) *\
-						sizeof(u64))
-
 /* inode lookup table defines */
 #define SQUASHFS_LOOKUP_BYTES(A)	((A) * sizeof(u64))
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index afef13cd6dc0..b99ca67c729a 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -51,4 +51,31 @@ static inline s64 squashfs_mkinode(u32 start, u16 offset)
 {
 	return ((s64)start << 16) | offset;
 }
+
+/* fragment and fragment table defines */
+static inline s64 squashfs_fragment_bytes(u32 fragments)
+{
+	return fragments * sizeof(struct squashfs_fragment_entry);
+}
+
+static inline s32 squashfs_fragment_index(u32 fragments)
+{
+	return squashfs_fragment_bytes(fragments) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_fragment_index_offset(u32 fragments)
+{
+	return squashfs_fragment_bytes(fragments) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_fragment_indexes(u32 fragments)
+{
+	return (squashfs_fragment_bytes(fragments) + (SQUASHFS_METADATA_SIZE - 1)) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s32 squashfs_fragment_index_bytes(u32 fragments)
+{
+	return squashfs_fragment_indexes(fragments) * sizeof(long long);
+}
 #endif
-- 
2.47.3

