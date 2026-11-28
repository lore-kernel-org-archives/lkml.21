Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795838116;
	b=N5ay4Pxrh1yZDOKwywJ8hcEGMQKu+ieidgGMd0e5yYgZ2/bpfmsI1A5Kiy2GC1mQdxqb
	 W/JXnI2ShMKi3ua8/KsV1CA0b63TP+09IqlZJ5eBGfa4SRWQddpyuEJJQbfMt6SZ+G70W
	 e9Y7TpcBqgMzYi61NoIbZK0cdlVb44N3qbNhUdlb+55tQzLjzkjjZltuzSYNyGyBS+Q4n
	 B26TLjHbELYmIxikrEXosEtXNTis8TR7TRcRO8riDRM8PrvujQ7M1ipfK622lTHpithxX
	 h7tOfGucGYBEMLHmsF1Z87F2sNBEDFHHSHsc68C1F09V2MpEhCmGoRUnw/QyTdMOynQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795838116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
	b=tViAQIB+X8sO/k7Zkt3u6VDdl1TSn2eDWbs0HFLS+Ip0BMSUV4STfRjWFz13fgFSwjVZ
	 GGrq9sZ3Zk2o57ZpsY17b3ZBP/ACe/LxB1NS3qo4VGJqp6WFoSUicUEKvcSKslj/cDXV0
	 s8GaOGh9E06Dd5+4ypiilgaslelCpkzspfz3jOZGZlk6zty+8P2ywKgZoNoXc/cIkot1z
	 YFAkpW8IMYqprZnQwfaH7VqJPeZ31+qVPFeNn//Plrrazdjh2pm+ATUuSIZBspg2x7yEI
	 Q18qAv5kQrJZClbvrSTgoELUqfMe8y451lEzQrTBrABoJQl1FP4xXkhVzsxZOuWp9Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqDNYQxV;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C6F606A332
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 03:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C6F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GqDNYQxV
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f0918f9e6cso26137215ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795838116; x=1796442916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
        b=GqDNYQxVdzmPk71SYW4P4fnCAOImoIcnS1MfGYCtTPcLljr6z9flP4o4ZjhCgjqkYo
         F+OJsLbkypDiAtouP4r7JXfeb+qzBh7V3qodmbDEM3jgBJYoFsFGQB+0DmfEGxejWBQc
         fZM1UMOJwNpeEVKuSWkMg8lRStrvULmsnb+djFUjWzJL+XjVaTqPxFnUy8FMqITnUj1I
         iseRVKbUYLW/Ow52oRFUvea3VMBWIQu3o965QGtFzE+34KCdyCb/Dr6D7wFMg02iGmy/
         veluhCk6NWcQs3d39CGFgUX/mZVuX6mbjQ7HimijheF1kUesEwbz+0AMao4pVSAtMhgb
         mlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795838116; x=1796442916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XmgtedqGjyGKnA3AERgrzaJirhR7SRXn+PnZk5B5a4=;
        b=12apViU5yWofc4hlRsq69tWnMrKNDXhrZEz1W3v/hpzT5hN2c34QpaE5/G6CpTWPBw
         0rfl7BXNCAKOvgiY2VsmA77Y0ekn2kc3oIIJ9Zu5Ok4cV4umrNkRZuGwoCBISqoD7gXn
         xFVWOZs1FxXfjVOjUQ7bzwTaMN0NCD5dHeNWBpNDJGeUhEXljXpHUAAvx1/72u1bCtKw
         bCe/w0NzuLMWPCQ6vVZR74XFcECTjnZRP6VAoU5j4vLP2xbRrcKw3GZPZF2MoQISaJBL
         6tQKd+zzq4+iaNCjcw0BdIS91MMcMd8gAJTDf++Rn/sfpPtEeLQVSDKOjFk+7C4Nhsvq
         ZXMA==
X-Forwarded-Encrypted: i=1; AL+hErGy1G37p3H4ldcpJmCbLP0McgfUiF9goRIw15pQGm8WVYtAedcHc2Boe62fHqlWiprYOcZT5SzEH861QX0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V6E/oHc6UqcrNEC2CeeldKpwSZzahs55wMKmrFdC0R1RTlDVl
	IMxsgRThVL88cYgBY3P4Cj7q0JyrbmsJkP8+urzldBz7wcIH0LJLqYjm
X-Gm-Gg: AZFdTZc+jKEMFc0aRI9avLs6/T05L7fHThdZOc/RaFKZg9HHnnrT/Hz2wIhWQ4xkCZl
	6JgBEOPA4FSxjgV5AmXqO+yTXOC9JROQZgkgMv+NtG7RMPagX4QQNfw5Nz7esbYb11n7O9ZJyBb
	v4VccyNemfsw9YZFqeCz7sxmJpGP7fspx7ZVGIBvQaMTAhhID/p6v0FYHq2NnBeOuVFKZvr3vsu
	by/jTeC4qfcYjqfiwiYHRhVXYyYhcNd8XWqM4K+CmMTHSOj0AYlYAS1dC3jvQA5kW3btjvNwa17
	4G8wG8l5XnUBx4DMnZ+8S+mocDZKHiosBXP3ExirtSc0Z5U4UHzr2WfJWRuUFGbJB4/Ti3sKms9
	+HegtlqDSY7ENMHnJxNWiL61MM+6yVGp1baqnCQp1VtUlj0aJ3VKHh09BTmI3bAhrksCUwZfDTi
	JbZ1eu8gCzPw6UbiOH1zOM6nX/aU13np5QgozQffXmr18NMzeGxBJ+iuL+VhafVAl9luJqG3ySd
	XWaZMUQcyRMXcNjQ8gZ75s8U9sT8yGtelapODQ0kpcD+VY4BcvzwWfJDzEKG6hE7zyGhB4jynvD
	tTcIp0wnFkFKe3WetB47oe4HYkgU3UCjjtuz7IVCmC9aHkzg
X-Received: by 2002:a17:903:19e7:b0:2df:a4d8:57ad with SMTP id d9443c01a7336-2f03f271d6dmr235900075ad.72.1795838115727;
        Fri, 27 Nov 2026 19:55:15 -0800 (PST)
Received: from debian.. ([192.227.246.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f099a4d875sm89190595ad.37.2026.11.27.19.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 19:55:15 -0800 (PST)
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
Subject: [PATCH 2/3] dt-bindings: arm: cpus: add Phytium FTC310 and FTC664
Date: Sat, 28 Nov 2026 11:55:03 +0800
Message-ID: <20261128035504.760778-2-idleassetsd@gmail.com>
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

Document the CPU and PMU compatible strings for Phytium FTC310 and
FTC664 ARMv8 cores integrated in PE220x SoCs.

Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
Co-developed-by: Harry Bit <idleassetsd@gmail.com>
Signed-off-by: Harry Bit <idleassetsd@gmail.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 Documentation/devicetree/bindings/arm/pmu.yaml  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70da..658da1fdc4 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -206,6 +206,8 @@ properties:
           - nvidia,tegra132-denver
           - nvidia,tegra186-denver
           - nvidia,tegra194-carmel
+          - phytium,ftc310
+          - phytium,ftc664
           - qcom,krait
           - qcom,kryo240
           - qcom,kryo250
diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index f47baaefcd..49976c889f 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -79,6 +79,8 @@ properties:
           - cavium,thunder-pmu
           - nvidia,denver-pmu
           - nvidia,carmel-pmu
+          - phytium,ftc310-pmu
+          - phytium,ftc664-pmu
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
-- 
2.47.3
