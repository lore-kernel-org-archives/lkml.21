Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614208;
	b=nnf+NX6bz+j1JBkIBfFbtoKVhqRP5fe6s08EGYOaBYtSYofk2YrPLZebfj9nBOaRCQ0Y
	 XH30KVYDiRj+MbZS1+rcyj90UZbrSNIrGA3+kGyTjBMN9gdcJTLKkJYAcFdToKVzs24/y
	 xOU3twz+KfVtrjAbMK3bKRN5cX747iz7Sz2yJa+IXttm4cGAdzhJbUf1NnhHN5TXDByK6
	 ikwmrP0vo8W5RhqUeeJaaFX/xXDHvgdsPaluKplmmt4JXrFoXCghvvvQU5EUZjcclMULl
	 lDau+ft6l/hDwcu0Yh/AOIuhmRQ18hy9LJh3ACkCRApmYkoSKTm1kVuuvsmaIvxq1Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lyPzL9qDgC5NPyyWRyU2xpYxCkn2FwWXZOnIDyXNGvw=;
	b=JKIdxQxqjcnu6M+HjqMyGenyVO1L6QZwQBSBkK3/vLQzXngGIQgESRJz9CDssPQibr6T
	 MDLwcEFkWvIdMlZkVYhPrqDuHD9Yd8qGLr3Bb9YJOzTUiZbIQ3V/npip/hlpSQ0fHvSbi
	 yk6JExHXmfJfZqsWm1EqQvqplIscwoZiYz43XOiYCb+R0pJUWkvyPPSmYy98rDn37DdvW
	 w8lPomu6UKiItUdrDTStFOucnO2fET5g7KyidaTUZUpmmFUGSWZsCgxHc7wq4i1McKU3t
	 rMYaqNCOyaWfMl7CUhN5XO5b8qohbD1c+6uX5x0bxLTHydcYwiGtg9iTK96pM3kIxkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="S/ivv2sZ";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31200606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31200606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S/ivv2sZ
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so8457372c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614207; x=1796219007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lyPzL9qDgC5NPyyWRyU2xpYxCkn2FwWXZOnIDyXNGvw=;
        b=S/ivv2sZrFfQAn2czE8r/0ql5zt1R0HFKjY7C1HFMkpX2fSxKA32NOSiKQyRCaqQGD
         GpgUqDytS/+Me5QztSNhy3TsSPhSLheEAKynuT7iFIeJs1qDRmpplUgp/PPySvn0G3h2
         4hjfRd1L8xFQ0KwdvO3RTcXWWV3EhJdEK6+KxmYDZ8ZbjNVsQaz7Cxjeu5SvqEmxVZkt
         ly7gBxHHpfW0GqGvYOdnSkOr2SFzm1pkiYBkof3w15AVQpxJA7gYtLufLzblG34X2hDY
         lHpoBQ2L79mCPq/GZ03INg0FndsQ1Xl8EcoZhNh93VSOQ9JJzmwq2e+GAMYYlCHUnK09
         8ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614207; x=1796219007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lyPzL9qDgC5NPyyWRyU2xpYxCkn2FwWXZOnIDyXNGvw=;
        b=xzqAv/7pt9cDGKC4yXZFxKpZgQDaQC8CyTvo44gjl1rp9OSYvdgY5GkfaIgTtB1p6E
         dYBIfeDYprJh1JWAj0C+X3CQfN+3ZJC7XgFpBjU54a9Jf4g51kqVlH5d1tbQ9C2uCjBT
         I/49JXbFmMciKc4uMaV1giAQX5/FzDNlRV+/RcE5VjWQMevpWXsmOExJBK1q1Z0uC/YY
         LHxXrA1pTEHyX9Gyss9z5QXcdFVEB7/RYkVHVi5Nxl4L/Cibxe9PYVjTN5G0TFjULzDn
         cCXEmgzlGkRKMkMLMUKn/Wtyjmdd2/Hr8nLgkJTDZegNn1PtcavhlD/S4LgbOWdC+tLM
         YsXg==
X-Forwarded-Encrypted: i=1; AL+hErGJnGIxiGp5nGFzkk8I/p7JCG7jYMtTqAVo/f81CyckYKFXZaX/VqUoK5mBba+10VCo+Q4h5KFy+eyrI3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JRx7asEd56g8u7wXiGZd5EvFBSiN6Kc830VBGAofbKFtxkPSp
	+BmRn4J9wT/AKa6eSYGHvUWlHu7Ru7BfsSsq1vKMzPaWpLKCKIEBUJpX
X-Gm-Gg: AZFdTZc6fEwHR2xEdOwIJMo8lXZZ48nkPzV/WPGGZRFYhAK8Pf3QK60xArQ7J2l4jvD
	ENLpDtrHqZNAwq39irwwoHjmvAFOeBDvzWEhnH15aA7/MV+YX5ErZVVmMR9q+WHmpuhUw5zsPio
	qIOHzyFsKSWRPjIyi6aNLnucK2IprMc927DQkKuaqBz1IFVvyr5Zh7cH4koRg/mfG2gCKhcD1A7
	ENDsfhc7+1qK2aWg8WoQlD4rIJ5gkbgagyUc9qLKt1neepreAZ07ZLhcBkmD0sZ+ioj5BAINrvl
	BpgsFcQJnDN4SG5H20+Frx9B2kxf0hMFVOyQaX4ddUH098e8jEZ5g9J6Wr278oiNjyT80jY7bHb
	ZhdVQkadliCmrsmkzOto5e0E72LtCnKNtmkQsU7nExDQxCvCVaVCNTNmBI1wEGtWoRV6wHzqs/s
	mgT4C1kI8LH17VIp2jHcrSl6dbPPeEEIix92p71eZ1YfzIdt68pwHsA+SYtTNaXYs7y8uWestE0
	7NforrAAqgRaaw5dA6hLY000CQlfhhPFdnUXD98F1uSDXEwy62yFnnBnSQEsz0n6g0Tnp8DGPAg
	X/CQrdNfJkESX863oKRNwQ0bF4X6hvE3mpusbODHHvAg6hY=
X-Received: by 2002:a05:7300:1c95:b0:385:8851:fa4a with SMTP id 5a478bee46e88-385885211c2mr18419448eec.6.1795614207200;
        Wed, 25 Nov 2026 05:43:27 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm56773511eec.28.2026.11.25.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:43:26 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: qup: release the DMA channels if getting the interconnect path fails
Date: Wed, 25 Nov 2026 20:43:20 +0700
Message-Id: <20261125134320.2701213-1-congnt264@gmail.com>
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

On QUP v2 controllers, qup_i2c_probe() requests the tx and rx DMA
channels with qup_i2c_req_dma(), then gets the interconnect path. If
devm_of_icc_get() fails, for example with -EPROBE_DEFER, probe returns
directly. The channels are not devm managed, so they are never
released and stay held after probe has failed.

Every other failure after the channels are requested goes to fail_dma,
which releases them. Do the same here.

Fixes: d4f35233a634 ("i2c: qup: Vote for interconnect bandwidth to DRAM")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-qup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 731bce9f9a92..53e74de5244b 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1784,9 +1784,11 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		qup->is_dma = true;
 
 		qup->icc_path = devm_of_icc_get(&pdev->dev, NULL);
-		if (IS_ERR(qup->icc_path))
-			return dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
-					     "failed to get interconnect path\n");
+		if (IS_ERR(qup->icc_path)) {
+			ret = dev_err_probe(&pdev->dev, PTR_ERR(qup->icc_path),
+					    "failed to get interconnect path\n");
+			goto fail_dma;
+		}
 	}
 
 nodma:
-- 
2.25.1

