Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874425;
	b=d5rJPdYYSg0QU0AjI0yDUNb30EF/MyMgvsIzarwMeAagnoU4gmqTDhOcXLP/koQDL9JW
	 LP3S35NXvg80gtD3Kh7mFe3Tx2zhrAf08mOFDgLGVBX2kwFC7Y8weDUOlRArmttTKLwHB
	 ClantvkRp3mQMC8Kg0NRuHfkeFwziopvMwkwxKn3NoutjJ1NSlMdujmHzJ3HG67ISGOjP
	 8+vn6ETRaZbcVvZJGDZgxqd0GfNHK94ln4QdLEreHmnom/vEZK17U9yi+pYJMMzgYFXB+
	 aih2Pnk0gAmchfJUuRwlOKQKyzqN2ItFmRjshgts2XVbfaKIYbnlaeRSse++XsVdfzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874425;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Ff3Y2uZDXSevloImsEOAciDXs0h9KJUo7hDoLFeK6Es=;
	b=xzfBfANpdxEwCqaLO8JQUPmu74UUbFZ0JlRf3i32VvD+GbDtqq8MsPyL1bLY5PrlwZGe
	 jt0Ijzl1ua5wkeRy4pL7JyUCGArjaGaj7nexxMP1iMU3XHUR+v+X/NJGVt9wCJgDffUFD
	 fIJXm6RXqRccwuoWZs3MY49p6xpbCf5Bk3WcZCbp74lZHWFc54ki0R4MS1dXOvOHvZrQX
	 pS2AubtpH4yP1zZAPYqH0iQYozVfAYfo5SRQMmCVmoB5evNY2IGlqefJ/QG8kjIegG+ME
	 s0M+jf5N0yotso+pcsEfdZNiXJFBNzQZvCTdsfaxXLJ71Kao7Ll2T++nPtnkcnhKyUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=D+tOQSnb;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3702606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3702606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=D+tOQSnb
DKIM2-Signature:  i=1; m=1; t=1795874423;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:rnqx8FMhRHdqyOk6ULkeqa+9sSMw
   vU3W1+h50ZMPrFtBNRL15Mln44MXuU+D4bGYGxQFpMCQaUMF2C7Dh4zhWhW/dQAdg4g11jQBvCF
   pXZtiImz7MANZ2yx6SU7n9m9Tv/Zd9xAZfhR61tfektnWN1SM8OCHiP9USlD+31TYoqpa7to5uV
   93jogHV5KI6hSiHgmxLnfnf7qAmtJs8B66d2rFYwqQZUH00CBSLZ/ayT467mgJhEQnggtEoQruX
   PukMEDoDOZKp3S+jKwK6ZW+OoJ7TMeTpyiJupkspuQ5bxsDgfgZPPh47eXnrqmLpGeEFFt9E7Ei
   IHW7ovo1ji6IGQ==;
Message-Instance:  m=1;
 h=sha256:
   PySwIaH8uLg5kKEDvXIN21XYQK6XmIotwd24BIS7JAU=:
   2tn6LYYagX+2MLztHy8lqD/80aDZ9k3fv1eSMtu8dNc=,
  sha512:
   sxheOdmVcHxqMpPXvQ1QHCJkdWSDSlUqkoHrhNwjznp/Eu+9FffvxzR5s8Mku3WesIskUP3/PMQlz9MYg6Trkw==:
   2EPXNFIhrID9Oa2eubbfDdqEDNTGD2Cqy3N//uyhn5IYipntqCUIDmjITS2jD/rT01pVYLQwVqtIG0Al3Jod8w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874414; x=1796479214; i=w_armin@gmx.de;
	bh=Ff3Y2uZDXSevloImsEOAciDXs0h9KJUo7hDoLFeK6Es=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D+tOQSnbXAQNxt/9n8W1ay/PQ7NS3KvV1KvCrgi0ezuSvxrRqcH3V742Utf1TAHr
	 +dzC6PkbQfAa1qkUTefODF7ez2gWEorfD8zIW+vsBtW/QHCx71YT/Y5SyZTbPnfgA
	 EF1jeIoPbp/ZYortvY5siYunleGaydD/pJ9SCtYO+b31hUYyAiXYkiL5GPQGv9vXU
	 RLpiQMqheyAhq1UXgs0m7CTlHREvCYHYNDuqXnAMUHFDmDr6bb1p2AI/eGU497H/l
	 EcucPUR8oN6o3ntTuTpFyKoILRgFXiyUgADtabon7cQbuU3bclu6RLzW+h0aAFfN7
	 2kSX0b4FPLED3bYn4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MhD2Y-1yACER3Nkg-00bR2q; Sat, 28
 Nov 2026 15:00:13 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 05/10] leds: class: Fix race condition when creating the device
Date: Sat, 28 Nov 2026 14:58:42 +0100
Message-ID: <20261128135954.186682-6-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:fjid88dBeWKkXFrZ1evaItibsOneANyQQy7+HXzIkQh11WSB2vi
 eAllLC06nHWZkePiXGRHg7XVlrjqwj81phpcQjrx5fkajuDd7Ng603p5Q0H/DxwpfHyUcsh
 BSeoD42rkffPxbjNV/LLxWEvumGfRE8dvN03jcw30KGMSUIHUDqntOSU8YGxomOFVeCeq5I
 d78y5jQCKB1HG/Ybrkvlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ezc/ZGfwaF4=;kHl7rBtWGDMz5ruvrnQNQd+zCwk
 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

Userspace applications can access the sysfs attributes as soon as
device_create_with_groups() has returned. Two of those sysfs
attributes ("brightness_hw_changed" and "max_brightness") access
fields that are not properly initialized at this point, with only
"max_brightness" guarding against this by taking the LED access lock.

Fix the race condition affecting "brightness_hw_changed" by creating
the device after the associated fields have been properly initialized.
This also allows us to drop the LED access lock inside
max_brightness_show(), as the maximum brightness does not change after
initialization.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 00532437cc45..fa9803e2ae6d 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -81,13 +81,8 @@ static ssize_t max_brightness_show(struct device *dev, =
const struct device_attri
 				   char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
-	unsigned int max_brightness;
=20
-	mutex_lock(&led_cdev->led_access);
-	max_brightness =3D led_cdev->max_brightness;
-	mutex_unlock(&led_cdev->led_access);
-
-	return sysfs_emit(buf, "%u\n", max_brightness);
+	return sysfs_emit(buf, "%u\n", led_cdev->max_brightness);
 }
=20
 static const DEVICE_ATTR_RO(max_brightness);
@@ -555,6 +550,18 @@ int led_classdev_register_ext(struct device *parent,
 	init_rwsem(&led_cdev->trigger_lock);
 #endif
 	mutex_init(&led_cdev->led_access);
+	led_cdev->work_flags =3D 0;
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	led_cdev->brightness_hw_changed =3D -1;
+#endif
+#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
+	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
+		INIT_WORK(&led_cdev->trigger_hw_changed_work,
+			  led_trigger_hw_control_changed_worker);
+#endif
+	if (!led_cdev->max_brightness)
+		led_cdev->max_brightness =3D LED_FULL;
+
 	mutex_lock(&led_cdev->led_access);
 	led_cdev->dev =3D device_create_with_groups(&leds_class, parent, 0,
 						  led_cdev, led_cdev->groups, "%s", final_name);
@@ -562,6 +569,7 @@ int led_classdev_register_ext(struct device *parent,
 		mutex_unlock(&led_cdev->led_access);
 		return PTR_ERR(led_cdev->dev);
 	}
+
 	if (init_data && init_data->fwnode)
 		device_set_node(led_cdev->dev, init_data->fwnode);
=20
@@ -576,18 +584,6 @@ int led_classdev_register_ext(struct device *parent,
 		}
 	}
=20
-	led_cdev->work_flags =3D 0;
-#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-	led_cdev->brightness_hw_changed =3D -1;
-#endif
-#ifdef CONFIG_LEDS_TRIGGERS_HW_CHANGED
-	if (led_cdev->flags & LED_TRIG_HW_CHANGED)
-		INIT_WORK(&led_cdev->trigger_hw_changed_work,
-			  led_trigger_hw_control_changed_worker);
-#endif
-	if (!led_cdev->max_brightness)
-		led_cdev->max_brightness =3D LED_FULL;
-
 	led_update_brightness(led_cdev);
=20
 	led_cdev->wq =3D leds_wq;
=2D-=20
2.56.1

