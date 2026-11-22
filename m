Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378474;
	b=Oo77W8MSPR38tQyOChf4B61Jb6whdYfOFlrSP/1hca/yiUY+RFmd0BWo7V6K+jdr5HBz
	 KBwKrDQfNtVnDCunyADGqv22zkxhZVJUJfu5SYLieB+74SD37nCWb/UfR6ph3Dz48i0XA
	 F6eOI5y+ftHPcu+Wkwsx4uGJdIUuYtgXQ3aEsO5QiNRNo7Df7alADnRwHxqN7HBFxxWI0
	 igacGgpp30byvdUDsX/0GkOFjVrm6/athrTeOeV2Fw3UAxKoVQIgjJgl4Zwx0YY6LK+oH
	 l++C+hFgZM4D7uPCog8wC6ITRh1dSI4rGyCG2Rnfb0CI4fd7wEkEMgte1A6Npd6okXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
	b=fpFIRXbe5m9Uu9PCYgf9bkiMXpa84S22RRqKkiEi83AF8waYTQwYSon+VSeBisi4t8e1
	 aK6YdGwBLW+giDjpKOksdiXs/kYWysfXqcQXn9tEUl02gM0GKoyi9g1Znwx6O03RqG0kv
	 Cz+96x40vjzUoDyaS0ixXnIb51TMSaSbwHB4SCNF6kYvGbYMer9CejWqk+cISK7s/vk3w
	 UqzdZRo8mOJz4jx89d0RqAfK44jtmhePvGO07j73bZSjeB2ePgQoK/L32rDGMZkMkFf7h
	 fAnWuuYwVV+sJaZEwKoZuQW82nQtxxgZdvqUNkqYXphijfP1DQgUP/jIHjvLSj2xy9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GD11zxSi;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34B0606A339
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B34B0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GD11zxSi
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b86fcbd647so4178819a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378472; x=1795983272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
        b=GD11zxSiqy4Bn6JUPtpI2nzRDhPvnQ8oPMB0enhNHvhAbU8Tug1YknC/gXCIwxymdV
         zidBrWfwT2WuR3UnCSQiFs4Z1VtoIf6wwSl2MBzxqx7XdZ7iQZj5kYNdd/+/D1WV8yqB
         Z5kO0WaWrD8prhA3s38DVOvV/2aPBJ9AYsxiBd/1Ec+kbPguwKTYSBp8+NqH4TkFpVXJ
         nZEOru06DOxWW89F/wjAS/t8FlrX2Fl/cUHdShpSjgEQjDBr5kCQNQW52/fZWZ1c6LHd
         pg6cLdYJAWzQc73ppZJeBQD0NaVNEuuavBE8Ma+Avp0I2QL4P8oj5rxf6coc2MzOeryP
         0hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378472; x=1795983272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43C9bHqJisdAiTlKpHe0KRIkeYtDhHYePbH6vei7RK0=;
        b=J7dUGKeSjaxcuVv0Aen6HfE7lPpzJN2w15/xEenwsyrV8feq7mk8FYp7xmKLdhGBCO
         EsOz1ZmObRsOQ7RmgHeBAb2GAKetbxQyoUWxsWEFW0BUMHKbIuLvsIjCH9Zo31FqyF+d
         EoBwlkftz8IcgmtUjXkWWHW+sNa7SfBX9XhJ8oAcw35F9+u0lLOp6kshadjuKPMHAGB4
         q0aH/Kv8qbBgf9LC380hBYC4W2sxTG4g+tFtHhoQ/bei/hOgVEbHyUHFYsyE8GNwJjj6
         IvajcTylG8TyjLBM2pEQQGmjq/y27Uh10rxRKCrIxq69KXZL1araZTsotmCz622Kqypz
         NrHA==
X-Forwarded-Encrypted: i=1; AL+hErHHO9YipPuVWgyCi+HlqKXhcV7533S0XtgXerlZToIYrwVar+u1svWbZTU26wK3WzI0cibSK0sjaEdboAU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Hl2uaB7ixYtk+77kQgiWoHmTO869jx4SMcR49cJJ0EHwxuuXu
	qxJujJTBpne9yv692CGWmUOYpXSpdn6FGTPxvmxeoF+wGYTTP3uG2Kmv
X-Gm-Gg: AZFdTZf9GMVbmki4v6gWNwtj1zcDd82vsFdKVXixyETbsXHTSoJXCkZg2YXNS3OtV3z
	ELUzMfkyUziU+08V3Yq924/7lmdDAuPqAds2OorkhhXqj+qqFor3sMW9c4w91XD9tmXdojIEXma
	/GWyy6k4AKllX7nEEG5wu02+C29OYsBTMtbqKwPgk02ndMSSyXw37SEHbgoVmFla4nQY+s4L0ib
	9pup4oUHMOaV1TJ9hKou3oSD95/2WIWh/3RP1KgDGz/apUMAQR/RRpTCVEZ55+jvA6so7jlpixC
	je6JKeLGsbfRdujio6Hnw1JKoVrGdeDGpD5DIe3cXgzii8/KWR5hpPl5Z5Vik3S0ChmSkvDVl4z
	rIPIm91DHx0n2MhcYJ4TX9046Plc+9tWdNF+3lT6gj8CkpxbA5G7H52th1RZojU3q6HxioOpM7G
	KtWT+unG1ttDTTQEEagxgqa3GSnJTKaglhOs/YqhCygo8sIdDc1Nbz6mS3EzbgEn6L2hrHKZl4R
	4gP2JD5V1MMfRB2265/SmpdUIalPit+9CiHAlEBOwkRP9RYPQB2ROXnibjxo4nYJmQOJgTB5arv
	v9kHf3r3ST7vqs/Ot4i11QvmCuCndo15z0cHUTPsuq1iO+NRjuTjZ6Wn+8wnkySUdkO0Zdi9Fqu
	YlmY2Hwnqng==
X-Received: by 2002:a05:6402:5652:b0:6b7:6485:2413 with SMTP id 4fb4d7f45d1cf-6ba1fae101fmr5953289a12.5.1795378472042;
        Sun, 22 Nov 2026 12:14:32 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:31 -0800 (PST)
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
Subject: [PATCH v1 02/18] ARM: tegra: Diverge Tegra Note 7 device tree to support its common versions
Date: Sun, 22 Nov 2026 22:13:51 +0200
Message-ID: <20261122201407.23742-3-clamor95@gmail.com>
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

The Tegra Note 7 has at least 4 different revisions. To reflect this, the
existing Tegra Note 7 device tree is set as a common base, and the
differences are placed in separate trees. These separate device trees will
be populated in subsequent commits.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/Makefile                  |  6 ++++--
 .../dts/nvidia/tegra114-nvidia-tegranote7c.dts     | 14 ++++++++++++++
 ...n7.dts => tegra114-nvidia-tegratab-common.dtsi} |  4 ----
 .../dts/nvidia/tegra114-nvidia-tegratab-p1640.dts  |  9 +++++++++
 .../dts/nvidia/tegra114-nvidia-tegratab-p1988.dts  |  9 +++++++++
 5 files changed, 36 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
 rename arch/arm/boot/dts/nvidia/{tegra114-tn7.dts => tegra114-nvidia-tegratab-common.dtsi} (98%)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
 create mode 100644 arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts

diff --git a/arch/arm/boot/dts/nvidia/Makefile b/arch/arm/boot/dts/nvidia/Makefile
index 7fc27cb8e74ae..f06b2595bcd86 100644
--- a/arch/arm/boot/dts/nvidia/Makefile
+++ b/arch/arm/boot/dts/nvidia/Makefile
@@ -5,8 +5,10 @@ dtb-$(CONFIG_ARCH_TEGRA_114_SOC) += \
 	tegra114-microsoft-surface-2-0b.dtb \
 	tegra114-microsoft-surface-2-13.dtb \
 	tegra114-microsoft-surface-2-efi.dtb \
-	tegra114-roth.dtb \
-	tegra114-tn7.dtb
+	tegra114-nvidia-tegranote7c.dtb \
+	tegra114-nvidia-tegratab-p1640.dtb \
+	tegra114-nvidia-tegratab-p1988.dtb \
+	tegra114-roth.dtb
 dtb-$(CONFIG_ARCH_TEGRA_124_SOC) += \
 	tegra124-apalis-eval.dtb \
 	tegra124-apalis-v1.2-eval.dtb \
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
new file mode 100644
index 0000000000000..1b50d5bbbbdf7
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegranote7c.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "tegra114-nvidia-tegratab-p1988.dts"
+
+/*
+ * The LTE version of the Tegra Note 7 appears to be identical to the P1988
+ * revision of the Tegratab. The main difference is the modem, which is
+ * connected to the second USB controller configured in HSIC mode.
+ */
+
+/ {
+	model = "NVIDIA Tegra Note 7 LTE";
+	compatible = "nvidia,tegranote7c", "nvidia,tegra114";
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
similarity index 98%
rename from arch/arm/boot/dts/nvidia/tegra114-tn7.dts
rename to arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 4b1e47364fdbc..e4ba975fcc3db 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-tn7.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -1,13 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
-/dts-v1/;
 
 #include <dt-bindings/input/input.h>
 #include "tegra114.dtsi"
 
 / {
-	model = "Tegra Note 7";
-	compatible = "nvidia,tn7", "nvidia,tegra114";
-
 	chosen {
 		/* TN7's bootloader's arguments need to be overridden */
 		bootargs = "console=ttyS0,115200n8 console=tty1 gpt fbcon=rotate:2";
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
new file mode 100644
index 0000000000000..409df3de17a82
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1640.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra114-nvidia-tegratab-common.dtsi"
+
+/ {
+	model = "Nvidia Tegra Note 7 (P1640)";
+	compatible = "nvidia,tegratab", "nvidia,tegra114";
+};
diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
new file mode 100644
index 0000000000000..00126da319ec7
--- /dev/null
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-p1988.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra114-nvidia-tegratab-common.dtsi"
+
+/ {
+	model = "Nvidia Tegra Note 7 (P1988)";
+	compatible = "nvidia,tegratab", "nvidia,tegra114";
+};
-- 
2.53.0

