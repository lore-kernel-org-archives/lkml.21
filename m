Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.27.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595205;
	b=C+/cpQrwM30hu0K+7K92M3tfYUSVuUkvxwMlo64OsAqJ2V40DnNL2mlaTJOXb1gj+GLP
	 zEfBVJXi1sNDuskK+56y6+YGrr5PvGPsyPzCo63R0UeY6cIOFBgBQ8Ag7HtpL12uf4QR7
	 gAWaxADXTNVt4k0heYrTeHLKwDAP/J4TdPtz2H39o2oj37+h/YB+l0xAxMh5nk9xBU4JC
	 gZC0ks8TNW0S1lrTJKM0yvhEk2RtFw88BBtzB6xpGRV1/xqQBAy1r8yhetmDK3M8jUB/s
	 d4QrfarfD3hqkK1PugmIQWozGuP7jUxcevLPatudvx0dWfNwplhSRXqmzUacNnDi5Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595205;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 X-Virus-Scanned:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Feedback-ID:X-SES-Outgoing;
	bh=haGvfq0ipn/DurQTM0Hs8PDyG7K0OpoDJ+u0pHn7VSs=;
	b=R76Y4SraC1d+bGs+iB/tST/PbLieRGkpscmNBiKLYkH6zL+wfNDhgqfmis6wU0DiQRw1
	 OoGu2fGx2GkLZOKqNHOoo1kzOKgX1AGfMY6djB8ogwpZPNzYObBw7tHfZLdFSxell9fnr
	 ONemSJWn6p9hsoVKPqN+qOmb1emMPYHFUBK1SygrCwy/zEjXHVnCtX7mDnAHjK0hchzTH
	 6dbMPOhpZxj36hYVh/Y2Jp8Wr9ISsIfJm6IUO87J67M7m3VALTcWQdUV1vAYgT9cQAoY7
	 8zJOudDrZlxLWaYPuleJNMRmBXwyPoBSioq3QcsoLtbuKXHL+EHEicamjI6ApGLiuIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=retsim.com;
	spf=pass smtp.mailfrom=us-west-2.amazonses.com;
	dkim=pass header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=abaygg6onarqet2uti4t4yyiczbpngnf header.b=Ir3SoiKI;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ox8kpuKC;
	dkim=temperror header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=dkim header.b="Ne7/dFx9";
	arc=none smtp.remote-ip=54.240.27.38
Received: from a27-38.smtp-out.us-west-2.amazonses.com (a27-38.smtp-out.us-west-2.amazonses.com [54.240.27.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BB1606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83BB1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=retsim.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-2.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=abaygg6onarqet2uti4t4yyiczbpngnf header.b=Ir3SoiKI;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ox8kpuKC;
	dkim=temperror header.d=retsim.com header.i=@retsim.com header.a=rsa-sha256 header.s=dkim header.b=Ne7/dFx9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=abaygg6onarqet2uti4t4yyiczbpngnf; d=retsim.com; t=1795595205;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HDa5c1pncVtqwAILklwmhPHA/9Encbeipusse6h8CTE=;
	b=Ir3SoiKIeJsBzzmSc7pMNeCOXm8Qvj4Pv1wpeQ9zvus6KDsHKrTSEfxQVpxwicUb
	OKSVX5LB431F3mYnCPBymzXlLAAiUkBotsqjmGNX+PFtj5ATPjtvxsIf2DUEOrJ/hMq
	SA05PPaZcvr70mq2Re9bYygdkOSGzZzoLKnxuLT4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795595205;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=HDa5c1pncVtqwAILklwmhPHA/9Encbeipusse6h8CTE=;
	b=ox8kpuKCiZ8iEGPaJKHJwQvapG8z+pnvCr/zEwfwIfpxf4D6PDiODVNqDp/PLTIz
	hAQikL9Mdxhp/CWbWl2pzM9yZiwTXnLQEHPuuvhFGv7ThhSystLRDPcktG+9hwL31Ll
	ltZmLmedJxdAEzP0xq2qLlwKzQJXGBpiCxu5QbE4=
Authentication-Results: mailserver.retsim.com (amavis); dkim=pass
 reason="pass (just generated, assumed good)" header.d=retsim.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retsim.com; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:subject:to:from; s=dkim; t=1795595198;
	 x=1798187199; bh=HDa5c1pncVtqwAILklwmhPHA/9Encbeipusse6h8CTE=; b=
	Ne7/dFx9o0SvAs16yXvbvyOlH0lhSx5sYlLCS+7FwlI/4FBW3hz7CoqvJ6aGrvHy
	HYXgGK58Ya5uyH/M5b2q/bynsqMKI0T8J2BErx16KUOQU7jV5gdwfbWAy8Vlfan4
	bF60BDU03KUE30l5RkVuMQQBt8jRAJRp5Jv62kNhuGz/INV/DO4PSFhsxNTN8KU2
	+daNcYOYk39HsnGFcmFwm6sIDhgW+lUWvv/TGqT2M/HwyEi8WPtpZbHNLZ/srzjn
	67vgkzehVDM1SdUQe9DKIMTtNhNKMQ8WETxDIh119/4YXKoJjX7+kUAVORknCWgd
	xLyYhzSSoAFoX0uWivlnrg==
X-Virus-Scanned: Debian amavis at 
From: Lewis Lakerink <lewis@retsim.com>
To: imagination@lists.freedesktop.org
Cc: Alessio Belle <alessio.belle@imgtec.com>, 
	Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Lewis Lakerink <lewis@retsim.com>
Subject: [PATCH 1/2] drm/imagination: guard fence release against device removal
Date: Wed, 25 Nov 2026 08:26:45 +0000
Message-ID: <010101a211d07983-72e5379a-adfd-4134-b23d-3e2b1422bc2e-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125082637.2839673-1-lewis@retsim.com>
References: <20261125082637.2839673-1-lewis@retsim.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.us-west-2.jZ+gdeR9TqNTaB6Dq50UPG8S0IjuYZETsFsi7SlhF6Q=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.38

pvr_queue_fence_release() queues fence->release_work onto
pvr_dev->sched_wq to drop the context reference and free the fence.
In drm_file_free(), drm_syncobj_release() runs before postclose; if a
syncobj holds the last reference on a job's finished fence after
pvr_remove() has destroyed sched_wq, releasing it dereferences the freed
workqueue:

  pc : __queue_work+0x240/0x550
  x25: 0xdead000000000100
  Call trace:
   queue_work_on
   pvr_queue_fence_release
   drm_sched_fence_release_scheduled
   drm_sched_fence_release_finished
   drm_syncobj_release
   drm_file_free

Guard pvr_queue_fence_release() with drm_dev_enter().  When unplugged,
call dma_fence_free() directly and leak the context reference: the
callback runs under rcu_read_lock() in dma_fence_release(), and the
device state needed by pvr_context_release() may already be torn down.

Fixes: df1a1ed5e1bd ("drm/imagination: avoid deadlock on fence release")
Cc: stable@vger.kernel.org # 6.14+
Assisted-by: LLM
Signed-off-by: Lewis Lakerink <lewis@retsim.com>
---
 drivers/gpu/drm/imagination/pvr_queue.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_queue.c b/drivers/gpu/drm/im=
agination/pvr_queue.c
index 34b8263..2a6bfb0 100644
--- a/drivers/gpu/drm/imagination/pvr_queue.c
+++ b/drivers/gpu/drm/imagination/pvr_queue.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only OR MIT
 /* Copyright (c) 2023 Imagination Technologies Ltd. */
=20
+#include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/overflow.h>
@@ -122,8 +123,19 @@ static void pvr_queue_fence_release(struct dma_fence=
 *f)
 {
 	struct pvr_queue_fence *fence =3D container_of(f, struct pvr_queue_fenc=
e, base);
 	struct pvr_device *pvr_dev =3D fence->queue->ctx->pvr_dev;
+	int idx;
=20
-	queue_work(pvr_dev->sched_wq, &fence->release_work);
+	/*
+	 * Fences held by drm_syncobj are released in drm_file_free() before
+	 * postclose. After unplug, sched_wq and kernel_vm_ctx may already be
+	 * torn down; free the fence directly and leak the context reference.
+	 */
+	if (drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
+		queue_work(pvr_dev->sched_wq, &fence->release_work);
+		drm_dev_exit(idx);
+	} else {
+		dma_fence_free(&fence->base);
+	}
 }
=20
 static const char *
--=20
2.43.0

