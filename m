Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795886821;
	b=ptvr/Svc7Svuz0edZ83ji9qljyyXwOY8bgVs/ZuG0gcHFvTkB+rgbJ1MLAYqbVDRCUXr
	 7AIG5OC9+kZtukyYvbgYRqf3y/UfAevtxHn0QnZte1g8HFzMdHonvBkuJawIDhK3Ynrkf
	 79Wi8QTp93klHZVOQeat9vRY03QGkhXsH+2ebkIJknwdsA4oQpNIJjXwME2pCNjE9UcIa
	 EjgPhgJF0r/V/U//6M094KvpLYPoY0YXTR6F4tS69+WK2t6iGGgF3DoBJTmgkchjMrvI6
	 ZQjYBIC6MKuFqh5A2BCOtct3qoIaZ2BkX39LBDrv3hEsSURAI5PrGvBIKTZ1GnGIRPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795886821;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ku8Lde1pTwJvjjDGXTmZ0bVu/ruUS4L3CLcssOQUhrc=;
	b=TmHUsnr6NwsI7W22ikDKxX7U7mYACPWkjTaLbQvxh2USMvE0fh7sxKB0+rUjndYMp3IK
	 q6xVWKbJ1EelPc0tu5uz0AOgGW8FyLjdW5rTnzPRythSAQUKvXhcRBeTN8FNa0PtnBthS
	 vIoVCPdDDFt83q6KL+KOnozI8UhGIVm3gYveLt18XPt+X5y/fBmxXUxR1Gg7lrdHWpdra
	 pgjxzrilDTIgUCqQCfJ4n3xK3a5orO04NntauW0lwsNqnmkyPTLo1akPxAlPTL6UQ6SaW
	 h6oRBUx/tK1c2DkGdGBfjfPASv8Y+j7OJcCYdYCG0reqFvmKwnGCZqupBZKkj+DV0Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4yVwSbB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24777606A680
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l4yVwSbB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795886820;
	b=1K9P6HFWWcmkR22V5QqevbszFgASCkVzrBhs9TFzWcgOyncopTBcsQDLJ+yplp8A7hl1
	 2IhcLGfNR3H17BVtw1tciXuXkseUpxPzcQ6WXAU7oYAb1eAnM5OR10s8W81nIn/cpPrEE
	 CSSSpf//kU65oRrxJhLAg1aRWlYITC1+F2CTsr2bv7vaKtEfp0/dYuyhd8IZbG/QcnKmk
	 2FfEKQL7qyhMxnzy5CB5CgvRwStxvg55S+UvrR2OBYDyzqEa8OdYysKWYZP+ywdEqTrMG
	 TKPek3rQFPmwo1rXLlJBiMXTZhrfVH+shwQQ0gJU7+IP2AuDFQwAr3mH/dMbi9GzJNQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795886820;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ku8Lde1pTwJvjjDGXTmZ0bVu/ruUS4L3CLcssOQUhrc=;
	b=Yt/fJpp3t/ugT94Cr6KmSFQBOmybzqMb271jXEHXItih456UVsqQuqO+NsWgFV3snBfp
	 q2OKY4XwAcoY4Hli2cIx54HD4cUf1AwcX4mrGBAl4VwMqUg15gVc7Z6fm3uZblUI6Gb+g
	 oh2CEXtlOxic/eFUJJ6z7jevnjobG8r21EwXbJU2BsvvhuiIQxUZ357yEwMUYetHavk8B
	 RAZhvVw19fk0WQ/LNXNJB6wL+YrgFB5K6CctSfjFCWNRABjBJYTT7yuyrzDZCFlC177dg
	 Vw9f04fQMsA6bbAmSSr2lmyK65L1Lh3ZjarHsvfjDv86wvgGZOolRm8FVRwyhKhyo5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E055F1F00897;
	Sat, 28 Nov 2026 17:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795886820;
	bh=Ku8Lde1pTwJvjjDGXTmZ0bVu/ruUS4L3CLcssOQUhrc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=l4yVwSbBtBDHRMXSTrasCXhMz5AnyE4DgvyuBYotxlWKNsnPUj6imbruHgK2XSFIA
	 Bu5u/URVV0Uvj7dPtgNAiy7JJNdNijS/K7FqqgNFyPNlYHlaVLQXnAtwqvaL50K00n
	 8AD26vGfvWDnuYRf9iIvrbNc1M2lXMxjk8uIXxARdt1OPRCjmosnl2OJrs1BHfKnTB
	 tmqSO9NJRSnOTjVhYAahYAKb1A/ikuuHmCaW03bLwIxRQ9qiA/K3R+HZBQRh4L9mYo
	 Trg5+VlJww41m5vQI3awFp9Mi33a0CMwFz8Uo/ioO8kbroXErgqmh9G1dteNDZtrfb
	 x19qcag5IyU9w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 829814E177;
	Sat, 28 Nov 2026 17:26:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Sat, 28 Nov 2026 17:26:36 +0000
Subject: [PATCH v5 05/17] drm/panfrost: Don't WARN when a GEM mapping
 cannot get its pages
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
Message-Id: <20261128-panfrost-long-jobs-v5-5-e7d62045a676@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795886791; l=937;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=hdFsu+ufPKv8in/ecsLdKRwpVjdp/Cx/nRmtEw1md78=;
 b=G5iVqUwt7wZZ86fYrBM5I4zJPZQMy0cvBIuP5TwZMJWC6gsdTvhvJkRAiMOVne1JMVbUF3Hku
 0SwhoMoSbtoBf08MRTc0yCMWG9v0hDczcwsrZHqePqY96Z2secBVAua
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Failing at a memory cgroup limit is an ordinary error returned to
userspace. Drop the WARN_ON().

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
v4: shorter commit message.
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 789a64fd3..e70ae393e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -480,7 +480,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 		prot |= IOMMU_NOEXEC;
 
 	sgt = drm_gem_shmem_get_pages_sgt(shmem);
-	if (WARN_ON(IS_ERR(sgt)))
+	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
 	ret = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,

-- 
2.55.0


