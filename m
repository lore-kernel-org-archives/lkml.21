Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874421;
	b=SQiJW/ywT042WSwAMG/lyaMQsUvaAI3PDIXbjCKpLcXTJL2GIc6hKc8YlOYSH91/4Iyf
	 RdsOCW7qCGSkGDR4vNlpevP3PcdGyx53RFayjt6LviutrT7VttQZV+elxGa260q2KZSSv
	 MVKP7xKBX1jStm1P+h6wHkIfHNZEBpY55y96UWdaorygZLjbyW80Rb5jeORPBoWZ+OvoH
	 2RQXno0ahfXTgOni3MUieyFRNBgpfuzUbZqZNXcSxGsj5R5RnHuOW71sVlb16WhUEZ4ba
	 MA0rJPRi+hw2Chv1fraRdRycEtTTQJyhGr0Wl5g+s2PljUbKmb4+XhAqVoZOcXuHXXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874421;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=my9zik4QS4vBiCaZqoBbaNqqBXM+bFHxKa99LLYo9gQ=;
	b=PmhU+Sq1eFDofEapU6W/1lSvNBeismr73qS87Yz+3iPl67LAEhnoeA8PkjzQGoDcEWsk
	 IzdOnnY7TSCSvLQjIxpoFQfyJNeB1bQG3ASBd/4f9alFb+AD7/ET0edmvh2qlPr3w5HYA
	 WRuMQLxzdVMo/7kZgCL0Sq02udYs0vZCQgIiFUaKI/HvAf25z0K1WxbS/EavqGfJbnNc1
	 o4ryWo8iDO2KwCouOaXEXDWl/5aNikg2l7oGvs6DO+OXnaqs7yr9nZotsoDJWOHnaIp6+
	 /5T6NZ7JMzva93huqkFWgwHYcQUtfewdHm8Aps8ddKLB7YveTjyJ1mkZglb1q6J13yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=l45Nf16a;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE140606A33A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE140606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=l45Nf16a
DKIM2-Signature:  i=1; m=1; t=1795874419;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:JLBKBZrLlFRqAXUlxfDyEfGJSIFg
   mmdP3TgShg2fmCWdVutSprEKHKbwpPNEqcjqLRFwwwnzp5r0thyhCTbRpCDsyzKbIZs6Gz7T+8n
   xXaUtBRPq9khvRLXKky+AfYigsMmoyjM4qPKiTvMvN3EDJXBUjue8A4htF/9E/ZAgFDrFb4aGfa
   sse7nmyX3I4e2qUTRvQT+eEhCSN0siEFA41m5/2B+kmQeqRvD/fON/B8atn5YWw2YIgUvO+Uui0
   B5YNf8AMG+5WJ9iMBvQrLrbD+sj+uBR5T5aux97WugO6RpOASW+3mmrQOHcU70mUsc/LJOdmx4N
   fjESkQ1CRBlzKQ==;
Message-Instance:  m=1;
 h=sha256:
   gsq45Oukg7KMq1vt8AvchDzeJHJN0OaQ7lFYj72Ti0o=:
   LcFrg7vHCR+Odf1yjh1WppAO7cM20sSb7xueXesqXHQ=,
  sha512:
   wVvjFk9Xd3h24ULKiKWJvdjSXkGVDBH8mI06sJkky63ZikqiO7FVdCBipoX79tThBda5xUyZ5vvEZxyt0vWLAA==:
   vlX1ibL5dW+HwowMUToYvYqFx2WhsaqELAaeaVuwf/mqgiOBJyzge2qfF7UDTj7qyTmBP4dj2FAhbpSxEZEZlQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874409; x=1796479209; i=w_armin@gmx.de;
	bh=my9zik4QS4vBiCaZqoBbaNqqBXM+bFHxKa99LLYo9gQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=l45Nf16aUXZHwMWhaq5QAXYa6hN7f3+IELbI8W7Ai3ztomfSeqpbk3JIFuNQScap
	 Slmlsjimfv/CSGviSP7tOoQq5fsq8dh955BIKUCTw3KZtoKKkkngKjqawI6MfTrl6
	 H32m71rfElEmdXiCbSPrsWC+9AuALR5ydqj/wdF4upInZlBTJrSepxme1LIwL1PJg
	 pjd4hqSV622Yjvu3ktJ6C6wvB+gJjH2+rTc7+nh7azUklOTzZJGBh2vb/+iDzYW1H
	 XPD/R/QkYqEMGL5eXxu+FmpsjZsr7Hay8FFDH2pYtMzHzQUaWcwWAJcpJ5mDOCvBo
	 olYouzLPYkA8kZwiKg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1ycCvl2MRY-013Xix; Sat, 28
 Nov 2026 15:00:09 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 02/10] leds: multicolor: Constify sysfs attributes
Date: Sat, 28 Nov 2026 14:58:39 +0100
Message-ID: <20261128135954.186682-3-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:9Yohq+6Y79LTmpLkUHptQ0kPa6LLUoHav2S+1xeHo7s64SOVcyL
 xJnb7onezu1QCBUy4uAn0jcIBjJIENiMRkd5FfOVf69/lUsPaeJHFWuEbm8kTgxTNghDQR1
 wtrVCiHH+52i8nwuY0d13mvUnM9My+VGq5W4sZSCmzFlyejmXHUJlZVqsw0lubK1j9WOyIR
 VbTzrGT2bi4ssLOtVts9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Iif0wq6b8ug=;Xb0TwMhcUvQ0w7b/o2Tssl+oAcM
 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
 vlSQqnUstAod1OdThKw==

Mark all sysfs attributes as const to ensure that they are placed
in readonly memory to prevent accidental/malicious modification.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-multicolor.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 59d46f8a90d5..3b49ea56abf7 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/uaccess.h>
=20
 static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
@@ -47,7 +48,7 @@ int led_mc_calc_color_components(struct led_classdev_mc =
*mcled_cdev,
 EXPORT_SYMBOL_GPL(led_mc_calc_color_components);
=20
 static ssize_t multi_max_intensity_show(struct device *dev,
-					struct device_attribute *intensity_attr, char *buf)
+					const struct device_attribute *intensity_attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -64,11 +65,12 @@ static ssize_t multi_max_intensity_show(struct device =
*dev,
 	buf[len++] =3D '\n';
 	return len;
 }
-static DEVICE_ATTR_RO(multi_max_intensity);
+
+static const DEVICE_ATTR_RO(multi_max_intensity);
=20
 static ssize_t multi_intensity_store(struct device *dev,
-				struct device_attribute *intensity_attr,
-				const char *buf, size_t size)
+				     const struct device_attribute *intensity_attr, const char *buf,
+				     size_t size)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -110,8 +112,7 @@ static ssize_t multi_intensity_store(struct device *de=
v,
 }
=20
 static ssize_t multi_intensity_show(struct device *dev,
-			      struct device_attribute *intensity_attr,
-			      char *buf)
+				    const struct device_attribute *intensity_attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -128,11 +129,11 @@ static ssize_t multi_intensity_show(struct device *d=
ev,
 	buf[len++] =3D '\n';
 	return len;
 }
-static DEVICE_ATTR_RW(multi_intensity);
+
+static const DEVICE_ATTR_RW(multi_intensity);
=20
 static ssize_t multi_index_show(struct device *dev,
-			      struct device_attribute *multi_index_attr,
-			      char *buf)
+				const struct device_attribute *multi_index_attr, char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
@@ -150,9 +151,10 @@ static ssize_t multi_index_show(struct device *dev,
 	buf[len++] =3D '\n';
 	return len;
 }
-static DEVICE_ATTR_RO(multi_index);
=20
-static struct attribute *led_multicolor_attrs[] =3D {
+static const DEVICE_ATTR_RO(multi_index);
+
+static const struct attribute *const led_multicolor_attrs[] =3D {
 	&dev_attr_multi_max_intensity.attr,
 	&dev_attr_multi_intensity.attr,
 	&dev_attr_multi_index.attr,
=2D-=20
2.56.1

