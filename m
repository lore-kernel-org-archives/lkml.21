Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764311;
	b=qyI3CV8UiSys8YzSUnMam9V6PPgRHYpzY9UKs2jtC6TGEmHemElntzX+eCVOkM+NeXgk
	 6mbaq0nOYNMXLk4/xlEqAX0BeJNZG+aecrNoSsiiG0wJz/kCfaeU2i6/IdMWsew34iCpr
	 6izMR9ZpS46hU1LscLKgNX1XRPuziIL22bStkXeOK/V6LKTOppcIlBTzWL09bR/rlrCqR
	 WWeW/RDLMcGdDAG7DPrnGuJj2Egh+MICl9icAu+aDcCUwf3hr0YK2kBknKJYs5D9nqcWu
	 c+aAk/sbe1bD6FatZxmYUHK7Odp0dLKbCDH96hwjQFA9dQB/hQ2LwU85fBNICdTtZdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764311;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1/UnVkS186rBjFORx1WGGhaXS7CtMdNP4mwIh27hA8Y=;
	b=p5Vn5emZh+Nn3U57NTUNteM9hSLmKQHPcJVqJ4qOoOhg4xa2vbbS9qIlqhaOLTAXOmXH
	 CcsslPT1QnLFkoWNpmZZDPrnlnHdsqIDRMrIDpSn+qG8eBd3dGb5qF08fOv7p8zkarJLf
	 0hLFTpQ/xv9Bqzxd9tWc3n+r1aSBuDwI5h191ufgO9mQm+TgQBB4FAHdR4FMBmGtkUJiP
	 oKTGcapsJ+cWjIXxRdC2PZnC0mtsOgREyBMJ8IAiT+Koe/L+ux18t//lR8D58mq1ZiQkg
	 2I87G4oPFdKDQdY+mD/2xol3yyr2lm/BzQj/jB0SDWK8LMhqOaPArCNqWW9kdnlxLBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mu1wGTtp;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEAA606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEEAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mu1wGTtp
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a070781f63so3738892b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 23:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795764310; x=1796369110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/UnVkS186rBjFORx1WGGhaXS7CtMdNP4mwIh27hA8Y=;
        b=mu1wGTtpH7UUTWRT7TKwKzu3xkLTvTXP0a98+GWdOLXcaFf4mij7v2At8GSQ4bbJf4
         B15+Ip19sYUkCisl2knTnQJfFC6F9rs65Dw3jrrnc9KHFZ6PWAISYe8XGdjwRPLhWLkT
         HyAl1pGjZzz8bT1v05xJyGnnlHwyF44zaeKptaGPYFJyWZFFlxXOfav2IWesSZ4eYdpx
         9MTxHR6bw/a4yRdHPBYmoV7gizOSm5fF3syIC7aJtVm27V84zboleVlp1pYWilFTXI7y
         wYHcJodei2P0VUciszrQJOMnlg2rcvTGbjAymc9VpamcDga2JBSfQqlRs4lfvyLtNsIN
         jnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795764310; x=1796369110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/UnVkS186rBjFORx1WGGhaXS7CtMdNP4mwIh27hA8Y=;
        b=oDuhzbPaSW80vCfmnhrteExCTJnrFgu8APfB13KVzpqMJzjEjke65V11K9KlhDTlX+
         fBX28GGcgWY39QKmSH9gp4np2MuLIyF14CHTJ23WUrIqUP+zEnAA5qnHbvUh1+g1YkW+
         Lc4PIyno9dWee3fQaplh0elwzyeUyWX7QwVKsh0BbI3E3LZQnaUaom50HdbS402hYRdZ
         vqpkXZaNAvTYSO+t3gv+4fUAU/iVlXeGgZ1EOSi6ayF0RQF9udEELlmygkRYTRmBgmS/
         hvdLUKIUto/Ay/rhUMdGGlWTzv4OlnOujFa0IaH5Ol9zWpZGlIakRJDt4CiKKE+YtSgR
         3XCQ==
X-Forwarded-Encrypted: i=1; AL+hErHOe08wZs20UedalFb3m18Kr7E7ZozrMsyf9R4HQzg/YQRDSyHfKHstZ9+bE01104eS5TFK18IXR6YNT14=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iiO+xdRX1Rg3WfhLika8yJO4I1c4LIdV6n1Gt3NYzVRt1mLf8
	M2qC5MBX1w/yuth0A8z7Tos2IKPH7+0qSobGkHCe5OSlhGvgQol9oYPiErkmRRKl/KTAeg==
X-Gm-Gg: AZFdTZeqw1HjVGdWAGLtryTFS3Uq8UPR5ZN3+cUgIvEQ8rRqFNMRxdO1IPoCBUGUNT6
	o4bmcFlvCakCtf1cKvugcsKZ+upZIzRUo8o6xehM92LtNoVw9beleQn7xuocr49sOufTllSgLvr
	PmAp/n2XaxCP2/xkuwpBQwkVPuWsk3vKc8sTqTi+d++GdtAQ9BW6XfqmiAE3iavXblh/yM+nBwC
	CYV4RXBrR6lMoHIGLK1gBAzbN0CyZzHRBut+JZlfzSGw7ei9x+gkBIHrNfXWHBcXJFENOpV+9b9
	vfs0AWsPAv7JVCK/ATO8P1yUVn/WpY3sTxC0pHBdP0i2NFeqnGT2Re3js7CZKud/YhpL/ZVMG8l
	UyScJxb14ymswopPdFg95FBDqGVuWYxCDIzkxmxN2/p5Y9iTOAcDESlEN8D10CZjr7UtC7/ltQE
	raWKbcwsXhUXN/vNPEbM3mEefuW23OJZcU2d3mMcGp2PyxvUC0SD9IwP1zD+0DvDps+q/uGZT2e
	wxDvOuWRBLJ33l1X6nvX1hwtfVQSLj9pRbyH2JFuLDZkEOcZbSmhbYKTdZHgsgritB5ISaoFqG3
	YWdmJXP0pbh4Y+sOVea0+IO715F27B0X8Pkz6kLPlyRiNvyX0SN+hg/9Ih6lmT5J0tarmwmgEk8
	+B5JlXqk/upm13pii/rmd2qDSofDyUFmQPy+9VhuB7zfGX9Q=
X-Received: by 2002:a05:6a00:170d:b0:885:e2eb:23b6 with SMTP id d2e1a72fcca58-8c87b9cfab5mr22744252b3a.11.1795764309893;
        Thu, 26 Nov 2026 23:25:09 -0800 (PST)
Received: from lwq-server.tail118c18.ts.net ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e485f5sm12186385b3a.22.2026.11.26.23.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:25:09 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Bean Huo <beanhuo@iokpp.de>,
	Stanley Jhu <stanleyjhu@google.com>,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] scsi: ufs: core: disable exception work before removing hwmon
Date: Fri, 27 Nov 2026 15:25:03 +0800
Message-Id: <20261127072503.3922964-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126111400.2828356-1-shunsheng1218@gmail.com>
References: <20261126111400.2828356-1-shunsheng1218@gmail.com>
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

ufshcd_remove() unregisters the hwmon device while hba->eeh_work can
still be running. A SCSI completion can also queue hba->eeh_work later
during scsi_remove_host(). When the worker runs ufs_hwmon_notify_event(),
it can access the freed hwmon device and trigger a use-after-free.

Disable and drain hba->eeh_work in ufshcd_remove() before removing
hwmon. This ensures any running handler finishes while hwmon is still
present and prevents later SCSI completions during removal from
requeuing the work.

Fixes: e88e2d32200a ("scsi: ufs: core: Probe for temperature notification support")
Cc: stable@vger.kernel.org # v6.10+
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to e88e2d32200a, as pointed out by Bean Huo.
- No code changes.

Tested in QEMU/KVM (KASAN + PROVE_LOCKING) with an out-of-tree virtual
UFS 3.1 platform controller driving the in-tree ufshcd-core.ko (no
kprobes):
- Unbinding the device during an exception-event alert flood hits a
  KASAN slab-use-after-free in hwmon_notify_event() /
  kobject_uevent_env() from ufshcd_exception_event_handler() (freed by
  ufs_hwmon_remove() <- ufshcd_remove()) on the unpatched kernel, and
  passes 10-cycle A/B and 30-cycle stress runs with no KASAN, warning,
  or lockdep reports after the patch.
- Exception alerts on SYNCHRONIZE_CACHE during scsi_remove_host()
  requeue eeh_work on 10/10 cycles before the patch and 0/10 cycles
  after.
- Compile-tested with W=1 on x86_64 and arm64; verified clean apply on
  mkp/scsi.git for-next.
- Not tested on physical UFS hardware.

AI assistance: AI tools assisted with static code triage, writing the
virtual UFS QEMU test module, and drafting the changelog; I reviewed and
verified the root cause, teardown order, workqueue/lock behavior, and
the final patch.

 drivers/ufs/core/ufshcd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3c28bc67c65f..86100ac90fce 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10988,6 +10988,7 @@ void ufshcd_remove(struct ufs_hba *hba)
 {
 	if (hba->ufs_device_wlun)
 		ufshcd_rpm_get_sync(hba);
+	disable_work_sync(&hba->eeh_work);
 	ufs_hwmon_remove(hba);
 	ufs_bsg_remove(hba);
 	ufs_rpmb_remove(hba);
-- 
2.34.1

