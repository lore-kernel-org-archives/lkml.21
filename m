Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378501;
	b=nPIyud9XrklZhULPbwexvT40IZq4DPvIq9TWJZJxY8Y8O4Cb/p7gf/w/HuKua6+jklSJ
	 zA0Y9V/unAQBTxpoOsfjXDsTolc7A2vXKqMO+sao7ijg4i2RTM3sBWkUTJ8Efr76ts50Z
	 aiqV1Fw+xdRZM0LcoDXiGjqKycrcXPyv9ZcxEa07LyS+p3AuKyU4AtKOLRjXETVNx3+ZK
	 DuppmkWMK664a8kgnR2BoX/jMIW/w+d2mR+1iIJ70soJeF/HmKLueods0RYbl7JmITSpR
	 rTWvjyfeVZL4dHyXRGfMXwr/HilKpd9XlLUNwCyp17/GIzvIlO4CTcsJpObYWPXdADQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
	b=aZ5NusM9dEM0x71XRwnqJNbi7NnrRQTurecEX490k7++LwB/7irNG5lhHRPjr4etFLER
	 m9ppVUsk0gwmNgQ55dqSqvIPP6VM2n7f++Wd4hwIRIBTchgapew+IvAnNkwUBhvMhFKTa
	 CjqLUWjCxORHWXkMsVdWXi7OdbKe0dEkEP48gJjSyjSTHaLRozhTUGIGM9+7iDOSmXG+h
	 Wthu343Z001Ofm3RTcnCfYmy/yfinK13ZL4mfrtcrGnjT/H201prAOpfwuigNK5kofp3I
	 MztqsIyAewZtdjca3uOGwE/OrisJSHVnOyJQXHeoVx6jj356AOqJOtVnVpiw1AjYgaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mV4S7s0F;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFB7606A683
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFB7606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mV4S7s0F
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso3143057a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378499; x=1795983299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
        b=mV4S7s0FSBQ8EhKjdIitZA7eBN6Dv6QzdU0jpu0+5ZnD+DDNounbp+Lj7QZXks6ho/
         CkkKf4eSnlEVxiOHTa+q/f7D2TYvG45nAJFDDBwKxskEDV7JXZHfdhg11gVqpd26xlET
         aXP/QHgoZL5/6uRwJEqwDzmx1Or/iKhzJdpiaBR2sFldJlww/vtWzeCJ7KCHR/ahnGFj
         5ETgU9nDYRb13y20bff1n0VbzUl2QXB9kWuXpyaE8HQI4Rtg9nHmROccUGs8s+z508dR
         XTQOpLrMZHy95JZMvZjn4QndHdNWHlfd7z9UpZVS7GU4CHhflfL7sT7TZ9AIJ+ocNx9G
         fI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378499; x=1795983299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
        b=1UCPwytEWQzcFqLvJ3ZuRv1F1omWq31dXaDTVJCthzh4RJYQCKXr6n+uYTO5zFnwiD
         WQS09ZFtvVIHRIaVE7scucINCq1dutDfG+KyEzragFd5s9BssMsr1dczFSew1nikvnk3
         a7nVhjdjhXXvDFwzjSIfy9KqCvfO797MV9WfWZikgIgjTHsivacWdiGr7PtaVwUAdVW8
         mEOAwLTsJEvdEluNOnR/GuXHA+kXF9tSwNX+Ua1eavaDTuvJGmBEQTj2g+5k/FEB+V34
         QWyIL8b6VEDGJlx8Z3MK5qKaLQpjh6F9B2CuNIMk9lhPrK7oG7O9jMvU5L1t9Y+tGBFG
         JLlg==
X-Forwarded-Encrypted: i=1; AL+hErGUGVEL4otbPLLHCy0Y8K9oPtbswLrRAXanIVRIPdwsa6VpRSga0kN3G8ZUHlFnB51SsNJDbrBFdkIrzGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uACNl7ZZWmnKaHbM9MA3LlvnI8PsFppb2hwnuksVj0PDNuH2K
	14bwG6B3hxoV+gtwu7lsnIb4mja8P2XErMNi83joSDvyUKCbkxUj/uZP
X-Gm-Gg: AZFdTZdj8QO2cr46A1XGFDwCsNCdPWPCnHrVeHF6j47TmKWVFjuI53hT6IcL9He+3rI
	lZlNndZAQNdJl+FFTzIGnTx6GZ0JJT8uHPNW/IQI2zRwAc0ym8b2h9+JaInoYtMZn9BrHL4K895
	BuEqblXGp/kelQ5wbqY84UVy2Xv0uiuKCXc/jdRiEctU5kuVQtoEsS683EPGxtjOBkeW8xS0ECx
	0jdqxxxA7fFOxmJEGSIDKn7DxvHl0M+RPyyeU2xXffPZMuqiLrRITyZhZEM58D8ZfkQ8FOeXYua
	2pbsqBBccRoww6ycAdnNZMHsvij5YzVwt9satu6x/D+uOd4/wafjYVkk+Kq8HHiT798mVP9/y/R
	NkTag1zHDLS9zfOgh6PG2h+umDU+pAfUSlnFzT2zEeaqOXu/9N1A2RzfwNnTYcxUJLONocRi6p1
	sDMMk5+y/dfoM0iyoS79J2v3dBmCH3nfVAgh6qIozxsttIG5cdEwgR1osLn0791H5FDRrN8uYqS
	qYwTOj/0T2L7YNtydikOVMgvwa7fS5qaaMUGOZP18df406+Holms/oNRivQorwJbtRjBq0osYu1
	8IXRaWKOa5SvqcNSHQB27p6CchtiXYLJk2xvVSCOmoYc3eWfmXus934kiHOgusRmqcAMsAB7Y7x
	N7rQ+3D92kA==
X-Received: by 2002:a05:6402:1d4f:b0:6ba:95c2:750e with SMTP id 4fb4d7f45d1cf-6ba95c27ab5mr1629135a12.16.1795378499006;
        Sun, 22 Nov 2026 12:14:59 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:58 -0800 (PST)
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
Subject: [PATCH v1 15/18] ARM: tegra: tegratab: Update GPIO keys and switches
Date: Sun, 22 Nov 2026 22:14:04 +0200
Message-ID: <20261122201407.23742-16-clamor95@gmail.com>
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

Update the debounce-interval for GPIO keys and add hall sensor and tablet
mode switches.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index cf8cd037a732a..f6b167dc8d338 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -2295,6 +2295,24 @@ usb_connector_out: endpoint {
 		};
 	};
 
+	extcon-keys {
+		compatible = "gpio-keys";
+
+		switch-hall-sensor {
+			label = "Hall Sensor";
+			gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+		};
+
+		switch-tablet-mode {
+			label = "Tablet mode";
+			gpios = <&gpio TEGRA_GPIO(O, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_TABLET_MODE>;
+			wakeup-source;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -2302,6 +2320,7 @@ key-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
+			debounce-interval = <30>;
 			wakeup-source;
 		};
 
@@ -2309,12 +2328,14 @@ key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio TEGRA_GPIO(Q, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <30>;
 		};
 
 		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <30>;
 		};
 	};
 
-- 
2.53.0

