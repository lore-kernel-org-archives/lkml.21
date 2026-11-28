Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874410;
	b=szPtWxcQWiqxVPVr9/IxlmGkDCbQ0o6iNpnE6aX/Pd0NTNA4PSAOtpB1WuyBx3TZFkQ3
	 Wdt3A45AovDxmCmYJO8E8UyiFSdwCweO4Sxn+fwaX0XjtPdySAvZj6L8Z4n+ZZirEKV38
	 AYIzZk2HLaaz1nZXf5KIE/H9NYx4EnfEJ6mdSwy+5l5x9X74VZ04wmZSjMYrCiLLoSxqa
	 zZaqwQkgZUGejdmYU6GIyKdsiPHtJQyTft22VYrXwFZ1yAyXx5iYeXin1/xLmTAtImwwJ
	 YlL62y/+6zUTGWKyVemE5Ohy3oCUIpaozqCfLNXCQwZPH7xSEWmz0fbJOMbPdXkqP8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874410;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=jc/nZg4Xa4u9usngxx+sw2KxbyM/tJVcAahN+7+9zyU=;
	b=sX3iKsitQLKuJ689ec0xM2zF/JCpaq8hB8XeQO3QjaZN7RjFzfB7N5goUXzA3HDGxqfs
	 SvhpO3jc0obr1yyZ+PxzDrAsh2ACvge5T+07wQtMFpR+NVBRPvh7AM0TZo8kKDA6Dt0Z4
	 HZg0YuyWWyXPBFop6GGblrKfAGcDarT0ceXXlqVa4F47yMPZW0XdNqlz8Ut4+sxRvRBSB
	 aE+jNJe7n4qjZXzZpFzvV5sK0w+w8enYOUPW/Ecsq6n7A07jlZU+bMDFh7Ns9tLAYcdO8
	 uphSwSWnySqPylNXdclXq77ysHOnwOcTQdpYy7NP/Y5IPk4HLBUFN7aWuPQKUeDUuzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=OvwFsMoy;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE70A606A325
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE70A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=OvwFsMoy
DKIM2-Signature:  i=1; m=1; t=1795874408;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:JYSWDFt7lEPLSJNobDTbMHwHSjYf
   Ahy8O2ZWNH+rTrTI3MBPYLiC6bCqe8QjbqwnozsKo15+L3/+SyCjeZilZLjglQOiE+K4lS4jaK+
   Zb65hQlPZ3fZPybMV6y4npG4pJwaCFU7RNid6AjHRSGWLmbRc/gDayYARDmGjxuGjGUTyb7SJoF
   yjqMzqhgR2vF0+jUox+58ufss6epGtwwmGJtZwaCRX+bsTAmzF8gRkV76aydxavjw8BXrismxwD
   sm5pTvSpIeWasfBwCyY6F+qWtkFF1UZx763YIFlz2AoyhkVpX6Wv1VvGtsCGpnK+I8pvZokT6i/
   PtFUOIH46N2BYQ==;
Message-Instance:  m=1;
 h=sha256:
   uYpptqPUf1t/tOEIlqfJ1l69rfHou9x33VBrU/uV0BA=:
   Z1xmyzSn7zLCJB+BxH/7Yb8IGFShHS0hgcAWVbRHje4=,
  sha512:
   0zfKRdS+cmkTNzRNsDZs2BznbMxwYnDZylC84N9MP9beq8+rx8gwYohFtBW3fiyG/OztDulnHan/YqaLegOWlg==:
   0G2ajrujA1jypYNeESKRJB+cHtcl10jIPdoHRiJ1wwV4geVz96ZRO1E8FXtXiKNDRcipZGYz9O3e/Amo9ykEwA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874408; x=1796479208; i=w_armin@gmx.de;
	bh=jc/nZg4Xa4u9usngxx+sw2KxbyM/tJVcAahN+7+9zyU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OvwFsMoygQTlwWS0/sUfq5gfNKRRcPMlTeLomzhtXMpOXMqntmViHX3goyhaM+rk
	 sSRC6b1wM1Ta8BsgZ4RfBiH44hDpKPBJ0EuHylA9kTNM0KvC6W6P/FgyaNL3TO87F
	 jy7I99e1GM7XfOts9hlEhatq70v/OJvIggxBbLb9AOYFp/uLfIQ8AVugHRW8KRcqm
	 f5c39t3VpzNZ8iDnJQLTXennkP61tkFXO8bpeO7ddEPTwyffCfPn1Iy/OtB+vn3SY
	 8I1TPvX9wk6TFgKu2o5O/y/81Zh/posQXtHET6Q7+2B7e5A9xOjZu9ERMASb1eO98
	 faACgC8R1pPJ29hzDw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNt0C-1xr0cZ315s-00XzdL; Sat, 28
 Nov 2026 15:00:07 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 01/10] leds: class: Constify sysfs attributes
Date: Sat, 28 Nov 2026 14:58:38 +0100
Message-ID: <20261128135954.186682-2-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:UK3cEpJzY3B8REIbWyXQFjjD6Q1S6JjX0JV4C0rAejpLnqauy6B
 8NOrcd4caKNpE6e4gwKKUZ+gCzLnR6l2eOHRQVavZ80N02Ipfqe8krZrboLJB+cVLA6yccN
 THlDxVaAcrah2kZ6QNaz8SQB2x82crCgAkPVfSsDQEwfKx1ZPGeW4rlrFz2zTTjlHUgZCgB
 q6NlsMMzy/Ld8vEMlWWNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Uh4Sn8AnZJQ=;lsYRNQ9W4B77BYJ6rHHIkRt40tq
 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
 4K3vg0lxLRnuGhasMkOwE=

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index c8529003dbe1..135905dba47e 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -27,8 +27,7 @@ static LIST_HEAD(leds_lookup_list);
=20
 static struct workqueue_struct *leds_wq;
=20
-static ssize_t brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t brightness_show(struct device *dev, const struct device_at=
tribute *attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned int brightness;
@@ -44,8 +43,8 @@ static ssize_t brightness_show(struct device *dev,
 	return sysfs_emit(buf, "%u\n", brightness);
 }
=20
-static ssize_t brightness_store(struct device *dev,
-		struct device_attribute *attr, const char *buf, size_t size)
+static ssize_t brightness_store(struct device *dev, const struct device_a=
ttribute *attr,
+				const char *buf, size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned long state;
@@ -74,10 +73,11 @@ static ssize_t brightness_store(struct device *dev,
 	mutex_unlock(&led_cdev->led_access);
 	return ret;
 }
-static DEVICE_ATTR_RW(brightness);
=20
-static ssize_t max_brightness_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static const DEVICE_ATTR_RW(brightness);
+
+static ssize_t max_brightness_show(struct device *dev, const struct devic=
e_attribute *attr,
+				   char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	unsigned int max_brightness;
@@ -88,19 +88,20 @@ static ssize_t max_brightness_show(struct device *dev,
=20
 	return sysfs_emit(buf, "%u\n", max_brightness);
 }
-static DEVICE_ATTR_RO(max_brightness);
=20
-static struct attribute *led_class_attrs[] =3D {
+static const DEVICE_ATTR_RO(max_brightness);
+
+static const struct attribute *const led_class_attrs[] =3D {
 	&dev_attr_brightness.attr,
 	&dev_attr_max_brightness.attr,
 	NULL,
 };
=20
 static const struct attribute_group led_group =3D {
-	.attrs =3D led_class_attrs,
+	.attrs_const =3D led_class_attrs,
 };
=20
-static const struct attribute_group *led_groups[] =3D {
+static const struct attribute_group *const led_groups[] =3D {
 	&led_group,
 #ifdef CONFIG_LEDS_TRIGGERS
 	&led_trigger_group,
@@ -109,8 +110,8 @@ static const struct attribute_group *led_groups[] =3D =
{
 };
=20
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-static ssize_t brightness_hw_changed_show(struct device *dev,
-		struct device_attribute *attr, char *buf)
+static ssize_t brightness_hw_changed_show(struct device *dev, const struc=
t device_attribute *attr,
+					  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
=20
@@ -120,7 +121,7 @@ static ssize_t brightness_hw_changed_show(struct devic=
e *dev,
 	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
 }
=20
-static DEVICE_ATTR_RO(brightness_hw_changed);
+static const DEVICE_ATTR_RO(brightness_hw_changed);
=20
 static int led_add_brightness_hw_changed(struct led_classdev *led_cdev)
 {
=2D-=20
2.56.1

