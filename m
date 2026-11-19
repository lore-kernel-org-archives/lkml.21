Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120956;
	b=uM82psgbkZmruNQwudJI+MF/8EFtD9T4nedefW2W7Uf6m6U6de15QA9le5Y332o6bsyw
	 KXas/F4ypajzRF+mTwkgEZHS/2jnR1gI888FcAt6nGwkAUjfqevyZAxE7PBJ7M1Kd4Rw1
	 s1vG6Ff7elLF90NQM6VDXzmUxuJo0R7/cSGG+48vPWFYVAzWMIClpCm292YGiXxYOwk6S
	 Jq7t4xcoMZUq2z8hI+PHAytLICzeMeSZT3fimCc2jfDJ6zPcg2QkjLpB386qF8AcqusrK
	 1JCs4+vMMSR2FIJu16nyQNMoST0BCVB8DYWO7YudMLER+lHhUcgW1/fuG/qV5EuhUTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zuAMJz9hO/rd2dsRhDkrP8w09SehngbI7g09vJ6xniI=;
	b=4LN8Q35r7FQLc+40lOC16AGV0KFO92/g/q0PKS/Ouo3xQq0IKB0kbv2IuJoeSBYuNOlz
	 PxZXPXKl+mvlbbSQ0fHEkrveqwdUi/UrKC1+5EmjwF9GCt5ve89WSGibyKMzHbp8T/JZ8
	 okIILgaqcG4GFtgADMtiBR9EvpEms0e+rcpUrOciatQ1C/L3QJuv4xlgC8V9S+lmyLjfn
	 O3Qtqm1WSiBETRTM74f5IvMabIDRrCXuzuzDhL8R0ieOCU6qfdyIzMheAFan+tVxLpE05
	 6Ui0Al6X+wyGZzmH9HH9AFxf4nsbdJjCV9NKoZzi5Td0tcM0GxbmRN/XqlELbZzAAWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3wyXhuL;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E1D606B761
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7E1D606B761
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S3wyXhuL
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso120863a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795120955; x=1795725755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zuAMJz9hO/rd2dsRhDkrP8w09SehngbI7g09vJ6xniI=;
        b=S3wyXhuLJGkIkIwcWXBWZ/20ruMliHuJXLh58sCHYu0YNOOMBVW+T67QT9ncJV81CO
         E3CQYVRWpEHZMU+yBC6BCFzDK9FnMVeUn4pkEomFXJN5355bbQVpS65fHUjFSEFNvI31
         tEqlhSEIymwg2XODGsWtPPQ+HTEfPAJvGBw1FyUAfjQCdQC34vQL1hyapiOntXXh2t8p
         vthPLT3xVwC6oUtPITlmKKljNVn1e9KL3hWiKRr/7mALzjyQEJidbd4dTaI7lYQDw1y2
         shi7vMbea2s2ym4gDv36uq1zqW/4mMvQgBgjQ7qUa1anMw4R1zXYI9hx3ddgxwu2A6zA
         jy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120955; x=1795725755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuAMJz9hO/rd2dsRhDkrP8w09SehngbI7g09vJ6xniI=;
        b=XRP1rFjVpN8UM97nBQcZgS5Fy3/JumKrPhvyISofhZQFEksqscqPCLEKn5phRdRP+B
         x7p4D7ChQyybS8KkCx/ogPXbMPeINGFA19alTLpTyneJAoXb3wRGwLbwKflmrCPkecuI
         ZlHR1xCBvUUv35vj0kBBAkeqJO76EJ8OXfjpmmlQCmLxF4PG2QYMFGK//cZ40ls2+IDl
         nBNrizKBrd4jlHen1PBJnPi/speDzsLILL8jDho+hpYQnmAEzCEYrVCG6pnhIbIPRtdg
         uboNdBURJZ6wNd56SqIkv3culhTWLM2Fe9ewqpo8LrpzvS44UApVuruKte8z+U5hFgPh
         eHjw==
X-Gm-Message-State: APuU4Z/rGLR0PoH0CfUoh0xk/BpD/SnIV6q5Wht9OSFwFK1lyqm4EMCJ
	9ulYeNE60WK1C0BuSHZOSD44PuAyPQq5H/1RBEn7GhqlVNKcRccUzHzzQAROEw==
X-Gm-Gg: AZFdTZd7N7mx6Ga6IWe7Tis98SvSVifPVKmKkHASmNHPBQIYRU4/QH3PPKGDLGYVFai
	5MO/etS8uKBFV2DZC2JNDEsqhkeHnvaIsKkzavzZ/4YEveesYGUXEmJ98CewwgP+cw6XbEQSdqF
	jRMKXlWmtF4khA8U+EgLv5Qd41+CXW0Bzouloabpcad5IYfthjFYOjfIxJrB2H0Y6sc44AKuyt4
	ETeRAGhWxWegXKksDj9Hya6I9a4txtdivxdg/MAlBqyHy7YRbhvKiv/6ymPCXr6xAESIFZmNUiZ
	v/8cpN0+GQQkN7Wf1/6g7gBoqty4VMHoCBaEHQfy2pDqqEN5KRjPXb2yWtUAZIjBXcqFQej2x3R
	1OTAdAOaDp2GuMl78EWOiT0OQ+vb+5ythqdLDPxbc2XrmHBKQZLQmPdX7nvI1uPi6z4cWXOpv1n
	hnnkNDeuD8vhJLc3n2Jdyv7ksLpzP9IwOTD9ruVpbQfsXfqoHPLe30EwEFniuBc0zCQuJqXcmmn
	8TwhieNL9OA7Wob75rl8Q9EIypmWPinAXE1Nahx0mVe/WAmAICx8SlWjLxBprw7yucQXa7O1LVh
	pHAemBq/4nxmWeoeUVJouP4c1jCtVX8TNWw4VNB+rYhNiCdb8gR8Ibzd61uWxjzqT6kRRFk2hRL
	iCnIv02mWcy1cPB0ZYHyE2q9VPb8rEeaXLUXDpa1L7WmxuDwDuL+PtT5mGDAMwV6vwiI=
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b41c933eefmr515740a91.35.1795120954903;
        Thu, 19 Nov 2026 12:42:34 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad48786sm960738a91.9.2026.11.19.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:42:33 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: let f2fs_write_cache_pages() flush a partially written folio
Date: Thu, 19 Nov 2026 12:42:29 -0800
Message-ID: <20261119204229.3895622-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
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

f2fs_write_single_data_page() writes a multi-block folio block by block,
so it can fail after it put some of the blocks into the merged bio. It
does not report them on an error, and f2fs_write_raw_pages() does not
count a folio that failed, so f2fs_write_cache_pages() may not flush the
bio at the end and the folio stays under writeback. For that reason
f2fs_write_single_data_page() flushes the bio by itself on an error.

Report the submitted blocks on an error as well, and count them in
f2fs_write_raw_pages() before its error handling. Then
f2fs_write_cache_pages() flushes the bio as it does after a successful
write, which is also what f2fs_write_cache_folios() does, and the flush
in f2fs_write_single_data_page() can go.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/compress.c | 4 ++--
 fs/f2fs/data.c     | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index d0e989254ffe..b8001953be15 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1743,6 +1743,8 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 		ret = f2fs_write_single_data_page(folio, &submitted,
 						NULL, NULL, wbc, io_type,
 						compr_blocks, false);
+		/* Some blocks can be submitted before an error. */
+		*submitted_p += submitted;
 		if (ret) {
 			if (ret == 1) {
 				ret = 0;
@@ -1760,8 +1762,6 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
 			}
 			goto out;
 		}
-
-		*submitted_p += submitted;
 	}
 
 out:
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index cdc9e6e8633c..c0fc24d0b2ac 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4381,9 +4381,10 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
 		if (!compr_blocks)
 			f2fs_unlock_op(sbi, &lc);
 
-		/* The callers drop the submitted count on error. */
-		if (err && local_submitted)
-			f2fs_submit_merged_write_cond(sbi, NULL, folio);
+		/* Let the caller flush the blocks submitted before an error. */
+		if (err && submitted)
+			*submitted = DIV_ROUND_UP(local_submitted,
+						  F2FS_BLKS_PER_PAGE(sbi));
 
 		if (!err)
 			f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
-- 
2.56.1.750.gf70dc682cf-goog

