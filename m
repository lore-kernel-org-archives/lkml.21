Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795245542;
	b=c3YpzzXGpZtXLqbx11l+DFO9hb3DwzahnE/O2ql6ArwCKyHF3Udka4w/mHTTP0ArjbmP
	 RTQiamSh6hqH94LKVqzbyGpDmqowqJpmNns6m7tH0dgEWmO1NeB+lhbAj875WankQXX+i
	 yo2U9mlgK7JgYmgMrl1zmfB/WVxTfaO8t7Dg9krwntVtJGu+ZtpRZ5A+f4ZD9d87zLgGi
	 gcZljtE3XL3ZZB9XUaVF9QZeTItxQCHyODi4dzi5yp81rGdRlFeHp5KrBRZjNFRljYCUJ
	 +jxhtdOmsAB4ut7x9W2aX51efkiykJYrU9NiFTWnN7eE4vp3q3N0+vYcO/ArNm3ed4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795245542;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=kOLdrxtlbkJl5si7RCYhsrq7KDo3r3G+vXC21EW5Oac=;
	b=U6NC9rM/0djv0k5MVn2pB2462ofrMMYSNYAJYS3tOZ3ZtzoL76VPawAgWHDnVJ6NKe/N
	 TRsGFbTyOWkBpWfqHbqhFHAzg9fsQpi8RdC/EdhR/OlaTYRRgE+VIrQLE9nJzwhC6JAdm
	 /Fhzh8E06edWJP+t0acQHhLjUFCMok3Cj8BLL6eum5mVwrp6eHI9ZgPdSdqlCU4O+nVzc
	 RKjLs1hN7UNPrlGKFws+dIdg7CnRJB/19MM7fFk9ofXCRfajFBZndRADQ36axyAlIg2FN
	 7isEXdzeAa9R1UY5aAsi3qIp1DuRBU6Bg0dam5zWG3YZOQ6PQfghtELzUOLq/RBs8oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GRf6h5v5;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09C5606A325
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 07:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B09C5606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GRf6h5v5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=kO
	LdrxtlbkJl5si7RCYhsrq7KDo3r3G+vXC21EW5Oac=; b=GRf6h5v53/wts6PEIH
	lqwmV1URlwiSzQbXS8wprJg2TJ3n3644hxzqnRJAHTwHwaCjOcZPvekcCRtC7uPZ
	7BPgcNi9Gv2QlVjvNQv7SE93joTY8vCybwx3nmLfAveYXEMF/Q6gBabvKP2jdFof
	diWd2qF5Byhs/Lr1vxUtK76zE=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgAHVaSsRQFrb83YHA--.29041S2;
	Sat, 21 Nov 2026 15:18:06 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: andi.shyti@kernel.org,
	jani.nikula@linux.intel.com,
	joonas.lahtinen@linux.intel.com,
	rodrigo.vivi@intel.com,
	tursulin@ursulin.net,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2] drm/i915/vma: Fix a memory leak in i915_vma_pin_ww()
Date: Sat, 21 Nov 2026 15:17:13 +0800
Message-Id: <20261121071713.335337-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
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
X-CM-TRANSID:QCgvCgAHVaSsRQFrb83YHA--.29041S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy7Cw17Xw4xJw4kCFWruFg_yoWDZFc_CF
	yjy34jgrWUAryq9Fy5CFs3ZFy0y3WkZrs7XF1xt3s3JFyUCr4Du3s3WryrXw4xCF4qqFZF
	q3Z7XFnxZr97KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM8nYUUUUUU==
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7Q6XBmsBRa7SEgAA3z

The memory allocated by i915_vma_work() is not freed if
i915_gem_object_get_moving_fence() fails. Change the
goto label to do so.

Fixes: 8ec5c0006c50 ("Merge tag 'drm-intel-next-2022-05-20' of git://anongit.freedesktop.org/drm/drm-intel into drm-intel-gt-next")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
Changes in v2:
 - Modify the commit message. Thanks, Andi!
---
 drivers/gpu/drm/i915/i915_vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 16782d8579a8..4ba1c9ea5ecb 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -1470,7 +1470,7 @@ int i915_vma_pin_ww(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
 
 		err = i915_gem_object_get_moving_fence(vma->obj, &moving);
 		if (err)
-			goto err_rpm;
+			goto err_fence;
 
 		dma_fence_work_chain(&work->base, moving);
 
-- 
2.25.1

