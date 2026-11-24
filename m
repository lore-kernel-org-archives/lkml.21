Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795511597;
	b=y9afFouwe5W08R+VNN0AmW6/iVnsJvFxRoL3mQF/FbYFjYRlXE+e3Ulf+1Q6y+wcYw+I
	 XjDxzb2xcwACAPuBpDGK2t5qCVirpK+Z8Rm2400fwoXRL89k8A5N/4WcTW/OGVt3ZZcmw
	 37ELfnyAKZ9SiM3ZuS9oqIfUqEEuOutDpdGQfD4Nk5FagkiBY2KCtzlsI2WEtzEibayVY
	 Jb0f926+U/nhzA3jWl7By/rrjYXwrZTV/+S8/J95EiArsxG7OLX5urIhXLxBgel8sEyHw
	 iUsp44RHre2oteRtT2CzfCn8Six+ewergIQ3NaIBHk88ANNZkceLbOlRSTk+GlWfRIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511597;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Content-Type;
	bh=tsR1VJt76vdIL7T8X+CNqg3X/XOybnNe8YxQSkiE9cI=;
	b=1d6wM1ziu2oI8Ja3ZMHWlNA/6N4ffK0tL07ReSkdguvmn7MQIe5PdTp01R2ajhby/sqv
	 UiUEFl6IJmsbaUVTWO8+/RN50tN/6WIbGzt53TwVr9n3V8aUSgI7jp+LaZU4XUDPYKHnJ
	 WxYwRMEAciAfwf2lWKJoRPwWIbo9vU+eL6XG/EDvRSRwGzi2sZ4PFPNxeDE/m72DQOlw7
	 2LfqjVQuLAQDObAnUzGzC5LB+SjB/Ywd8Vwx1QUDs0L5imLPNzhKbUlY9ttHxMg9NhkGW
	 7FlkNhZt/HSB2CLKn+PPzQjeg4sW7NBW9kRG0qjWHajy5CccArTCnehmvQav9gCjQnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQQLn7Qk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8A606A33D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D8A606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WQQLn7Qk
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so6807212a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795511595; cv=none;
        d=google.com; s=arc-20260327;
        b=eLKkMfooEe5ufGUU3HU3ctvZ0k6YGcVGf0tYG1c6E5n6YgwIebYdLjuyl6sD1FyhkE
         icM9+1/vgMAm27+0AN76rphNCNy/3QN6zZ3lgOQD59rjuTc+ZVykmab1mc0Fj3UKvOau
         lcrly+k31beNxFgTP1oPOvG9cmZzZe55qEi3REWWRTvXPgS3HPFEYUO+KA98CWWEs3XS
         4W/OXNe/cVOEg64a9egQRA/468p0ObDu70ImYrOhyhd5hErevb9n4c9mxrBlsU7f3ytw
         JfxoNaaXXe8youh0XjXtX+O7tNkk5gDiEJj8HrqiqLBaUS6k4/XbnGclSubzUvc+TyKC
         1cBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=tsR1VJt76vdIL7T8X+CNqg3X/XOybnNe8YxQSkiE9cI=;
        fh=pnLUUoQvCBzGShmQpxXw1J6gWHZ91CGhin1IEBdwYeY=;
        b=bwkbpHwdhrWiGxqyX26x+Bsh//Erq5wwyyasex0jlejRl514yvUUBvA1Ol4xALctEw
         yK+WO2d5xTJLdSqOrlyHx9TbHyjgmDPWC0pOH5xgtqOTc5SaZ22uBl86NflEA89rMbNG
         cM5zsPXaol4QlUGXUK2a9ZcNDbjbWhjT0iK9AHRzAQlY5IKF638zCL4wRHJQRMMoSK+W
         pUYLbVW8hAF/H4w4vCGOG3mItyO5Dh6ys2XVfQ9AvmCqer63YJ6216Wlh7e9YfG5+XDX
         bcdzsoqGLlhLR2Jz9AU5om/cBK1HiKf9tPJtYFLQm+09n4ypuaf2q4QPQ47k+CMBy+jW
         5tDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795511595; x=1796116395; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tsR1VJt76vdIL7T8X+CNqg3X/XOybnNe8YxQSkiE9cI=;
        b=WQQLn7Qk4whspfyq0M8/PdsrwRX+uUjJlCKmNhoUc9isSo1s+cBY4q52rI3skIv94X
         Hcaot+xAY3shC1n5h3Ph/tGvq5Pf7qMc72GGeG3FF1Yl/hWEBCoxQwbBcHFcR+YsYaES
         CUTbERogvYIUaSV42BpUHU7jYtBeaX06eJPlbXW49X/RFoVYVRqja4ex6XzQfZ98q3n7
         bYip5R3+c+NfU2E1VPooz/jVzoa4y2B0b+MN1DBYOOLcUrIBqHmAGPxBBixM42iRKS2F
         JsGJMGGveis8nyVVckYe/xIjH39tCIjWpW7KPnJJtRldSNgzxAux0su6tbGRHfdZ4Cj8
         tCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795511595; x=1796116395;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsR1VJt76vdIL7T8X+CNqg3X/XOybnNe8YxQSkiE9cI=;
        b=aFmItJBun/7wIC4aXZNR2P8Z4m4USKexQ3dAnrrETxOLjK9oVKjUiC8JDWXQ998+Sv
         LIt/oXVrOY4ce+ScDQ2mr/DaW7Hh3B66OMZvsWjfB0+A21+tX/tK5CpQdmxqcaatA7dQ
         YwnCHo79tcb9T3skut3RvfwMF0P4FXHFqbDsqPB0nI/2kD2kbQduVv2oJugwRZc+0F3/
         rGzL3OTrEqGBlAXDyT1s6RfmHeHmxRpowuTbsNnlebe5Rz41LQnUO4w/oUzrFJxEfare
         5K8tQHkJ5J9z4aBDPtRDHFQeL1dCREVXRlKuleREYxkuvnkOZn4mTucLTi7/7yogEizQ
         9+Mw==
X-Forwarded-Encrypted: i=1; AL+hErEjX6nKxm3Pz+sPJ4vJ0MA9mjOy2ZmD2COdXcGybivym4jPag8mbxFx5IdpXfky62CjCRUzWqVNZ0mChIE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uzwa1xuEhwvR1Z/OKsJdwxkPkcMDJoKNldF/96sUmxsn2tjsz
	CfBzs6zB5Yc2sc0uIiuk7zIesIpDaczyGah9BvN7OXNtfbYTM2cEzxmjDyJpbxD6czP7LWxA/g/
	6CLmZWh42vuFdnJKSsufWtPEOEX4xso69d/SezvE1XQ==
X-Gm-Gg: AZFdTZeaQqtQOdQou+8BZerqpTG9CXXit1EQS8mkYZ/fpN04Ti78ynSjdV98SO7oTQt
	W2TETHkUjyHWBdS6j3y0ncs7ayZa9KCp7xvf92EOOVoH2fH2Wma3FJhXw9tsPTpLjBk17XsMLia
	iMOW7+nj97BoLlwLmKJYFowAz2VVJS4vBHFClygBAOb180MKQLsmvAuxwv3EUX8tIE9ApJi/WhJ
	yCQvHl2IRAb04OHhH+yUYd/6wmFe/5s+DjcZD+xQMdeWTeUG8nRT//pSoHcTddiX9YPTZEeEgoL
	aP7WfkJJwJ5XmIxRZ1hX+wPrh3EpVVb4Hkb7WeDX/Hk0EMMFKJLGE32g3rgrHNjVh9B4oc5TB0X
	umKv4u37p07/hTSC4DtjRvd13OdFM0Oytm2qXFkyvRrt2fd5wiEZXscprKjgM3MpCbPpu5K4VLm
	SzPtYY+03HW9BaoKmtEenBD3krVZ6kwe2ufdAJ0A80reqk6+Ju
X-Received: by 2002:a05:6402:51d2:b0:6b4:583b:daf5 with SMTP id
 4fb4d7f45d1cf-6ba37ea1489mr10477145a12.43.1795511595247; Tue, 24 Nov 2026
 01:13:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Herman Semenoff <germanaizek0@gmail.com>
Date: Tue, 24 Nov 2026 12:13:32 +0300
X-Gm-Features: Aa3M54pCuXq-v01q8N-WuaE1LM3gsn-4aAd6B7y1XS-9Z8iwG05nAaEc0uY5VVk
Message-ID: <CAMnMt5Zoj5z1nqcPCp7na72se9f19Ch7SaXBBtzJ_kp49FMLTQ@mail.gmail.com>
Subject: [PATCH] sched/numa: Fix scan period adaptation and candidate node distance
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, mgorman@suse.de, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, vschneid@redhat.com, 
	kprateek.nayak@amd.com, riel@surriel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 4968f8e10002092fd82056772e5a8fc8927a3ff4 Mon Sep 17 00:00:00 2001
From: Herman Semenoff <GermanAizek@yandex.ru>
Date: Tue, 24 Nov 2026 12:02:35 +0300
Subject: [PATCH] sched/numa: Fix scan period adaptation and candidate
node distance

In update_task_scan_period(), commit 37ec97deb3a8 ("sched/numa: Slow down
scan rate if shared faults dominate") intended to increase the scan
period when either memory is already predominantly local or when accesses
are shared across tasks, while accelerating scanning when private faults
occur on remote memory pages

However, the implementation suffered from several severe inversions:

1. ps_ratio (private / (private + shared)) and lr_ratio (local /
   (local + remote)) were transposed in the conditional branches. The
   first branch checked ps_ratio >= NUMA_PERIOD_THRESHOLD under the
   comment "Most memory accesses are local", causing any task with
   predominantly private memory residing on a remote NUMA node to slow
   down scanning instead of accelerating it

2. The shared-fault check tested lr_ratio >= NUMA_PERIOD_THRESHOLD
   instead of checking whether shared accesses dominate

3. In the fallback branch intended to speed up scanning, computing
   diff = -(NUMA_PERIOD_THRESHOLD - max(lr_ratio, ps_ratio)) * period_slot
   resulted in a positive diff whenever ps_ratio exceeded the threshold,
   further slowing down scanning instead of reducing the period

4. When local + remote == 0 or private + shared == 0, divisions by zero
   could occur

In addition, in task_numa_migrate(), the candidate node loop over
for_each_node_state(nid, N_CPU) computed dist = node_distance(env.src_nid,
env.dst_nid) before setting env.dst_nid = nid, querying distance to the
previous node instead of the candidate node nid.

Fix both issues by:
- Correctly checking lr_ratio >= NUMA_PERIOD_THRESHOLD to slow down
  scanning when memory is predominantly local
- Checking ps_ratio <= (NUMA_PERIOD_SLOTS - NUMA_PERIOD_THRESHOLD) to
  slow down scanning when memory accesses are predominantly shared
- Accelerating scanning via diff = -(NUMA_PERIOD_THRESHOLD - lr_ratio) *
  period_slot when private memory is remote
- Guarding against zero fault totals
- Using node_distance(env.src_nid, nid) in task_numa_migrate()

Benchmark results on server motherboard LGA 2011-3 Lenovo RD450X (2x
Intel Xeon E5-2699 v3 (Haswell), 72 CPUs,
2 NUMA nodes, SLIT distance 10 / 21):
  - test 'perf bench numa mem' (36 threads, 2 nodes):
    Throughput: 16.165 GB/sec -> 27.247 GB/sec (+68.5%)
    Latency:    2.227 ns/byte -> 1.321 ns/byte (-40.6%)
  - test 'perf bench sched messaging':
    No regression (1.783s vs 1.802s)

Signed-off-by: Herman Semenoff <GermanAizek@yandex.ru>
Signed-off-by: Herman Semenoff <GermanAizek@aizekgroup.ru>
---
 kernel/sched/fair.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 69145dda0df5..6d77ea36a416 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -3371,7 +3371,7 @@ static int task_numa_migrate(struct task_struct *p)
  if (nid == env.src_nid || nid == p->numa_preferred_nid)
  continue;

- dist = node_distance(env.src_nid, env.dst_nid);
+ dist = node_distance(env.src_nid, nid);
  if (sched_numa_topology_type == NUMA_BACKPLANE &&
  dist != env.dist) {
  taskweight = task_weight(p, env.src_nid, dist);
@@ -3514,7 +3514,8 @@ static void update_task_scan_period(struct task_struct *p,
  * migration then it implies we are migrating too quickly or the local
  * node is overloaded. In either case, scan slower
  */
- if (local + shared == 0 || p->numa_faults_locality[2]) {
+ if (local + remote == 0 || private + shared == 0 ||
+    local + shared == 0 || p->numa_faults_locality[2]) {
  p->numa_scan_period = min(p->numa_scan_period_max,
  p->numa_scan_period << 1);

@@ -3534,22 +3535,24 @@ static void update_task_scan_period(struct
task_struct *p,
  lr_ratio = (local * NUMA_PERIOD_SLOTS) / (local + remote);
  ps_ratio = (private * NUMA_PERIOD_SLOTS) / (private + shared);

- if (ps_ratio >= NUMA_PERIOD_THRESHOLD) {
+ if (lr_ratio >= NUMA_PERIOD_THRESHOLD) {
  /*
  * Most memory accesses are local. There is no need to
  * do fast NUMA scanning, since memory is already local.
  */
- int slot = ps_ratio - NUMA_PERIOD_THRESHOLD;
+ int slot = lr_ratio - NUMA_PERIOD_THRESHOLD;
+
  if (!slot)
  slot = 1;
  diff = slot * period_slot;
- } else if (lr_ratio >= NUMA_PERIOD_THRESHOLD) {
+ } else if (ps_ratio <= (NUMA_PERIOD_SLOTS - NUMA_PERIOD_THRESHOLD)) {
  /*
  * Most memory accesses are shared with other tasks.
  * There is no point in continuing fast NUMA scanning,
  * since other tasks may just move the memory elsewhere.
  */
- int slot = lr_ratio - NUMA_PERIOD_THRESHOLD;
+ int slot = (NUMA_PERIOD_SLOTS - NUMA_PERIOD_THRESHOLD) - ps_ratio;
+
  if (!slot)
  slot = 1;
  diff = slot * period_slot;
@@ -3559,8 +3562,7 @@ static void update_task_scan_period(struct task_struct *p,
  * yet they are not on the local NUMA node. Speed up
  * NUMA scanning to get the memory moved over.
  */
- int ratio = max(lr_ratio, ps_ratio);
- diff = -(NUMA_PERIOD_THRESHOLD - ratio) * period_slot;
+ diff = -(NUMA_PERIOD_THRESHOLD - lr_ratio) * period_slot;
  }

  p->numa_scan_period = clamp(p->numa_scan_period + diff,
-- 
2.55.0
