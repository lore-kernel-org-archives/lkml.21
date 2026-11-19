Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107876;
	b=XuI7u8xUMRO/MWM4GOxsEFq0NvxEM5t0yv16DecRUfEypDX0zPfRN9hxH+bMccnBuZBU
	 53mge2aLDzblpVP3EAPMvRFo3FyZBkWcJpuZjKE8pCR3qzu8mBSRJtt9bz3zDu4Xx3pkA
	 Mc0Y3syHSQt24CuRsyp/Vu0ljJSoU3Fop3bQCNMknGMBSPMdXaqK8vN0qgFoF1nYqEwNv
	 ITJZ2kbBsl3c1OrZ/Xbcu9K9nlFDBgYxH2FMyuaLtmuBd+liBimERjhNN2c3SYWrCGwLH
	 8t0e0FcwL+TMeQcDC3+1z5HLhj2SdqZqZWZCaunUEj3xo18jCbDuj/JbGzwnrdu+B1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
	b=nkz7/4ya+9P2CUUiyuRNBVqVHJqF5PTBCRXwZIg19Ts/5EE+ZE93RTwrEbN/OGq/0KRL
	 ihdaV63oE7a72MATXztlbhMYZnV/FoPDcV4A5E1I7ucTRPvlmvUsnjZEqHtXneUV6DNEq
	 oxTE24xqZiggbN0Zs4c/+6IwPJ3fQGlGkjBM8vjqt36Gwv7tllMkmKKz39okatNhzEJ7f
	 SYVagA35TILni8Cm5YNgqFGKLJE5h5OO5BGZod7oLr9ZFS6dI6hcs7CDBmihuDgrp+GNN
	 Flc4AJFHNIZuFYDrwwrqCh2im3Tww1haFwypY25X/Fdm5YtXD9eErim5NIj26ur5wZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XaozYmjN;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63FE60A262B
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E63FE60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XaozYmjN
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3821eb27024so3084322eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107875; x=1795712675; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=XaozYmjNlK5S2WUDd4eFe21P7fsAnWJfqrF15MrWx3bI4ieixEZP2Ql/XGwiGJORxn
         tj+dYFKYBNW3b442ExjzQbaMyuAm5sLtSPqyd2GhRbLJwrOa06/ZSaT+IACMPLBGdFr/
         kdkNtez/UUQDs18J43GoqmamfUxy7XvHrp3TAEDmUjSH/3JFIFRC/4u0zS3MEu+KMl6c
         KiVHrdd6ja2K5o7kZm0KbiJTWurntWSjYyzrsSc3ZdODonk3H4LdzgouLB3AbglZiBbI
         SorpLkJZxrY6ksVxuMR4cWbS/hbGunCwdvVDkFBmJz9CHxWW9H/sbtwMWQcLaMqXBpHu
         Xggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107875; x=1795712675;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4YiOlg9vBcWp7cMSDzH4ZwuhUP6+NbvoiwA8GHj28Y=;
        b=hrTw1VcB8P3bVWOLE8VbjWqada+DVBXzwbOJxRjnxJ9W6N5Z7Xe+nIQQ4QM567zCck
         WlhXsnvPKnR8IBio6+jKx8DoUS9Dcw0WfKwx8nMoDaFeaFWluF+7kwRPIPVvJCqqhyRG
         HElplY+VunKkmY8R3P1UGgy24wk7ZNZRuLeWc+QFQ3/i6Ao0B9cvT/EERM19GWhQGv2D
         uXxLCsy+804djcDB+ENz1SrNwcn3v0IOKnlohJM5Fec7OwaPM8mzEbBhEnhSEkIjEFRS
         VvWcCj1wsM71ROERviaKz2oKzXt72+h+Xgq3gn52i945a1Ebke7JHMsVesNbCd/M+ARp
         Kulg==
X-Forwarded-Encrypted: i=1; AL+hErGXThVAdpylbODLGdrc2GqUNyyvhY6kmM/G0+2OHuPHu1OZ+tgOWrtN7nbh2LgZ8OuUayTMO0ZR7LpJWrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lTn/5TpaR5/QkLTVF9NCdMFrGXxxrVm1pLU7lhLFNvac4IE/X
	safK5Ctk7pd3q4vaWv9D9wgEVDKU3iYRZ2uGlz8/yr99lq36RMqXRZ1uTxMv75ZpDV3GSKoPjdD
	aTIemwLGkUg==
X-Received: from dydd12.prod.google.com ([2002:a05:693c:61cc:b0:385:900:c492])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:b594:b0:381:5fe2:8008
 with SMTP id 5a478bee46e88-38281eebbb1mr7411711eec.39.1795107874469; Thu, 19
 Nov 2026 09:04:34 -0800 (PST)
Date: Thu, 19 Nov 2026 09:04:24 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170424.1512172-1-irogers@google.com>
Subject: [PATCH] bus: mhi: host: Fix uninitialized status handling on BHI/BHIe
 read errors
From: Ian Rogers <irogers@google.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

mhi_download_rddm_image(), mhi_fw_load_bhie(), and mhi_fw_load_bhi()
poll BHI/BHIe status registers inside wait_event_timeout() using:

  mhi_read_reg_field(..., &status) || status

When mhi_read_reg_field() returns a non-zero error code before ever
writing *out, the short-circuit OR wakes wait_event_timeout() with a
positive return value while leaving status uninitialized on the stack:

- In mhi_fw_load_bhi(), only tx_status == BHI_STATUS_ERROR (0x3) is
  treated as an error after wait_event_timeout(), so any register read
  error where stack garbage is not 0x3 causes mhi_fw_load_bhi() to
  return 0 (success) despite failing to read BHI_STATUS.
- In mhi_download_rddm_image() and mhi_fw_load_bhie(), status is
  compared against BHIE_*_STATUS_XFER_COMPL (0x2), reading uninitialized
  stack memory if the first register read fails.

Initialize rx_status and tx_status to their *_RESET (0) constants and
require tx_status == BHI_STATUS_SUCCESS after a non-timeout wakeup in
mhi_fw_load_bhi() so register read failures reliably return -EIO while
genuine timeouts still return -ETIMEDOUT.

Found by enabling Clang's -Wconditional-uninitialized on an x86_64
allyesconfig build, with AI coding assistant help to audit the warning
and prepare the fix. Build-tested with Clang; not runtime-tested on MHI
hardware.

Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
Fixes: 6fdfdd27328c ("bus: mhi: core: Add support for downloading RDDM image during panic")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/bus/mhi/host/boot.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 19c84913cfb9..439bc9d0797f 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -158,7 +158,7 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 rx_status;
+	u32 rx_status = BHIE_RXVECSTATUS_STATUS_RESET;
 
 	if (in_panic)
 		return __mhi_download_rddm_in_panic(mhi_cntrl);
@@ -213,7 +213,7 @@ static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
-	u32 tx_status, sequence_id;
+	u32 tx_status = BHIE_TXVECSTATUS_STATUS_RESET, sequence_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -261,7 +261,7 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	void __iomem *base = mhi_cntrl->bhi;
-	u32 tx_status, session_id;
+	u32 tx_status = BHI_STATUS_RESET, session_id;
 	int ret;
 
 	read_lock_bh(pm_lock);
@@ -295,7 +295,10 @@ static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 		goto invalid_pm_state;
 	}
 
-	return (!ret) ? -ETIMEDOUT : 0;
+	if (!ret)
+		return -ETIMEDOUT;
+
+	return (tx_status == BHI_STATUS_SUCCESS) ? 0 : -EIO;
 
 invalid_pm_state:
 
-- 
2.56.1.708.g77570a6a1d-goog

