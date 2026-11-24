Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534172;
	b=Gyn5D+1nUsZ+lCbeRRNVk2aB/KM6LPTuB2uIgmuplmZNMzSg59rvOTQL4KP9obMAltHl
	 Nqg4P8SVGSiUlWTsrNC+/WyOjTYC3ed3JD1shfTrNL6J+aHO1jg0AVGHyAs9jb/sOuYm8
	 x1HVKIXDGNlrkBTIPsZPc2Wn9SjFbRs1UxWo9bRaxiwoiYopXUyRdsmMg1sBAPx6mrWwv
	 H0w+l1MQG6uqDf6miKL99KkU5txxpLU1snuTJctfhhBP6Q2XQ2Lg6icaMbUZyixaK9p0x
	 4CGjSwKoC8jZznDLvYXE/e3ffVqaqLpW/ZU0zP7GWD3SFOfegjJ2L0L3+f4ZGA5r0lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
	b=T0KiiaqHR71INwRWZEcbl2QH1Tun2K/a/ZO1wMcLPPI2h1IURA1jdQENhq8yvsr12jY5
	 +I8zh3j29JWvPDzKuRCIGu0LO0FtbzztdhH9R3Uv+ex3P1bl18zoIzX0mSeiscvweR55a
	 C5tN0LESr8gUx+oD+scIlkWDbFOi/gWNwt6XKzbs0K4ZIBtcTfWSoghAKLpP7QaKfGCD7
	 huu/DCMP1c+1TEZYzM8giHNEmO5UklSjtd4SMh+48+vFzxgSt1Cntc/d/sESailPyXKRh
	 hwt+idMCjGA9KzBJmXk2Th/FD4QjF0z8IEvMMiPSf2IAA4Eu2x+qS+jPvRj50FDJ1pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C9606A6AF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D63C9606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESB8LODa
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso922303766b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795534170; x=1796138970; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=ESB8LODa35Vf5EcyPsyzwx5pgl/mMKWV85vMM/1+lenyfAOt7Bz0Q0zY7FjolGmpzF
         YMNP/J9mTqdTFQTAhTBC7jljpZ9TjrZbBCd0tK/xddphcbcZPR3sT0Be1DVddcCvG/r1
         SY6tklwyNsafnfzBjy93ZHI+FYsPBss7I9FHT4qEZuO+p+cIy9a0IbRS7QhARwKsMTZ7
         4c9Jg1moj8o9x86oVfV+4t0cqOWdJWcl+5AW25mtQvkei41jvhOHl1A72nJk9ftdCcbd
         e/cCx1xCkoGCUN+/j8eH2tspcmYxodWCUPHko6eZYfoW7hoqrxR8GwvcQR+HU+RGm7Rq
         F7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795534170; x=1796138970;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8tLbVEeC13kOazgUWlOjd/prAO3qeJSqezX08+mwwAo=;
        b=pORYSdXRTEGuTuwBowEo7518GzwzZV2f2qY7toj7g8bovC4Fpm52bFrMTQo/l9ENYG
         1yiLaKs+Aqy9GD4foOmBXBYqSeWoXPgLWIIRZYURdMZVKw7BGFYxRW7Er7PILWWgMI/e
         xgf1BxmOeQtf/+PK2gxmUtKvlXJrs4RhCRnfpGYareyqmyl+JJpSY/6oAEoZ3Sy7lEAb
         DtHKfNeMH6yJvvLe/a4lDVZx+l3VgDQ+WBqC/h2NqTA8iJ42HaupIymSIGJRSUVOmCMc
         KhVU3VwN6htC9ZyiWke9IfyeUlLWXl/Sy6d6nwT8VWYtpp/fA/TrMrv8td5qaXevaoD3
         ljEA==
X-Forwarded-Encrypted: i=1; AL+hErHm0Oquxj7SwPY6zij9xlMhKdomlaUWNKze45tMG4O7EwaTg0dOnzFJyFQG9kg9x8fv68dOiSdokPo8opE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FtS5UDP7o6lBSs1F1ZvL7bVSfql8mneKj2Nh1qVmiin0Ec2D3
	GTb2YtQnj716JxHkRMk5EYWA/AuSaX61YtFFNfIMUwlyWxnfkWO2NMsU
X-Gm-Gg: AZFdTZctuKOZZ6B4+1BSth5d34jimFt5D8veul2wqHzrg7+vkHwYYAi4yUfBN0RIpSI
	NfZUkHtXl26BBe8jR4NlptBGbtv3ayV3v2nUU3i4E8gzB6yF9Z67CsyFADl3jeNTFMe0xyiKDwY
	RS0chmrzo/lV5sU4F5VHplq2upF8iJyGjMoSSi5CsQprT8pTnkMO9nCacP8lK2yz5FkjGLcrjef
	d19gVmz1NVnRjvKh8iAIKJsPdB5Xi+oZ9jowkhiUwixZQMfmCVcqiXu3qm59YZ78jnMoYjPVlY3
	lvPq797CebRtRkxbT+hx7QLSQ+oKGBlsC8949ySqsggK3RGa88SAqjfC7/w3Iw2yik69J+aG4xt
	IWdnw1A2cl/25nc4i+R3SySSSBP4tdayItFYeTTPqVH9hNSItxWytPsoKNNxKmyRkRtyS+VMVlF
	mbjfNlWudvhxGvtu3zbQOlpVvZNPjRNrf8w3eDjzaSZ9UKNT30SxOtuJd6wFR0KUF+9OZy5Iv9y
	DZOqnbvmoZFCpjOJdEol6IXNYcxC1rKGZVc+inh7pw/XbI5FSrqzsFLzrOslQGu4cUxf52Gpaua
	/WI4GWku09AN2dh/ITUlggKQd3IjsJhhuyQR2w==
X-Received: by 2002:a17:907:2d23:b0:c40:2439:4d9a with SMTP id a640c23a62f3a-c51319c24fcmr1434115166b.28.1795534170279;
        Tue, 24 Nov 2026 07:29:30 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm540425166b.2.2026.11.24.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:29:29 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Tue, 24 Nov 2026 15:29:16 +0000
Message-Id: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAEytBWsC/13NTQ6DIBCG4asY1qVhRqDaVe/RdIGASuNPA9bUG
 O9etGliXH5hnpeZBOudDeSazMTb0QXXd3HwU0J0rbrKUmfiJshQArCM1qppnFETHZq2pSUKll5
 4fLGMRPPytnSfrXd//HZ4F0+rhzWyXtQuDL2ftg9HWO/+7fzQHoEyqiADIzgC1+ZWtco1Z923Z
 G2PuNMgjxqjLrgxgqFWwPGo051GftRp1LIQIK0oUeZ6r5dl+QIOYVJOOAEAAA==
X-Change-ID: 20261108-halliday-tlmm-f250374110e0
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795534168; l=1775;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=gCYQs/30s75gOvGg0mt5Y5EZUj0bRBXdi1OgnGxyCjM=;
 b=DOTlVjHNhTZyfIOMSm753f9p4pgPiVLI9TU5wLjeUxJcXQiyhzmLx4wXDRguUIG/4/lsho8Vk
 eKeoshsCGzWAEoXQQjXjTC347ci9toIjPkHmwaRpgSZE1oVxF7dvecJ
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

This series adds the devicetree bindings and pinctrl/GPIO driver for the
Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
Snapdragon XR2+ Gen 2) SoC.

This is part of the initial bring-up effort for Qualcomm Halliday
and Samsung Galaxy XR.

This work was made together with Claude, ChatGPT and Gemini.
Reviewed and tested on my Galaxy XR.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Changes in v4:
- Use MSM_GPIO_PIN_FUNCTION() for egpio (Bartosz)
- Link to v3: https://patch.msgid.link/20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com

Changes in v3:
- Add the egpio function for GPIOs 185 to 223, which have EGPIO_PRESENT
  set (Bartosz). The binding gets it in its function list.
- Use the exact PDC map provided by Bartosz
- Add the Reviewed-by tag (Krzysztof)
- Link to v2: https://patch.msgid.link/20261116-halliday-tlmm-v2-0-b4dd502ca142@gmail.com

Changes in v2:
- dt-bindings: Add the tlmm label that gpio-ranges refers to in the
  example (Bartosz)
- Link to v1: https://patch.msgid.link/20261109-halliday-tlmm-v1-0-a181d54214cd@gmail.com

---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: document the Halliday Top Level Mode Multiplexer
      pinctrl: qcom: Add Halliday pinctrl driver

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  146 ++
 drivers/pinctrl/qcom/Kconfig.msm                   |   10 +
 drivers/pinctrl/qcom/Makefile                      |    1 +
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 1840 ++++++++++++++++++++
 4 files changed, 1997 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-halliday-tlmm-f250374110e0

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

