Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986858;
	b=l0UY0rF9RZmGL9y3Ij6BCqYNNd41QTzKFhn5HpxuD0n8SCWdS04xy068yNFYfAhm1EJD
	 2fn/btY4Qvw473rfYCfkI9JR/QlnAJH8WBPWSi4Y3SisQiraRHbdXfith0U3KIfmq+Owf
	 cWzRrwxg315d/RUv3JAYSSZqxw4E0wroB1PaBMIbDAOhlg9FoIj49Eblc0UKJBHWvLIWs
	 Kuw92MjIZ4odP3f+rbmeqJcNuYsHV3eNVAXyKsXiUZ6axBZHl5wdMKN3lymEmzD46LNPU
	 n/MIRXpiStm0aCwU735kG0Xw7qkNtl3HbU4VZvGlYMUJZiqGT7FnqkqkS0PkxIZDs2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986858;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6NFuvRQXEVaZaifvR5yHZ1oEsO0k01+oXCkFBU190Z4=;
	b=zZJGdu1sWGOQfxaQosN6r7iaJTA8yOIUAiX+1fVVUWxt8vgUTOd5JOGTvk/YyFR+0g7W
	 TCUSi6OqwTbZr0dGlWqKRAlzP5FEl3CPMmuJZbcveIXi+swjnT74MM+e1Dak6F/pKcOp7
	 q5pZyHx4f94zlNmw/ehE9HsgltKdJFRKXaqR5IXe9OibVl+H1rrvk/eGfnxrd6UT+7H0W
	 yAmWWd4KinllA3CoBPldA/haB+OFvS28gPx7rYJ3VdlhzKIwgwGnEiD70O2bc4C47tOms
	 IO546DmrJ6UZL8ZO4cgeSROspasI3WzzuHeFlQvYyiewQusCGISrArXvvJOp0QhFUnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p80ELF+G;
	arc=none smtp.remote-ip=91.218.175.137
Received: from mta0.migadu.com (out-137.mta0.migadu.com [91.218.175.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AC6606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39AC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p80ELF+G
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=crEvFMuqUZJcoHCiGFm0hJ7qztU/AIfHT6iDjJCMEjw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794986855; v=1; x=1795591655;
 b=p80ELF+GWPoiq2IA4yzCyiZTh7GRxhd1xK9HGI3EjW7t+f+AOE1oHtqXRPp4leitguYCOSwF
 io+RKHDH5+5bcj1bJMWAK/S9O+jckuQh8Zjs1sy8848edC72IVwMmgNe3cn3BDT9sf8LOz0SZ53
 dg5w+qto7WeRHhdTKoGMPkho=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 99982917e0ed9034;
	Wed, 18 Nov 2026 07:27:35 +0000
X-Mizu-Trace-ID: 99982917e0ed9034
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: sshegde@linux.ibm.com,
	yury.norov@gmail.com
Cc: wangfushuai@baidu.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] virt/steal_governor: Remove redundant delay filed
Date: Wed, 18 Nov 2026 15:27:22 +0800
Message-Id: <20261118072722.1052-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

From: Fushuai Wang <wangfushuai@baidu.com>

The 'delay' member in struct steal_governor is just a cache for
msecs_to_jiffies(interval_ms). The duplicate state is confusing
and adds no value. Use msecs_to_jiffies() directly at the schedule
site and remove the 'delay' field.

Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
 drivers/virt/steal_governor.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/virt/steal_governor.c b/drivers/virt/steal_governor.c
index 6e31f9923dea..8af6c02c7e77 100644
--- a/drivers/virt/steal_governor.c
+++ b/drivers/virt/steal_governor.c
@@ -38,7 +38,6 @@
 struct steal_governor {
 	ktime_t			time;
 	u64			steal;
-	unsigned long		delay;
 	unsigned int		interval_ms;
 	unsigned int		high_threshold;
 	unsigned int		low_threshold;
@@ -252,7 +251,7 @@ static void steal_governor_loop(struct work_struct *work)
 	}
 
 requeue_work:
-	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
+	schedule_delayed_work(&sg_ctx.work, msecs_to_jiffies(sg_ctx.interval_ms));
 }
 
 static int __init steal_governor_init(void)
@@ -270,11 +269,10 @@ static int __init steal_governor_init(void)
 		return -EINVAL;
 	}
 
-	sg_ctx.delay = msecs_to_jiffies(sg_ctx.interval_ms);
 	INIT_DELAYED_WORK(&sg_ctx.work, steal_governor_loop);
 	sg_ctx.steal = get_system_steal_time();
 	sg_ctx.time = ktime_get();
-	schedule_delayed_work(&sg_ctx.work, sg_ctx.delay);
+	schedule_delayed_work(&sg_ctx.work, msecs_to_jiffies(sg_ctx.interval_ms));
 	pr_info("enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
 		sg_ctx.interval_ms, sg_ctx.high_threshold, sg_ctx.low_threshold);
 
-- 
2.36.1

