Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607774;
	b=umf5lg54pudBW5i84XeQG1AP4ARTNbxPhMCLWgRelg9kQgVOlbt0qTu6E97/kdCxdMLI
	 L/5rR8bFMfxJ2SD84TEoyEwvu6gebTb9A2iTLcA8NAUur+BJiAUeohSXW70DIMB9NoHjI
	 IS86tAOzhS62/BLQz9aQjz5KH0fJ8G3IR69FcLP7y3PeTjO4H7cfOwT/Q+dW7KEui7Yoc
	 YkD0UcdKUOi3oA2TyR74thQsZ0SOgWx8yMfnJMbWvuDefMZJisMxia0OE9aTyNktCGY7N
	 Yu0ACSlXG386bdk/e6/TclwSBwFUIPD1tCBDJUxBVds+8rqwina4KtCDtCsLN6H0qVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/7w7WDtffWC1NiS68zJjtHBNdebbuTLQzdHDhviSbiQ=;
	b=k93L+rO2oVc1f1yw8LYZ22+ZLVWReLIbUOwUD6yDlNUYwCc7vFHgFNORXYDTIVyu6uk5
	 PWU4Y/Iqcqxh15643U/J0ozLZMfx+M0ZFlx/FtWMKlg3KnkY5b1LtH6vkwi75Ad0mbO8P
	 q81o6u+D7/3Ye2mZ0jqaykbobxLq5AvffPo4yp9Kwz7d8wgkUqvDqjhwMjoTj+w/Mb9uu
	 1ay3oDt/WZfuurnepK2tolE9ahtC9mDJL4CgOps6XlkB0pQFDc0u9bt2yeTw9CBMCBFqg
	 DIrnhJ2CWhFvg6LKly4IcRGZRfLue330Io74Ad1e61mp3vGfRvCt3t+0KwGmSev3kvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnLKVfy2;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE7606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EE7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnLKVfy2
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b3f9cbafecso764321a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795607773; x=1796212573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7w7WDtffWC1NiS68zJjtHBNdebbuTLQzdHDhviSbiQ=;
        b=YnLKVfy2PM1puw+XxY5Mp2kY5GTdEPSbT72AKFvhnN/xd4+kSOnMRtHqohy0+8WXwe
         Uv8FTgHYBM8ZXss2MBvgVrUsvBOdENfjIm6XJheBk7ZcVKPpWs4mkOlJy8tWtm0acI10
         w3Y7678Cd5tZ9G4OAPUoefBEBKjMf3eD0KsqSlcTnXZvWj0eBemmSRS6cG5hrCyE4sAC
         W55KvnLiUh8aPZUKnGQcHpznRW/P92kRxB+Z1Ptf8KDi/JN7yC2bYE2MmyJvJXfMQi9T
         e/YkLMpmGkIhw2K6W14zz8Zud/12lSenhTodgXybaWogTJ7GdIWPoVArl/q4fDOuXyuB
         1dNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795607773; x=1796212573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7w7WDtffWC1NiS68zJjtHBNdebbuTLQzdHDhviSbiQ=;
        b=Sj+aesu3kAgUKZRUnqUXQrz/OB+8+7A7lAE6szvEKbWZfeo1kAS5WcP0282MLrw/x9
         b2MSSndYatUmpd3TvjW+chsNXT1D501oQmjrhXJTYEL50mADmOYmOfsK962BPtC6Q3eZ
         OXtZGai8beOkz5ram/A5GH/1bvl2J5Q6r4Pg22svQJRUX3id2PXvdgvDxtbO6e5tdmZC
         AQKa3Eqa/2ZQ8qVMA/rBhigU9lFMpBxoYq68CLS7LOxzwDgVMv+WOsYZ33ffjhaqHtil
         hVyCtl92V6J9FaVZcrRzIe6HODAg/GqVPA7Xqqc5yzjLpG9KWnYQoji0ZRi//sg53uJB
         rAcg==
X-Forwarded-Encrypted: i=1; AL+hErGKOWkt6kgQTQRl05xUiYb/Fln6q7JJFe7Zu9IlfZaboMKP74Astclp7lu1n0eQnDetxXjCEFYx4cOIMjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UYplMyuCq6h/cF3olNvM5FV+zYT6XvxBURA6Y+fLCdN5w1WAq
	jmsVJsH/MAI5bNDVd42OykTOXc1fFHvwwwwTroHEtlgGl9GKz6/8/G9j
X-Gm-Gg: AZFdTZd7QQy3nOZGfFFsS6kxFF6l05QVm1ca7+Bzei7KEQMGs9TMIB4zHrn+P21dxp2
	xZ+OpLCLfUG+HrMd0g12pq1FKr8gjtfE/jLVPz4yCJ2DZ90/YHnCAxKRYX9elgtJvEU6PRyDCIk
	etnQI4u0dm43ytPJ9SEDpQjw10VhicdOTvjKI7eJTycj0YXvu6eVS8OcsUBWdnrKcL75c/+CiU9
	xMQ/KKOclzzLPq+6qHZP8dV+8eDNa94Oa0cMvWArleuFvL7NIP2nKBHQCJcv5gkZErL/kB7HwPB
	9WDR6fgnSxJIXBdZDO677hSlbnFJA3J/lzu9udtVyK6dPLKZkYhRQT91XLEv5ArEZsblN257FEw
	i1/8kapvt/GqIg4bmYN/g2AFTIIYJ/Mi7b4P7Lewz81fpg4nWkQagd4LnfCDJA5D9LafUFDOfsZ
	cmcrXSBqmJHpHxcVu5T2HcOwhHHFoseiY4EFO86LISZnrlB2nPE0EeuD0y+CiEZ493aJly8PeL/
	XSXUwaXllwDbSBVQbokbJ9RCSZ8OfDQBq8DXxmd/aor0mcRQzh8xAAA2npohK2N5csRh4rnmeQO
	sXr3yGvdfmzqdS2pPoLKnmqipvxyyXaFqrtcMrrwCzFw+S2qx4CaxSw=
X-Received: by 2002:a17:90a:e70c:b0:3a0:c1b1:45fb with SMTP id 98e67ed59e1d1-3b41c58aebdmr27297074a91.0.1795607772912;
        Wed, 25 Nov 2026 03:56:12 -0800 (PST)
Received: from mi-ThinkCentre-M760t.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b420e1307csm26506574a91.7.2026.11.25.03.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:56:12 -0800 (PST)
From: Wenwu Hou <hwenwur@gmail.com>
To: Ingo Molnar <mingo@redhat.com>
Cc: Wenwu Hou <hwenwur@gmail.com>,
	stable@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] sched/core: Avoid counting sleep time as run delay after migration
Date: Wed, 25 Nov 2026 19:55:19 +0800
Message-ID: <20261125115519.2373653-1-hwenwur@gmail.com>
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

A task with sched_delayed set is sleeping even though it remains on
its runqueue. Migrating such a task calls enqueue_task() on the
destination CPU, where sched_info_enqueue() starts last_queued despite
the task still being asleep. A subsequent wakeup does not replace the
nonzero timestamp, so sched_info_arrive() includes the intervening
sleep in run_delay.

The timestamp can also survive final delayed dequeue: pick_next_entity()
calls __dequeue_task() directly, bypassing sched_info_dequeue(). A later
ordinary wakeup therefore retains the migration timestamp as well.

Reproduce with the Python script [1] on a four-vCPU KVM guest with
DELAY_DEQUEUE enabled.
With competing loads on CPU0 and CPU1, a worker runs on CPU0 for 8 ms
and sleeps for 40 ms. Migrate it to CPU1 while sleeping on alternate
trials, and compare run_delay against trials without migration.

Output excerpts from python3 repro.py:

Before this patch:
  worker=697, CPUs=[0, 1, 2]
  trial=00 migrate=True state=S run_delay_delta_ms=40.259
  trial=01 migrate=False state=S run_delay_delta_ms=0.223
  trial=02 migrate=True state=S run_delay_delta_ms=40.194
  trial=03 migrate=False state=S run_delay_delta_ms=0.229
  trial=04 migrate=True state=S run_delay_delta_ms=40.202
  trial=05 migrate=False state=S run_delay_delta_ms=0.230

After this patch:
  worker=350, CPUs=[0, 1, 2]
  trial=00 migrate=True state=S run_delay_delta_ms=0.005
  trial=01 migrate=False state=S run_delay_delta_ms=0.225
  trial=02 migrate=True state=S run_delay_delta_ms=0.620
  trial=03 migrate=False state=S run_delay_delta_ms=0.232
  trial=04 migrate=True state=S run_delay_delta_ms=0.236
  trial=05 migrate=False state=S run_delay_delta_ms=0.234

Across 15 trials per group, migrated-task run_delay increments fall
from 40.167-40.259 ms to 0.005-0.624 ms. Controls measure
0.223-0.234 ms before and 0.201-0.620 ms after.

Link: https://gist.github.com/hwenwur/61cf383f8df72d4270ad9918b1d4edc8 [1]
Fixes: 152e11f6df29 ("sched/fair: Implement delayed dequeue")
Cc: stable@vger.kernel.org
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
---
 kernel/sched/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 515b9d0353ce9..043885c66365e 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2198,7 +2198,8 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
 
 	psi_enqueue(p, flags);
 
-	if (!(flags & ENQUEUE_RESTORE))
+	/* Delayed tasks remain asleep across migration requeues. */
+	if (!(flags & ENQUEUE_RESTORE) && !p->se.sched_delayed)
 		sched_info_enqueue(rq, p);
 
 	if (sched_core_enabled(rq))
-- 
2.43.0

