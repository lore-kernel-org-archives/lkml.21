Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874422;
	b=UEeiyPmhALNdLwiSKO24wUP04rULDYzIM7Fe1nOFOtEzTauRuPMa/szy5NQVlu0XLWAq
	 xbnpFwfhFBCtZR3J+YsPz9da9/ZTNmJ/Uw5hXmWeb4C2O86OhUjd4ObY/U2cde43n16Nd
	 QJvEJ1hnwhkUEkyZ+xxTozhxQuFLZzjwCdZkRnY1t6xSGDthAo2hukfZWPLwFRhmklcSQ
	 pZQGqlZ0F6waAgc7P5Ehu2j3fb7LwrV8Du+Fj0oPLmNnrspxj/i4nVyw1wF5N2AhESxVI
	 Gk+AUJYaMMX1Cmz4wgojEy024V5ByXnfi+vmGYgHsaGwNSONBR2wt1i/7p71oI0fSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874422;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=sPo8R4zws9Hp1n3hkteJdOEdFUiTQ6Dv2+Z17QWrK0c=;
	b=WvO2l83AA/ijnIuJJtKG/iHC7mIOk74eE3Go71jIVIebpuQRq7gH7rFbEWPtSQEffyF1
	 IuecKX01cxa5AxJtYLVU3udfLcEN2PdErNjMvNm8XUm0ABZcA41OMeqqB3jtNk/ARDKKS
	 VQVrrSUo9TrgycMtzLA+28HSqVTzcMOJp2T7S01DIpu4pvkVAdjsmTT/cyTx2ezolXXES
	 CwM60H6OGzVzqIz+A9y12IEO1dWn/I6sINfNkXxqc3y4UkbqcxzrXoYp1O8e8m/muPVAr
	 mK7osOkhQCEVXmv3AazMHGihUazmLv7F/ohy9O6zU6nnj/Z+j3Uo+tg/biRMCTftV8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=GB2wa+Pg;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B6606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 059B6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=GB2wa+Pg
DKIM2-Signature:  i=1; m=1; t=1795874420;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:XRrY96MoCUgSadXhU6IW12dyF5VV
   cUu+9gzhxwM782VKoM9EpJRV7VVHEqiDhJ2CpOkoEUrroWOx0UDvkv7lFGmTBrXljibUJPl8k8f
   lopxNRhld79QpKEREm8KBKaKLQEhIqK2BucDoNFT/ppOWdn++fn4nPG8LNzwCN5DHKukxIunQ1G
   FCjfJQkc/0HZm3PaDwwfAL7oSe64z6hNWlmdDGYm7mqDGbeqocmvXPFWAYXRdtq5tBhtVPj2Rc0
   28OKHasGWGozReMiOIdRyVCoLBo+rZUujpHISH+Vgkg1Cel5T1DgWyRo3Q+PpDLRZx5/aB58VXE
   2061PKtDEtGKLQ==;
Message-Instance:  m=1;
 h=sha256:
   Ur9qJCS9RhmsqK6qr6kH5HFB/9NOm8mJPqM4d+ZKJDU=:
   PYc43g5evh9UyWNOUH6tL60EhdzCrJrKPGd6CCRJKJ8=,
  sha512:
   jFxQiKo2UFhzhjx+BUV7N3wMI1iiNRAuKWhTkZucRkEd3Fm6DJBQnen2PjjEKxQyYjsewKNssGcTr09wbY8xNg==:
   TokrFPQktEYyBW2jnZP2BDyeXT4DW8LQyv2wQMtBaqRifYI1qqIB8/iicuwny2YMwSkhaI7UWBSDRk0WMdEWKw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874420; x=1796479220; i=w_armin@gmx.de;
	bh=sPo8R4zws9Hp1n3hkteJdOEdFUiTQ6Dv2+Z17QWrK0c=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GB2wa+Pgg0MUGUYaKnYPheJsxvywDKo5y77FxwR4zQGfuBCdiHU2CpvuEJdJCjie
	 GFQpEAUF92etMvLkrpeKN2Y5hzozfOWV2aNxHFG/4aqibj6EK6Ol6skFcTyVEfX+T
	 M86erF4DQQ/mhFfLelFSkCks+riPqqGogrnpzRhcm01eHBkpbprYzJmPX5Nmarrdo
	 PBvixjDWcf4zLP3r727h/P+ZRC6AEmszzZRnf0PpClRNAG5g4eeBEXrzo1lFJQwXX
	 JGQHAyHITybaTjON9kzkT9cOfeIBp2jrKTKoGo81hKPZg3mauWb6DL4z7WT01qB8X
	 0xJ/D+Rzc/z9CjtdwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfHEJ-1y8GPw3krb-00ZWQv; Sat, 28
 Nov 2026 15:00:20 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 09/10] leds: Support custom sysfs groups on multicolor and flash LEDs
Date: Sat, 28 Nov 2026 14:58:46 +0100
Message-ID: <20261128135954.186682-10-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:a9g8LzFPCXqYjrpseCQUSdSEu03sNQ+EkkZ6Is26dkp/PAVp5A+
 RxHzy2NjIwIAms2HhXt53zPO7B3f2zvILQxyeVRLmsBTZrmPmzCIuXImuSqes3uFnc1rtfG
 GTteUzq+siDjD76M0wfGVmkFfxIKDzXCFah9bFYflCIUMkWmeF7DC1t6kqg5ck4+oPPdlEH
 bzx7o6pCKdsF608xoH0eA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pDCciNWSk+U=;lwUYqYOvFV8LrTvP8W8TTJZ48eh
 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
 XZExre8PYaJT/YEGzhnfsM=

Drivers registering multicolor/flash LEDs currently cannot use
led_cdev->groups due to said field being overwritten by the
multicolor/flash LED registration functions. Fix this by assigning
each LED type a separate device type ("multicolor" and "flash")
that carries the sysfs attributes instead.

Also assign a device type for standard LEDs ("standard") for symmetry.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-flash.c      | 107 +++++++++++++---------------
 drivers/leds/led-class-multicolor.c |  15 +++-
 drivers/leds/led-class.c            |   6 ++
 include/linux/led-class-flash.h     |   5 --
 4 files changed, 68 insertions(+), 65 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash=
.c
index b96d4906b66b..214531683ab7 100644
=2D-- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
+#include "leds.h"
=20
 #define has_flash_op(fled_cdev, op)				\
 	(fled_cdev && fled_cdev->ops->op)
@@ -213,42 +214,56 @@ static ssize_t flash_fault_show(struct device *dev, =
const struct device_attribut
=20
 static const DEVICE_ATTR_RO(flash_fault);
=20
-static const struct attribute *const led_flash_strobe_attrs[] =3D {
+static const struct attribute *const led_flash_attrs[] =3D {
 	&dev_attr_flash_strobe.attr,
-	NULL,
-};
-
-static const struct attribute *const led_flash_timeout_attrs[] =3D {
 	&dev_attr_flash_timeout.attr,
 	&dev_attr_max_flash_timeout.attr,
-	NULL,
-};
-
-static const struct attribute *const led_flash_brightness_attrs[] =3D {
 	&dev_attr_flash_brightness.attr,
 	&dev_attr_max_flash_brightness.attr,
-	NULL,
-};
-
-static const struct attribute *const led_flash_fault_attrs[] =3D {
 	&dev_attr_flash_fault.attr,
 	NULL,
 };
=20
-static const struct attribute_group led_flash_strobe_group =3D {
-	.attrs_const =3D led_flash_strobe_attrs,
-};
+static umode_t led_flash_is_visible(struct kobject *kobj, const struct at=
tribute *attr, int n)
+{
+	struct device *dev =3D kobj_to_dev(kobj);
+	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
+
+	if (attr =3D=3D &dev_attr_flash_strobe.attr)
+		return attr->mode;
+
+	if (attr =3D=3D &dev_attr_flash_timeout.attr && fled_cdev->ops->timeout_=
set)
+		return attr->mode;
=20
-static const struct attribute_group led_flash_timeout_group =3D {
-	.attrs_const =3D led_flash_timeout_attrs,
+	if (attr =3D=3D &dev_attr_max_flash_timeout.attr && fled_cdev->ops->time=
out_set)
+		return attr->mode;
+
+	if (attr =3D=3D &dev_attr_flash_brightness.attr && fled_cdev->ops->flash=
_brightness_set)
+		return attr->mode;
+
+	if (attr =3D=3D &dev_attr_max_flash_brightness.attr && fled_cdev->ops->f=
lash_brightness_set)
+		return attr->mode;
+
+	if (attr =3D=3D &dev_attr_flash_fault.attr && fled_cdev->ops->fault_get)
+		return attr->mode;
+
+	return 0;
+}
+
+static const struct attribute_group led_flash_group =3D {
+	.is_visible_const =3D led_flash_is_visible,
+	.attrs_const =3D led_flash_attrs,
 };
=20
-static const struct attribute_group led_flash_brightness_group =3D {
-	.attrs_const =3D led_flash_brightness_attrs,
+static const struct attribute_group *led_flash_groups[] =3D {
+	&led_flash_group,
+	NULL,
 };
=20
-static const struct attribute_group led_flash_fault_group =3D {
-	.attrs_const =3D led_flash_fault_attrs,
+static const struct device_type led_flash_device_type =3D {
+	.name =3D "flash",
+	.groups =3D led_flash_groups,
 };
=20
 static void led_flash_resume(struct led_classdev *led_cdev)
@@ -260,30 +275,6 @@ static void led_flash_resume(struct led_classdev *led=
_cdev)
 	call_flash_op(fled_cdev, timeout_set, fled_cdev->timeout.val);
 }
=20
-static void led_flash_init_sysfs_groups(struct led_classdev_flash *fled_c=
dev)
-{
-	struct led_classdev *led_cdev =3D &fled_cdev->led_cdev;
-	const struct led_flash_ops *ops =3D fled_cdev->ops;
-	const struct attribute_group **flash_groups =3D fled_cdev->sysfs_groups;
-
-	int num_sysfs_groups =3D 0;
-
-	flash_groups[num_sysfs_groups++] =3D &led_flash_strobe_group;
-
-	if (ops->flash_brightness_set)
-		flash_groups[num_sysfs_groups++] =3D &led_flash_brightness_group;
-
-	if (ops->timeout_set)
-		flash_groups[num_sysfs_groups++] =3D &led_flash_timeout_group;
-
-	if (ops->fault_get)
-		flash_groups[num_sysfs_groups++] =3D &led_flash_fault_group;
-
-	flash_groups[num_sysfs_groups] =3D NULL;
-
-	led_cdev->groups =3D flash_groups;
-}
-
 int led_classdev_flash_register_ext(struct device *parent,
 				    struct led_classdev_flash *fled_cdev,
 				    struct led_init_data *init_data)
@@ -297,26 +288,26 @@ int led_classdev_flash_register_ext(struct device *p=
arent,
=20
 	led_cdev =3D &fled_cdev->led_cdev;
=20
-	if (led_cdev->flags & LED_DEV_CAP_FLASH) {
-		if (!led_cdev->brightness_set_blocking)
-			return -EINVAL;
+	if (!(led_cdev->flags & LED_DEV_CAP_FLASH))
+		return led_classdev_register_ext(parent, led_cdev, init_data);
=20
-		ops =3D fled_cdev->ops;
-		if (!ops || !ops->strobe_set)
-			return -EINVAL;
+	if (!led_cdev->brightness_set_blocking)
+		return -EINVAL;
=20
-		led_cdev->flash_resume =3D led_flash_resume;
+	ops =3D fled_cdev->ops;
+	if (!ops || !ops->strobe_set)
+		return -EINVAL;
=20
-		/* Select the sysfs attributes to be created for the device */
-		led_flash_init_sysfs_groups(fled_cdev);
-	}
+	led_cdev->flash_resume =3D led_flash_resume;
=20
 	/* Register led class device */
-	ret =3D led_classdev_register_ext(parent, led_cdev, init_data);
+	ret =3D led_classdev_init(parent, led_cdev, init_data);
 	if (ret < 0)
 		return ret;
=20
-	return 0;
+	led_cdev->dev->type =3D &led_flash_device_type;
+
+	return led_classdev_add(led_cdev, init_data);
 }
 EXPORT_SYMBOL_GPL(led_classdev_flash_register_ext);
=20
diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 3b49ea56abf7..8a74334a801a 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -12,6 +12,7 @@
 #include <linux/slab.h>
 #include <linux/sysfs.h>
 #include <linux/uaccess.h>
+#include "leds.h"
=20
 static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
 {
@@ -162,11 +163,17 @@ static const struct attribute *const led_multicolor_=
attrs[] =3D {
 };
 ATTRIBUTE_GROUPS(led_multicolor);
=20
+static const struct device_type led_multicolor_device_type =3D {
+	.name =3D "multicolor",
+	.groups =3D led_multicolor_groups,
+};
+
 int led_classdev_multicolor_register_ext(struct device *parent,
 				     struct led_classdev_mc *mcled_cdev,
 				     struct led_init_data *init_data)
 {
 	struct led_classdev *led_cdev;
+	int ret;
=20
 	if (!mcled_cdev)
 		return -EINVAL;
@@ -179,9 +186,13 @@ int led_classdev_multicolor_register_ext(struct devic=
e *parent,
=20
 	led_cdev =3D &mcled_cdev->led_cdev;
 	led_cdev->flags |=3D LED_MULTI_COLOR;
-	mcled_cdev->led_cdev.groups =3D led_multicolor_groups;
+	ret =3D led_classdev_init(parent, led_cdev, init_data);
+	if (ret < 0)
+		return ret;
+
+	led_cdev->dev->type =3D &led_multicolor_device_type;
=20
-	return led_classdev_register_ext(parent, led_cdev, init_data);
+	return led_classdev_add(led_cdev, init_data);
 }
 EXPORT_SYMBOL_GPL(led_classdev_multicolor_register_ext);
=20
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index b9de9cebdc11..7577f0b682e3 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -654,6 +654,10 @@ int led_classdev_add(struct led_classdev *led_cdev, s=
truct led_init_data *init_d
 }
 EXPORT_SYMBOL_GPL(led_classdev_add);
=20
+static const struct device_type led_device_type =3D {
+	.name =3D "standard",
+};
+
 /**
  * led_classdev_register_ext - register a new object of led_classdev clas=
s
  *                             with init data.
@@ -672,6 +676,8 @@ int led_classdev_register_ext(struct device *parent,
 	if (ret)
 		return ret;
=20
+	led_cdev->dev->type =3D &led_device_type;
+
 	return led_classdev_add(led_cdev, init_data);
 }
 EXPORT_SYMBOL_GPL(led_classdev_register_ext);
diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-fla=
sh.h
index 775a96217518..5204ef60dc4b 100644
=2D-- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -28,8 +28,6 @@ struct led_classdev_flash;
 #define LED_FAULT_LED_OVER_TEMPERATURE	(1 << 8)
 #define LED_NUM_FLASH_FAULTS		9
=20
-#define LED_FLASH_SYSFS_GROUPS_SIZE	5
-
 struct led_flash_ops {
 	/* set flash brightness */
 	int (*flash_brightness_set)(struct led_classdev_flash *fled_cdev,
@@ -79,9 +77,6 @@ struct led_classdev_flash {
=20
 	/* flash timeout value in microseconds along with its constraints */
 	struct led_flash_setting duration;
-
-	/* LED Flash class sysfs groups */
-	const struct attribute_group *sysfs_groups[LED_FLASH_SYSFS_GROUPS_SIZE];
 };
=20
 static inline struct led_classdev_flash *lcdev_to_flcdev(
=2D-=20
2.56.1

