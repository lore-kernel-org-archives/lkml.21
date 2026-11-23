Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448376;
	b=NIuBFNXB/NWQRaYXUZ6ISYPocLqGE/qn2EQjKDjf9kLNyh+vupHmlkD8sMj5G1CDGE1G
	 gpLoX4yZUpE8E+PPszGt3MuhAMUTb5crMC1Pn0BD/EtRzTClAZOsIpW06QtSUWCt4Ooqs
	 Df0j3mbnek5u6Vh4JXzMsJz5i2HOis7daU38IN+/kr8v64rwLIutEE4MD0xqoOMKbwxrt
	 eXGBhW8VBGr0I1siTP/AAFimU8NlU+cGddrfoIe0sjqfa5ASiJbqFWEtQl3CLBVZbtH3q
	 5d3lI14NNUSYR+GuOmuteQpXfUdUqVBH02ak9Za+X7OtSJx1Dg2ONyh1XoDxZmhjPNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IhdhU6+7BTUS2GU9Nmck9NDFgPsqX0oOv0Uogov0xZc=;
	b=Ob3ZIfnAvhWeCqKE3cCXRaZzI1f6GNKm2uTAo7R5x7Lq2+VzLchsNufehiZ9tdrJNiFQ
	 sI4lAciN2w6PXcXEO6+2aqTIL+CJNtyg7AtZcLJhtZpuRhqvtKEOrqp6ztpbTShlX/1AS
	 mFfypUHqD/D8fJ8MrlJV4btGThW8gSt0L2lGbQhskPaFE0tFDwvl2y7pTEun4eRXb8CxI
	 T7UZF0DUPCl1T+KpgqHimJ5UkNeyYuuumWAnGJr22emYTq9UBTtJEeltB0RN+Beccssw6
	 4eBi5gpa/o6rwai9aG7kQb1CGKlzThY4NlBmJaXNnTv11BGtRvmgwCBqjmGnlD7oCnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6ZTSrvv;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E1606A330
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291E1606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6ZTSrvv
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso4320651c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448375; x=1796053175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhdhU6+7BTUS2GU9Nmck9NDFgPsqX0oOv0Uogov0xZc=;
        b=P6ZTSrvvO7CPSUqS1BJ7ZHxx0nt+12vB42qUJQbjBQzW+mJZy3a9cHTMRsN279KrFZ
         cOXDt72wEfXtFrPLvVdr6rLQFI09oTTKYLtKezRMbJI6G08EgRQFb7HiimMlyd+Yaok6
         HmvH4YODwcoCo5/SnVam+sAcoBOt1OXlkQAO1lKKXFBxT4uyWNOdNIe5g8hYbRXwAbh1
         zRQkwo8dY7+uC/1mMqSzjy4zpt34WaNOSzi/CngKshIsPE3kwWTGkgb3AF+T4P67VGKZ
         RHtF94mKPinuvgzKKjWzFZPZg7xVx6g2qErvPZAqx+EKkJIKs2hbBxijHnS39keLwv15
         obuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448375; x=1796053175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhdhU6+7BTUS2GU9Nmck9NDFgPsqX0oOv0Uogov0xZc=;
        b=qvYr1Kf7vWV/9eM24bnd0YQ9ktnCUjZb9rWhM9Gy3mtXVO6lvdwlN8dKRLKpzwpRU0
         VimRinbuJVbY/A4TzxUHZoeo6tn0Zd/QT8EMi55x3AEn8oFnw9WK9yl/FX63tbBR3Tdo
         UQ2ppOWp5pQNJ1JzXBdw9VuB0L92DwhSFl7oXmdn71jUDKUrUtxTi9zhRk4HVL9yoSAd
         i78Jql7mghYpQcDJtlK/WIUHpFliZtGNIUxCg/wCoitKz8rAAOM+tW4ybfs/Jk84jZSS
         rCa5ww8vjqRF2NynjVPHqVNSQW+a/tQELB46QbJsz88mwta+jfOBFK41gHKeHCDyqG/D
         tdDg==
X-Forwarded-Encrypted: i=1; AL+hErFvvJ7shSnbUDghLICNRTGSarzRyGOmiRYPnt5ysl2uloCMpWR4mGiYt9CpEpKpbHWis2obr3kOOcWDOv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jhkJvR1Q6+eXDntUoRkw/AfdZVkd2EwK/UXAN357e4QZa/LeD
	hqG9EMHTQvBbYP3FnDBNGoG0dzI1oKk/BGTV6I3gMK9S8822FGxFSZLZ
X-Gm-Gg: AZFdTZcnlMJaZcQiTGAALkBLSiDGqgx+k/m2KJ/jFSLNnvQ9L4hJoRLRQcb6KAjq00H
	/lzcHqmqSsh7vLzZ8fdPbgxWZ/YtIJ80XymadItT8gByCdKXRcfyobnbXsADjRcZg6K+8tm1o5M
	AHoOfUR2sBVTuyY4Vuluo/TU34k9Bq4B0Q59aYnpHFD6u42b9s1WcnSvDLYCYlYYHIDZM2YA5ty
	l+SWpy4kXcttWPNQ4p7WmWMtE0l1ruyCgE+3uDLCcUGxKbziYQAS1iZdBDZRP+MAghK4Q1vkBug
	ZUv7VH5/QSEyzN+pcwMfIjGrJI+pyX5RG2EvLvZ5BJQXCHKmgbdmw1uoi0bz/Gxyr1Lc0v3Dzl3
	wBB+lJMvr5+GZMzZc0OByfTDDEKr8R5Ri6Gaj38z2CNCFdxM/rfjDNNWUoqL16JTcTq4vI/VcuR
	C8kF4rqIcQ6FpZMBq74iIrUeUui08JxtaamXQPofHiZnvFCvaak4Iy+/DKio3h3jsNAfxKsDDE4
	YUH0oFN3KWLW28nMBIqOeExfeGJ0bDSsyIC8MjzaqPiE/yLEpra0BUgebbkdjoZhxD+38RGJU/D
	F+n+7ZCTCIvQfuYK3r7xQOhqoKUTnUtbUFx5UGA2gmya46Y=
X-Received: by 2002:a05:701b:4354:b0:1b2:6cba:7f7c with SMTP id a92af1059eb24-1b5568fdafemr11372210c88.37.1795448375240;
        Mon, 23 Nov 2026 07:39:35 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:39:34 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] media: i2c: hi556: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:12 +0700
Message-Id: <20261123153927.2547169-2-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123153927.2547169-1-congnt264@gmail.com>
References: <20261123153927.2547169-1-congnt264@gmail.com>
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

Move hi556_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: hi556: power off the sensor on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/hi556.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 3b725bc59057..a151bab26821 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -1266,18 +1266,6 @@ static int hi556_check_hwcfg(struct device *dev)
 	return ret;
 }
 
-static void hi556_remove(struct i2c_client *client)
-{
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
-	struct hi556 *hi556 = to_hi556(sd);
-
-	v4l2_async_unregister_subdev(sd);
-	media_entity_cleanup(&sd->entity);
-	v4l2_ctrl_handler_free(sd->ctrl_handler);
-	pm_runtime_disable(hi556->dev);
-	mutex_destroy(&hi556->mutex);
-}
-
 static int hi556_suspend(struct device *dev)
 {
 	struct v4l2_subdev *sd = dev_get_drvdata(dev);
@@ -1427,6 +1415,18 @@ static int hi556_probe(struct i2c_client *client)
 	return ret;
 }
 
+static void hi556_remove(struct i2c_client *client)
+{
+	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct hi556 *hi556 = to_hi556(sd);
+
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_ctrl_handler_free(sd->ctrl_handler);
+	pm_runtime_disable(hi556->dev);
+	mutex_destroy(&hi556->mutex);
+}
+
 static DEFINE_RUNTIME_DEV_PM_OPS(hi556_pm_ops, hi556_suspend, hi556_resume,
 				 NULL);
 
-- 
2.25.1

