Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454372;
	b=XHC8OZLWSUY06e0AHqd7hBl0PK7GgyPskA0nom9tD+xhNWYDdzJR/+gnY4SPi8wKSGHf
	 wc+oOEmLEof4j999H3J1ckCHRvzY9herq7DQ3WgOE8A59HAsz4iWxqb720AqQGmeUCOOB
	 3d3y1EHr4Xf4IAUKx9wftuDSErbA9VScTchzrJcfRD+BOhXdsXdybHrp045jIlc4fnAFW
	 5Jw/dBJcj0GW4+/Qq6tC7GraavY2DsiTLTPE9K01pQkbHoigN2JA7FyReHaz21lFo/OgU
	 e5adReHBIP5lM5QvC2Jm1ROaIWPKjnFf1scpJNkepg+a/BBV3BMtYMBHJMUEboFNK0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
	b=Btzig/Zch849ZCFhG+h++A+NR45mslPPjko0m2BrD4IyLCvgZ+KniYkHuuD7hLPO6UWt
	 c/kC9sLcRNW8f5GwhUUYyM0QzG12Xv9Sdhld4zxM3s1otogz0abpDG7ePteyx9oRnOT12
	 l0rXt6QveBgF0Yl6ZUy8dern3bXiL6rmvGM/U7kmBoc3mV28U00dfkv4kT/wPuOKVRDWu
	 zT/FfnxQInWICh199RR1S/tKNcjCJ9AKGCDbWraxoOuLiLBG0mqiPVrS0moRiq0562DIh
	 BzMRsk0i74rMvJg2R6KZAZtyYiNlzyxz1xEaRVgKbFW/GMedVYP3VqAfIS2v0b3jWGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="kP3i/so6";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408A4606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 408A4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kP3i/so6
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1439572b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454371; x=1796059171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
        b=kP3i/so6HH98uHbfHy+ALDtpP5nXVMLM+tkX6mX2FuuRG2PPFEXsbnhwy7f4NMgG7x
         CLapE1dVyxNQ8t+4zs0kx/K+/3kRwXX3ylY85Dz5NmBXHYwcAzwiz6zVfabd3nK0545o
         7gmyZ38HC0ocV/AUQgXuQmZVry0wRWSHGrDpQk2c/5O1NUoxKiiaTnADTiVIUBm2sbaz
         +xofFwBJmmO3R8FBzZr9Cqdp8ginTinrei/cVKLvX/8cKvnvW2DvmarkTGGWqV5mfffL
         +HFi6SFVtFC1lKD2Jb78hCG0d7qED13FzsWB9KAYn+l/KZOS/C3t0aoMrLDLNLjU0o2Y
         Szxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454371; x=1796059171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
        b=Qad2f8e0/Uf+IrTIFbchAhpEvXYG+SZapeh/StzsayBSSHw1e0/JgBSEAiaFX85pJq
         99bEOBBWNeYnMigJ9L0/AuTnIk0xVPNaqVFg/YysRWFQKC2qhbmuSI/RnRfwznEX5+bH
         X9sinlRr0FZBDflVM7Y6x4e6R1LALmG4wW/04yVieyh4mlILb8799cMc2GnVco88SDB8
         Z3ruvDaco6fn83ZTEgoI+VoAw5Ot2ciJxToEY8CNpt15nVhc0PkG1KQsuBbl9cCRh4wy
         ij0cWYOPSUN4mfCPBQpmIEvlxAMc6qgDP4LivrvdE+2gKAz9OrXGS1tXHBg4TR7eVB50
         B/IQ==
X-Forwarded-Encrypted: i=1; AL+hErF/lDlHDCerNTrU53wtQE84V9E1dkzYJ1h7dW1V6CCwUA+RGdYa9r7x5njgglATHfv4epDAtq8miBRaKsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pZ00n4B/Gtd8coC7VCKCTP05+D2GYIXb72Hz8XN0hYa7LtLTP
	RA7ouTIAv+oeqFD/DXxE3zzFabz9aOXDq/b4B5kuIF4e44L9pfUsYLg=
X-Gm-Gg: AZFdTZdcfsHOvQR2NhBbKsNfCKIjx+9LJEB7Aw0m1Kig6VZ9MGns/hGzRDkpENkrFR7
	0gzPX+roCHY+RfG8ikkQ1vgryBGiGaSdIJPEqlZeyXnTT3FS7fnf8cdS1CfOHWOS+k4UFTzw79N
	Q/26Z3HTdgpXtzsjs6RzjhcEamgIe6yX2KncyVaeBhbkoH7Qhg9UsVsXRinoRAGCdytlsyqTeKV
	LxrKxKtxstfuVuLr+AshChnp3LUlcFTAHzyFQJweeI+Z36g4cocxigAqQGkYsAN7ap0rG7tqxuA
	cX9AJ1qrMg6n7AWexkT1JTAMHMSwPi1Od/FgNW+lyjBat2qsz1d9qdxO2wMINjXMHCb7sq2jT7c
	6ffGCzW8SM3CubOEJs54hvk/g2/gn+IDfyEulNpl84mpIL2nzrambFpZcxoz3ZDGUAo1pc9qUEC
	ZXdoBCudbWzaIUCU7lMLNiw5Q+IyEok+ZZwjCEHhfxZ1LCV7TAetbj7mu21j6P2ncV7R9OI1LFt
	eYSNUJMDjdMpVdD/gNIaMbvV2b913Z29Dprn97E9O0lxNKBrpv3yjHky/qir1J+4rZN/Nfm0yms
	0zpTcTXk5n+0MWcBtZ0vK3Ta2bsMAbNXcStaXX/dP0RO0VTzF83J48l/xxjI7m5uGjdH
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr11130870b3a.38.1795454371512;
        Mon, 23 Nov 2026 09:19:31 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:7883:5066:4773:c572])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cf5bsm5985151b3a.52.2026.11.23.09.19.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 09:19:31 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] pmdomain: imx: gpcv2: Take a reference to each PGC node
Date: Tue, 24 Nov 2026 01:19:23 +0800
Message-ID: <confirmed-20261105-18-6a8421e1b241@gmail.com>
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

The child-node iterator owns the reference to each PGC node, but
imx_gpcv2_probe() assigns the node to a newly allocated platform device
without taking another reference. If platform_device_add() fails,
platform_device_put() releases the node through platform_device_release(),
and the iterator then drops the same reference again.

Use platform_device_set_of_node() to give the child device its own node
reference, paired with the put in platform_device_release().

Fixes: 03aa12629fc4 ("soc: imx: Add GPCv2 power gating driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260530004541.E04701F00898@smtp.kernel.org/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/pmdomain/imx/gpcv2.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/pmdomain/imx/gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514645db7e0628bdddcf579d1f0d904..7b377bf0196491298e9e772b97d15a2bda9ff83a 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1513,7 +1513,7 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx_pgc_power_down;
 
 		pd_pdev->dev.parent = dev;
-		device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
+		platform_device_set_of_node(pd_pdev, np);
 
 		ret = platform_device_add(pd_pdev);
 		if (ret) {

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
