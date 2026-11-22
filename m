Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378500;
	b=jfzmT1nbu9Ah/8yXePH2j7D25wj7olGkzhYq3AaOA09/pYdg+IDRzb4DEC/fwxVUojiT
	 /NNX+tQcvautsNKIfmRMvaeHEg8JW/25+O9PpBDPaZesF0N71Ock1nLrIEDtAmmheO5ED
	 cWebz8nTn7jmEFE3T7MCJQsKYLxZj7DsDwiHystTEHKOpPqtqYKmAKpIbblTyxn9Tz+4e
	 3fU0/HEyzG+D6FhsdWQt/Yjzx1t8A2U99jp1PkvVlLFjTQ5AA9TrHMrqnCD1Z2yEZynXr
	 IJZueyIC2ICXsiqrDn2sorn4uo4V6B82RlnK2eVJMWVc2KfbdumNAcpqHjmdPhiv4gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
	b=eq8mlRA2is02Rv/G7L/Z8fQofserYeaDNpNHa2GuNNWjnd7Exm+zW28ssIPpY0dUHoRG
	 W02zPVdZRdwOdrl4zI+cps+kBrRbK6WQfP0CwCsglzn8zdlhT8lY4xB6TmkLvmrCjsWYP
	 93fRzRqhQo/JVmMUoWwLL9CE/ZV8ntIXlpTolIBOeLzKQvOvo5n/X8/jZt/BzIC1VMp1o
	 TTsaCtg37lOX/Y+HuAiQfR4DiX+9ZnecTu9/YJAdAidSSG2yrEcDN2X7zZ86kj0uEQQ5F
	 4GiC9ULwpeJyd6w3lUFnSGIByz+cliBHFvpLrkdqoUziC9pIabs1tIyT1NVlEz8WTFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMNnYhvk;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8509F606A335
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8509F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMNnYhvk
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c513a854320so441057366b.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378498; x=1795983298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
        b=oMNnYhvkB8Cvof2QHWD3pgxxbWR+ocjTtM4HIZWTIWD+DqfWGYxSmoSbKccTDAi5wY
         VwEV7mbsNh6r/Bvei+D1b6LANI22rW6gIYszhPwAxhAuddFkog6x2Rdo9dLgjwiOghZs
         tf38d5D9vbNP3sfyiNxKr6xz7ZA3bXA688n/gf+2zsSqWLws7H0peXw8OtQ0SCKU+6i5
         ILB0cNn7Ip6uuUqpro4IS2BmihFYNj9hAkHZN+o/lqnhjorF3huc/AYKRm98+nmhFQto
         Zfyi3MuYOC5zpIp94kbaXcj8pfZ3mfvcsuL5eVyFsAFZz/hbvkrfEERI0zbR8ghY3+/u
         dgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378498; x=1795983298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0/AroVXg+wKJ6uFX9onZDHbggt+VRwYm3F0cMN9wqxg=;
        b=UKeS2Z6RhavoeoyH3cL+JEn6h3cSyge++Ua0/I3B3NoznGIvoIu9PNshlwhuJKNyKs
         /Z49fa/3oNIrl9ty/wWaV2c3/Dydz2n4rHoAjLJiw+uNprvMjIJIjRBQieF7jCbtq5yN
         BlQ4+jNrbGGiXyZeqPgiR6EO6NwrUEpvXC52cPg8QkPDD8P6btG70yEhyT3K9GBktaI6
         mg5isHfsawCdIXvKiAOlb5aUruEGAzK5OjjZgoMbQ9cRrPetOQAXbM5zv2PVO+yHrjne
         BxrsBdAKik3v7wQFtK55jBk4cL1egfG4QBRquujk7HLklFuDRMHEvDI4RQnng4nrGl6Z
         J8mQ==
X-Forwarded-Encrypted: i=1; AL+hErFgds3o0ajo0xmA3hfkPQswNg4tfXAZyBZP6ZPDeT9do/z3BjL2WufUiA25rQa29Q5+v3j9npZsFlEgJZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XolKef7OKJ7Lfp6z9XXs9rh7SbImE043PdHcQ39yAoQCN2nA3
	vI704bJUCrGILXfo1EE4g4Tq/MgrpueKKEmIFfrrxl7NTKFC28hUPIgR
X-Gm-Gg: AZFdTZeiVNeW0I8fuGy49Jy7O8/277wfY52QbxTXvSP5x6HSh1wF6PzmppojGH8Qb31
	gcSztBZmS218isnYZvr9eV6WNcFjEQO9JHSOmsWN/b4srhRY3mqBkmCaPwTkBb2uWi6AuneMeTN
	CFPziNfDdT9vB/+Y3/EBHWTb9xaZMabb1eCi/6UBYrqogI7hLQBE8KUYQdydNTcDtze1FNlm4WC
	lSf3rQC/nntBy0hEkzRJBi0fmJ58o+MBRiqRFAjFa8ftwYQUeZX6NhkOAMevtXbIh+l7tBj7RMi
	SOkXM2KD+ZQ0wMQtOIm43mM6kKNwdp5gTcmx+fIDC+enXoeh9b1MjAlPXvq8NusbvrrJlcwc75Z
	5oGftSvxPKatbsAEKDjpb5wM6H6q90k/nQOF5G1iGvyX9wSPGoZpcej4tbuxKGpe6ib9p67BHea
	g0Nkbp7z+Yvi9MxbPToBHM2txt6IXJhingz63cnPYvC3dL9pse2hsl4M09XthheQSNT6DTtZJjS
	XbAv+lBR3w7/S88J+gaXyxH5xpXZujylSvqND49WVSbMZmksfaWfU5ZpUjJR/o2vpyYE/WlRYpn
	jjnD/RFoUk4Xvyys4U86gtx6hdbfUeAoEzpY6Ba9cXMB/XDDu/ZSvxOMpJ5zcDGkoZGOsodsc92
	wlR9qyCIkFQ==
X-Received: by 2002:a17:907:7f9f:b0:c31:c767:ae0b with SMTP id a640c23a62f3a-c513a274be7mr837483266b.0.1795378497880;
        Sun, 22 Nov 2026 12:14:57 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:57 -0800 (PST)
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
Subject: [PATCH v1 14/18] ARM: tegra: tegratab: Add CPU DFLL clock node
Date: Sun, 22 Nov 2026 22:14:03 +0200
Message-ID: <20261122201407.23742-15-clamor95@gmail.com>
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

Enable DFLL for Tegra Note 7 since it is now supported by Tegra114.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 42a10ec5ad4ee..cf8cd037a732a 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -2133,6 +2133,14 @@ i2s@70080600 {		/* i2s3 */
 		};
 	};
 
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		nvidia,sample-rate = <11500>;
+		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&vdd_cpu>;
+	};
+
 	/* Wifi */
 	sdmmc1: mmc@78000000 {
 		status = "okay";
-- 
2.53.0

