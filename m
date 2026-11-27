Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802304;
	b=Qf7hHWjOBM545Icozb6iMBf8uxnNAfqo+EMir4r99hA3CAU7fTYu4MowLFTZenQQijzR
	 DlDEDAk6ND7Jh/gaWk87bpnCPRynxt64jS6Y8IW3JqV/BUyFkvBzrGKdMsP3o3VkhDkI7
	 bAGpFEl+hokNWiJnCXAWJt3XahZ2iqws8rQdZyuvq+yoTjA7JIoIIxAGGUaNy7JC+Jixx
	 htq0PJ05IFLBZyDotGWcIA6ouSOVvRL9FZTbm77cAz9AzFowisLqHv5+/VHlcP11Sh8oj
	 HcUEesfEylJn7CzcY3Ywqt8RU73y/ib2L645Q13cm7bAS51y51S7Qs6WSuOr42wAD2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802304;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Dy2VYDzoRkKbm1vz4UiXP+HztkvxReubMR95SmgAJ5A=;
	b=DfjFvxAoSKaum2DqObeYpMjZRSw8mYEmhWXZj2+qPsLvrCcR9/ryCKUJ2m7+kMCHkm4+
	 GIPmBMiM2G8SPVN1f2F8gI3plPuM2S4HeIw5PbtZqhwyjBE7N9zlfZA4FfLAv9XiZVMFI
	 3R/FIdaMTjZR9Qqjcmpu6XO/fcN/EcQLb6yP4msAPifEPFRKf6leg+gNuMZeR8RjSnyUv
	 WdivUwlQMcAIsRywgDtIC8JqvVtVK2EVX+YJHKpFJ6ljzCHQUTSTocCTYWFyuzEvYlo3F
	 BcAU0C81dvgMDXSl46P6HVdkxtJsoHv/WpThcx/Me80bJQ2YD/f4zrWxLvt8oYOMrRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jCzBGcnE;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910CE606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 910CE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=jCzBGcnE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A53F1A183F;
	Fri, 27 Nov 2026 17:58:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 304086049C;
	Fri, 27 Nov 2026 17:58:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC917104395A2;
	Fri, 27 Nov 2026 18:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795802297; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Dy2VYDzoRkKbm1vz4UiXP+HztkvxReubMR95SmgAJ5A=;
	b=jCzBGcnEq3kbhzj5dM0FV7QBclO+XwLQPAXbRBqzEDtmyRNGDioWW3+FRinC13MB5csAa2
	sI/4MoJjW8rA97wu4lh7stvWDC0p29NvGmXh1C8NH6BoxP/MK1oef1fg0P11TKwuWFDzzF
	LPXftZxuE4LyIT6TYi5trbtlsBIrSfFEwIaHqNdrq8JWXwzc0fFhZWPDNoa5ptIWw3uT7m
	uyaFrLce7jQm3NhklM0nry5VF3Ojb/fK90EeNIDXn1O91JLyhLFAK4MiofMmyxn4Gqe3hU
	B+j37at23JWNLkKYZSuOkwMUJVkI2rQs68HJimJWLLjJVViY8pX/FCAVv2fCZA==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 27 Nov 2026 18:57:46 +0100
Subject: [PATCH v7 02/11] i2c: cgbc: Propagate hardware errors when polling
 read status
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-cgbc-i2c-storage-devices-support-v7-2-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

From: Lee Jones <lee@kernel.org>

In cgbc_i2c_xfer_msg(), read_poll_timeout() uses the same ret variable
to store the polled return value of cgbc_i2c_get_status() and the
timeout result of the macro itself.  When cgbc_i2c_get_status() returns
a negative error code (such as -EIO on an I2C NACK), the loop condition
ret != CGBC_I2C_STAT_BUSY evaluates to true and read_poll_timeout()
overwrites ret with 0.  The driver then issues CGBC_I2C_CMD_DATA, which
completes with CGBC_STATUS_CMD_READY without populating msg->buf,
leaving uninitialised heap memory in the caller's read buffer.

Store the polled status in a separate variable, verify that it equals
CGBC_I2C_STAT_DAT, and check that CGBC_I2C_CMD_DATA returns the expected
number of bytes.

Fixes: 6894f640b8f3 ("i2c: Congatec Board Controller i2c bus driver")
Closes: https://sashiko.dev/#/bug/linux-66cbf4b1-a219-4012-969d-236417bf419a
Cc: stable@vger.kernel.org
Reviewed-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
Tested-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
Signed-off-by: Lee Jones <lee@kernel.org>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-cgbc.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index 164be9b99eb3..dfdb9ffc6447 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -205,9 +205,9 @@ static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
 	struct cgbc_device_data *cgbc = i2c->cgbc;
 	struct i2c_msg *msg = i2c->msg;
 	u8 cmd[CGBC_I2C_CMD_SIZE];
-	int ret, max_len, len, i;
+	int ret, status, max_len, len, i;
 	unsigned int cmd_len;
-	u8 cmd_data;
+	u8 cmd_data, data_len;
 
 	struct cgbc_i2c_transfer xfer = {
 		.bus_id = algo_data->bus_id,
@@ -266,17 +266,32 @@ static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
 		if (ret)
 			goto err;
 
-		ret = read_poll_timeout(cgbc_i2c_get_status, ret,
-					ret != CGBC_I2C_STAT_BUSY, 0,
+		ret = read_poll_timeout(cgbc_i2c_get_status, status,
+					status != CGBC_I2C_STAT_BUSY, 0,
 					2 * algo_data->read_maxtime_us, false, adap);
-		if (ret < 0)
+		if (ret)
+			goto err;
+
+		if (status < 0) {
+			ret = status;
 			goto err;
+		}
+
+		if (status != CGBC_I2C_STAT_DAT) {
+			ret = -EIO;
+			goto err;
+		}
 
 		cmd_data = CGBC_I2C_CMD_DATA | algo_data->bus_id;
 		ret = cgbc_command(cgbc, &cmd_data, sizeof(cmd_data),
-				   msg->buf + i2c->pos, len, NULL);
+				   msg->buf + i2c->pos, len, &data_len);
 		if (ret)
 			goto err;
+
+		if (data_len != len) {
+			ret = -EIO;
+			goto err;
+		}
 	}
 
 	if (len == (msg->len - i2c->pos)) {

-- 
2.53.0

