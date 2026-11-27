Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751655;
	b=X2b2iVPZouOblSBPdPvpV51NZErCO0dW2pIv/nxxMxhHFu1vZiUBWyHzw22/h99Sqfd/
	 xU3dNNPv6JBhwUi/MHy0ZbSvlHGnz7pdFp3f6nW9APU1QwjMj4EoTvSns0xeeuZthRZZx
	 cV+O4ta/QqGmZVq3t6r3e0aC49xqGTEIyqtGJp7z6Oas0pArwHrX0kN8F8jvgXlI9n4y6
	 wbldz9cA7X5DwiLFscBYHDzyud8+4b+9TCcba7kmr8mhyT8PluoRkLYpRJXPluzGJ4lYB
	 28d0GZgFl+wf+iiorWyymrMy86CeXl1Soi7TeDp3Y0cGQA57KP5uVj0DM/7Su+aSPdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751655;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=h57xKWPZLHJFhTxzl2lAvcXdhuofMfYff0yEHztw+1E=;
	b=ZlS+M6Y2VXwyR4RMnNVB31lpxlJ0+TpzrcNdMPsdzKADdNbrHvLohaiiA6Osra1P2pS2
	 S36QJTp6/ywYNP4t0bvE36KMIrNHZX1DMGF1+nQ3EtR84+asbOAK2WhTj59TWMnOPoJ7j
	 1mFYgRjjvEuirGOh56AVdNf39FSLVqikdZ0l9dBChCmmg6/TC1+Nhn7XXkmfk1KGoLLSd
	 slEFETfCgRgFL3XG8DvIQEu0Gsm5XJwG0obRASibi2ChMJIvkUYnnoakzRy6WUXnuRfeF
	 oLmxOUHrgvDqbgAKfnb9ig+lUszuU8kyIgr3LjMPSk03lsg61DRQTimmNgy0mE2BUBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b="GTii/UHe";
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3828606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3828606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=GTii/UHe
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jbKKd2N9dz5B0rf;
	Fri, 27 Nov 2026 11:54:13 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795751653;
	bh=cNBGwkketYspE+jWRam0Vr2wuKlEtIsb97EhF/rYdaU=;
	h=Date:From:To:Cc:Subject;
	b=GTii/UHeoN1DvgpsveXby0kw/kckUnZkQQYdcM9ehIoFXepeXnm9ODkqAJAFAHgK3
	 u38NiynHTcmS1ZWIWyITQ0W/NlhEsVcQD3L62DZsqxaFVpmPPuLWKbMD7ysnyW3qHG
	 RJrsgYHkLgFt6YalWR/sxAIzjET9zaSO/K8mOCJimV0fqi1j1QEhUPng2mSz9GtObU
	 ADeiflXMBxOeQTwbZBjyxf7hzrX8PLypllMWACUnV6m7KcM2Rlyx0FFBWOwNohKkdy
	 NMoRMyOCac0AAjNIDkaTfalc2vjZymcX2gI99d72DiKIZ4tEDNn+Qe/NHJuViLBWmC
	 +HGH0Bbna/NnA==
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6AR3s1Nd061799;
	Fri, 27 Nov 2026 11:54:01 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 27 Nov 2026 11:54:02 +0800 (CST)
X-Zmail-TransId: 2afa6b08feda8dc-b8248
X-Mailer: Zmail v1.0
Message-ID: <20261127115402117TMtE2xcPXch0CpM9te7-L@zte.com.cn>
Date: Fri, 27 Nov 2026 11:54:02 +0800 (CST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <lee@kernel.org>, <mfd@lists.linux.dev>
Cc: <tharvey@gateworks.com>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHY0XSBtZmQ6IGdhdGV3b3Jrcy1nc2M6IFByb3BhZ2F0ZSBJMkMgcmVhZCBlcnJvcnM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6AR3s1Nd061799
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 27 Nov 2026 11:54:13 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B08FEE5.000/4jbKKd2N9dz5B0rf

gsc_read() retries the SMBus read, but reports success and returns the
low byte of a negative errno if it ultimately fails. The MFD probe can
record an incorrect firmware version or CRC, and the hwmon driver can
convert the error byte into a sensor reading.

Return the error from gsc_read() before writing the output value. Have
gsc_probe() check the version and both CRC reads and return the original
error before registering the IRQ and child devices.

Fixes: d85234994b2f ("mfd: Add Gateworks System Controller core driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
Changes in v4:
- Return the underlying errno from all three firmware reads.

Previous version: https://lore.kernel.org/all/202611091914028089L4I88l9WGcWziY8r3qZb@zte.com.cn/

Build-tested on Linux-next next-20261118 with GCC 13.3.0 for x86_64.

 drivers/mfd/gateworks-gsc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/gateworks-gsc.c b/drivers/mfd/gateworks-gsc.c
index c034d54354f4..f3d44b775b5e 100644
--- a/drivers/mfd/gateworks-gsc.c
+++ b/drivers/mfd/gateworks-gsc.c
@@ -62,7 +62,10 @@ int gsc_read(void *context, unsigned int reg, unsigned int *val)
 		if (ret != -EAGAIN && ret != -EIO)
 			break;
 	}
-	*val = ret & 0xff;
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
 
 	return 0;
 }
@@ -215,13 +218,19 @@ static int gsc_probe(struct i2c_client *client)
 	if (IS_ERR(gsc->regmap))
 		return PTR_ERR(gsc->regmap);
 
-	if (regmap_read(gsc->regmap, GSC_FW_VER, &reg))
-		return -EIO;
+	ret = regmap_read(gsc->regmap, GSC_FW_VER, &reg);
+	if (ret)
+		return ret;
 	gsc->fwver = reg;
 
-	regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
+	ret = regmap_read(gsc->regmap, GSC_FW_CRC, &reg);
+	if (ret)
+		return ret;
 	gsc->fwcrc = reg;
-	regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
+
+	ret = regmap_read(gsc->regmap, GSC_FW_CRC + 1, &reg);
+	if (ret)
+		return ret;
 	gsc->fwcrc |= reg << 8;
 
 	gsc->i2c_hwmon = devm_i2c_new_dummy_device(dev, client->adapter,

base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
-- 
2.43.0
