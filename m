Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802309;
	b=TwSxKARxmq7tpFRIgQNTj3Mv4BBufBlRv1x5CgoiRWN6d1bfEGvRHkFbC0XU+EuaimJr
	 G59G6619tHknjB9pR/XxID5DrUzQGyi4Bsp7OQ2r+N7DAKd9AfS/LDBgcDrv+C1vXKbG+
	 s5CHdz9aUfn+ommMZ81w/NJFJsSvDK524AIALU859HO+ZAzhU/0LjG68OwgN9G1UKQnhV
	 pWQjpz0BThq6xDPtqAJ4qmcOenBcOtCbZbQpAVNgDI2upFAFxKPuV3tBHPaTXvupFtfaz
	 GK7Yp422SW9C5AvL096bNDoQhwiB/Y0mL/cKAs1TeQpgdHh08pwoL6Oo+wsd6zLrN1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802309;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=Z5tNyvrsvWQDj36l9ZXx0fUEovQVfoABaDt4gVc+4AI=;
	b=LV8RoUpVlHddN+whLx+ZGFzFjacU0hnTjBg6wL5ApHew6ioldIrCYO+3s/ar+7JJsBzk
	 o+aWU06DD5m94ynhpKC53uyQCSysoMXOASIanG26OqQxceFQK1Z1Kp3agZ3Rxr7xfUiEy
	 qE2RpT8RJcN/50CL+oEOE7TmrzGwsJ1jDyiU7RFQTiBgsjVlx+y0KV7BZXHixUiV6I3hC
	 c+AXsnMhejMcSvfiKJAf5QUrUpdD+do58rRRUPsvXZc9vCpOrnVb3FiWcZYuidAGtlUvK
	 XP9tqrHI8jcx7j+l7w8FKz8fcKbUzpXPIHGAC6I+/vFXq2HSZ0n8L6jLBpvH7EqoWjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NZv0XSNq;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C91B606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C91B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=NZv0XSNq
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 17893C2AC4C;
	Fri, 27 Nov 2026 17:58:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40C666049C;
	Fri, 27 Nov 2026 17:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB639104395A8;
	Fri, 27 Nov 2026 18:58:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795802302; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z5tNyvrsvWQDj36l9ZXx0fUEovQVfoABaDt4gVc+4AI=;
	b=NZv0XSNqC1IGGArwUlEv8FsgnbMRZ1S5NQZI6C4Spr0pWCJ/vAc2LSWeSTnCItE1VuiQxb
	/mE3F6QbqvCyrDDhRCzOhBHDvk+iwARunuTulgj87w/wh3QuwH9NstK4NCap5huo3xphEh
	9DZVEJjzz+mqsGG5/S0+U35zfffwnrrr/Lz9Yj74Lhjdg9619o6idkyQk7C3BMp7PIczYp
	v9VRDGnBOszMLnoVMruiisiCaG739J5NcJLwHK9HcirdfzxfnBOdDumMzEQKRjoq81lJ7P
	u0DlTCo5/H3dwWOh9ILxPExVUufvDj7pD8sbxZvd54jv/9O9nErBY6a1HwYT8w==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 27 Nov 2026 18:57:47 +0100
Subject: [PATCH v7 03/11] i2c: cgbc: Use real I2C bus names
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
Message-Id: <20261127-cgbc-i2c-storage-devices-support-v7-3-d0e70fc57879@bootlin.com>
References: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
In-Reply-To: <20261127-cgbc-i2c-storage-devices-support-v7-0-d0e70fc57879@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

The adapter names described the expected purpose of the buses ("General
Purpose I2C adapter", "Power Management I2C adapter") on conga-sa7 board
rather than their actual names on the Board Controller.

Rename them to the real bus names "cgbc-i2c0" and "cgbc-ddc0", matching
the naming used by Congatec.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-cgbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index dfdb9ffc6447..baf02bfe090c 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -358,7 +358,7 @@ static struct i2c_algo_cgbc_data cgbc_i2c_algo_data[] = {
 static const struct i2c_adapter cgbc_i2c_adapter[] = {
 	{
 		.owner		= THIS_MODULE,
-		.name		= "Congatec General Purpose I2C adapter",
+		.name		= "cgbc-i2c0",
 		.class		= I2C_CLASS_DEPRECATED,
 		.algo		= &cgbc_i2c_algorithm,
 		.algo_data	= &cgbc_i2c_algo_data[0],
@@ -366,7 +366,7 @@ static const struct i2c_adapter cgbc_i2c_adapter[] = {
 	},
 	{
 		.owner		= THIS_MODULE,
-		.name		= "Congatec Power Management I2C adapter",
+		.name		= "cgbc-ddc0",
 		.class		= I2C_CLASS_DEPRECATED,
 		.algo		= &cgbc_i2c_algorithm,
 		.algo_data	= &cgbc_i2c_algo_data[1],

-- 
2.53.0

