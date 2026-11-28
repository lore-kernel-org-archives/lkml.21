Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874806;
	b=pNMbSg5Nq2hqIPxt/3SF2h74lHzutSTmLsQqagx0Mfs/Wy2SKEATPnVXWWMQLNaKbHYG
	 9mnAcNVyleIZmlV1jW/AFq/Gu3co4KbmEtZWCLS8UDjOf/nDRpaLzwhwn1PfUE0tYepq8
	 /L9WN+jGYMLuMvyUMpKtHNDmDU4XxdLfYHG5jatqnJofRWjwG2a4G71hYCiPWsu+tS8jE
	 F8oJXe/CYjpz3Lo8k21m3xWvBtuJCQ2mz6EEN14A0N0U2idCp2I/WcO/9GHL/0OxpHZar
	 uWK0Q1nGHGw9d19/P0v3DCrrRoN1GWTVtQjt4a7F1BKJ4rgQWBlg3KPUS6s6ArQAP5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f0hioqx1j+KUgblrL2ZDwN/5Mn/iMyAHXCN5l/EZKpw=;
	b=PcGlTsYeIHp1FD7gxGUSwmyRHCxOn9TxIM/uG46MOJ3R5pj4c/mBleg3kv7nj7aNo27C
	 PKgyRODr3eWB/ezAcqnYVsw/DAEvLvBEWnBdJNDPtM/Bkzf2C7q0Fk8juFLzDMU3rWbM1
	 nwWhvhy7UcyAP/4fVIb/zTyX/X1qJdlevSHGNWQKNSMHnUDC/YYibxAPf26uCquFCykt5
	 rs5CYolpjEwn6I0w8B/sOMY27594fGqmUPVZ/XqteOCRCr3j0RA3RKzAt7rHXQGJaUvVs
	 Aeldrif2htXV4y3L1heDxSqPFx2/xFJGg2ewaBErbq+Wfbxi+hydr+ZJz50HuYbf+Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeoKZniw;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48839606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48839606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeoKZniw
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-949664ee41cso920886985a.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874805; x=1796479605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0hioqx1j+KUgblrL2ZDwN/5Mn/iMyAHXCN5l/EZKpw=;
        b=xeoKZniwi3Fxx+vnNKT7mtaC68WAs4KWt3ivJMAk9YhSZGrrOCX3Hai/RZ+lLMT0dK
         1Nj5JtUYkbHIGbg1nDWGqu5vfl5BR6D8I1QW0VXM16owsNrfeaI4rsT2Zyj6sup5iS4u
         9W/V4sTkd36pA1nLZ/PwcFZoHsEubC9rS3udNp25AfGV4/mykb7J9PC3tyR5OO3DjwY7
         ZfpSvwGx+/JtaJdDwoK3Q5Gd69/7oIK/yc4V4bccydCQ27qF+q1b/Y3Idmr+pv3tCIoa
         /Hoy/2p9aeqyfutvstRE6F8p7R9kQYBmaj6Wm7Fxf3kS48taV0PKXGW/xjNOgx3DHLG/
         g99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874805; x=1796479605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0hioqx1j+KUgblrL2ZDwN/5Mn/iMyAHXCN5l/EZKpw=;
        b=rboo00d+/2JJh+xCu0NAcCTzftZweGIQp1WK9jPSJr7qItLGofgX+vEfAHfvY/zKkS
         Z2I6qCNLAiAuzhNjMutfav9F502OkMyzLD5EOf3IfroK7VXj7BcXzdXTpe9NAgNKRxlt
         GOINl/yqUaAIQeBM7d7r2y9qs5DrH0HDYeFHTJRrIEi4W+OiozcLbiFe3nRah5jVfv2F
         eNbGqe7ddfxQhm6ufkMbL6RbImbwjgHr+jT4jss9Rx5Srp92WRxEDtqiQqZOI5xsEDJy
         OGfOIXfz7108aHjjH+u9xbEu9jfUXh87eNr16O1w9YHSPOLXgUdsDwazzxNhxESgW7bt
         8l4w==
X-Forwarded-Encrypted: i=1; AL+hErF+DORPq5yB/XHpbGYpsmo3AbuWCQ2UtXFWKLIPevEM2T5wi4kADzmGBEPQ+DE/1WfTbnjKvYNFP99ppYk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZP4suK0uiUHPENkvhLrmBBSe6rPONFlV1FzaIWtCVXJaArcvD
	cARCw3qavR0786sFsNYpwq2HCFiB+PPvkDLM30xYrIwGsYfJzgh9UaXWhKVKX8bxQDDx+g==
X-Gm-Gg: AZFdTZfWKIAEcinml22haztoi34Tg8yiC6jckNfd+esnjuHo61iAa8aZQL+nmC0uwDZ
	ARh7acH+Rqb7oNHXmiyF5FCN3xcBzlm2UGFopxHL9uPi2ZMcf4+CXzZ1l2xfLT7FcR6OCuJxyvo
	Rl3MDK2g5l7wRtz+2LSNsGHUK3wMiIcM8X01xczPVy9ZdPWYoj0n4N9I6TFO7NSvhxYPk5AhZdg
	19z14oLSfhWy5yUGD+B5VeQPLxyN1PqORfWBB3k5yycnHs6uGjlYbuPCH7zJzJq4fwVClQX21CG
	zQ92406KZEAUdjWMcHnHB64AY3KdiSy6KE6zzaA++Sak4j95hCGxjgQtNMBGuF/hsUmhQW/wNCz
	/L/TKphHO3qkRCvpEEw4l4LayvNfzaivlMdZUBefZwq0fI7Rt8g9+mZXBWqFxoamWAAcNo7Kchi
	pLk98YVqd4ng1P+cvJP3AFMd89JZgB3Dqz4+UjihT6Qoqb/XT53ruCLZ2DP7OyQqyqkKSppSJfE
	oTQrHgmNL1+/FNG7X9u0Wn0aBZORx6zDH7x+38NC3OhJOyoGmeEVl9ZaPSWtBQ79mWCu8LIflOw
	EeyU2uPn3/y40SuDfdFYTaxwkDgl7UoEn3uCEMV6BPr4cnNkewBlP18pPjXBe7h5FxL69x5HhUv
	Y0CVP
X-Received: by 2002:a05:620a:f0f:b0:949:57b4:388b with SMTP id af79cd13be357-949bab0eb6cmr5353856985a.41.1795874805196;
        Sat, 28 Nov 2026 06:06:45 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm2086323785a.14.2026.11.28.06.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:06:44 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolai Dokutovich <ndokutovich@gmail.com>
Subject: [PATCH] block: use READ_ONCE() for the PF_EXITING check in set_task_ioprio()
Date: Sat, 28 Nov 2026 17:06:42 +0300
Message-ID: <20261128140642.57-1-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.43.0
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

set_task_ioprio() can be called on a running kernel thread: ext4 calls
it on the journal thread from ext4_fill_super().  kjournald2() records
journal->j_task and wakes the mount path first, and only then calls
memalloc_nofs_save(), which does

	current->flags |= PF_MEMALLOC_NOFS

without any lock, while set_task_ioprio() reads task->flags under
task_lock(task):

  data-race in kjournald2 / set_task_ioprio

  read to ... of 4 bytes by task 103 on cpu 0:
   set_task_ioprio+0x17d/0x210
   ext4_fill_super+0x4954/0x5600
   get_tree_bdev_flags+0x218/0x320
   ...
  write to ... of 4 bytes by task 251 on cpu 1:
   kjournald2+0xbc/0x3e0
   kthread+0x1db/0x220

task_lock() does not order task->flags against the owner updating its
own flags; here it protects the io_context handoff against
exit_io_context(), which runs after PF_EXITING is set, and PF_EXITING
itself is set under sighand->siglock.  Mark the check as the snapshot
it is.  This adds no synchronization.

The racing write sets PF_MEMALLOC_NOFS, which this check does not read,
and flags is a naturally aligned unsigned int, so the snapshot cannot
tear and the observed race does not change the outcome; the check only
decides whether to allocate an io_context for a task that could be
exiting.

Signed-off-by: Nikolai Dokutovich <ndokutovich@gmail.com>
---
 block/blk-ioc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-ioc.c b/block/blk-ioc.c
index d15918d7fabb..a3662e709bd9 100644
--- a/block/blk-ioc.c
+++ b/block/blk-ioc.c
@@ -270,7 +270,7 @@ int set_task_ioprio(struct task_struct *task, int ioprio)
 			return -ENOMEM;
 
 		task_lock(task);
-		if (task->flags & PF_EXITING) {
+		if (READ_ONCE(task->flags) & PF_EXITING) {
 			kmem_cache_free(iocontext_cachep, ioc);
 			goto out;
 		}
-- 
2.43.0

