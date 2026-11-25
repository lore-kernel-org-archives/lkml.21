Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636254;
	b=10rv7M5zQidkT5bLR3LFXCSguJKDRH2PcHWt4iHBenU1t9GW5RYXjk2/2ZPx2WPymUqZ
	 IKPKNX0tL4CAHL5sIL9GQoBIRXO6bEns4WYcOqeXMzj1BXJm/DkaIj1aHnrWjL1FqibiY
	 Ca2/nc1K9la+Q5bsLu0eZp6e1yocF/UJ3/9qBFdUeTJAkosUCVK01tBn+fudiEFNX9WKS
	 PoGYSM00jK1BAV8iR9xcU6Q0UU+iJXY7bzMVIqQRWXOge35QQQFpH/1/FnRWK0AHud640
	 +/HkiJUoAnq2MThnt7sw99nR/c64x3TeMRIrMnpf/Q8awSCigcG5Uv/5qnwNhQZhOnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
	b=g1nLVmDqogJhjaQSd13r6e6btLBnGJHhf9H2+m5FeqNrO5Ra0iF3OMWQSVMsUPZI65Rx
	 C467itmkbOwQNuQEOEaz8z1Oh/z0id2LwEMpXTzsR8zty71iEMyiXe4h+bAXoNiHRlRen
	 fdmr6acFEH1dmoUGEbrX+hfoVhj0tmtTE7q4QA9Ac/jiUrfWNXy3FJm21U4vzRkkZZFt4
	 ZHFxVFk98EQ9WoSvNmKRt0RU88uKzjiAqs/KssEkRY0th87GF/mheuXGtwoiIlWpoF9Wd
	 jcDa8VaaEAl9lL54ZH1d32IVWOz3dumnVhK41bmmElj12+mmiy7xRjWX8G53fPuynRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDtYqbC8;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A9A606A337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 19:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A9A606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kDtYqbC8
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-571888655f1so2111095b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795636252; x=1796241052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=kDtYqbC8wUOKZswZvJNXof2OkFcXoXWCKVUU7lXS9T4ZCABijNSO2KXRbtTYlutbPs
         /TyVCD72oNO7kyzxrOT8uHctF4VsX1XnRWqeNiUzTEyccKmxkopc0D/fK9j2Fgva98Tq
         Jecr2FCnbicPpHrgXEQka6gS5etD6qqgjm47nGgYfrBwosoGtbJlXIHe5cjISnkX2V1g
         HdMB2GQ++wRuy+zQQK3WY5RxSEX/xlKFv9kds773hpI+WzlvwZ4FANkJmPr3bVy8gXVn
         sBtCUWuWYuOyV5hfjIR8DdrbbNyqG5JGi6dBieiAHcFz3HQXqFqtisdcWS3AhAPPyuvC
         3SnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636252; x=1796241052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tltDCiy5cuzdulawCOgmvyY3l0pK0A9bj1d/Pm/aQJI=;
        b=Khp1YSmhRNUcEnNuAwvDH3fnY1KuwjEe6o5+tngSuPFM9kv/wn7lGsRawnlMfFrrHF
         6e1NcJTuutl6Uwnw8pUtTRVV9xg1lESHcc2Z0SixLAhVWWpcoP8TzTB+VJNalqPnktG/
         POMBLmpVmoIiChJAJb6X2mtZ+4rcmmUiAfd+39jjy31YlxGfHYs1BXUwulNhrHKh4r2b
         RQjETz6dyZPWXrHhXQVjdisfYijuw3Kn807G9t0XLNCEm2c+nwsDA559FVmqAf+n6dYh
         oHBQfApvYdnhT7Net6waxf9LthcdPpKmNhFTVOxu4UEVhTiNj5HdWGV3HMFVQTZNJxt5
         TXuA==
X-Gm-Message-State: APuU4Z8sLpcyF3PX7/HzG2qe9ZUrBT2sJn5/kI/kFNx4qdoLIUYpfkP6
	WAU1wIDGhxSdrA4jPWeB4NdDS3z9qTbjAG29//7TCIlQL7IAx64FEsg=
X-Gm-Gg: AZFdTZcIYLrPFGgk74epqMZ7P77Gjtl91f2C+98A2a0mpiH+/j9MDvct6vLfNVr3HuF
	QNBZKPXhcN7WbzXsHpcKGthEutXqUeU6QjU8dlfY18SNtAbmmpDtcbJE2DqTEdNXooW5TW01krv
	vVlFFrQco50epJAScZaCL3TbV9LYhjemJDMpj90tstzrUs3HV06i3SY5Tx9sDZgLVNAf4puR4o8
	9cidCCMi1gLt66hp8Jj7665LSszMdf0/39eW4znVUdsdt8FPOEJFHEGOVIOFG1zpy0WjJdYc3/V
	//UEyuWMZntPmTf4dmduKPo2HhqtcRyzna4/kQlPJUICqaMEiAv82QzpJ0Ukn60g0WYFpyrsOHG
	HV1tXJZ1v4idJlf1Pdm9p568QTmJ1lAHt/YLWc8cReT5OeOTjZ+HBn7KP2gvZSfyNwIQrxb9UeO
	znv2Zyidy0fGDjfjno1x+Ovnwk2/FiMNyIWGj0SoRnhGn3J7wzseBI4zRBlfOP5vnQv2oLhAq9G
	X3Uq9meUePYXhu+JlhuG/1pC0CMiE4cByy2vT+HksMN7guH2dHV7v9t/koRnJ7C7diXsWZQ97J6
	u89CdA41oDNUS752vAWIpvW7xueWSMoyuG4C/oV08tAZ4564Y0jThmpt
X-Received: by 2002:a05:6808:4fe3:b0:4b9:e6ab:d07a with SMTP id 5614622812f47-57a0a503358mr19175915b6e.26.1795636252312;
        Wed, 25 Nov 2026 11:50:52 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm13783728b6e.9.2026.11.25.11.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:50:51 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v8 03/12] media: tw9900: accept the TW9910 chip ID
Date: Wed, 25 Nov 2026 13:49:42 -0600
Message-ID: <20261125194951.19072-4-matthew.laux@gmail.com>
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

Allow tw9900.c to accept the tw9910's chip ID and revision fields as
well as the tw9900's. The tw9910 is a superset of the tw9900 for the
functionality used by the tw9900 driver, and USB3HDCAP/XCAPTURE-1
capture devices can have either chip.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e9d384039b50..df8c7b1f3450 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -23,6 +23,8 @@
 #include <media/v4l2-subdev.h>
 
 #define TW9900_REG_CHIP_ID			0x00
+#define TW9900_REG_CHIP_ID_ID_MASK		GENMASK(7, 3)
+#define TW9900_REG_CHIP_ID_REV_MASK		GENMASK(2, 0)
 #define TW9900_REG_CHIP_STATUS			0x01
 #define TW9900_REG_CHIP_STATUS_VDLOSS		BIT(7)
 #define TW9900_REG_CHIP_STATUS_HLOCK		BIT(6)
@@ -51,6 +53,7 @@
 #define TW9900_REG_VVBI				0x55
 
 #define TW9900_CHIP_ID				0x00
+#define TW9910_CHIP_ID				0x0B
 #define TW9900_STD_NTSC_M			0
 #define TW9900_STD_PAL_BDGHI			1
 #define TW9900_STD_AUTO				7
@@ -574,6 +577,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 			   struct i2c_client *client)
 {
 	struct device *dev = &tw9900->client->dev;
+	u8 id, rev;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(&tw9900->client->dev);
@@ -581,7 +585,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 		return ret;
 
 	mutex_lock(&tw9900->mutex);
-	ret = tw9900_read_reg(client, TW9900_CHIP_ID);
+	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
 	pm_runtime_put(&tw9900->client->dev);
@@ -589,11 +593,17 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	if (ret < 0)
 		return ret;
 
-	if (ret != TW9900_CHIP_ID) {
-		dev_err(dev, "Unexpected decoder id %#x\n", ret);
+	id = FIELD_GET(TW9900_REG_CHIP_ID_ID_MASK, ret);
+	rev = FIELD_GET(TW9900_REG_CHIP_ID_REV_MASK, ret);
+
+	if (id != TW9900_CHIP_ID && id != TW9910_CHIP_ID) {
+		dev_err(dev, "Unexpected decoder id %#x (rev %u)\n", id, rev);
 		return -ENODEV;
 	}
 
+	dev_dbg(dev, "Found %s revision %u\n",
+		id == TW9910_CHIP_ID ? "TW9910" : "TW9900", rev);
+
 	return 0;
 }
 
-- 
2.47.3

