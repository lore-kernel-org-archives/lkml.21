Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874425;
	b=JP6HHUYfyjK709N934vw1t5iApp9GmBZB1djrfKcNK7XhDRR909RIVB+CxNcJyVx8fwR
	 Xmm6EIW67V2qC8/QNxEELUVp+vG95sS+Nha8l0g8cgQSoBVaYdZZiLheKUMQaIN9ojpxJ
	 BC1pLczYNALcRjZ42MAETOUXTSSkNek90onpJFuv19g64EX907q/yNDxnuseyt3O9qTHP
	 3ErfxlwXtBqV1BMUOga3uqZWgxhC1t2fHvdBbQdo6SPK9NR1kVM0PonWufF6g8UaI7D74
	 cfzVO+rMzCVnGwiAMvu2KnUDWo9YpwvIh+h+bLj/zIf17ZiZGygKwa8sU7SYnsNOIOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874425;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=zItjpwIqYnLvgWRqPEApcd8OXg2EoP/IUffLSloh7j0=;
	b=NhwdFxrShAiqbACiXtAIlXWKp9OtGCTC54DzSS40j2bNZr+TT/aYGgb2z7n3QUP78gZS
	 1BhLoOX6KFOm7Q/PqhXXccO+vzhb245EENH9ExmQVAIC2oFMtEKz8B0p7H3GUsPzqpaNO
	 e7sswJFhqUAzbWzkZHMuHPgK98N3vH3wU2GBswHdwdTGVWC8/bw9CV9LUtxPoVhIgUMy5
	 nUm5D0JyErIrSHboHKAhVgkAI+WfrhX7i0v2e/q17lpID0vjO7+bscPpD5BS8FSe6e5bh
	 X2KUznBtB8UgdyjZ+30omvkHF8jzGmTC0OA+9cnRIt4+Ia+DeT14InTBD9qdRbPqRnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VZ5eGLAp;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6D606A687
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C6D606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=VZ5eGLAp
DKIM2-Signature:  i=1; m=1; t=1795874422;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:YAirj6Kzr6AU74kvkIh+ljCgWLaS
   T0tlGQvkzgc+Jdwy3I07fIAMDGLeTZFw0szlBbFB1XKt1XtkK3uuUK4ZCo3YBhMxM4E0T/VIu4d
   T+x2W1Y3w1zDfag1kHYPxDHJAaiuGDEB8KpA+3Jlc/LH5GyheBxRRIuMdpZZl9IqrlPYJP1n2rU
   mnki04AUUDn1hXjeiGY8c0TKWsKePl24+FzDbUjUeb/FXbBPucfzJkulZlInTNBBpYWRoeoBFll
   s0ZaH9PWqPJUhATgpI7RIpj9puP4EBR9PwbKfldhl+4PAdYTqjb9HnAPQIdtpcBbTPmfmWlPdt6
   Hnl64JnzX93ajg==;
Message-Instance:  m=1;
 h=sha256:
   4ytcsuAs36OAxtT2RdxaOGjFvbzl6VfunUOEt56nVrA=:
   RcZv5Jwoo3hTTq1nWgMi30o3t1FRS8m783UQx38lPvY=,
  sha512:
   L1fzvCNbzURhtz3+Eqsz/gzqS2XcVruFVEcAYGWHtZr9w8gVCoMYyfX/QvHAGnovVGLC/2cHzd2cWdKHgjrvYA==:
   +OPvH54dXADFWh9aIimqHDbtPeZG5hCnmAwdDGowZuSYasmA8Ki9ai1D/Mo53iQ5A1wkEdTsi4wdfH4c56eSuA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874422; x=1796479222; i=w_armin@gmx.de;
	bh=zItjpwIqYnLvgWRqPEApcd8OXg2EoP/IUffLSloh7j0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VZ5eGLAptJs9sgzlLiZJyuQtjCZd7WJa+RlYZkDbmz0pSMU62odPf04VWc8H0qIL
	 4mFWHu689H8fDmKdJgci0+pZ/pzS8LWyO/s2rWIDD3MQFYTu5RIYTsJXDxkn/dUBV
	 D8cxlmVl+2b7iubRtzeQVRpC/pc+Ehp3fm105Qpsiz6qR6JGgosGaHiqDdQ3T3Q2F
	 xDvUgd5ahAc6UaikFWQe4VMWe1jVPpAWFmHydQBbFZPIuStKv14HwBbGQpdWwCXfC
	 dW1XFwGoNDneQtR1o7Qnb+zvunWC3vvd6Vfwm/VCkfoM4xrX9xdLKN8muRXxuHEUb
	 xXz+MQmplyQbYVWHOQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1xyDD936QQ-00J95t; Sat, 28
 Nov 2026 15:00:21 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 10/10] leds: multicolor: Adjust maximum subled intensity during initialization
Date: Sat, 28 Nov 2026 14:58:47 +0100
Message-ID: <20261128135954.186682-11-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:OGdwm84Um8TRKbvFeq/8ET46pimdofs7tNbSuIbwrqAoLV/GsQc
 U/rwFoQL19Tyb+ZmkeYl8OYe7ub0Zr4UsP7izP2BSBb0/LI5S+Fx9Nx+KUoboT266KnADUw
 5krmrxMoGhibDCN6Q0nPThEMVrvypj6Nc4IqhQtUbQlS+O4OoxJTenEOaxzr8zLlALEUKwL
 9zg/zXHRRC9hSac94njCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KYq6fZhOqU4=;lzGwZlcoET/OC0XyIK89aWUGi9F
 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
 TLq/e0fwf3YHJViReghHzSA/VvbiRQs=

The maximum brightness of a LED device is fixed after having called
led_classdev_init(), so performing the adjustment during runtime is
no longer necessary.

Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-multicolor.c | 39 +++++++++++------------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 8a74334a801a..5b671daf700d 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -14,24 +14,6 @@
 #include <linux/uaccess.h>
 #include "leds.h"
=20
-static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
-{
-	unsigned int max_intensity;
-
-	/*
-	 * The maximum global brightness value might still be changed by
-	 * led_classdev_register_ext() using devicetree properties. This
-	 * prevents us from changing subled_info[X].max_intensity when
-	 * registering a multicolor LED class device, so we have to do
-	 * this during runtime.
-	 */
-	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
-	if (max_intensity)
-		return max_intensity;
-
-	return mcled_cdev->led_cdev.max_brightness;
-}
-
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness)
 {
@@ -53,12 +35,10 @@ static ssize_t multi_max_intensity_show(struct device =
*dev,
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
-	unsigned int max_intensity;
 	int len =3D 0;
=20
-	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
-		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
-		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		len +=3D sysfs_emit_at(buf, len, "%u", mcled_cdev->subled_info[i].max_i=
ntensity);
 		if (i < mcled_cdev->num_colors - 1)
 			len +=3D sprintf(buf + len, " ");
 	}
@@ -99,8 +79,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 		goto err_out;
 	}
=20
-	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
-		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
 		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_in=
tensity);
 	}
=20
@@ -190,6 +170,17 @@ int led_classdev_multicolor_register_ext(struct devic=
e *parent,
 	if (ret < 0)
 		return ret;
=20
+	/*
+	 * The maximum global brightness value might have been changed by
+	 * led_classdev_init() using devicetree properties. Because of this
+	 * we can only adjust subled_info[X].max_intensity after said function
+	 * was called.
+	 */
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		if (!mcled_cdev->subled_info[i].max_intensity)
+			mcled_cdev->subled_info[i].max_intensity =3D led_cdev->max_brightness;
+	}
+
 	led_cdev->dev->type =3D &led_multicolor_device_type;
=20
 	return led_classdev_add(led_cdev, init_data);
=2D-=20
2.56.1

