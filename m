Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795002624;
	b=JCu5vKV8sXSmfmjFF/+Y5FjH4gj7XHu48tyOLLOqQeul3ULlKi4x0GMwg3W2a7ZdFspI
	 73GsE24ajS5OcTjJRHmV2iPN4OzrXJfq+fzvSD/j/kU7avf5uM56jPIRu21zF+paIkrLM
	 orpvn3M3WMFRGQ9bKBZ6rQ88QnWgH67ud3cnfdVV47/TbDUlk7su13VHzbWTlpd6QhPlZ
	 qEPgp5Za/ThudTifW/u26Py50ziNbF0e7u3M4Ep+edzuy677xTkx9fytwutyvvsZOXmNX
	 7UV2SIlm7F89VhELx/dzCUNMJyaBywUr4/d74nIocoz+cGNnenANjCcqJDM0pPo2VPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795002624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GwkWG/yGphkbRgx+ktD98fYpEDPc/cQysz/8UZPriO4=;
	b=WzU1BRlmZfAZqTCyFDRza6v2AAZSWH8gskNoFhRsNfxLabC8RXuVTaZP8cyl6pV1aFMq
	 VRs57E9Wdj8uHoSXzdizXRQ8pkgXYpFCb6WsNC6mgLd9JBRBvv8LuZAHdvJVBkzcRtivP
	 E/XrGK1ByRb7BAwcTvv9NmZxY6hJFxx1tYnzGdU7QyAwYZyy8KkaFCwHFHHSB4xre2pEC
	 vXJQYZk8GGG68vPz5wGxwH8MGKMJcLk++T37zVWYgR8lETkq3YUiWorxUKJXTcH5WFYUo
	 rY8ISxPDQMwnyhzxe/mClocdlq8lOLK93o89D9/ZYJUFudS7iXqbBxfdV4U3Yw3pq8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieVeJsAC;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A8606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1A8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieVeJsAC
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-18818daa3e7so1007521c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795002623; x=1795607423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GwkWG/yGphkbRgx+ktD98fYpEDPc/cQysz/8UZPriO4=;
        b=ieVeJsACuz7/5zKQz+TZssEWRPxC85HRgj5PQgMoS+5FaNkiXnt5IS92kv3qdI2/zh
         VOi/3DGKSVYmmvMC6zONVLDMBZ4tqJbinIIlBQ1eA/B1Df5gvJtEG1izy+Wy2iGTYSeE
         UOV3vLac0oYm3JYddG8aIQYFj2TgxWHvVGmv89C6dXj2At+3sWbyNLws1Ry+pTp1WtIs
         CVgYbbisdSKRPumFXQqWURnFR6Olqw/SjP5XiSHoEhdwfWLtS/MeIfYiL4fC/tr/966b
         wSFk+5n+Rh3VL154k9Ad0WkcWEx4U6CKMQ31WT99NpdwMwi30nyo/hjOMB8/3iuE95N6
         tQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795002623; x=1795607423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GwkWG/yGphkbRgx+ktD98fYpEDPc/cQysz/8UZPriO4=;
        b=Ha1oI+Z4u+31c7n7ZHOBaarOPbvQ4hYAT01W1HAHvjrKYRK4aAHub4jv7Q4Kq1caNJ
         nrsiq5ulS3Od0iF4JEYz+XjViB6W2ity1fCksLNzmfAl1kLZaNU0oVtmp6F/f0o+qAn9
         XRRRTEAFR+xJahtmDMGS8G8dMISdAx/3uizme6s5Q9t3MYAa7RzE3ABYVQfqZiS9Otaf
         YZCtmW1J299YiXeaneQ5Wl6mW0hKFKR6aaFMHeuJyUQZ/ryCsde8XEQaG/xdDQImpBrS
         fzvVe3f45VgCWLOzMyV7As3jlni6F/fUlqsyqxGS7oD+1M/HRrbGQjtldnC1j0qTjsoS
         UXaA==
X-Forwarded-Encrypted: i=1; AL+hErF+c1BMPyX6RRSwsZXLX1J/tZBRav8bR13om5sI4FJvw/GX7+iBeSGfkUW7LybZFozl5QrtQSmjNQ7rYLo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7KFuI8+b55Fj7nSDFvHbcs9kG//uNAv0Kd28sx8pHSOEdgSdd
	/GYn4Q4X2U3iqje8oXw1goevJXk7tfZOcwggddKthgNY+RrU68etbfp2
X-Gm-Gg: AYBFou3b79JDAD40oIa21i5ldXWD1MrhnlgjQkvnFXL7FdtYmNNP7yOMYHMZaxjRYyQ
	E2NeEU6DyxxbU/oNVJek1xEXGip8wQUaHsyS9tqg7qKobfPzB92SlgdX5muDIt84NMlZmMGLfoo
	72RDWs4ENJvZJjS1yatzWcQHaC/rlShHiwEtT7GHsOoAuukL22NMuzyQXviW6FYxtQvJIFXfI2S
	6L7gRt60/y5+d8LfVrvtXmK1AXK32NqjUAU21r7+wA0qo9gr+5MD8SiAffMgGwFH6/WW1BfuDTF
	8Aq3GTkDwvbhomVnAs+WF3c0Pibsjo9p13e48MRDj/eUPr45zKkoFrPIROKk6bNS/+UhUUs6a9x
	TdA0/+4arhXQtowY0OSw+jsZQB4+pZO7tww0iMSMgmIbyjgSl5eFDDi56zF1dIM4oW0MglwF/Rh
	up3fOsw1OI3JWFwI1pvtKnBDqfM6FPfXjd/QegLrsduGXr7DbaW+eIY92z/RQYFNUHUOB7LkeXu
	i2SXFroYotUdK28FQjVJrVtXpJxfqNKFNGtnFYmWzI93lfgP7yCb/g87LgArWoOrPYqnfaJ2/E7
	SzqqPpWoBI8BTeggsn8Wl4ceCJXblkTKjMPrBr5xmyliXKX6wcoVPhPujtw=
X-Received: by 2002:a05:701b:42cb:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b53a44bcc4mr4661767c88.12.1795002622612;
        Wed, 18 Nov 2026 03:50:22 -0800 (PST)
Received: from cachyos ([2804:214:64:aaf:eb0:6704:6a19:ed25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447811efsm6120431c88.3.2026.11.18.03.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:50:22 -0800 (PST)
From: Paulo Ravazzano <paulo.ravazzano@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Biren Pandya <birenpandya@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulo Ravazzano <paulo.ravazzano@gmail.com>
Subject: [PATCH v3 1/2] media: i2c: msp3400-driver: Guard media_entity_cleanup() calls
Date: Wed, 18 Nov 2026 08:48:34 -0300
Message-ID: <20261118114835.42431-1-paulo.ravazzano@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The entity member of struct v4l2_subdev is only defined when
CONFIG_MEDIA_CONTROLLER is enabled, so the unconditional
media_entity_cleanup(&sd->entity) calls added by commit 87d1307b6791
("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
break the build when CONFIG_MEDIA_CONTROLLER is disabled.

Guard the calls with #if defined(CONFIG_MEDIA_CONTROLLER).

An AI agent was used to find the bug. The correction was done manually.

Fixes: 87d1307b6791 ("media: i2c: msp3400-driver: Add missing media_entity_cleanup()")
Signed-off-by: Paulo Ravazzano <paulo.ravazzano@gmail.com>
---
 drivers/media/i2c/msp3400-driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/msp3400-driver.c b/drivers/media/i2c/msp3400-driver.c
index 8c2edd462..8f0b385fa 100644
--- a/drivers/media/i2c/msp3400-driver.c
+++ b/drivers/media/i2c/msp3400-driver.c
@@ -717,7 +717,9 @@ static int msp_probe(struct i2c_client *client)
 	if (state->rev1 == -1 || (state->rev1 == 0 && state->rev2 == 0)) {
 		dev_dbg_lvl(&client->dev, 1, msp_debug,
 				"not an msp3400 (cannot read chip version)\n");
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return -ENODEV;
 	}
 
@@ -813,7 +815,9 @@ static int msp_probe(struct i2c_client *client)
 		int err = hdl->error;
 
 		v4l2_ctrl_handler_free(hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 		media_entity_cleanup(&sd->entity);
+#endif
 		return err;
 	}
 
@@ -867,7 +871,9 @@ static void msp_remove(struct i2c_client *client)
 	msp_reset(client);
 
 	v4l2_ctrl_handler_free(&state->hdl);
+#if defined(CONFIG_MEDIA_CONTROLLER)
 	media_entity_cleanup(&state->sd.entity);
+#endif
 }
 
 /* ----------------------------------------------------------------------- */
-- 
2.56.1

