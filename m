Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108221;
	b=ZsqVzEFcQszTpA0/vQSU1vpJzIOQxBKrhxQ2rzJHa86R4UB4VJr1Dlb2CCHsq7Cc4OP9
	 DQAE/vaVuzH8IPc1ZTzIf6sHLvSRicrpDskiD8fe7+oQWFE7h5s4tWIdYRP1AZTiRNDer
	 fJFqwtNDhpOGppO/VULpp9rdU1FIQNcUmjJT35+TJTSauWt8sDTj7Nx4iEn+yukj81qqx
	 ITAqVKsIwn5hQD5rrWvc1yxozu6j0E2hynhAPH98WAwdXXY24DNhk7tQLuyPBO2ZI8Zu3
	 J8fkOZ+mD/lHxPFN7cRJqP6DiA9nkY8sEOyvc+mbLgVs82gaxHqyUN2aF4AnPz685rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=CPrQ6ArSaDDsNNhcUrdH0wiM+gM05NGU68MU/yNuooM=;
	b=FAmMuJHkUNiqvebI+QsaJBBfW3j9YlXVNo1ymKsV+NShwfy/x8t6x3CwKzN/nPIZB2qO
	 T5Tk0D89qg0mvA2A4bW1CZjqmg95sUTGnosnTEqMCEFpG2D5VL4l5zL0uzrF38FW5TtgH
	 J0GXp/o8dqVWSqMtWFyDs5A3gNOw9oDpmgjSXJaRC9CzLmuAIiQq9M45AIZl4rOoxVV8q
	 fCZXhjA0JRpEHhmm3qQ4Y44xkBZgr2/wUQil2DPgsCSqbfzTrBPGcnZC7bU03NLltC4+t
	 MHeko6UrcSlrbtI8p4nFWyJcvsJF0M9vG/APg2DIQl7cYe3fQYa0YKp2QYjffs+UYFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="H1C/G/wI";
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A79606CA89
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A79606CA89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H1C/G/wI
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-86287b38a31so2722022a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108219; x=1795713019; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CPrQ6ArSaDDsNNhcUrdH0wiM+gM05NGU68MU/yNuooM=;
        b=H1C/G/wIDDlo3EkTXP5cvX9reonLsk42luo4KYk44N8QM6xnkbvqAG1b/qniqLFByV
         2PBsl0w052OP/Y6j2HGFYkx4YQixC1PGTpc1G7HDn0eNxnaf/7SKRyRVKLVNmoDHVlhn
         T3zw5+oDbzy0aGnwQBUFRI6YZZsPuGllvo6+W/lxLtkwqBy4ByB81GX0M0d+5wO3pu8I
         Z20VsXdxwJ8YRM1briPU/o405Uj9chSEQrSJUlHJO8iq6ZcAQ1xF9JhQV2STxWXLUS+f
         Y/ETR7YIwU6TRCahEAWTXTBuT/tUcXWEwBWcA1igbCuEjVF+MaeyI9wofJsVRFZwZjIh
         Nomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108219; x=1795713019;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPrQ6ArSaDDsNNhcUrdH0wiM+gM05NGU68MU/yNuooM=;
        b=1EqDWjUvWYgp7J2oO9eOqqZB1qRr3ecFe+2ghtjH+Cg2KABGm0EJPF0gmQoI1aMRwH
         Hkp/hMat8/rDqSOKdLisQKnPe+nQOWcl/Znxyxa82yLqttO26wMaUb8PKWhn9r8K/tEs
         CLTy5/DWpsJ/C6zUsDBOSryL6gOAaNzqSAbfXT3MFNgsdkBU5LaOxpVEbXPwHSAsqoxa
         u5+vuqtlxAeikYVGjqb2ccAb3rtki9XTn9RZ+ums3eYAL8HWlWtq/XgOCg6l6edxCDQe
         7SD9Zn6VP7vQN9U21Tb+CTO1shL4urkkNcYk0hvQARquxqKkSxmd94cmc1AOXfU4Xkow
         827Q==
X-Forwarded-Encrypted: i=1; AL+hErGhMpE75edkl5IyRV8rdq/GLnI4GPAuNkQem63RAPCxGgVO8AuZG+Brs8XzOTeibOUC97EFtiYHSeLRJ2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VF1Mu5mdD2dp8jyadS5j61MycluPOhv1rTXZDGVzADWRXS1pG
	b3iD3xDk9/4hiDmpD4WMFng+ZxLCa5Wx/AdytRb8hJh2OsbMUG+kSKwRE8sOJgIipBC9nN9x+Ej
	VI3C5pxZUOQ==
X-Received: from oaoz18-n2.prod.google.com ([2002:a05:6871:e9d2:20b0:49e:13a7:3e26])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:c236:b0:4f7:a3c:6b92
 with SMTP id 5614622812f47-57a0bd994a9mr673686b6e.57.1795108219377; Thu, 19
 Nov 2026 09:10:19 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:14 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119171014.1534691-1-irogers@google.com>
Subject: [PATCH net] net: pse-pd: pd692x0: Return fw_upload_err codes from
 firmware upload ops
From: Ian Rogers <irogers@google.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, Kory Maincent <kory.maincent@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

pd692x0_fw_reset() and pd692x0_fw_write() return negative errno values
from i2c_master_send() directly as enum fw_upload_err instead of
FW_UPLOAD_ERR_RW_ERROR, and pd692x0_fw_recv_resp() ignores negative
errors from its trailing i2c_master_recv(). When a negative errno is
propagated to the firmware upload core, fw_upload_error() rejects it
as >= FW_UPLOAD_ERR_MAX, logs an invalid error code message, and
reports "unknown-error" instead of "read-write-error" via sysfs.

Return FW_UPLOAD_ERR_RW_ERROR on I2C transfer failures and use
enum fw_upload_err consistently across the PD692x0 firmware upload
helpers.

Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
build. Verified by building drivers/net/pse-pd/pd692x0.o with LLVM=1
W=1 (-Werror) and -Wimplicit-int-enum-cast, and with a standalone C
reproducer; not runtime-tested on PD692x0 hardware.

Fixes: 9a9938451890 ("net: pse-pd: Add PD692x0 PSE controller driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/pse-pd/pd692x0.c | 81 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 41 deletions(-)

diff --git a/drivers/net/pse-pd/pd692x0.c b/drivers/net/pse-pd/pd692x0.c
index 7958f5741463..94a857eaa3de 100644
--- a/drivers/net/pse-pd/pd692x0.c
+++ b/drivers/net/pse-pd/pd692x0.c
@@ -1455,6 +1455,8 @@ pd692x0_fw_recv_resp(const struct i2c_client *client, unsigned long ms_timeout,
 
 	/* Read remaining characters */
 	ret = i2c_master_recv(client, fw_msg_buf + 1, msg_size - 1);
+	if (ret < 0)
+		return FW_UPLOAD_ERR_RW_ERROR;
 	if (strncmp(fw_msg_buf, msg_ok, msg_size)) {
 		dev_err(&client->dev,
 			"Wrong FW download process answer (%*pE)\n",
@@ -1465,9 +1467,10 @@ pd692x0_fw_recv_resp(const struct i2c_client *client, unsigned long ms_timeout,
 	return FW_UPLOAD_ERR_NONE;
 }
 
-static int pd692x0_fw_write_line(const struct i2c_client *client,
-				 const char line[PD692X0_FW_LINE_MAX_SZ],
-				 const bool last_line)
+static enum fw_upload_err
+pd692x0_fw_write_line(const struct i2c_client *client,
+		      const char line[PD692X0_FW_LINE_MAX_SZ],
+		      const bool last_line)
 {
 	int ret;
 
@@ -1478,19 +1481,12 @@ static int pd692x0_fw_write_line(const struct i2c_client *client,
 		line++;
 	}
 
-	if (last_line) {
-		ret = pd692x0_fw_recv_resp(client, 100, "TP\r\n",
-					   sizeof("TP\r\n") - 1);
-		if (ret)
-			return ret;
-	} else {
-		ret = pd692x0_fw_recv_resp(client, 100, "T*\r\n",
-					   sizeof("T*\r\n") - 1);
-		if (ret)
-			return ret;
-	}
+	if (last_line)
+		return pd692x0_fw_recv_resp(client, 100, "TP\r\n",
+					    sizeof("TP\r\n") - 1);
 
-	return FW_UPLOAD_ERR_NONE;
+	return pd692x0_fw_recv_resp(client, 100, "T*\r\n",
+				    sizeof("T*\r\n") - 1);
 }
 
 static enum fw_upload_err pd692x0_fw_reset(const struct i2c_client *client)
@@ -1506,7 +1502,7 @@ static enum fw_upload_err pd692x0_fw_reset(const struct i2c_client *client)
 		dev_err(&client->dev,
 			"Failed to reset the controller (%pe)\n",
 			ERR_PTR(ret));
-		return ret;
+		return FW_UPLOAD_ERR_RW_ERROR;
 	}
 
 	timeout = msecs_to_jiffies(10000) + jiffies;
@@ -1545,6 +1541,7 @@ static enum fw_upload_err pd692x0_fw_prepare(struct fw_upload *fwl,
 	struct pd692x0_priv *priv = fwl->dd_handle;
 	const struct i2c_client *client = priv->client;
 	enum pd692x0_fw_state last_fw_state;
+	enum fw_upload_err err;
 	int ret;
 
 	priv->cancel_request = false;
@@ -1578,12 +1575,12 @@ static enum fw_upload_err pd692x0_fw_prepare(struct fw_upload *fwl,
 		}
 	}
 
-	ret = pd692x0_fw_recv_resp(client, 100, "TPE\r\n", sizeof("TPE\r\n") - 1);
-	if (ret)
+	err = pd692x0_fw_recv_resp(client, 100, "TPE\r\n", sizeof("TPE\r\n") - 1);
+	if (err)
 		goto err_out;
 
 	if (priv->cancel_request) {
-		ret = FW_UPLOAD_ERR_CANCELED;
+		err = FW_UPLOAD_ERR_CANCELED;
 		goto err_out;
 	}
 
@@ -1592,7 +1589,7 @@ static enum fw_upload_err pd692x0_fw_prepare(struct fw_upload *fwl,
 err_out:
 	pd692x0_fw_reset(priv->client);
 	priv->fw_state = last_fw_state;
-	return ret;
+	return err;
 }
 
 static enum fw_upload_err pd692x0_fw_write(struct fw_upload *fwl,
@@ -1602,6 +1599,7 @@ static enum fw_upload_err pd692x0_fw_write(struct fw_upload *fwl,
 	struct pd692x0_priv *priv = fwl->dd_handle;
 	char line[PD692X0_FW_LINE_MAX_SZ];
 	const struct i2c_client *client;
+	enum fw_upload_err err;
 	int ret, i;
 	char cmd;
 
@@ -1618,17 +1616,17 @@ static enum fw_upload_err pd692x0_fw_write(struct fw_upload *fwl,
 		return FW_UPLOAD_ERR_RW_ERROR;
 	}
 
-	ret = pd692x0_fw_recv_resp(client, 100, "TOE\r\n", sizeof("TOE\r\n") - 1);
-	if (ret)
-		return ret;
+	err = pd692x0_fw_recv_resp(client, 100, "TOE\r\n", sizeof("TOE\r\n") - 1);
+	if (err)
+		return err;
 
-	ret = pd692x0_fw_recv_resp(client, 5000, "TE\r\n", sizeof("TE\r\n") - 1);
-	if (ret)
+	err = pd692x0_fw_recv_resp(client, 5000, "TE\r\n", sizeof("TE\r\n") - 1);
+	if (err)
 		dev_warn(&client->dev,
 			 "Failed to erase internal memory, however still try to write Firmware\n");
 
-	ret = pd692x0_fw_recv_resp(client, 100, "TPE\r\n", sizeof("TPE\r\n") - 1);
-	if (ret)
+	err = pd692x0_fw_recv_resp(client, 100, "TPE\r\n", sizeof("TPE\r\n") - 1);
+	if (err)
 		dev_warn(&client->dev,
 			 "Failed to erase internal memory, however still try to write Firmware\n");
 
@@ -1642,18 +1640,18 @@ static enum fw_upload_err pd692x0_fw_write(struct fw_upload *fwl,
 		dev_err(&client->dev,
 			"Failed to boot programming mode (%pe)\n",
 			ERR_PTR(ret));
-		return ret;
+		return FW_UPLOAD_ERR_RW_ERROR;
 	}
 
-	ret = pd692x0_fw_recv_resp(client, 100, "TOP\r\n", sizeof("TOP\r\n") - 1);
-	if (ret)
-		return ret;
+	err = pd692x0_fw_recv_resp(client, 100, "TOP\r\n", sizeof("TOP\r\n") - 1);
+	if (err)
+		return err;
 
 	i = 0;
 	while (i < size) {
 		ret = pd692x0_fw_get_next_line(data, line, size - i);
 		if (ret < 0) {
-			ret = FW_UPLOAD_ERR_FW_INVALID;
+			err = FW_UPLOAD_ERR_FW_INVALID;
 			goto err;
 		}
 
@@ -1662,17 +1660,17 @@ static enum fw_upload_err pd692x0_fw_write(struct fw_upload *fwl,
 		if (line[0] == 'S' && line[1] == '0') {
 			continue;
 		} else if (line[0] == 'S' && line[1] == '7') {
-			ret = pd692x0_fw_write_line(client, line, true);
-			if (ret)
+			err = pd692x0_fw_write_line(client, line, true);
+			if (err)
 				goto err;
 		} else {
-			ret = pd692x0_fw_write_line(client, line, false);
-			if (ret)
+			err = pd692x0_fw_write_line(client, line, false);
+			if (err)
 				goto err;
 		}
 
 		if (priv->cancel_request) {
-			ret = FW_UPLOAD_ERR_CANCELED;
+			err = FW_UPLOAD_ERR_CANCELED;
 			goto err;
 		}
 	}
@@ -1685,7 +1683,7 @@ static enum fw_upload_err pd692x0_fw_write(struct fw_upload *fwl,
 err:
 	strscpy_pad(line, "S7\r\n", sizeof(line));
 	pd692x0_fw_write_line(client, line, true);
-	return ret;
+	return err;
 }
 
 static enum fw_upload_err pd692x0_fw_poll_complete(struct fw_upload *fwl)
@@ -1693,13 +1691,14 @@ static enum fw_upload_err pd692x0_fw_poll_complete(struct fw_upload *fwl)
 	struct pd692x0_priv *priv = fwl->dd_handle;
 	const struct i2c_client *client = priv->client;
 	struct pd692x0_msg_ver ver;
+	enum fw_upload_err err;
 	int ret;
 
 	priv->fw_state = PD692X0_FW_COMPLETE;
 
-	ret = pd692x0_fw_reset(client);
-	if (ret)
-		return ret;
+	err = pd692x0_fw_reset(client);
+	if (err)
+		return err;
 
 	ver = pd692x0_get_sw_version(priv);
 	if (ver.maj_sw_ver < PD692X0_FW_MAJ_VER) {
-- 
2.56.1.708.g77570a6a1d-goog

