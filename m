Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795685868;
	b=IAv/6UoaDeHB2mACF4qAa8F9uNUxivNHVNf/1bihR21VfJ9R3ZLMs2Y6pHkwjQhfjGer
	 l6W/gNKEvNzn81UPUpPllHRFdEODRRS5P0ajfdgbnVVeUM/vyMdKmRGOPOmeHdc+V9ALk
	 kYCRB5wR6MxIcS/k3u7hVDYsnUSf7dwOyGWiLBZKLxQFmFwaS33oIfhXAIKaRkxkgTsJ6
	 eGOMAl7J0y5YMuh6a9odkpJhs9D4pYfqMidRr7vxjHxfsdWqG0Y7hmEfez3dTL2oTJyoe
	 7CvgffdqUysMmroPgr89cIumuIERcvi2m8ng8KkhYp3sFdKehaimjVbVqJFXBjEG+oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685868;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Gr5aK9yqnSUCDhMZqRxgxPaRQLfJPIgbPMqGNTgPuOc=;
	b=d946ZbR3fPLRh3piFcAOgTrLo7qTIY5K+8G4TOo3N6bKJ7YWKN8K34uYGTqxxZKjUPvo
	 UgWSQOqDhhLD8rwk52KM8F7q5iGsfSeFTqpzJG5oWYbA3jlfDJfdcnS2eqyIPHjP+0/Ku
	 HipKueKP3yHF4e7rx3jdPYgaVDk9X2UzaxgI+e8GyO7/J0ZHxLZNKfesdFWG9DFvujYqx
	 ycaQukBcZb5lKirL0kW4gLE9r/Qf48rJEb14csZlx+khMv8g+bpDErJhQkUY4f6N6CkeB
	 ZQJ5Ct/FkJONh9WQb/nYW00o+u7pGQ1zbGqYlts9HsgDBG4nRHqdTljh7fMw2wbgP0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Odm6BhGd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083260A2625
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Odm6BhGd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795685868;
	b=zKVk2I5TygFRaidZShOBIRItKbCdAyBeHMOfIZL2AOfUL0QGwFS+OMPjE9iSR9lJTKS/
	 6h1HJGgAY9reGimx0s616fQCmT6BzNrCdZ6lHHRMxtK4Pow/PQY82RKvzmJ9ep2Z+LXZ0
	 rjt4Nkrfyh7PflMx5ehjV1VjtaVSG2OgXvfE0AyFlT2xmrUWgOkoKTl6uNv4teM3eH9zO
	 2kGcrOTKtkiYzccWyE92nXmWmEMpkCf6UGAH+kWd0fsE/qL0JQKBP7dwcIyDNd0taltFV
	 /lfUkZPdCPgvPxdgUEKM5qGHxyHk2l2dWUI6Ox9pskFHT9LxNdOcQLn7FDsvSOwivlg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795685868;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Gr5aK9yqnSUCDhMZqRxgxPaRQLfJPIgbPMqGNTgPuOc=;
	b=IusNAx3DWN2ugwAKEvoR0RRgDf4uAkCUo98msVtYQv2Y1oRfPpv0JE8DQqWUkwe0vtFl
	 xKxXjKREcx2u9i+4vTTdfcJrX4vHmWGniDbMJ1EvAjG5fqZ0qP4a+v1a8wPDyInhnnIJN
	 BCOe9iPsgGKZ1EgEt89/u5wcM+j2+JjU74I8sH7YhQJOqyDtMQ8xa+u3PwbqaafAmY6wv
	 CBofYFNaIALnc54KNMxjpDpoe/uX1+f/ZCD0h9Weqk87cZazdUulkh+Hi2VqjGrfozuYK
	 UyNWJVp7Ocr8Xw2YIabkiTVMr4pLRz5qS67VFA/+Yrgu+bvN11TrIFWpfUPRGRw7yCg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BA841F00A00;
	Thu, 26 Nov 2026 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795685867;
	bh=Gr5aK9yqnSUCDhMZqRxgxPaRQLfJPIgbPMqGNTgPuOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Odm6BhGdlTZSthoOOckje9C4UurkmABTvT0ZBQ+SdArS/J0wGEj1ja3eE6SLnBTPI
	 lsm4DmJpoO3gxzBEtKAmJpFfWyRjkrNwpjAcZD1Vvg0wdq2gbvL2QodcyyC/7f4p/g
	 2i7sz9IA0Eo4U9W3rgNRKm7phDQ7VzjNFaRYRzCpSJ5E9g3b985DjjQnthMx3RQL2x
	 wjriqkDl3q7+fKRfPq0iR0OcwzEZdELYfp5+GBrHypsfrQz9+yFBoI92ydfyBBYyud
	 iFWZLU2Dltl695sxjlquCeU8a3m6h2AC2ed+9eyTJRZQXlCFLxxMY4Ho+iOEQqf/Es
	 mMEu5Coc2JFkw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 02A2B4D3A4;
	Thu, 26 Nov 2026 09:36:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:36:57 +0000
Subject: [PATCH v4 14/17] drm/panfrost: Keep the GPU powered in the job
 timeout handler
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
Message-Id: <20261126-panfrost-long-jobs-v4-14-23579629ceca@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795685806; l=2141;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=N3/r0MPqmTfHMSYcrVUI3Gc8NQD6K3bi1B+vyvlqWHM=;
 b=OL4/UsTLn3B1yEJUUuAOAmbJzZUU5twXgF43YsktMQhY/iyWo88vh+aTgTTaqwK72+QTg/Z9y
 pouMrLM+5sxB1qo0EFwJBgkpSDZ0ADNQwj53ioFeOr2r2ZkQBKIxxYZ
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_job_timedout() accesses the GPU without a runtime PM reference
of its own. If the job completes after the fence check, the GPU can
autosuspend first (clocks off on GPU_PM_RT). Take a reference with
pm_runtime_get_noresume(): if the fence is still unsignalled after
that, the job's own reference was held.

Tested on an H616 with a test-only wait after the fence check: before,
the GPU suspended 50 ms after the fence; after, it stayed active.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-212575@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: new.
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 722f87ebe..74cc3dd02 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -775,8 +775,8 @@ panfrost_reset(struct panfrost_device *pfdev,
 	dma_fence_end_signalling(cookie);
 }
 
-static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
-						     *sched_job)
+static enum drm_gpu_sched_stat
+panfrost_job_handle_timeout(struct drm_sched_job *sched_job)
 {
 	struct panfrost_job *job = to_panfrost_job(sched_job);
 	struct panfrost_device *pfdev = job->pfdev;
@@ -821,6 +821,19 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 
+static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
+						     *sched_job)
+{
+	struct panfrost_device *pfdev = to_panfrost_job(sched_job)->pfdev;
+	enum drm_gpu_sched_stat stat;
+
+	pm_runtime_get_noresume(pfdev->base.dev);
+	stat = panfrost_job_handle_timeout(sched_job);
+	pm_runtime_put_autosuspend(pfdev->base.dev);
+
+	return stat;
+}
+
 static void panfrost_reset_work(struct work_struct *work)
 {
 	struct panfrost_device *pfdev;

-- 
2.55.0


