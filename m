Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034601;
	b=Wq9/MUCGyqY4yPoYxNmIvnn3Wap+JkF6dBC6kAPiCQ0viDRry22fO9dC4c+NLlUa6UMp
	 fE7xHOKVmqN9Yu7hJMPI6ATFPvFN2nfSS67Yalxlx+dXzlrOO7s3JHL+EGCGEcFy9viWg
	 Zzrp39TEZq9ql6RdlQHTXWBljd2VIXazd8iQcVBHcHNc/Io7Gm/ck9MvxTm2DkuiauUJP
	 LA8QPOaKa44OMJvVlncdptBlwJoAs+JTsFtJlhF/HN55vtuFkNnIHJKyF7Ynq6sH7ihfv
	 AJr82SnSDpKm24AD91ALpIjPWMhCP11RjmYaGM0hEjZXeED0haHo71v2XeLk5CtgmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
	b=rGS8+zywxMH2dmyAwsjXMpHWcn1HebnSLyWDo5mcO/cL1jxnL8CVlOYaqS/WRKZyrdzT
	 N5ebuGZF7oGnETiaHA5m4LhSyxRduFfRkPS3031++LGloOMDGzgY/Xn7hHwAC5D9CMjFl
	 JoftJ9LZvhS9lREE46NVsjyOSEEmgYIYu3+L2DIJTM9XR9CKkxSRox8m8ybBCINCD4ePw
	 j7bVcNE+/GgkkwvCy85k1fhzVwX4+qUHcT7d6NcBuDPJlsAFBTS8Zdu3NJM9uAwuIBNTH
	 dGi6pWhsU/zD+pTZJIoyP1xnJG9oEZ9v//zy6NqKlRzAKWHmS7yEZjbzB0cR/qOnOAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1qNzhnC;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0F606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30B0F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m1qNzhnC
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-7190d9bdb2cso1041716eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034600; x=1795639400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=m1qNzhnClzL2ZS0fSFd8ueIo76GZZ4z13jX9EKGqGvXELXRwi5KUOOQD4fEywycSJC
         vaa07c4wrbZO19fyQ4Yp5bzvVKcQHEP6sg7zWB2dIUwsiAi0VuzRpgt0UKyCdy8H0vwu
         OlaK//hT6ab0Ui/eTeR50z0ij23YHmGclBDAyR+VRyr8lzYOw4CVhksPdW15ALHSaN5a
         vaMjZr3KXAyF8vxWGWfjFSoU5fUPVPVrd3vAEYs3/9xkiwwTYa3stnjc1648nVdqz2GC
         X/YsZq9f0kaoC3P+qneih0J1UKYqrzqWSANgwVggvtNY/PYSMb4IV8M54Wb8ayFZmmkh
         FU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034600; x=1795639400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7CFTxIrkgVGgy+aKlyvBSzxrG+mnLeXQiFVLrDU4qps=;
        b=N0jmVldEl+Z7o7nrsdr7orIpn4iiQImDaxqNKOjRDAoFPm5UFcdY5Y67QUDpoyF4BM
         mg/UcHhH76dSkiuSlwthsH7ChAVdyJzY9LScsxMgdej9QDeZbLw8qtCwDHassJrvWJNI
         ZywBDH8FPhwkVgm0UY+XuOTaj1DoGLNSML2roBBovLEroU9CE21ZGWqmKa8dczBJiQAQ
         FUFBvNEFA4Hp3dKPdU4q30on5z8PuVqslwkvL26mKBg6tRJ3CUlKZw/hLHNSdsSrZA00
         VDt6bly9YXhza7ELGcPzml4qX7SyuoyCszwiJ+fKftPa373KWf5Z+qPZhL8Mx/pgDMaG
         w49g==
X-Gm-Message-State: APuU4Z/3rWtCzmL7CeGo0pmokkfg3P0kfQlePp9tVcnF3MnFjR9YpH5J
	vAORZP6IntLzQxN++hVAnBQcG0qczo2bI14EF6RWlpb3XEZD9cJu2ot6DBxzFDkfuQ==
X-Gm-Gg: AYBFou3g25a6tw8f08lQpGQnDudH9gAxNiytUMXuv9gvPAAGnm9e5azXdTCqTiu7BhA
	X5Vd2Ec4gejbPRZqh8R8100EDkS8RkY//Glf5P4mB63zGQTghv4t54HmN3X743nROJFpzUZJ2Zf
	+/v+zTzbvk+NOv8odU614LCiyolbpP9+4Zs1PRqzuCPLYQr3k9jBCHpb2+HisHlMT1KB39yuuAn
	Rc2mD6FJmREGToIKiyrGUqwh+Z7WZS5IZLc0zZSPWl/4MFXgOieeIgVBVvemxUbiiQtxDOEKeE2
	m4tHcKhzBFyX2qcWdnBIMQQEvXynN2sn9zm7FzdYMUepeDc93cKyoq/8/6nl4NKofSYzZAwuVLS
	8wmZlIFXXo2z3PdKasq0K2ESQkdW/dpUFNHa5HN2aBssgC29wOr8GLFIH4oLdC01UYqWJl1uTRn
	Z1xQCmKGG46XgugD5K72yfkrd7/xjo+gknesiIEmHX0pMjFcZjlr1Y3jeUsoycD5QykjTbsWgPG
	imRdJ/oTnSlmbOhYZ6NkrgYAtEDb8wR/OMU+T1nV/eskEXPOTAPgpYqEGN3JHEqmZPx+9DiuTZj
	d4g1DreXRZDV8MZQenSSKhSh+T5Z0XGid81o3T49qez86ucckLWcVj4PS7YqN1/jvl5dVxXHUpf
	X1Q==
X-Received: by 2002:a05:6820:a649:10b0:71a:f211:9547 with SMTP id 006d021491bc7-71b18297b00mr2227922eaf.4.1795034600007;
        Wed, 18 Nov 2026 12:43:20 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:19 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 3/8] media: tw9900: add saturation, hue and sharpness controls
Date: Wed, 18 Nov 2026 14:43:00 -0600
Message-ID: <20261118204305.28268-4-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118204305.28268-1-matthew.laux@gmail.com>
References: <20261118204305.28268-1-matthew.laux@gmail.com>
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

