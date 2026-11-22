Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378509;
	b=ZZz9DN8zfw1BIQLQOCMSeQs/TVEN9tDbbPBTMiahXEZig0tgs4jzcEwGWwD7cFDoqJbY
	 s9Y5l1x90CnXkIIEmASpDgPtYixOGBt2lfvIoKelzRg/zSRqvT4AO5i2nZrtVBBDevs7H
	 0yD3Q1KcCvBWdedm3hX+7xPJojLEhlb649hse/2AOdfjoZUPolNFV5FlXgH6xVuw06vHp
	 R/w5SdnXfd/c33UXOQPnKa41Je1ZFw4EhvsiZH6qcCnCaDtsyU+Z/Hm5mMkBDiUlikyJk
	 3fBxk0UdQdUVsWs7zaP/b8zfXPjGwpWTg4oazJwZsSGmrrC8LoBN5meqoIKUhFmNSOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
	b=EoYtK95m9gTVKCjIPw5HSEdVunec3eilaQMnH4/K6/XH+nUpFXp4UfcsIA4je4ANjETg
	 /ED2z1BBUpVaVT9dTTbfZWt65VgBUi5ZuH3gPdFpPGWpTFxPI7zCVnffmjIH0zwuB+EKk
	 MmvVupe7Pu1Ibt+j6/F2bWSlT6gKWR1ZUNAp3jF94QNMUE/MrM4N/F+9AvYfog62yU0AW
	 oEWZ2V9wqo3dLWuGGU9seGC5RBPk+ihtccx2nyCPAZxneiXC4CGrtvJTUyagXJjyiHzC3
	 HIJeha3GvZylS5VTrkmhBZDPiJrQRoroxnGe+6u8s1choB1H6vDU+cJ82xXAEGnHcWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYm3TeMk;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B9D606A680
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B9D606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GYm3TeMk
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b876afbb86so3207707a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378507; x=1795983307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
        b=GYm3TeMklN6dkS/HNb6FOP56f7UVPTedXjNJ04dD8uUgYgEKEZi7qmhLoQAVkFLdcn
         2MZBbHzPtmeP5y7a4J59YU0ljoSBSfwfb/rXhWTOlOqEUt9avn+PNm2BTD2TUzaI3UyD
         wM7bVoxZ4Wml/S1Dq09CSpgZUKkLrXe6VAfnroL5JvWmpp/9qxH9XhGUeQ5CMPCRb/ZU
         8pV+VCfOju9Jonb59/QugN7jJOZIqBYsqKuReVj7UMnMGGzSE58/YFaPvTcOsB0D/59r
         rPfgK0jF80stTzk9uPBg4/uiVjsQNTf0uqaXZ7J9svJ2fiUNADsVh8IVWVA7PtXanoYI
         pt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378507; x=1795983307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvwcsAdY5ApuuiEEk6N9gHD31QI/cBFOyY2T9vxVLpo=;
        b=gQPKNtpFY0KQBLsJXRIAtwl7BPtKFQKuMNDeghnnnClz8C2D2YgTOlA1PCyFekKOnd
         6PMuBbtX1i2HhTx0lXC5M5gHDJYxoNFZTtCikM3NOoK+26AlDeOIzO7E5KGQzdteRHsD
         0ahXUoEmVJcJSnk8ZjNqgK3pkoHk/MfAC7ulh69eFDd7lsJIPOdk3xud+0ZXuNg2sl+V
         1gDUYY7kGw/7aqZ6Ariyyf54IU70OPMDii6N7+ap7oTHB91Ev5CDy4SIjkHaq7DUULFd
         jAYo8GVxpZmkU9IEYLdFcZS/aLLoLpZaBpo7paaOv4wUAC5jD4C/aRDshw+ucOGesgSR
         AANw==
X-Forwarded-Encrypted: i=1; AL+hErFFMHgNIkCBBS56GdzEF538mDQLJ8Qny6gmAudeBrC2JAnaUmLltNdGOvnzCjYPeF91vXhEmfHDJPYssJM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m0v3x/VBHBHFwz1Ntr04UO3RBdwlIVPhu4IssDzWemLTH2TYF
	HofouQwBSvCfpqx5l5QQ1xH3j09kBTPEdNl2xhReJFj4bJj6MUIWdwmc
X-Gm-Gg: AZFdTZeQR3orfdNItuRgxMlcqeVm/TbF79a4cHuitF1ztvY31m02iFvkQtgREGhboKh
	E+1Sc/MMCWorClA5sBUNhOC1YoWaV7o4W9omSXz7fGoczjN/fEn5VYe48XO4IWiiVcFbCu5P9LH
	8S6nqg4mz1KU6UOQtC5/7lg1NSUGCr7+BE4BhRm9SSNApB1Sxp7vwhxsP7Dx8pgI/MkIsZ66ek8
	B54757+u/vHevNAvppCAdPnbB6G6IjUv/YqqjVjH/6KYC3E0p2SWmiIrEyKLgAN/V+xF+8zN5ql
	z4WiPfbV3MCoVL4qUmlj5Q0uTpatcl/bq4RilBL75Zmf6ruxZPubuEeNH1Lwn4JgGr1pI9xlHox
	s/tGVRYBNilYycuhgJErAvASi7VLKiLRMpmVNyJPFW8lbXjMqd4EIAbiFEKqMd0UPrs8qwOV1GQ
	6YuATyetdmomcB7AYBlsqfozBzm0H1QYs3YIacBvgwFGudI7Kb4l/pQUQrFbXzDUdXJMDNlm4r+
	IiCKWfXcjvNAk88tws729kmlYFYjwtxaImSZjELBs9v7HosFOyrTt0V7RevIXh7TjBC1X8m0YYd
	GgnrfJAGkWWnzN1BLKNmCNgaSQ9qjW8NPXdrOiXY4WQZpUgpxpvi5z0fWcBxGyAGy65i9HIZsgu
	+lYPIBq6fDg==
X-Received: by 2002:a05:6402:280d:b0:6ba:b1fd:6e73 with SMTP id 4fb4d7f45d1cf-6bab1fd714dmr689422a12.40.1795378506948;
        Sun, 22 Nov 2026 12:15:06 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:15:05 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 18/18] ARM: tegra: tegratab: Add panel rotation
Date: Sun, 22 Nov 2026 22:14:07 +0200
Message-ID: <20261122201407.23742-19-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
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

Add panel rotation property required for correct panel orientation, since
it is mounted upside down.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 99f0d1c345e63..35400af7c1c1b 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -175,6 +175,7 @@ panel@0 {
 				vcc-supply = <&dvdd_lcd>;
 
 				backlight = <&backlight>;
+				rotation = <180>;
 			};
 		};
 	};
-- 
2.53.0

