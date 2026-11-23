Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448410;
	b=ONqCeVhyihQWJOZdEYQmGJg5zGhuDn7B2fqb4RmVCXqNSwx7NCPcR6iyPkdQDy65wmNP
	 RQD/siReD/aKybC47wyAzqO1zH7tTSFm8NOL4JUl5lMyOMFjSwGG45/qDuWMGuwfLNRiZ
	 7YjLcjB8M/ZtwBZkzy+561xaRw7ZeXCSLMwVBbBXnoVoZq+JNlwoBlrMp/ULFwFCZXzcD
	 XwDSZQzmBetzVQeCZcdfFWpL3NjZkLU18aWAFhx0htR3WTFhuL47dtokagkcDh+C1TyxN
	 3oRvgHJrgDtpi7xdavd7n+R+uEG0oxPY0y1+Un2K8sMau6nwIXEBgpfrJpaSNLHn6lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448410;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mAatwWMGIQD8sSjbJ0d+bFjPR7YE2b8DjJZg25l4fP0=;
	b=culK3P8mxZv0npmv8FtQVr4Nz/f9iarxl/h1u6rBRH9x60dqR7HX3mwQ8MnCr1DUg4WQ
	 NG1jcUBBqRSa00NheOsQNAFkKT2LcZ2Wfx4hj+TxjiVMA426G8UD7FO+efWqywp8yGEiV
	 lTaTgG2QuQrH5Nu388LOfBLkgLWAWSBv8tfX2DSGxDbc+LbXvk8Fh5hL6IhwIQtByi26B
	 zgX9nTD6NKVS9XjjzoZZUDrCTuDOfZrjq3uGIjeZG9Sz62Hxv2zjHS9PReZK9+C397LKX
	 5V2QTBVQdixKToQ3R8CzqO7blvpqTUp+CsfRRDID/ZmPVaCfIz8kfAHFValvGRusxsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXjLzPTM;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD52A60A382A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD52A60A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vXjLzPTM
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3ada81853so3900782c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448409; x=1796053209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mAatwWMGIQD8sSjbJ0d+bFjPR7YE2b8DjJZg25l4fP0=;
        b=vXjLzPTMO6S0nyXMvFcJhaevneyow9/u+al1JNDbgukfsaI96vj3mlZm4iAWYnsbX7
         /T0cYO/zGRL/02ZkBaMoU4U9MJSl+TH1dN/BMtOSYfGyy+m4qGmm/YqBfC6HvXhCttVh
         qWIj95d7DSWXz9DyTupEF4SVGZ8+RphJZVGbED8OB8wiClqSgT+BMjUkfE+jnoZv1KYF
         cKchXYdqa70tSPmIfohI8CycGdpdk0E5GOm0fknaOVWYxbTOemcHk1RK1sOxpbgQazmS
         8oLbcMualvjErfgiGlkWsBSZlVkp57yDs+xj25jy7lLftKl9if2gAb/m7Kqw8KWu4aAC
         8X8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448409; x=1796053209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mAatwWMGIQD8sSjbJ0d+bFjPR7YE2b8DjJZg25l4fP0=;
        b=dsYQ4WBMn7ThTXOZQ5oSGkeW6MGvSzVaDAVZREdnKTRtHjIVwfsgbUzukfckmtUrR8
         uBhJ0CJfASBmS6GFLlp40tc671bj0XbayTLdpoebWDED2Pkx3cf3O3tcG8XFtETWPGh/
         JZJSOBubImO6QIf8zL2lI50xe7ZZDyJ4R2CPwtBhnsZQZ/mFdcMjLnbUrbIV3LKFcjaH
         zeRXiI2+3X/0JFdyH/6PzkngC5MlR6ez9liWL842HKFt5qTw+mXN2v10KwVckfjIu4a9
         MvTuHhRnNkkdvMIkZGdA0QK+zAasq88xL82LFmpxYmVWr58c7p5mQwuDFCKOqosV4SUs
         0p6g==
X-Forwarded-Encrypted: i=1; AL+hErHv2BQVNSc8xgMNWJ8T3b3+RkpU/rOPC/VSPFWGCmU7VlhGK0bsA7YTyZ22oYCZwszhVuZdNlLNm2I+0NM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+E1gL+MUNJr9q+UWjvsplqOh3msKdQ1cd6+AMGPYMEVLoml2pF
	r7Je3l9Y/vrc0Lw3pmuAIzErSvyZtL1N8UBGm8F0OIsn82R01wqihH5+
X-Gm-Gg: AZFdTZdOOSWOBhl7d2ro8u0kcJAnRw6lxsXbVOSwdovI70mTbOHwkMkqBKfem+jfNaA
	GoigbTPZ8zfe/pzN702oMI08kbu3joZOqxU0paG9E+C/0wfw9jta4svI09skKa/anQMJrQZ/MMQ
	mB0pWsS3IongujGZS3HNXiwAR6kObcj/8RsYv4138o8hH28Wf+xDq/s4eMt9mwmCA+ErA4m6vCI
	mMWEhkONJAyUtkqUtQeS9SKGZpGpSnogk0VA+F32QL0ucSm7CfpCJMp0xSC3FID27uihAHhY8aw
	a0Grww5SP9aaRI2zZSIrtIneg2FJISYsacCfi17Bohju7I2+Jep3N2Unjuz2zrv6Lzt6uTJ1j51
	4/HYkcXnboGLIJtJcyszYKBZx8beAvWan2y6rnHEzp/d4RVgFqGMydpvAwSn+vq5AplMnWCeAWs
	GjDl67lVunouGTZGcLEFgGPeTjEdfOp7f7WOBr9gFBP32iU2uhc1xL4f+acsRqxdl0D71Zpn+fO
	80yUT0b9yMNd/olDmfGdOz3vyiD1FdCiGHewM9z05lO5Gc8b0pBnvm8K/ZGKQQdXo8lQUlgWRFZ
	aF7p9ELQCHMbSsU40OhSd3qwL6N6RXN9sgEIU8Xg0KR1UzqJ
X-Received: by 2002:a05:7022:3a8b:b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b5568d6db3mr14898522c88.31.1795448408705;
        Mon, 23 Nov 2026 07:40:08 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33680067c88.7.2026.11.23.07.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:40:08 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/16] media: i2c: isl7998x: move remove() after the PM callbacks
Date: Mon, 23 Nov 2026 22:39:24 +0700
Message-Id: <20261123153927.2547169-14-congnt264@gmail.com>
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

Move isl7998x_remove() below the runtime PM callbacks so that the following
patch ("media: i2c: isl7998x: power down the decoder on remove") can call
them from it without a forward declaration.

No functional change.

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/media/i2c/isl7998x.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/isl7998x.c b/drivers/media/i2c/isl7998x.c
index e36fb355133e..42387bd310fb 100644
--- a/drivers/media/i2c/isl7998x.c
+++ b/drivers/media/i2c/isl7998x.c
@@ -1544,16 +1544,6 @@ static int isl7998x_probe(struct i2c_client *client)
 	return ret;
 }
 
-static void isl7998x_remove(struct i2c_client *client)
-{
-	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
-
-	pm_runtime_disable(&client->dev);
-	v4l2_async_unregister_subdev(&isl7998x->subdev);
-	isl7998x_remove_controls(isl7998x);
-	media_entity_cleanup(&isl7998x->subdev.entity);
-}
-
 static const struct of_device_id isl7998x_of_match[] = {
 	{ .compatible = "isil,isl79987", },
 	{ /* sentinel */ },
@@ -1602,6 +1592,16 @@ static int __maybe_unused isl7998x_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static void isl7998x_remove(struct i2c_client *client)
+{
+	struct isl7998x *isl7998x = i2c_to_isl7998x(client);
+
+	pm_runtime_disable(&client->dev);
+	v4l2_async_unregister_subdev(&isl7998x->subdev);
+	isl7998x_remove_controls(isl7998x);
+	media_entity_cleanup(&isl7998x->subdev.entity);
+}
+
 static const struct dev_pm_ops isl7998x_pm_ops = {
 	SET_RUNTIME_PM_OPS(isl7998x_runtime_suspend,
 			   isl7998x_runtime_resume,
-- 
2.25.1

