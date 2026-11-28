Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886822;
	b=dcuZW44ltkFeVLkOhJe2vaHcuNYHy26T4WTX6ajS/ba6zgg6P0mTwIYPo2Hqv/jvnsj6
	 ck+QXuFKgHEBIAHn+K9vbycKAAfEdz3PAohD2hnQLu6PQWcUpb0oNyIbYvX5Tj38C7PMn
	 vtqqIPit4PIpp8ufxMRPPQzWbcRAqRXrNrAZRrE7moHLf2/DFq52tzHZVKyq+VezeaL6s
	 BsGGNWeychFo+hvVe1hb5Ebp/5OhHhnfCKGWGazPKOKPWdoe3nTexy7yAd/2i81POCL7H
	 gHRW6pCabRApr1T12WkqPXqGcfDy4sYjL1a7lAytTm/WjuV02rrcvQ5AtK0/YiFFqdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886822;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MsQDy68/eHJX9kazcDlLG8TYevCvQUkKjIHqpqPgDe4=;
	b=rVr8UC/8wtbkvo388IK/7LqqYbEF8xH/bMMKuJ8GxY+83Jc7Sd8YvnaOt51CLdGAWALY
	 1Cfr+FPthGg5hpAvGoEiFs5gXa3rVCysdROKEbMVot+73HapiBmSsMP9UxRx8YEKohsKk
	 MgwOChogrsxwJB7RaqLH9Q2O6Q6wAkeAVUoodCt3Zfaty2O6UVvoOgQNULds8WZ0jDnyo
	 vyJH3xP/UhdQ6MJFyz/gajf8XZ9PNdj3cPNzgNBcWtwM0H86kOSBsydGyzYTGmS9i88iF
	 T9+S4GvZ6O2J2HhdoLGo+5cB4G+YLrN6tHGYPzEhX+WU2IFMQP+FcfBN292/izIn++Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyNq9Alz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB2D606A6A7
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EyNq9Alz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886822;
	b=pD/IdLNSbR0MPITmEeRZyZazmIEg/Sow4p5ykfgk5YypeDTsx+Qf5N2eUEvNQD4/mA+R
	 q01fMORBDzdYInigCM0Lgo4Y/R0vhnOkTO6dYQilpF4fEhSBFyoAGB/DwhqkkDM8vLnKB
	 q04jdvzTsfD0bUAivjfyNv4baFbtHL62luyeFWfBTMR7D3YFHclkTJmFuHgh8muDYUkOH
	 /w/25QW3A7iaAYvgd7YduaGLMvFICqdtO8y2AxOo/pByZd/guu9n/Mm2h7UU8K1K3VaUP
	 qcrjwI2dS1uqHELVwFHfwJFyvbeIAule0XA+znXPtSwkRdWjWLbOZoK18NWf4zFlTdQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886822;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MsQDy68/eHJX9kazcDlLG8TYevCvQUkKjIHqpqPgDe4=;
	b=uBAAJJjeqoH/sW663J2gpA7TzMbAOQQ18gzDpWq0+iF1m/eS3mQBmMlriTs/uv5CDwco
	 0pLDockWddiJbxTQ1eamlSzz+YyjPX0l9lIwDHogx2PbB8vITPtuh1o7NsrqT7bzCJ57H
	 M4oxXaIAMG/mJVJQ7pp8nNtQXtJEwxiSXO9ryqmWuO9jajrpa8/UwKf5C0Mka/wYqbfX4
	 svloN0H9mYPkiGUeJgw3L2LO5hGF7dUFAcAYwTY6ASnvy65Ufz3LPzDInB2BZaIWGCNDv
	 U6JLf7OtKg+C/1AH8MaEwTQg9GMS08QG526imf8isrCxR29k/pfcux6Ewz+QkEWkY3w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CB231F00898;
	Sat, 28 Nov 2026 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886822;
	bh=MsQDy68/eHJX9kazcDlLG8TYevCvQUkKjIHqpqPgDe4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EyNq9AlzsjJHtmSWfDBOhv4KUKsEo3Z/mUORw/O5aQPA+baSjNUyAmNS1Bjgx241T
	 XJ7wo3PttYhZ20dkBSImxsuV+jc/U/eQbXxfbxXVw+z2fJyjyLnMzJWw7RrcrdaG2e
	 84EO6R/cy2HKNnH7876aQLycIGoFJC00vqjdvCLqayWfKRlGNS4jJIJ50yqSCX69sf
	 04QX2CJ957se+HL66f3d2AhYjvOW3aonCxsr4tRmPY9YuAu4WRK1d/qIHdpCD2UqDe
	 tOJpzZNj5UbI2psc3af9LUwDIDbBJird7nF79BaYoQGPaVvzn7WeTqukL05aSOYthR
	 mACDEXH3WOerw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DA8214E19F;
	Sat, 28 Nov 2026 17:26:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:46 +0000
Subject: [PATCH v5 15/17] drm/panfrost: Keep the job interrupts masked
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
Message-Id: <20261128-panfrost-long-jobs-v5-15-e7d62045a676@gmail.com>
References: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
In-Reply-To: <20261128-panfrost-long-jobs-v5-0-e7d62045a676@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=2619;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=MmcXjqwywSypeIS6dJaP2eZDGN/CFfrEz6TGp2P6oUg=;
 b=/GxLkQAysmG9mjRZN/4C16ImOFWnEPLI/bxF3k+PKAL5gZTRIhmkcbuswGqADh2LiwcDv7OTx
 m/WzZRrmIxSBT3LRh/i+gv+64qQ6R2wzCZZtg8Q3TG/6TOHMj550dvY
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
panfrost_jm_suspend_irq() there.

Take job_lock around its mask and set_bit, and around the IRQ
thread's bit test and unmask: a thread that tested the bit before
could otherwise unmask after it, and the hard IRQ handler returns
IRQ_NONE without masking while the bit is set.

Fixes: 1d0cab5461d7 ("drm/panfrost: Make sure job interrupts are masked before resetting")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com?part=8
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v5: job_lock instead of a second mask write (Sashiko on v4). With a
test-only hold in the IRQ thread after its bit test and a job
interrupt pending, v4 unmasked after the reset's mask (100005
IRQ_NONE, IRQ disabled); v5 did not in 8 of 8 resets (3 IRQ_NONE in
all, at most one per reset).
v4: new (Sashiko on v3 08/14 and 13/14).
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 74cc3dd02..ebdf16968 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -455,9 +455,11 @@ void panfrost_jm_enable_interrupts(struct panfrost_device *pfdev)
 
 void panfrost_jm_suspend_irq(struct panfrost_device *pfdev)
 {
+	spin_lock(&pfdev->js->job_lock);
+	job_write(pfdev, JOB_INT_MASK, 0);
 	set_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
+	spin_unlock(&pfdev->js->job_lock);
 
-	job_write(pfdev, JOB_INT_MASK, 0);
 	synchronize_irq(pfdev->js->irq);
 }
 
@@ -696,8 +698,7 @@ panfrost_reset(struct panfrost_device *pfdev,
 	/* Mask job interrupts and synchronize to make sure we won't be
 	 * interrupted during our reset.
 	 */
-	job_write(pfdev, JOB_INT_MASK, 0);
-	synchronize_irq(pfdev->js->irq);
+	panfrost_jm_suspend_irq(pfdev);
 
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
@@ -860,8 +861,10 @@ static irqreturn_t panfrost_jm_irq_handler_thread(int irq, void *data)
 	panfrost_jm_handle_irqs(pfdev);
 
 	/* Enable interrupts only if we're not about to get suspended */
+	spin_lock(&pfdev->js->job_lock);
 	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
 		job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
+	spin_unlock(&pfdev->js->job_lock);
 
 	return IRQ_HANDLED;
 }

-- 
2.55.0


