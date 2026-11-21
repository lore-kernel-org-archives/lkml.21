Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233352;
	b=J6RwKqBEilrD6RLsZabEmhuAKk8aUvsajJQuimrJ9vy5+weWU5u1gyJTGQR4bWXPpZNv
	 PmFx4BxNkP4CKiKcXxISAvxQa5nt+7Pb5Ais0swsAFLnvxPMIIe+6hgccFpPnqY21bd+f
	 2YzzdTYH75jsWVjsc69n0cpvMriDnF1fAb4BvBpsF4i5+hANaSoY9n4d5mk9KrIeKeYa3
	 x1sAfvkeK/HzouqM2hHZk/LOHbS9MNVe8CaJXuL2YrOYj3wuz/YZazgAxDYgtsvzloYcP
	 34sPkeciHE/vpPBv/p6IdKzpVWtMXBaJixsgP/O0dZYY5dQdFmGPiqMMr73XqU60yQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
	b=CXDs5+q1I5Tx+UD394JxWjpsf91efE/iNuJDJEpe3NUa18h1KxsJ+ChRyAKk7/dqQ7au
	 LSa8aBFHWHj0yxkFWgkzeE8tejIB0oApxBX0sPn2uaVHI2j7XDJbhfGPro+MmEbEHnQAN
	 /XqxanPGTHt/jD0mdC4kdmJ4zuIaYjFuC9qD7trVFrZ9aTQja4F35aSQR4gOLOmnXkece
	 BhRPRPIzwgZkCJrvX5VcPAzxMP67nzIojcT5p3AEWmQQwkbsIEN9S8JgaXzW80ZwNnwQZ
	 bIy9qt7F4fIc/cRdcPYuKbZ4qO8sIaAE22CxhQGS15DtcrWwRndNQatrfgyK5/D0vEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="W7/r/Wjv";
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E4F60A2638
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80E4F60A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W7/r/Wjv
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-717080a2d50so1455239eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795233348; x=1795838148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=W7/r/Wjv56raxiWAGvFLwcwL9omFwPYkw8pdRgz3zyIPHpaNXJhNycB6BZyrpWa3Oa
         P8w/NXnVnc0okfD9WwEgF+wXDlZi4Sr4yp43lZMQHkRWnRkjxCkNAshXqZCzVzbxEo4r
         W2bx78Ec0gWNwUmfjUptsizWqOv9ijsvRZfDp5d94KQFubfixi4tvJKpnZIV6tRE3RY6
         uvdEK8lD1fJWQnK2zUl4ZQZ8xwxeVmjDgDuD/spX8IZMpMcTDtXZXhsOUq/he+Sd3HIO
         0s9eS829kVGj0cKytSOMN1dw0SywVdWSu+b/iiWbDqvJWJNNQ6917r8fWC9KAwq4vPwf
         SJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795233348; x=1795838148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f26y5jc9tp63kZFVuaY6BdCWgQ3qpYUmHrk3jnvaA64=;
        b=XrAIrWjz3YyFdFocEZ/2TTdK7TzP1Tx2K6J0ZFD6Xvj6hGTquVdv7S9wx59a3R9yk0
         IFC56ys+ku64qmK3Sl5pFAT4B5NvRTpYuOb/6k9LnqY/gfX7VkDTt/IX7ebwJm0wrOkF
         KuL3uMl7MZMv5H0Wd49GGaCJnS/xmuYJGNTwi2HyLkYFcrsVDyMn37dh34UyFZf/eT5f
         bLbz9ksR3Bl2M6eABSFu/Y4+qX6cMT8bKVpIo+tRIeYfK2gCMK4U0puq7SUXMWOKupzw
         KZXEPsIntcn2k8z6C6IEHWiWx310j8AKPQHmjGteFc8aG2J97DFVX5KXkTiESDDg10/s
         13Ig==
X-Gm-Message-State: APuU4Z/7l6xRsqTLo51o3WVkp/4Hx1ELCVcgCcGVHAXStv78nqtn21tO
	xidvvkL+aeIwFymDsPvYL64WNE4CT0+9xUE1cb1iRpNCmVsh/s5Vq2M=
X-Gm-Gg: AYBFou2ac56myJ9oQQGnhQJhDG33QE/Zyzh7GjZEFQc/5SaMZVzW1Ul04/SHgMjCV+o
	Gm1wzY18aVQvS/hhBEe8RzjumD9yN0oUETDl7mi0g+1Tv1jzJpfL/a/K+26xPA5YZAErSiRvID4
	KUMHkgWdAlYlmLmJF5TqIXhk9KpgME+LgrsZXJQrRwJ0XGZFtp1Qn16J1HsIYVhB8TmhWtDu/t0
	P7GMV7k0f48YBSjNebKhtzVao6UhvTzuCSPV32SLVzMRCapM8QvHlYx3TBRbfCeQj0crcIQ3hrN
	CMSCF7t12/4wZ37N4UZUZaixWzopn53/qbrtrOX4CNB7BeLD60aN0I8dFc2XacQrvMP1QidUF9u
	iuEe0XPNAiO/c+DgcwEKDDRn4cvbSOwGKXtkfIV+IAY3VwuMq21fPPOvxz2T5i3iTsOxJNOXXEl
	fE6/WFb84TU32ADJcN210DeZAvXBdgMJyx5o8kxq+PQwAFfCbquB3qNy1L/XsdYU+7SL9ia4uZR
	dXcB0flGW3UxWZvacDDwVb/LTgsNS3jCnmJxzn+W6YqaQ1h4UhWgnFE2H5jvxtt2gWU5i0iHfh2
	UeY1EeIy6u6FZcaRWZo0TN5jvHylTdVuHyHIYCgo5cbDu9D//DLnGxtU
X-Received: by 2002:a05:6820:1607:b0:716:bbe7:1ca2 with SMTP id 006d021491bc7-71b39447221mr4247611eaf.26.1795233348393;
        Fri, 20 Nov 2026 19:55:48 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm2878076eaf.10.2026.11.20.19.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 19:55:47 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v7 04/12] media: tw9900: add saturation, hue and sharpness controls
Date: Fri, 20 Nov 2026 21:55:15 -0600
Message-ID: <20261121035523.26764-5-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121035523.26764-1-matthew.laux@gmail.com>
References: <20261121035523.26764-1-matthew.laux@gmail.com>
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

