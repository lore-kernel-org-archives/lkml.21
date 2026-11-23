Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392744;
	b=GNMEl5d9M5RyVPhYSFMP7Hun6Z/EGEHo3830JamA/AoS47Eko8DDsHTccs9uI6/nNY86
	 W9jESdTi0A2snJsZTBDeUfWNRnYFR/t+rIdyZaWH/QYgFk05++Z9yNy/awWnZSVYfKPIU
	 CRU59VvdV6K/INB9HQd6diJPzvR+xdopPEKaHjdfmLOJii8JpT5T0f0JcJZKg1ODrJhq+
	 ovRiDyhLT0srK6DCPWtlxKeIICGvIDMRojQMOyYzb0tr9aSVwGx4DQTy9xAfomxA7AOT0
	 XDN2GThCT7qcq+p8kizuPJ8eoG/wE+/sCwTUvXjwRbQPGNNwqxLdOPIYZ7eTg+egfSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PBrEB7f5YYk42gc7Q56J9QHIXXlnB532TvxaLJsXkho=;
	b=DT0mWgV2KCT0+dKRKUdxPNf3Xh4Gfwf1USV52h6mO3xTtp/7fs+COLaDAV5cKiJPIr0V
	 WDkiztaa+p38FpXURR5eurs0u5ZcKTXH0FBmlYqbPM32EAT3Ljs+NVnOyg/sxNzMPm/9y
	 fNxXTTIe0B5deF0D0vCVxD2SmbNTL0wR88IdjJ9wlSd47uFuDgNMVHc0BKtntWwq5ZVrY
	 Zf+w7jFufHotQsn74JihBtPS0goLgEPoxjQYzGfMWuiNVE1YGp1B0MvdAwzL6T3q598SW
	 rxrpZw8/wKHkOl/tWkqds/HrzwLhIkWdwjxrxQcWG/85g80KjK1Lid67okg1BhKEy0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxn9SaaM;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A8F606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82A8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xxn9SaaM
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2053664f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 16:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795392743; x=1795997543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PBrEB7f5YYk42gc7Q56J9QHIXXlnB532TvxaLJsXkho=;
        b=xxn9SaaMRiFf0M2G7rAdUJTjKs5OBiCAMSG3kZmEw6D06eZYZBb/8uViffu/tNB+r0
         MNN5IXCoDljJmSOpGMNerciUpTTXTGusPZL33VEjQyI+YXQf1zWkw/QUhCuoAehKc/xQ
         fYPW8c7pjVcI10Td5bXwLrJf5HocnoorZ2QA9w7pFAcb8I6PTz1OrXLHFZHg9LHDMnMt
         9I4b6UYRNhcAPgfMDnr+lQfHtZcQKe/2lXhqW9yTGyga00jwncpA9XoF0Z8lYIFZO4hR
         06IgQTocsocP70tcIXr19fSzPzFYFTJ1FwugBiejmVjdF9gsLmQvPofWvaJk1hr6mNnN
         F8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795392743; x=1795997543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PBrEB7f5YYk42gc7Q56J9QHIXXlnB532TvxaLJsXkho=;
        b=HQn30oIOIx9NO5Gf5tLa5clUJP/byYTCTRNQo24DcgGioDTJyyc7snPt6XszUBM38W
         CvID4lqOBrnmJtBJnpPCJHGDJASvcd4ClSNXG6cugTR0x0In88Iv0j/duiALwMyKqUIU
         HwdMBiOdOrXdZwB2w8Pjqb/FMBwrs6TddC9lP+k3a3ak0NN1z8dsgmAvM2aZIkgVvyaS
         rFpJGey7RewTM7VT1XTQUv0I2xq7EzbudTGHR1EyVDmMF1RdYQdHkxdi7uNtjlWTDunK
         DcH0jMq1O2REmzKqd6tXG3nyE7w7bojKGvI4eE+e+UdwOT5WqWOBqBcKniCDwGhEKW/c
         SGjQ==
X-Gm-Message-State: APuU4Z9+dSGB05aNBn9E/wP6FSEguwnTwsRv7DnNnKIkYwfZB6OIoS2+
	nN9rCo4/AyS2zqxv32IEzRkOSLI58JjSWs8PoQ1gwy5pfiCra8v1wkH2
X-Gm-Gg: AZFdTZdYPGlQTFtLe6hpMHlPAVZ/JceHDuErxX9Xrmlb1DOhU57v8/1rVfXJuxqWpE6
	wGhISKdMTh8y2GJVRYhuW3hZDP8bdAaF7bSoXwWwlikMUu2r9G4KwgL8XUiY45YPkG8psJwgWg1
	fqvMeDw+jwJ1KMAmVwQgbPcT0xIH52x3SdQhzWv7o3lD4hRaYCE+pTS5GcOYd6AXVb/cbpcAf/h
	STELWwGDi4VYqNESE+1dqpk2M+LigjWwGPntoNTj/X457knrTZxmqR4KxrGiT/RniLLqoS2Rn/U
	G8vP5EyWoz4Za65s7WqhQs5979C2fsnYi/Mc1T6g44FDAku23nmyviVa6hcL7yVJ0ySsF95C6JQ
	4VWBi3G4vS3XyExF+JxieVNjq6H3H2SQon2IKYWVGba8YNHeHn9RUoK0ehkTm93NtoFFmwDfjtC
	xGu17rfxXRRGLIWivaa9sw2Q9PsOlq6M1UbunrY1XscZkrCCfov2jfnkza4CQSMXmXw77X6OcvE
	PG50R1KAKujfIr7i+xLlZA8RYxGSH8puP2TlN7DNejbhpPNIcAhW25PA+S8rww1WgboAvj2bkwx
	DrJlaVxx4gEZqgBZ2pNd79VHl3ROsLjmAC0M7QtvFwdKiMWKJ82vDlIgV/cyjNvyP9vLGf0nbws
	B3L7zYVE/ccuKdbEopvzeQ+OdhinCZFFbg3/LR61q9DML35lnqWeSRnfeQOmnINZgZcY55HaI
X-Received: by 2002:a05:6000:4616:b0:4a8:cf12:6f34 with SMTP id ffacd0b85a97d-4abaab6318fmr20026463f8f.4.1795392742692;
        Sun, 22 Nov 2026 16:12:22 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:896b:b24:bc5f:da54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm19586296f8f.53.2026.11.22.16.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:12:22 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] sched/fair: Fix h_nr_runnable leak in dequeue_hierarchy()
Date: Mon, 23 Nov 2026 00:12:13 +0000
Message-ID: <20261123001213.7609-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Commit 486c3d06b902 ("sched/fair: Avoid transient double accounting
for delayed tasks") changed the h_nr_runnable logic in
dequeue_hierarchy() from "set to 1 unless delayed" to "set to 0 if
delayed", but left the initialiser at 0:

	int h_nr_runnable = 0;
	...
	if (se->sched_delayed)
		h_nr_runnable = 0;

h_nr_runnable is therefore always 0, so dequeuing a task that is not
delayed no longer decrements cfs_rq->h_nr_runnable. The count only
grows, which inflates se->runnable_weight and skews PELT runnable_avg
and load balancing.

Initialise h_nr_runnable to 1 so that only delayed tasks, which
set_delayed() has already accounted for, skip the decrement.

Fixes: 486c3d06b902 ("sched/fair: Avoid transient double accounting for delayed tasks")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 kernel/sched/fair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e65..2d9d3d686261 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8294,7 +8294,7 @@ static void dequeue_hierarchy(struct task_struct *p, int flags)
 	struct sched_entity *se = &p->se;
 	bool task_throttled = flags & DEQUEUE_THROTTLE;
 	int h_nr_idle = task_has_idle_policy(p);
-	int h_nr_runnable = 0;
+	int h_nr_runnable = 1;
 	struct cfs_rq *cfs_rq;
 	bool dequeue = true;
 
-- 
2.43.0

