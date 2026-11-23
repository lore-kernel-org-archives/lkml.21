Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420252;
	b=LfVkNTpBGK6AjcblBUTX72fJ2u1rchm3PCcHLU0+Vwy93NJba1Kj4RbZ4Cbss0TqH0sE
	 jzj2vBy6pJUZhpxocUdTKq7r1FDm5eKQqa2fJ2GkztswR+olB9d5LRNSy2T9k0OFYHlU/
	 7UiR1LPIB378YsFL744uG4kt/1NhF0JTE0B89NlyQu428eqD3D8ZJY0jf78GpfruY5k/c
	 QOk7cI5TRUswvZkguTM/Z7DaQZ/qmpzmYJrpaXOAhRsXPBFN8Q3qTjtzEuCUQhMbAYVY3
	 on/uV16Oap1NueHlrDC+mrv5qOU/1oNLW5TbVcVmsPrQnL++IhQlyuBKGioC1bgnZLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v2Apz3ssdYuV5VnyxzTDD+Md8/ohbYbbEPHRSzngUIg=;
	b=J1znZTbaLgXopl1neiifFaPD8ZpSlMVKow90yxb3alH/aQzSZNJc+4GIr2NDV9UIU1Ak
	 0q3KrAtCg2HZJIYfMZu+ktqExAk4sxn0sDob6Ws+GtGWFKZv0dh+8xs/yCYkwdBSiz22I
	 DqlGL27K3chgVJkqcoU479+BdeXfa9Fyy0UDSxn/RLKyEzR8zLZBcD41caN91XoBUNhYt
	 BRz61oAHmcKKpSIBwpDd0i4hpsu1c1S+nSwbEDSNlB3kESmSU2EoWJKHBjdU5AfYCJ5uX
	 rfgIk/G+EDDcKoUM/lRJ9YPjV1x2IHICm4wpVjO/FLB8nPAHXpaaNz3Vhj4z/WWxvDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwyyWKV2;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386C5606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386C5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mwyyWKV2
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2212923f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795420250; x=1796025050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v2Apz3ssdYuV5VnyxzTDD+Md8/ohbYbbEPHRSzngUIg=;
        b=mwyyWKV2bCwBrc44y03L97JcgWzABEopzoEnoI3rXn/nnCY1EEkbs8WE5c63whzE5Z
         GJqDlJyyJT5HemU8N2X0TZQtNId6emRFUJyqZLuxCzB4wMuIzv8WI83WfANSZ92GqwEO
         NVf8JjaUbrniYOTb2XhouBqWczBlk5DgKb0fEOo2R6NaVsbzCg7g2FKTc71vFUCymwKh
         Wz5V+PVuqlDoiTd+GYEmGTgAQqTCqLdQsJpIEi1jz24wf/330fnU03MA3Px8azAZnHTP
         4xlOtNihby2Gy7Y0b+JyUgTWwT5OdruRSFbAFGU869SFQ4kQAmWG9BTPZllN1G89RF8q
         kZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795420250; x=1796025050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2Apz3ssdYuV5VnyxzTDD+Md8/ohbYbbEPHRSzngUIg=;
        b=lGtKxueov1X3iO1ASIO/3q/GLS0YrXFmsuUPR0mzqSjgPbrXjIMymOA+hmiYKyLebz
         2MwoX4KDvMxOvx9OqdnWX57K5eVAdeE8S7ZBN8T6Q4YqB7spHDH8kdX2Nt4iDb156JB+
         XzzwvXMvZkdusOKNP5hCcYEqiEjV6vSk3cIuACfe/X7pvwDz/2HrYsh/EUQqM9XqvWaZ
         FTV9grwb7sVe2TNkn9t/c3QAJozUtIlrJH288xXwPQTxv9sKYsXCo1g1sPSdORbS5YYL
         AGSGYmhCX0kEut6oKS4iEzcWqtmF32JGZj/OAuqFHtiVJux2yNqJ848PgPtdGp8HrT+Z
         fIoQ==
X-Forwarded-Encrypted: i=1; AL+hErHmbOjwmBE1cGn1+cGKjSPa+o31wJb4WUjvzyDT4Pk8diGbvcDDzsh0l6LHn5FSAOzHKVJaBC8lYfu/Jis=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UoRJjqLzVtrVNTGZdioJhUCa1ba2DU3hDtBvXqBrsj7EVgeLM
	HVr1+j6hi2wjByc54YuKwNDguWUzDbt32McUR+uYcRqsR10zrD0GID6A
X-Gm-Gg: AZFdTZfGuBICoRU5tDIdWI9EybiZxT6h6yFSLJLcY1e5SVa7bJcffXmJAoOLLHkKFl0
	I3aZmw2Qzm0TlFoR8hQzGnDede3f11AAY7+ppsowFEYyNGFg5vbDKb1Ney39iBrtwA6cf4mTNLl
	j/XKbfNb0BQgVvzraFNNHIBHnDGHcThzA+B4OqF9RnkxgK/50nBirnO2ICTnSvURRf50P4CypTc
	YXppRcspQOJPPYnYjCDZL8w5zqOJ1kkXG+igpFJrI6kY5U3YWFmPkd46YH0G2MbznDWs9CzwO6K
	6p9DZ0ZnBRGiOnzkhuClOijCd4I3Yo/MF9nIOqSNiiE+e89HVRlV5X8YBUafAxnppOLMlTpqFMs
	2VZffGijpgCLscuabgJGVXeO5o2THWw41cTE7sydNGRFu23WtWoIVRb5o43kq2kVXw/aLKU1Psh
	b+AxWpLzXnbsKIjYxXrcev75rW7Xe/SMYPiLrUsJ/FEs5pKHb4LWu1CGdWuay3IfBf2XL/ZVFlP
	e4TfcLJ5S2mwF6gSm99M2rUssQgPGz85cr7SoZF1vDqiGi1JuLshn8b6rIOaqGvJiVEYSS2a14X
	kesYto65QYaqCShM5T0EtMD+MXUD9wYLo2cFsrT0Ua82Pq3J9OHIRHk=
X-Received: by 2002:a05:6000:481c:b0:4a5:ebcc:2260 with SMTP id ffacd0b85a97d-4abb2dda518mr20350879f8f.29.1795420250368;
        Sun, 22 Nov 2026 23:50:50 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([37.111.157.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm17207033f8f.46.2026.11.22.23.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:50:49 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>,
	Jan Kara <jack@suse.cz>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH v2] ext4: avoid inline data conversion race when !EXT4_STATE_MAY_INLINE_DATA
Date: Mon, 23 Nov 2026 12:48:26 +0500
Message-ID: <20261123074825.63294-2-arbabhaider649@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Commit ef09ed5d37b8 ("ext4: fix bug_on in ext4_writepages") attempted to
prevent ext4_convert_inline_data() from racing with delayed-allocation
inline data conversion by calling filemap_flush() when
EXT4_STATE_MAY_INLINE_DATA is already cleared.

However, filemap_flush() is asynchronous (WB_SYNC_NONE) and can return 0
while folio 0 is locked by a concurrent buffered write and
ext4_has_inline_data(inode) is still true.  ext4_convert_inline_data()
then proceeds to ext4_convert_inline_data_nolock() even though
EXT4_STATE_MAY_INLINE_DATA is already cleared (meaning
ext4_da_convert_inline_data_to_extent() has already moved the data into
dirty folio 0).  This causes multiple bugs:

1. If ext4_convert_inline_data_nolock() succeeds, it copies stale
   on-disk inline data into the newly allocated block instead of the
   newer dirty data in folio 0.
2. If ext4_map_blocks() fails (e.g. -ENOSPC or a corrupted block
   bitmap), ext4_destroy_inline_data_nolock() has temporarily cleared
   EXT4_INODE_INLINE_DATA and set EXT4_INODE_EXTENTS before
   ext4_restore_inline_data() restores EXT4_INODE_INLINE_DATA and
   unconditionally re-sets EXT4_STATE_MAY_INLINE_DATA.  This races with
   ext4_do_writepages() and triggers:

     kernel BUG at fs/ext4/inode.c:2949!
     RIP: 0010:ext4_do_writepages+0x25c0/0x39a0
     Call Trace:
      ext4_writepages+0x285/0x500
      do_writepages+0x205/0x520
      filemap_writeback+0x1a6/0x250
      file_write_and_wait_range+0x8c/0x150
      ext4_sync_file+0x2cf/0x950
      ext4_buffered_write_iter+0x428/0x5d0
      ext4_file_write_iter+0x7cb/0x1450

3. A concurrent ext4_da_convert_inline_data_to_extent() can also clear
   EXT4_STATE_MAY_INLINE_DATA between the initial check in
   ext4_convert_inline_data() and acquiring ext4_write_lock_xattr().

Fix this in ext4_convert_inline_data() by:
- Using synchronous filemap_write_and_wait() instead of filemap_flush()
  when !EXT4_STATE_MAY_INLINE_DATA.
- Returning -EIO instead of proceeding to
  ext4_convert_inline_data_nolock() if ext4_has_inline_data(inode) is
  still true after writeback.
- Re-checking EXT4_STATE_MAY_INLINE_DATA under ext4_write_lock_xattr()
  (which serializes against ext4_da_convert_inline_data_to_extent()) and
  retrying via filemap_write_and_wait() if it was cleared concurrently.

Tested locally in QEMU (x86_64, 4 CPUs, KASAN+UBSAN) using a concurrent
mmap + O_SYNC write reproducer on an inline_data ext4 image: hit
kernel BUG at fs/ext4/inode.c:2949 on mount #1 in <1s before the patch,
and completed 32 fresh mount/race iterations in 10s with zero BUG,
WARNING, or KASAN reports after the patch.

Fixes: ef09ed5d37b8 ("ext4: fix bug_on in ext4_writepages")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
Changes in v2:
- Address Sashiko AI review feedback: instead of preserving
  EXT4_STATE_MAY_INLINE_DATA on error in ext4_convert_inline_data_nolock(),
  prevent ext4_convert_inline_data() from calling
  ext4_convert_inline_data_nolock() at all when EXT4_STATE_MAY_INLINE_DATA
  is already cleared (using filemap_write_and_wait(), returning -EIO if
  inline data remains, and re-checking under xattr_sem).
- Fix commit description inaccuracy regarding ext4_create_inline_data().

 fs/ext4/inline.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index ceee69a66..f644b229e 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -1977,6 +1977,7 @@ int ext4_convert_inline_data(struct inode *inode)
 	handle_t *handle;
 	struct ext4_iloc iloc;
 
+retry:
 	if (!ext4_has_inline_data(inode)) {
 		ext4_clear_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA);
 		return 0;
@@ -1984,14 +1985,21 @@ int ext4_convert_inline_data(struct inode *inode)
 		/*
 		 * Inode has inline data but EXT4_STATE_MAY_INLINE_DATA is
 		 * cleared. This means we are in the middle of moving of
-		 * inline data to delay allocated block. Just force writeout
-		 * here to finish conversion.
+		 * inline data to delay allocated block. Force synchronous
+		 * writeout here to finish conversion.
 		 */
-		error = filemap_flush(inode->i_mapping);
+		error = filemap_write_and_wait(inode->i_mapping);
 		if (error)
 			return error;
 		if (!ext4_has_inline_data(inode))
 			return 0;
+		/*
+		 * Writeback did not clear inline data (e.g. filesystem is in
+		 * emergency state). Do not proceed to
+		 * ext4_convert_inline_data_nolock(), which would read stale
+		 * on-disk inline data or race with writeback.
+		 */
+		return -EIO;
 	}
 
 	needed_blocks = ext4_chunk_trans_extent(inode, 1);
@@ -2008,8 +2016,15 @@ int ext4_convert_inline_data(struct inode *inode)
 	}
 
 	ext4_write_lock_xattr(inode, &no_expand);
-	if (ext4_has_inline_data(inode))
+	if (ext4_has_inline_data(inode)) {
+		if (!ext4_test_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA)) {
+			ext4_write_unlock_xattr(inode, &no_expand);
+			ext4_journal_stop(handle);
+			brelse(iloc.bh);
+			goto retry;
+		}
 		error = ext4_convert_inline_data_nolock(handle, inode, &iloc);
+	}
 	ext4_write_unlock_xattr(inode, &no_expand);
 	ext4_journal_stop(handle);
 out_free:
-- 
2.53.0

