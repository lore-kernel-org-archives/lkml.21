Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795021423;
	b=RevR3WVnd4ogVrI5olLufdRFrl0oKAJIgb0mIWj1Vi+A8FkqTO8y9TiQvs4Anp9FfDVw
	 Hvbz9O17X9YdQnhl/Sj1lIFQoHdBp5IGRL7XGoZY582ZEeNMM5g5FzZaeBoqKrhsW/Pme
	 4QjKQz7+LffyezPQUO5JNMIyeWLeKwgk/bCK6295LiB3X1Er+KjOZTvvx2F4CBsZlVVXn
	 AdYP2q6B9K2Yg1pIOHn6cTbwhNsMB3sfDScK5M/3DEfP/vVr6dHtY+2F5eCiGDXFOkGRF
	 siyLgJHXx52i3w455kzdnF/zW5j09OerqQbqyCTgdJVyTIT/PmhO+KOvzpunnE8u4cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UaVcyNlEXvHCvSegf7DdOWk+AJHnO+R6lg7onpWBTLM=;
	b=32DOCtr3VoterOXo39e0pRvt187g04zalXx6Cwjgv/qb4mV+PW5zD6c5LBKP7fFBn5rH
	 P2AfLES5VHwtlcZGNmul0k+TIwICwcjP1B4zNVv5V+QPjdBaRAEzqy5J4RJzLEXVbtDr4
	 7wfNIoCyPQtFkcSMqyCf4cgHsB5kmbbUWmMLXjiGk3o3XEa9RSGyzT+0oBodpyD+5xp7k
	 d7l0Gsz0vDOcHBCid1P6lNKqeqHcG29I/hcLxUOu0FE8FrE8j3EFVBCBRNh7dgazD3U8z
	 YEmQbSKxzVHOuuWVy/CZDQQ9V8wQnZf72INA+RMSEzVImSYSqC4rgLTZiF/8RZwUTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOwwJznX;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ED960A3838
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95ED960A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOwwJznX
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8490a7d6696so697032a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795021422; x=1795626222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UaVcyNlEXvHCvSegf7DdOWk+AJHnO+R6lg7onpWBTLM=;
        b=mOwwJznXdq/mL9a1/tRYiu+9aHrPlamFRSWHPx0O36q9m1DP0sFU3+p9VaXqjV9+Jc
         MHRPPQyaH6plbzz+MRt03IENGzTCFWtIU2eB6RDCK/vXwdZ3FIYebVbtzwU68gaL+/YL
         svImR0bmonJzBwIrCZkIeL2mFLfBOb0UYMwLIM3rpOA9Rx0s1aEgxxJziWKfhhCyP6h5
         geqrqUdZrc7VGULz5CGgt6SNcvKLjmcItUpgyqAgUBH5zB+tze7iTqdDztLygklSMQsv
         CDA8M9ne2KsRlZRTbIJYPmcmkdYmXliMxsuKVjRfHlL7z45p5d8Bv8061oC7JWLDorFM
         JKkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021422; x=1795626222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UaVcyNlEXvHCvSegf7DdOWk+AJHnO+R6lg7onpWBTLM=;
        b=AOOvUFm7wJBAH3a9qeNv1umsC9GYfkNloqHmXycfP1Kr6KblklR0aYsH4kGpbxSrOD
         roFJTlToSq+JWvUtM+cnKITSOzNj8liDTPhnq5WI+MMzjuaSlvEowFLwCncYLkF534Zw
         v1daDHi4bsTQ66i421nQUaJPAiFdyy3c5+UEYt2xMB2ZycR+OU8hEWIYPWZZq+x/TQod
         GDYgvFF0U+IT04s3mIj9Yah3DxxKSDzitML/yu+20Fdtn+r5WyLzpCT1KxuaIG84GjVR
         1nnEXngOwwmoFekN8e8B/EjDLOhexwNNXTuh4e4yFz0mMxTR/AKCMu+u4/IGY/AiMsi8
         1gwQ==
X-Forwarded-Encrypted: i=1; AL+hErFRxpeLSD5Qf7qsB86QAgw7s07kAdeqHonmFkNyTUlrFDUe3moBqCpEpsCMMxlFg4GKc4P5Rh1m9ui2pmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Q/GDQZ9vcR1QqxmaK779ZBIcFox/jrDlM6CH2Nf5xPFJ2ASZl
	J1T0eY8K4x48d62TNH1q/lA1TPcZVkr/XdMJBzQqY9ezFJPQInfFkNBn
X-Gm-Gg: AYBFou1XMCkS6Wrwr8VTO2pXxEEn2xLMwER5eMun+LBgvyxn3tWtXgVyJzARa6s2n8E
	OwZH/BX7B+vHCzuAyrvp3xWqG1GbVAMqm2HQkOHegACmUHtdNdi3sNo4pBAgcU4Do8HBMMeqZAk
	8gDcUOmXa6eRw8IulHNyCKkoFBEfFd91H0YIZu26btti+TQy2lAPjym3SGYKKLLHrcm74M1OgV4
	B8/t7VOvlGKAlsoQVlF5LpE2++ETNCYBD94+rVhNFWO3gejmZV7csDfgLbq94kpNUQBPSzEbH+N
	deUBeECr2UnueglbrgQ5MHelhxAOw/CPR5zYqM7o5ZVRoxQNgHRrfJ/7YTi+71W760/Gd0BQj1s
	zlhgoZPHpeLppg78XQWm6usI8iaiiYbWlb9TLFsROSaOtO2wmxWjuekFRNbZSKn8gokQwQcHrBo
	Cbb7A9NZ/9RdIHIPd8VzKuWXNDlweoauQO3lj36l9yIvO6gryq6jtcWivCC3abnhZ6u59AbVvmI
	OsVjDTEOmssNwFujzyUA2LQbmdiU37JieZsVpzDy2AaNMMZNioo9LRGTiKkAIdgkr/0BGy2865T
	FjW9DYuLvZqhqWNth0h3taQ=
X-Received: by 2002:a05:6830:2696:b0:862:aca4:1158 with SMTP id 46e09a7af769-862f0861aafmr2972784a34.22.1795021419554;
        Wed, 18 Nov 2026 09:03:39 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:15::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01d474esm2486617a34.4.2026.11.18.09.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:03:39 -0800 (PST)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: dsterba@suse.com,
	linux-btrfs@vger.kernel.org
Cc: mason@kernel.org,
	osandov@osandov.com,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	boris@bur.io,
	quwenruo.btrfs@gmx.com,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	stable@vger.kernel.org
Subject: [PATCH v2] btrfs: fix bytes_may_use underflow after a failed tree block allocation
Date: Wed, 18 Nov 2026 09:03:32 -0800
Message-ID: <20261118170332.992625-1-vlad.wing@gmail.com>
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

When btrfs_alloc_tree_block() fails after btrfs_reserve_extent() has
succeeded, its error path gives the block back to the block reserve,
although the block has already left bytes_may_use. Each such failure
leaves bytes_may_use a block short, and it underflows and warns in
space-info.h when the global block reserve is released at unmount, or
earlier.

  btrfs_alloc_tree_block()
  |- btrfs_use_block_rsv()
  |- btrfs_reserve_extent()
  |  \- btrfs_add_reserved_bytes()  <- bytes_may_use -= blocksize
  |- btrfs_init_new_buffer()
  |  \- alloc_extent_buffer()       <- fails with -ENOMEM
  |- btrfs_free_reserved_extent()   <- bytes_reserved -= blocksize
  \- btrfs_unuse_block_rsv()        <- block rsv += blocksize again

Since commit 19d7f65f032f ("btrfs: convert the buffer_radix to an
xarray") in 6.16, alloc_extent_buffer() can fail this way under memory
cgroup pressure, because fs_info->buffer_tree is memcg-accounted.

Return without giving the block back once btrfs_reserve_extent() has
succeeded.

Fixes: 67b7859e9bfa ("btrfs: handle ENOMEM in btrfs_alloc_tree_block")
Cc: stable@vger.kernel.org # 6.16+
Reviewed-by: Boris Burkov <boris@bur.io>
Signed-off-by: Vlad Poenaru <vlad.wing@gmail.com>
---
v2:
- Shorter changelog, built around a call trace (Qu Wenruo).
- Dropped the code comment (Boris Burkov).

The code is v1's apart from the removed comment, so v1's testing stands:
its reproducer leaves bytes_may_use below the global reserve without the
fix and not with it, and fstests btrfs/002, btrfs/220, generic/475 and
generic/476 pass.

v1, with the reproducer:
https://lore.kernel.org/all/20261113170926.1468850-1-vlad.wing@gmail.com/
 fs/btrfs/extent-tree.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index 9b0a5c6b96f3c..8d4c66bf850bc 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -5433,6 +5433,7 @@ struct extent_buffer *btrfs_alloc_tree_block(struct btrfs_trans_handle *trans,
 	free_extent_buffer(buf);
 out_free_reserved:
 	btrfs_free_reserved_extent(fs_info, ins.objectid, ins.offset, false);
+	return ERR_PTR(ret);
 out_unuse:
 	btrfs_unuse_block_rsv(fs_info, block_rsv, blocksize);
 	return ERR_PTR(ret);
