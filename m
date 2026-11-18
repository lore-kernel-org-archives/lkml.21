Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794967674;
	b=nJcIBKpvhd2taN0XULOb7VQURIW9PwK8l8bHw/Omh0Uza3NqF0wy00ts+9rx+ygKeS+w
	 e62baSvcqe3OxNqL/p5xO5JH3CeTESu0WsGQIoC4QBsnSwr+VuEQ/NGWF0NpekqOvJVA9
	 ry3coPTsH7rAaXKjSRFqRRzb31R5/N1XsPIfmnz20eOxJJfkCCkOettNm8eB1dg72q8W2
	 QGVJuoWNH6ec7CBRRMfDTPvLlz44xYq+Dt9gK+QQydQuc5n/VTwoFRr5mNhDbkikgwSn9
	 iQle/ru76e5BCT+PREEzrD55SDHWqtENgihtjIbrPc0I+1SFWNZRyXjaiSonHU5cBKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ecuacG42mOJlCKP+Xm2vtenahXDM0oGaAEC/qmvo8Ow=;
	b=PnmjdwEkgDzca1tg3Sma5lOaXxDy5wTuMMKnAe/H0iDLos9syZHlbfAftu36DfIX3cY1
	 feJBn9DeiXYXlkMrX7M+Zx+SXvUjGz618XrnYv+bHG0YkbsDQpM5tTAMWimdgevlh8lPM
	 FMEid4k7EFSs374ZR5s2GAG4voRqpFGIZCAa81t+yoDe+WoFb3v8lmSga/jdefXVkZEnY
	 auPmzylD4X4MrdnlnVtSLNFl7Xkrc4AfhChIhDMinRi7BPlaFuoe9xA+StZ6KpeyneWIm
	 UloG9sCd738rOnzAQeJUJ53mQ6kFACj0d4Bh1ovc+UQ5IOqTW0hL0ywzhcZSfXhSSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7ik5JLV;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB13606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB13606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o7ik5JLV
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-382d85f4230so5836eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967673; x=1795572473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ecuacG42mOJlCKP+Xm2vtenahXDM0oGaAEC/qmvo8Ow=;
        b=o7ik5JLVSbK5jaXU70vsqzLCjPaJRtT6RTbnLyn6TrHFa4gaSUzlLeTqy8sKLwm4KM
         Qj75NgS3SRsg9NHJdBOh2cUupSjEROItqNNOL4vcS2x+StuV2WI0wF8qXiQ5jCLcItkk
         FCg5kl+jlHBaYVC3WyXCorciDqOqcB1ZvNdsm4vMj6kxQ8r2taVyZRWNBoaE3aqN99Ti
         UvK/xRe0mnf0E54iK+YJaEOd3K7SZ2/GQcGsbmurPUC2NgzEu1lD/0sIo2mwReqPXzw2
         /hsj29APHi+OYo0LLFFbOdf7DbgbelGmSnI60F48W7epQS2RBVuW+QoT60CcmiiJ5vjS
         4dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967673; x=1795572473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ecuacG42mOJlCKP+Xm2vtenahXDM0oGaAEC/qmvo8Ow=;
        b=VZHXOFMTEk5yRmfU63kyyCDUAeCQpWtCV96toutzDU2pvT7UabhPPjzonTdPRFOnYe
         G3aM+O3PKTds+7ln555jpQUsPO8Y6hOabu0l+3QC+OSp3oxgdeCHrzJKSVJuZcoWzsYm
         Thw/uINLpUfeUzhUpmOxjTCaf9Ssfhz4PIs8N1iAjtD4n92ltwSgX8+ekk+azjtWGke3
         VPmSDAdNbwMeSi62IJ3nkEV62OVZT37vJQiztIUOuTiy9zrnLSBvG0+TYcTMVj5xS1bz
         RXKNKwxHGtBKE+bfpYWIrwL3vpSXWtgDeldxUrc8PTqPx7adCo4FD7lDQufzzCQAujCR
         LTIg==
X-Forwarded-Encrypted: i=1; AL+hErG8OS4r1RGyA68Ye3s6mPL2WnBsw+8IE1x1sGcgWdeCjJoXRWmkyv6OPAKoRc/aqwTq08xD5EI/vl+0Mbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mQz1KcBci39Ixg4Wz8nWMMWMqYFPNlVpCYv6hyUkW9HySdMSh
	LA7Ezp+BL1J0N0LG9FKBcLe2gwiNxcM39tcG9UNIb4du5i9YspvavQj0
X-Gm-Gg: AYBFou1SkaAsmmXtATPd2vUlpRHBHJA/zzTHrcb5TWfwxACi6A8zpFFZSUek0NrHyyU
	MZEWguBkvGiJpGIiCjRNAWQlODEoS+lAN3m7eyUMAPO8oMKYhcaDsJRtn3orruxlwNM3Z8/t22p
	Ao0hkIr5/TuWgjEonA4bfktPbB44LwzZ4Y9uJkAwl5b1mmOQFiy98gsHy1dee3JOuFjHm2A4lNn
	mzkWnF5+QR92reyn9NorsRZt7U6TAoxifNgT8K3zNlEMZ2T5lHYNh+0i7mlXptmqqK1N0eerugQ
	ndLC+KmmeF/ziUeLDZbEvFrDitQPZqOJ8UCGiZ9mTucImmbHfP2phf2YYSdbEyExwn0mGtIX7qX
	LphT9dHGMDvPX3SfnkR95IAXDTm0iYD3RADt0sFDTBVllzg2acjCdyo3154yisESB2/9HtaWFrf
	dcImLJ347A5L+VgxLYIPxz3o8HQnyPrlX6ZTVzG+XLgGCxCAoVdeamhut6l1Wn0NvHCQiqq74RM
	O9oCcMiiTIxuoXpkP8234eqtWhy+ORNuVqMGiMMsq1PbW5pvFSVakejUpJnzWVAl9PJnE6HeDxU
	XRr0LlwC0a47UZs5umIOmzID88rssDGwVhdJp/MdINhWm77/sdiBWUd3KNHNrnVmhjSufiDP2c2
	+PX9MBq3oGMtGdG9DTWgq2U8oTBDN
X-Received: by 2002:a05:7022:e801:b0:146:ffa9:2117 with SMTP id a92af1059eb24-1b543b829c9mr1993620c88.1.1794967672916;
        Tue, 17 Nov 2026 18:07:52 -0800 (PST)
Received: from DESKTOP-CJ1L666.dankook.ac.kr ([220.149.255.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b544784008sm2862327c88.5.2026.11.17.18.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:07:52 -0800 (PST)
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
Subject: [PATCH v4 5/5] drm/msm: Put the VM_BIND queue last when freeing a VM_BIND job
Date: Wed, 18 Nov 2026 11:07:16 +0900
Message-ID: <20261118020716.1698-6-arpe1618@gmail.com>
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

vm_bind_job_free() puts the job's submitqueue and then wakes up
vm->prealloc_throttle.wait. The job does not hold a reference to the
VM of its own: the VM is kept alive by the context, which the queue
holds a reference to. When the job holds the last reference to the
queue, as it can once the file has been closed, for example when a
killed job is freed, the put can drop the last reference to the VM,
and the wakeup then uses a VM that msm_gem_vm_free() has released.

Since commit 01c8d1f385f7 ("drm/msm: RCU-free the scheduler-containing
ring and VM objects"), msm_gem_vm_free() frees the VM with kfree_rcu(),
but vm_bind_job_free() is not in an RCU read-side critical section, so
a grace period can still end before the wakeup, e.g. if the task is
preempted in between. Before that commit, the VM was freed right away.

Put the queue only after the last use of the VM.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: b74fae5492d1 ("drm/msm: Add VM_BIND throttling")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index c526409f451d..3e9657982291 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -904,7 +904,6 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 	job_foreach_bo (obj, job)
 		drm_gem_object_put(obj);
 
-	msm_submitqueue_put(job->queue);
 	dma_fence_put(job->fence);
 
 	/* In error paths, we could have unexecuted ops: */
@@ -921,6 +920,12 @@ vm_bind_job_free(struct msm_vm_bind_job *job)
 
 	wake_up(&vm->prealloc_throttle.wait);
 
+	/*
+	 * The queue may hold the last reference to the context, and so to the
+	 * VM, so put it only once we are done with the VM.
+	 */
+	msm_submitqueue_put(job->queue);
+
 	kfree(job);
 }
 
-- 
2.43.0

