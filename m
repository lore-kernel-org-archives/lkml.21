Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425652;
	b=uxpKWqgcNWnymnk73BPnDQhJiFDg7YonnQwaXJrYlPToVqEb2FGaaOCfzzgVIXdHN0UC
	 egqAuCFImkoE5WpsbWilOxMWa0WcZqz6B2FzqIN54f23CTyp7pMNQQLAuvAXY6wWX6DAx
	 fgc+f/NJBQKJe70gLkQysWkvV8TaTDfeEZQ9KDAh291KofQVYimawgGxnODw4CJjmETgw
	 r4D4SXpdR2shOAnm3h8KbCtOzl3oZLdelf5IszL6f6a6Q5KOkzrpaO2hTUvi9wL3RCeyU
	 UNZZb3gpa84qkgqKD3VL3aB5fwRDaq4FDpGw3HRespcIDVK0LdJhfJi4DckWjNYmbfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
	b=BaqPTXwjERcmScgG9pzY8NhJXZLrvPu4tfDnpbA2cjKAymblkD8dPvaUSEDxhI3iDxTz
	 Am3+7pzwOEOTtO1AZEXyVRPXQERZHZnrzBDGtrCKhKXBDyhqlEczMG9ISonVXbxIve4Ke
	 yhAds4qR1Jy6atsuYbEB6B2l1CzQIdolgdogvkKP2tj6nPQ4mXSLuxS694KzIZfOoS8OL
	 8hYo0HyFEjZLNSXtOiS/OvEwNpru96xywIRGuUtCFzceFJ/PV+Tj9flLOiacEPCJ/INSW
	 VUubRzMKpbf9mP4IuuMuSYbGyRS+O9CTC2AF+BqJF+pfNuDp7WLKWIKWmJeTbVbhYFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZnnMHLyy;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DBB606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DBB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZnnMHLyy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28530565e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425650; x=1796030450; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
        b=ZnnMHLyyGEi85eItm4tPYEAe8+FkKV19phLWW9u/kEXQMLTfvMYy7r3G2HRniYSz3w
         7MW6uyj4mxuTe3P+B5/kK6P2ruVi/OoNcpE14GXUoA8hybNbSkAVmScSpX0J3ZXKnu9T
         yoChKBwHjhHiT5MLku9vce5ZUS8pWpYebcUpFG7qku8GUWTg/LvkjCSOqtxP4nraIB4X
         eapoyMmbQUQYcbHrTYv5hHIrHlflqQZCIxeoSqBQC1Mpx2fkmQA6k9p7J8zG1TXt47e/
         KYVBu968nHtGjDHJN2pqTjxKl00GZKuqIZa4CrgW00s4fKdMo3XtLfI+oVZJTk99r3Yv
         gOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425650; x=1796030450;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fqPuJJQjedPHkwWmiLlO5o36uyAtzYkH2qkSAqw5MIk=;
        b=TiMT8NKgiGe8ZL4ZxT/GyPX/LW64NZ4oC2BJiW5kVBoiNPRhzbgvPEp6FtPyMTrGix
         rp368AuDriFnjHEHS2n1XWg1qZPP516UtH+s+rsPx5gXH7ovG36m9Pi1BjFrw6cfjwG/
         J4/I6EYo0c6ma6Z5Y2UEeD1ZzCtc0He49zOje8i/0DmXGaRRLwoBIj82gDs0VIPdBWdo
         qy6/UlYRPrxFV103I8UjVTmOGTs/Y5np900j4jPPlbYA4FZoLN99zetTaALsZC5+C+Xm
         Pcx+csGmS8xiVYoscYJLuEF95nSOXv2BLXXjUZel2wudzKtZQNF6CIaJdlMBtbLd2iQs
         R25Q==
X-Forwarded-Encrypted: i=1; AL+hErGA/SP2eRd7GIWWeYjlyZYKlxDFDQVm/XQGy/EoYy/AC5+u/GdmCRsljm1Uf3LjSOsQLnM0ZsCyVEJPngo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+I47y2EdVj0sd3gxcp/o0N0iarhUBwwflJ+z2BzsobP31wHOkA
	pcLpAz7K2bUg6l9vy7HlXOjPzCJE6If9d4EeqcrCNC4XgZNZDvd7smmtn+GO8PlcoJ0=
X-Gm-Gg: AZFdTZfqK6aX7q82bLeUtVvgP4g0ITCzYznSYAAvjtKcaL/gwuT2+KUctjIgNI36s6n
	PWRmfoBaf9Cp1d+r9qKatu4dG5i8YKG2ick9pHy6OWkDgyG7v5SrC4fGTpqXpI8N4paE9Wzt9nF
	c+X8ix7jAUTrhNDBTFVAt9kChpg7HfHCL92iPUuQb1rhhtKr/lkUOc5+uBaEbR876pRCvuR4PCd
	aLDUvwVhHEvDDLFQASyYAbvpivxe6qYFdHbKEhdGIzwLr83HOQ8k8wMAWjFsOrf1AX4veb+o/sp
	zhRZaeaVkyEjgWq0R2w2nnhu+31LxfRjkfdZwhf6KnWTDKuZCobqG1muDBPcfW8C5lTll54LpdZ
	mlRZgOHBKNKT9jbtLYhtYIYDJNtkzeZ4rkJOAWgoZaCXdMuX+mq1MdXc1JYTSXMOma5VejL3RoC
	Oc8vxdNmPTALnx5en7+oRWGnDzKhuaqYfZfnHBGGO9nbLmHzIqK0eeIzrMunci9r+iDDw3TaBET
	XzkQHDA5YxedUfohPCv3wZ9TWdaWy2ElwrcS8J6ZvhxHVkbLV11g2CezlGgmpOzSMAP4s0qqc3j
	Vtw0rsYNFfXdM2AkFDiA0EG20dBwmftMGcmbQXCVoASWEV53proRuem2QgMJ9JUgkBsL7I2vGJg
	3T1hvCXoNz6h/XeRe7F9P1EPdhJERIHzGgesNFuF45ilgTg==
X-Received: by 2002:a05:600c:530f:b0:4bb:680f:9a3 with SMTP id 5b1f17b1804b1-4bb887e220emr216644145e9.2.1795425650233;
        Mon, 23 Nov 2026 01:20:50 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:49 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/3] Describe the Amlogic S7 clock controllers
Date: Mon, 23 Nov 2026 10:20:44 +0100
Message-Id: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/2WNQQ7CIBQFr9KwlqSA0NKrGBfw+ShqbQVqTEzvL
 rVNXLic5L2ZN0kYAybSVW8S8RlSGO4F2K4icDb3E9LgChNec8Vq3tJpTDmi6WlqKNyu1GXqpeV
 yryRqBFKOY0QfXl/p4bhymuwFIS+mbRHxMZVaXme/WFdtKfWXEt6i8kIoyV335IvImoQUhr4Pu
 avaujFiD14zYE4zzy1aAQbQazRGt9ZJ5VjDyXGeP4a31iD5AAAA
X-Change-ID: 20261028-upstream-s7-clk-dt-f5b25465e9ec
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

The S7 clocks come from the firmware, over SCMI, and from the PLL and
peripherals clock controllers. Add the SCMI node and the two clock
controllers to the S7 device tree.

This series depends on the S7 clock controllers series [1], which adds
the bindings and clock IDs used here. Jerome applied it to clk-amlogic.

[1] https://lore.kernel.org/all/20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com/

---
Carlo Caione (3):
      arm64: dts: amlogic: s7: add the SCMI firmware node
      arm64: dts: amlogic: s7: add the PLL clock controller
      arm64: dts: amlogic: s7: add the peripherals clock controller

 arch/arm64/boot/dts/amlogic/amlogic-s7-scmi-clk.h | 27 ++++++++
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi       | 80 +++++++++++++++++++++++
 2 files changed, 107 insertions(+)
---
base-commit: 807a34cf91c1d91f2beb3cacef9eaa98bd56d172
change-id: 20261028-upstream-s7-clk-dt-f5b25465e9ec
prerequisite-change-id: 20261026-upstream-s7-clk-3fbe6f33652d:v2
prerequisite-patch-id: 9ce04eba818962dbb245b10f1709937eb8054600
prerequisite-patch-id: a02fe1ec065748194293c458aae0bd6f6e7f152d
prerequisite-patch-id: c04475f82637c268ace81e969b67c159a1b0ff4a
prerequisite-patch-id: 8b60ed5e40d0bda09cc368292cdd7cffc621fd8d
prerequisite-patch-id: 7e4acbe8258ab4bf7b5bfcaa0c7b764b011d8105
prerequisite-patch-id: b9efe5d77d21ce83acca108e1050c5ae1dfe9701

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

