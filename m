Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795838122;
	b=Y5+5Xr1XFv6gju1fMskysdcc+o5ztvhRk10MiaTI/GeyLPS4U7YlXqTtdsBGiRRHT4jv
	 7xBC6vH2U59fPX28Hv+7PvyCq4jk8e7a03zIp11SWYJu8ZuEL504Wc2GScz3VxO4yYnOf
	 y394X0BcogXiC6g6NR4x/qY44HIUVxX+GP3i6UNBWKxTC1hL2PR0+Qx/fnuXVVa9uV94i
	 14HPKy7H9IVd/9r/eddQDYjqi7Ckpr4oE9XFkxc4XJkVovM0UzEtfEeJniEs+2mOkrkaS
	 Qh5x8Fk2o7pEBW4lbG6GeaN5kX7TbBwpaPFs4fTBceGwJWy11nOP5XDfck0gBshi9+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
	b=jrx8ukj/cb9pwiCDqgLCpZRIezfHiFCB8wlFyvlf2JVD6WYH6KliBIzpP3ExObzlHZ4u
	 oxia5hBfF4EONwloPSTlnhG6iBjh9q4z4a6+fc5CTFCWqRZ7UwYHJTK+5sQXo+ODOYT83
	 dTrw1CdUq6wTrwgxZNxH8TqnBW9syKS3qlhwwMY+/N9/rKi5SQtReJXwFOLRj3x13vib3
	 JQ4ytg6loA03DD31UF6sk3RCIKVTQTcPaHe5giXw/C9MMyr8kvavGzLrsJdcuw70cll5z
	 PkDzTv4uwdBsRyHhneWOWaGQIApBfnmJ4dkD0NKXlQvPq1g9HRZ0OvbEmjGwZ5vkENQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBlWkLK2;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D79606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D79606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uBlWkLK2
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f037bc348dso68693945ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838121; x=1796442921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
        b=uBlWkLK2waP/TSyi4w4kaGHKIWiiFOGOwrqCs/uxDqONP5YWBZDqvVdRr3eFUy/zUE
         zPQ3gR/OSMtJrWvrt/AxCXtnohJbmjUfHYkBsYxJFo3E8ZjdBlt6o2ezX7t3BT/7XVLS
         D2zjik+AszPtgtXNxPkQF5HwyQa4K08lm9y9FLIqk68KnBWvusWbO5QsZ9XXmikVGCCh
         IXRL1jti3zy9+Y52Ee38/msXCuZcjM67dHd8NcmJS1CVJcaQ6FQ3Kw2H8cz4THlyIylH
         hzAoTSvCGwqccxQgBPtHVfRXLzXMBoPUumqxeRSc9NkGvfj4sQZ2paXDvJHVCsThjMzr
         ILhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838121; x=1796442921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=enxt/986nFOJL/Kw5285Yz3R6sMYq7dFGHkTphEST5o=;
        b=pt5rRPucAUyOcGYNLEovRDGqu2sL2vFkWvOEmpRBFlZmF2+NwH6Sy4ECfaJFDnjFHw
         XHJLSUR0QVrocq31lwX4++UN84entY97z1xz7ruiFPSHyVdixbA7nmX7iouuHY4iNn9Y
         5toQLm4lexMePXscXH2hDBzwyPTApvDAU07YV8Lzh4Qi6u6eiZlOqrAnM9WUjxM+AlWX
         us8Ua6V1YIRKT1Vb2cjnUzXcA3w0IA4CtAAoItJjL8yKtf5hMuYXekCuI1xOG8arOvQD
         6SLmCcqSLbsEEvKd9YzpSqpmm+oYWfaDa4KZQ0eLMc0GxpI9fr0eOHuxFNtGbN+cpEEg
         JwEw==
X-Forwarded-Encrypted: i=1; AL+hErGLy0mxb8juxMlHSM5h0tqqXGnnRRqSdSXYt1h1XviITvNTp5uOHH9s2Q+11aPp540b8/FpgZMQokwO7wQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0ZCcHkebQXH26Z37BOy/pwrSzTM18+l5OwHxwG68RfAdfe8+Y
	cbu0EkfKFlC8obCF+BuOhQDMJywnHNfAu6rUjY0lx8bAXsMQem4QZrXZ
X-Gm-Gg: AZFdTZfYKyiBCWWToK0qMUm3YpfH+XGD/1evoBX+oH+RMLtuDO8bvOS8YUs3muSCU6J
	AIZ0MkEZtg935YpXIf3z48Y3ztrWqSm8xUZ0PJWhaflP1P0HDks1GDN7arc96XzKSO8o+BD4fqe
	u/aZiUYANliXuSJLtX20KhIT/a+XR3NLSmixu6BLKiBXTCuAeLDHzimLToXAATpj4EKwxxu3bPn
	SPS5MgNRp//QQwpFp3oQ1RZWL+MHHkuhhGwQf8OQTv1M6DLVQfIfc9oXLzFQruI3c1WtCkz5pjQ
	3NNdfwK/TGMkzBbLTvdB6nd5dp127BbT5LaFqGQe/zIsxKpGqZigoTifCtDCoCjlWnTo537VAF2
	UPXs4F2JYqPzE8JQS2JHf/KVXwROOl4o41xo5MW7q1nX66KMBhRtEQapGZwFESPphQ1fXi+o7y+
	9cW5lRgTrWGGoDJeRGkaLmFGtSuRp0L5ii+cT6tjTZEwKXPQqTFciICE8G1nkGF39IklkZODttS
	5BItuegktlRY39oUEqWdtRu5fSRWX3LULVs/rnICmJ2yERahIHGAOwu7xktoTEhwCsXEQZLlBXp
	mzZKOVNtuDybP+boSyYhGd6mTLQ=
X-Received: by 2002:a17:903:4586:b0:2f0:1f25:a4f1 with SMTP id d9443c01a7336-2f03f1cf6f1mr284743595ad.15.1795838120840;
        Fri, 27 Nov 2026 19:55:20 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:19 -0800 (PST)
From: Harry Bit <idleassetsd@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Baozi <chenbaozi@phytium.com.cn>,
	Harry Bit <idleassetsd@gmail.com>
Subject: [PATCH 3/3] perf: arm_pmuv3: add Phytium FTC310 and FTC664 PMU support
Date: Sat, 28 Nov 2026 11:55:04 +0800
Message-ID: <20261128035504.760778-3-idleassetsd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261128035504.760778-1-idleassetsd@gmail.com>
References: <20261128035504.760778-1-idleassetsd@gmail.com>
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

From: Chen Baozi <chenbaozi@phytium.com.cn>

Add PMUv3 device table entries and event mapping initializers for the
Phytium FTC310 and FTC664 ARMv8 cores.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 drivers/perf/arm_pmuv3.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 03359e0783..42f043444c 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -1559,6 +1559,9 @@ PMUV3_INIT_SIMPLE(armv8_rainier)
 PMUV3_INIT_SIMPLE(armv8_nvidia_carmel)
 PMUV3_INIT_SIMPLE(armv8_nvidia_denver)
 
+PMUV3_INIT_SIMPLE(armv8_phytium_ftc310)
+PMUV3_INIT_SIMPLE(armv8_phytium_ftc664)
+
 PMUV3_INIT_SIMPLE(armv8_samsung_mongoose)
 
 PMUV3_INIT_MAP_EVENT(armv8_cortex_a35, armv8_a53_map_event)
@@ -1613,6 +1616,8 @@ static const struct of_device_id armv8_pmu_of_device_ids[] = {
 	{.compatible = "cavium,thunder-pmu",	.data = armv8_cavium_thunder_pmu_init},
 	{.compatible = "brcm,vulcan-pmu",	.data = armv8_brcm_vulcan_pmu_init},
 	{.compatible = "nvidia,carmel-pmu",	.data = armv8_nvidia_carmel_pmu_init},
+	{.compatible = "phytium,ftc310-pmu",	.data = armv8_phytium_ftc310_pmu_init},
+	{.compatible = "phytium,ftc664-pmu",	.data = armv8_phytium_ftc664_pmu_init},
 	{.compatible = "nvidia,denver-pmu",	.data = armv8_nvidia_denver_pmu_init},
 	{.compatible = "samsung,mongoose-pmu",	.data = armv8_samsung_mongoose_pmu_init},
 	{},
-- 
2.47.3
