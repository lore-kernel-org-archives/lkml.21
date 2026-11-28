Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886814;
	b=WHmKJEEpU+sEDPBIF6BvodAXbjBRl2Z1Ig/o7CH1fHvd1Ej2Hd0sNf8YU/r5alhPhYBC
	 qOHkee0nxqFb1XG8Qa5maZICPrZmJ3P61yb2hsxhTMlB2NUR02hh54zMn3wRRDUyDXD6Q
	 iWDhBYKSk3k2Ic98cM1+6EirycRi+xceZuX2JlNLZO78XXS1GAYOfL2OES5gyUl3bDF4d
	 MG8dh7XKKBG3zUl5aPbMYaBT7XOzA3oywSyAO6s/JUaK2j+sP12Q8XI88aWW5rvqD7TzQ
	 EczBg2OgIurHkrqoFX8jcPdASU04vequSweLb25N+vy+WlTW7nwvpJlCKB5H8RCiXtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886814;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GG/w7h2FW12TWaQgOdgTi4664j2z5J2KKWC6RdlXPaI=;
	b=JGoLfh1iNEJq4KzvHBS1NaFdy8lZxK8HFabK1lX+zlKqETM1QtvhK/FsD1NTxLQaU8FN
	 iDB0flrcRGvX50RzGsRD14K/V2QBwXtegbR4br80LeGDMqt5VkDBOQXXBC/sjlO0YzFF7
	 X3R5kOQKFftvjQWOLf9RZZnAtEelhrRkr2TciSQfiRcdM1AASgyweX6ZU5IX8se3+xGR6
	 0yixK6cYrKWat30jnRzBcpZ/xuy7rvcVE53L8gsjAsmNgOI8PXTaCQRdmVJtDoNzcLfsy
	 UUQWica1Fyx397ZZwDYbAalFSBNEvR/xewCy+dCSwTOhK89Qagpol7j/oCgGTiuEBnA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fASpinL7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB35A606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fASpinL7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886814;
	b=qyCAugOItfDcl+dmXFqTAm/yEVysHEStR9QC01Wroxva7viyq1P6Q8vov2z3utctmN8S
	 nRUxLJA0Qry5xKQ3cuN+nR2BBeUJWqFXbMhJoQiDZGjrd3gjaGRBFV+BMxCXXAS6Qbxkj
	 9TK+K0h6aNUEzLI5oPXP+/fGHsruBwVUKj7/p8ZKNtwjJPree7eN1Im9LiMmk0bFOI6bq
	 VEmTiZ8ijxKF5KrFnUDrHxcj+taGB/fg6M4338ja3SUqD9KbJR4oDZASTh7BclXseWp91
	 cFUtpRaKAH22vMl8O1qiGgc+tesy9NbrT9LYwTQFevo/NA/uMuw3mqnzlaCtRb0PxjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GG/w7h2FW12TWaQgOdgTi4664j2z5J2KKWC6RdlXPaI=;
	b=nHPpObenvUpsJjI3cjHd0yNsobam9SyM/DlpSOLu+6U9tQyxEqtCRDVmpxd72ohrBOWQ
	 LS1tF4qUQolWMCiAwT80q1ohrDnOn9qo05+ANpBdM4Emgl6aWIL3OCGO9gNfeyHwgt6So
	 rWW0eZGsEfFLYbf6eZU5RGixOUXTHRlbYxzN1kclTziD8aCi5Lh0yukKhvJr14gq0lVKq
	 17QSrZp6nK+fA0fT295qYON+9IShY2oSSAcXNPjHdDP0nTqdvVY1rh3/55jqhuvCMWBV6
	 U2ZHZWAejR90IICB/Sw7F9kP4QiEmXVT7rBXTo3dAx/4+PX2ZYCuvohQyDJ602s63Vg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 585661F00A02;
	Sat, 28 Nov 2026 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886814;
	bh=GG/w7h2FW12TWaQgOdgTi4664j2z5J2KKWC6RdlXPaI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fASpinL7FYNYYSbY57sOI4tSVa/WyAnYIgz8kQCq2HkPTiQToPuca1imzq7ywtpqE
	 jMfg8+JzW5MB2WtWlSIypRWpFGJDSV0uG+6tIqgVAhLPyEDgIeltgSXbxN2pluW3ke
	 smw0FLBtfQ9N2w7ddGc7T54v3gmasmQtFkJAWjyiySANqGBoBr49oUT5qifdlkycDU
	 +E6SqViUN6aKfzPviUQRhhrkBJC470GSa5Hr0S9urwtlRcFccMVuAzU+K2wIvTq/8u
	 IDpvkk4dHad2Sled2T0FxG1vR47Lm2+FFroC1PA02c/fBq+cIWE1mpBaWr7M1ZyHOl
	 Ugd2oMegwxuNA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E5A84E187;
	Sat, 28 Nov 2026 17:26:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:40 +0000
Subject: [PATCH v5 09/17] drm/panfrost: Don't signal a job cancelled from
 _NEXT at a reset as done
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
Message-Id: <20261128-panfrost-long-jobs-v5-9-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=2563;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=+0lclni43/Dq9naPCbsA255rI8BnM42gaj99yqkxcKM=;
 b=UgR2/Yc27yoLYwjqFyC4XyWrHebfZwfvEVD7C5SwMA2ZoFL1lKrd6dQFx7FRS8JiJpz06sWPU
 W+sAJ3PonfKBzNePWSKtxjQGBVAJ9uA7DoMI05k0XadQr+yt7rRpcjc
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_reset() cancels the job in _NEXT with JS_COMMAND_NOP and
soft-stops the running one. If the running job completes instead,
panfrost_jm_handle_irq() takes the cancelled job for done too: its
fence is signalled and it never runs.

As the Arm driver does, read JS_HEAD_NEXT after the NOP; if it still
holds the job, take it off the slot and restart it with the others.
Found by Sashiko. Not reproduced.

Fixes: 030761e097b4 ("drm/panfrost: Queue jobs on the hardware")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206581@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index b5b523cb2..c9bd3555f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -659,6 +659,7 @@ static void
 panfrost_reset(struct panfrost_device *pfdev,
 	       struct drm_sched_job *bad)
 {
+	struct panfrost_job *evicted[NUM_JOB_SLOTS] = {};
 	u32 js_state, js_state_mask = 0xffffffff;
 	unsigned int i, j;
 	bool cookie;
@@ -694,11 +695,22 @@ panfrost_reset(struct panfrost_device *pfdev,
 	job_write(pfdev, JOB_INT_MASK, 0);
 	synchronize_irq(pfdev->js->irq);
 
+	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
 		/* Cancel the next job and soft-stop the running job. */
 		job_write(pfdev, JS_COMMAND_NEXT(i), JS_COMMAND_NOP);
+
+		/* Never started: take it off, or the IRQ handler completes it. */
+		if (pfdev->jobs[i][1] &&
+		    (job_read(pfdev, JS_HEAD_NEXT_LO(i)) ||
+		     job_read(pfdev, JS_HEAD_NEXT_HI(i)))) {
+			evicted[i] = pfdev->jobs[i][1];
+			pfdev->jobs[i][1] = NULL;
+		}
+
 		job_write(pfdev, JS_COMMAND(i), JS_COMMAND_SOFT_STOP);
 	}
+	spin_unlock(&pfdev->js->job_lock);
 
 	/* Wait at most 10ms for soft-stops to complete */
 	ret = readl_poll_timeout(pfdev->iomem + JOB_INT_JS_STATE, js_state,
@@ -720,6 +732,9 @@ panfrost_reset(struct panfrost_device *pfdev,
 	 */
 	spin_lock(&pfdev->js->job_lock);
 	for (i = 0; i < NUM_JOB_SLOTS; i++) {
+		if (evicted[i])
+			pfdev->jobs[i][pfdev->jobs[i][0] ? 1 : 0] = evicted[i];
+
 		for (j = 0; j < ARRAY_SIZE(pfdev->jobs[0]) && pfdev->jobs[i][j]; j++) {
 			if (pfdev->jobs[i][j]->requirements & PANFROST_JD_REQ_CYCLE_COUNT ||
 			    pfdev->jobs[i][j]->is_profiled)

-- 
2.55.0


