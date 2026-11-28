Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795847943;
	b=O5tmvUtTHIpVhl4bT8RLGHICp2/Dssf1KR2pYcY09Nrd5GP5TgvlvQPo0tlejBzvCRtA
	 b2L5IevuN8Qpp9aFhsMYQwASUW0VKb5OzEHOJtGp64adKBwqBly8H8gfJ8fmyADZNeiR2
	 TAi5M1zpTENp91gmqVjtd7gISpKCqn58LF9HX4JTuSRxJv6JOjvEIrLgzQKVQ3w8KJHwH
	 dyC5Mze48Uz0xIpsvmLD94GupoIeuE/r7Tp6PToAx67fmIPPdmOx5kx9l4MNrRGLPvPJL
	 Ms2nBYUNCU5a4IPOq42Ik1lnmOzv2NSRWepqf2HetK+W7hVJdseM3aREhxs7xRaFXsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795847943;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nUqNSCpFAuXqhx4v1WEMdxqMn1uV2jBGy3KoprDM6Os=;
	b=odRU+iWB+ggsbNfQactBUbG0CSFqSpu95qNixzrNNT0yu1aulG4aB276vLTGO7j2BBK5
	 Y2x4Q2PVvjlISJWQ5bPCLSXAavQiKpMXB6z+Hz/JzjE0S7wZ7YuWkvyfRHYizBwLM60wI
	 VCU0EKwGPOkI500c4XBrPPnwwyw2wzf3itOl7bv7/8JoiqufVLMyrRDHrH1cL3qILT9zX
	 KKFbH2adXIFyjrfYHg2eHsmvL824hYyPKruhqyFRzB6XE27IOM06yDn4v86VtldYfZfVv
	 v6uQlMPuNX1YhzDaPc81kvBJgzhThgT1SsmsTh4MUJPJ3jlTmb6yx+dvd4Txo+ZAwZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=ag2ZvQxE;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685EF606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=ag2ZvQxE
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a05b210703so4127312b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 22:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795847943; x=1796452743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUqNSCpFAuXqhx4v1WEMdxqMn1uV2jBGy3KoprDM6Os=;
        b=ag2ZvQxEv+N3Ee2gn7HqZLHT8wK8+2s+WDG5HVDuvIivtPsFPsQXhTXf3GFwGlQ/8b
         EhPhC2hjndeDJdRszK6/vzYtE38yK8T0nvME1plFcz55uq6UcUfdkWDM3ehzz42KeoCb
         UdjlrP9jP2MFcK4JOAhAaar0UpLUteAxW7W0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795847943; x=1796452743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUqNSCpFAuXqhx4v1WEMdxqMn1uV2jBGy3KoprDM6Os=;
        b=bQW1e23v8ktg+lq8789V15PR/YksRXk/mlHA5oTsWhTZ+BCgAA2/WbXqPaMX65hXQM
         r7etgpTz+sgi9HJtn0QzQvfoUvZ1pIr/KSplABrr5+lpYsRSHiO+pPe563RkVD/lh/0T
         rJbf3LUYjV2Ewkh6RPrguXW6dAzVzzdv9wjAbL+FGxkVUNclyWjZRgwzYR1GWTTD6GIk
         0lNWfRfpLoj/OCWqRUaZCoETFFdwLcH5PI0oLfdGB1dAFE9Cbg25DZGDQ9zLJREfkk4x
         xWetcayohqzWRqmpiDb8hu8SwYSRoY8XLdD7r7SSti5G6qrQvUGncTvGBqgePznGpsD0
         FVnw==
X-Forwarded-Encrypted: i=1; AL+hErHn0XmMkhc8o73fD+cS+YednZn19DcWI/XJ4chMoDRbO+xcpVbTuw7czxhpugkIlQCk/6ycu4CktT+hwqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pm3NNvOVLjfJ72hKEhHmCKzHtjTO90MdKi6hiO+o3TQRM3YXX
	QvD8jCPXF1XH7nZ6X96l46CYpqQp3YKAXraYJaUQtq0TmrPpwbcFRgZ+fqS7nOgxNFk=
X-Gm-Gg: AZFdTZcTctyU6ZhLnOCuLcSoghxSm4C2+zF2mcnK5IScRhbEiofp68O54n2HYC144XY
	FKTfexhMwvKDmY1Q+PG/ykrl6JjrT9FsqUVRxYBOX8A3l+FOIkw85aVy/9z/RCGE9QjIcE32POV
	MQuyQqCmRiHVwfk/+V9L/V78plwSx7nc5NmrRsiTwUT6MNXy4p1LC/qUDHpwNmTCgD5DoH5AYOH
	6aqLq+gvZFJGvHZt/0SQS0hF3dGtwRw1ivAJ8EJ6oTJaEF8QWilkkPNTgEugitvDHGiRD069tKP
	HmmaKPPJPoRyC/zCJ6xc9z88vxUZTboKByy9I+DQkCSrPoOBHEZoSyYQeZgC5DUw36p+kbS4kxq
	yfDQexEJfCkujvRCugkgcfRL/yi37ATb4kh7kb0ANOdpZMcdMgOF3s0DhE+QqHGmp65UCT8x3X/
	TtzrGjGLab45HvieEi2zTxOM6TdYhbINh6ulkrBbT+sYgN+ZitSLPKkMitDRpWgEu1RM+sFtvhQ
	/ZyoHnJy6ajfWriPQvpMDtWBHw1+LXb3NBbg4881E92a6N9hOxIOWhqyIcsqGJiWS1qbGoKPM/k
	tb3JvVW4o+NGs/Mh1DEdJWRiBWjg9mc7PPRUw3417LF7U8lTDc8xcUhGI4tyU90LxU6seqdGPNn
	GtpLUwVELnfNc
X-Received: by 2002:a05:6a20:4314:b0:3e0:b1b2:2af9 with SMTP id adf61e73a8af0-4014c2573a7mr29687518637.60.1795847942770;
        Fri, 27 Nov 2026 22:39:02 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm13939838b3a.2.2026.11.27.22.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 22:39:02 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Haoming Gao <Naixumogu@whut.edu.cn>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sidong Yang <sidong.yang@furiosa.ai>
Subject: [PATCH 0/4] accel/rocket: Fix BO creation and prep_bo handling
Date: Sat, 28 Nov 2026 15:38:40 +0900
Message-ID: <20261128063844.1537615-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
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

This series fixes four bugs in drivers/accel/rocket/rocket_gem.c, based
on drm-misc-fixes:

1. Reject zero (post-PAGE_ALIGN) BO sizes in rocket_ioctl_create_bo() to
   prevent a ZERO_SIZE_PTR dereference in sg_alloc_append_table_from_pages().
2. Store iommu_map_sgtable() return values in ssize_t (avoiding int
   truncation and leaked IOMMU mappings on >= 2 GiB allocations), size
   the drm_mm node from gem_obj->size, and unmap short mappings on error.
3. Skip dma_sync_sgtable_for_cpu() in rocket_ioctl_prep_bo() when the
   fence wait fails.
4. Wait on DMA_RESV_USAGE_READ in rocket_ioctl_prep_bo() so PREP_BO also
   waits for in-flight jobs that published read fences on input BOs.

Sidong Yang (4):
  accel/rocket: Reject zero-sized BO creation
  accel/rocket: Fix iommu_map_sgtable() return handling in create_bo
  accel/rocket: Skip CPU cache sync when prep_bo wait fails
  accel/rocket: Wait for read fences in rocket_ioctl_prep_bo()

 drivers/accel/rocket/rocket_gem.c | 43 +++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 14 deletions(-)


base-commit: e950f467b8adbfb2f460d9b9454280cdbf597885
-- 
2.53.0

