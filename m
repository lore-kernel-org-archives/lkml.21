Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994184;
	b=zfzhPmZE1X1ClERV/q3pAeOccnzpAc76v2f//oDqBH4Ke+hy5XxNO/5hKuRvk/ju6Dep
	 NZZIeF7tsbFAkdxIUT2fdJNcOS3d8sc6yQImga8fUXYsjXWAmdhbPJ+MK9SYie4QeoLb6
	 qn2igm6PvpKv75UAyoW4LumXOdRg+YirjnWJXm6W8GMT9/zSR76Ute4X7FGU6QfjWsGVL
	 ozxyuCHbz939oCLLal40tXm1K8wssRDqXZ+QECf4YOvmr2OycXF2DWI22J5kI/N1pngCm
	 IRkyLzSmYJOd95duesJuaLYEB1CdSGsMYAbMXgbkEhAQnHlLP7JJs0AziXnAewOcbVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1wtcEoR1ze4f6vnO+nmndwuoycIBypoV0YZhEBWZjbE=;
	b=OdzTnwvfH9gDzGFJmHTI4D7Is3uPNlawt226C3RL0TWk9M6lqhL9fEUIwdRnF4Df9QbB
	 1+OVnhlfGR/ko5ZUdagvjvJogs0DcMwfN0uM2lWrsAxu1L+BpGnc9WiVfri4l1bgZ9qNb
	 44TJjqMS5yi3V8Rfhj3IiOcd7gCg+HW5IM+d1FRpAJBUZPEDGudIzNDPcYQ10MfFmbxnq
	 XXLuPraBd4iwFYoUlWp4VclmqEktbHOmBt+Vu1Fq1f3aKBUwXJzE3Okf+Yuymytz+fmwt
	 8Xp3kUhHCjJ6imZg/H1rYLcPUMijuMBA7zCt4MAn4y5z1wJ1wimSGk/hR39eyP8cDzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTuIhM0J;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE12606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DE12606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTuIhM0J
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so734501f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994182; x=1795598982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wtcEoR1ze4f6vnO+nmndwuoycIBypoV0YZhEBWZjbE=;
        b=sTuIhM0JY3teJYMPjEXHGfi04aaHB9x5db72LMAjwnFxPMXvTAqKFVU1YG0LBzDT04
         tMLgV2dh5qeXRR99wJ5pskJ5x7nT7PM5R6mwt7kuPCFGw7FOTe3uZyqqOU8mXtoomNLJ
         Jd+QxxFXdRWNj/KTujamCJLmChZrd5hfs3IedbOa5z/+i/e9dE/6zPZYCep2bzL30Iz0
         +mrbIAurcbxnvRoUUrcPnCfo2qMbCDgy9f9e4wNgRJiLR1IwZH8iN1OEzs4sV6uzF74+
         02Lk1UZVbYwD5kToVO5x+RaJqtqqBo6w/2TWBxCjvGhgeBKs0Fc9p4aWJSDHoLse5gGQ
         sNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994182; x=1795598982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1wtcEoR1ze4f6vnO+nmndwuoycIBypoV0YZhEBWZjbE=;
        b=nxzDuGeDL5+61aZnB015/rNfaIi5wBt1FVSPYBlB8x1OqWrXuazjQHVmHen+oqRKyg
         QfAuMEIKI7fATRDackkgvhmo7CFYPDMXeBQEP7D/wKOr2kNYnNdElhPAMaoZVkT4jcC1
         EW/5/Dcb1swXaLKgWk2nWA4JxBTIT1T04iEYtTol6gTUHhlcQ6mzNvD2AmVMkO1AeXDo
         JDSspZMbxsxTzgwBbNPjaF9kysC5hiOBX2G2YYReck5EeFKm/hcvltIe9WPXLBkD0Tbn
         gAkHlYx+33QXBw6R3t0tjwhhogdTMbMZiG8+fJE4kU1O3bzE8041EoMoW8PpdQEVn2q2
         HrVg==
X-Forwarded-Encrypted: i=1; AL+hErEcMTztKPi6OCVIPsTFJI2tNzrobq/a4y+PHtmEA7p6bJYGiNvHFnPxLnLarOITL/O4L8MbSBzCuiGA1yE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/H3gXr8ZYQAxqxw1BXUac/myb/eHi2gdq9mNpJm34UX+6e/ELi
	K0ZJk71tJHGLM2VDMwd7z6iHQdq5OE0a3T63T8Up6338ZtBfmybTFrQs/mA0OogdUmk=
X-Gm-Gg: AZFdTZcS/iAE9skPg9pFxvGr1qfhOMDGOC3JcWPhqK0/ZFIKxiliydKfWjizS9qQlYF
	d/cxYE/iOkZRcq3LYtf/mP63jax9Epq9sZJMr6E/RxV/NuI8GeM76984nvQ/fBx7ywIzB+vEA91
	UqqOG5Y9tVKFW3R1jdKXzozQRiRyYxB2yJ6lJpS4c5Y1jPRW85KuSQAWcL18DHj9L4LzTVlY+A8
	aM7cvX5qOj7kflznboA1+1dhCxWJE2W44JxwWMDgQZpxweRV4bY3ctofRsy+VNWlZGa7DDyD78N
	D4yR4XLUz8lq5FB1eX2c7YCKUJ96fv/CUQQAFxM5bBVYXx0h5RW2DWdJr3+Mqo2JjR9OSDyzBwI
	g0mq/cmWAQagMSdZ3yGNeQoGoYhfpNjYQf+usbRSlWE9wpJESJ0g0XRnbhqruXt3zdTUVdx6tGh
	mnD5ZHginPAoaKJmSjwpnD0NZBwNYI7A7MiODalV4O5voCa/6+oKkTBnobfJ/EunnVbMRiJiMP7
	gpCNPRiz7pdcTRBxMsFi8rTC9fVyas92GAkrwSGN1ZHx0eWo6XA8jig2XTo1/Mtx64FkB9AHFwx
	cQRQZT+ShZcUOsz7tOX1L3xDJS3TtfupuCDEblNzYkwczbSiVU3tX6eKtOpbeLYUsXL2Bl4y1i6
	re4LE8r+GIRY=
X-Received: by 2002:a5d:5f90:0:b0:4a7:bde4:4d26 with SMTP id ffacd0b85a97d-4a7bde44f1fmr1053178f8f.10.1794994182388;
        Wed, 18 Nov 2026 01:29:42 -0800 (PST)
Received: from localhost (bl20-90-91.dsl.telepac.pt. [2.81.90.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654b807fesm3345789f8f.10.2026.11.18.01.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:29:42 -0800 (PST)
From: =?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?V=C3=ADtor=20Hugo=20Silva?= <vitorhg20080@gmail.com>
Subject: [PATCH v2] hwmon: (ads7871) Add error handle from spi_setup()
Date: Wed, 18 Nov 2026 09:29:28 +0000
Message-ID: <20261118092928.163553-1-vitorhg20080@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ads7871 probe() ignores the spi_setup() error return value
and it attempts to write to registers even if spi_setup() fails.

Return the setup error before accessing any registers.

AI was used for peer-review the patch.

Fixes: e0c70b8078629 ("hwmon: add TI ads7871 a/d converter driver")

Signed-off-by: Vítor Hugo Silva <vitorhg20080@gmail.com>
---
Changes in v2:
- Clarify what happens when spi_setup() fails.
- Describe the fix in imperative mood.

 drivers/hwmon/ads7871.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
index 36297bc6d047..a1ffc35d9272 100644
--- a/drivers/hwmon/ads7871.c
+++ b/drivers/hwmon/ads7871.c
@@ -187,7 +187,9 @@ static int ads7871_probe(struct spi_device *spi)
 	/* Configure the SPI bus */
 	spi->mode = (SPI_MODE_0);
 	spi->bits_per_word = 8;
-	spi_setup(spi);
+	ret = spi_setup(spi);
+	if (ret)
+		return ret;
 
 	pdata = devm_kzalloc_obj(dev, *pdata);
 	if (!pdata)
-- 
2.56.1

