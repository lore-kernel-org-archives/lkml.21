Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196479;
	b=F+Df0cwm6fqHHZ4CjY50/jDdNK3Fz/ia5SWAiM5T82OGR6y6KPVwUy6dP8KGqUzCQcur
	 xFu2d872NS5F31m0p7z2bq+6XwaePLQZxLjscRfw7PxdoBtTXZHUHMinCzEZJe/JQpHl8
	 2oFYCDFhVMh9Ag15xc/vAfO3koGTdWRmMx0W+yBX+ZaeXJWzTzPfx4cEWDVjCl25XFijg
	 2yJnnB4LPkUZQxmhMMg85TAg7opThLQcnGyfPgELR9o6fPCtE8BTmTMGOKQnB6FgyoIgy
	 FypcBYmQP3OOjyv6YTRnZeHgc05UGKmgThseI1eqQUsVkbToHj1QMw6xzq/VNUIhICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196479;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=gs8qSw3C1sjmMmwwXO9onMLxI2Hd1XZRzEJTd5qBXBs=;
	b=MW1jy4kjlrP6/psmI55wxFkffxVNtDkWaFa2txlS2/+DUqDNPVcocqFkdpUlKoJxrpw+
	 BlUtV6SH9fs09TKmmqBisK1nE4wYCrp+MhTIK/T+WOYdrzNDB4fdEDl8R9E78X8qCnwEe
	 sQz3UBHGBuh3xyWv45CuRb7jRS7dZwgHGtS2EwwcVIf+sGOdlYSevtGcw+IPcM/Quh7gE
	 E04BKuL8J8iEpwe+3/ZNQp4T1Sv4douJ1VPaB6NybCmca7iJAhr1GdWJ1pFSA9aQMO61m
	 m2urrNAoC76tPpOE0/UKY/RrtZnMwNMIpPW51Zb33dUTgq3eX9LHg5CjSv6RECaKgGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hf5OO6rI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30B560A6F60
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hf5OO6rI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6A81F000C0;
	Fri, 20 Nov 2026 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795196479;
	bh=gs8qSw3C1sjmMmwwXO9onMLxI2Hd1XZRzEJTd5qBXBs=;
	h=Date:From:To:Cc:Subject:References;
	b=Hf5OO6rIN6XQn8Fx51bWRjf1lb61Z3UsgNlHejhCfdukNOpdODo4gmIizArnJElO0
	 urgFaJOMwTIV6xGLxgw8Q02jMuZ2a/thvWUqc9ZmWCmMX8C8aSCsJUcA6oipoRu9UB
	 FNaNWjjCvh8Hox6BixkvI64YJqFfOOH/d+72b/5Igt2mJjSgpy+r4BFvyj9q7Xgze4
	 u0IDjKWcy/UAjsJjyLMpI69blCJo/MY6qsBX5Klu7k6qQcDs9dl0uH7JpwWcQ9b81h
	 qUQ4SqO1L39iidpcUUFMAh7G8EHAJHgReuowk7Bt1TGaVjW+2eIu/tRihq4IajmWKa
	 54me1BM0o0fjQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xUSbu-00000004aSH-3fFw;
	Fri, 20 Nov 2026 12:41:18 -0500
Message-ID: <20261120174118.714789139@kernel.org>
User-Agent: quilt/0.69
Date: Fri, 20 Nov 2026 12:39:17 -0500
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wenwu Hou <hwenwur@gmail.com>
Subject: [for-linus][PATCH 25/32] tracing/hwlat: Do the latency calculations in nanoseconds
References: <20261120173852.687189370@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Wenwu Hou <hwenwur@gmail.com>

tr->max_latency is expected to hold nanoseconds: tracing_max_lat_read()
converts it with nsecs_to_usecs() to print the usecs documented in
hwlat_detector.rst, and the other latency tracers store nanoseconds there
too.

Do all the latency calculations in nanoseconds instead, and only convert
the durations to microseconds when recording the hwlat event.

This also makes the backward-clock error paths reachable.
Previously, time_to_us() passed the delta through unsigned div_u64(),
so a negative delta became a positive value after division. These
error paths jumped to out without clearing trace_hwlat_callback_enabled.
Fix this as well.

Link: https://patch.msgid.link/20261116032156.3138060-1-hwenwur@gmail.com
Fixes: e7c15cd8a1133 ("tracing: Added hardware latency tracer")
Fixes: 7b2c86250122d ("tracing: Add NMI tracing in hwlat detector")
Suggested-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Wenwu Hou <hwenwur@gmail.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_hwlat.c | 41 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
index 3fe274b84f1c..5be9031f1ffe 100644
--- a/kernel/trace/trace_hwlat.c
+++ b/kernel/trace/trace_hwlat.c
@@ -203,14 +203,12 @@ static int get_sample(void)
 	time_type start, t1, t2, last_t2;
 	s64 diff, outer_diff, total, last_total = 0;
 	u64 sample = 0;
-	u64 sample_width = READ_ONCE(hwlat_data.sample_width);
+	u64 sample_width = READ_ONCE(hwlat_data.sample_width) * NSEC_PER_USEC;
 	u64 thresh = tracing_thresh;
 	u64 outer_sample = 0;
-	int ret = -1;
+	int ret = 0;
 	unsigned int count = 0;
 
-	do_div(thresh, NSEC_PER_USEC); /* modifies interval value */
-
 	kdata->nmi_total_ts = 0;
 	kdata->nmi_count = 0;
 	/* Make sure NMIs see this first */
@@ -229,28 +227,37 @@ static int get_sample(void)
 
 		if (time_u64(last_t2)) {
 			/* Check the delta from outer loop (t2 to next t1) */
-			outer_diff = time_to_us(time_sub(t1, last_t2));
+			outer_diff = time_sub(t1, last_t2);
 			/* This shouldn't happen */
 			if (outer_diff < 0) {
 				hwlat_err(BANNER "time running backwards\n");
-				goto out;
+				ret = -1;
+				break;
 			}
 			if (outer_diff > outer_sample)
 				outer_sample = outer_diff;
 		}
 		last_t2 = t2;
 
-		total = time_to_us(time_sub(t2, start)); /* sample width */
+		total = time_sub(t2, start); /* sample width */
 
 		/* Check for possible overflows */
 		if (total < last_total) {
 			hwlat_err("Time total overflowed\n");
+			/* Keep ret == 0 to preserve any latencies already detected */
 			break;
 		}
 		last_total = total;
 
 		/* This checks the inner loop (t1 to t2) */
-		diff = time_to_us(time_sub(t2, t1));     /* current diff */
+		diff = time_sub(t2, t1);     /* current diff */
+
+		/* This shouldn't happen: time went backwards between t1 and t2 */
+		if (diff < 0) {
+			hwlat_err(BANNER "time running backwards\n");
+			ret = -1;
+			break;
+		}
 
 		if (diff > thresh || outer_diff > thresh) {
 			if (!count)
@@ -258,12 +265,6 @@ static int get_sample(void)
 			count++;
 		}
 
-		/* This shouldn't happen */
-		if (diff < 0) {
-			hwlat_err(BANNER "time running backwards\n");
-			goto out;
-		}
-
 		if (diff > sample)
 			sample = diff; /* only want highest value */
 
@@ -273,10 +274,11 @@ static int get_sample(void)
 	trace_hwlat_callback_enabled = false;
 	barrier(); /* Make sure nmi_total_ts is no longer updated */
 
-	ret = 0;
+	if (ret)
+		return ret;
 
 	/* If we exceed the threshold value, we have found a hardware latency */
-	if (sample > thresh || outer_sample > thresh) {
+	if (count) {
 		u64 latency;
 
 		ret = 1;
@@ -286,8 +288,8 @@ static int get_sample(void)
 			do_div(kdata->nmi_total_ts, NSEC_PER_USEC);
 
 		s.seqnum = atomic64_inc_return(&hwlat_data.count);
-		s.duration = sample;
-		s.outer_duration = outer_sample;
+		s.duration = time_to_us(sample);
+		s.outer_duration = time_to_us(outer_sample);
 		s.nmi_total_ts = kdata->nmi_total_ts;
 		s.nmi_count = kdata->nmi_count;
 		s.count = count;
@@ -301,8 +303,6 @@ static int get_sample(void)
 			latency_fsnotify(tr);
 		}
 	}
-
-out:
 	return ret;
 }
 
@@ -835,7 +835,6 @@ static int hwlat_tracer_init(struct trace_array *tr)
 	tr->max_latency = 0;
 	save_tracing_thresh = tracing_thresh;
 
-	/* tracing_thresh is in nsecs, we speak in usecs */
 	if (!tracing_thresh)
 		tracing_thresh = last_tracing_thresh;
 
-- 
2.53.0
