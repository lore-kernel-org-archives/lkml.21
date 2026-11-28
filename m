Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874430;
	b=SpRZUS0IYsy9JRXdseeujBV+n+3bca08ZKRDDc5t2HCwvXiVE31SQcoYpANkWPbJ0ItR
	 Dz15VLED7fzdcKXEllxyUFgR7EKVrcH7wCmE2U4aR9CFGzEQG3fGrtEqRglzrmQbdcIC9
	 NcCeazmLNYjo8edgjZiBM9SCYobIHTZdz9iqBb3nJ5dteYwqO8Pzzt6mIlJbHFgyiDOgP
	 Fs7/y+MJY7ln0Fdkx752MzQ9SkwGUsMpapYsqKpWVhhKCHDMH5VevVKJwiMVuwpbkMea+
	 gtaiFeXgspIjNL3RMEBQ5wysBuDHMEvaWJZadtjjtEVFaikwMVYh63J3jvyahT5PsQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874430;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=bsMCZMQwkGYqIRc0Ge5tIMFonzLcN7M7cP+v8lzuaqo=;
	b=taCcM4cNjgaZM92fVUJmkMe9aSoAeRnFFA8vKkqejRN1gONbDqXZSZaS0/b7/G3/0D3y
	 ZZ8pHR6GRC+iHaTIXlyaNW5dX9B9MV6O6dBinrsjur9PThxTA51Jt3u19m2xDeJv4dP96
	 ERCrQ0pHr5ezL31tdhgKHvwOoozzpaQMCngSwR/oCHubksyme9B5iapn1s20zhwzMzhtk
	 G3kx2MT1jfsL5+Jalsqlk5P92srbylxFPSok30j51ZdVILHMEPmNfB43rmH49RI7ZpxyN
	 I6EALnio13Rxnp0C1CEEa+Mqnwcz51gBDgFPpyTHOBu1Hmkr4R4CoJ8PbN1W+K60Lfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=q49sXLW1;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2B7606A33C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2B7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=q49sXLW1
DKIM2-Signature:  i=1; m=1; t=1795874427;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:mwIweLjYbVzHr4Hxty1vwl+Wivyc
   kwNa+sLrOEbTNmHKrFIBOTNTxHL696vf+5Mlgmzy71z7qsmyi14rBq+lGjUOAs6cyYKu2owM2d5
   wd9eZV912nLKx6rSzTYLrMS1JmjXVt2szHJS6UcBHWozHPlTAdleL5KPzieD+JWUsOE/xpj4flA
   oRrN6/nMbz1fG7C0P+iXpKHtMViAc9AiGFV7YBmqCQJcdK1qQBLZUvB/VLrG+Jiw/yglzGlaTBo
   qzXN6uBBzsktBouWWI0h/KpGdnqa4vDwaSJFYTuoJfv4MRwffgclbuj5pUjXCRb2RVCCyxg1Cb2
   wAXlUPO7U+QTIA==;
Message-Instance:  m=1;
 h=sha256:
   MemDvBPe1h6YD31Bx6Whnvfu513TKHhBPv/Bqq+1G34=:
   PaioKeKh5iOFxYpONXXMCwX0Ign6YNE7GaWVGxQe9QU=,
  sha512:
   UTXMyBEx7tYylaffu7t/ehUAzdr/B7ZoF9GPAkzFpLeI7QlCFQGOiEEU3d4uIz4xR6EKG/QHY8SlEUFhwA6dQQ==:
   J2nUV5PInAd8vr2m33WSfJX6agiBRRzazmZ+dd30l6yIM+xSRCsgqVasuZh0mT1vH+7P32GMvjbybnDh60jjsw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874418; x=1796479218; i=w_armin@gmx.de;
	bh=bsMCZMQwkGYqIRc0Ge5tIMFonzLcN7M7cP+v8lzuaqo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=q49sXLW19BY7ugDrUmcV2iH7ugSIuerhR7NDKIALe0ODjddQZBQzirF8I/wMy6aQ
	 0UcJOp4TRns6pBYBppJMJwM9ho1hESbp9T0bQNe2iI1Zchz7AkyVkRCIR880AmFvd
	 McKntcSflJsUBrtXu816yggNh9hxDaceUi6uo0xIad2OmhJXGKd7NbEFK7esn+ud6
	 hmaBOHl5tlIhnNB5+rhUCD8w6+K+6h5yizWzjxoCviYi5j29wUcyz7iVBwilwqKwe
	 FK6sC2f4oVOSk04oJsnQcu+ROY5V6Nf1uYVDTV0FEuQ9NSwQQhfWgFI+rFPxmgIDA
	 cPCs4YodijbiOqPbBw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1yXpDB3Yxg-00sl5E; Sat, 28
 Nov 2026 15:00:18 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 08/10] leds: class: Split led_classdev_register_ext()
Date: Sat, 28 Nov 2026 14:58:45 +0100
Message-ID: <20261128135954.186682-9-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128135954.186682-1-W_Armin@gmx.de>
References: <20261128135954.186682-1-W_Armin@gmx.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2PBS0GA0yWt8e3zge0hubToNP9hpyDrsO+iriFjpGUI9aVTCDU/
 koWGXkDOe8LlNNBHSWM2FU05eh0YuCujfoHdiG/vWygeX49rqbrVEx7ujU2+RZzhHD93aUH
 gI+fkC9wf8ab/0hLQpNrLBjaOZrtw8P7KItogQWGAEeq7PXL1WWt2cU/FupIK3G2hJNBl/9
 vpc2yCpA56SnyaIc18G1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FhZxR8gpD/o=;rIH+MJZ4p3SpIjkBxnxKacxvksE
 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

Split led_classdev_register_ext() into two separate internal functions
to prepare for future changes around LED class device initialization.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 102 ++++++++++++++++++++++++++++++++-------
 drivers/leds/leds.h      |   3 ++
 2 files changed, 87 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 8494a1ca0353..b9de9cebdc11 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -253,9 +253,15 @@ static struct led_classdev *led_module_get(struct dev=
ice *led_dev)
 	return led_cdev;
 }
=20
+static void led_classdev_release(struct device *dev)
+{
+	kfree(dev);
+}
+
 static const struct class leds_class =3D {
 	.name =3D "leds",
 	.dev_groups =3D led_groups,
+	.dev_release =3D led_classdev_release,
 	.pm =3D &leds_class_dev_pm_ops,
 };
=20
@@ -490,16 +496,19 @@ static int led_classdev_next_name(const char *init_n=
ame, char *name,
 }
=20
 /**
- * led_classdev_register_ext - register a new object of led_classdev clas=
s
- *			       with init data.
- *
- * @parent: parent of LED device
+ * led_classdev_init - Initialize a new LED class device.
+ * @parent: parent of LED device.
  * @led_cdev: the led_classdev structure for this device.
- * @init_data: LED class device initialization data
+ * @init_data: LED class device initialization data.
+ *
+ * Initializes a new LED class device, but does not register with the
+ * subsystem yet. Useful for performing additional initialization before
+ * adding the LED class device to the subsystem using led_classdev_add().
+ *
+ * Return: Zero on success or a negative error code on failure.
  */
-int led_classdev_register_ext(struct device *parent,
-			      struct led_classdev *led_cdev,
-			      struct led_init_data *init_data)
+int led_classdev_init(struct device *parent, struct led_classdev *led_cde=
v,
+		      struct led_init_data *init_data)
 {
 	char composed_name[LED_MAX_NAME_SIZE];
 	char final_name[LED_MAX_NAME_SIZE];
@@ -564,12 +573,52 @@ int led_classdev_register_ext(struct device *parent,
 	if (!led_cdev->max_brightness)
 		led_cdev->max_brightness =3D LED_FULL;
=20
+	led_cdev->dev =3D kzalloc_obj(*led_cdev->dev);
+	if (!led_cdev->dev)
+		return -ENOMEM;
+
+	device_initialize(led_cdev->dev);
+	led_cdev->dev->class =3D &leds_class;
+	led_cdev->dev->parent =3D parent;
+	led_cdev->dev->groups =3D led_cdev->groups;
+	dev_set_drvdata(led_cdev->dev, led_cdev);
+	ret =3D kobject_set_name(&led_cdev->dev->kobj, "%s", final_name);
+	if (ret) {
+		put_device(led_cdev->dev);
+		led_cdev->dev =3D NULL;
+		return ret;
+	}
+
+	led_cdev->wq =3D leds_wq;
+
+	led_init_core(led_cdev);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(led_classdev_init);
+
+/**
+ * led_classdev_add - Add a new LED class device to the subsystem.
+ * @led_cdev: the led_classdev structure for this device.
+ * @init_data: LED class device initialization data.
+ *
+ * Adds a new LED class device to the subsystem, allowing userspace appli=
cations
+ * and/or kernel consumers to access it.
+ *
+ * Returns: Zero on success or a negative error code on failure.
+ */
+int led_classdev_add(struct led_classdev *led_cdev, struct led_init_data =
*init_data)
+{
+	int ret;
+
 	mutex_lock(&led_cdev->led_access);
-	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
-						  led_cdev, led_cdev->groups, "%s", final_name);
-	if (IS_ERR(led_cdev->dev)) {
+
+	ret =3D device_add(led_cdev->dev);
+	if (ret) {
 		mutex_unlock(&led_cdev->led_access);
-		return PTR_ERR(led_cdev->dev);
+		put_device(led_cdev->dev);
+		led_cdev->dev =3D NULL;
+		return ret;
 	}
=20
 	if (init_data && init_data->fwnode)
@@ -588,10 +637,6 @@ int led_classdev_register_ext(struct device *parent,
=20
 	led_update_brightness(led_cdev);
=20
-	led_cdev->wq =3D leds_wq;
-
-	led_init_core(led_cdev);
-
 	/* add to the list of leds */
 	down_write(&leds_list_lock);
 	list_add_tail(&led_cdev->node, &leds_list);
@@ -603,11 +648,32 @@ int led_classdev_register_ext(struct device *parent,
=20
 	mutex_unlock(&led_cdev->led_access);
=20
-	dev_dbg(parent, "Registered led device: %s\n",
-			led_cdev->name);
+	dev_dbg(led_cdev->dev->parent, "Registered led device: %s\n", led_cdev->=
name);
=20
 	return 0;
 }
+EXPORT_SYMBOL_GPL(led_classdev_add);
+
+/**
+ * led_classdev_register_ext - register a new object of led_classdev clas=
s
+ *                             with init data.
+ *
+ * @parent: parent of LED device.
+ * @led_cdev: the led_classdev structure for this device.
+ * @init_data: LED class device initialization data.
+ */
+int led_classdev_register_ext(struct device *parent,
+			      struct led_classdev *led_cdev,
+			      struct led_init_data *init_data)
+{
+	int ret;
+
+	ret =3D led_classdev_init(parent, led_cdev, init_data);
+	if (ret)
+		return ret;
+
+	return led_classdev_add(led_cdev, init_data);
+}
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
=20
 /**
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 6d00e6f44126..def7166f062a 100644
=2D-- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -18,6 +18,9 @@ static inline int led_get_brightness(struct led_classdev=
 *led_cdev)
 }
=20
 void led_init_core(struct led_classdev *led_cdev);
+int led_classdev_init(struct device *parent, struct led_classdev *led_cde=
v,
+		      struct led_init_data *init_data);
+int led_classdev_add(struct led_classdev *led_cdev, struct led_init_data =
*init_data);
 void led_stop_software_blink(struct led_classdev *led_cdev);
 void led_set_brightness_nopm(struct led_classdev *led_cdev, unsigned int =
value);
 void led_set_brightness_nosleep(struct led_classdev *led_cdev, unsigned i=
nt value);
=2D-=20
2.56.1

