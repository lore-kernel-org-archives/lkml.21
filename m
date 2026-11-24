Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483808;
	b=R3SfHIF7PYXqz5fkTb24XNk4udizkgO2K79lEwfSZiWQmnqUK5VQx6mHqqfeq7EEQxkv
	 TwbpFMVWo5IuoslEaoP8+Bqjt1W+HhPjYS6e1cQhjfRDWdJxu0eyGsg6jMjrm5QZDJ5pJ
	 Al5NwKtiLBBKW9UwUshC71/JagM2Rdhih/4tzzTxG3zjJObrAA5FHJyt6JF7rl2Aqz4oT
	 cSE5GQF4vM8Uy7Hkk8Ob7sGvonMo3a8wRrboDMPC4h0Sv+ImX0eVluUwsCV1zplBLTcRN
	 NpO7/rUvs+bEwLIzfQ0P3kZwsQ7uDgP71v5gbP9HpLS5QQn1LqoIAJV5ILCgbMzsXGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aZ+kdjMwzLW6D1d8Noa04UT5HiQC8LgMJZGM4R3Q9WU=;
	b=fwuHk9ncT4Cy1c8Pn7Lgnnf/HDURbTdKdEbydA0ETpFEMiN7AuCHwQaFG0F+ef1gHkav
	 c2GA5FOyj8iGO80PLt1xAiu838GgzLng4g2X8Ob0nN/a/1fYt9JtkJwfuxtUHsGmIrvai
	 p8rCWkzCaRM0+87qvpS5ePgI2yc0pdNFMmeXy50+rZh/dNza1Ob0xUxXKejftUB6hTG9j
	 bFqEt26U4YpaXATvlK1JKIeXOYSYPf+CtemSLhjEFca79XuIe8akteICS/l9r57RE8iwZ
	 BAmW0jkcmxBq0As1xlCNO45W2pzPqrvuFrlGD3WjG3VXd0wwyeq3FbO86nqR4aLVRSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UBmAvtsh;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D81A606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:30:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D81A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--powenkao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UBmAvtsh
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd48746a49so2322923a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795483807; x=1796088607; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ+kdjMwzLW6D1d8Noa04UT5HiQC8LgMJZGM4R3Q9WU=;
        b=UBmAvtshi1MR+jB7Et3WRppr+mRq801u72XXTzXTUR2woLynEgQLZkpA/XuR2+2KhJ
         lDJZEl0GfJgXuvl3USjrgcRiW8n46q2YNOz8D0HcUJY3FzHyHezef0jYdIJttM84zLUS
         gByv7Xt7HCbTgsSF0+YFm3metxFqAgIO10DPSOdZJ6zrsU0T87zZlpX7XR1VUpO0f/oC
         Y6NvOz60DPnHP40QJk724++/H8XK0uJTeOa2Jly4M7QSXFgy5gL0PGZXCy6iaKV/EZkP
         IoxBy8Gl/r5ekwD9cajmVnGudHMStVAEH0wjeeM9MUjmsMJmNLEviaf+H9wT7+VYYplL
         vm3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483807; x=1796088607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZ+kdjMwzLW6D1d8Noa04UT5HiQC8LgMJZGM4R3Q9WU=;
        b=RKpTD9RfL2gA6t9kcWYoeJTmQ2VUoI5gyKFPNLYHPz9An8gInnqhU5EDrrzPC1J+IY
         S0+u+OskObNAFOgdJTcu+aCbQlCICTwroRoEqt2uWH56/DPxBKPZrC4zCY3DqJeOy14S
         gBvesg9/+RZB6YX5lQ8UivdVBSYjf9bafKsomf5VEAehyabyq4f92wscANRwjoc4VfRs
         J1sYsDBGyuGjCa+gItGDO2SJyU0jDMyTrvKAMizG6aFNXKtC1TtdHaMYvF8MkUOOyYie
         GMJMO0gSKvoRYgLQTp0DC1tEhv6/ov34Zfk+sqxnPXGXoYD09CpK/ZwuUyhvKfOfYw4E
         goHQ==
X-Forwarded-Encrypted: i=1; AL+hErF2EPu8iNOLMUiaLzE/+0RJRmDzBHoRSIfEU+U0NvYhSm2G/sYTF4WJsqiLYrDq0vvL7TSVdnjwnyRGcdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qr/Iny5ECicjB9+CtalQHNYh0oM6QcVRRf6QvrMseaZt3j/uJ
	HE8ljZN7fMDvUmggy53eiNXC0bD9FrMz99xQsxgZy1hrKyy8w7TX0ipOVUVRJRNTVPjebFUsYA1
	ZEYAUd9wyAnVvrQ==
X-Received: from pjyp3.prod.google.com ([2002:a17:90a:e703:b0:3b3:ec38:c78e])
 (user=powenkao job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1d03:b0:3ab:31e6:12fc with SMTP id 98e67ed59e1d1-3b41c5574f0mr12394867a91.0.1795483807147;
 Mon, 23 Nov 2026 17:30:07 -0800 (PST)
Date: Tue, 24 Nov 2026 09:29:32 +0800
In-Reply-To: <20261124012951.3143833-1-powenkao@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124012951.3143833-1-powenkao@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124012951.3143833-2-powenkao@google.com>
Subject: [PATCH v2 1/2] scsi: ufs: core: Defer debugfs init until after device init
From: Po-Wen Kao <powenkao@google.com>
To: linux-scsi@vger.kernel.org
Cc: Konstantin Vyshetsky <vkon@google.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>, 
	Stanley Jhu <stanleyjhu@google.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	Brian Kao <powenkao@google.com>, Li Qiang <liqiang01@kylinos.cn>, 
	John Garry <john.garry@linux.dev>, HOYOUNG SEO <hy50.seo@samsung.com>, 
	Hyeoncheol Jeong <hyenc.jeong@samsung.com>
Content-Type: text/plain; charset="UTF-8"

From: Brian Kao <powenkao@google.com>

ufshcd_hba_init() currently creates the debugfs hierarchy and fault
injection attributes before the controller version (hba->ufs_version),
controller locks, and device descriptor (hba->dev_info.wspecversion) are
initialized.

Move ufs_debugfs_hba_init() and ufs_fault_inject_hba_init() into
ufshcd_init() alongside ufs_sysfs_add_nodes(), and move the matching
ufs_debugfs_hba_exit() from ufshcd_hba_exit() into ufshcd_remove()
alongside ufs_sysfs_remove_nodes(). Use disable_delayed_work_sync() in
ufs_debugfs_hba_exit() so an in-flight exception event cannot re-queue
debugfs_ee_work while scsi_remove_host() is still tearing down devices.

Moving the exit call symmetrically keeps probe error paths from tearing
down uncreated debugfs state, drains debugfs readers before
scsi_remove_host() removes the WLUN during unbind, and lets debugfs
initialization inspect both hba->ufs_version and
hba->dev_info.wspecversion directly.

Suggested-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Brian Kao <powenkao@google.com>
---
 drivers/ufs/core/ufs-debugfs.c | 2 +-
 drivers/ufs/core/ufshcd.c      | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufs-debugfs.c b/drivers/ufs/core/ufs-debugfs.c
index 9f83628f3e2c..e62b942b37dc 100644
--- a/drivers/ufs/core/ufs-debugfs.c
+++ b/drivers/ufs/core/ufs-debugfs.c
@@ -529,5 +529,5 @@ void ufs_debugfs_hba_init(struct ufs_hba *hba)
 void ufs_debugfs_hba_exit(struct ufs_hba *hba)
 {
 	debugfs_remove_recursive(hba->debugfs_root);
-	cancel_delayed_work_sync(&hba->debugfs_ee_work);
+	disable_delayed_work_sync(&hba->debugfs_ee_work);
 }
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 56a77f4a2a6e..f1df1d6734d9 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10115,9 +10115,6 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
 	if (err)
 		goto out_disable_vreg;
 
-	ufs_debugfs_hba_init(hba);
-	ufs_fault_inject_hba_init(hba);
-
 	hba->is_powered = true;
 	goto out;
 
@@ -10139,7 +10136,6 @@ static void ufshcd_hba_exit(struct ufs_hba *hba)
 		ufshcd_exit_clk_gating(hba);
 		if (hba->eh_wq)
 			destroy_workqueue(hba->eh_wq);
-		ufs_debugfs_hba_exit(hba);
 		ufshcd_vops_exit(hba);
 		ufshcd_setup_vreg(hba, false);
 		ufshcd_setup_clocks(hba, false);
@@ -11027,6 +11023,7 @@ void ufshcd_remove(struct ufs_hba *hba)
 	ufs_bsg_remove(hba);
 	ufs_rpmb_remove(hba);
 	ufs_sysfs_remove_nodes(hba->dev);
+	ufs_debugfs_hba_exit(hba);
 	cancel_delayed_work_sync(&hba->ufs_rtc_update_work);
 	blk_mq_destroy_queue(hba->tmf_queue);
 	blk_put_queue(hba->tmf_queue);
@@ -11505,6 +11502,8 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	ufs_sysfs_add_nodes(hba->dev);
 	hba->dme_qos_sysfs_handle = sysfs_get_dirent(hba->dev->kobj.sd,
 						     "dme_qos_notification");
+	ufs_debugfs_hba_init(hba);
+	ufs_fault_inject_hba_init(hba);
 	async_schedule(ufshcd_async_scan, hba);
 
 	device_enable_async_suspend(dev);
-- 
2.56.1.809.ga0b61035b5-goog

