Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.247
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795229877;
	b=aJ05bbOiEoULFdu3d9U2cPek/uFWPYEy6cWANP/OgqmCNTg3MaXCbYYmbkPWLJKWtLLZ
	 xXhfWSsVNCfrVnwz3Jl+wMl0itKn4kI/aOJbVFRsCkPx8k8GqTGvApizXvdUdNXq7GTF4
	 eqnFCLU9ElpLHJi3WWdAIaumufWZtBov1E00dJvUhEsGKY4afyi1zsgXYIUWWLBSWZebV
	 1ATyi0YpbjitxbwS9WsP20L8Tvdrpv7GLCq/kLsuJbcss6KHrFCeneTt9e5AcR9ftU5XK
	 iZDMIdtQMEkBRlMc8TeOxKXO186ZTHMtLYZ8QMKd+YiPG/boa6jCY4jEOVAns/hmxVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795229877;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=+ytW70JecivW9nniQ07/FbxwtWJjO6/tJZSQxpUavzE=;
	b=bqT++CavTTuBOGM6FfGUpfD44dr1FJEj4u8kvYQM+5Tj25dElcHt80/EYnsmxm8SJFeJ
	 PHP6k3J4W73eH1jqSfD/ojypFvptklR3l9tRzQmOY4EwQ/NMsk0iLl4WcH0rbN0q3BmR9
	 Vn7/8qRLXAfEYoOvbLjQWPA1lMJNnng+ErO6T46FsgpNrvmVEEGPg6aj3EGyqSUDENA+H
	 bsUg2YI8zPMOFumi9XcardvGV6kkXNg9r0AnRn0nKJZggFFqPspRAwAs5ZSdN/d+H+8to
	 x5A9BW5P7EcxftKKD6WGa2jwY3dz7qdYYSe9yEKWtop+NFjYtktlT6BOO5e3ce1Oe/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D3wk67nN;
	arc=none smtp.remote-ip=91.218.175.247
Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B4D606A698
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42B4D606A698
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D3wk67nN
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2DcJQTyoj98wO8gw84YLwyp/IAgW9hSUdCVpQXtTLkQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795229872; v=1; x=1795834672;
 b=D3wk67nN0pBa2uIL+uTsXoWQ/wdELOK4+M8Yem68Y7Ry/uJE/cAUNdtoXyXHBsUq4xFf/VjS
 YkVjQFWjmELfjjF7yPd/apjfsDOJc9/rlNsX/qXR0dNvmLPX5g3mZ5pMi3hXzuCkZvfqYRWAMcW
 grq493XA+E5DwL/drM/JLr2c=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9d3e195c876aeb31;
	Sat, 21 Nov 2026 02:57:52 +0000
X-Mizu-Trace-ID: 9d3e195c876aeb31
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Fri, 20 Nov 2026 21:57:26 -0500
Subject: [PATCH v3 3/3] sched/fair: Drop the active CPU check from
 unthrottle_offline_cfs_rqs()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-bug-sched-fair-offline-active-v3-3-325e9eefa56d@linux.dev>
References: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
In-Reply-To: <20261120-bug-sched-fair-offline-active-v3-0-325e9eefa56d@linux.dev>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Li kunyu <likunyu@open-hieco.net>, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

Commit af98d8a36a96 ("sched/fair: Fix CPU bandwidth limit bypass during
CPU hotplug") made unthrottle_offline_cfs_rqs() return early for active
CPUs, because every sched domain rebuild took all active CPUs offline
and unthrottled their throttled groups.

Rebuilds now keep active CPUs online, so rq_offline_fair() only runs
for a CPU that has already left cpu_active_mask: sched_cpu_deactivate()
clears it before taking the rq offline, and rq_attach_root() takes only
inactive CPUs offline. The check can no longer be true.

Remove it.

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/fair.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 731d78155e654..e366040f4fb4f 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -7859,10 +7859,6 @@ static void __maybe_unused unthrottle_offline_cfs_rqs(struct rq *rq)
 
 	lockdep_assert_rq_held(rq);
 
-	// Do not unthrottle for an active CPU
-	if (cpumask_test_cpu(cpu_of(rq), cpu_active_mask))
-		return;
-
 	/*
 	 * The rq clock has already been updated in the
 	 * set_rq_offline(), so we should skip updating

-- 
2.43.0

