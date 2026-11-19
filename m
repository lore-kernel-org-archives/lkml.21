Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.71.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795115454;
	b=mpl2a1f2YyoexpbpRvqWtyzIXUyVD4SpWIJuOCn670ArcmCwPmPYHls2bjwqbh8XWHXR
	 YIR6FaMdoh3fwC+m81d2tsDJWaXmxgQohVr/h7t+JvfSstaPdoDBPqoErB5jrm130V3MT
	 jOptidIkFZtgfrgklDraewoQaNUgDxbaC8qANBgaNByOVSoLcwR81e9KhACeb9VwCT11q
	 WoQBi/uvoTB0k8dYIvKYagWL5i8JBa4ud6Havzgu9WO2HWyu0IYHpc105UuTm3J6jzCsn
	 IScmKRUrrvRfQyVHC2BYQESAcAbpwIOZ7ksg9GeLOIa93qQ/SUPHattxZCwHqpawg9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115454;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:Subject:To:Cc:Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Report-Abuse:Feedback-ID:
	 X-smtpcorp-track;
	bh=ulgge/POPns5GuwdKsEodR0EWat9soZYf5RlEilOCYI=;
	b=pKcB5KZ5L/GJdGanAawy4riMApE7VRaMMpadFg5+Za24KCx9yF2UCK3UvsFZyAOrF2G4
	 rYAF2VttP0OzZO75TQxtY5WKSfcBdYFvbveSup7B5BELV00Xm7kNwx+sMx2AlQBFk8gSB
	 ixoCduaO5OhwkLksSqTE5kovtT9CS9TNtUkRJz7G7sTTWO/pVmlz8Q5LfThL8kmOCYfaA
	 F/Vs0AhqiWkJEqnYgUQbxwYG3Z+QQnhR2BUMKcsKdsdOhegJvyypZLBwhrx59mXsxZXXs
	 9Qa1t1efXhefSA3CWdF244bMPXN0wuAOmX/QRtzW4V3VT/lHMfiKm6AaxUB7mzw48Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=performanc.org;
	spf=pass smtp.mailfrom=em1228580.performanc.org;
	dkim=pass header.d=performanc.org header.i=@performanc.org header.a=rsa-sha256 header.s=s1228580 header.b=WpAyy4eH;
	arc=none smtp.remote-ip=170.10.71.230
Received: from a5i230.smtp2go.com (a5i230.smtp2go.com [170.10.71.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82A660A2604
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E82A660A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=performanc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1228580.performanc.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=performanc.org header.i=@performanc.org header.a=rsa-sha256 header.s=s1228580 header.b=WpAyy4eH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=performanc.org;
 i=@performanc.org; q=dns/txt; s=s1228580; t=1795115444; h=from :
 subject : to : message-id : date : list-unsubscribe :
 list-unsubscribe-post;
 bh=ulgge/POPns5GuwdKsEodR0EWat9soZYf5RlEilOCYI=;
 b=WpAyy4eHptKucEi4lOeI2dInTBSJM6T/DgxTXM6pj7Uc8uk4K4/wxBMwaSlFkqh0Faooe
 LYcsycowmECP/nq4qTfqyuOmHHv+0ZIPTBZHApM8bPng/sAtt6uxkI7WLqMLnmibxehU5Sc
 dMM1m8CHvkdET7RAjZKI3LCKtjUxnUq5DXhIxnIcVIJPxF+U+2OgL90hRvJP8CatBSJIkhC
 W9QoAv1OlCh6E4TjB66wYcXwCOW348uuIiYfd1chYmBVZ88M/xDU2cM4jsHf8WX0PRjEXaC
 VRihvw8wf8T/91WBigtOTks50enlX1Y/vJEULPoYdsjnWysRh9PYUXI7LJMQ==
Received: from [10.45.250.102] (helo=[192.168.15.8])
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128:X25519)
	(Exim 4.100.1)
	(envelope-from <pedro@performanc.org>)
	id 1xU7Wr-FnQW0hPr4rj-J4Pf;
	Thu, 19 Nov 2026 19:10:41 +0000
Message-ID: <a3b7a3f3-4da6-4a41-b842-cf9778dd7ba1@performanc.org>
Date: Thu, 19 Nov 2026 16:10:38 -0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: ThePedroo <pedro@performanc.org>
Subject: [PATCH] drm/panfrost: fix stuck reset.pending on JOB_BUS_FAULT
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Reply-To: pedro@performanc.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1228580m:1228580aqfTDtk:1228580ss_2YaxMnk
X-smtpcorp-track: 9V9NqnRTxCd8.UXRX0Mq9Ok39.jx76Ig4ahUY

From: Pedro Olímpio <pedro@performanc.org>

panfrost_job_handle_err() signals job->done_fence and then calls
drm_sched_fault(), which just queues the scheduler timeout work.
panfrost_job_timedout() bails with DRM_GPU_SCHED_STAT_NO_HANG when it
sees the already-signaled fence:

	if (dma_fence_is_signaled(job->done_fence))
		return DRM_GPU_SCHED_STAT_NO_HANG;

so the reset never runs and reset.pending stays stuck at 1. Every
later job is then enqueued in pfdev->jobs but never started ian
panfrost_job_hw_submit(), until it hits the 500ms timeout.

Queue the existing ordered reset work instead, which runs
panfrost_reset() unconditionally (when pending is set), even though
the fence was already signaled.

Fixes: 030761e097b4 ("drm/panfrost: Queue jobs on the hardware")
Signed-off-by: Pedro Olímpio <pedro@performanc.org>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index d59b4863b8ad..8c45ffec1107 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -497,10 +497,8 @@ static void panfrost_job_handle_err(struct panfrost_device *pfdev,
 
 	pm_runtime_put_autosuspend(pfdev->base.dev);
 
-	if (panfrost_exception_needs_reset(pfdev, js_status)) {
-		atomic_set(&pfdev->reset.pending, 1);
-		drm_sched_fault(&pfdev->js->queue[js].sched);
-	}
+	if (panfrost_exception_needs_reset(pfdev, js_status))
+		panfrost_device_schedule_reset(pfdev);
 }
 
 static void panfrost_jm_handle_done(struct panfrost_device *pfdev,
-- 
2.53.0
