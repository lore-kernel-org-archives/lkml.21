Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986697;
	b=hRAEdUWKVqmwNWjn8ypvuS3qTM3gSksPieq4lpw7Oizpkw2UvTDC4KSjW+X/6tdi/gOP
	 wMQBAZUEz8Ka9dXVYkJn0WiwuNxI7glN+9UhqSSGByH5/LXikgaV+ff0abw5aXK3Skn+Y
	 qD3Ce1U3aHiZTzQqerytJCTr03ysoVD9Ox75u0YgqlM33vHFlKcXDuZmrwUdF5WJ96h6h
	 +IlvpXswRYD8bEoQw+BhUEXJ1Qv/9X8pBhjbj4gByyvy7HBq0GkD+NOze523XoqDTCSL+
	 NDlvUyY0GE6LN6dcamAl1VCJ6R9SCwTrWQHk/zq10SchVJ28xwSPWsMC12BTM6U0Y5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bsjzF6TvIUuw+1BiWPKqYlHDsaiLhXoBbNKg0Yd1gBs=;
	b=VKYCq0fuJB1+jmQ+Xx/2jDnd9W6aHTR189+eax3cVsDVqesGbb8yia0DloytsuotyVVw
	 ck/5mMpYhGZ0UUP845mOLHqaic1yyRSK/+5f+y77NITqlgqtMi4Q5bzwndoLYLiFSfRwt
	 hc9Y1waQGeEH1n3E8ZxkT3EnC3kb62jeEqT24RL4mhyG4i3cJ1tml+oIAoOPxjJHt+Coh
	 qTjhzSqxdC3I66A5Wj2aOYD3KzDV2OmKNc/djMpgjCrBgQP1Z9bp/eOlINFHYDt6Yfz1W
	 LODBrKXlk6j7xyYUNCJakX3/M/yELaTk0PVBAJ+cep1NgJMZf6VgICAmxxTH/VGIZZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHVGsYVs;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47675606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47675606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bHVGsYVs
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso345203a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986696; x=1795591496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsjzF6TvIUuw+1BiWPKqYlHDsaiLhXoBbNKg0Yd1gBs=;
        b=bHVGsYVshDuBPLd5wfU4E2Dv0/H7SOWZgvWb2MPz1dHjqZrbhfeOtQtQV2g3B5mPEv
         HWSiKGIRwAV1cHk6hq9OLuwAaKJfVsj1kxuZtIjb1AB2sjm7Ihkp1kMoT0CEzfWVZmge
         kjToBmF+WhtM0brpMtD8ZgStvTmYdllXEuWcE1ZlxRZT9rpT8nxNTMwf/Rn7Ypw9SbAM
         cb8TlSa560WeBvyoB5PKckJQHyIRstb5tFv/iC9HkPIg5nof0b07sNQIr38DcMILJaSm
         A756Upl4c09BEW4u3jUQFUMZQgYpH6jLrXNK2TmWteDTTN0ZNMsAy0+NbrfykYiDvE6K
         3Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986696; x=1795591496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsjzF6TvIUuw+1BiWPKqYlHDsaiLhXoBbNKg0Yd1gBs=;
        b=BJWq6uEO1yTF/Lr0cqCp0tzNJr+5kMr6idd9vTixrOlVUWiuo48P2n+wLwR7y3z+gI
         GxbmnJyrE9uYDkESKiZyC4r6uo79m3p0L21WqhjzA8+e9B4HCsEt3FRXKnA1n4/xxIm8
         RpOZxA/ri5lvgcv5ZP5nWQJuyEAuIBUN68EcJYjkbDRsvSz1QLcVNUVg4TeLUeCI/Z24
         +0bSAAqBPlAyDEfhuycyHVGu+TntKkDXQG8f5Pid80mAuWOQ6U8ytgH1kC8C15Nj6l83
         FTUKmTnoGl0Wy3t1TPV5yv5+P/Bz42fXTMpfk0ig5LbR3kda4UIh0Qo8nmhArM0BWDuN
         ZAKA==
X-Forwarded-Encrypted: i=1; AL+hErHlSQ1QaB4u07CU++H7g08Hoh77ek8wx3ST955s2XsiMglME2a3CwPcD+Eq/qQDtENMpMSKIZMuLdgl39Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aKyl04rBufHjr434wnrR9GGXvWUuwyyM1HtKaS+T0czoogvQE
	Y9MLNJP12ZaZH/FLnqS6DfWcciYrp59k9GEQ8FQZkNH+/O+x2XaXevwN
X-Gm-Gg: AZFdTZdzrUYUDOA58x0YmmVcqUVYhPQyfczK6kU/wogVRth4uILKT4W4nt1FBbkNwIg
	L8w3Nvxfzj1yfHotcAOkBrVzZGL31qnSMOsA3airm//3BWwsPBEJlxcWqn8z0WoesemgixKed7e
	FYxZyJvKEfmjhFks95LtbMxoI/8/zF99UMNcFPRuH17WMcin5uWTwhrnfkS2DZ2nxu5DSWm+8a9
	QtV3flCbkFwICc+25zLXKgeXVeCqOm90Z/FZQbBVMbuWZjQcp4eYoVSghOqxaIaEUQPKmNnnIzH
	hhQsD0xFSB+Kja7vuAxwQ/3AyBX4QRvAbwiMjEkKUuwGlTouD3GZDbgTVYMFMYnGtBVVpgh66aJ
	r6jlwNmhjdVlYbeAuj4RmMYt4F815NDylWBfOZbH95DyL+D6YqastXuZ6mAWnEkINwTtwSnl8XN
	Pq+mCQOFEF6VOBoiiCQpy4HBEuuyeN5ldRk0V8EpMD7Wcu96CFKzP5QfJt9QCfG+f3IatzCn27i
	dpO4MAosrW7lNzex+yopDSS8lX4ydClwS+Bjdn2IBA4mDnsM+nKZP1aNeHJ/+zgAZzzXXqJgVet
	zzi5a4FGZ5ms2+68wqstERj71FG2Zvxj131LkASHKrYf8Rt6Nxz72FdX4EUxHP2bDNOH2zDcl8j
	McgeVxlaQKKuvoXOJ/ncNsc7cum/c6nOfJalTPbtY++4VC+nYHQXX2bG0DHTvGA==
X-Received: by 2002:a17:90a:d44b:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b3d07c2479mr1638407a91.55.1794986695524;
        Tue, 17 Nov 2026 23:24:55 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56ee297sm934947a91.4.2026.11.17.23.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:24:55 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: jeff.hugo@oss.qualcomm.com,
	ogabbay@kernel.org
Cc: carl.vanderlip@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	jacek.lawrynowicz@linux.intel.com,
	quic_pkanojiy@quicinc.com,
	stanislaw.gruszka@linux.intel.com
Subject: [PATCH] accel/qaic: drain the control workqueue before the device is freed
Date: Wed, 18 Nov 2026 15:24:48 +0800
Message-Id: <20261118072448.1259909-1-shunsheng1218@gmail.com>
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

qaic_pci_remove() tears the MHI controller down and destroys the DRM
device, but nothing drains qdev->cntl_wq.  qdev itself is allocated with
devm_kzalloc_flex() and is freed as soon as the PCI device is unbound,
while cntl_wq is a DRM-managed resource that survives until the last
open file drops its reference to the DRM device.

resp_work is queued from qaic_mhi_dl_xfer_cb() and resp_worker()
dereferences qdev, so a work item that is still queued, or still
running, when the driver instance goes away touches freed memory.

mhi_power_down() moves the controller to the shutdown state, disables
the interrupt and flushes the state worker that destroys the channel
devices, and mhi_unregister_controller() removes the controller, so no
data event can reach qaic_mhi_dl_xfer_cb() once
qaic_mhi_free_controller() has returned.  Flushing the workqueue after
it therefore covers every work item that can still be queued.

Fixes: c501ca23a6a3 ("accel/qaic: Add uapi and core driver file")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No QAIC hardware was
available, so the teardown race was not run.
 drivers/accel/qaic/qaic_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 90c0d31e414a..c4c3f450e67b 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -625,6 +625,15 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 
 	qaic_dev_reset_clean_local_state(qdev);
 	qaic_mhi_free_controller(qdev->mhi_cntrl, link_up);
+
+	/*
+	 * The control channel is gone, so nothing can queue resp_work any
+	 * more.  Drain it before qdev is freed: the workqueue belongs to the
+	 * DRM device and may outlive this driver instance, and resp_worker()
+	 * dereferences qdev.
+	 */
+	flush_workqueue(qdev->cntl_wq);
+
 	qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
 }
 
-- 
2.34.1

