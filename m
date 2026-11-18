Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029738;
	b=jo8BS2u/oDzxON5/CWRLS9HCdhEb0u9gcJJ8U2cYHG4t9OvSfW9oS/1Z6tKI2tU/Spvh
	 +QAkD+SYftWwOQpMqlSjZlXZo/CPkhcqJNPZ4viUG9WHeuadSBzRs5t07JlT75IR/ZM8M
	 8adBv8ovtocK9HSdYuq3LlXJl8MEzx/IjFvqfKA1Mus8VpEKhz5Ig68ZaHL48YayOq3va
	 sy5uBdcXVD0HS9rgO7Cu2HtsAyfZT2AC7UIl6sAybPkmw0nqHC/vCOLOB2V91aSI2z0/h
	 sNAowz4EggfjjQk3eooy3AftTkDJrsDF+EyanQV0ead++bNpSTcrjYVKZpr8o/9MZaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
	b=uAMOYGKxMz89gL+tu8g+i+wGLNw3dDa8j3Sv2OXMcmN7AmcSWHxYwd2DKucVY2RuKQQ+
	 9NHNdRoMjbdd1fWOArnVfmm3KHjzsSBIRXJs2rCjCZbaXa7E7JDQ3z/WgpgTdAwKpMXqv
	 8aHkRG4rLe9nB2vPwDWxko1X5jQQbnvq9cXDoJCQmXWyddPr9G7zPzOfT9igLS68s+SSO
	 LNeXTwMLmgbsgCzCvw7tWivjSBfGE3RCZ7kRRGWXi7Pi7r1bbGkcx0gpxSXtn2AeMNKOF
	 AXVSxNdvyuiU4qeq1Wc3DRfGXXoeLdpj92kBzFjAR8iKcKXck4obaGoO89d3JOnyN1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9FjOSXN;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1D606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12F1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U9FjOSXN
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6df5e315bd1so1115524eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029737; x=1795634537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=U9FjOSXNHp003asYYe7PFiG58xDX7z9VHu6PX4Go8XzZw8sfYyA/1QHeGVexWmY5St
         M6EMobBpex+13eNFNGzMsJCnHS+K8TV8O++buET/NyqwUcCFaJktCf15XzT4QUXtVvtg
         ovM9ioicm5U8PLRyk43OIWZ04Q/DWdzDXWAr4bETdlaBv1FMSvJZNJHZAijlvmxItoGL
         UmPyTar6g+VWte1rntzq1skuv14nDrjDB7wRKbBCoUJSBykB/+IlpaOlAF+1OK1Lgh/o
         wA2EVA4bxfE8IATT4etOlZ6LUXsF81rNEV54nX1L0veueRbt4ZGKH04rkHJfO/+K07Rt
         QFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029737; x=1795634537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=XYNrn4OkVcgMCf+IFuXw5uzNeVcOcSFra5cYXyFVL1UBwzYjmnTpqaJb4NX8ExgUa/
         aRq8vNGAFkV9vGiDPVlGeqHq3TDL6Ai0eGTZA3MQJy1CLkkSUfG24z+baTnt9jILuGuI
         mXCFA3ZL6snGSNoc64u+7DojWfaTP45kzbqdWJWPaVxWVtIPY5ox23OUwyDYJwBcAbop
         czvW91T9x8q32qEOjLLITefnckEOdbZ7K1miAGlQGB450+FqDh/BJXsu2ik4oWUcYUmF
         J7gMpcdO/7hq2AvI4tA2ntYAI/fhvIgVmokN2RlB3k6m1DiPSFUY9P5CVHYLNm9GXBJt
         kcaA==
X-Gm-Message-State: APuU4Z/mPF0pAoGzXeKkPcMOiD/le+NugMdNxe2SKAEsrYQ8Lc0+LBpq
	p5vWKRmTVCx53lpTgx0lIGx6L7zQNu+TkTPq0ftbO19VScfxoanRA9M=
X-Gm-Gg: AYBFou3Hg3ZQkld+gkZaj80MFFtyCZPADtnVRUnziD72jIKwpT8jlwA4BjgTehJtBPf
	7c++at7r/HJRPQHwjhl+ZQCv/DUpoE+wUMpS6Dwuw0EOiWdFvb+f/iB2pOucCfbLHa+xjZqQVEy
	eyrXBJGWIKgPWSE0EOHM28A6JWwwsk8E1SccXCjeI7d52geokFqUkjIJ/q/M+ZqnjHiD3IHzbRi
	hwZX2/0pMR/di6WwIClLSRhCT8GUMOQtk7nYrYkV4Kbau+v4//DO8r6a/fhBslk2XPNsY1Zsa1e
	wXX02+Z6gw1A0WqLXrwdqD10pbPrLpeaM8aW2OnSdT/D6G1Zqwy1m/dT0Xq9JY91P74zy6HvfX0
	dEKilggvR1ako/PWoq0oHrz8XyWQrKJqjpacq/+aq7wA7d2t92HQJzVJDXx7cBqswYgYSyJ8JWC
	7F6uM8QParSh6cPSfgyWbSa9C5n38zKjEUrbwKped5iwXRRsAI0vOTqJ4D55devZ7JKCUipG7Z8
	C7gnEL9xbDm4pQkbn1aCuX6MIRvjwkYFfwwrnpDd1HvRuOLAEoKEwjuIuOY/T6jzm8161KH8yRg
	1fXe+5khHH+uHOUKVowwhwNBPyY+LVaHL7MHTdpVaLZAfQjdqoZWXzGs
X-Received: by 2002:a05:6820:a504:20b0:70b:8831:8c5e with SMTP id 006d021491bc7-71b1853a165mr2213309eaf.51.1795029736537;
        Wed, 18 Nov 2026 11:22:16 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:16 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 3/8] media: tw9900: add saturation, hue and sharpness controls
Date: Wed, 18 Nov 2026 13:21:19 -0600
Message-ID: <20261118192124.23330-4-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118192124.23330-1-matthew.laux@gmail.com>
References: <20261118192124.23330-1-matthew.laux@gmail.com>
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

Add additional V4L2 controls for the tw9900 that modify the appropriate
registers for saturation, hue, and sharpness, sourced from the datasheet.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index 60d5686716f7..d365432e8f89 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -41,6 +41,11 @@
 #define TW9900_REG_CNTRL1			0x0C
 #define TW9900_REG_BRIGHT_CTL			0x10
 #define TW9900_REG_CONTRAST_CTL			0x11
+#define TW9900_REG_SHARPNESS			0x12
+#define TW9900_REG_SHARPNESS_MASK		GENMASK(3, 0)
+#define TW9900_REG_SAT_U			0x13
+#define TW9900_REG_SAT_V			0x14
+#define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
 #define TW9900_REG_OUT_CTRL_II			0x1B
@@ -252,6 +257,26 @@ static int tw9900_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = tw9900_write_reg(tw9900->client, TW9900_REG_CONTRAST_CTL,
 				       (u8)ctrl->val);
 		break;
+	case V4L2_CID_SATURATION:
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SAT_U,
+				       (u8)ctrl->val);
+		if (ret)
+			break;
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SAT_V,
+				       (u8)ctrl->val);
+		break;
+	case V4L2_CID_HUE:
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_HUE,
+				       (u8)ctrl->val);
+		break;
+	case V4L2_CID_SHARPNESS:
+		ret = tw9900_read_reg(tw9900->client, TW9900_REG_SHARPNESS);
+		if (ret < 0)
+			break;
+		ret = tw9900_write_reg(tw9900->client, TW9900_REG_SHARPNESS,
+				       (ret & ~TW9900_REG_SHARPNESS_MASK) |
+				       ctrl->val);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -701,7 +726,7 @@ static int tw9900_probe(struct i2c_client *client)
 
 	hdl = &tw9900->hdl;
 
-	ret = v4l2_ctrl_handler_init(hdl, 2);
+	ret = v4l2_ctrl_handler_init(hdl, 5);
 	if (ret)
 		goto err_destory_mutex;
 
@@ -711,6 +736,12 @@ static int tw9900_probe(struct i2c_client *client)
 			  -128, 127, 1, 0);
 	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_CONTRAST,
 			  0, 255, 1, 0x60);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_SATURATION,
+			  0, 255, 1, 0x80);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_HUE,
+			  -128, 127, 1, 0);
+	v4l2_ctrl_new_std(hdl, &tw9900_ctrl_ops, V4L2_CID_SHARPNESS,
+			  0, 15, 1, 1);
 
 	tw9900->subdev.ctrl_handler = hdl;
 	if (hdl->error) {
-- 
2.47.3

