Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795029731;
	b=z45oby/rEPqg4/YLJVlrIfptCifP7AG8zo7Msyrd7lvS/195UJNit5E87oWQPCqZwrEc
	 7EGssp3l2etdIghY30K7ksmguOPlnawnrdtd0Gt5+hkaF31kUvU/butzyLQZER0wiM3ik
	 2zj81S1pY2eHDuWfXfq9ojr/faUi9C0NLcd550fO3BU7otU6Pedg+RtUZr7nrFLHJpyL9
	 uSZIWiH2RrN+lcwPxdw/TJYp5ARhu0iQCuZ64L0VXHMWutcrVlL9nGV+4DEe0agiFgcLD
	 GBmgeLBv8byhL+ruWsHnqsibge2Q4t/bC4zPNOoWBwhpbUievyXxKlIBrZubx1aDAVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795029731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
	b=FOQbWY57XPMxr2jSva0BGs+fzdO1pQFtpKUAuMsQ8RhFgjYxInGDbxNGK8xXhO9vsoac
	 QbLe4VM0bkKjkYBRvEEQ7Mw9ieyrq3ePXh/tSvxdf+fsfqcaEYo6UKl/bPF8aXBW/lqQP
	 OhiX4HtrciplqvpMu9uO2hr4fsmH7HDSZt6aaYJTB1PkMMP/gka+jwQ70RhS/wQu2O/7e
	 ybzd8vBFMHfH1zm3ATzXzXKhd25eE51aUnvV1v3cduJPnV4WwSnLYa7oZwpI5cWYB78jC
	 gz5WVw6H/aNpV40Hmy40qvqYzFqCtFjIR1syfuHAPk5HuetDWadoOVK2blxuimSpvhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaU5Txn8;
	arc=none smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45743606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 19:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45743606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AaU5Txn8
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-702fd86d674so966267eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795029730; x=1795634530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=AaU5Txn8U4YORy6HgRBLCwpbSGA4Us09yglJpqied3kQQ4jYr9IXcb0sXVXawU9xEQ
         dZSDEiioybh3Kd5lX2uLSp75uu7b63Q607h/3owJcw+7Safd+gdGCbWX0cPZj7RZwENO
         zzx5+1REpGErJsduW6Ind9iwlL7a2CKWLnrdQkCGbUTt8ele93T9dRHd+BufmwN/e3Os
         Zn7/HcG1hc6JFMKz+szqkSnErs7HsWNsDJphdUjw8Nz21ArLXkbTbEGsKJXW4u+zOFt0
         2Nz570t3zXs9uHK9eVIGRmUp3+pbpX4v5aL148oslmPBYuzM1Xp/pGZjWm3XAEZj4tbM
         QKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795029730; x=1795634530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=14SBEOmGTjg8LS7k3t1iUMs1kWnigFsCdcytzLwbka8=;
        b=aNRWtjbhQkvXesbKR4r5le4ISv1JNQesvAmWmMKYY06NkV9mv2JII7xVEEwGBjrJ5c
         jXjX6cQsluVSg0EhGrOE8PtuBRVx0gzI3lcqHrrdb/FRqRram1EGX2ilGPXuDad0f9kJ
         y4MLiL06uP+F8qehvqMSQ6qTsIbCf8jhKy6VHwV7rcc60+UZoUgTuS0d3COhHw0Yuo9W
         UFaBUZy9TrAvjydNGI2fhH+ec2jPqFSdvGKcQwMg7Fk28rN4JfzmHfzNDL4VcbJszH5Z
         IaTjelQrTIg4arCy4LdoqpN3gG8u37907j7pg4wslRoiEAXfEgYzIH2CSTcIbyEdvD7s
         WGnw==
X-Gm-Message-State: APuU4Z+Y4q5oxa3XoaoYSo99VR9XmDHX09e6kVYuQM+Fx9ZIySjo5WAL
	HILnoPsPTDpgjK/bx6KB/mU6grjpMaLcYrpFe8+Oky9nmeBKV2uMYWU=
X-Gm-Gg: AYBFou2m0L92/Q+wJ7TTENQNlumyU/O3+13/mv6iiDp00/1Bz4K/jw2AO2SRY2J3WU3
	/QlXcSjklIOheadLg8R2A6XBM336q5nkXCwWRNFHeY9mpP0AbO5iXLphpTMs1oU34ZF8YuoueTI
	B51rGG90L9Rgu+xuS3vJfuWlUn/3trz0qPwRAf73/lIXtjzA7A8S0mHDb+QYFqWqDdekOgAhl8+
	ZsN+Q0T3JeL3p5zs1nkYL7NQH+KDpF8VNOd5JmwA2Ltof7Sj0VE5NXfHgzFwwQ9EuJ2iJvu5pSh
	rxogy4wPuCh8ntk4+8AVSVPTSrdO49yNXdSZeSd0f46IPZyX/pMagQDsR71ys5GCCNoZUXFzZcX
	hFxB2+VQC/JeAHkNkr9MRPgU/MINWoVF3Jy0DrfhMbznOCS9OVdkxvrQ4g7WhLTC+Is+h2T4Ss0
	MZWf17nGdJk0PdsgfC0YiE0OCEXu/3x3KiMJOiM8hxUWItC8WLMvbp1Ae6Z0sOhHSoePH4lt2bq
	nWSV21jUdsLwR34YipanhD5lipslnevDibXGgachSxmSkwPpFjio5V2gLHAS41fV1Osk7kXG4F4
	wcPaGwv5l//yNikkFDcXkN6I23AhcS0sK+lno3ppyQhqTJoosg233jqy
X-Received: by 2002:a05:6820:480a:b0:6d8:57bf:57bf with SMTP id 006d021491bc7-71b1842e2b8mr2146386eaf.21.1795029730168;
        Wed, 18 Nov 2026 11:22:10 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm2376912eaf.14.2026.11.18.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:22:09 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v5 2/8] media: tw9900: accept the TW9910 chip ID
Date: Wed, 18 Nov 2026 13:21:18 -0600
Message-ID: <20261118192124.23330-3-matthew.laux@gmail.com>
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

Allow tw9900.c to accept the tw9910's chip ID and revision fields as
well as the tw9900's. The tw9910 is a superset of the tw9900 for the
functionality used by the tw9900 driver, and USB3HDCAP/XCAPTURE-1
capture devices can have either chip.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index e07924faa84b..60d5686716f7 100644
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

