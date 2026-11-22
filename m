Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355677;
	b=HuKYD+CSwyYDsGF2lRky8nJNJd+/HkX6gzUwmF0FLZfeS+DCbqlWRyU2YNYx/QRY2lYw
	 U0M2CQ1/v/GkHsaORtPSggpoNNbjv3/C3Qku/2sObxfdBianavnIg1I6wd9+HfJOXtlbu
	 RFZk2NuImkvCmmChvQtqaa9RxICuNCHcoFtgUfObG+SJOzGJ9dki0b/wy2GKz1HJ1LaWk
	 EBRxaLi9zO5PEUFAQkLZ8mG6JYuF77DceO6Z+eRb5Ss4XkMqRm+UsY+3vD/oXbLjcXmE0
	 yXR+C/6vT3Tt4LAyA30AtpJj0MOx/1jQd6qTcEXNzDuTAY9nQivaZW0fUE5PBMXel6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nZw1kMwP9fH2O45yvl78uLJ7cEROYRLhfKonQzWVgKc=;
	b=jdWKBEwoyohAghnPQz5pqsyp9qg3DluTdYa6uCImodrTPKHBMdiUDkZ3E9NoGKU18SU1
	 XD8bhy0XWqy3M4zKX8RCBoxLKJ1A5fBX4VlTvjTcFpg/qcn4vm9hpKUjoAWC+U82sW0Z6
	 RywwQsE8tZO2riM8gfOFfq+1n9DM88ttJltT7kgBg/1JzEI/VTLDKrKQC1jepiGsyIjSJ
	 SonL/HDfgd2/iLECGlJ4ce+fL5nziNjUVLKob7cjZpuGKh+mAi2YGTsJC/2+hWG5wWa7h
	 G17sP9wiITa6FuecxVz9eOB7XCccBNY/+GzV74cPt4toqBAh6hyMp/3n2KWou6Yxavw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/LMX/r8";
	arc=none smtp.remote-ip=74.125.225.137
Received: from mail-wm2-f9.google.com (mail-wm2-f9.google.com [74.125.225.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6F606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 13:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F6F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/LMX/r8
Received: by mail-wm2-f9.google.com with SMTP id 5b1f17b1804b1-4bb5b21feccso4704635e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 05:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795355676; x=1795960476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nZw1kMwP9fH2O45yvl78uLJ7cEROYRLhfKonQzWVgKc=;
        b=E/LMX/r8h+vcgcz8NTkmTAUqO5bvVA9u3NlSp/+SKFrXbUBsIZs3pqcJRfEntXSemG
         /TitcHwe87DkbcGMXW28wmp7qEN7oykPVOsf+FL+BwlCEf9Od2EhiXoARBocsAGTkhb1
         nUivqTkV6sp5Hwo5ZOATk3Jkuz8sxkjQ3pfKeGeLZVKv9upyKy9DX0GfAguG05u8CtBA
         cSReoMIQ4EkNmmkx8deuNUsj6NCOIwUqAPJdXlwzuipfnHsLwl0ycLgkM1zDV+c677CE
         M3UNq9oY0tdyxrxqI7gfBopbKVNzItQecV5YlDo4wCOFyrUX8UzVQVd2hxTWaG3IcvFp
         Jz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795355676; x=1795960476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZw1kMwP9fH2O45yvl78uLJ7cEROYRLhfKonQzWVgKc=;
        b=kLIvCm/sqJYXdW20n/AqWD0zK1FLyCyoVbR8dJjfVM9fvR4bxq9DbPOVdGMKGsgzz7
         EALHxuN4qiixDXMgxrsiMGVL1FPjeU8MPR3NCsgL33QqM9rzqnLmD0CLVih0BlUsvc3f
         B8rqnPMxE+Du9ccRXkr1YGFPf4920w38WpKKUHkUee+9F7dQGfjEeqTmwISvKoOa/rYu
         ic5XJlmuLHiCe23ioyi5e3ITMmZOeSUEs0i07n1F1/eehdKOYKG9SGYE/KM/Gum6RPz+
         bhyD8hZGsoq9311mEKDFvC2y9x0YLUqe2wWvgulF+P8sDOCg5kXKuGi1CZrp6NtO9GUL
         RWoA==
X-Forwarded-Encrypted: i=1; AL+hErGWWKhREzXMcR8RzUMPgu+d89B6PjPg1cJCn97ykiLXGq7gwodeA3jxJZZuuAuTy1yh4Qbl3Mx2Y5uDqjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ka3P7CuAsQeVPZME92j0Yb10lp4pQSXgskYa/99sbSspPAWcd
	mnuEGwBbRMxrnfJn5yTbvK2BrS02t+AOYlnP3Sxl5P23wxQ/yZrYUe9u
X-Gm-Gg: AZFdTZcCdRO0Uwp0A79SxzFi0ihHBpsGsHIiSUX+6p06H6SxK9uNeljrS6q4hp9jBg8
	xEjsxLJC95xsmyYPbDSa8HTAyQT78SH4jvvvDN9S5WnLzjVTCD8mwLMloloVQHWaXPUxm7Nmt62
	soahALd1v6znw2m+XqG2Cc99box2j5Wj8B2HebV6UQZjM6GylVfk1V/CrB0nPK2xjWvcUq8usuH
	KTkO78qXzTpWDyAsEDk5FaQVWemrx1C2egnwmvxl0tg6dfcx6nJ4VOB/oSRkaTq1EXJTKaJy2/A
	HewhL0y/a4jJr7cvjqIlHZmoCLRdU3Q+32KO821nsgyzkCx3oIrJawigTX6iHtt9bVoL4ZSE6fY
	jg3ynJLZbmN7bsKxxTH4ECyxb3ixAiKgFEQ/vp6jMYMT2s9Gu6Wa04ioueI8u3vaHR9mdMreCYa
	C4Klk2THPr8d8TrbKQbp1Kc+clFYNe5qT/kz6iHsDmIgWdJdVj30jmAGb9N1W3jGkhR4cuAPcSx
	4wdqHnriz7MIasxshxNTFs2Oqt60gK0vIBebz4pHs5PIbMN9T/tNHpYDgf1kVgdnoJ4ckwOBIXj
	uhboi7DtDKy7jHpbO4I/8xzqB1utS6593xc3Ee6kc5el
X-Received: by 2002:a05:6000:4028:b0:4a6:bc53:246c with SMTP id ffacd0b85a97d-4abb3956374mr18211349f8f.42.1795355675529;
        Sun, 22 Nov 2026 05:54:35 -0800 (PST)
Received: from serhat-ubuntu.home ([212.253.223.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm16662164f8f.5.2026.11.22.05.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:54:35 -0800 (PST)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: linux-rdma@vger.kernel.org,
	Potnuri Bharat Teja <bharat@chelsio.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Roland Dreier <rolanddreier@rivian.com>,
	Steve Wise <larrystevenwise@gmail.com>,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH] RDMA/cxgb4: Unmap BAR2 when c4iw_rdev_open() fails
Date: Sun, 22 Nov 2026 16:54:13 +0300
Message-ID: <20261122135413.93813-1-serhatkumral1@gmail.com>
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

c4iw_alloc() maps BAR2 on T5/T6 devices or its on-chip queue region
on T4 devices. If c4iw_rdev_open() fails, c4iw_alloc() releases the
IB device but leaves the mapping in place.

Unmap the mapped region before releasing the IB device.

Fixes: c6d7b26791a2 ("RDMA/cxgb4: Support on-chip SQs")
Fixes: fa658a98a2d0 ("RDMA/cxgb4: Use the BAR2/WC path for kernel QPs and T5 devices")
Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/infiniband/hw/cxgb4/device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/infiniband/hw/cxgb4/device.c b/drivers/infiniband/hw/cxgb4/device.c
index 24ac9871ce67..35dacf379294 100644
--- a/drivers/infiniband/hw/cxgb4/device.c
+++ b/drivers/infiniband/hw/cxgb4/device.c
@@ -1046,6 +1046,10 @@ static struct c4iw_dev *c4iw_alloc(const struct cxgb4_lld_info *infop)
 	ret = c4iw_rdev_open(&devp->rdev);
 	if (ret) {
 		pr_err("Unable to open CXIO rdev err %d\n", ret);
+		if (devp->rdev.bar2_kva)
+			iounmap(devp->rdev.bar2_kva);
+		if (devp->rdev.oc_mw_kva)
+			iounmap(devp->rdev.oc_mw_kva);
 		ib_dealloc_device(&devp->ibdev);
 		return ERR_PTR(ret);
 	}
-- 
2.53.0

