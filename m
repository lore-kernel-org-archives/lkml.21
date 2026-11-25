Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605999;
	b=Jnt9EG1im6msG+2o/lnUvwYM9kaQmgvyAeVtHtbYafiqfPH5nUORgee6b0cKHNjOu2ID
	 +MKiSicUeLFf6XsDv9A7z5+FZ5bpXo23kbzOUIlYdOVeDPQj9YsulNFSsQL4fUr1AvI8z
	 Iv1BDo4Z0U46vonyzzlp8YMj0V5PblrCdOlkWt0W2vCc5IEiKiBek42N7+MXSSLYQErZb
	 /NiKDwKKGHRnBhF4SAqrUVIw0sqD9c+BAkgUwsJv0bE4DxqqaFlYUQBsmrsqzIl9y8zIi
	 QUdGCgFbpHPZvr/m7i0+ZdNDGLVWH8xaAa7LxfU8zxf7YFNsmkh5kv7sktH4E+5Uw3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=KWqL5LHD24VvWfH7zzoe7022Q83RX1Xasd7f1I6MsfUIWBdRW9AlFB5n3jV705i/QjLO
	 BNjHRoqjYCkzgU/k2pE6CESdIcB97N8nMHJvpQ+kdPPvEPzn8PlNrReMGyavpzw4e5QF+
	 z0vT1KvWOATIDaN5GIgSpLe2rKvn0apD+8qqjkAvhwO3gHXbeEcUT1OG5CXU9plp7jl6b
	 3osluS/sVHVXE1GGDaCGSpPt2OAMjBSh/OJ4L2UnkbICEU2rTBdQ2PZRPpCmI4aU3+IS3
	 x3mdU2QebwQPfNVqA9wc27Qyt5JArOjhUIXzqsFTx2uxuTS21EVakQ9/fdwOmH7ic9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15884606A6AA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15884606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RVGQ8Hgq
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so7645621a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605997; x=1796210797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=RVGQ8Hgq8nSm+KEOOWBIlYqI+TMl8HVguwqgFXbJguqc0lDwsjLI1kgYrBgUym83sx
         Q+sNBxZzC8ENFnb720pQzCWyGyxn+F1uzf7mKSCZjksGaetzcmbIk2S5bODx01feZ7HA
         5ChvPBgvjQKG4KB4m/LKfTYEFdGg2F+dq9vlr38mJ1ILKgdJ3gc9j753NII4BxpJ/74h
         usfYMs3nixas1jpCb2MvtF+unJNTPEaxxu0lyJr/5jiw4tKpQjbWArt+Nhg5J1Q+heiR
         cbU+T/8vdMOaSh3i850GylT1WTOcm73gCFEqukg7wXkHAZ0c4D9kNucePNH+MDu0cugl
         3cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605997; x=1796210797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=A5ng6SK59IICnUQG6jIIVWhQ04PlHwSVSmeOWeIY40wt8G/7BFOteHVOIGFruU/3rn
         Z9cNASECr1ZhN+70r99F3jAoJCkB0RhZBLiK0xCMcvoA+NOECAkkbGvH8ecGccbt9S77
         oFtcryLqJkNzsyc4DmlZhucOJQaDxIjQLaYOdoQiO7JMp2eZAtQSoFS7608MjVBwX9uP
         6jvKgzxoVUl87PxF/JvQp36BUgzyUSjX3CusYOoVTGdTuSx5Wxh3f4QbChXjQZShy0tu
         T3U0rnx3ZALDQ4NRo9Cr6jbbSUk/vwvwZwvAj1/j/3Qfc/SozpETG4jPUuLqBXWp7siW
         +urQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ+0mFj3snUT0GFvBB1u3E7P7MJ1yHCHRyokDnasd5n73HREbzafd1Qu65xSGflcTuXu0K93R5498jY1A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Szs7STGtizhWQ7e/uq3oXg/2TO0WMjPHTBMQvpQPnhYUPVuOC
	MtLXQojBRAjbBQbgdVXjY/+nRzOMc0gKcDaYXSln/LbSUwyGREbCDD3/
X-Gm-Gg: AZFdTZf1RIwTjXMEAiSK8o2CzxoVZJAV8wOOU/fNZ61Plil1NBEAqGlXFHOMaDdIvPp
	cpa5d9ZOP6V8lgDWcPA1mvl5ILYZPSRaZBxh83yJ4DR25TOAdTuXHHLP7p1CD2T0jikNmN6LhiV
	u4+YOF1EpgxVIO1e9MTIL5Yc68J34vhIARQwKapXMOP5nDd+/0CmSpN2LimnIxjaAlxKFZjf5oR
	bEBtDxHKPA0H34f+NUflyy7WrEHfsOPVc6WCCIpjWBplBWk2XkTnX4vaHG3hGSmPNbOqCCWjTLs
	lcf5XYRuYvtnjgvl5oY1gQfizI7zQ5kxBo6fKR6GBGeHGrLdGp2ZQCxUZyjc8z5bD2yFpwQW8Ma
	8RBwjgV817D/JDeX+PaRERf6Qrl1N0fdpqrgW18fQ8Fw3V2w55Z6jOKEs2hUMRHkmL1z0dPM3mK
	1PEUNkKV0zaZjn2PaO5TbyNQZagBXSMoFLUj9yudxKUjjMUOTkeDzby3e20/5Wk0b430B0u2kBY
	Fgd7KORxTcEnGV7yj3pbfsuw83OfgNjoumOoeK5CUAa/geSygz9pDiosROXNy0Bsk7pwWR21fJV
	khSvOXLJqxcF7erh0LIjchurm0cGsuWe7KScFpH+UiHF66Mtkai09T1QRvrmUB72Z7EoKU0m2r0
	sivQ9F89JqoZexx0jVcMbIku+fPAbMrs=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:dda4:f72c with SMTP id 4fb4d7f45d1cf-6ba729046bamr8500699a12.44.1795605997391;
        Wed, 25 Nov 2026 03:26:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:36 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 6/7] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Wed, 25 Nov 2026 13:26:12 +0200
Message-ID: <20261125112613.237333-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

