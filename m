Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638156;
	b=D03ULxqJmKEi7C6jv838yFK14HJQwHVW+jo1QPXGapizL/KgQImJh1S5/qyQMZs8wOIl
	 97F77BUwqzl1VQw/mqZa3I1NChbYm9HfKUPTIeg2HcjpSY0GM67ws67XmbZJPNG1HCd1I
	 FpDg9jVDS3EgI7WZXAB1DI64PqYmf2KKDT/wcSGnsN7Nfg6J4bNHP2jmRZrxQdlyNFljr
	 Fbaf/8nNSgKmkgM2b/9y6hGct1xYC6mrfGvZCLh8cOKttCCW/k9OxFWbg9l7Tf2QwLSwz
	 TjSbeMtZ/q6kZ8GjlozZETV2X9T1ah989C/DZ/BGutBV5/LlmVxhAuztaaXqXSL9EgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638156;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=ipPQ25tiHkUanST2JzunfB//g2qXyMbHVdRkURBDgGY=;
	b=eXxPW+zB/K+1daVpUUFyaXg3z+iFUn0EfkKfhBJobEm6y4+S/GgY4X500PyOBQPtjY5u
	 6Rr+Dsm3Lfq0maFL9kW2MtwXZxJt52tHzy2etavTDFNEn/fOF4kMdKrvozdVY19/sozIe
	 6GvkYu9GkIIxpfga46dns8c7JjZkQbC+kjurAMYGoubdLlkRLoteXCh9CF9qczh0pDX6z
	 gMSf8R+Fep5n2+exLLIY4noA5N1m6dejxmnmku4VSU8SK8F97Xc6HCx2tHnuhMASF7Z87
	 N0GTm4bJiOH5ClwvD/NuvpYohBBcLl5xWCeIDRktbllWMpGCaopZiW3U9GkPKiK1JeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9847F606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9847F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4d5e645d1so40890067b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:22:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638156; x=1796242956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipPQ25tiHkUanST2JzunfB//g2qXyMbHVdRkURBDgGY=;
        b=mzeanqybzUKOQVX9ou/Z4PBhQVOlTAx1EjedjLNH+eha/+Eh4KBJENYAcNlNe447Hv
         oftibM0+vNVLG7+95MQdZhRXz3SoufYbaQHSq4fROx0P7clyoT1xNXz5UTfmGcEBCoW1
         9DQOVCeULahqP9W2umNC9uxmfbpY75/OoMXuVsZDPzrIWNpcMiJAUGIWRX03haLHmwO3
         kLyoXjdaMnCMD7V+wA+fvwjXtQ9txSrH1/NXrklGnchrsNGorapFKCw9mwds3FNkmw3p
         3G8QqqmqpYnzggt3TNVULXrJO5P667lEcUdp1U6jdfaIxzmndQsXOfmai8Auah06Hdg2
         TwqA==
X-Forwarded-Encrypted: i=1; AL+hErEzfRHVT0pS0KaJqxRbM/K0gVSzWY7b+gA5tGPRw7fTdAOgbiL9haaXYPsDj0FXlTbJzefbfroAozV07ac=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Y5ejkbyfWR4zIQQCjvmk0zPFcDbsPi2dSISlUM24OoGUPINMl
	UBLhd+vm5oef/WRNf9Bb7aTvxmU5KXECBt8H1OmwF4YokSsSsKGG1ouPJsfX3zwHhK8=
X-Gm-Gg: AZFdTZdz7SfzZZ/HdnbmUtgWP6e7O5nNSW5MMRkxj94yXC76eeYQTFcAXdnTm3ug6Yq
	QPDPg9AbSVT2WDfjmsHB3Gqe4x4Nmxtd4VQGoIqzhQfs6AD+BVfCTjbfsERim4qsfUdalNwiCa6
	MujF7EB7OGQitPVMw5KWvS5IKxFrXW8L7Y4n1jye0gOPhVgoWeK/uDAnFZ0At2B+auD0u7FoMqJ
	2C35JJ2Ks87FW4dXePltqni+cIEL7/VGX2w6kGj+QABG8W7UoLNTwkbz6xj+QbPkhGaZlJjtyhR
	LLTT7II0ld6m8RSbmTVzCIBE+efiJf/3lpUpy/4KlaE2A8Twhzoi0Qj1fVHlhkGvFxzti2pqOsP
	7BNAVDDHD+cryP9G3JN2N8ZbRkSqMf8LAoeVgbkQx/6DQFxTACmaC6QDpy4mMdWcnZM5M53RGQy
	tZwV8SVM9jNkIBe/l0FGig9/uYTFdCBtb5Yb3ujlg1D9DRJnQ6UcfahSg1eqEGOl7sQT279pkyQ
	M/1b38KJv/m16P7JKYk4Wuth9PLhzXc0EkCgMbBgs8o4dt2R1zOeFsC6TaJIizvYuXrzcaoD9Ah
	Q/06tH9XXOFIMD8RcQUUbg3ZqJmD3MzNWqwyoe6VF2sMpFlkybDAvH28cE+LI5j0tc9zn1Wq7gV
	hCrz9XVyJf77Rl3eeUQzzOp8QNfxwWaDfnFDsVn/AehfRaqLk8rTSv1DB+R9zB38XG3fIYvsNFI
	wEqFBSbgZESKKuKWov1uqhGjn3
X-Received: by 2002:a05:690c:338e:b0:8b4:cd96:e2f0 with SMTP id 00721157ae682-8b52031b32dmr59760337b3.6.1795638155700;
        Wed, 25 Nov 2026 12:22:35 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201bb6c7sm77074377b3.6.2026.11.25.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:22:35 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 25 Nov 2026 15:22:29 -0500
Subject: [PATCH v2 2/6] iio: potentiometer: mcp4018: Report the available
 wiper positions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-iio-ad5246-v2-2-8feeb630f0b6@telaak.dev>
References: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
In-Reply-To: <20261125-iio-ad5246-v2-0-8feeb630f0b6@telaak.dev>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joseph Telaak <joseph@telaak.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux@analog.com, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0

Implement read_avail for the raw value, as ds1803, mcp4531, tpl0102 and
x9250 already do. User space then sees out_resistance0_raw_available,
and an in-kernel consumer can learn the wiper range with
iio_read_max_channel_raw() instead of hardcoding it.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/iio/potentiometer/mcp4018.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iio/potentiometer/mcp4018.c b/drivers/iio/potentiometer/mcp4018.c
index b10b4b920dc0..d6387645853d 100644
--- a/drivers/iio/potentiometer/mcp4018.c
+++ b/drivers/iio/potentiometer/mcp4018.c
@@ -12,6 +12,8 @@
  * mcp4019	1	128		5, 10, 50, 100
  */
 
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/iio/iio.h>
@@ -49,9 +51,12 @@ static const struct iio_chan_spec mcp4018_channel = {
 	.output = 1,
 	.channel = 0,
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),
+	.info_mask_separate_available = BIT(IIO_CHAN_INFO_RAW),
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE),
 };
 
+static const int mcp4018_wiper_avail[] = { 0, 1, MCP4018_WIPER_MAX };
+
 static int mcp4018_read_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
 			    int *val, int *val2, long mask)
@@ -93,9 +98,26 @@ static int mcp4018_write_raw(struct iio_dev *indio_dev,
 	return i2c_smbus_write_byte(data->client, val);
 }
 
+static int mcp4018_read_avail(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan,
+			      const int **vals, int *type, int *length,
+			      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		*vals = mcp4018_wiper_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(mcp4018_wiper_avail);
+		return IIO_AVAIL_RANGE;
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct iio_info mcp4018_info = {
 	.read_raw = mcp4018_read_raw,
 	.write_raw = mcp4018_write_raw,
+	.read_avail = mcp4018_read_avail,
 };
 
 #define MCP4018_ID_TABLE(_name, cfg) {				\

-- 
Git-155)

