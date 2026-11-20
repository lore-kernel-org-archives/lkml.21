Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205494;
	b=sh/HrsxhIH5/JMlNR7DX3ew9NosgEPIOFhVEvpqDqa5WdMhgkwp06u51uYRsat5D00te
	 arKrVDFQZNgx4FLs9bNas9CCGa6jp8Rfh3Jr6vRuICe2EyyIELE6ohSnszHifrih78vgl
	 KJfvVvsx3hmHLPXxtZBLa5Kfwxz7YJqubOEsX8AmBQ2T9fjAdDzYp7nJUA5clEqoXpR1R
	 7KqdhfBvaEXJM+OpO4p8zqmIzf+y9JAgDvY+YuTn6cODFiBxen+uckz8piAMxh95Af4eU
	 2G3NP3q77CxE/Vj6SoDuySfnH3EeiJ5uJ8qpmuX0CgV31N+4mcj0/E5Uz2UCCU7h31g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
	b=REmS48NzF2iLVfgqv8+lH5QRryJkMghycn5TFwNU2BSG2xOVNsCMDSDpnJiYGpYxEe5T
	 r9d7F3qNISakx+q2nD5qOj2wdKAQBZ8XLxxqt1O5s92qSQqWgTIhXAB2o03pr9/cJX91k
	 /YIMFQCPjKRcX+mg81zlVvqHUL2UpybLaSRQm03RLIfr8e8zVnk5efKCxuMD/9rl4cOai
	 Cyopk6cMfN4lsM2Qv8v/u7XHU6iMHaTp6zotzGgGlh5DhzkbnyOTGo8XJxCTDMzUM8fZS
	 7BXeOFtHx5P7cSw1nC6mwRLP1baM9JXKQqfT+vN1/bEWfxMgMHoobJ8MKbsnOkF7rNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyfM1oMv;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE3A606A6FB
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 20:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEE3A606A6FB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DyfM1oMv
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso921324f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205487; x=1795810287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
        b=DyfM1oMv01evrZ+ltMOubx/jrmw9Li/OOE1kUesIqFi8220Op8+hHG703fy+G8YO3y
         1WDmwPz5q7K8Rryi1ENoUHFsAwoEqd2Y4DTVOkLTI4XGYLCIuJJICpuGly/Qn/n6QDb4
         5XEUdT5UPAIGP0nT+mFayGgbttqYjO9oHvu8ASV8PN85smz0gFhdy7qi0ShEFUhypyuT
         s0vN46K3ja+aRnetM3HCeUqqcsnWSBOuBW9tYp6Z9pIxrt3WPc4PA7sOVLRXhSltnjBU
         T8smtxQPgcKXpD7xKIcTOTLDeLbZ3nAJKJaz7PL6hW7LUMKtNU3tZ7xmHcDeAN3VSObl
         /DIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205487; x=1795810287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLO7PfoHPrwfWKb35FF8N0dGUstLX6IC6yxLIlxOY/k=;
        b=kXo4R/DUXXtbfY6izgt1/l09dUDSXx7ohZVADqZ+iqSHUIHfuvBEuccgLkAHcwhMED
         SDlJtkp6PLCKwOBgZPbf14HhYhBI9gQPrl5xub6bwVP0PmakHd+wIkJR15aWDKbuydOt
         tlZS5BL/UBnvPZw7Hwz1ZwyxGLi9QoY1+oCoqFGdVcC5baoAyCXa1Q6UjYazPPd0mbyp
         DJTnQj1Zv+r4hzBAIDq1eux0ftiBwfDgxpyOyvtiNycLoEV7rPo6Ig19k//BWDrmmB7q
         xVUex1JmTSmD+V9IzVknJjMx94zxihf1PJjQLfE4uD9yXr9lp/jtPMYT/wfvPfxHMbc5
         Hi3Q==
X-Forwarded-Encrypted: i=1; AL+hErE14nmtkRjrZ4KkeWs+c/50xjAXWDmwaSpx1QO6/Xx8R0zb7++w4JpJNRWEfIKIjhUVJ1e7o0/zoHPfv2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UNIdPbbIp3krXX8HYmUV6QSpO/hVb8Lxbs08wix63yw203uuj
	FrnG5FRNcdevpnXjZZOlL8wgeYb20gtpfinG0RVaTt/kdJ9s7Jvks19t
X-Gm-Gg: AYBFou0mdmg7GxNOpHw1WJu3ZKBj9QW3F/LKMu8lwIymO/Ov6yUYzMqvECljjiZJQ4M
	JLVOIIntr4vqxa+4zSHTUQWmWTr52VatftsPpISYu2JoSan+k9Ay7tmkAYWgy4Zrky/ImWewFhs
	MCUCoK5lf5XJ4me+uondktFt8ZYtm2LlQfujIvjJU1m7l5G+yzzoEC5Z6tLsObfIYaSBfrJqqR+
	PlNcHIVGGoDW2owQEfVGJeFJ24rtuebi2L5kxUj7kfi2PlKF5to+F0w5r+1rZhoXDgbFcd8O3TR
	gJhrkY8K//2Q1gOcTkWQ2HEltffJSjVR2vv83PE8yqZsmXVPLrygNnDLk7l/QvoAviV60oKwWcs
	P7numwH3s6R1NSuZogchVM3HFOjg8KuX2AC9jR9ALM/QJbc8BUVODz4cfbOsxIE6ZskYw5dm+Q+
	/2AoH5MJFYACADbezYsFcmyrEMut5VclrS4HG0o32A9L/2NEeRV/gDty67VBWawGtdB3rQ3lJiH
	sUAscHGEdd3Q1Jjuna4/t2WWQT7EAYVAINZq3nx3/I4WeXIUl/ZaEu9BlxdXn4ky4YnUb3KikWX
	Cv/I0ugEafXF77Dl6urx6NWXyrjpRbSHuRZyCTUR3n6lnHSivw==
X-Received: by 2002:a05:600c:3ba5:b0:4b0:a307:46f8 with SMTP id 5b1f17b1804b1-4bb8880f29bmr107885145e9.10.1795205486993;
        Fri, 20 Nov 2026 12:11:26 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm115561275e9.3.2026.11.20.12.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:11:26 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:10:51 +0100
Message-ID: <20261120201127.90969-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds support for the ASUS Vivobook S 16 S3607QA, a 16" laptop
based on the Snapdragon X X1-26-100 (X1P42100, Purwa) with 16 GB RAM.

The device tree was derived from the Windows ACPI tables (DSDT, PEP) and
the existing X1 laptop device trees (Vivobook S15, Zenbook A14).

Working: eDP panel and backlight, GPU (Adreno X1-45), HDMI, USB-A,
USB-C, NVMe, Wi-Fi/BT (WCN6855 NFA765), keyboard, touchpad, lid switch,
battery, speakers (2x WSA8845), headphone jack (WCD9385), efivars/RTC
via QSEECOM, CPU frequency scaling.

Not enabled yet: video codec (iris; the Windows firmware is rejected) and
the camera.

Dependency: Wi-Fi needs the NFA765 firmware, which is now selected by
ath11k instead of the deprecated firmware-name property:
"wifi: ath11k: use the NFA765 firmware on the ASUS Vivobook S16 S3607QA",
sent separately to linux-wireless. Without it, Wi-Fi falls back to the
default WCN6855 firmware, which crashes on this module.

Tooling: an AI coding assistant (Anthropic Claude) analyzed the ACPI
tables and drafted the device tree; I reviewed, built (dtbs_check clean)
and tested everything on the device. v2 has been running daily for over
a week on next-20261112.

EL2: the EL2 variant boots via slbounce (VHE, KVM available). At EL2
the ADSP/CDSP and QSEECOM don't come up (the SCM calls fail with -22),
so there is no audio, battery data or efivars there; I have not tried
qebspil yet. With the default EL1 boot, everything listed above works.

Changes in v2:
- Add the EL2 DTB target (x1p42100-asus-vivobook-s16-el2.dtb)
- Sort nodes alphabetically, drop a provenance comment
- Drop the unused i2c1 and qupv3_2 nodes
- Drop the deprecated firmware-name from the Wi-Fi node; NFA765
  firmware selection moved to ath11k (see above)
- Link to v1: https://lore.kernel.org/r/20261113214424.220241-1-ingo.kubbilun@gmail.com

Ingo A. Kubbilun (2):
  dt-bindings: arm: qcom: add ASUS Vivobook S16 S3607QA
  arm64: dts: qcom: add ASUS Vivobook S16 S3607QA (X1P42100)

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1p42100-asus-vivobook-s16.dts   | 2115 +++++++++++++++++
 3 files changed, 2118 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s16.dts


base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
prerequisite-patch-id: ae6c33cce4db2472b5aa360b5e6cbf29763cfd69
prerequisite-patch-id: 85373c0c0ff98ec4cda496c612feffd19f715d52
prerequisite-patch-id: d752bf7c6f8768fa3d4d39387455c3d4551a8481
-- 
2.47.3

