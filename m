Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597432;
	b=xs1hYNihrOkCbxYXTlWwhXyb4er/R5ol1V+ebm/NVVngJVhu9UP4OuCczMQsu+L0Ys9g
	 AXgujFCqP99Bcdx9ie8wNtBKkxVOjvd45IrchDUV1h5X7U0vJlWwg80bRuCnSjM5bPvw5
	 KWcmHvZEqZ+OEFW04dOvb+du95R2HVpVrL4m5PdftUfGBJmSgHS12T6EmsFhbgORyuOZt
	 NsKcYz1f2lP8r9hKLU4h6Ns/M287Sla4KWbssgLbVx2DZWZP9JKtZKXLvVTiDHLYyBmY2
	 N6ahzuzueZYMENuGlnDqProKYFC2+nVcOWlzNIiK5WYl/SfSHvHHVsmoCrpsB44CXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V5RSPGAWd3oxeQteUUuoK6f8743toWOpgplcBAfwJJQ=;
	b=pOoqoWFsMCd/tAd4I3pLpIn30g+6r5ZbdLOBiS3R2jiy4UFo8xG1vWxqdFKVQAHimMHb
	 6pPUQc3BlicWmyzxc0WlzQUnHigMskH0+wEyX6mUVX6aRtmVcb3a7Z1AHfhEOw+vcsJgn
	 cSy/UK5yN406kts92qrNbE7GRfzUZcejO0B4NHbz4V7P3rYIFD/S0GeWV0/znmaB4RGjv
	 dvJ3DPVK2rM0OxiRSdDqnwfjBQ/ca7Ihfh0F2/M1Sy/wF+EvpZh7taIWp0b89pH+0RCIO
	 wbFB/p+ygiGdtLRtuRF3Bz+BnDOnFTPGKxc75UPIqjF/0di+k8cXE07mLCCeoTZXgVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HY9x75Mb;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AB3606A327
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AB3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HY9x75Mb
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386ab9ab619so6530038eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795597431; x=1796202231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V5RSPGAWd3oxeQteUUuoK6f8743toWOpgplcBAfwJJQ=;
        b=HY9x75MbktHUwVKLIjoW0r4G8U9AL+zGRk/oiAJaPZPbj8AB7HKEVuMM+TB8aJ+dJR
         f8bZI5psfk9sGePKAGpDU//iYdl9et6CkaKxTKr1p6jyP7AW+UXJ78GDY27AJEwceh0m
         kEX0bojnDdo7s+nPikxRobNvgGGtC3XSMKL44XnlnNDbn5S8ITEV5BaoQewaisdOyQnq
         FjzaplAhjZ8C3aqkcvN0uyoIeOQI3URFC/7xOTaID+zcmrPlSXW1rgEeS+rAQfXIUG7v
         dg1t00lGESsaIEde0lStnYO9fwo5IGucPsIBYy/xDyknxzheatIJPO5oM2i0rbsPD4EA
         MW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597431; x=1796202231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5RSPGAWd3oxeQteUUuoK6f8743toWOpgplcBAfwJJQ=;
        b=PFWk6hbYY5XEE8J2eZYGJDecgqCHu9D1SOxG5Xz5h15f+xZLY5zMZ4p8iMOgvz8klk
         1Vtv2NccMRU/MUR8WAVJcBIEhod1qs00yFBiWJuBAnbOdTre50HFKX1HlT/Qj/w8bRY8
         BE67kXyQ556E+bIeWQbpWUvTYMuW/8jwBGh9aWbKYn1IamO6VcIbHcpBYzQSX6wI13f4
         2AnlzH5kk8hKdYePK7ikJTDRZV3F7mPEytdllvggBNJDPUb4MXWta64lhF09xwsvOFPU
         C4m7Jawpdz4cedAQv26lS6QjQjX3IJgUz2YFOeEWCxtyl+WGahUpgyMKGmE0CoCuY9+6
         EKDQ==
X-Forwarded-Encrypted: i=1; AL+hErGeFK0lCfVbG+xT/9VfVp73JuFiGkYjGUz0D8KLJ53F23xarXvihFE6ryRewGaeOh39uY7uRc6ME4chdyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OkOYoebqZ4wBt/6nCcNsdAhvmO5Gw4ksSBN4Cxo/UBD7g8HSZ
	OX/jDRUS180HmBRIPRgm4zKMA3M+H/q9q44NiotibOdzI1x2cP6IMTs=
X-Gm-Gg: AZFdTZdulTGzXlvP5s9NTa8oNGTFyeQnQZXoCuBN96v+uIfdd9hd93sW5DnLWWy+Ffv
	sxNqJ71kolLadHlDdCgNHzf0OCjQSNtkjKKeM2Wx91kLaeazfXmqgiCgwi45Sb9VMtyHk0WcuCV
	8soglB98chtN94S/JjqZEA8CcS0VkdPJnPnTjesTcW8WwofGtbUPZuR8ASdKy3B9RyiWs5TmvR4
	Ojvy00gZHjwlKsBGJlUyowUbdt6DEsQpYAzutsZSpicYH5okmY5AeTDxIxGrQpCdYUsKJxvZOjX
	sKFTD4ygAAN0ma5CM+C+abhhU9dUPmzzX2jD1GALPvt8rMs3Vs6Yymv0ALZlMp7EUg0qApow9XW
	vlzvrh2tIcYt3rRNdcPp1pMX/Mg5+0k919S2HPrCxAKflCzRVtMmJnlZi1hT+IsLb1p4Zr+3Uch
	e+FXWsasCt0dZsRDH0QMM1i3wYq+42iyokzuR+Cav5ZQepDtMCOInuxB9rYec5wlxRbj+OPtfOs
	F4bLM1U2k68+c14nu/XMdzX2CkrRB6JWekHX+/hxVFHfO5PVrIkU/szh1AQtHqXSNtriqK+2bcM
	s2+e+bm9MgfOV+Lg2OaEo5Ly95ks1j3fC3goNqWRwDQ5qKFH+Jtt0PeH4w34Hy2CXKyEaAmS7v1
	CJlvbt3w1U6vcNw==
X-Received: by 2002:a05:7301:730c:b0:381:2114:99d0 with SMTP id 5a478bee46e88-38571415bdemr16715777eec.39.1795597430484;
        Wed, 25 Nov 2026 01:03:50 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:44a2:4377:d176:9ad1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm53859174eec.12.2026.11.25.01.03.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 01:03:50 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Wolfram Sang <wsa@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] macintosh: therm_windtunnel: Fix i2c adapter reference leak in probe
Date: Wed, 25 Nov 2026 17:03:43 +0800
Message-ID: <rc-b1-20261110-vc-23-41d00428efcb@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

therm_of_probe() walks the i2c adapters with i2c_get_adapter() and
drops each reference with i2c_put_adapter() before taking the next one.
Once do_attach() has started the control loop, however, it returns 0
while still holding the reference to the current adapter. The pointer
is not stored anywhere, so that reference is never dropped. This
happens on every successful probe, including after an unbind/rebind of
the platform device, and the extra device reference would make
i2c_del_adapter() for that bus wait forever for the adapter device to
be released.

The driver does not use the adapter after do_attach() returns; the
sensor clients it talks to afterwards are children of the adapter and
are unregistered by i2c_del_adapter(). Drop the reference right after
do_attach(), before checking x.running.

Fixes: 3e7bed52719d ("macintosh: therm_windtunnel: drop using attach_adapter")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261109 (630059a5a632).
Compile-tested: powerpc (ppc32), GCC 14.2.0, W=1, pmac32_defconfig with CONFIG_THERM_WINDTUNNEL=m, CONFIG_I2C_POWERMAC=y (object only; no new warnings).
No hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.
Runs on every successful probe of the Windtunnel G4 (PowerMac3,6) fan controller, and again on each unbind/rebind.

 drivers/macintosh/therm_windtunnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/therm_windtunnel.c b/drivers/macintosh/therm_windtunnel.c
index 0b2e08a1bee0..4f2581d9dec9 100644
--- a/drivers/macintosh/therm_windtunnel.c
+++ b/drivers/macintosh/therm_windtunnel.c
@@ -472,9 +472,9 @@ static int therm_of_probe(struct platform_device *dev)
 	/* We assume Macs have consecutive I2C bus numbers starting at 0 */
 	while (adap) {
 		do_attach(adap);
+		i2c_put_adapter(adap);
 		if (x.running)
 			return 0;
-		i2c_put_adapter(adap);
 		adap = i2c_get_adapter(++i);
 	}
 

base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
