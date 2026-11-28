Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886818;
	b=3V+1AYtsLfH+agedlRTYUBf20R81xYobrVQ7Zna7LQTJu7oVmdnYK5x2HV5UY2JxYpv2
	 YPWjVgegYfKdDj309oe1wZbZ0pK5Wy1+m/2iPLoM7rhoEFpplel2IInSU7BFMkN8Mnh7T
	 UbfX44MD0kF6jYmbHY6cGZTQxuZ+HJHSdsORb7OKN7I60W6kinUccbcSoyWP6+BwiE3wl
	 6KW+T4bG2wjdpAcFu7LIPEDr48Sa6opYTLCuZzQktEeywIX4Xbp6S7ER495Z7uv7agafb
	 dBu3g6QPC6Gucq/LgXkW0B2MGR7w+WR1mNX8JgpmS0lrtmD/H5y5m3VoZCWLdCuoi8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886818;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K1EBAYTDShITHjIGR2ujPscGBbbDr+2wQ9JYIaEtWTY=;
	b=CBxHt7ALghi5srOwtYiz3wK+AeP+++U48R86AAwTlYIRM/emFnNur9xiDTCFbxP9gNJ8
	 /ZsDz2ZvDsZH7NL98wSomeBRadIm1+WgdRU04w50ygakjHyxRD5PlwnuffE/z223lMGQ5
	 rf2UfdH/x07tBmeRrOM7q/3z5KJ0GhQgPgzcHDshVcplJKhdo/bV3OejLi6lgTp4AlsPZ
	 EQpvWWOdb7DFTh8bdE1xHd0mE1reDhiTa6YKDAx+V8dYUD1hx3vmU20u7mN90mP1u4ADF
	 RFhhNO6c+19rFJRAqI6IK0pSSiGC9KE3GE77FBx6eQ1IuTDHmiNUeLRgvtTGwJFAMTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX17OIGn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E74C606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX17OIGn
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886818;
	b=cUzm3paybpQUdsb5syZJSDQGMXuo02Y3PvVMzOkRzKoMb/uDwk6k4Q7zaqb0tkF3nbQe
	 1lKZJJHXt/IMN0zsBDZRwV9P8VtkuQhQOBze0WAxw8NDNw1O4cs8OavHuUKHsNfZqTXr3
	 pdv6VjOmtwXeKoxWxG4LEwCkjuEElRVsgb2vE72f2eIcRBX1sfmMDCIXZ4+lNOKv39t7b
	 W+exTHlTbNOEUaCdSMWW5TPzQt50pUKFUN891Ik5kkVIKK+O8BOMjtlyOw1x5advmks3T
	 6DT5/HDe8U9rjFY9INxddf20NU3ApTMqkfpmj2xg22Ep/jV4C2/Leat0ZtGXd5w9ysw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886818;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=K1EBAYTDShITHjIGR2ujPscGBbbDr+2wQ9JYIaEtWTY=;
	b=UFyV0Lm+6QpfSfy2N2If2lLJWEaNW31M+tZNyoN0d/++XgZFAbvJJdIO0pRK2ELEL3Z+
	 O/ChrFPLKKsp8skQnNB87o0H5TGQ+heNFc955kjb8t8QNrVqYsyvuGsabCdHUvJPkcZCU
	 hmhYxsZqxXPCIWEZi75HTdht85aFzPGllVEb4a/VN0mCipo8SuV6brn99053A1dr4VFnq
	 1ZN1u6pmFV1s7w2FCM2Bx7s15Zd8khFCC6MESwxkKI8anKiGT8Ha2AJXUvCdnz9DxsKP2
	 32xqTzAqfRXS3oEhBueJaU125c+qtBVUjZQ4rnFVz7eIe2okYFbxAxx8AuJuNV4Jt8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E31381F0089F;
	Sat, 28 Nov 2026 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886818;
	bh=K1EBAYTDShITHjIGR2ujPscGBbbDr+2wQ9JYIaEtWTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AX17OIGnn0I3c30KruKXmPPlL/2m4OB3+A+XGjhYDUkyzGdfG4G5bf+IgAUuO0EJF
	 cPrAu4UO+/BAhJYMYCUf1pZfZIkpHU2yjcWMhHL2jwS4AohUGTdlZWj8jqazlPux+3
	 48H137CJ2rsOJmAVfqV+U5blJo7tnWVBZf+UKlt33hxuSd/MU5723MfbQesGb6QsKp
	 KQMmdzRGUT24VkFokwXqetYRzna0YtxkPOJSQVpLTZA0QK7JmxaQyCUreGLRLnk4aU
	 lsOaFjSrjYAiy4+fzwDnLzoBr8We1kn2lrSZbX4Tc/V9ahI6oF4tvwF2FXU54un//N
	 kJdVzTHtk/Xcg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B1E3C4E17B;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:37 +0000
Subject: [PATCH v5 06/17] drm/panfrost: Unwind a failed GPU mapping without
 dropping its pages
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
Message-Id: <20261128-panfrost-long-jobs-v5-6-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=2423;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=B/OG9Mi1gxkvCDAJITmI6/1lXQ/Ts4PcA1q80c3wpeo=;
 b=uGS/2O8n4GD7GdIWgz7cpX3VADEu/wEUcqoi/DGC2SPMWnZsxkkBxoVBmb5kMEoLK8CcuBR2u
 Tfqy4x6Mf4UDa18p3Q4gEohJSBnYci2xMNiFANMD2uTdtiJXxgSI8mp
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Two error paths leave wrong state when a BO mapping fails part-way:
- If mmu_map_sg() fails, panfrost_mmu_map() calls
  drm_gem_shmem_put_pages_locked() without the reservation lock and
  drops pages that shmem->sgt still maps (an imported BO underflows
  pages_use_count). Keep the pages.
- If ops->map_pages() fails, the PTEs that call mapped stay in a VA
  range drm_mm hands out again. Unmap and flush them too.

Tested with a test-only map_pages() failure: before, the pages were
freed under the cached sg table and an imported BO kept 512 PTEs;
after, neither.

Fixes: 4da352cf8fb1 ("drm/panfrost: Handle page mapping failure")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: test result added; no code change.
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index e70ae393e..e59a16b68 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -442,8 +442,10 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 
 			ret = ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
 				       GFP_KERNEL, &mapped);
-			if (ret)
+			if (ret) {
+				total_mapped += mapped;
 				goto err_unmap_pages;
+			}
 
 			/* Don't get stuck if things have gone wrong */
 			mapped = max(mapped, pgsize);
@@ -459,7 +461,10 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 	return 0;
 
 err_unmap_pages:
-	mmu_unmap_range(mmu, start_iova, total_mapped);
+	if (total_mapped) {
+		mmu_unmap_range(mmu, start_iova, total_mapped);
+		panfrost_mmu_flush_range(pfdev, mmu, start_iova, total_mapped);
+	}
 	return ret;
 }
 
@@ -483,18 +488,15 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
+	/* shmem->sgt holds the only page reference: keep the pages. */
 	ret = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
 			 prot, sgt);
 	if (ret)
-		goto err_put_pages;
+		return ret;
 
 	mapping->active = true;
 
 	return 0;
-
-err_put_pages:
-	drm_gem_shmem_put_pages_locked(shmem);
-	return ret;
 }
 
 void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)

-- 
2.55.0


