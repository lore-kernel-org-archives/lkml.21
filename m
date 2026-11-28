Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874421;
	b=kXwphHgAI9ZCkmWQnDhI4AHtW6LyqtVaSY1FonusS0sOcJTgpneVFT3NhMTtiptNwdx0
	 cT4/UbqtugljDpWx4Wqq4F0d4k/jX/xoG2w4e1NPy9UBA/bcMzXO8flPqQLa19DOHAo2a
	 KexCNKyaPs78+WOMdt7OoGs1RRBISveODKwebIdKgeVlzsir74iQ34rFEjD3jPYsxK0Nj
	 M9njhTDiUkZkaRFik85W304RiQfrp0g0F/P/78oWJ4Po377l6tAResvh3wPL44aLw7KtM
	 omNv9QugWcg9YaW1gB0F3VvXmka/Ag5e+tvyReseQx3w7ijvy1gNsH4JYB9V0HJ4b2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874421;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=N0jbrFHUp5gflqIFygPq0+v4PrInYVOfPjI7RbtxTPQ=;
	b=v/y2QAHPkI7Ra6vQg6pe2nsG88xrySl5/5YqvZpuwJ5evAph1+g2d5ziKxVQUuRyXFgn
	 NX5hPIuTWccBmOYk/O6EfWq8q46G2XXTP8RpzBVo6SXOgh/u4YSGBTDW0nRMqyykkc4xN
	 GkOvzVmZ60fGR7AQR7g53MSZHowfXU98aeB9gIrhzF7C3OdX+QbfftB59h3xRfM/NNuex
	 QnVta83L7JDmll+Lo7sqcxTmM//IWMb6eHcI63aWziM7zCSaK0hJD9m1NVDRusnRd+Zos
	 XVEEuSLpghV1uNg9HU/lMk3uQmkL1vNLifmY2UeROzxvE7bDuP0rKkl6nNaOJrGitXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oDkVmMJU;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51F9606A68B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51F9606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=oDkVmMJU
DKIM2-Signature:  i=1; m=1; t=1795874418;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:kpoXX/K7ji5HZ++b/xFu+1YPYPHQ
   2fJkg19j8eKCGRxYcNjFP1rqzuo9l/v7ZbGP/Vw/Dm7lHS9qFTyNQwzz0XMHGEdPziFu1GPB0Z6
   i+bFuLzLhGx9s7UY/GGpDqel9BOHvfhk5kdlK/grhsJlJQSiKSur1uDmTHNUa3Bx/Y9nkONC82s
   PjVW4MMcymOsbfp4OC8XrAphNI97NIBZPxD44mRm3gLfvB2LLRW+nqCDPg9VGxtu/WtqX/XfGUz
   2ypoW1mZrSE6giaPcsITMo77KrQ+7+2rULfqD1fgZ1L+WYQo+2EKFXPp8JbnsrmpUnIneBNE0IA
   Tgj0IJGXtlF+lA==;
Message-Instance:  m=1;
 h=sha256:
   bFmlJXdMnSOPj6vLHpNtq4vpDOgMkk9I8biNYPDvqjg=:
   YOVte6OTqVgkn+Qq+UBPDTLP3U5PahCtuT9lW0Hu9yE=,
  sha512:
   peY9lENY15kLrB66sX1+bwiKil8IpX81YbyXWwRoexeeFGMPYtXMEsPbdc1cWm6GFFwxUr/o52+ytfbVjEemwA==:
   g7g9aadNumuHlTIJN8RwsMk91XIGonqCiqq/5Np8eMPyTZjgI93MZNQtmt8OYU5Avd76E4OVsre+SU8PRwANcw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874411; x=1796479211; i=w_armin@gmx.de;
	bh=N0jbrFHUp5gflqIFygPq0+v4PrInYVOfPjI7RbtxTPQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oDkVmMJU5GYBJX4ugnpvgXMlNY08N/QJ2b4sMeYsY/4aVKcfLRFb6KCeZkrFveYV
	 U5pIHDCY5hF5Drs5KNhT5Zn402MsDykJ4hVHgnXqXvFI3Y3UDCbjCS/CC3S2T4OKW
	 6hkVTklnLtx+n+OzRm2z0LPVJTX9tFzWRjKTJHTQFGCp0JJN0bZdT+5y63o48Wt7l
	 s4kA3Dmek5YitBXHwjVBL2v7Ati0DL50AIWJnNAyksAdVtX42LcagIxJYIpiKiBLn
	 ulen/VeI36suXFOa0Vo8A2Wwexj47dEfAtjDpQZ2SUOSPxdD54GWfdHK0b1lNt93J
	 h3FYfYEvDm7+Nh/Mig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKsj7-1xnzwU0ohR-00UOps; Sat, 28
 Nov 2026 15:00:11 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 03/10] leds: flash: Constify sysfs attributes
Date: Sat, 28 Nov 2026 14:58:40 +0100
Message-ID: <20261128135954.186682-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:PAkCGOgMyi7UIjAyvEPORq9CCZDUByL5+4ouqDbOokuFFIAytNU
 lltWxAbD/pqHeuRohK8+FvMJ4Vet3+Z2mQT4CcPIPEWKMUl6TBzeyeBkUs7sHY9vMIZxtFz
 /oDP8Ud3OEitDYKYHjGdCy3ltNzqDEWBwIpTBgBk8oK3GIS9VRmLVZTMDBljIvVe3lhfHRJ
 dXhocV2MpcPnXLmkzXs9A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TT0sKZJYJIk=;YjPRt7rANHqKhKHpgf7ja1vLWl1
 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

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-flash.c | 68 ++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash=
.c
index b641788c5a28..b96d4906b66b 100644
=2D-- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -12,6 +12,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
=20
 #define has_flash_op(fled_cdev, op)				\
 	(fled_cdev && fled_cdev->ops->op)
@@ -34,7 +35,8 @@ static const char * const led_flash_fault_names[] =3D {
 };
=20
 static ssize_t flash_brightness_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+				      const struct device_attribute *attr, const char *buf,
+				      size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -62,8 +64,8 @@ static ssize_t flash_brightness_store(struct device *dev=
,
 	return ret;
 }
=20
-static ssize_t flash_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_brightness_show(struct device *dev, const struct dev=
ice_attribute *attr,
+				     char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -73,20 +75,22 @@ static ssize_t flash_brightness_show(struct device *de=
v,
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.val);
 }
-static DEVICE_ATTR_RW(flash_brightness);
=20
-static ssize_t max_flash_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static const DEVICE_ATTR_RW(flash_brightness);
+
+static ssize_t max_flash_brightness_show(struct device *dev, const struct=
 device_attribute *attr,
+					 char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.max);
 }
-static DEVICE_ATTR_RO(max_flash_brightness);
=20
-static ssize_t flash_strobe_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static const DEVICE_ATTR_RO(max_flash_brightness);
+
+static ssize_t flash_strobe_store(struct device *dev, const struct device=
_attribute *attr,
+				  const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -116,8 +120,7 @@ static ssize_t flash_strobe_store(struct device *dev,
 	return ret;
 }
=20
-static ssize_t flash_strobe_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_strobe_show(struct device *dev, const struct device_=
attribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -131,10 +134,11 @@ static ssize_t flash_strobe_show(struct device *dev,
=20
 	return sysfs_emit(buf, "%u\n", state);
 }
-static DEVICE_ATTR_RW(flash_strobe);
=20
-static ssize_t flash_timeout_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static const DEVICE_ATTR_RW(flash_strobe);
+
+static ssize_t flash_timeout_store(struct device *dev, const struct devic=
e_attribute *attr,
+				   const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -162,28 +166,29 @@ static ssize_t flash_timeout_store(struct device *de=
v,
 	return ret;
 }
=20
-static ssize_t flash_timeout_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t flash_timeout_show(struct device *dev, const struct device=
_attribute *attr,
+				  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.val);
 }
-static DEVICE_ATTR_RW(flash_timeout);
=20
-static ssize_t max_flash_timeout_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static const DEVICE_ATTR_RW(flash_timeout);
+
+static ssize_t max_flash_timeout_show(struct device *dev, const struct de=
vice_attribute *attr,
+				      char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
=20
 	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.max);
 }
-static DEVICE_ATTR_RO(max_flash_timeout);
=20
-static ssize_t flash_fault_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static const DEVICE_ATTR_RO(max_flash_timeout);
+
+static ssize_t flash_fault_show(struct device *dev, const struct device_a=
ttribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev =3D lcdev_to_flcdev(led_cdev);
@@ -205,44 +210,45 @@ static ssize_t flash_fault_show(struct device *dev,
 	ret +=3D sysfs_emit_at(buf, ret, "\n");
 	return ret;
 }
-static DEVICE_ATTR_RO(flash_fault);
=20
-static struct attribute *led_flash_strobe_attrs[] =3D {
+static const DEVICE_ATTR_RO(flash_fault);
+
+static const struct attribute *const led_flash_strobe_attrs[] =3D {
 	&dev_attr_flash_strobe.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_timeout_attrs[] =3D {
+static const struct attribute *const led_flash_timeout_attrs[] =3D {
 	&dev_attr_flash_timeout.attr,
 	&dev_attr_max_flash_timeout.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_brightness_attrs[] =3D {
+static const struct attribute *const led_flash_brightness_attrs[] =3D {
 	&dev_attr_flash_brightness.attr,
 	&dev_attr_max_flash_brightness.attr,
 	NULL,
 };
=20
-static struct attribute *led_flash_fault_attrs[] =3D {
+static const struct attribute *const led_flash_fault_attrs[] =3D {
 	&dev_attr_flash_fault.attr,
 	NULL,
 };
=20
 static const struct attribute_group led_flash_strobe_group =3D {
-	.attrs =3D led_flash_strobe_attrs,
+	.attrs_const =3D led_flash_strobe_attrs,
 };
=20
 static const struct attribute_group led_flash_timeout_group =3D {
-	.attrs =3D led_flash_timeout_attrs,
+	.attrs_const =3D led_flash_timeout_attrs,
 };
=20
 static const struct attribute_group led_flash_brightness_group =3D {
-	.attrs =3D led_flash_brightness_attrs,
+	.attrs_const =3D led_flash_brightness_attrs,
 };
=20
 static const struct attribute_group led_flash_fault_group =3D {
-	.attrs =3D led_flash_fault_attrs,
+	.attrs_const =3D led_flash_fault_attrs,
 };
=20
 static void led_flash_resume(struct led_classdev *led_cdev)
=2D-=20
2.56.1

