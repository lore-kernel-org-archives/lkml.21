Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521643;
	b=JDeCO9IZEipfFw7XX3jo1pkgORsFB8g+nlaPT+Ndc/QH0Mu9MsAVUvxHFXbcxjK52nXg
	 9I0DLfpC56kbXyiFhKZQ/X902X0CuzV0sAS6wwhWidmubqexQ+w6kLMqYRoBviSVUlm9Z
	 SlPt9Atx4we7SK7vNS8MhFQvlZVWe6aEAy2ThjgGxlWiqDLvfpw2qoJYV73z921Wr0eZS
	 0lOmzfa2rdygTP1URMkSnxWbycFhl6mJQsMyvsdXtULydEkAsFJEHy4+0faegbUOL115m
	 39pT0RID+4RJodFxWWk91K0SJ+8Z6678rvFQtihvaT84mkqU+80tRvbSS9wXaTRvRoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521643;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=5AW2nipPEcXSmS9V+T3J/dS9piHtleVZliKtt/7SoWY=;
	b=AWYVccj9MCDIC85FebNUEbf8eSP/ST3HkXx+fBrnQqEpQdiy2TQOWmgGZpT9qB2K1Fwf
	 M0oOff0Sysyug7qIZ/s8gjzJLTnwPCcyNs9kkJcIiVwGyl6em+b2YuZjbDX6nt/kkCE+L
	 T+hRla3rODNKLJR9Bvbgvfnrt2AOBkE3Mi8NuIcVvP7k21dACEM3fLauUzdevYx28nw47
	 bPOS6ua7rG4VinVI6m/YXmuwXNqJppFuUK0ZvfOnlzCkViFms1jAjRpvxjkm8nCuJJ0v4
	 G28ZOavQjl1Tap+VFJ1RlhCgGRg6eT0RpuHuVqa01qp5lJ/bLgPgLeOcg4izf3hwLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eJuqpyR4;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E345606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E345606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=eJuqpyR4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17FC4339;
	Tue, 24 Nov 2026 04:00:39 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62A853F86F;
	Tue, 24 Nov 2026 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795521642; bh=hUx5iWGPxemOHLjtDseDN4hRI9gZTNF4o/86bVlCibE=;
	h=From:Date:Subject:To:Cc:From;
	b=eJuqpyR455142Sz/EpRwc+sVwehwmL2eNwg1JCAkkxha1cvwUWphVSWlo3xs2m+jP
	 UwqcImt+sbaxy4GWwLxkwJGqxHvUZBdhiOpJDTUraLFmO+Dg4xV6O6RNvEPCNhsiYo
	 EAmLwS0eHHNrwpRh3AdwHc8g6xAQkheXE+SgCL+k=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 24 Nov 2026 12:00:25 +0000
Subject: [PATCH] coresight: perf: End AUX output when an event is throttled
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
Message-Id: <20261124-arm_cs_fix_throttling_oops-v1-1-3ad1dfad0159@arm.com>
X-B4-Tracking: v=1; b=H4sIAFh8BWsC/x3MSQqAMAxA0atI1hbaOiBeRaQ4RA1oK0kRQby7x
 eWDz39AkAkF2uwBxouEgk8weQbTNvgVFc3JYLWtjbGlGvhwk7iFbhc3DjHu5FcXwinKlFpXBY6
 6aQpIg5MxZf+869/3A2noptVsAAAA
X-Change-ID: 20261124-arm_cs_fix_throttling_oops-140053eb0883
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Vlad Poenaru <vlad.wing@gmail.com>, Amir Ayupov <aaupov@fb.com>, 
 Suyash Mahar <smahar@meta.com>, Song Liu <song@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795521640; l=5856;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=hUx5iWGPxemOHLjtDseDN4hRI9gZTNF4o/86bVlCibE=;
 b=GXZh30aCOivjBHKOKp57f9FmHnXlJXGBNgeR3eySWnljlJTaZT7KdRlI771cjTUVnG+qH8xAu
 +lFUlrLLn2tBE+yumLSuHaDHrhN76u3rI+PTR/FVaclklazufkDCRaC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

Perf throttles a group by calling each event's PMU stop callback with
flags set to zero. On a CPU with a trace path, ETM stops tracing and
leaves the AUX transaction open because PERF_EF_UPDATE is clear. When
perf unthrottles the event, perf_aux_output_begin() warns because
aux_nest is still set.

  [  181.161897] ------------[ cut here ]------------
  [  181.161906] WARNING: kernel/events/ring_buffer.c:415 at perf_aux_output_begin+0x1dc/0x1f0, CPU#0:2
  [  181.234120] arm-scmi arm-scmi.1.auto: timed out in resp(caller: do_xfer+0x1a0/0x558)
  [  181.234223] cpufreq: __target_index: Failed to change cpu frequency: -110
  [  181.286675] Modules linked in: panfrost tda9950 hdlcd tda998x drm_shmem_helper drm_client_lib cect
  [  181.314139] CPU: 0 UID: 0 PID: 352 Comm: perf Not tainted 7.1.0-rc1-00058-gdca922e019dd-dirty #11
  [  181.323915] Hardware name: ARM LTD ARM Juno Development Platform/ARM Juno Development Platform, B5
  [  181.334732] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  [  181.341721] pc : perf_aux_output_begin+0x1dc/0x1f0
  [  181.346547] lr : perf_aux_output_begin+0x9c/0x1f0
  [  181.351280] sp : ffff800080003be0
  [  181.354606] x29: ffff800080003be0 x28: ffff0008023fc000 x27: ffff4b45d287f000
  [  181.361789] x26: ffff0009764787a8 x25: 0000000000000000 x24: ffff00080dc99710
  [  181.368970] x23: ffffb4c334553000 x22: 0000000000000001 x21: ffff00080dc99710
  [  181.376151] x20: ffff0009764787a8 x19: ffff000801cc6000 x18: 00000000ffffffff
  [  181.383332] x17: 0000000000000000 x16: ffffb4c3a118c998 x15: 0000000000000000
  [  181.390512] x14: 00003d0900000000 x13: 00000001ffff006e x12: 696765625f747570
  [  181.397692] x11: ffffb4c3a52758d8 x10: 0000000000000108 x9 : ffffb4c3a117f620
  [  181.404873] x8 : ffff800080003a58 x7 : ffff000808de4000 x6 : 00000000000fffff
  [  181.412053] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000
  [  181.419232] x2 : 0000000000000007 x1 : 0000000000000000 x0 : 0000000000000007
  [  181.426411] Call trace:
  [  181.428868]  perf_aux_output_begin+0x1dc/0x1f0 (P)
  [  181.433692]  etm_event_start+0xdc/0x290 [coresight]
  [  181.438665]  perf_event_unthrottle+0x70/0xa8
  [  181.442964]  perf_event_unthrottle_group+0x40/0x170
  [  181.447871]  perf_adjust_freq_unthr_events+0x178/0x1a8
  [  181.453038]  perf_adjust_freq_unthr_context+0x74/0xf8
  [  181.458120]  perf_event_task_tick+0xa8/0x290
  [  181.462418]  sched_tick+0x144/0x2c8
  [  181.465937]  update_process_times+0xc0/0x198

End the AUX transaction with size zero on a throttling stop so
unthrottling can acquire a fresh handle. Collect trace data only when
PERF_EF_UPDATE is set.

Check AUX handle ownership before updating the buffer or ending AUX
output. Drop the post-update check because the full stop runs with
local IRQs disabled, which prevents the TRBE IRQ from closing the
handle during the stop.

This patch is limited to fixing the event throttling case. Other issues,
such as CPUs without a trace path and pending TRBE IRQs during sink
teardown, will be addressed by the following patch series [1][2].

[1] https://lore.kernel.org/linux-arm-kernel/20260915-arm_cs_support_aux_sample-v1-6-35cf6f297d20@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com/

Fixes: 9734e25fbf5a ("perf: Fix the throttle logic for a group")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 34 +++++++-----------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 909bfd5960331d44547a028fde336f7819488a1a..e506116723c4ed723d66bc721021718b5d176117 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -698,7 +698,7 @@ static void etm_event_pause(struct coresight_path *path,
 static void etm_event_stop(struct perf_event *event, int mode)
 {
 	int cpu = smp_processor_id();
-	unsigned long size;
+	unsigned long size = 0;
 	struct coresight_device *source, *sink;
 	struct etm_ctxt *ctxt = this_cpu_ptr(&etm_ctxt);
 	struct perf_output_handle *handle = &ctxt->handle;
@@ -757,33 +757,19 @@ static void etm_event_stop(struct perf_event *event, int mode)
 	 * handle due to lack of buffer space), we don't
 	 * have to do anything here.
 	 */
-	if (handle->event && (mode & PERF_EF_UPDATE)) {
-		if (WARN_ON_ONCE(handle->event != event))
-			return;
+	if (!handle->event || WARN_ON_ONCE(handle->event != event))
+		goto out;
 
+	if (mode & PERF_EF_UPDATE) {
 		/* update trace information */
-		if (!sink_ops(sink)->update_buffer)
-			return;
-
-		size = sink_ops(sink)->update_buffer(sink, handle,
-					      event_data->snk_config);
-		/*
-		 * Make sure the handle is still valid as the
-		 * sink could have closed it from an IRQ.
-		 * The sink driver must handle the race with
-		 * update_buffer() and IRQ. Thus either we
-		 * should get a valid handle and valid size
-		 * (which may be 0).
-		 *
-		 * But we should never get a non-zero size with
-		 * an invalid handle.
-		 */
-		if (READ_ONCE(handle->event))
-			perf_aux_output_end(handle, size);
-		else
-			WARN_ON(size);
+		if (sink_ops(sink)->update_buffer)
+			size = sink_ops(sink)->update_buffer(sink, handle,
+							     event_data->snk_config);
 	}
 
+	perf_aux_output_end(handle, size);
+
+out:
 	/* Disabling the path make its elements available to other sessions */
 	coresight_disable_path(path);
 }

---
base-commit: 8e3ac058be1b613aeabcb7ce18c142e4603cc5dd
change-id: 20261124-arm_cs_fix_throttling_oops-140053eb0883

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

