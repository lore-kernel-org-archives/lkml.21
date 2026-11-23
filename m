Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416927;
	b=b0NGDiOqDKxE7Di0NG1mOliEOGiFIshpKA4uD1IxPteK5yQe6CYk3Aym8nyMAtcX0VQp
	 aakx5MGcYxHdiXiAMxGFu+eY2MZ4cUza+kb6xkXt+Kef8QJ3Hp8Ac2aJd4grykqmvFAX2
	 YZ4dzADYB6K7QATW3mi6tWvkcfAAd5GboCGcOKGY8B1e4VJFnleVxvQdYK6JZv02eQyyi
	 llh8MEjlNGNOtpZUs4oy0o0byq8nVWETX+aq+85SrOCtxcKz1tg2dZhbag+4jJcKAMf9i
	 C4IH0R8+/yJxdFY7xO+xjA9+G6YuY18g6CNMvbzyku33TkWF7f0G0g3/M+BXUIV3kiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sw0yGZEZQlVpTyvtRZOPIDwQKkA+/+G9V7rnQKUJs00=;
	b=V11izaHLsMio2R8AmOuuSKxwqHNUujOVGAPNpBdnHizJYBJ6f2/6Ca2sNsMh0M/PLJl5
	 LZoWt3I4tG3RgSRUYLL43fKVRDw6mT9yWkiyEV53LlvY0TzTidmmeaeSaxECr2jTF01fz
	 uNmL/d7SInIiwg92iZaexdJ53z54EwATHHTemBVsMkccGmhO7iljBxwuOrukfVYmgQa3C
	 i9yRJTJeo9jyylvsuv6WZlc8UYuXzFJBnPthIqtZ40TmT3JTi3aSy1kGGhNFPlnpMtAOJ
	 jNswbTCOUTd3fmjxgflc1nLCIWmBvDnLgn1/RQAcVugfwfhoZn4vPxnJm8azbjW8rNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxTI65F0;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADCB606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADCB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zxTI65F0
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso26426455e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795416925; x=1796021725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sw0yGZEZQlVpTyvtRZOPIDwQKkA+/+G9V7rnQKUJs00=;
        b=zxTI65F0z0G+SdjQh4XAnUVy4FDqLLVtBcXkxpo+xWF0fnYrLgcbdSjtZWltCxZgWd
         nsECxVhOXssve+Yp6Avsi0TD4k4jJDZx2IiBFddPuzrQRHYaaADIGKyUftplAiAPDQ8T
         CzlmZmfrWQnqdnHN+meCttMqlS/i1zpmRQPW+dfV9eh1TdEBDjKP0NX6/BG3EXw/BTSl
         KBcWcB3Y0aCd7PYLkUkIsmGUfjSZIMiHprJJylm2f7ooTcj+CKg3173RgZEz2c6X3aNT
         Y6VmeAz3s5gKNBlbV/xUo13vm4jcaw+2icRPAbo8saTdVGATcXkiQAGKZx69/8l4dy4F
         k4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416925; x=1796021725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sw0yGZEZQlVpTyvtRZOPIDwQKkA+/+G9V7rnQKUJs00=;
        b=pL+yCCIfNG3hsm5V9DrzADRUSKZFSYppnkaH8hQD/Sbi5K2o4AypeRDHK7J1fAkUcK
         3UXZwQeszm7CevUPvHOwxu/bQIixwxeHYbjzJ6X9uYvC91PiFhwt6xzJIM+63WrXeFHJ
         Ix0NQllsWYxofZO8oBvhtpRFDepNbO1KseUzJAZnXgp2kzZaST52BQakhzmKmyY1n4yJ
         6S5iqOoBrxoyJR2YOwhUXClUZCLlc8AEWIeU/KR0AxpD7WFjswFznwGDCRE1WCca/6Yx
         ai74Z1U2xIVRdIEAAXQavbxHBoPVjqih7FSIXfRzE0UVvrJ004IXSF+B2etJQFa0Z8lM
         clZw==
X-Forwarded-Encrypted: i=1; AL+hErGepeSoPK6z0PLqUHDuL6CFps55a1lrUO+Evw9FXr4ky6jEFu3mPaPcQgX/Xygf2N1U00VaACHeKBf82XU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+y5WQTgmK6CmlJCQgKDj6HFQFnv8DM2hZewveKy4WF/eCvBkLa
	hvHaD36Qz+dvBAvV0EBT+Y9BtkfnrwLs2+HD7oHOeewx/EWa3uWmI4yF
X-Gm-Gg: AZFdTZeiMta9j4xaHhP0XFfI+tlkxLBatSXegLW9AHlB7x7XtDAI5xd2NTX3+FQmPbO
	ZmRtpnvx20UTVFc1M3576IbghhWYMnBiG5/smNKXBrQ5mUos18+b3h+0NA88wBuY3okHR4OaEBD
	lAdpSPoZQOcXqLaNnodzNFzCeUpMdQ4Yp/PIWpHvyKWWCORd2kv49UbiiwtjLmSztW4MCeArjNN
	ZZ24ygPOOYk/hKr2ZoF2ipaTsbxruhq9TFlgYvjFwnnvTpkzt5LaBL1Wjxo3w41JL2lugdCZ+yG
	nZDPI5jQECGvVk9NyrAZ3d68klXjD0lhyOOudpsrBTwGkNn8IxGdpw+GC5vhTAYXWGAnY7sZSQu
	7SwTyV/Snz61//+RvLO+xn/kprT4BMG/1pRyGvQEgeiOehEk4JR9hJfCLDWBzjo0Z4R1Y15e38+
	gRPP+yMIMalkHQ2shHAC3r9S4ecmp9OInGSPaEqRPHFr7fmlaOaOkd2BSOCmTLd3oQns/woMH0q
	7lpFVYzhPHtP4OXp/YXUlNJX2Wraxb0Lw/JqEKURJmW9jabNqZluxUJKHfA4d4FDIZWplB+SfS6
	U4WSZoU1c7RO2BxmbFcX9zmJsDKcv4KNW669FLKhV6Z6/HRh2/K0Klia
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb88811c75mr236581345e9.19.1795416925315;
        Sun, 22 Nov 2026 22:55:25 -0800 (PST)
Received: from DESKTOP-V28CTA4.localdomain ([37.111.157.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm20601212f8f.6.2026.11.22.22.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:55:24 -0800 (PST)
From: Arbab Haider <arbabhaider649@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>,
	Jan Kara <jack@suse.cz>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arbab Haider <arbabhaider649@gmail.com>
Subject: [PATCH] ext4: preserve EXT4_STATE_MAY_INLINE_DATA on failed inline data conversion
Date: Mon, 23 Nov 2026 11:54:49 +0500
Message-ID: <20261123065448.60742-2-arbabhaider649@gmail.com>
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
then falls through to ext4_convert_inline_data_nolock() with
EXT4_STATE_MAY_INLINE_DATA cleared.  If ext4_map_blocks() fails (for
example due to -ENOSPC or a corrupted block bitmap), the out_restore
path calls ext4_restore_inline_data(), which unconditionally re-sets
EXT4_STATE_MAY_INLINE_DATA (both inside ext4_create_inline_data() and
directly).

When ext4_do_writepages() subsequently runs (e.g. via O_SYNC
ext4_sync_file()), it finds both ext4_has_inline_data(inode) and
EXT4_STATE_MAY_INLINE_DATA set and triggers:

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

Fix this in ext4_convert_inline_data_nolock() (called under xattr_sem,
which serializes against ext4_da_convert_inline_data_to_extent()) by
saving EXT4_STATE_MAY_INLINE_DATA before destroying inline data and
clearing it again after ext4_restore_inline_data() if it was not set
originally.

Tested locally in QEMU (x86_64, 4 CPUs, KASAN+UBSAN) using a concurrent
mmap + O_SYNC write reproducer on an inline_data ext4 image: hit
kernel BUG at fs/ext4/inode.c:2949 on mount #1 in <1s before the patch,
and completed 32 fresh mount/race iterations in 10s with zero BUG,
WARNING, or KASAN reports after the patch.

Fixes: ef09ed5d37b8 ("ext4: fix bug_on in ext4_writepages")
Cc: stable@vger.kernel.org
Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
---
 fs/ext4/inline.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index ceee69a66..c4ef91cd3 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -1105,6 +1105,8 @@ static int ext4_convert_inline_data_nolock(handle_t *handle,
 	struct buffer_head *data_bh = NULL;
 	struct ext4_map_blocks map;
 	int inline_size;
+	bool may_inline = ext4_test_inode_state(inode,
+						EXT4_STATE_MAY_INLINE_DATA);
 
 	inline_size = ext4_get_inline_size(inode);
 	buf = kmalloc(inline_size, GFP_NOFS);
@@ -1181,8 +1183,12 @@ static int ext4_convert_inline_data_nolock(handle_t *handle,
 	}
 
 out_restore:
-	if (error)
+	if (error) {
 		ext4_restore_inline_data(handle, inode, iloc, buf, inline_size);
+		if (!may_inline)
+			ext4_clear_inode_state(inode,
+					       EXT4_STATE_MAY_INLINE_DATA);
+	}
 
 out:
 	brelse(data_bh);
-- 
2.53.0

