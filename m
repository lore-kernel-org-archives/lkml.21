Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034602;
	b=gp2z75XXdnswwx8KTaLkb8an4P4LI3sxIgvrLXzd+yXh18hzE+3/4SQtEz+ucfzTp8OL
	 NYj1/6j4siBF1ki2CKWmGwk0G/zwxvc8jy2fWdlDLqrZrwHuEM3fIUXOpLCYkjAntedNT
	 Is6yt3fy9Ji/cyKjry6V4BKdDiwsy9DpPpFHD13pW8R1lXKd4t0x68GA8jvFClFiJ3loB
	 iI+28u+5ULWO6fXKjTOCvwJWDvxfbrojDaiWPOxzDTTpOSe6hzItk5vADSX+dSHktdddh
	 wyiVyoNsJUrEJOyJypqRa1ZEK7DUzeQHyqYtbESV+vbdcKrOCTY3cwR0B8YZq4nVB5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
	b=KScid1LKc2cP7Bwik3o2a5FE8n0nP8NxY1WMdPz+PQB1hIod5zWnn2dX5DPNg3WoxvZ+
	 3CQMVIsDwjzyKzPxYRVDv8m0Y1FvLrMdCci5PMKT1bxg1+tvzWgc2zxfwbrKr2KDlFuEW
	 k632Dnuz1nAE81VAFnzFRYmK+E6Vm7Hia4uBgrVXUUKq9q7TSJF0NlXc+bUH5gqZqyv8S
	 YKNmD9j/CED052xYEzMDH2i8tep31Ui2no/L65B3vnezsrCiT1HAGqH9qMeJrva95dO1M
	 xLQZTjubO8opH8zUFPzR5TCoEHZjnT1P2ySX/zW6472iZFSHr9Gr411GsxM8RDeBzfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozxoReIn;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510060A2639
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3510060A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ozxoReIn
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-862b98b2e47so574758a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034601; x=1795639401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
        b=ozxoReInFNh7gZNXFixXoh0udU0H+HijDPfm/dljsugv+C3xP6qIuG7DuaK36ENoCz
         cPR5mwYRYM2Xfn+HVTUdjSDXp7eRw+CEpSyuIB6YbL6vOqw1TL6Ydwr00n3tqwOCa0I/
         u9qfmPrTPMcAP0w5Sw6CGd6hp9QmCI4cQstUIRbnCernfK9zVvKEBOxSF5VesnFkKg6T
         +fFK1XEoyhtPsqZYLIFau2wJLSm2iumOBcTMpdMToGeGujuBfIiug/DFyvyYLZxePjlv
         gMkqtRFs505uCs562SP007hjudId3kZDMbgNzE3jIl56f5bcEXk+IlDL9u52DOCe4/GT
         0m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034601; x=1795639401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwmZr5W4nZSsOTe0w97y5anuT6JfQ9DYmBD/J9o88lc=;
        b=U8qThBEDmwZpgIrQMUq3qfO5xczj3941D/8X9u7Y8uSdrfmqobf/XcAOdkZR3RO8CE
         kJbCYjuoCU4bPQ+qGQDG9X02aZlRyUmYHEJW7w4XhuUl0KdKpSJccoQdydriwEizL4gC
         knYLlyOVobRyVMO0PkbfMby2pVUeLVgiXDIDmubLkaC2G1HoI+HTtHB0iDgBkfe00Y6j
         tdwexhK5kIEWpdyIfrVsfUHnjiv6yx7Jb0LjihtHtjhI+F8NQR1uDtHL0R5x36DCMQ0f
         OchRaoCpV/kv1JlGcmjWTfEN+d3F4tahE9cQRiNmHR3MA1IzEXFGRiS1WueEgujEduZ9
         /xLQ==
X-Gm-Message-State: APuU4Z+12gmx9jjtYXylQGQ9eR+RaVwaJv++F5kmnal/LFCAZEhu1EjY
	pwkf6qf8+8SPulgmnPZ/GmTJBbQv5eRww0FgO7072PXJsFVoSQvu8yo=
X-Gm-Gg: AYBFou2Wre7BR61l0PmSD4bVlO0hEiSReItfhsmmkythS/2Qc9V676GCurZGpzXqpNN
	GzCTld+xW1hN9MuVNOug3xLMoN6D2PIBqSc+b1wWkVymDuKNxJqQ7Ckilfz8b+HtZXKWuzAfRjp
	d0klsqW+iAyGXyMlMR0iG/NiXUbWUenZoQdYhpPXKebjHe6JVpThkp6160oqVmelwL1OM8dsLp2
	5C0G/iyl10YD0KKNMleHKZFB3ORigc9XFZWiieKy5pqh/5vh9OA8sBwD9HjKWB1MxYgqtvRhcrj
	RUtyA2PfNt7Aykl6PL1RmWXHE96CfQCwwxYNSnHugvUNXaq8SEX0d9yyC8YjvEC3LLzdp5Z8jAE
	iUaom2ieBzAQtjn/DcjGMk9hhANtbChd05zfzir8WmRXpbGgyxCNOeabNRpwEYrBZ7USjodl7LY
	6IFV968zdt5Pl6sE4ECRAAnWRHmGe4mgcfRI1bcSl7+AZXy5AzRP+LQOr2XI1gUQXaOvIlNl1Hl
	3tWXqcxMvuDEjjygoUozTBTNyS6ksLNwV84/4YhXQcuge5FH74FSu9s4AzPlUxTQzHqXJ5NB6Er
	I+7EVPjb8KlNKEoOhJpXcyNCLh8GHHLGH+49MRMCVPwa/XkrAhn+bCXO
X-Received: by 2002:a05:6830:2692:b0:862:f05c:2fd with SMTP id 46e09a7af769-862f084c214mr3796319a34.3.1795034601189;
        Wed, 18 Nov 2026 12:43:21 -0800 (PST)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01381f5sm2764792a34.3.2026.11.18.12.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:43:20 -0800 (PST)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Mehdi Djait <mehdi.djait@bootlin.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v6 4/8] media: tw9900: use runtime PM autosuspend and power down on suspend
Date: Wed, 18 Nov 2026 14:43:01 -0600
Message-ID: <20261118204305.28268-5-matthew.laux@gmail.com>
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

Add support for autosuspend to the tw9900 driver. This is so that initial
bursts of register writes for configuration don't suspend after every
write and cause the init to take a long time.

Signed-off-by: Matthew Laux <matthew.laux@gmail.com>
---
 drivers/media/i2c/tw9900.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/drivers/media/i2c/tw9900.c b/drivers/media/i2c/tw9900.c
index d365432e8f89..4d0d437d02f3 100644
--- a/drivers/media/i2c/tw9900.c
+++ b/drivers/media/i2c/tw9900.c
@@ -34,6 +34,9 @@
 #define TW9900_REG_CKHY_HSDLY			0x04
 #define TW9900_REG_OUT_CTRL_I			0x05
 #define TW9900_REG_ANALOG_CTL			0x06
+#define TW9900_REG_ANALOG_CTL_CLK_PDN		BIT(3)
+#define TW9900_REG_ANALOG_CTL_Y_PDN		BIT(2)
+#define TW9900_REG_ANALOG_CTL_C_PDN		BIT(1)
 #define TW9900_REG_CROP_HI			0x07
 #define TW9900_REG_VDELAY_LO			0x08
 #define TW9900_REG_VACTIVE_LO			0x09
@@ -48,6 +51,7 @@
 #define TW9900_REG_HUE				0x15
 #define TW9900_REG_VBI_CNTL			0x19
 #define TW9900_REG_ANAL_CTL_II			0x1A
+#define TW9900_REG_ANAL_CTL_II_PLL_PDN		BIT(6)
 #define TW9900_REG_OUT_CTRL_II			0x1B
 #define TW9900_REG_STD				0x1C
 #define TW9900_REG_STD_AUTO_PROGRESS		BIT(7)
@@ -64,6 +68,7 @@
 #define TW9900_STD_AUTO				7
 
 #define TW9900_VIDEO_POLL_TRIES			20
+#define TW9900_AUTOSUSPEND_DELAY_MS		1000
 
 struct regval {
 	u8 addr;
@@ -338,14 +343,14 @@ static int tw9900_s_stream(struct v4l2_subdev *sd, int on)
 
 		mutex_unlock(&tw9900->mutex);
 
-		pm_runtime_put(&client->dev);
+		pm_runtime_put_autosuspend(&client->dev);
 	}
 
 	return 0;
 
 err_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -522,7 +527,7 @@ static int tw9900_querystd(struct v4l2_subdev *sd, v4l2_std_id *std)
 
 out_unlock:
 	mutex_unlock(&tw9900->mutex);
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	return ret;
 }
@@ -558,7 +563,7 @@ static int tw9900_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	ret = tw9900_read_reg(tw9900->client, TW9900_REG_CHIP_STATUS);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -613,7 +618,7 @@ static int tw9900_check_id(struct tw9900 *tw9900,
 	ret = tw9900_read_reg(client, TW9900_REG_CHIP_ID);
 	mutex_unlock(&tw9900->mutex);
 
-	pm_runtime_put(&tw9900->client->dev);
+	pm_runtime_put_autosuspend(&tw9900->client->dev);
 
 	if (ret < 0)
 		return ret;
@@ -683,6 +688,13 @@ static int tw9900_runtime_suspend(struct device *dev)
 
 	mutex_lock(&tw9900->mutex);
 
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANALOG_CTL,
+			 TW9900_REG_ANALOG_CTL_CLK_PDN |
+			 TW9900_REG_ANALOG_CTL_Y_PDN |
+			 TW9900_REG_ANALOG_CTL_C_PDN);
+	tw9900_write_reg(tw9900->client, TW9900_REG_ANAL_CTL_II,
+			 TW9900_REG_ANAL_CTL_II_PLL_PDN);
+
 	if (tw9900->reset_gpio)
 		gpiod_set_value_cansleep(tw9900->reset_gpio, 1);
 
@@ -693,6 +705,15 @@ static int tw9900_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static void tw9900_pm_cleanup(struct device *dev)
+{
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		tw9900_runtime_suspend(dev);
+	pm_runtime_set_suspended(dev);
+}
+
 static int tw9900_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -757,6 +778,8 @@ static int tw9900_probe(struct i2c_client *client)
 		goto err_free_handler;
 
 	pm_runtime_set_suspended(dev);
+	pm_runtime_set_autosuspend_delay(dev, TW9900_AUTOSUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
 	ret = tw9900_check_id(tw9900, client);
@@ -772,7 +795,7 @@ static int tw9900_probe(struct i2c_client *client)
 	return 0;
 
 err_disable_pm:
-	pm_runtime_disable(dev);
+	tw9900_pm_cleanup(dev);
 	media_entity_cleanup(&tw9900->subdev.entity);
 err_free_handler:
 	v4l2_ctrl_handler_free(hdl);
@@ -791,7 +814,7 @@ static void tw9900_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 
-	pm_runtime_disable(&client->dev);
+	tw9900_pm_cleanup(&client->dev);
 
 	mutex_destroy(&tw9900->mutex);
 }
-- 
2.47.3

