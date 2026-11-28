Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874417;
	b=OgWdv2TBbZCk5ix7uVABvugvfwQ+odGR8gMRyOfaq5heO45/TU45S82mpecC8tiARErx
	 gQZ+VXtLFuDENMtgDIc5ihTnxCsRkPPSgmzn9U7tPl5HZ1E6dyK1qvQKlOeO7x6v7bAa1
	 JyBwmXcecHxSLDGb/Wl0uXih9pwkwNX93zATznwR56GxMydyZw0h4M9twK6f9J8WDz9Xt
	 aW7ApMMGVrvlyi2oaMtwahKelgPpj62WIQzZUVcIYOx/vjFtScwXiWtG7ezuRYr8Kf/np
	 +/Mt0Pm5kkAHISzWZ7PgT1fHovyhv+Y9amEwQ8usnCiF1yE3CD9prMSwE4htdCl1rng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874417;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=XV+6UqMTzZFyEZk1qZGrj1RrH/w3U08qUJdHA2eca0s=;
	b=fGcwujMnPCsna45x/7l1OlZ/g57Cc5ggZYaVRt80om3O0C4UTyYP9M3/nItYcJaVWWXl
	 Ko7KEVFop8bqOXBbYrIgZL4OaajRiLOn8Dc14+baIporxR3ZFkD4vflqhorU+4lesHfNY
	 aenByHFF9zZYuqZQFGmF8MyPjjzCenXT+4XRTb2+9ui6Qd5PQihJJKCuYTlTjAWHeJn3Y
	 +MXjfUUEQT2szBbW3DEqnwtLg0D+UGvfI8KX7hwj2aIkczdKgjKrAqbG/UGas2ZRYruoU
	 qyEd9nGFlnMKj+yM2TyWc7qJ9ZzfWi3eT7fBn4oCQoUg8AZ3EDppO2dpp8R/XHktoww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=lkZgQIIN;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DC4606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=lkZgQIIN
DKIM2-Signature:  i=1; m=1; t=1795874415;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:pkLpst2w/6GIun7W07FbQZqKe2tR
   Bw3py/agjCVpXVowGL987aebjO5dbF9bjE0Wun8MMGUjQev6j6/tufmd/V237CwGoNwjHgC+2Ws
   75CKDMmzbXqFayPwWwmoRZzpV/xcUltBKrLb8OeQ1ZnFVrabUKiJDQAqV/1L6X40rK0T7nCfewO
   V+SM7P+lRRmZ472YUUBFMETVy1QGPtYuePWSLxmO7cprGc6HYqHlhy9wHOYbQ5SPmcKSVFmKftz
   h5eSknaq29FAlQCCSfCicCN3WjLar5nd4+SsPuk0U3Bo/J9UTjVEJwLI19azfM6gkBTtkE3mhT2
   so88nAosbSnxNg==;
Message-Instance:  m=1;
 h=sha256:
   t11/97Fj5kcttWJ1e+xAHqEF4mOw1Bb88ne8fb7fn2c=:
   bC0P+zZLInVXzS0hf0vN5sBFazQvEyF5AujJ0Nx8B6o=,
  sha512:
   xGhD1LPADDsN9wmBaROvh/IhNCswPceS6BvjWpnQTcvopbD7tuBQxmSODItGDfA5w6AIyAfsSuMjp81dP7mkgg==:
   +qwEJ90EQv44m6wmXA0PoGqSZB3KBOYPwCvt0+CIeNmI1qGvIa2tX7TLf6NQ/YdnUz/iBlWPUbUigqEeIAwa2g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874412; x=1796479212; i=w_armin@gmx.de;
	bh=XV+6UqMTzZFyEZk1qZGrj1RrH/w3U08qUJdHA2eca0s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lkZgQIINKlWWKCiRugl8keTuseWPHMOeKZqf8nVd3WHoaGuUa7Z9XkJIRzCSvO7U
	 JtuRzhtRa8lku3x7pnF6pyYsZadKMLGZx0Sw4jo05XxBgvxMQGafJhDw6Tw/IYlC5
	 3b369WsHTSNU8XjODvX9SMDNY3Q+y37yWFFn/PbBycuP6ihtBOVqAFH/yVFPIQsBs
	 FVx3q/acaP0t4Sb5Z8RQ8ecqTffJLCL1WjR+DgCQxFb26LJXZmSN+TSST4PpB3lpJ
	 xj24B67jiHjLS+y8I/LuJmMLlHaKQ6r6eolaw5yB1/gxjaE4JvwSYxWrgn+w8pShF
	 IYkJ4SV9na4PTGZ38A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmGP-1xmu0r2WaX-00TIa8; Sat, 28
 Nov 2026 15:00:12 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 04/10] leds: class: Create "brightness_hw_changed" attribute atomically
Date: Sat, 28 Nov 2026 14:58:41 +0100
Message-ID: <20261128135954.186682-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:RPyf2gBi66RjuT/GI95IfYP3iybb6iHFx4l90/kuU8cAw8h54Sj
 ui/s1qqE25TOAQmuP/kRCKrX4Mq3GS+tnJrxS1hIpE38rF2c9o6eRKJywpYZPWGuBW1tGZ/
 dSPs51SXpXJ05zeVHP+jlras11MKo5pvY158pLpaAZ9oqxoeGXWK40rmHfLwEZIiBfwYXqU
 LFRECNINFFdWV4hcaIBnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:45CXesDRgbM=;CbkBCQs1GBV/XGlpkeRkFzmjus5
 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
 w==

Using device_create_file() might cause userspace applications
listening for uevents to inspect a new LED device before the kernel
has registered all sysfs attributes for it. This might cause those
applications to incorrectly assume that the new LED device does not
support the "brightness_hw_changed" attribute.

Fix this by letting the device core create the sysfs attribute before
the uevent is being send to userspace.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 58 ++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 135905dba47e..00532437cc45 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -17,6 +17,7 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/sysfs.h>
 #include <linux/timer.h>
 #include <uapi/linux/uleds.h>
 #include <linux/of.h>
@@ -101,14 +102,6 @@ static const struct attribute_group led_group =3D {
 	.attrs_const =3D led_class_attrs,
 };
=20
-static const struct attribute_group *const led_groups[] =3D {
-	&led_group,
-#ifdef CONFIG_LEDS_TRIGGERS
-	&led_trigger_group,
-#endif
-	NULL,
-};
-
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
 static ssize_t brightness_hw_changed_show(struct device *dev, const struc=
t device_attribute *attr,
 					  char *buf)
@@ -123,22 +116,48 @@ static ssize_t brightness_hw_changed_show(struct dev=
ice *dev, const struct devic
=20
 static const DEVICE_ATTR_RO(brightness_hw_changed);
=20
-static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
+static const struct attribute *const led_brightness_hw_changed_attrs[] =
=3D {
+	&dev_attr_brightness_hw_changed.attr,
+	NULL,
+};
+
+static umode_t led_brightness_hw_changed_is_visible(struct kobject *kobj,
+						    const struct attribute *attr, int n)
 {
-	struct device *dev =3D led_cdev->dev;
-	int ret;
+	struct device *dev =3D kobj_to_dev(kobj);
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
=20
-	ret =3D device_create_file(dev, &dev_attr_brightness_hw_changed);
-	if (ret) {
-		dev_err(dev, "Error creating brightness_hw_changed\n");
-		return ret;
-	}
+	if (attr =3D=3D &dev_attr_brightness_hw_changed.attr &&
+	    led_cdev->flags & LED_BRIGHT_HW_CHANGED)
+		return attr->mode;
+
+	return 0;
+}
=20
+static const struct attribute_group led_brightness_hw_changed_group =3D {
+	.is_visible_const =3D led_brightness_hw_changed_is_visible,
+	.attrs_const =3D led_brightness_hw_changed_attrs,
+};
+#endif	/* CONFIG_LEDS_BRIGHTNESS_HW_CHANGED */
+
+static const struct attribute_group *const led_groups[] =3D {
+	&led_group,
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+	&led_brightness_hw_changed_group,
+#endif
+#ifdef CONFIG_LEDS_TRIGGERS
+	&led_trigger_group,
+#endif
+	NULL,
+};
+
+#ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
+static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
+{
 	led_cdev->brightness_hw_changed_kn =3D
-		sysfs_get_dirent(dev->kobj.sd, "brightness_hw_changed");
+		sysfs_get_dirent(led_cdev->dev->kobj.sd, "brightness_hw_changed");
 	if (!led_cdev->brightness_hw_changed_kn) {
-		dev_err(dev, "Error getting brightness_hw_changed kn\n");
-		device_remove_file(dev, &dev_attr_brightness_hw_changed);
+		dev_err(led_cdev->dev, "Error getting brightness_hw_changed kn\n");
 		return -ENXIO;
 	}
=20
@@ -148,7 +167,6 @@ static int led_add_brightness_hw_changed(struct led_cl=
assdev *led_cdev)
 static void led_remove_brightness_hw_changed(struct led_classdev *led_cde=
v)
 {
 	sysfs_put(led_cdev->brightness_hw_changed_kn);
-	device_remove_file(led_cdev->dev, &dev_attr_brightness_hw_changed);
 }
=20
 void led_classdev_notify_brightness_hw_changed(struct led_classdev *led_c=
dev, unsigned int brightness)
=2D-=20
2.56.1

