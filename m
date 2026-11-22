Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378480;
	b=O8KeMCJkIGQv4NtdX+I429Vb7HAyyN23P6OP0W1K3dufRx4cQv7aL/M2Og9v+EAIKu+w
	 1XXuYjl8iXgV5S76O98MwJkhi25HFRbHN6L56ATZeJRySpghG2UzPfrOzVO4xQOZrZYHK
	 iAnOTlivCyHOMi6CIe6HJpkcddmUGEBokfBYJxZ2/xROeZF8MULW6ZZpRzECRg3E0htUk
	 ZI0Xh8n6xYcT6O1isEC4v2LOLSWVu6Lzw6nNzp4M6hJtokOufH61tpZNWfIJn2kkLrTZ4
	 ppMn6X+nsTx3hdkckSoGO6euBb2eHXcB+79bYwaVwiXk7NEgzCnEOuA2FdODL22CJXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
	b=KHWDkl/qDjyIwVOMgvkdnV76joz1lNWcxObHB8T1A/0RdgcVRgDfZHAljUdMPz9kJE3r
	 V2/l4NLM4XzBH/FRi8n6DIvg5g7EpWC0aezyCNY9YyZv3BXNRqHM5xOLMgYEO5heFKn1f
	 XbQYJPWPPsEAhHubG28X3bT1Izyj8qWOmdKTH+Zz1uOc+/DwUyFtU236CzDAZQED/4yXk
	 oiso0JMnAWXmEXUnqxn5O2Sg4rT1xw65IaJgKXVdQUca9IeLsTP0NDE+/uaNQdBuBYGND
	 ch2vpE2KyVawiqdHp3KiPj0dm1yN5c13whn1nSDysCpm2w0UMXvNuI/GcYw9ij6atxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7UTF+Jo;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CCE606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1CCE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7UTF+Jo
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so3446896a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378478; x=1795983278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
        b=l7UTF+JokCqBU6VrJpo17WRBv3eGYi4FnWAlc2Xv7GUlRvrFTt8ZEo4zZcogx2mkyC
         PHOD1v4KC/TTLhXKYsMHZQ9y3MLg2KNhTC22emUWRB7tovYJB4JirU9U1YzVR7/f6Wmi
         EHzmM+TMFbPqOzq1XqRjXHGhbwy6dTB3OxOsShl1bwdG7lFdQydmV63KJ0k1Lz/1XWKZ
         PXkzmE4mOSgt7g7DuChgqqHbk26ePf/m/QnC1oflW6BbmZ4DgaZ9no1uYIsNkkvP/MlF
         /Ki4bwJ9masRw+++WgBIUC3W5bqdTAFZB9ews7NXrj4R8j3SkqGhDl2pPsFcArLb+Oyi
         DTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378478; x=1795983278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
        b=dY32xQX6k9IYerawIzA/KbinS3YWtelpsfFreIcmAiBGT4OtXs0FT1eO/XlK+KILGe
         m+9gpM/OgkL4nVAkICI4X3UdxHYwMu8zUQp2yZKfmc8MO1Yz3DZvcT1/8MLwQ25jzx/p
         gwkGBEksTstfcCuswo1jTb959OQww8W59rofzNrFDxzWE66ufQxFiZJ+nOfgS//mqjya
         arrlRkIaq0OHAXWSA7/zFPdtVD0//jkw93v7A7pIjvk+WuhbO46LvcZbLOSU2oO23BvG
         jBzlk6xZYutKQbe++bUzUmdT4F/MI2rPyMiYlC6XZS1fF7In7Ifg9cvAV4D4P7Xx+uG3
         FJCA==
X-Forwarded-Encrypted: i=1; AL+hErFf0s3VrkAIVwz5aTckGTp8UDeUp4DuPeXSXO2LiHz1ljWDUhHIDC+cw99KAh0vlhvle/tGBuFxn+hSoGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbxs3FM/2WCS1+EFVjFj/GRuDZWWRR3gw6m8Zvf2jzflWgA06
	VJ8jz7KPa4YISso2hQRawGnzn4yLvFDHoDl7bFlp2ncrE+OL/RwjajV/
X-Gm-Gg: AZFdTZfQCrksLgIZA8VCaDg9eiZ4e9ejuo6/RQQw02C7IiMlZwTTzie/EDHSxM7xRmr
	Xfw/Ch/BgbVG2zgkL0G4ZHd7xSamBqKQgXQ4/oRKSazmQ38tFavjvhqFUrgDj9Px1ZOSUiAXGWY
	BHzs+oSLY9csuusnen7XfDF+JdxdIbHrBtuo9twJV6IO0wM6YKVlPRBmmCyLBJZUL4utecjY79s
	mEMHlmx+nE9Ar1K/E9xV7Fp2Slo68vPLo9K/8NCiJQv4NB5SsOYzUPBeCs8fUoSkOloEm3M9DoS
	N5XltZwvpoaHed5upiCmAPoeXPnSWPgECCamGsmQmRbfx25xOJ5CyN8CIgrgbvr+1qWP113OmVd
	pLCfS/jbBckgEJ3CHhdi5Akmq3881waPZbrp0Ud9DlyUuwWyPV0qVho2Jgoz77Ptn/QKIxSOOez
	mxOT18ac5B9EMK3eXWNyQrMxunFCKUmya6pcHMBZuDFmsD0ZjL/vRYJjwDdD5QVzn0m1A7Tdfrf
	pr4ifNs7geVxcAJwutdDrMhdvBWxtWDwV9o/w47FBuKqYdR7MevPXCUoohFVxBmFOyddQJ90yyw
	pcmfwEgb2mIA3hlJggK6gjJlLngulNI0ALTQ4FM9+xpBX6X2LYsinlp7kqw+kfi12ilmFz8nFk7
	R1R7mnPorlg==
X-Received: by 2002:a05:6402:42c2:b0:6ba:9142:da2a with SMTP id 4fb4d7f45d1cf-6ba9142db1emr1776415a12.21.1795378477854;
        Sun, 22 Nov 2026 12:14:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:37 -0800 (PST)
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
Subject: [PATCH v1 05/18] ARM: tegra: tegratab: Bind VDE device
Date: Sun, 22 Nov 2026 22:13:54 +0200
Message-ID: <20261122201407.23742-6-clamor95@gmail.com>
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

Add Video Decoder Engine node to Tegra Note 7 common device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 19f5549867a7a..26f1f7dbcc4c7 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -47,6 +47,12 @@ panel@0 {
 		};
 	};
 
+	vde@6001a000 {
+		assigned-clocks = <&tegra_car TEGRA114_CLK_VDE>;
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
+		assigned-clock-rates = <408000000>;
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
-- 
2.53.0

