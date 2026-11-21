Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290616;
	b=S5ldgwzQi9hzeVA3VRvi3bl/+A7ywZ8IMztPmJ11nhrYOLFzYi2Pibr2rFkYmUo3v6V5
	 XoM0ihOmr6WH+0lD936dkempFoj1VPmqYUkjK5anTx1uAGFPxg0oe2nqaMtigV4FmaNtz
	 RsLWaBN1+EDYLPlqSO3Yr/SoXy8Jmh7YLKBbENu+cNi0hF/b9aXB/QaeonUdv9ysT7gAL
	 xckcolbsPWjMnCEMqHZUwB6vLvsEdaON0hcI+RC/rj6m82xzFEoAIlVOcj8/KR3WdFg0c
	 EDtqccgnGHRtMTjJ5xm2l6cU5IrM3+aPlLyqFTrfyJPDbRWOJftaZ7HgL76+gE8Xd5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290616;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=caO62CRcquzMhc3LfJR9sFGBYG9i0UvG7WLpxAU9WDQ=;
	b=Z0YQJyzG1sp3ACV3lHR9Ugppj3ypkLq4TxHq5piCOihIlG/psytHSiRQ3mU6KM+0omOw
	 eZJKssjzn8EHHl54V/3lKUD1rYWUn80D2MBCrJL0VuylUmsl3p0FlQ0NIWn/EH3BhSpDp
	 FUZ9ZjSIVPIA1xhmnDtzuE2USVVOcNVKIQNBvft1VQv3qGlGW5cgPykphG822mH3RQWj4
	 oJgKZaLA8Yi+hQ51k3vhz9dtI0P5XfRwqvhSrKFoAH39THgwv/jghWgjpi1tdAO8btCWQ
	 QB+xan1uDoOpMv7PGZ+1MFeXFkomcYeqcfkKjPmjtEPswwigHPRbXemh1uoF187GhnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWojhLjQ;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB58606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AB58606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gWojhLjQ
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49465892f7bso1531103f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290614; x=1795895414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=caO62CRcquzMhc3LfJR9sFGBYG9i0UvG7WLpxAU9WDQ=;
        b=gWojhLjQLIPFxgEsCV8UZbCzC0PLaIsSqUzBowkTLEz7KA4iCZycyQCEthgek5zf94
         58zNgjfbhhbq82SuVPbvP7dLsmPjklKtvZjb+HE5syT869WgdxjM3qBb2+dC12G4uk5g
         nc54Y2cUGa9ows1ji6b8GHtpOmwHEU99FYjNMF4MEzne5uK3S55iwxLApoCz8zs+yiDN
         Vn+9yQi9GOPvKtkCQUbwHaBbpZCfOzGoN7stBbypgYalNOGtnIrvRjWAJc9eh/nzNZQP
         61wNBnUzaZ2tjEEjVhbPe8XnKouYgSXVWMJi4zZrQ6hOOHm1ClMDZM+JbugY48plBH/S
         1XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290614; x=1795895414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caO62CRcquzMhc3LfJR9sFGBYG9i0UvG7WLpxAU9WDQ=;
        b=V+BA3RELv4dg/i7QvxjtTgbXdLHk0QtwYI3ebBdR+QD9RlUVG4HXANsKLyhFMu+ZuD
         CFDoD9UAFbbq1Iw5LqhkpHR78VDfZnrjhdw9reXJXzHg+mE2Q2wvgYQ37ycCf3dVPLJT
         iyy/OYDvzsx8lbnuSswm3PZbKEXdLuZkm7VGHSXN7kI/D4JL7ahyMnglfPDvvA+2WdFc
         pfzzmLSrRHLfZpj+Dou+oDsmt1Hf5GVam6nMTqW8BTHGd1+bX0BvpF3CKMXaRUUXPW+Q
         4F4CVXuyqyEBrZl1+5OJNeZ1mJDEcauW1V8v5KqvkApCfS6rB1NpSuU9m5gLA+X5MTwJ
         RJZg==
X-Forwarded-Encrypted: i=1; AL+hErFSJm+03KhumYyQIwB1PPVBrueZUSB9429sP1R7RkOAoZzuZzk69QCZUM+tVQJ4oM9zgQHoXZf3EhJNtY8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w7pu2XvFEIoVFeYygwD95xMQTXpTN7NX2a2N6gmXaH9yweBpx
	P/+b4JlkZcQpN7nMWvV8kp94EuxFtjGWxBeyoLgnFK0Cx3A6CANaOHmN
X-Gm-Gg: AZFdTZdqvuTk/xOKT05AD0Ps/YCvItVOwJbTVmC1P2kO4VnX8m2d3nVHOeeguIPQr0i
	wSzMmBTKXx1O0w6XhmlP71N90s8kxLbwE3Qc7kK5HSOPXtCzh/fT/SQ6KamJBIve4XWyDaqN6aE
	8pCVe/zYGa7cbGgBwm7mgqqtQA5+wn4F+jrbo3etCXCW+HSTDiMlaKMKtgkvavaLp/tXFZ2ifSs
	UnNUuoZmmRWUENhvOa60fhCs7+bFWsqTnH3ebdQVaRZerGwxeunz8Dy6bIe6GU69g7MddVfZRvy
	sIPRaL4XTZeD/N7wzCKoog2LONsS0MAIbokNOkWfT8Cfn3baTzytk2djfmNw5WkXCvSaBmcl7r+
	VNwx2F2j7wKOMrdPo2gKTDS8PLZ1TlOxg+dcqcIof41nHuxBoO1o4xhvMtVJE5lvrsT5XLYcw6h
	8LGCQXbcCcwluciIc/69UuQ4CraZcpUGB+9Ai5gpcH0ZFZcRkSpj4xpj0long06+SR+bmoZ/kFO
	dzxNvnqPHddCeIexgUHw6nfu+85e7Q6aKKFlSu1W6Q/qSCevdeNJictrK8nbbltBFzj0xkjOjGe
	iARY3s0hv08niEjbjQznfSdcfUfNoevt2wJt+mfPhnFDg154DM6LWscRVb0xzGibV79ZOQkNw6H
	Se1fGi9XHYisR4w==
X-Received: by 2002:a05:6000:490b:b0:491:8462:20be with SMTP id ffacd0b85a97d-4abb1baaad9mr14119237f8f.12.1795290613677;
        Sat, 21 Nov 2026 11:50:13 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61ddsm11814869f8f.12.2026.11.21.11.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:13 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: jacopo.mondi@ideasonboard.com,
	philippebaetens@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH] media: i2c: mira016: Fix analogue gain range for the default format
Date: Sat, 21 Nov 2026 19:50:10 +0000
Message-ID: <20261121195010.820752-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The analogue gain control is created with a 1..1 range, and the range is
only updated when an active format is set. The default 8-bit format is
applied by init_state as a TRY format, so the gain cannot be changed
until userspace sets the active format.

Create the control with the 8-bit gain range to match the default format.

The issue was found by code inspection with an LLM, build tested only.

Fixes: ab4a4c39c611 ("media: i2c: mira016: Add driver for Mira016")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/i2c/mira016.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
index 082442ffad28..076e8a22be82 100644
--- a/drivers/media/i2c/mira016.c
+++ b/drivers/media/i2c/mira016.c
@@ -1917,9 +1917,11 @@ static int mira016_init_controls(struct mira016 *mira016)
 					      MIRA016_MAX_EXPOSURE, 1,
 					      def_exposure);
 
+	/* The gain range matches the default 8-bit format set in init_state. */
 	mira016->gain = v4l2_ctrl_new_std(ctrl_hdlr, &mira016_ctrl_ops,
-					  V4L2_CID_ANALOGUE_GAIN,
-					  1, 1, 1, 1);
+					  V4L2_CID_ANALOGUE_GAIN, 1,
+					  ARRAY_SIZE(mira016_gain_lut_8bit),
+					  1, 1);
 
 	/*
 	 * Changing VFLIP requires re-programming the top point, hence we
-- 
2.55.0

