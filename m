Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405427;
	b=q2u6/ZVrIpVFG/aqjXINYtorN9c4772d5YFBbF2p3M0SoSMSbAalhtFC9QYpSmPxAHUa
	 4/H7xkdREElSWc5tMu5qiI9a8bC+ZLvMMvlkpApR/kPcog0sDn8C1SFJcgMpwY59jw/+b
	 TPNZGcj9nQtmaq87XmXAslCFZ5DG+HX8wMIuuCLde1UmBC5WU/GYnd0PJjm/mcWNidctg
	 m0own6mzl0UEzIBs0LfOg+uX5mqPGKGhNNYElNG3Ia2BQQrX/Dr5yB6MyPqiAokqffQ43
	 e7NDhOOSEWbdtZdO09pGD+Ax+eDFm4g+VxyEI+I6uQIy+U1TMxJ/yONJk5gPfSpFOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405427;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=RTWmlxaQ2Ha8YBAMirwSslA1bBfEFfgbfyLjXOotjxc=;
	b=zsZHqcipRULNR6BsjSFC0h6J4HTVigUxKq+7zV+GUzUFR8BMDSyTPEvN3cGAWaXGCUIu
	 3WdmSS1zLC0AnkbrQA8LFynEFuwcAlKyWwfY89yJQ1h8GbAAYoEdlkOrRAajcKh3vj6SX
	 pHdWJeq/mli0lvE9i/LoS4UAwNl6ooJsIj8nrZ/iHEwjrIm36LKSX6Z18VRpOTr0LJniG
	 kKRuuoBgO3R/hVr6G91b7t4jM8YF5DRWgXEspIS8/pPgoDeKJJ/gIi4lzMlZmxJulh/8k
	 FAdhMDf56dEnmYaKmnv8ziGj6GvZYP/dirEDEScKHrDnEBmfJ2Rv40ANO31iigXOnaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=IZOk6HF5;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=bc33HOUI;
	arc=none smtp.remote-ip=188.121.53.41
Received: from sxplsmtpa04-04.prod.sxb1.secureserver.net (sxplsmtpa04-04.prod.sxb1.secureserver.net [188.121.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3EF606A6B1
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C3EF606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=IZOk6HF5;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=bc33HOUI
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id VKxRxJoOeZuU3VKxoxiqQS; Mon, 23 Nov 2026 03:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795405413;
	bh=RTWmlxaQ2Ha8YBAMirwSslA1bBfEFfgbfyLjXOotjxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IZOk6HF5nBnOXcGI/0l4hYN7cEZjsYzlH6tvVwICZ08laZx9aNmdkfOe3dif/pbL9
	 rMYufTgN+JtF+jX8T3krmn6Azx2pk8RxAtwdAmo8zjsIO0ndyOiCxNd19JBb9JWhym
	 N6voP/D4Ku0BvFFW6KbSTDbP4Ar3lVW9o/rXLVddkReMGIzTHzrg/Bes2tB/qJN5Pz
	 rrPZeuyKmHTgew9lWHqJ0oHGmTuT0i7Jak7/vap6aLnqm2lbjkko+4821AgXkaETAs
	 REFGBOR4XeL1GdLItZwd6IqLk0pf3jvtzD589M3bwEt6sUfoVb3mnTfIE1TRd7PqCH
	 zHkfCozGrjeHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795405413;
	bh=RTWmlxaQ2Ha8YBAMirwSslA1bBfEFfgbfyLjXOotjxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bc33HOUIS/DY6liz9f0VbRG2hmhEb6T8VqkA/EsO3cl5mHjtO6HwIp/G6jpu/0Aig
	 7I8rnhE0MVS4dRNgBqe79YsLcG6jkevJhSvpdFr3rwRZI/yX4nfDHygGC8HirzKiZR
	 n4U6Nna89CJCg588xr0VfpaOlNHxLii6AV12zTbhlcgQJhnJTFwZvoVa1fwaOLUifC
	 UQV5Nero7dC4LmFYKIPOB+ZQ/l/OeTtkSCwLZ3jPmPkPSWb7T3skYII4AietFThJcW
	 GbmiIselCpeRPdHLXUIrWQZbMR+bobLGVepazSRUdQxdj/t+diolRZUHC9OdkhDFlS
	 et1NvVUkQ18pQ==
X-CMAE-Analysis: v=2.4 cv=CvYq4X4D c=1 sm=1 tr=0 ts=6b03b665
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 8ff9135744a45be5530f50e4fbd2f054:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v3 05/23] Squashfs: convert SQUASHFS_ID_* to inline functions
Date: Mon, 23 Nov 2026 03:42:46 +0000
Message-ID: <20261123034304.261742-6-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfFfHxseJVKuDXxrgDWX5wY1epzGPA4uJlwFFMBKJtMjBhxXYxzT9dqOVYPxqjJlTM9f2Y/vlYiXPLtAvaP3U0Sh1DZRtAQgXqy4iRM+TtKrrem5vsWr3
 Swl0Wej5fZFlEL8lglUE8z0RQjr+B6FUDg+2IRrxfxLv0lJMTZLcyP4s+awDmBFF2+vLmdcuOgCN9+21qTcRf74Cb9mgTHvUo8T8IECpP3okfaECXASlzkll
 MErvNWSgYkJ5I05FvQs8W3Mupn8OYAiebggEHdtgn784FZ8ytOtQD4EHK77ucGCA

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
 fs/squashfs/id.c               |  9 +++++----
 fs/squashfs/squashfs_fs.h      | 15 ---------------
 fs/squashfs/squashfs_helpers.h | 27 +++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/fs/squashfs/id.c b/fs/squashfs/id.c
index ea5387679723..5630f5ec159a 100644
--- a/fs/squashfs/id.c
+++ b/fs/squashfs/id.c
@@ -24,6 +24,7 @@
 
 #include "squashfs_fs.h"
 #include "squashfs_fs_sb.h"
+#include "squashfs_helpers.h"
 #include "squashfs.h"
 
 /*
@@ -33,8 +34,8 @@ int squashfs_get_id(struct super_block *sb, unsigned int index,
 					unsigned int *id)
 {
 	struct squashfs_sb_info *msblk = sb->s_fs_info;
-	int block = SQUASHFS_ID_BLOCK(index);
-	int offset = SQUASHFS_ID_BLOCK_OFFSET(index);
+	int block = squashfs_id_block(index);
+	int offset = squashfs_id_block_offset(index);
 	u64 start_block;
 	__le32 disk_id;
 	int err;
@@ -60,8 +61,8 @@ int squashfs_get_id(struct super_block *sb, unsigned int index,
 __le64 *squashfs_read_id_index_table(struct super_block *sb,
 		u64 id_table_start, u64 next_table, unsigned short no_ids)
 {
-	unsigned int length = SQUASHFS_ID_BLOCK_BYTES(no_ids);
-	unsigned int indexes = SQUASHFS_ID_BLOCKS(no_ids);
+	unsigned int length = squashfs_id_block_bytes(no_ids);
+	unsigned int indexes = squashfs_id_blocks(no_ids);
 	int n;
 	__le64 *table;
 	u64 start, end;
diff --git a/fs/squashfs/squashfs_fs.h b/fs/squashfs/squashfs_fs.h
index 89b998f57a2b..25dd89a2c6ad 100644
--- a/fs/squashfs/squashfs_fs.h
+++ b/fs/squashfs/squashfs_fs.h
@@ -107,21 +107,6 @@ static inline int squashfs_block_size(__le32 raw)
 	return (size >> 25) ? -EIO : size;
 }
 
-/* uid/gid lookup table defines */
-#define SQUASHFS_ID_BYTES(A)		((A) * sizeof(unsigned int))
-
-#define SQUASHFS_ID_BLOCK(A)		(SQUASHFS_ID_BYTES(A) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_ID_BLOCK_OFFSET(A)	(SQUASHFS_ID_BYTES(A) % \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_ID_BLOCKS(A)		((SQUASHFS_ID_BYTES(A) + \
-					SQUASHFS_METADATA_SIZE - 1) / \
-					SQUASHFS_METADATA_SIZE)
-
-#define SQUASHFS_ID_BLOCK_BYTES(A)	(SQUASHFS_ID_BLOCKS(A) *\
-					sizeof(u64))
 /* xattr id lookup table defines */
 #define SQUASHFS_XATTR_BYTES(A)		(((u64) (A)) * sizeof(struct squashfs_xattr_id))
 
diff --git a/fs/squashfs/squashfs_helpers.h b/fs/squashfs/squashfs_helpers.h
index aafc75a3a435..b9c517a50642 100644
--- a/fs/squashfs/squashfs_helpers.h
+++ b/fs/squashfs/squashfs_helpers.h
@@ -105,4 +105,31 @@ static inline s32 squashfs_lookup_block_bytes(u32 inodes)
 {
 	return squashfs_lookup_blocks(inodes) * sizeof(long long);
 }
+
+/* uid lookup table defines */
+static inline s32 squashfs_id_bytes(u16 ids)
+{
+	return (s32) ids * sizeof(unsigned int);
+}
+
+static inline s32 squashfs_id_block(u16 ids)
+{
+	return squashfs_id_bytes(ids) / SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_id_block_offset(u16 ids)
+{
+	return squashfs_id_bytes(ids) % SQUASHFS_METADATA_SIZE;
+}
+
+static inline s8 squashfs_id_blocks(u16 ids)
+{
+	return (squashfs_id_bytes(ids) + (SQUASHFS_METADATA_SIZE - 1)) /
+		SQUASHFS_METADATA_SIZE;
+}
+
+static inline s16 squashfs_id_block_bytes(u16 ids)
+{
+	return squashfs_id_blocks(ids) * sizeof(long long);
+}
 #endif
-- 
2.47.3

