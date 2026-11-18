Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967652;
	b=HNCW+2s/sVzpu8eCr8vubAOQzym8gsWT48t9g7kSSx49v5E3IuvnOZDnw0enVvoU34SI
	 W7MDurgKtJSdTauSUYrU1OMxUCmDSFSufpmroF+drm3XfKjMu2BA1BTG63Qas2UNdYLCY
	 PPyb0d49KCB59euXPePloP+bP0YFNyQRefgQ021KPVhyw+4/WiAXPPWGILMOP5x/fqod5
	 kRxdMxhdPBBn5B1/zKHL9mId4qIO+xAZr013pZ0+vhaRRZzG6C1ByNGCsLSHa1m4I1FjE
	 xsH9QV/sIzNXEzER/912Jx81ZfaQnkE5Z48f+VT679OYCG/rAHEMojhSqbNG5IYg3lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4XYNeMt6VNMRAiLe5EbRBvBhMDIpn29m4tUHZ+DRyz0=;
	b=ySx9i2FocFgw1NOtrEWa1PCBvp75VEJgakSmmdD+kSeIjwC9Ddt7SncLsGTtwjcYsyTe
	 xF39C0hVu3RinX3stjZrj3WHPgRgqpLfJXr5FP9TUNYICvf/pM+IBXSqqbFLPdFF0OZC9
	 5fk7VXx9TXRC180gJ0cOQ9LJEFJSTvBpbdVNvAQeMJnhSFsxORRH5UTSCCgZD+2l2ggCK
	 8NdHgNwuR7QUD1x/5NG+TWmk/it/SXe3IW4p97xApTLHSE9NZsgFQH/bQbuwU22DlE5v6
	 tnBDxUlBUL21F6zVo8wERAYOHf3fLv8OS+vaNuhS61x9qhnYgCewNiu6yQVWP8cRyKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrItGmZ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5AC606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C5AC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tfrItGmZ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382d85f4230so5815eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967651; x=1795572451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XYNeMt6VNMRAiLe5EbRBvBhMDIpn29m4tUHZ+DRyz0=;
        b=tfrItGmZyurqbc7AlNCYAocIN4DcMjwq1XHmG9CUCxqlUqqTzPbwPuqUy4p8jbdZxg
         Qg7eLGUPoU0Mq5TAfgxhb70/JJZrt1fUYhuMSEegIZiAoUrRgAZVmgT0Xha2WeAffogU
         oyFGGQL01j7wZBfLQR4eK2E8HlWpRIkZOkoObmeL6nNFFYSIEILCc3whXwdyEoofO2fw
         tH8iNwWoEJXL3T7vUmoJPIjf8dzzVb0nJrqKtuTYQ4ASpxpf3sCUADQB/sMlrTs1p7mx
         X7pVMUx1Iqs3sc0BFZLsZ6EaPauyyYz1Rt2l/EgRSmkYT44Q/Wl/1+xhCd3hHoyTlWB+
         d53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967651; x=1795572451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XYNeMt6VNMRAiLe5EbRBvBhMDIpn29m4tUHZ+DRyz0=;
        b=EIwIJiZqFWVY3ktxb7dAaZMVBG3z4FZo6l4oEPG/Z/cEAcLpF6LDomhZXtp3m7Ki5r
         q+rEC613zvHuSLDCJDmP27lTDxSs/REsM6pY/xKRiCz5Gzr6j+uR8iJbeAACu8ZPLglG
         jtLkGnldmUBZgalGstmKD+cu0vbiCitw4FwRKewnSG9QLLQsKVPp1G9FGZJruQmU6GC0
         A1MxL4Niijde/gmYC0LieDAFjieI+eucUVO0RgLlBuIvrfUrLI9dlkt/ma4ArHQV9qvR
         MSSSqEiDRa/pKeWKK+QhRjkPdeytFcnBQDzZ1XpCKY+UWhEnkw7PHIQVqODe5GPwBa9J
         lHAg==
X-Forwarded-Encrypted: i=1; AL+hErEzUCBcoXiHRts7GCWhyc/AxNzRK7gso/GEi/vVZMicTe5WP/cUIozOhaTuvDheQ0aVxBEh8i5HquVfXXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lCL4g/GFW0/YTfe6DpVGP+Kdc7roqC8H2lLk66/P8Enw1Zilk
	ZDWV6a7/agAA+AyiWbqVyOYIslzrYCs6zHXdiKx8t2kqa5GvUz/D4AJb
X-Gm-Gg: AYBFou15a3cA53OBLIfqZI4NdjvfTltEbpqzzsHDduWb1ScfBI1KapOaJPXvdxWqMhw
	p+fKKKYGtDvNEVsDtzNvm/1UjsE5bxWsStexr9S+i0/gUaOk5/R5hlPlzfFe+RIyY8eW6bLb5pz
	6IOkF1vOde4nyazNq+OUknate8hf6q5zPhomcwMitlkLxjTSsvrZ3mkQIS1xGj9pYgx1H3iR1Ys
	7DzFBfX/B1Zcz1JYyrMi68SuBSEZfc471fm5VVRkMG08SpHd2w7iFQxV1PEQz4Q+DjkXKSou0v1
	cJyYc1DOT609Mzj+jrC/WVBdfNQBDip3DhS0ZOabL0/K0TA1N2DjE2GuznCgoIvTSVpA5agzQ+B
	qNgDzwUZr31GeUCf/KmPRqABREm1SX7tzb9oS2T1bvc5ZAAYQg2cTQZ536OcyEkSXY3wsx3Wm0F
	VqyEbqIa9w6rX0d18X7trAU4jz0IqnceLunGICv40sMPEpdaEGo/cwmIYjTYSo8C8VYt4m4SbGk
	Em8OeaYSA18jRUIwUqX7AKmOsSF1DsABEjW2DRy+IiCoiydPC55nuwTTcx3IUihDgGAJzNQDXWE
	oGFBLR1upjNLNSfnOhXkDHe7Iyp7QCKI8lUKrzVXnj/9VZ/EsCT5khXIO/5LCxL+7T1SBFx74EM
	6bNb3ffc=
X-Received: by 2002:a05:7022:698b:b0:1b2:5884:a039 with SMTP id a92af1059eb24-1b543a1715bmr2662340c88.0.1794967651150;
        Tue, 17 Nov 2026 18:07:31 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:30 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Anna Maniscalco <anna.maniscalco2000@gmail.com>,
	Julius Bairaktaris <julius@bairaktaris.de>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 1/5] drm/msm: Wait for VM_BIND jobs in msm_gem_vm_close()
Date: Wed, 18 Nov 2026 11:07:12 +0900
Message-ID: <20261118020716.1698-2-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118020716.1698-1-arpe1618@gmail.com>
References: <20261118020716.1698-1-arpe1618@gmail.com>
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

msm_gem_vm_close() waits for vm->last_fence before it tears down the
VM's scheduler and its remaining mappings, but only submits add their
fences to it. msm_submitqueue_close() flushes the VM_BIND entities
first, but drm_sched_entity_flush() gives up after
MAX_WAIT_SCHED_ENTITY_Q_EMPTY when the process is exiting, or on a
fatal signal, and a queue that was closed earlier with
DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE is not flushed at all. A VM_BIND job
that is then still waiting for its dependencies is not waited for, so
its pgtable updates can still be pending, and the job still queued on
its entity, when the scheduler is torn down.

Add the fences of VM_BIND jobs to vm->last_fence as well, as
submit_attach_object_fences() does for submits, but keep the previous
fence if dma_fence_unwrap_merge() fails. As for submits,
msm_gem_vm_close() waits for these fences without a timeout and
uninterruptibly, so closing the file now also waits for the
dependencies of the queued VM_BIND jobs.

This does not cover a job that is killed, e.g. on SIGKILL while the
process exits: the scheduler signals the fence of such a job before it
frees the job, and the free can drop the last reference to the queue.
That is fixed by "drm/msm: Destroy the VM_BIND entity when its queue is
closed".

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Cc: stable@vger.kernel.org
Suggested-by: Rob Clark <robin.clark@oss.qualcomm.com>
Link: https://lore.kernel.org/r/CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
As for submits, a VM_BIND job whose in-fence does not signal now keeps
msm_gem_vm_close() waiting, uninterruptibly.

submit_attach_object_fences() drops vm->last_fence when
dma_fence_unwrap_merge() fails. This patch keeps the previous fence for
VM_BIND jobs instead, and leaves the submit path as it is.

 drivers/gpu/drm/msm/msm_gem_vma.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 8b702422030a..2f0698df1a9a 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -6,6 +6,7 @@
 
 #include "drm/drm_file.h"
 #include "drm/msm_drm.h"
+#include "linux/dma-fence-unwrap.h"
 #include "linux/file.h"
 #include "linux/sync_file.h"
 
@@ -1443,7 +1444,7 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	struct msm_syncobj_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
 	struct sync_file *sync_file = NULL;
-	struct dma_fence *fence;
+	struct dma_fence *fence, *last_fence;
 	int out_fence_fd = -1;
 	int ret, nr_bos = 0;
 	unsigned i;
@@ -1586,6 +1587,17 @@ msm_ioctl_vm_bind(struct drm_device *dev, void *data, struct drm_file *file)
 	msm_syncobj_reset(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_syncobj_process_post_deps(post_deps, args->nr_out_syncobjs, fence);
 
+	/*
+	 * Let msm_gem_vm_close() wait for the job, as it does for submits.
+	 * The VM's resv, which protects last_fence, is still locked here.
+	 * If the merge fails, keep waiting for the previous fence at least.
+	 */
+	last_fence = dma_fence_unwrap_merge(fence, to_msm_vm(vm)->last_fence);
+	if (last_fence) {
+		dma_fence_put(to_msm_vm(vm)->last_fence);
+		to_msm_vm(vm)->last_fence = last_fence;
+	}
+
 	dma_fence_put(fence);
 
 out:
-- 
2.43.0

