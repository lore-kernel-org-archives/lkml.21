Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685862;
	b=tbig5cqbA2m/ZjpTi9vbaNgXBuH8YMUY0OBTsMc7R5mwyVt+4XRIN47/+lMcLfgb56d+
	 dQZRzH2dN/xjls3/5XbgDki1nE/FUp8I2e5GV1zBbxqECimEIODF1Ae3y2/mqvnI/tAUV
	 hMa8WlXnrpzIfn1gHx6UFFCPTXXNTxzXYEG84bPAJNS/dSIGpn+lWsXLoim+lw26QcnvM
	 hCm1AkQluUej+btszslP5asuUgtVvb6z7EZjGcLrKqanOOISQuNdNe9wlWbWdXTEGbyu4
	 qZljOSBi1Tq5Omf1S+6C3xWVuTwANcHMIOfd1hdX/ODITx0rZ4SngSRtWil9oTe8F7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685862;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iB2rK2HF5YVHUIf8OZ4ufHb3/01QLr5E/VHA7mic2QQ=;
	b=leP9r9UtQsFKs+4qY7kjKX0wQ2/DTptEFehSICYC+N8VkeCJHlTG2ZBJ47qeN/9QAcqQ
	 TIOwG1FsbKwSdAUOERRnFusXnRilO3j4L4C4ZVJdq1eTVZlC1dt5awJTbeQd2azShWZAu
	 NnaIjUTHjAMbdTDMdz4LHFzPVjkUy6RaNKT3WPfxgI+W9eoF1Os0CLR9O5HE4pirr7WJt
	 ZyZ67F8GCENBUM9NzqX6wRT/GMbsbi/XCrWqsBeonTho5XhILQpukl4s8gL1PpnEwFTJU
	 BL+qcOIrtjglS88bP+v/r3fnwNdrDOcSYwH1tFCwoBjoBx7HK6NG8fxo9LLvJRzar1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYgkjBRR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D60606A687
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dYgkjBRR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685861;
	b=Bn3GEw7VCX4w6opjDTZIThiuH9eMMkf+36Fjh2eELsI1fWe96NRXSXrLMslS5AMNVRzJ
	 kheLAOhTTY53NWYONxZ76H8nzjp0UIgaYFQC6Dq7AAQN8xn3f+9MNPtqpVGqEQ9ZuPJWJ
	 PYzLPb688PpcHtWa8HrD73bX+HFy3AeHdJHqPYjdxJ/5P32IkDOwydo1h4r7/zGbmzkQV
	 WwwPsMuITcUQ2zYKY9piwSC3QygYcB/S8xGPtZYW9TZEpYGd379hrBstxsB4SV34+Q66+
	 QzEmnveuCEkPxW5fTx90QXs3Up1ZVENFPzzYgLuHP+tJXEDuKtlmhDBWKfRBjB31DZg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685861;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iB2rK2HF5YVHUIf8OZ4ufHb3/01QLr5E/VHA7mic2QQ=;
	b=v+NzNtuewaJoDl7nhCLByK4/YyhNi2z030g8AooY6vmPw6PqmBT6wmmYWeXO14sPia4r
	 D/Wzi2CfjOk/D8IToJZgasJAzmdFLpJe1SzVMUS+T5dpVktVihdK7zvYxOWrv4twvXAYt
	 I9DH779yvGC00DrAgmVJEch6Hu5j+Sq0Nq2DIiijI2i7U2IlG0ReiiYxOSgh2NRxHXQl4
	 pKw1KOumVdsBc+F07qFoGcOlJ4wZuqTmiRWp+gkOdf4G8UY7CSJq91HiS4bRb9NBOOUt3
	 Q36H7YWPVNBiC2Xj2akmN/13CeKn88jbtfMjgkxl3AGOPrxVGFB/t/UftWgRjU+1kpA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 47C3A1F00A3C;
	Thu, 26 Nov 2026 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685861;
	bh=iB2rK2HF5YVHUIf8OZ4ufHb3/01QLr5E/VHA7mic2QQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dYgkjBRReB0e1IqK+tkBY8EVXx0rd9Cf9HKp9CDenS9otmsCeRx7XkKecK9WSNCTv
	 SZzjYAHZ2s+W05tHFUWdTETiCgDgVT6/+dvVhehI/DENBOpH8ji+e+w6OEe72hj+bc
	 z4Kr+DJNJp8sRfwneg4/+8eLWTUqKQSfVKk0m2I9EtpkmdNlsGIrTKNbxxP97jI1fQ
	 P5qQcFJZnriaF94ElXdiznA3Z+Ir1juVGGw0BnodXkvLeXcRYaf1neqzgH1Zu2+7MZ
	 RF+AfQpDTUV5K6csFsGPaM0jfX4iguqgEGyRknZ/SbMQVmXiWOPTFrRsbmoydAZ/XT
	 4kKo6bz6VYGMg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 220034D3A8;
	Thu, 26 Nov 2026 09:36:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:36:58 +0000
Subject: [PATCH v4 15/17] drm/panfrost: Keep the job interrupts masked
 during a reset
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
Message-Id: <20261126-panfrost-long-jobs-v4-15-23579629ceca@gmail.com>
References: <20261126-panfrost-long-jobs-v4-0-23579629ceca@gmail.com>
In-Reply-To: <20261126-panfrost-long-jobs-v4-0-23579629ceca@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685806; l=1694;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=6YqPIH+zOU03hye/YOaqcl9r7BbJ+n1uwdvcsqhKcTY=;
 b=o2LHgilBuUxSuZE91SSgqBhGXilMU246E48lGDIfGUWbyBe8W13i1lgiLkptMtxUsc1za1FMc
 bt/uQyVddFGAYTpsj4d2171fPfw3z3+jPVyk1295WapQwfxIPWR/fSx
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_reset() masks the job interrupts without setting
PANFROST_COMP_BIT_JOB, so a running IRQ thread unmasks them. Use
panfrost_jm_suspend_irq(), and mask again after its synchronize_irq()
for a thread that tested the bit just before.

Fixes: 1d0cab5461d7 ("drm/panfrost: Make sure job interrupts are masked before resetting")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com?part=8
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: new (Sashiko on v3 08/14 and 13/14). Tested with a test-only hold
in the IRQ thread: JOB_INT_MASK read 0x70007 before, 0 after.
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 74cc3dd02..7a2503f4e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -459,6 +459,7 @@ void panfrost_jm_suspend_irq(struct panfrost_device *pfdev)
 
 	job_write(pfdev, JOB_INT_MASK, 0);
 	synchronize_irq(pfdev->js->irq);
+	job_write(pfdev, JOB_INT_MASK, 0);
 }
 
 static void panfrost_job_handle_err(struct panfrost_device *pfdev,
@@ -696,8 +697,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 	/* Mask job interrupts and synchronize to make sure we won't be
 	 * interrupted during our reset.
 	 */
-	job_write(pfdev, JOB_INT_MASK, 0);
-	synchronize_irq(pfdev->js->irq);
+	panfrost_jm_suspend_irq(pfdev);
 
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {

-- 
2.55.0


