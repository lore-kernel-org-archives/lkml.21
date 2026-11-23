Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411938;
	b=CVT0eJqJ4J2Gb38pIpRN3YtAtRwnMbd9QUI8+mnmY0INJtr+2rndmYHEys5Rz8QEVw9b
	 emAz17hPOEQt5yBiFHZ3RBhHzaxg665X/wRFa5ZgvPbZ5dE+WYJ+KJCZMpxt6kl+JeAAp
	 KPVf1dke7HMlUxPiiVCXd+nGOF+c588fE4BoHBR/rMtcmgdoic55Cje3sliVquzsVySBd
	 ZWywiCo4RWDqn3WTjV4YwAv9JvQ5BKVRsFLkmwhH1u9H6GkjXi809JnZDuEC2WzrB2x5r
	 n6O1Cp079WoIlbh4DE0QTsBo18z+9+Y/2jpHLYXzA+ugqH9ALOoz4X0NsKbM/CMRYKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hNqslqae6xPnbmlVmgUh2ZZ2KL2qdjZyfASnNMv5/5k=;
	b=f9cCGpASvxanyRAFvQItw4J7dw2S5YvkUH2SFpYaEO84viDpkIwBA60chmBDguD/2HwE
	 pK0vFkJnz7M0JChVyQMtJDFyvE8m1TPPAderERDtTi6T9lHZWxP4/qXiPuIkNn5rdV0bl
	 Ve6e6ddYif8uQKz3e/0tuszZXTS+MZU4CUJwzzqy6jPbuqobl0YC7S3Z6fz0z80t7Vffw
	 DaBL893K9h5Ly/dVn39Jcu1T19wngOujJu+1YvGvglHu1JJzgRvLj4eVutqAgo6tvOzfb
	 Ox57n3kDMszGDuc1lLG4oiubOpatrN2om2WOvjL8ya/JfDSPDGfBGa3WtBkMew1D6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNwKM2bz;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E560D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E560D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gNwKM2bz
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so35054725e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 21:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411936; x=1796016736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNqslqae6xPnbmlVmgUh2ZZ2KL2qdjZyfASnNMv5/5k=;
        b=gNwKM2bzkcZFrwcl5sDDGTNR3i2ivvUgCudjI/j4SKT8Ncd+VOlBilqILX05M5BZcJ
         YHBydctbxhV2DzV6/yJ8vAaJp7qof2XJIiE64U8PDxXOYpryIQf3n495lQbUf6YsNlIn
         3QtKs7ahwq2TspAxv0xKPA/9uHa+ynunip3Fj2KXIwSQi16+AmgRjtcWcIkIQ4UBSpfR
         ZpEvQ8m6DAoM2xX/OUjn+ykAolEANafxpL4BxkOq/9pn/6Qd+FmMli/YdRX0SZxlI2ra
         F1Jmmboa9UfLPWoYlHCWZCQ3WS+VpfXYvoXOGrtqlF48MYiR+PPunQa/Sjt3XKSBqC5l
         r3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411936; x=1796016736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNqslqae6xPnbmlVmgUh2ZZ2KL2qdjZyfASnNMv5/5k=;
        b=JkHhwwr3/x9xw3DogFOXP5aKgJEiZmQcGKylsrOL+J9ubjcmSw9TX7TS3tSguM48fj
         ivioZgaJqjXTD5RRt4Dcds6QAgXoNuOGfTVj+sY90TXPJmT2ZJWh2YmkfmJs6sB8qDns
         fYQxRy8oGov0eQ9bF/A/ORiso9Wt6dn12xZt5AyBF6tsMZzVDdINRdPqMJb7lSZZCt5M
         HZhLcz6ZPXskE8rZvwEakbBtI0UqWAXrNSXFFNCJJ988P4fSoH1Cxwl6dzbfRKUsLx0O
         +R/6acjCqn3fra6Q4w14UYZSnaKQEayEH/YG20D91OPpEUi8pQUK3sGP7ks81yvLxHXf
         PmWg==
X-Forwarded-Encrypted: i=1; AL+hErEcRHN554pqviZOt2YN+N7MyNTAWXuCRn93LfUkobx7rsv2FE9p5sPaHGKQem4swBhPOS01NYlLUAimXzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c4XR58AZplgoPNTgGjqxsQS4V06aNEJTN35hGn5oCPTg4nA0y
	HHXmzKM+WcwL322qfBZTbLHLFSazApUa4C5vCQHlu1kz10pQn/fGEHJZ
X-Gm-Gg: AZFdTZepJltKEwoL2yfFf/9zB3elBfFUn0ES9vh/+nCyvtDwyDAIqfBWJWeGKl9SC8V
	uFyOaWndiULaZ6fzq+ABTYAIqu5Kw7d7UnjYgZPj5td6pQuyMhpZSqc609dS2a1Q9tZ7cb7xLht
	oGQfzXJ5LoQZFIARczQogXg6oxHsvh6g+gSC+28FGWAaRA4kj6+2B5tDKg9ASRx+aIj514Bh3Gj
	IHg6zVxa5HBrWiKKxtPsxiWI/wTSeKmTHo75BuU+EX/uvTKy62VLVjTHsL5imEDdZ+E8coy6/gq
	GgYTQzcj7PA28o+3PV3plQUGyGfGTQoIyvQM91I6nkBJfDgiozZ2b86r8rrzFY1GAWKsVboZWWv
	Pixe3PyedWBB61RVgWp9On3s4KJPUt6XoSfI8qj8UMYD6201/3WLxma99IcpDX68Q4wxZlsRHzm
	tFi6t82kH1MDmgqOwWlKuwm+zMoWd6Y3C2dB0LOEyA/OqWciHsIK06SlYF/KXLH0ZBjFyGl+0uK
	A8DGx8mLDGo3No8I5rpcS5eYMO/Y3xHAAsrX77WiDPvXkL7ls6n2ZKIJaNObvzz83z5vj2HwonI
	hoTP09i2YdX9p7JvDKh9LZwY1TKtAdBt/xmKDNecqvKJVj4ObdpFDZBoErV9SMuwIWyBd2Uv01E
	yKzH/csu1raz5NQ==
X-Received: by 2002:a05:600c:1d83:b0:4bb:687c:4fbe with SMTP id 5b1f17b1804b1-4bb88805c26mr190030495e9.8.1795411936059;
        Sun, 22 Nov 2026 21:32:16 -0800 (PST)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm369423435e9.7.2026.11.22.21.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:32:15 -0800 (PST)
From: David Carlier <devnexen@gmail.com>
To: jacopo.mondi@ideasonboard.com,
	philippebaetens@gmail.com
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] media: i2c: mira016: Use the 12-bit format as default
Date: Mon, 23 Nov 2026 05:32:12 +0000
Message-ID: <20261123053212.212169-1-devnexen@gmail.com>
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

The analogue gain control is created with a 1..1 range, which is only
valid for the 12-bit format, while init_state applies the 8-bit format.
The gain cannot be changed until userspace sets the active format.

Make the 12-bit format the default, and initialise row_length to the
matching value so the blanking, pixel rate and exposure limits are
computed for it.

The issue was found by code inspection with an LLM, build tested only.

Signed-off-by: David Carlier <devnexen@gmail.com>
---

Notes:
    v2: make 12-bit the default format instead of widening the gain range,
        drop the Fixes tag (Jacopo)

 drivers/media/i2c/mira016.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mira016.c b/drivers/media/i2c/mira016.c
index 082442ffad28..d6db922f01b6 100644
--- a/drivers/media/i2c/mira016.c
+++ b/drivers/media/i2c/mira016.c
@@ -1630,7 +1630,7 @@ static int mira016_init_state(struct v4l2_subdev *sd,
 		.which = V4L2_SUBDEV_FORMAT_TRY,
 		.pad = 0,
 		.format = {
-			.code = MEDIA_BUS_FMT_Y8_1X8,
+			.code = MEDIA_BUS_FMT_Y12_1X12,
 			.width = MIRA016_PIXEL_ARRAY_WIDTH,
 			.height = MIRA016_PIXEL_ARRAY_HEIGHT
 		},
@@ -2254,7 +2254,7 @@ static int mira016_probe(struct i2c_client *client)
 	 */
 	mira016_pll_calc(mira016);
 	mira016_timings_calc(mira016);
-	mira016->timings.row_length = 1062;
+	mira016->timings.row_length = 1504;
 
 	ret = mira016_power_on(dev);
 	if (ret)
-- 
2.55.0

