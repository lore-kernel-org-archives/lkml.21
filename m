Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795055758;
	b=3FackSSqqbXdHxTLmoS+HZk/lCG5EHrwqGXGhTf6SF8Pzu7blOyfXRqrK3Mije4/L8ZX
	 RSoq5QgwJct2GAaDpJYbHZqEEJcBwfQ7mTXCJPTA4dD/kVG4hRnuVIaca+Qy2ObqD0M2F
	 EcC9vinKY7pH8SkhCApwM42ptaNx7ajnSHcfDIMOdsWFFuElA9WAWs0s5r1IqfvG42+k4
	 JentiPyrroUtuouBJS8uBcgJFaQJkbVFaLaZH39gCliY5lWFoOvtDvnleTaV2sGiArq+X
	 0M8r3H5wajnHQFK5ZRmQDR/UurQHF3lTyOAnvlvamE+jIQGJ0Jcnp9qu696ijPQEb8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795055758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zKeouwKUhSCp57RcBwxtpS4g2a3Z83++Bwx1acJHrfU=;
	b=n/jrjioeTfiG+I2lzN2xvtzOwjOk2Gf18vWO4JFzl+MqwSsL28uSQ7IVGFp66iPHocPW
	 +yQ6zlC17IbsKwRptbPzDCGJMQ55kNuUDYMswWG4GHTGByek44POf028VmyaWLNo8wwRM
	 eHMRVZlWu4wgeTGYKr19TEyFW+tYSsKVw8TugFTALrLfRbB/PnvYPnJn+kBPuq5J8Gfdu
	 a9S+6UgS3VKzB/twRcWCTEl8MnfOs8kKu+y7mqwzARhnYrGOepKSMkm/uIWvvqKLZ3iTj
	 XuW0iNdlotT+51E+spmSjk3HoUMXGTP+oX+DPElMiIilcrqrcrcx0XtDEnlgwuUuvlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml9fIUdM;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7888B606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7888B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ml9fIUdM
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36dbde64409so3047617eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795055758; x=1795660558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKeouwKUhSCp57RcBwxtpS4g2a3Z83++Bwx1acJHrfU=;
        b=Ml9fIUdMQ14XK2EsptEXNwwdYUlYuAs7Sgh0O1StUrP+5ABj/hoqkkU+qJNNY+vtDP
         Wr5x/2JGzFTLbNdaB1Ugh0xo6z8/FTYF8T5iLnPoAigyqIzdQQqBGZCo6HKKmKeG3y+j
         e+asHudcSzW3a03TzsSnO6K7Hx0yDDWlZoxqWl/8Z1csjJ8+41E5gNfLuf8NWX0i6fLD
         PdmhYgOXw7YDO/R2vo55LjUUlmOF7PM/4kNBwK1z+gdqFgK+CwXvsbtIzT/CZfVD3i9B
         zTc+PdHQd0qsoaxy12X1GjV4BHfG3tjlmc4hp9obkHHIuTFMgxMasCwZ8k3X9vlQyzyx
         xLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795055758; x=1795660558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKeouwKUhSCp57RcBwxtpS4g2a3Z83++Bwx1acJHrfU=;
        b=DzF8oLxi3Jleksf2YfAr03IR3dEdIMnP3VBIDA8/gl1vR+UChnPl07RCWDBC6E1u50
         nGWvkHA8GJbI11Q5gS9pSzO6Lc3NdcRYJhHCHaBu+VtYsHEtTdSGj7ugYmEPIVAifOC6
         cRss0u7QGb59ldhcx0r6TXFuIfwoGcBiCObLNYRL2QPt9NRWfmyXhwPXMH31oqKIL7j3
         jdPSEPESr6yLPGitfKD3jqTYPNfc671VVD904pYYLBSIqSGxcgdD9/iS+JMcrt4fBKYS
         KFRJGsUkMi6kH7WpbjdCSvFMPcIdefZVS30Yq7Q+uVjAi4hxhq0STsJPRlXPTC6aJCGS
         q6uw==
X-Forwarded-Encrypted: i=1; AL+hErFLJqdpiaSC4xStyb3LMoxfQeklWu43FJRfCDDaaOR8qG7i1gq1TproS2yzggeAveYlRV1PEiduiFmzhY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6fEtCTuYJfOyMzSmv4r+HiS5P306na+4dkrFkZAYvLcbi4h8S
	z1O1ibsBA+HA4MGBlrqPNlwc9owtebgDbufV74nZ6x5zkqrOtptsqDCT
X-Gm-Gg: AZFdTZellFl7GvDmkCXyS4LY0AC/sNyuTG1BsioUNU8EvjNI9kkh45sIeMnL5Mo8dMW
	ip85XkCV0Zl6U5D3jlsYkheYWZi/tmQEo/5TDzXU76d51xNmHRJKaXqBzzlMiHlPDdPtq/VQRob
	ZTpfk51Z3s++qOrciOl0CrwsOPHieow2ZLBvJqarCLNI2KmkjEGIUTl/6Aku7vWGCEkKIX7ZnTW
	lu+NeqdXSXt8kDeWDzOMVp5RSfUTH8BwThaPje+VjcprGhVsrv70Vz51/rOwhPh1CGmxvRdkBpZ
	FKwrYcrLc/qQc9re4W/xaVq1SBBfrs624pTJWjGmGqf8ejHLvD0MiLBBTXwI2RB8i0qojM2d5bj
	l34VN+4UyICs3EXHVYdlSr9m5/QxiJyR3CzNuh/Sk+6hRGZ+y/jVcwgEQUOwqwGKiwpe0cMYvN7
	QJbPlufbUPdRM4i/CCoeTRYy08c0+0Zegb3PZ8rfB23/cYMmBvjTGwl9xobb8mMbK+gzszz3iqH
	nvA5hkCcObfYvW6OHakwEBn1kgkWznLU9DzLettoIzdaDV+CF5ZDbr5aPtdjcj9x4PcUYKMDH12
	N1FMkfppVREMpho3MkHl2m+Pgh2KVegOKFiPTlm2WM0rRhmUFUVgol9EtRwfJT/uU6mvxp4J3p8
	WX/+JPa7ZSRvQH9ZWhSpkTwswX7kIoltAfWMbPaG5TapFkbhvFdY9Eoy9WxwwXg==
X-Received: by 2002:a05:7301:5504:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-3836eb67772mr2251726eec.32.1795055757524;
        Wed, 18 Nov 2026 18:35:57 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:38a8:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm11983567eec.19.2026.11.18.18.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 18:35:57 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com
Cc: dri-devel@lists.freedesktop.org,
	krzk@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/exynos: queue the IPP cleanup work before waking the caller
Date: Thu, 19 Nov 2026 10:35:50 +0800
Message-Id: <20261119023550.1495565-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

exynos_drm_ipp_task_done() marks the task done, wakes the waiters and only
then decides whether the task has to be released by the cleanup work.  A
commit ioctl that waits for the task is woken by that wake_up() and frees
the task itself as soon as it sees the DONE flag, so the task->flags read
that follows touches memory that may already be gone.

Read the flag while the task is still guaranteed to be alive, together
with the other task state under ipp->lock, and queue the cleanup work
before the wakeup.  A task that is handed to the work is then always
queued while it still exists.

Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>

---
Prepared against v7.4-rc1-1969-g666539eecdf4.

Compile tested only: arm64 with aarch64-linux-gnu-gcc 11.4
and CONFIG_DRM_EXYNOS=m with the IPP drivers.  The affected hardware was not
available, so the teardown path was not exercised and no fault or
race injection was run.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.
---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 43bc4f63bb84..49ae8ce9b95a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -764,6 +764,7 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_task *task, int ret)
 {
 	struct exynos_drm_ipp *ipp = task->ipp;
 	unsigned long flags;
+	bool async;
 
 	DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %p done: %d\n",
 			     ipp->id, task, ret);
@@ -773,15 +774,22 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_task *task, int ret)
 		ipp->task = NULL;
 	task->flags |= DRM_EXYNOS_IPP_TASK_DONE;
 	task->ret = ret;
+	async = task->flags & DRM_EXYNOS_IPP_TASK_ASYNC;
 	spin_unlock_irqrestore(&ipp->lock, flags);
 
 	exynos_drm_ipp_next_task(ipp);
-	wake_up(&ipp->done_wq);
 
-	if (task->flags & DRM_EXYNOS_IPP_TASK_ASYNC) {
+	/*
+	 * Hand the task over to the cleanup work before a synchronous caller
+	 * is woken up: once wake_up() returns, that caller may have released
+	 * the task already.
+	 */
+	if (async) {
 		INIT_WORK(&task->cleanup_work, exynos_drm_ipp_cleanup_work);
 		schedule_work(&task->cleanup_work);
 	}
+
+	wake_up(&ipp->done_wq);
 }
 
 static void exynos_drm_ipp_next_task(struct exynos_drm_ipp *ipp)
-- 
2.34.1

