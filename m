Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874418;
	b=bBPZwOFax6KZzFtMDJOxPEOdACzYrYuESkCBDayPC2yDFUc2rWls2GqDmZcwc6VqEMsi
	 JkGrFQqZLC5uS8G19ZZLF5m099DvxWtV1AauotTq+H3lAufEnKR19jcPFrqvVVfhUiiaF
	 rUY9APgWfT2Xi4f5wNyioogon/JQclmZK1D+db5Ksmd9a+6wLpxZlXIGgx/OZ4kmjI1jf
	 i2bKMVpuTXYGddNiQHs4HxRHMGHREM46DKBqJzNk39ZC7pMK+bZfxeXLzfeBZ0ctAYiKa
	 O0fu9J6Y4WgK10OuFrcZwjpCqpsqHO7N6ejM0GB56iZ92TuR54k4YhSl8XfhgaBHeXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874418;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=rEd6ion/78TYJ5iAkFBq9t9/Goklvx88WBBIR/kJhrM=;
	b=FQBmn4JZoRkKnFLgyWZRsSV91foxElKYNPd+3B3sZY89+yqVAqKOmFvCxxt2LcbU9JYb
	 wBxv7xSGxM9eyefTNJiB+whwQV2vniAkE7csprchYxc/ZbRWC6lwDL1ldpYjKDnIuowv6
	 A7l2zyDU1cb7oIeDbnVdenassMWSXNfAByc2NLCEcqyMx1j9XHLfWWyfXxyXPHVQFyIFu
	 dxL36004IzpUbGsJFdjwKi7W9+YMMaQyZu7iUQ8nZU9+vckjWaT6CYAwwuNOV/IhAJkb7
	 SeGloDd9ObIAhn4n81H46UgZwD247k62+8cNLjOgBCYuJKnd0qx/ruKbmkcqMoNQkSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=PYs6kk2V;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD52606A325
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CD52606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=PYs6kk2V
DKIM2-Signature:  i=1; m=1; t=1795874415;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.de;
 s=s31663417:rsa-sha256:gV2WBEbPl2i+NTkqk3LzkffEKBSj
   dkjTkobdyMSvSEaW6Ll0xc4H1hvbzYf2A/UVEmqymNkDbTvsgZpmfFNWcOTzToa7kdHG7ItrcWl
   nhpw6ieEz3cj7B3zHFr0AqZiYfPWWEXr2sJdY1dNZug/bzYVl7NSKLawxC3wwlrzUeO8bQR7eq8
   CpmfwbX2AAX9Ep9YhLws0wZjQQpWmvaxETFNKy3Scx6Kz71kqMN246vFqHcLyKufx7jyWywZwP8
   NN7uPZsV81hbNTg1i75Asj6WyxlBP40cfNrhJXA2Sjfa/QYeGoa4PCeyyx+4kUqMY8OHDO40IiZ
   SEl1jsxlLuTx0w==;
Message-Instance:  m=1;
 h=sha256:
   88PfOBZoUqTnZ1bKy/EwyI4t/MVDoN2ezfqL5vwghgU=:
   reCY6ZM5vww9OFnlNu4n5p3ia2TpUJ7VolOc62l2/V0=,
  sha512:
   PnswLbCka70JYhtaujsRY6f+A2YBz3p02JIeCUWr2iVXLw7s2pWHOprQZ6NEyQxJjB/6nPCeKZlJ0AmqdL+y3g==:
   T1E4DCBKcw5/GQAoTPQG1lWgIYxJ7Iqw3gZH0//a/TKqy4k1Wcr4lM/Zd19xrMWGdxwgwpNMyfMt99FSCVoFxg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795874415; x=1796479215; i=w_armin@gmx.de;
	bh=rEd6ion/78TYJ5iAkFBq9t9/Goklvx88WBBIR/kJhrM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=PYs6kk2V94kLWIQ8IGDF6IYNGfdhLJsQg6ZKt80oiBxOTRqdc5U+lYA5r7qxWdEA
	 qitbO9ft/Icm9IuW0kf6j6kyfRS+YCSmFnjg1DifrEvxJ+Ums2hO7z2fWU/XVESLh
	 gTq30N4WSBRTWMBw2nb3un2XuJ0mU8omcImSo8ZUrW4dOK7NWFB6Y8/6Lfrad9/bo
	 C5nXEe6wegj4FLDeKzrOXb0NR9PE30X5xBRhzk0ULwCsQ4PBWUk/6I797mgE92crv
	 LnTm+O431OaAcQoFh3IP+UgAbn0Kpb7rM1hqHVYGtsSd7w8RX9r/HBJh+bRBAvTml
	 hO2unJU+4e5gKHEuSQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1yRj5B0LEQ-00t897; Sat, 28
 Nov 2026 15:00:15 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v4 06/10] leds: class: Access brightness_hw_changed exactly once
Date: Sat, 28 Nov 2026 14:58:43 +0100
Message-ID: <20261128135954.186682-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:YBG1FkdjiYgAyrGtNZ/zdCYWRvYhWL0fdWuosMj3SwOPHwq66Kk
 USituuQPFvbUg3tdwmGH360RKNjTcsDIjObXDaZD12Yu7k9PnYzlOxQNgEZQtPWVrx+vYpf
 OUw62/u5XYNEKJSUpgaXzpM+vshN/ofd8ADS6ECduJn+Qcm23KCtUX93IY/UOox0i1n+uRi
 mV9GMp6gEopHlzbbcz6Aw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CQFUk1BzSWw=;ACSZLCs5rjBBl/8Wwv8CtoFkMp8
 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

Reading the brightness_hw_changed field needs to take care against
concurrent writes by led_classdev_notify_brightness_hw_changed().
Use WRITE_ONCE()/READ_ONCE() to ensure that the value does not get
corrupted by concurrent writes.

Fixes: 0cb8eb30d425 ("leds: class: Add new optional brightness_hw_changed =
attribute")
Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index fa9803e2ae6d..8494a1ca0353 100644
=2D-- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -102,11 +102,13 @@ static ssize_t brightness_hw_changed_show(struct dev=
ice *dev, const struct devic
 					  char *buf)
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
+	unsigned int brightness_hw_changed;
=20
-	if (led_cdev->brightness_hw_changed =3D=3D -1)
+	brightness_hw_changed =3D READ_ONCE(led_cdev->brightness_hw_changed);
+	if (brightness_hw_changed =3D=3D -1)
 		return -ENODATA;
=20
-	return sysfs_emit(buf, "%u\n", led_cdev->brightness_hw_changed);
+	return sysfs_emit(buf, "%u\n", brightness_hw_changed);
 }
=20
 static const DEVICE_ATTR_RO(brightness_hw_changed);
@@ -169,7 +171,7 @@ void led_classdev_notify_brightness_hw_changed(struct =
led_classdev *led_cdev, un
 	if (WARN_ON(!led_cdev->brightness_hw_changed_kn))
 		return;
=20
-	led_cdev->brightness_hw_changed =3D brightness;
+	WRITE_ONCE(led_cdev->brightness_hw_changed, brightness);
 	sysfs_notify_dirent(led_cdev->brightness_hw_changed_kn);
 }
 EXPORT_SYMBOL_GPL(led_classdev_notify_brightness_hw_changed);
=2D-=20
2.56.1

