Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886814;
	b=jCB0JZZuoAIeU+VDMsS0IhdQtYaaXGIIzDpd0uFrfR2rGIH/qZxaOlx+G3iz4yI753Xd
	 Yz0uTIQxUpqXY15DJttjo7FXrVvL61f/yf4sMKxgB82OwraoQ/jwfQAqorNRoRnvexGkf
	 TmWPEtqLvnTHchdJbHmDjgCqEpLls7ybiJvp9j/NafGFxB55+Pq1qI2+M8AUJZgPAdFk9
	 KDwavZtaHMxc9N+eX7qLCGapSIHoZQxojcYY+7z2ykSnXLH2Cws85Wdo+stzGy0BASYoA
	 iVKWbvaMn0EtCkw1G2I8CVGCsD9xzeV0oU6DcQJ9w73hheKzu3WLjcOxkMi2CeY7kzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886814;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Vi65jhZmEorWcTmRFY2Go1/Dp9ZgmGzi6iEBf5pJZM4=;
	b=eQjiTVq49f4jcOoS2Nkd9Xk6n4u/mT5WqpM1+j+CFlH1GQpptaKY9crqeIJ07f03LE5C
	 20qvDuzTXTXVakhiY4Yds+26ZCRE/Lbir2l0U8IFv4zfXAZSpPSeTUFXmLHrsFFM04B/n
	 PKM53BQRZA/QpmZRlnlbhC4IqrBBvuDVbImbHZbt5I2ge2JbRNi/K0OZ4iNofN/dt9wrf
	 GpZwe+g59OmlCwQpJJ1A5Eb1UOkSL3mzuFPxSNKZEGpynqn4tE7JO91esFhQiHodq2Dlj
	 T73fG8KzUfS355RBZUIE/6QxIxFnimxqYciMYxbqQkQ53bg0i4KM3vfrLj748KbaJLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iCoKeZKQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA8E606A338
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iCoKeZKQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886814;
	b=x9qja0kGpvc2RdgbRvY//Q1+j0cItsp97eWHN/aW2OXEBOpFIEn/SLKegx3VjwEBjtkf
	 VlsAvyZ7eTK7wyLelaHcOsaFleZTvnPUR9ZU1iHaWyblsgI4wHXnuJr/+X0F/9/cuEO56
	 jV34ojuwWHQvCYbAmr4ndNa40NZB98dbiVggq2/TRBBCG/YZ/qIwJuc6/u9M2/CBfGHm/
	 PBpYEHEUO86y/W3r2CKr2wMHl0Fh8kmAap73RWnzwoIW82e518NvDc/hwkxGGMRZpaSSL
	 yu1JHXrqMh5yBiY4u8GzD/yQLizW9+X+sTg7MHsqKB7uTxSmqm0CrYDtbdnz0dR40Kw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Vi65jhZmEorWcTmRFY2Go1/Dp9ZgmGzi6iEBf5pJZM4=;
	b=ejskSKajDm8N4v+F16j81hq3VYlt4OZnw/Gbsszg+5enZrFdiOOs6s0nihBiiKYkc8uj
	 xxDEhfn+sZQHJTDiGL5eiDSNeLKm+e/kHx0vUziMyjhoS1RukzZI05uFkPjlHBWSGoLmm
	 lejVCPWFDMtPjxY4ZwXnYIs3BogVR97/H/NALsJIkgGPEiYyxClH/eTKVb/Nv36l6XhTn
	 rS0SL/lMr7aiPGCoK0C+8d5ylzxI83qCvIqixJZRvWO31CDKb6I9X0IGQqXjvHfQOVUUi
	 GuATSFiKGdYvZRgz8pjJxK3kTHe9xMgaN0esMGivn/+utkPqCbdYkKHnmWUib6Pfp7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FE251F00919;
	Sat, 28 Nov 2026 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886814;
	bh=Vi65jhZmEorWcTmRFY2Go1/Dp9ZgmGzi6iEBf5pJZM4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=iCoKeZKQx/R6S+j35WU52jwkWDKHaPzgOzgZvli59K3sfjAb+7HNxVYeoSo+Q2VMZ
	 INoin1A606BRYTHe6EJ/AcG5WDJLxesGAl7D5ZjYvCo1B8AmxISQ1j5VOXksKGJKB0
	 ZMOXpNl4g6eL+8MIJ6D9XLamOehANB19KHU5LbIG1UGHptYZ5A/3goV7FC9xZaDJL+
	 8hNI2+KwqSqI+w/LjNR27vvsPaflih2D6DilGRzgEpSvuhnto9M3jsHoJz2w/hJrQj
	 l8TksyepCGz5fvOfIcZZfVFLx639ks5gRF/Iwaf/+8XWJMyYOI2cwrSzET3SkNzua6
	 7WXpKGkFgVeXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7AEE24E193;
	Sat, 28 Nov 2026 17:26:34 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:43 +0000
Subject: [PATCH v5 12/17] drm/panfrost: Don't take a job that was never
 started for done
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
Message-Id: <20261128-panfrost-long-jobs-v5-12-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=3202;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=KmxdBC9lkjEmZW2MQMtPWghJrhcIC8sdhTBhHqMQcUM=;
 b=5hdppDfTgvc8IRPqrmlKkMpNO5kTrAtNWE2jY9XCMaAFhkiSqquA47xRjJlHR7SYmQwaIulFy
 omcwe3KlKbvDc+OjA6wetJD+Z3ipPH/j9aTQ79rKKPjMf2Gja4wwLdO
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

reset.pending is set before panfrost_reset() masks the job interrupt.
A job queued but not started in that window, behind a running job that
completes, is taken for done: its fence is signalled and it never runs.

Mark a job started when JS_COMMAND_START is written, and leave the
others to the reset. Found by Sashiko. Not reproduced.

Fixes: 030761e097b4 ("drm/panfrost: Queue jobs on the hardware")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-210891@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 8 ++++++--
 drivers/gpu/drm/panfrost/panfrost_job.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index fcddc13bf..0946da3af 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -261,6 +261,7 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 
 	spin_lock(&pfdev->js->job_lock);
 	subslot = panfrost_enqueue_job(pfdev, js, job);
+	job->started = false;
 	/* Don't queue the job if a reset is in progress */
 	if (!atomic_read(&pfdev->reset.pending)) {
 		job->is_profiled = pfdev->profile_mode;
@@ -276,6 +277,7 @@ static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
 			job->start_cycles = panfrost_cycle_counter_read(pfdev);
 		}
 
+		job->started = true;
 		job_write(pfdev, JS_COMMAND_NEXT(js), JS_COMMAND_START);
 		dev_dbg(pfdev->base.dev,
 			"JS: Submitting atom %p to js[%d][%d] with head=0x%llx AS %d",
@@ -584,7 +586,8 @@ static void panfrost_jm_handle_irq(struct panfrost_device *pfdev, u32 status)
 
 		if (failed[j]) {
 			panfrost_job_handle_err(pfdev, failed[j], j);
-		} else if (pfdev->jobs[j][0] && !(js_state & MK_JS_MASK(j))) {
+		} else if (pfdev->jobs[j][0] && pfdev->jobs[j][0]->started &&
+			   !(js_state & MK_JS_MASK(j))) {
 			/* When the current job doesn't fail, the JM dequeues
 			 * the next job without waiting for an ACK, this means
 			 * we can have 2 jobs dequeued and only catch the
@@ -592,7 +595,8 @@ static void panfrost_jm_handle_irq(struct panfrost_device *pfdev, u32 status)
 			 * are inactive, but one job remains in pfdev->jobs[j],
 			 * consider it done. Of course that doesn't apply if a
 			 * failure happened since we cancelled execution of the
-			 * job in _NEXT (see above).
+			 * job in _NEXT (see above), or if the job was queued
+			 * while a reset was pending and never started.
 			 */
 			if (WARN_ON(!done[j][0]))
 				done[j][0] = panfrost_dequeue_job(pfdev, j);
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
index 7f71e4c38..0ed45e28b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.h
+++ b/drivers/gpu/drm/panfrost/panfrost_job.h
@@ -37,6 +37,8 @@ struct panfrost_job {
 	struct panfrost_engine_usage *engine_usage;
 	bool is_profiled;
 	bool cycle_counter_ref;
+	/* JS_COMMAND_START written */
+	bool started;
 	ktime_t start_time;
 	u64 start_cycles;
 };

-- 
2.55.0


