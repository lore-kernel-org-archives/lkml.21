Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571304;
	b=jNtjb3DQDfI4ntfcGRa1AtFPlPEpiffsuQ/sBlhbG0dA4hPey1O8mMxqOrEFkxEJTXJp
	 d2Y31WOYnkzQIE3I212shOktny8Kla7QblevmxZNUMPxz6QowsnY9iiTkC1llJp8Uv8s8
	 IUzblXZJBbAiI7NPUbAYI2GbyzzafnHyZGTIKQUXozLcf2orWehegRDeRklRqQqJ+sQu+
	 p01YEPXgfaJO7I0figIQwoTYJ49l4wSbzPMwq56xqB9pjvOuwcduaBXCvu6cDcyT4G+5o
	 4geEAoHwP9jhoFnUiAVtD/s+++jfFq6ssEyUNeTCehO2sndX/18/aFy8YvcHeFHdU0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571304;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=wys9Wx99ZC2EDRSVcGeNB0fz3DNJiTOwnUvw3iVwC5w=;
	b=Jn0Tj4IHTJqF0fsFhzlkiV8UiKzlyL8Aw7YhJQAC6aYwldDwf9ISFoXSzb2CpnGuyi2X
	 pMTppdr0+edTu+wiOBoH2DFqigsaguT8V87RR/akO4iv3hu/p74pfKbdcKG4r+jPxXzu8
	 GAxNo5+ehKc/GhqTzmFh324kuG5waChXCYoRtWDP2bO2LN2krhRdAzesalDiTwmxGbBcp
	 C7xtprq9NJkxybEDOk8GvK+36+nTB7Vj1k88aHsCqMJycSOztlvduJHoBZQKfkzU+RXDB
	 R+MuOHXPTdA5q2hZa8ByIdWrvhUCAjbfFi2pR5Aopllz2cV0SNn0hiFvBusLoQH16Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=Knq2hMUJ;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=LgQ3AnGI;
	arc=none smtp.remote-ip=188.121.53.15
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833D3606A68D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 833D3606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=Knq2hMUJ;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=LgQ3AnGI
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27ExX8MX; Wed, 25 Nov 2026 01:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571290;
	bh=wys9Wx99ZC2EDRSVcGeNB0fz3DNJiTOwnUvw3iVwC5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Knq2hMUJPjJdipFJ8sbbkQj6hvCKOQncWcELc8h+IbqfuXBztDj/Zisw6lRAB6a0Y
	 SyzsNYeaGwVbPpeb6QqFIdEdFF990Fpkn3IzIPEGkQB+pq6ie5xGvwjWl9BwVBgnq3
	 JsCs0a1//tcEDBwt5YwsnSD89XQlr/Flo64eHkoJj7VKbNe32eg+RuwfkxT4dBRw27
	 aoS2xZTpFfT/GI9zoae1VVcP9xiRbapSfbQG7JNO9t6OiKkG7Us7mHbV6LPuevDx18
	 xtq4mTiVSUM5b8K9c37AtV6JtcvZBWDNbrExahuanyP8M43VlR/SLPjVfEDce1ZJOl
	 g1+pnF3IQboyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571290;
	bh=wys9Wx99ZC2EDRSVcGeNB0fz3DNJiTOwnUvw3iVwC5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LgQ3AnGI5kjydqGZbJsLSWVNVZVedMTh2dU9KiAb97vw+AGWs5KSP0a+SOHj7btQZ
	 5thCFyXn+wo239kohfKSTrAOTsrd3gfiDs94tuQi/G3F6aCAkBc+xvEKEyVr0Y5D9b
	 fVi27XSP+cQFJ56hjx8hCeDPsp5Xyj/EwnVb34HMuWe2TQDxIQputd5KU34MzTwDTG
	 8bZvjKmY8oVCRXurxkTS0rDkijIDsd0DM9sPDlhlD2rDD2sOybxreyJbPdPMYjfyia
	 a/EixDfy3XbB6jkmYbU/03h43eXV6KkJwIDl/xg9RCF744XPKgRl62i/4sGxesVcyx
	 dcZq1Ssc+8kKw==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e59
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=1h8doul4msz9IIiYaa0A:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 31a11641297a04a67de3556d9eace091:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 03/23] Squashfs: convert SQUASHFS_FRAGMENT_* to inline functions
Date: Wed, 25 Nov 2026 01:47:17 +0000
Message-ID: <20261125014737.347231-4-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014737.347231-1-phillip@squashfs.org.uk>
References: <20261125014737.347231-1-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfCyChIs9WuUUFU1wHfPeF/XNXQzDxvJTYNYRUtktm7vM1ZAbvB1nGrhgmDYDG2kwfdN/whKLQ21tvNo5GCut4jl6AGdiPoIlQKzGIihVL3Bgm1KF5rJQ
 M60HAjMi6WhNbGY5Ik2fYucNDTa/Ivj3S0LkjcAyAt9CdpRJxrtV4j4SI+i/HGO6xa4eUCBoeMeRTmW/Z2ECHb3Domw68xZ+pVq/kQiRbPcw0qECbXfP1Qy8
 3wTvK4zcnD9tanH610cmfbZBVyJXcqSoGZJEYBKkc0q99YncID0usptr9JpcRHzU

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

