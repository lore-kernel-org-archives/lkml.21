Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612742;
	b=DH1+OPZsm44x9PK8ljIFLPPpB/8+4AOfn9iVTPqXngkuCGSZFTEVVXsUrS+Dzt3UvczF
	 bWRjPROCAMwBK8Z08qbrZ59DUuK9v1qrk+zFGKvEgrAjD7Ch3R5SbcRX2Va2c6UqYaOks
	 MXVhsk6Ye04iA6lNzY1LXAntFvI3PuHALiH2QwhiFfSsfJGQwX/zf2Z2M68eq89jiNURO
	 JBG6CirlzFvUWd0FFNGaN3a4Yt62Uk4DU0o4JGOSCymFc+I2VUasEyMReA2x+CwWSGqSy
	 Q6t4nVA1rSa0WSrRjy2T/ElSah2j4a2VFzdXEWLC6ggn1hzDL0ZV4LfVP/WI6O8/CPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612742;
	h=DMARC-Filter:DKIM-Signature:Date:Mime-Version:
	 Content-Transfer-Encoding:X-Original-From:To:Cc:From:X-Mailer:
	 Content-Type:Subject:Message-Id:X-Lms-Return-Path;
	bh=sTebTr/mmMnUDFvs2dZ6oTftfFU6qOhvuToUBdTNGdY=;
	b=4IT9DP6ZCmbbReb3FtPidZhHsOlYs8C2aVLpzywopN9tLho6U0OBe3j2+zGawRNmh9O4
	 ccVouTsTezm4ghlCex5bCAGhmAPg2wBVHkyGmPqgbFGmoRiFKhNW6phrzFoQb37oe9z6q
	 5vdS6zZ90xI551UUt2KD5J43m71bPxeb+qXw87KLK3rlC148s8HWUw1nq0tuqf51X0pXw
	 9L2XeuFhvISu/y6cRWta6sgvVDOIph9KO5tD3UGYrxWZaoMg00UweJq8hqP7JgScmjYL4
	 A2C7KsrqKSeBPI+q04FoZyCce0xIfxi2pHQzZkB9O/e8EgMWb9MNksgzjPyFUx4UDtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=pm61aRt0;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810FA606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810FA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=pm61aRt0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795612735; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=sTebTr/mmMnUDFvs2dZ6oTftfFU6qOhvuToUBdTNGdY=;
 b=pm61aRt0qiI7tDeXc1rE2ZlHm57DzSvsuJhh+osv2zNGrVLHqnLLMi3V522eNoc6K3Xwi5
 A370t584LBnsXmQxeST/J+eHJOiJ12flPHG8pkmXkdx05qugzd8NlTZgix7alCiXZGKT0A
 pt7NXp2r1zZvI0N7UKDTK5vlJ929GpmlKfpOjnDXAdz6XSnUBDyREa3PjU2AkirTsQpM2m
 Fjr2C8nKzS+gIIcbKZDnJ98TbpntUzUWARKv7X/AFo+V8FRii9UssPpzQtsK546Rj5fPow
 IQUJE/wHIsow0OPw5lfWXu8+PrFHhYdaeGc6/QPPiaiceHL7awguzWuSamMz2Q==
Date: Wed, 25 Nov 2026 21:18:37 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Chuyi Zhou <zhouchuyi@bytedance.com>
To: <tj@kernel.org>, <jiangshanlai@gmail.com>, <leitao@debian.org>
Cc: <linux-kernel@vger.kernel.org>, "Chuyi Zhou" <zhouchuyi@bytedance.com>
From: "Chuyi Zhou" <zhouchuyi@bytedance.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Subject: [PATCH] workqueue: Use a single latency array in test_workqueue
Message-Id: <20261125131837.1602218-1-zhouchuyi@bytedance.com>
X-Lms-Return-Path: <lba+26b06e03d+8d0535+vger.kernel.org+zhouchuyi@bytedance.com>

run_bench() allocates space for all latency samples in all_latencies
and again in per-thread arrays. After stopping the throughput timer, it
copies the per-thread samples into all_latencies and sorts the array
to compute percentiles.

Give each kthread a disjoint range of all_latencies. The threads write
their samples directly into the array that run_bench() sorts after
they have stopped. Use size_mul() for the total sample count so that
the allocation covers all ranges even on 32-bit systems.

With 256 threads and 50,000 samples per thread, this removes 256
allocations per affinity scope, halves the requested sample storage
from 195.31 MiB to 97.66 MiB and avoids copying 102,400,000 bytes.

Signed-off-by: Chuyi Zhou <zhouchuyi@bytedance.com>
---
 lib/test_workqueue.c | 30 ++++--------------------------
 1 file changed, 4 insertions(+), 26 deletions(-)

diff --git a/lib/test_workqueue.c b/lib/test_workqueue.c
index 2bdfcbbcabb4..015d304c938a 100644
--- a/lib/test_workqueue.c
+++ b/lib/test_workqueue.c
@@ -142,7 +142,7 @@ static int __init run_bench(int n_threads, const char *scope, const char *label)
 	struct thread_ctx *ctxs;
 	u64 *all_latencies;
 	ktime_t start, end;
-	int cpu, i, j, ret;
+	int cpu, i, ret;
 	s64 elapsed_us;
 
 	ret = set_affn_scope(scope);
@@ -159,7 +159,7 @@ static int __init run_bench(int n_threads, const char *scope, const char *label)
 		return -ENOMEM;
 	}
 
-	total_items = (unsigned long)n_threads * wq_items;
+	total_items = size_mul(n_threads, wq_items);
 	all_latencies = kvmalloc_array(total_items, sizeof(u64), GFP_KERNEL);
 	if (!all_latencies) {
 		kfree(tasks);
@@ -167,20 +167,6 @@ static int __init run_bench(int n_threads, const char *scope, const char *label)
 		return -ENOMEM;
 	}
 
-	/* Allocate per-thread latency arrays */
-	for (i = 0; i < n_threads; i++) {
-		ctxs[i].latencies = kvmalloc_array(wq_items, sizeof(u64),
-						   GFP_KERNEL);
-		if (!ctxs[i].latencies) {
-			while (--i >= 0)
-				kvfree(ctxs[i].latencies);
-			kvfree(all_latencies);
-			kfree(tasks);
-			kfree(ctxs);
-			return -ENOMEM;
-		}
-	}
-
 	atomic_set(&threads_done, n_threads);
 	reinit_completion(&all_done_comp);
 	reinit_completion(&start_comp);
@@ -193,6 +179,8 @@ static int __init run_bench(int n_threads, const char *scope, const char *label)
 
 		ctxs[i].cpu = cpu;
 		ctxs[i].items = wq_items;
+		/* Each thread fills its own slice for the final in-place sort. */
+		ctxs[i].latencies = &all_latencies[(size_t)i * wq_items];
 		init_completion(&ctxs[i].work_done);
 
 		tasks[i] = kthread_create(bench_kthread_fn, &ctxs[i],
@@ -230,14 +218,6 @@ static int __init run_bench(int n_threads, const char *scope, const char *label)
 	end = ktime_get();
 	elapsed_us = ktime_us_delta(end, start);
 
-	/* Merge all per-thread latencies and sort for percentile calculation */
-	j = 0;
-	for (i = 0; i < n_threads; i++) {
-		memcpy(&all_latencies[j], ctxs[i].latencies,
-		       wq_items * sizeof(u64));
-		j += wq_items;
-	}
-
 	sort(all_latencies, total_items, sizeof(u64), cmp_u64, NULL);
 
 	pr_info("test_workqueue:   %-16s %llu items/sec\tp50=%llu\tp90=%llu\tp95=%llu ns\n",
@@ -249,8 +229,6 @@ static int __init run_bench(int n_threads, const char *scope, const char *label)
 
 	ret = 0;
 out_free:
-	for (i = 0; i < n_threads; i++)
-		kvfree(ctxs[i].latencies);
 	kvfree(all_latencies);
 	kfree(tasks);
 	kfree(ctxs);
-- 
2.20.1
