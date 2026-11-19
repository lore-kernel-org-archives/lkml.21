Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094011;
	b=LhPVOPLRc3hm9jFsPQMTQDf3AmfwRQ15mdUoHjwYo4NnFPtfsNWvwfXkfDz1qBwMj261
	 hzSSmRqE0+1HpFm+yvohZdGeNVpdcnD/Ykc+P9unnk+OZ6603nWBv+nzEOSw+173EKqKA
	 HfjCT0kTL7F0IrRS9so5L38ltK2g1heRQHlBNqDf/a3ayV6sbdTe1vHJtHkidTisS5g9q
	 p+witihNQZLTh5HZUbf8PWJ4vEsePTX/y430DRRatidJPLfOlrymAsganZNwufuGgELX7
	 pzL4b4m3ktPEeRUbjtpZraP7zJPQkB+E6Y7KfXK700D7YQKLYg9ddXeD2M6oRSs6Qfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=p/gxGOGIabTvhDzdnoS76sqroBvMTDVJ3mpZsoNp2Vw=;
	b=dyv0zgMPpU4zRQwMEP3t0Ejn4j3OAG98+CZF2IjK8kEbwKjK28DaTw4xo0TkgW73KZGn
	 c9Jizt8twMgNDcFEz+T297G5KX84TcIF9XVLFNC5ZmLqT/3H5Tzm3zLNndtkgX/O+t2xp
	 lRhdr4hFMFCvCamUuMnFilpnFpTFdK5lMFtzImx0QDWDKXuBMa9KfrVDxZV/Z9oqQy/DG
	 CB3N3fjFd1TCHjB7z5E44Up71L1Upjb7nh5Edi+Jp0FO5VThcXOdiiEC5FxThJCqVWb/e
	 l3mtrDqmbK6+IK7L3tYg+e5ju1d2Ij6X+aIduy7nHo5Ivz/pqxjLTUYGyw0rHECX0lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEdOWyqR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A45606A326
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0A45606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEdOWyqR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so20182275e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795094009; x=1795698809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p/gxGOGIabTvhDzdnoS76sqroBvMTDVJ3mpZsoNp2Vw=;
        b=EEdOWyqR9XdEaRfcHDOzhTZJsqOgz8dUcaew7Ym5R1QKOHTXZgLXq0CUIdZkh4hjNJ
         ODk1ftUxrLeQVt7iuCK1Mexo0JU9t490lMeUQs0z7Wes1WeCl/VtQqOTvdh3Emhp+axI
         +7zmIfWNxZ4Sj3209+aGyuBLn1gxS7x2FSLxaaWpuHQbHXYomlXeROu21fEj8FC6ti62
         /j0eKHGH8dAvZd49mMyYxYiE9DwcWzjKlReTLHylCFHdhbcJ6p2Jdhu3Sz6NGGw1VGIs
         gEWsbh/6r2ZFoXLoX3zpXSYn6O36QLd+whi1EhPC7mY4xpEW0Fol2L5sd/H36pyfVfe7
         Ln3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795094009; x=1795698809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p/gxGOGIabTvhDzdnoS76sqroBvMTDVJ3mpZsoNp2Vw=;
        b=jLL7Bm2hwdwAW4IsyMPW0+oLoHcK5mY4+ZhxRa7W6bUF+zF1l5Kgn5f7TcMyarFDsK
         lQcJoiEZqULhf0zWEu7QpnioM2stPDchE3TrPe0GirS0JbHnhSHy5Y1fE21wnYEDCE2U
         Xf2Hsv4hzOTOWKBuzQkFcte8DtXDfWfxVz2jdYR48iGBJZB0r94SpjhfBdQnXIvhQwo+
         z8u2iHcu9X2GMC3VeY2r4BkSKpMrCc66QNAnRKrK55fGCwYreg6P20xQq145CGAEeVVb
         3iaMm/CGLUZx+mfShPR46371+aYvyJ9JCpY51QzrgRRur1aKQF9y6/IyvkfWekrrhFil
         CvMw==
X-Forwarded-Encrypted: i=1; AL+hErHjz5IKnjFLRiyrKPXGRV1Ka028f0Wo7Dqm0Rtxz7OFAcr2LqkoyX0BwQ5qIPv9JwdehRYcME7b2PlyZT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+udZbsknw2D9u1mUnEy/bW29Ih0oY5Gep8dQfVAliefXyEy23/
	9jSqTb60ykSmsfkJLBKWlj/E8dL22rsnCf0LUMOYXRsQAJumF0VOyMj7
X-Gm-Gg: AYBFou2NFqPe8njdOltDNGkXMc2HcH+EkYH4Su2yuGIOdFcpqIf+OT2Y2zuiFok6kkn
	oSyyTuwDit5yAwYRkDkHc556ibIIo8FkuFG3lRd559HYFqzS97yXutszdIZAKxT1Ha3Fk3LUnta
	d5Zpc9nlhBB9txb/pWqpJwnt+LKQW30hjyP8okH6BsVt416NH4Wa1/357pORMLZ6KMdZ8q6yeWE
	UBS+ns89T2F/wWQC9sckDkfd5jfKLIOJwPzFN9Ie9UCAUrL61udJ8seMrPaySuv1ccQxjhG9JP5
	cIQ0FQou+0Vkk2GjeYYpTWoqFlbgXBowLyez0x/iWQDR3DccdMAcqu6vDOwpH9/kNxfsnyBc+OD
	q0TBvIRjCV8DQvXN+BMw/t4b6+mme56t0YJ7q/jYDEVCeNQ/EXJHR/FO51hmQhSL97CRZ2DbilL
	LmDcPVbow1gfQRDp+xGuYmS13SMB3VOrkSxcXaPelJAcNq+wV7RlL/2W+mTx0zOGYeYJ2LRZtC1
	QA39j8Z7AhMoEUTOr0vuQnROKCESAunOvd1R83aVpVxmbG32HtVbakjDXA6Pi4PKWLOMzy+Mo0O
	KAsaTiNA7TYkooqKTibhmLNw8uIh64W0DQdh
X-Received: by 2002:a05:600c:3556:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb7da26d70mr121120125e9.27.1795094008771;
        Thu, 19 Nov 2026 05:13:28 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:477f:ff00:c2fd:f9b8:4971:d270])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e5edf5sm18258045e9.4.2026.11.19.05.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:13:28 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: m.szyprowski@samsung.com,
	robin.murphy@arm.com
Cc: ailiop@suse.com,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH v2 0/2] dma-debug: Avoid uninitialized mapping dumps
Date: Thu, 19 Nov 2026 15:13:23 +0200
Message-ID: <cover.1795093513.git.thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Booting with dma_debug=off leaves the DMA-debug hash buckets
uninitialized, but the debugfs mapping dump is still registered.
Reading dma-api/dump then traverses an uninitialized list and
causes a NULL pointer dereference in dump_show().

Patch 1 skips debugfs registration when DMA debugging was not
initialized. Patch 2 removes the obsolete debug_dma_dump_mappings()
helper and its only caller in the legacy AMD GART IOMMU code.

Validation on x86-64 QEMU:
- baseline with dma_debug=off - NULL dereference in dump_show()
- patched with dma_debug=off - dma-api debugfs directory absent
- patched with DMA debugging enabled - mapping dump readable
- both objects compiled successfully with W=1

Changes since v1:
- guard debugfs registration instead of the dump paths, as
  suggested by Anthony Iliopoulos
- remove the obsolete mapping dump helper and its AMD GART
  caller (due to feedback from Robin Murphy and Marek Szyprowski)

v1 discussion:
https://lore-kernel.gnuweeb.org/linux-iommu/05c05ec4-b321-49d4-acf7-b9fa4223dba9%40samsung.com/T/


Avi Weiss (2):
  dma-debug: Skip debugfs registration when uninitialized
  dma-debug: Remove obsolete mapping dump helper

 arch/x86/kernel/amd_gart_64.c |  1 -
 include/linux/dma-map-ops.h   |  4 ----
 kernel/dma/debug.c            | 40 ++++++-----------------------------
 3 files changed, 6 insertions(+), 39 deletions(-)


base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

