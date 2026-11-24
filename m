Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795552766;
	b=eV63iG9tpdE5bVLY8s8Fh5tXBHr1rlukNFf1eXUYSxfcVSiK2LDqjC6ZFV7H9LmkF0aw
	 /0l9dWtvimCqha5mBghSN13/AFE9+Lo/eRTN5gTNj8h+IurOxHBgkDB5hJll6ZB0gv9xH
	 Md5732dmXvlk3E9ObSeaSTFmLUS1JZv+zYllqriyjPagcqnIbQz8j3qEgyjEiZyBS2Yix
	 C0d1eE2hmOrundH/1skiCQbOJ4ine5qn3xIRPkfY7JiAZdb/820Iq2cEqSOw4CfuY2aeA
	 vIo5ILY3itKPzswtGCVZjLxGEx1N0eLJ6xYBUnUYxjstEZrKwGUyAyQzoY5cgY4jjNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552766;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=wNon3V3i5suR375LkiIjfDkAHeiCg6kwpomG69wuTIc=;
	b=Fua2qX+OmXAmktgQoWIqQTD8yCK1trePctSYWOtjJC2SzQHLHqZXLAk6sqIlW0WTIGOZ
	 rZAh+mslzd9Tt+oX7cOlc2bw/eujp1M4+pt8ebjj37SKDDmlmYypM6bsTW7gl2N62hOz9
	 QVEHofjFtka0c2e4ob/Z3fpTACjzoQsWy78zCF/3LIWlMwUVJvIZZR/szes6DljTU8eNn
	 erZVfziig3itu5WkKaT1yGnshcAPTSqKNAu8GfYqYCiDMAH/3rMLRKlKMnAIqnmbqa0OU
	 OfGBMKY5KqHxh+8Htmy+7WX8moN1NhurQjoRBsmCbFtCLupEkIA41hvlplKQQKswjWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSCpf5MH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8EF606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eSCpf5MH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795552766;
	b=KQ6YywSIeHUq53A+gba3nQ76NXKg51vHcfY8NMBsREIvLDa/ZdqeEYSgFVn0MyrxOo7N
	 tkvc9t9BfLtqFrfpp0G1duGj8UYL0lSPm4Xd8hVKMKFEeeKn5gOqWtvgToMZ2biEvTQbZ
	 iWkyyp0w06pcV4XVxurOLdWm5NPTdjZZYkED8RSNtDQsLVdSNbmVsgkIIkNpkkL76QhBB
	 WVr2toRLQ1JSV4ixwjwIUDozWoU7zdp7Bj0tj/iIpLFeufPXQzKOPawJJdpLPIwASfBGj
	 Hl4sRhgYXXXz6xSa/w/E90Lx8ejzBS0A3SnY/WccuZQS63CjGfoscMEWf8RVmx8yvdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795552766;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=wNon3V3i5suR375LkiIjfDkAHeiCg6kwpomG69wuTIc=;
	b=HXFNmWpjGMHP/cJj0anAX7W5xtKVN6w+KD+gLfXgToTelkXKGcCvqcty0ev3uc+gKBTe
	 plR2EcJ5vz5zRHDqLx8XqGzTeZC9otD7wudpSyrZnL6u+VYqpEGoVD3hSC+776tj0+JIX
	 4/2MptYIaysxGunYofBbnO0yMfDpFFGQ5JHAGOrFq8kgBrtKQVk+YM+3qdiLM7g6RtJJQ
	 1yTucWXKff4zvR5S9CXiOAA9m1bElEi/6Sg/uBvvfxNi+ADEg2mawrbZqdml6t2epPnK3
	 fppRgwbkMTeI4pbq/MFQQt/HN/7+qDHSLmxBuUfu7ZBGKC4XBvRizgIdHjBR4vAIYyA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C16431F000CF;
	Tue, 24 Nov 2026 20:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795552766;
	bh=wNon3V3i5suR375LkiIjfDkAHeiCg6kwpomG69wuTIc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=eSCpf5MHRhstMdySew8z+jqj+8DkTvVHso9/HOIWlX0nNl5/dil+CqUcuGwfa/qRY
	 B0RbLqElAKKjy1SRuhgDDM73rdwjj0I0hN4HMllX565c+I2CUnn1OrVzHw/xve/KiC
	 trEZOcfUvig0Wms6kVeoFE1EK9QrinmurodJdoMlz026ut7lwgIh0bRYAVVWQTH+aP
	 7LlGeICroqC692mxYtJypGp/acS6V2Y/GIuYCX3sve6MTXwzyQwUwFpl692h8gZdvi
	 azt4ruamB1YTWSIa8i/CEza71E99fqd92mQJd2NfpHAIfw2NeK7Tb6PM7EnGNjOzb5
	 vXCcg8mnlWhmg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2CE4F4CB8C;
	Tue, 24 Nov 2026 20:39:15 +0000 (UTC)
From: Devin Armstrong via B4 Relay <devnull+darmstrong.tantalus.com@kernel.org>
Date: Tue, 24 Nov 2026 13:39:03 -0700
Subject: [PATCH] ubifs: Bound lpt_gc() retries when LPT GC makes no
 progress
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-lpt-gc-send-v1-1-eb975487c6d5@tantalus.com>
X-B4-Tracking: v=1; b=H4sIAOb1BWsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3ZyCEt30ZN3i1LwUXePURIO0VGMjs1RzAyWgjoKi1LTMCrBp0bG
 1tQAIzFwvXQAAAA==
To: Richard Weinberger <richard@nod.at>, 
 Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 jpark@tantalus.com, Devin Armstrong <darmstrong@tantalus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795552754; l=5288;
 i=darmstrong@tantalus.com; s=20261124; h=from:subject:message-id;
 bh=/APDOkmanJBs/tnInr58Zk1KaxVRxZjJZmeUMLvn5JQ=;
 b=nCJvdjKmd/7IGz0Eyo0KaP6OdxT/90Rp5R95HUB8I6nuQUAlH0cuHQEhjkZbONRbVRinyvg6B
 Et9fxBPSAutDhX7tXpAt1/DmqC827XJX/Fx1UdnTi4bNvJ/T0K2wBZt
X-Developer-Key: i=darmstrong@tantalus.com; a=ed25519;
 pk=jD9P/SgqHx/uS8fXsiq6ZAlPE3b8spE6dAOF7r+On3Y=
X-Endpoint-Received: by B4 Relay for darmstrong@tantalus.com/20261124 with
 auth_id=1630
X-Original-From: Devin Armstrong <darmstrong@tantalus.com>
Reply-To: darmstrong@tantalus.com
Content-Transfer-Encoding: 7bit

From: Devin Armstrong <darmstrong@tantalus.com>

ubifs_lpt_start_commit() and ubifs_lpt_post_commit() call lpt_gc() in a
"while (need_write_all(c))" loop. If lpt_gc_lnum() cannot dirty every
node of the LEB it was given, that LEB's free + dirty space never
reaches leb_size, need_write_all() keeps returning 1, lpt_gc() keeps
selecting the same LEB, and the loop never ends.

One way to get there is the LPT scanning problem reported in the link
below: the 0xff padding at the end of an LPT commit followed by the
first bytes of the next commit's lsave node can form a valid-looking
node (the 16-bit CRC matches by chance). When this happens, a read-write
mount or remount spins in the kernel at 100% CPU and can't be killed.
Read-only mounts never commit, so they are not affected.

Track the LEB and its dirty space selected by lpt_gc() in the caller's
loop. If the same LEB is selected UBIFS_LPT_GC_MAX_RETRIES times in a
row with unchanged dirty space, return -EUCLEAN. Any pass that makes
progress changes the dirty space and restarts the count, so the normal
GC retry cycle is unaffected.

The error makes the commit fail, which puts UBIFS in read-only mode, so
the mount or remount fails with an error instead of hanging. This does
not repair the LPT, it only turns an endless loop into a failure.

Link: https://lore.kernel.org/linux-mtd/97ca7fe4-4ad4-edd1-e97a-1d540aeabe2d@huawei.com/

Signed-off-by: Devin Armstrong <darmstrong@tantalus.com>
---
Tested on a v7.0 based kernel (out-of-tree ubifs.ko built with this patch).
Remounting a volume with the linked issue as read-write now fails
immediately with -EUCLEAN and UBIFS goes read-only, instead of spinning 
in the kernel.

Also tested on a 4.19 based kernel on SPI NOR hardware with the same result.

On a healthy volume, 2 million commits of mixed xattr/utime workload
showed no change in behavior and no "LPT GC" errors.
---
 fs/ubifs/lpt_commit.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/fs/ubifs/lpt_commit.c b/fs/ubifs/lpt_commit.c
index f2cb214581..1e583f070c 100644
--- a/fs/ubifs/lpt_commit.c
+++ b/fs/ubifs/lpt_commit.c
@@ -1140,14 +1140,39 @@ static int lpt_gc_lnum(struct ubifs_info *c, int lnum)
 	return 0;
 }
 
+/*
+ * Maximum number of times in a row 'lpt_gc()' may select the same LPT LEB
+ * without its dirty space changing, before LPT GC is considered stuck.
+ */
+#define UBIFS_LPT_GC_MAX_RETRIES 10
+
+/**
+ * struct lpt_gc_leb_retry - state for detecting LPT GC that makes no progress.
+ * @lnum: LEB selected by the previous 'lpt_gc()' call (-1 if none)
+ * @dirty: dirty space of @lnum when it was selected
+ * @count: number of consecutive times @lnum was selected with @dirty unchanged
+ *
+ * The caller keeps this on its stack for the duration of its GC loop.
+ */
+struct lpt_gc_leb_retry {
+	int lnum;
+	int dirty;
+	int count;
+};
+
 /**
  * lpt_gc - LPT garbage collection.
  * @c: UBIFS file-system description object
+ * @retry: LPT GC progress tracking, see 'struct lpt_gc_leb_retry'
  *
  * Select a LPT LEB for LPT garbage collection and call 'lpt_gc_lnum()'.
+ * If the same LEB keeps being selected and its dirty space does not change,
+ * the LPT is damaged and collecting it again cannot help, so give up instead
+ * of looping forever.
+ *
  * Returns %0 on success and a negative error code on failure.
  */
-static int lpt_gc(struct ubifs_info *c)
+static int lpt_gc(struct ubifs_info *c, struct lpt_gc_leb_retry *retry)
 {
 	int i, lnum = -1, dirty = 0;
 
@@ -1165,6 +1190,19 @@ static int lpt_gc(struct ubifs_info *c)
 	mutex_unlock(&c->lp_mutex);
 	if (lnum == -1)
 		return -ENOSPC;
+
+	if (lnum == retry->lnum && dirty == retry->dirty) {
+		if (++retry->count >= UBIFS_LPT_GC_MAX_RETRIES) {
+			ubifs_err(c, "LPT GC of LEB %d made no progress after %d attempts",
+				  lnum, retry->count);
+			return -EUCLEAN;
+		}
+	} else {
+		retry->count = 0;
+	}
+	retry->lnum = lnum;
+	retry->dirty = dirty;
+
 	return lpt_gc_lnum(c, lnum);
 }
 
@@ -1193,6 +1231,8 @@ int ubifs_lpt_start_commit(struct ubifs_info *c)
 		goto out;
 
 	if (c->check_lpt_free) {
+		struct lpt_gc_leb_retry retry = { .lnum = -1 };
+
 		/*
 		 * We ensure there is enough free space in
 		 * ubifs_lpt_post_commit() by marking nodes dirty. That
@@ -1202,7 +1242,7 @@ int ubifs_lpt_start_commit(struct ubifs_info *c)
 		c->check_lpt_free = 0;
 		while (need_write_all(c)) {
 			mutex_unlock(&c->lp_mutex);
-			err = lpt_gc(c);
+			err = lpt_gc(c, &retry);
 			if (err)
 				return err;
 			mutex_lock(&c->lp_mutex);
@@ -1315,14 +1355,17 @@ int ubifs_lpt_post_commit(struct ubifs_info *c)
 	err = lpt_tgc_end(c);
 	if (err)
 		goto out;
-	if (c->big_lpt)
+	if (c->big_lpt) {
+		struct lpt_gc_leb_retry retry = { .lnum = -1 };
+
 		while (need_write_all(c)) {
 			mutex_unlock(&c->lp_mutex);
-			err = lpt_gc(c);
+			err = lpt_gc(c, &retry);
 			if (err)
 				return err;
 			mutex_lock(&c->lp_mutex);
 		}
+	}
 out:
 	mutex_unlock(&c->lp_mutex);
 	return err;

---
base-commit: a5e0055eac837a1168c781653943d4a0d9920af3
change-id: 20261124-lpt-gc-send-3ea0fe326e70

Best regards,
-- 
Devin Armstrong <darmstrong@tantalus.com>


