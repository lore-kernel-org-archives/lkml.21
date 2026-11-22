Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368923;
	b=u3u2nobKKGv6YEWeEDnEgl8ud6boizGkXzwUvISvClJ2QlAUhPo0tVinqr3BZQREJbwA
	 eFNYP0dRcniwO/x0/0u2ZGo2T0WKfx+o5pbzel6MXgftqktNCFPlAwfixbLLEfgN9CxC6
	 rSIbdlaYknfN5LPFkDM5wMcz7HVGTjtAzZnK2Qaa/0nE+GD/Ex3Jn5ah7LCcrmPIKvaMP
	 cneSrgHiGHZOON2+iMXColVTBPdU6Ip3627aR9/i2ne7v0ldyTlh5QrAaE9RDLCkI6RSJ
	 fPNlcdyYOCrkOgaOwqX7MR8u57bDF/nGAZd93Zbsp0YDIG3fxR35VuVywOu2hh0hS+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
	b=NsDeTutNHIo31osRicM01cfvP9E0LxBYIquWD2m+48/KLqBrtCKmLnSfmL788GGsFaE4
	 EkZWYUMFCSdR/7xZrzzKqnIos+xo3v/5BH+qoAhroFAGLI9oDbDfA5NnVYJuDa0KvYItM
	 GcMqPuDyJ/TwvjMsxlOKmcQFR3phl50r/2Ij+LhDGKr6Gy+v9P6bZUWtg4L1ApzOBFn3U
	 o4HpjvFeEaOQKe3vVSPvXJFCrl1Cqk+fH2dYiHkZ9juMZziu6FETqQJf7B6HZKY7dDTh7
	 Fyp9tinhkxr1rbz76eUEKmUuvABLhr0Q/+XHx5b9faE4v/nkguzNrCwTjfuKWtNZvHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82B606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D82B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W4qC68+X
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so2982903c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368922; x=1795973722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=W4qC68+XpfqvfpwyUVqGzy3qdQukJLa8vbARoxPiUyULgvpMdOLwWZ9mdNp7Y+q1S/
         a2fmnkWbUQ4g3PDmBD2Xi+MVOCf2H3+KwoihsgGiI7itQbQQB35TEA47qniEOyOA9qZU
         fW3nC8iru80q1ix8yEct1+VqIWJEeD94z6WUOs27OvHaulTz3Kv+7Jn6/lNkTOkLGDde
         /5NAWSb/AoExQZo3VKznyWbOCIHfqdIC/+3Z7mPBw3mqJoMXBOOLa7D4Ud9zUSgp3jnF
         29MLaCjxJOAS/3R/0vMjJWRGqddVakOkvd0y8p2F58PDKuc9jgJYBZzwQjZUcaWQUHDi
         QNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368922; x=1795973722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NR3IF3W9rPY84O5okCDlPMWK4xLZD4rHGc1s940WQoY=;
        b=Me93CAjVdp3HqNUCmj1D8hUzZ30z6Sq/etOBVoxON7f7kBdaB3ah6nA9GhTSvE667/
         chZfI1yXiFlGZZw+UxiGrRO35gTRhY5lmGWZ3gbNepr2jXjnVxiRJU78ZKJcDVSaxnli
         DO443vyRWdd4LIP5g/Y1FwbceR0gX/uwRNN2JGT4r72bHtPXeQnW2TQK3q3B6z00iBNI
         fMaRHwFC4gshq6v3zZgNqOw5TiJpTnqezbZupDVMlbQ0qc4ZZrQJl3dADT/87/CtfJwP
         +BSpjvucXGRBC8lC6Up+uyQkG1m6IPzhXX+gsUgDZzit9VmaoDa6IDSiX2uxfu3qPHw1
         5n5A==
X-Forwarded-Encrypted: i=1; AL+hErGkWb/KBIGUcouSHFOVQvy9w96R4SpOWpFMJC+VEXbrnSfYdbfmDHrQvb26vwQrvjZXKSLggqwdgofe5RI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8FYUM872h4RJlasfPVs3w4wCE3RoK7F/ejeCnz35zoQF9TGLs
	u9CrN9cy4ViftGsbTnDE8a+OopUDXkb7UHbd5upUxtqnhE4zHqaFU6gK
X-Gm-Gg: AZFdTZfmIwOIGVpH+oErHTCStuCj9ihbVk77Kkfs1E708fiFKPEHqzFes1iDOvomE0N
	HfNMhc0pxvMVLfqREnVjh/CeONEABXQm3aNJUH4yjGHNjwf+KF35i/XzUMkgjF1Ipe5tDHdTeXA
	9xqGguxUe9oCkrdoMG25G6vtX+mLO9Dpv3srUV1OzIvE1IChDN/xpOCFEyuBpgF9cmyH72UvfUY
	Hmuy29b8vbJEZbNm7izV/dO7aLpgo7MLh83CQnk/iSyEUCQPrMpJ56C9hrdPfOkGuquUz1G179c
	IOmD79wrWqsIe33gzzEYtMq/Zi5DQZa6AQJwcs+3KdkRa6/sbQWg/mY+ZZV8qFszECEFfMVzBIw
	mu4yoqXpCHSScIWxcVM6QW8jW52PqqpVROrCiYmfzZnzwQXJFYM2I/H8GHtYerh9dtyT2Z9JlTT
	3PCN6pO60cOfTpF/jBCCixkyQ9LMmfmpTfp+pX9e67CsgCIr9MGhZzvutR2gh8gkXM3QK8kQ0/F
	HgDqdbpv5KKfECWFzkHOvcccO7w7K5jabtRgC+Zlf5LRB6XkvXa26hVbTIef20sGpd6NvBLAHuI
	lYWla4pW8ZqoN9/k+ku8b8+HkndUeby3RYvRlomIiuGjtKz7ubCl+notfv6LS8NhHPF1ImYkp3+
	tBOZg+PnrcEV0FH2DCAboDZvnTPn42yfRC2Kse+BXysX+DXbbOkMkWAmbDhlL/EpZbB+jSN3WrK
	fB+6Cm6444/FgGhYGiST1QHg9Dvw==
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr7108384eec.34.1795368922569;
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
Received: from suraj-HP-Laptop-15s-fq2xxx.tailee6f87.ts.net ([2402:a00:163:3509:b842:8324:ef7c:136d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm6419485c88.4.2026.11.22.09.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:35:22 -0800 (PST)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suraj Sonawane <surajsonawane0215@gmail.com>
Subject: [PATCH v3 0/2] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c
Date: Sun, 22 Nov 2026 23:04:47 +0530
Message-Id: <20261122173449.21009-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
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

SC7280 LPASS LPI gpio5 can mux EXT_MCLK1_C, but the function slot was
unnamed and the binding did not allow it. Name the slot and allow
ext_mclk1_c in the DT schema.

Changes in v3:
- Fix commit message: do not claim existing SC7280 driver ABI.
  The driver patch adds ext_mclk1_c; the binding allows it.
- No change to the code diffs.

Changes in v2:
- Add the DT binding as patch 1, as requested by Linus Walleij and
  Konrad Dybcio.

Suraj Sonawane (2):
  dt-bindings: pinctrl: qcom,sc7280-lpass-lpi: add ext_mclk1_c
  pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function

 .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml      | 2 +-
 drivers/pinctrl/qcom/pinctrl-sc7280-lpass-lpi.c              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.34.1

