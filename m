Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992866;
	b=5l7ku5sDCoOOyj8nqsaUDyZvaKua5F+n2syY42+q4fCEcv3DQndhRt8aMoBl/1pPpsgY
	 o/zpFvu2L0uQiMTCxyRB58c0eoNOV9RO1jOiJyaS6aB20YTBCUGA03Ld1ilMJ+h0bBpO1
	 4ApQcMjvyfGlU40zfYs7bCfByyvnhGZQn7SUT5frHzu9dihucTpHpBDjujhhHeyz6TfOX
	 eP5BBRVcHSarnqxlFBGu2nRoEMwe7B/0vmRzBVH4Wlol5qTh1hgdJswgc6ebfGxXGrSFx
	 19I5ta07M5UZDFxqqkLiebww7DO/g52NtytP0RqbG/jlEvc4vWU3Gwe8pTHQcKBTCqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992866;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=tUSt+Or2r7+QxACNRfZ0CnyJuH2td+R1KguWyivkmfA=;
	b=jO4w/RX8aRktQNNfOzPk3+5Q1at0KlvKCXr8+d7QeBxK2JhPu0M8Hx6UZqc6C1aeHr9n
	 TmAazVAMUO1y7trPHfp2ID3+qIVx4xGgCpO/eZQ1ga55ISdE/2P7e/nPrfG2YcyQ5iW4e
	 e45qsNGUfpGXI8XTjqAfepo4lqcY+EpkGOG5KHKCRNzpUTE8fUyWgMmz5Tm1XeUsNoSIf
	 6d0lrjbXRbDjGkH+HmYAc3Cg2wNYWKztK+AJs9wFFOBmgpUPSz6vSxdcV9cYiMlVK8/5T
	 Gh/q/CjrO4KTurvsSURTmAudftGKhGezTT79OE3wzKguSMtRjHYKcbZQ/rJw+GFiN3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="VnPVcS/p";
	arc=none smtp.remote-ip=220.197.31.3
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB9B606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DB9B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=VnPVcS/p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=tU
	St+Or2r7+QxACNRfZ0CnyJuH2td+R1KguWyivkmfA=; b=VnPVcS/pNoVhWZ0slb
	FHn6pQcC0vsCu3mKDDit7OarV9wtrxWDFYpUU5+tsu+4KY+bmQxrK18lQ2M23Cjj
	Cjqv9a0t/8k9SkTWw5mE2cDnfa1p0N9U7OrZ2UL83e5ltP6/rpLwGrDbGk6iDp/+
	ClzaZT7gF0fn2eHucS9HOU3mg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDn7yTNav1qnmzWIQ--.7895S9;
	Wed, 18 Nov 2026 17:07:29 +0800 (CST)
From: Xuewen Wang <wangxuewen_ky@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com,
	liubaolin12138@163.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuewen Wang <wangxuewen@kylinos.cn>,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v6 07/37] ntfs: retain directory iteration state after errors
Date: Wed, 18 Nov 2026 17:06:31 +0800
Message-Id: <20261118090701.1858849-8-wangxuewen_ky@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118090701.1858849-1-wangxuewen_ky@163.com>
References: <20261118090701.1858849-1-wangxuewen_ky@163.com>
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
X-CM-TRANSID:_____wDn7yTNav1qnmzWIQ--.7895S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4UCryxZryxGryxuF4fAFb_yoW5Jr13pF
	ZxWas8Kay8Jr17GFsayFs0vF1fuwn7KFWUJFyUGw1fKw1ftw1YgFyFgr1Y9Fy8tFZ5Cr13
	Xa1ktFWUW3Z8ZrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UczVbUUUUU=
X-CM-SenderInfo: pzdqw5pxhzv0xbn1qiywtou0bp/xtbCzhLo0Wr9atLzSwAA3y

From: Xuewen Wang <wangxuewen@kylinos.cn>

ntfs_readdir() marks the directory exhausted after an error and returns
success. A retry can consequently miss entries. A saved resume key that
was deleted is also treated as a lookup failure.

Return traversal errors without setting the end-of-iteration flag. Resume
from the insertion position when the saved key is gone. Advance the saved
offset after consuming an entry and keep an unconsumed key for retries.

Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
---
Changes in v6:
Extract directory retry-state handling from v5 patch 20.

Validation:
- Compiled and linked the NTFS module object with W=1 at this stage.
- No undefined references to ntfs_report_* or fserror_report_*.

 fs/ntfs/dir.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
index a93f3566603b..ed1d4188e947 100644
--- a/fs/ntfs/dir.c
+++ b/fs/ntfs/dir.c
@@ -819,7 +819,9 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 		err = ntfs_index_lookup(private->key,
 					le16_to_cpu(private->key_length),
 					ictx);
-		if (!err) {
+		if (!err || err == -ENOENT) {
+			/* A deleted resume key leaves the next entry in the context. */
+			err = 0;
 			next = ictx->entry;
 			/*
 			 * Update ie_pos with private->curr_pos
@@ -833,6 +835,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 					goto out;
 			}
 
+			if (next->flags & INDEX_ENTRY_END)
+				goto next_entry;
 			goto nextdir;
 		} else {
 			goto out;
@@ -915,6 +919,7 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 		goto nextdir;
 
 	while (1) {
+next_entry:
 		next = ntfs_index_next(next, ictx);
 		if (IS_ERR(next)) {
 			err = PTR_ERR(next);
@@ -1003,7 +1008,11 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 			private->key_length = next->key_length;
 			break;
 		}
+		/* The saved key is consumed; retry from the next offset. */
+		kfree(private->key);
+		private->key = NULL;
 		ie_pos += le16_to_cpu(next->length);
+		actor->pos = ie_pos;
 	}
 
 	if (!err)
@@ -1029,9 +1038,8 @@ static int ntfs_readdir(struct file *file, struct dir_context *actor)
 	if (err) {
 		if (private) {
 			private->curr_pos = actor->pos;
-			private->end_in_iterate = true;
+			private->end_in_iterate = false;
 		}
-		err = 0;
 	}
 	ntfs_index_ctx_put(ictx);
 	kfree(name);
-- 
2.51.0

