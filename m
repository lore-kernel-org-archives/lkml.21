Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795820423;
	b=kXXRtapxR3/X4Rcw28aia6JnlNMzgcitAEIt1s5HtCihXjEhpEoQTzsOEf/cfGWTKO8+
	 rh/6Y+SITs8ZZr37GLgevgdWEo9LyoNFIpgg/wqUWwtKnAHR+IcEz2yAdODHr3m6Ca0xr
	 AfAJERK7qTFC/53NFvCFvUtYOYF7N1JcYPNNxzkOG33bH3n4l4sumoHz/oMokNgA0TjTn
	 ffOkRqNgGoGqQL1cvrvlCrd6501O+tjpte+HITVaRA1qZrpCaZG6+qIQG/bxydQJVMIsE
	 iiBq4IBXgjc3lSgab3O+HXg0idmeZf4HeE7qER+Ds2Tyk5FvknDbpJ0mAKb+do1y3Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795820423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ar+S5jk4rHH2V7R/Ok+7bDPoVRQ9mGkSVjC3XjNon4Y=;
	b=GY91zDDh9E2V3iMay8UAUcJZjx0frJL+Bvl/L33VeE7nnfEB8mvVTk6Lio3pIG8uGIJk
	 9QC7iRc3Sll+CleGQFuQCa5IQM/hWSninDYuMBEvzWXi2lyMXNVJAR+9ki3y5fvb5zLV7
	 6U6GMqmmTkItDWeqX6i+xQUJYhdfdcA1RiWpwi5jYdniOqJy5cbf9iWYZ8qqXCWv6Qiu3
	 bEjgZYh7fva7CMVR7C2gemyvPzRBzjp11RMZrNMVhnRDYECS2RBM+LpG5J6v/zIE+ylCN
	 MAtbHB3qbENRFgi6QS2vWwGR80s2vpngZ7OnqvYcy7QodqeZ40GB/5XuYbu2NJer7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ggt+XXIa;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF725606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 23:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF725606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ggt+XXIa
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92125687442so83484826d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795820422; x=1796425222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ar+S5jk4rHH2V7R/Ok+7bDPoVRQ9mGkSVjC3XjNon4Y=;
        b=Ggt+XXIaJGIhZbwCW5zxpNjFNYKQzpEO/tJK2TUY/2/Lj3O9AFEs307VHbTTbGMO/U
         imXoJ7gXTjU/QQRMC+qWxvBRHOftWUZRJbK+sTMKdIRufqAy4MGwDDpHtj7TAlPxfMba
         UAZGaZ9GnPu3vsk/HJjHYbFO8P0FufBc6TDKxEtHPIYqUwNplZcCfNlLQfczTAGZNzDZ
         SH4Uv7IRgJHy1hQCH/Uexz4+rqGH3h5Nes1wzvkc1pgFGTybLyIo+hk5ADG5QrBbpd4M
         PJe79wtowJbtyAF/NiYxRRaO7iLJbWTpBKOvKXDeVWQ2gThfqf/yoAXNATT9Z0A9zcxE
         DdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795820422; x=1796425222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ar+S5jk4rHH2V7R/Ok+7bDPoVRQ9mGkSVjC3XjNon4Y=;
        b=1NXtACNn0uct3ONpq4P0oKUfPtnEUiVEuITkeW9cj1+F82edcopJcY8a5ktzNKID79
         KEgouZP+xGKTmWJ8vpU/mSWCAnwLqr7mgdgu2hTvs2ObfJev7ZDjPgRc1+YGwtGtZ78q
         uWWuNS2XdB2a6aoFnrN+o34ldMBDQ4kK6vr87P4gaQWHkHSUZsuKWN/v0te6ZrJ6Zfzc
         e9gTVWovE8dY5pEVbyJdlfQ7xJbJ4B+2ehwYNlsmMbxkLi8kafyCfFn2tKiD44am5s9x
         z+T2AgVdKu9ZXiaoiXZvb7FviBT7aMLn54L4mj89O0iI/OFfI2AgL2xnTt/7FtanchMS
         m/iA==
X-Forwarded-Encrypted: i=1; AL+hErFP5WEyYcMZNnFgAFQU0AezC6tw6qcfZVH2PdtCK2w9WiSZIrPtz3lof1LbV5rqJ9NGSzjvvb7+5SZ5uxw=@vger.kernel.org
X-Gm-Message-State: APuU4Z92ueRbFAIZDolHvMQmHI2H2u2j9ljSGjltUUftXjw+ieCiopwn
	yOMY2RDJwGGLLOzTCRDJhN/O4XhrYfElanoZPJDZp5PVXUbeiAgxTSwx
X-Gm-Gg: AZFdTZc1Zps28Niu8xdstJpGsBYDfvWFXoG+4PxQgmGA6jIgtC5uSITKjCGYmCzQp7Y
	IoVcEms/oV0QX1FrTYXfqL3GkWip8cBNa8ZbTFKHxbHPFzvvRJnyuNsPsvfB/WoKApNqHiyYPgW
	690nygGNu1Seo82nXnqArjoI+7xumovpmGxKkchU4q9ns4zodTEdON+fmcKxHu46UJ+pV9eTFc6
	vyi1GTVUqrRxf0d0BYTahmtFKbH1ubrhk8QY6gdb17HtTHih3aXUtbs3NO/PhYE7JqkEBpye0vr
	FaGjmOdtOzMssRGYOnBOdQlnFXmHTfBBGjKSqgexaVYDvvhSoACsbaCwCtzyp+atkzQL3L7q0aJ
	YVgOddOJBgn5EAF9DXC2N9U1k/UIaigl1SFQ+KCkCDmVevSbxBDoHmLadPo3Q5PAuGDEZ+1PN85
	kOLK9OWlULpya2SuXD09fUV4gXJp/LyXVCP4W7H8SLkQlIg7EBixIUK9D27fkh8mibU1eQSsz/W
	lDS71G/VqziAJwAPcjC9opXGrsa0dWmUNWz5wZ3goNCKcRmAFxDi9JLnUwClu8kZasU44kryJMT
	Sv3a/i6g7lkAkfOlv/sBr2wgOV1ixszGfZu2sOnK8SsfrpxwoPhmdzn/fdALmKZ/QbAWIMUZr0c
	dOtFeJJzMMBYY1I8lvUzD+8aJwh//Dg==
X-Received: by 2002:a05:6214:1242:b0:91e:a545:691b with SMTP id 6a1803df08f44-92134b5a208mr465954136d6.56.1795820421643;
        Fri, 27 Nov 2026 15:00:21 -0800 (PST)
Received: from localhost.localdomain ([71.18.96.11])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921787fd72asm88678026d6.12.2026.11.27.15.00.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 15:00:21 -0800 (PST)
From: Yifan Feng <evanfengff@gmail.com>
To: Hugh Dickins <hughd@google.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Greg Thelen <gthelen@google.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Yifan Feng <evanfengff@gmail.com>
Subject: [PATCH] tmpfs: reset the memory policy on remount with mpol=default
Date: Fri, 27 Nov 2026 15:00:15 -0800
Message-Id: <20261127230015.30733-1-evanfengff@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
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

mpol_parse_str() returns a NULL policy for "default", and
shmem_reconfigure() takes a NULL ctx->mpol to mean that no mpol option
was given.  So a remount with mpol=default succeeds but keeps the old
policy:

  # mount -t tmpfs -o mpol=bind:1 none /mnt
  # mount -o remount,mpol=default /mnt
  # grep /mnt /proc/mounts
  none /mnt tmpfs rw,relatime,mpol=bind:1 0 0

Record that an mpol option was parsed, and replace the policy whenever
one was.

Fixes: 5f00110f7273 ("tmpfs: fix use-after-free of mempolicy object")
Signed-off-by: Yifan Feng <evanfengff@gmail.com>
---
Tested in a 2-node NUMA QEMU guest: after remount,mpol=default new files are allocated on the node of the writing task, and a remount without mpol still keeps the policy. KASAN and kmemleak report nothing over 1500 remounts.
Found and written with the help of an AI coding assistant.

 mm/shmem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index a5713109c843..48d1eec43007 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -134,6 +134,7 @@ struct shmem_options {
 #define SHMEM_SEEN_HUGE 4
 #define SHMEM_SEEN_INUMS 8
 #define SHMEM_SEEN_QUOTA 16
+#define SHMEM_SEEN_MPOL 32
 };
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -4905,6 +4906,7 @@ static int shmem_parse_one(struct fs_context *fc, struct fs_parameter *param)
 			ctx->mpol = NULL;
 			if (mpol_parse_str(param->string, &ctx->mpol))
 				goto bad_value;
+			ctx->seen |= SHMEM_SEEN_MPOL;
 			break;
 		}
 		goto unsupported_parameter;
@@ -5117,7 +5119,7 @@ static int shmem_reconfigure(struct fs_context *fc)
 	/*
 	 * Preserve previous mempolicy unless mpol remount option was specified.
 	 */
-	if (ctx->mpol) {
+	if (ctx->seen & SHMEM_SEEN_MPOL) {
 		mpol = sbinfo->mpol;
 		sbinfo->mpol = ctx->mpol;	/* transfers initial ref */
 		ctx->mpol = NULL;

base-commit: 822ba3a89c7896b26e4beb70e2ebffb881924dfe
-- 
2.39.3 (Apple Git-146)

