Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.121.53.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571307;
	b=Xi988lIF2diIEKEj+M2KORTs4dN44mAeYgDmCvbahtRwifNH1RcJLmpRIKALLH2MuWXG
	 B/PTg/z0PHdSGKV/oUTyrNyUxS+hZJR+TpOfZNiln7PZzIwogUookp5tmlEZ1ZQPwZduz
	 hOWLE3aKPO0d2B2oUdBrGv0zrX4+/WWsG+7hgiFgj1TQR4v03ATPZkIiiglXqRdSr1TWL
	 uK2TMYQ9v0WyYOio1/z5PxuXd7Teil8wy+AHuKOg6W+SmPGNgx95ebPSnqGLMhnUm8v/Z
	 MtOxKiq0J40mJTQ/2zBinKcIgtHOBqPo49DEe7YC4HAT299NTVZgw2eaCKq+Z1eOPdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571307;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:X-CMAE-Analysis:
	 Feedback-ID:X-SECURESERVER-ACCT:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CMAE-Envelope;
	bh=RTWmlxaQ2Ha8YBAMirwSslA1bBfEFfgbfyLjXOotjxc=;
	b=LEfoVwLDTo7Y7gqrU5S/f9vPs3c+YggJYb2NEzluYQGjzEaUx+YM2IvJ/B/sM2d+BlLV
	 tssYTqzKzYNKqBOy5KSEu0+EUi3BpHtwI1yIlFM3Cr6bzZ448hPYIyEyyEi4E4rYTdIgW
	 Bf5ixe7hit4vYbX+RjcHilk3QHNXlMAVK8AO5smjSTRuqP6BGqkbnbQafBIWlvvQ5QBiT
	 XL815aSe7meMoLYko4dMyQuiWebJN4HWM811Zk+Bxm3ismWEhhNzpzlTMOj5zzFpDeX8W
	 vVise0spz8EvcrgmtWrrwrpGCw81Hh0T3x2O22JDrJ8fWdLH7hwidgcCtlX1n8/fyvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squashfs.org.uk;
	spf=pass smtp.mailfrom=squashfs.org.uk;
	dkim=pass header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=HYeOnY8B;
	dkim=pass header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=n0LIPW6j;
	arc=none smtp.remote-ip=188.121.53.15
Received: from sxplsmtpa04-02.prod.sxb1.secureserver.net (sxplsmtpa04-02.prod.sxb1.secureserver.net [188.121.53.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FFE606A6B7
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FFE606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squashfs.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=secureserver.net header.i=@secureserver.net header.a=rsa-sha256 header.s=secureserver2 header.b=HYeOnY8B;
	dkim=pass (2048-bit key, unprotected) header.d=squashfs.org.uk header.i=@squashfs.org.uk header.a=rsa-sha256 header.s=secureserver1 header.b=n0LIPW6j
Received: from avalon.fritz.box ([82.69.79.175])
	by :SMTPAUTH: with ESMTPA
	id W26zxdCHW8H3GW27HxX8Mu; Wed, 25 Nov 2026 01:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secureserver.net;
	s=secureserver2; t=1795571293;
	bh=RTWmlxaQ2Ha8YBAMirwSslA1bBfEFfgbfyLjXOotjxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HYeOnY8BOwpwP7Pq5nztOzm/VliPJ/U4Ts3XOg9+8Io/ze93DtACzaMC3ZGls3376
	 ZCHOMpiOjHjPc5d01+FpWyZtoSzQ8wQusFfeSvtYWaXM0/puCjh2QYjkiIn/s/730J
	 iTR6+9PI0/BhiZcKlCD/T83Iy12VDzFZdztm1Y8rhWFBIQF7TdiElst7DYBeM3F0MF
	 2+c57tT17YlQgs+T3AkBF8y46w0qn0onJHUGwbXNqFfYJS4zfXyIubtghew2dd94Bm
	 MFDTHfOaDIvBv+iSxspG58UIy9yAqCT4SJDiIojacnPjh7o0Wyb8DCk/AhP4PksJXY
	 48SdBjqJO6fRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squashfs.org.uk;
	s=secureserver1; t=1795571293;
	bh=RTWmlxaQ2Ha8YBAMirwSslA1bBfEFfgbfyLjXOotjxc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n0LIPW6jS2R0INjaKuMs76oUT6SPKEfVowHQaP/Ek9n336Dq1u4EH+yh05e8SZS7r
	 V4jHZJpky3LK9kxyCMVW6md9BRG9JWPKE/B543svHaKlOyqE/KZdjs2sXcPTTlFpGL
	 BAzMTCaGCfUvnlK0kaw9zhNfFW6xAqeV1LPr/5rPXzK7hkYOnMH6QvUXjf6ZVxgfnh
	 fWkITHGppryU+3vvlAVYyHnSwtjGxHIfoX6phx0GCeCk2ro5DvHvH/XVLafGyJxtuf
	 SpoRVnmglJCHxhJGh+2TnIjSvt8tq+MV+2e3HVImzl+4zVLgc3EaCWK07K+npoD/Dv
	 mG2taRaTA2cNQ==
X-CMAE-Analysis: v=2.4 cv=Cuoq4X4D c=1 sm=1 tr=0 ts=6b063e5c
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17 a=FXvPX3liAAAA:8
 a=_bInhHkTttLfAsG6xnIA:9 a=UObqyxdv-6Yh2QiB9mM_:22
Feedback-ID: 89141f2f6a4987d2ccbd7c75ac513de0:squashfs.org.uk:ssnet
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
From: Phillip Lougher <phillip@squashfs.org.uk>
To: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: Phillip Lougher <phillip@squashfs.org.uk>
Subject: [PATCH v4 05/23] Squashfs: convert SQUASHFS_ID_* to inline functions
Date: Wed, 25 Nov 2026 01:47:19 +0000
Message-ID: <20261125014737.347231-6-phillip@squashfs.org.uk>
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
X-CMAE-Envelope: MS4xfGD8NbTM3HKliZorjRxZ+xyrKFWUbpQeQJqk4ykvllpHJgFRVJLbQZYoxMLj0eimM7nqxuGJ+kLxnTTbvYuqXXx+Ax9vrrim+my+4JyodSIlsAGv47CX
 am4zOYfELiqHUuTycRKdQJSkIRHXIQ54XBkVuFhHXIrYYrgg/2MmIQOIP7jbIchC7O916uNJkXkTX7qYS1VViMRtyGeBldagZnOoLZXPpbdxbg10O/dKmkS/
 ltSZRnHMUmJzuQEjH0NSM9AOcfTr2fVxX1P7TmBgzYI6FMWBL2u6gb2ZbTFhnG5g

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

