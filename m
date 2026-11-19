Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795049868;
	b=zDQsa6irNfb58mOs/eWDQpYDb637ccDPTtk60wQVSuK8x9THRGCmMh96L4eIGlceQznh
	 DrSCQDdKKF1KknTcdeGscqAuaaXWluNp4MPNVtWR03LWqLn4Fll19OYdfeXBjiIjf6n7k
	 981vdLtZXF24Wm5v0DQY2nqrRV0Nb1tu/kS+av6s1ElijKuzOO4R7/vehuQQYxl1+qkzN
	 i+TWUs1NZh9zIINDp0pB9b7vyZ+At09MizyL1yWs8VxSgq0JX6OSLwpvsJbloExi1DLw6
	 c3h2OjOQVv+0JK8VeOsA0b70RmvyJBIqupNrt8YL9NhQ2MoJIc4eKCAc6SX0e0xoLQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795049868;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=BdRhV4HysM2lLbNiFKSUvryFqdyrG2j8PAWpb5YAEx0=;
	b=jGldEBtr/jw5yZ74dQaY/XnTOsGbaVaWZ6YtEkFMOhSB5k6y1DEw3aMceyZYfl131FJm
	 KiE8z8CmJrxr4ai41HJRMD017cJYxVQoYT/62zhtLZLwU0h3JtczpajYQRuKTtygi//H0
	 K37osvYwM9Sewl9mKlrPI94DbWzKR4NkoA+LIu1vAezKl/3VP1wdwhRdnIQsUY8O9i4ch
	 Ldky1+e3zywbUqPgNQJS1lfc0LyspT7lVjPUIf7MmRRKB0kp+0ctbDLPTsyE9sHQBqwWj
	 VjdjVpP0geBEfDgjWZQhNsgnhBLzLcQS40V5q9N0tPwowoVnYwoldyvEgREWz8kwB4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ud50sL1y;
	arc=none smtp.remote-ip=91.218.175.171
Received: from mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73436606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73436606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ud50sL1y
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qLIXZ0CsPn2DOaTNT4XL/ITjjPGFcuW4mu+s83U3hTM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795049865; v=1; x=1795654665;
 b=ud50sL1yp/TGt4TSoT9NsoR6JT6hc+sJClfacYVMZcL+R16OnoinA00GXhn4Z1L7GPI+mdHL
 h+QN2jAIpuDD193bOFLrj13H7HVrPULSa89p62rjkiNEg2MuMl1a+s7reKI6zWQMk5MFeU3mUhv
 rTubPhAw5J0/B3dN7XQXBtcA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 57b5dff798120b9d;
	Thu, 19 Nov 2026 00:57:45 +0000
X-Mizu-Trace-ID: 57b5dff798120b9d
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Wed, 18 Nov 2026 19:57:23 -0500
Subject: [PATCH v2 3/3] sched/fair: Avoid re-syncing runtime_enabled on
 root domain changes
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
Message-Id: <20261118-bug-sched-fair-offline-active-v2-3-b6ede596c6a6@linux.dev>
References: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev>
In-Reply-To: <20261118-bug-sched-fair-offline-active-v2-0-b6ede596c6a6@linux.dev>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

rq_online_fair() calls update_runtime_enabled(), which walks every task
group and takes each group's cfs_bandwidth lock to copy its quota state
into the CPU's cfs_rq. A sched domain rebuild reaches it for every
active CPU through rq_attach_root(), with the rq lock held and
interrupts disabled.

The walk is only needed when the CPU comes up. While a CPU is online,
tg_set_cfs_bandwidth() updates runtime_enabled on it under the rq lock,
and it holds cpus_read_lock() so it cannot miss a CPU that is coming up.

Call update_runtime_enabled() only when the CPU comes up.

With 4000 cpu cgroups on a 32-CPU VM booted with rt_group_sched=0,
switching a 4-CPU cpuset to a partition root and offlining or onlining
one CPU take (median of 20 partition switches and 16 hotplug operations):

  operation         before (ms)  after (ms)  change
  partition root           8.35        1.20    -86%
  cpu offline             33.91       16.49    -51%
  cpu online              31.02       12.87    -59%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 kernel/sched/fair.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 1b38c4c47b656..e42c70e6ebeff 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15082,7 +15082,9 @@ static void rq_online_fair(struct rq *rq, bool hotplug)
 {
 	update_sysctl();
 
-	update_runtime_enabled(rq);
+	/* tg_set_cfs_bandwidth() keeps an online CPU in sync */
+	if (hotplug)
+		update_runtime_enabled(rq);
 }
 
 static void rq_offline_fair(struct rq *rq, bool hotplug)

-- 
2.43.0

