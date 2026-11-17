Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948016;
	b=MrksgvApbWT/w3hJwB7N0EuaHdyAvwAomBBi0JwNcolaa0CmPrvmG5O8059m4idn4wIu
	 2x9g4sP4+TUAuAG1979ddNNj5XldctWr4hT5uN8sgbMDSi9MfCk45xITzrk52zGGoYlZp
	 QBinJ4ILzl36lBnaumlp1WZ/DQlqYYp+vKmLsYTWM/X1DF8/u6fZDeEPx22ixZeqJsUh4
	 fBRWxmeUwqKMjreWzlos3hVNRipmaHfgbQo9mg5Uzk9XemwBpZXZjbXQODE1Wkm5ltB30
	 4MIlLm3hiTjJAuuljVx+Xr9S5JKZU9dyMGLTlq+vj9rAIOjjQHyIZfRKybJ/EBx4QAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Kq3gYAeKi+2MlDRtqxzklMdRJ3gSx3YIPGqwyIvmiBI=;
	b=GHQOHDRYoAF+YEXdOyD6wn9FaH8nLldvNDGWTSJIVhkNdPGCyg4GJgMGpHH9cjG4G2TA
	 lXWX9dgaCaB1iwEl/vw9/poCN7+T439P3qx0a8wOmMc+ZPKjnPjOpKb1IBidBvImHm3pf
	 c85s6SY/KYSV3Qo3xGSYv640H+U4C5abdQEbq4l5W6nGrRpjAxE23Ej1VhyxfBfWOIYf4
	 vx6B9cweCFGVx5DsOlp639tlr31R50CNp80+NIF6lFpN/JWq9bVXvu5M4pYJt9emOgMxU
	 XTJJ32oZn1zeYhaYHEEUyMG2CUvn7WcGFaVGkx7jFRp0wtI81cYveqq2DL0u55jf14Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bTiU/sjM";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA8E606A33F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FA8E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTiU/sjM
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so161731a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948015; x=1795552815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kq3gYAeKi+2MlDRtqxzklMdRJ3gSx3YIPGqwyIvmiBI=;
        b=bTiU/sjMPtCymeMImE84FMoNfMicqjV+11YzX2hrUSPBdg/rtOOwEHhiMm9AuJAzpr
         qBgmWwdCgZo2DLamrTQx2qvG2Xi+U4Ckkq5RXKEq7eyZRUUTILgLHZVHq82ffb8CuRGA
         jM/QtyyPc6yZSgCoQVAelP7kfcOtoiJ6g23l47m6Lz0g1h4GXzywadYkWt8xOragMtaK
         fwD//E0B/j5KjQDuHscdkJiVDpESTjmjnW/FXz3oVsgwc6Uu6/RzYxC2w22XOBze3D3c
         m5ReXZ4/FBI8zOdMvr4V7e9+NSDcBiSyP2jpMKjLomuWkzuLUeE7ANZldH96U2p78e1E
         8R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948015; x=1795552815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kq3gYAeKi+2MlDRtqxzklMdRJ3gSx3YIPGqwyIvmiBI=;
        b=Tr5LwWf7Y+st5LRjWdOxFS/DWFbij7OjDO7lcUj86pV+IWe+YxDAUTcSuomcDg81Az
         PjOi8Cw4GURbRZC8O+agw1ejgoFQwpFXBpPMbf2W1wlXcFe+0iIRnk0O5hDw26ECezYk
         /PbHhusyWIvLGwHPmzTae9igx4k0SP1ak60TSxDmiCngyhi9J/M3tgeXlP7xVFgWUZjF
         JbaZ5lOfDd3DkXPLmPWHiDydXvw8ajp+zElg6bIFUTUvy2/bNJOjl49fDcjC5HuIPJAP
         G7f6cnirv1HGgi1I2PhRLB+GPPngl3KZ3RIjXpC1jU5mkIYPPsH3fbra3iKVRydNO68/
         Z1FA==
X-Gm-Message-State: APuU4Z/7lAPMyAqbJeeNmbyaZuzQUEj2buNlTyWB9DnB7hb/j33gvoju
	45LJ2oNXa0hIguw7cQ2IFuaXT35f+1Co1qCDkzj2U6Z7WmDtf/rIUoeuEhdjzw==
X-Gm-Gg: AZFdTZdFMt6W0ibl5qK5yGOyJYjGt0UQR4H+xdcWDIj46u7J7uZwoR7vV0fuE3nJ9nI
	4e92hpMKoV1QoVNMiT6EaZR98Hv//s9tAKt7UJUbfougx17Vs4UI/rhUZXtER7TU7ZoDq1Xer2V
	PZhMdaWhpscCQrhczRRCLSBAyGCWT8rX1DCL03rzjY4sDEis90Vfdysjdt/qVkNBw6Bqz/+WFDq
	Z2jezMHvRilrgBDyzhi6JyZKbN4pBO2dC8zVDvBkPcmDxvuMTsso6ED8d6C1Ev6BvM1s6TENen+
	w78h716y7f45GQxNxptIjU5cn/ncxvsmBoEPnmFU6x4IhN1hrg2Hp3DhxngTncP/1rWIojo7E84
	tWtnXvRvecn9QXadYZz1p4141lGI20igo+Vxo25s3g66eqOA0XOzJ7rtxjkIa3R1gWFImxc9bk5
	jAWrHO32v52HGDhkpk4VjjAMQuwGAxb77APr1Tr8KKqoZhdSAfQaXpfoT8V+37NpwRM3X4O6XNK
	AunN7HZoLi+naz8SCCLskgfcuG8xDvgvemve7yMtQ1V/Ez4htEzMzY4keoBSNoFwam+Ak0f/dF4
	rb6w/Rif20SInQ8pU4rV380pxYFYTPXA3TtsyRBVfbKYedtEBhJlE9becPmrJH+EgPRHMMhPl6J
	M6/boWcGdMSl2fufmX5suWWq/gIYXcb0UndQ7qpx/F8Hkw4E=
X-Received: by 2002:a17:90b:5390:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3b3d0759d78mr560936a91.17.1794948015486;
        Tue, 17 Nov 2026 12:40:15 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1acde45sm547366a91.11.2026.11.17.12.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:40:14 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs-tools: fix calloc() calls with transposed arguments
Date: Tue, 17 Nov 2026 12:40:10 -0800
Message-ID: <20261117204010.1742691-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
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

From: Daeho Jeong <daehojeong@google.com>

GCC 14 and later warn about a calloc() call that has sizeof() in the
first argument and not in the second one, and the CI builds with
-Wextra -Werror:

  libf2fs.c: In function 'utf8_to_utf16':
  libf2fs.c:127:47: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
    127 |         uint16_t *volume_name = calloc(sizeof(uint16_t), MAX_VOLUME_NAME);
        |                                               ^~~~~~~~
  libf2fs.c:127:47: note: earlier argument should specify number of elements, later size of each element

Pass the number of elements first and the size of an element second in
all the calls that the compiler reports. No functional change.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c        | 8 ++++----
 fsck/mount.c       | 6 +++---
 lib/libf2fs.c      | 4 ++--
 mkfs/f2fs_format.c | 4 ++--
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index a56c16b..56d4744 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -95,7 +95,7 @@ static int add_into_hard_link_list(struct f2fs_sb_info *sbi,
 	struct f2fs_fsck *fsck = F2FS_FSCK(sbi);
 	struct hard_link_node *node = NULL, *tmp = NULL, *prev = NULL;
 
-	node = calloc(sizeof(struct hard_link_node), 1);
+	node = calloc(1, sizeof(struct hard_link_node));
 	ASSERT(node != NULL);
 
 	node->nid = nid;
@@ -2119,7 +2119,7 @@ int fsck_chk_inline_dentries(struct f2fs_sb_info *sbi,
 	make_dentry_ptr(&d, node_blk, inline_dentry, 2);
 
 	fsck->dentry_depth++;
-	new_dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	new_dentry = calloc(1, sizeof(struct f2fs_dentry));
 	ASSERT(new_dentry != NULL);
 
 	new_dentry->depth = fsck->dentry_depth;
@@ -2164,7 +2164,7 @@ int fsck_chk_dentry_blk(struct f2fs_sb_info *sbi, int casefolded, u32 blk_addr,
 	ASSERT(ret >= 0);
 
 	fsck->dentry_depth++;
-	new_dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	new_dentry = calloc(1, sizeof(struct f2fs_dentry));
 	ASSERT(new_dentry != NULL);
 	new_dentry->depth = fsck->dentry_depth;
 	memcpy(new_dentry->name, child->p_name, F2FS_NAME_LEN);
@@ -2637,7 +2637,7 @@ void fsck_init(struct f2fs_sb_info *sbi)
 	ASSERT(tree_mark_size != 0);
 	tree_mark = calloc(tree_mark_size, 1);
 	ASSERT(tree_mark != NULL);
-	fsck->dentry = calloc(sizeof(struct f2fs_dentry), 1);
+	fsck->dentry = calloc(1, sizeof(struct f2fs_dentry));
 	ASSERT(fsck->dentry != NULL);
 	memcpy(fsck->dentry->name, "/", 1);
 	fsck->dentry_end = fsck->dentry;
diff --git a/fsck/mount.c b/fsck/mount.c
index 98d797e..f4d1363 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3587,8 +3587,8 @@ void build_nat_area_bitmap(struct f2fs_sb_info *sbi)
 	fsck->nat_area_bitmap = calloc(fsck->nat_area_bitmap_sz, 1);
 	ASSERT(fsck->nat_area_bitmap);
 
-	fsck->entries = calloc(sizeof(struct f2fs_nat_entry),
-					fsck->nr_nat_entries);
+	fsck->entries = calloc(fsck->nr_nat_entries,
+					sizeof(struct f2fs_nat_entry));
 	ASSERT(fsck->entries);
 
 	for (block_off = 0; block_off < nr_nat_blks; block_off++) {
@@ -3763,7 +3763,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct list_head *head,
 {
 	struct fsync_inode_entry *entry;
 
-	entry = calloc(sizeof(struct fsync_inode_entry), 1);
+	entry = calloc(1, sizeof(struct fsync_inode_entry));
 	if (!entry)
 		return NULL;
 	entry->ino = ino;
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index b23d9c7..307cfcb 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -124,7 +124,7 @@ int utf8_to_utf16(char *output, const char *input, size_t outsize,
 	const char *inp = input;
 	uint16_t *outp;
 	wchar_t wc;
-	uint16_t *volume_name = calloc(sizeof(uint16_t), MAX_VOLUME_NAME);
+	uint16_t *volume_name = calloc(MAX_VOLUME_NAME, sizeof(uint16_t));
 
 	if (!volume_name)
 		return -ENOMEM;
@@ -219,7 +219,7 @@ int utf16_to_utf8(char *output, const char *input, size_t outsize,
 	char *outp = output;
 	wchar_t wc;
 	uint16_t *inp;
-	uint16_t *volume_name = calloc(sizeof(uint16_t), MAX_VOLUME_NAME);
+	uint16_t *volume_name = calloc(MAX_VOLUME_NAME, sizeof(uint16_t));
 
 	if (!volume_name)
 		return -ENOMEM;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 33d3da9..d4a02ee 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -757,7 +757,7 @@ static int f2fs_init_sit_area(void)
 	blk_size = 1 << get_sb(log_blocksize);
 	seg_size = (1 << get_sb(log_blocks_per_seg)) * blk_size;
 
-	zero_buf = calloc(sizeof(uint8_t), seg_size);
+	zero_buf = calloc(seg_size, sizeof(uint8_t));
 	if(zero_buf == NULL) {
 		MSG(1, "\tError: Calloc Failed for sit_zero_buf!!!\n");
 		return -1;
@@ -791,7 +791,7 @@ static int f2fs_init_nat_area(void)
 	blk_size = 1 << get_sb(log_blocksize);
 	seg_size = (1 << get_sb(log_blocks_per_seg)) * blk_size;
 
-	nat_buf = calloc(sizeof(uint8_t), seg_size);
+	nat_buf = calloc(seg_size, sizeof(uint8_t));
 	if (nat_buf == NULL) {
 		MSG(1, "\tError: Calloc Failed for nat_zero_blk!!!\n");
 		return -1;
-- 
2.56.1.703.gf848ed807c-goog

