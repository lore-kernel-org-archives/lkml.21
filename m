Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636254;
	b=tG9xv1UDc/lRD+HiIxHdgW/OekwVpSkDr74ugTi+QmWSm7saaZgY9dGBHcMnfWcjr+Ea
	 jFOtgdo4igH132YtZs61HB+d5KLtgh9MhrUtynFK+3RY1Xci4kh1lxSrkSVEt0CXb6/FA
	 8qTUsclC9y+2JyFE+yfrfuKnavZI99jot6qqh40wphvaT9pTzd6eKq6xGZ+GBzGwn4PqI
	 MD4T7ZclVV9A4ByarMSUmgdDH/RpFiIJHBdCIHbpmqLKIlYGe3CetoBA+GqVVJy1NEr/X
	 KhRMrCwK7cNoOCNuTCMiOS+RhghQTfvO28oxYHxZGNbNKmOMzWm8Dp02+gBQGG8KKeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
	b=qJN+XM4Zolja6QtjE4JS4KZYJjJezIpPKZjq4/mJBnXXoQdtDlaCH0Jj+3jeR2lbdMuT
	 vB6Boa4MfYK1pvo7R4AnXxYvWMZIt5JHB2+E2NrvurWE+KtSr1j2Tpr5BaPro7Iu3NRdM
	 rz3MSSKmiCkTv7+bAcuIRqrzN1OfcEwKYxJvtK2g6scg0dzsUqPT7kWgCtG/5QBvE4Zl5
	 pL65VYe8kGmf7K5U1qn3FFFNcEPBG0trozmbSfW3mqm/88vNSqN91qBKD+oaEMimJlGKM
	 mGfw1C6y+kkowObCl15HoYtCTRc4xXkKdq4dD/oDEYf/7URQuT/+184uF4lwVyLytDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q049bUN8;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365BC606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 365BC606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q049bUN8
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-571eb508ebbso2901209b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636253; x=1796241053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=Q049bUN8nj8oNdzlXd0gXC7uw3IDXMZErYyqE2Z+bzNGf0NXUTZsQpY2WDv1wxDPBv
         YO3L8ru3Yyu7HjYZl5NeN5nQFkpncAltnqsHHmidt2aim96uLGU4ar+b9OXBpo4bfLGi
         kek1k9xMli2PfEq0rIJCVVhyrmjCHaF3MKFMxt/FgYJqLpp4+gf5SO/u7MvTRFcwZGxK
         PA6krLQ77SG/0k0ESZFje64oh4yLOvptrVnTqhV1JtJXiMptupPTCHdtAf4aprUy5hET
         QbVnIi/2Dn+sUCaCnB7QuUXRUFlBf6BvsbDq8CntrvwDO0swwBXcRS9MbwvpxIG1/qgP
         pldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636253; x=1796241053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=oh+E/oRDYuzOBWRh6BSwMrK+yvpvnelCt3SxDfenTEz9Vsfg4tHI94glrhEaS0PM5B
         pSjMRjQjgOc7uiKDqvwnHzxqd65LI3MvxlXCrnvedq4qxDH/GWcp5/qdxuFH1tVHPJe2
         1MlTT+I2+ZPOdevUlnks1GbWvML/D26flqQzkWdghUtEDPGQWmeJ6mAqTIZjUkX/+zHZ
         uplrezNMYiflDFFnhIxd15uFipCGt/kgMSpwGmyv4J6TaElWsaQWNrujiHiVw7ER5EcP
         4M3enk0pIRE0aRlcrl2FiR+fqx/9JjuOBCNGVVeXWe5+ISuIxb9+UymXhyRBLBKYscLC
         UaGA==
X-Gm-Message-State: APuU4Z/gJZMKDh6zDyQLcjqQ7TZ3ppQ0sBmStMiiE8jWdV5PSQ+HYz4W
	s/ZEXCpJYDLkYP9EzBOXcCP8iuqwlSKYoIpjafkrxsXPJfjj+T+mWHA=
X-Gm-Gg: AZFdTZdsImkw5BXrLz9BRXuUlP+t5q+/Kh0PnPit7YEcxZKSF2BgLMfVdyXTpXLSSl+
	YRXjL1OnG+ilQy1AzbHxZo61FbztT2emLpomvjVrO8RWgyf4DZkf/DEhOnXWk3eguRUEazteTQM
	qgpPd/mL6/qGQ40ZIhji6sXPRAk/XSi3wvvBOCQ48Ll3w6WLfCKMVJo242gXg6DIqK4RKIAHhpn
	XIFty+fYaGdyRS1U1T2dXq9U/Z0By2/mLleRf6EKtbXvrJCpEfDBD0PPyOpGq6MsWaCW1jLIDHc
	6mJ+21K14Sffu2liAN8qQXkq0SeudbawpLZtFLjwocsoTXkGQfSc7wj+oFA9zw8z36yOPFh1C1U
	cqvMWnlM5RBQPlclrOJxVsbQKvO7WRZ2ywGdjbqZeVR6KauqhZ4hZUmp6Z4nIVtEiPR4T5WjSYO
	07oC8fqsmTWIauuVoFpXL/LZUTm5N+DEVSiH9lBWwhKzdBJ3VvRFvvpKyaK8QnpCKdN0VICypct
	rPrIY53H686W/acA1T/6hOr2I7spA/hAJeVmJW/WM7EK2YkpZnUzpMfMSb3lRObwTOW7dviN7Ls
	YnirEDwVAWurQc9V5DVAgHcO1nUH9BRkvIXQ5oafzv11afJbZeWwG28i
X-Received: by 2002:a05:6808:3088:b0:567:c44d:c1fa with SMTP id 5614622812f47-57a0a60d7f3mr22430239b6e.16.1795636253124;
        Wed, 25 Nov 2026 11:50:53 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:52 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 04/12] media: tw9900: add saturation, hue and sharpness controls
Date: Wed, 25 Nov 2026 13:49:43 -0600
Message-ID: <20261125194951.19072-5-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125194951.19072-1-matthew.laux@gmail.com>
References: <20261125194951.19072-1-matthew.laux@gmail.com>
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
index df8c7b1f3450..42fc2afbbc77 100644
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

