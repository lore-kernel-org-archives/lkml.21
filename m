Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958336;
	b=dXebyFcV9SjPGAZwWMUg6DSzCZXcTTy2/6LDQXS5wvgjWAepsTisxrD5wveXvOfgcKv4
	 qOHJ3YIr/YV7IGInQ7cDnjKdETJuX/YyS9fR0z3WsN6WpnHmkMFyzsUouESUz7Zori+PN
	 eicm5Uadb8G7OVJw5SmfpXuMZBNdarfEV88dKZP1lZKLWylM5HOy1eOU2Qn7KCV7Da+SZ
	 FlOwVkdgo9OecHGOGaYVFsReqaEfNEB9EPyoKSggjQWoLOreevZEKHaba7l0c6C1Eofbx
	 F7Z1GAzjglRRGxRnzy2goqR/cjaMWnI3RJn66gkIIsaM1LK0wUs9iEMltEISjoEmYHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9IwyFV8Hw/ru2qtr97qIXUT1MpN5o8lRiFBBmhPx1J4=;
	b=44No49iGB2CEC152pG539uQtDwu+q85JjrgS+VcE/JlODeN0pigss5UjxvTEDzPuPuib
	 43hRB0Bm4SYwNvRYV0f2kH4/X24EEM6jeaJxUd6YFllnowGgccVx6bh3leSYZJD5j72Pe
	 OfddDu4kuo5jptkovYc3fTLTBqeJZmz06Yspfxmqk/RXnVwsN1HHk83n6X9zPXvoyAOGj
	 NPZ1/PcNsRHVRNd1BWF88WGhvjhrHF7Mo1/TWXNHOsOms+mJRJmRdvgcRCgEz+nm4jx8L
	 3uDZP7u4cw1ZEEJGu9WNcemfLAkFfLnW7Aotm4uhw8hvb610AGlT/fmBdG8Zx9mUkJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TUo6PzlP;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A268B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dhavale.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TUo6PzlP
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so359606eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794958335; x=1795563135; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9IwyFV8Hw/ru2qtr97qIXUT1MpN5o8lRiFBBmhPx1J4=;
        b=TUo6PzlP5dL8VHJ9DgzpoZViMJDHHEPNybIHHFYBOgad610mKaA8Rj7f51hafkpoC6
         rHPh/OBeghn/8Hxs4kO/Tx9enk8Cy5lJUJDC4MgRoUJklYtTsX5aTV75zMZlX2WSvJNC
         Cm8Zugb0y1MTOHa/ceqlkL5FNv3kuiWOPX74nMEf5eu80ZQlUnYexoyH6t/ju39o5DVo
         GDCi1kNGqC24pvH4KxQPJ0Xh5IFJs65crMCjTYaz/4ixsEH+Qu3wLuTPXeTC9b4WzZdw
         OyarLpRAa3XKZb+R+TAor6A61olaeZh2UXVhy0xSj6vFuSd4XCzHtXmyAusPiEU7oomY
         oH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958335; x=1795563135;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IwyFV8Hw/ru2qtr97qIXUT1MpN5o8lRiFBBmhPx1J4=;
        b=FGMkGX1dcPK5Joq8APMCiyfY66/5lTA9gOowLwDBjabLrV9r3qr+ITIit8LXhsfjtA
         SuShdrf3xz7Q15H4BztPpN62DNKyJM6svfvxKfinoNKf+gz3uQ/tpGGb2IGv/qLvWAY2
         Y+p9gAayHj2Q1gnUetW2ly94fb4HE/juV4siegqegG3PUxK3UG+QytrQT2Rvpl/t/F65
         W5PZooE8PIs5ypRo24AvF06mTbdEisGHOx0ymYb9DPuE5WR46gBQdIvNMrlSTwOBL0EO
         bL0YzkxJcONSl8BZz3Qza5epfosEevGeBhQOGX7jblowyMsMv/j6vTigvcZrF6UBa32Z
         9a3w==
X-Forwarded-Encrypted: i=1; AL+hErFkWmfIcGZfr4cRojN0+l+/iSEvRScbLalzLje8QsQ+XkcEL6Jiw6VRYpqEGGSQAhd9LTssDTZrvqzgDVI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5Ef6J+otmQEFy60FxIalqpze8LUNEgqQY8og1ul9Liiz2iTpG
	TkYNV16nDddWqGPTJyespXQLQnjWCIC8rZEz0flNTnMZQwzsZp1wGya2TMPwReMQgFb7CA1qvI5
	DUL5IUnt/qg==
X-Received: from dybtv21.prod.google.com ([2002:a05:7300:f495:b0:381:935d:2548])
 (user=dhavale job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:42d0:b0:381:fe77:7d31
 with SMTP id 5a478bee46e88-38281020598mr858985eec.12.1794958334280; Tue, 17
 Nov 2026 15:32:14 -0800 (PST)
Date: Tue, 17 Nov 2026 15:32:06 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117233208.72628-1-dhavale@google.com>
Subject: [PATCH v2] ext4: fix race between inline dir conversion and folio read
From: Sandeep Dhavale <dhavale@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: kernel-team@android.com, liuderong2022@gmail.com, 
	Sandeep Dhavale <dhavale@google.com>, stable@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	liuderong <liuderong@xiaomi.com>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 90f097b1403f ("ext4: refactor the inline directory conversion and
new directory codepaths") moved directory block initialization in
ext4_convert_inline_data_nolock() into ext4_init_dirblock(), unlocking
data_bh before setting BH_Uptodate.

When block size is smaller than PAGE_SIZE, multiple buffer heads share a
single block device folio. If a concurrent read on that folio runs via
block_read_full_folio() while data_bh is unlocked and not uptodate, it
locks data_bh and submits a disk read for the uninitialized block.

Because ext4_init_dirblock() initializes bh->b_data without holding the
buffer lock, the disk read races with and overwrites the initialized
directory entries and checksum tail, corrupting the directory block:

  EXT4-fs warning: ext4_dirblock_csum_verify:375: inode #...:
    No space for directory leaf checksum. Please run e2fsck -D.
  EXT4-fs error: __ext4_find_entry:1626: inode #...:
    checksumming directory block 0

This issue was reported by an Android partner encountering kernel panics
in ext4_dirblock_csum_verify() ("No space for directory leaf checksum")
on 16KB page size kernels mounting a 4KB block size ext4 filesystem.

To fix this, mark data_bh uptodate before unlocking it in
ext4_convert_inline_data_nolock(), just like the regular file path
does. Additionally, hold lock_buffer(bh) in ext4_init_dirblock() while
populating the directory entries and checksum tail so any buffer
modifications are properly serialized.

Fixes: 90f097b1403f ("ext4: refactor the inline directory conversion and new directory codepaths")
Cc: stable@vger.kernel.org
Assisted-by: Antigravity:gemini-3.8-flash
Signed-off-by: Sandeep Dhavale <dhavale@google.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Tested-by: liuderong <liuderong@xiaomi.com>
---
Changes in v2:
- Rebased onto ext4-tree/dev (7.4-rc2).
- Moved the real-world impact paragraph into the commit message per Jan's
  review comment.
- Collected Reviewed-by from Jan Kara and Tested-by from liuderong.

Link to v1: https://lore.kernel.org/all/20260918025416.604297-1-dhavale@google.com/

 fs/ext4/inline.c | 1 +
 fs/ext4/namei.c  | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index ceee69a66482..0aa14cee3310 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -1167,6 +1167,7 @@ static int ext4_convert_inline_data_nolock(handle_t *handle,
 		error = ext4_handle_dirty_metadata(handle,
 						   inode, data_bh);
 	} else {
+		set_buffer_uptodate(data_bh);
 		unlock_buffer(data_bh);
 		inode->i_size = inode->i_sb->s_blocksize;
 		i_size_write(inode, inode->i_sb->s_blocksize);
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 354fc2d22df1..69580e54455f 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2933,6 +2933,7 @@ int ext4_init_dirblock(handle_t *handle, struct inode *inode,
 	if (ext4_has_feature_metadata_csum(inode->i_sb))
 		csum_size = sizeof(struct ext4_dir_entry_tail);
 
+	lock_buffer(bh);
 	de->inode = cpu_to_le32(inode->i_ino);
 	de->name_len = 1;
 	de->rec_len = ext4_rec_len_to_disk(ext4_dir_rec_len(de->name_len, NULL),
@@ -2965,6 +2966,7 @@ int ext4_init_dirblock(handle_t *handle, struct inode *inode,
 	BUFFER_TRACE(dir_block, "call ext4_handle_dirty_metadata");
 	set_buffer_uptodate(bh);
 	set_buffer_verified(bh);
+	unlock_buffer(bh);
 	return ext4_handle_dirty_dirblock(handle, inode, bh);
 }
 
-- 
2.56.1.703.gf848ed807c-goog

