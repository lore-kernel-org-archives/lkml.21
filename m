Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529959;
	b=k3AZyohN4GkM98ddLDbLoht9Bb9naV3TUMgR1a03/rJo3glh1cV0p1jtgMF5Qe9ZY/uJ
	 guG4tIR0WRxQSDADGXKWb5HKxm14CNeBQbxOSpgvSTaJmo8fWYM39NbKzs8PXBWKUglgY
	 HuL9BDF0aYYq2BPSdYGq2C5Eo0oudiUjM+hvUIQKwDpfabrKgNsYwbSsnaXkUqhSQVwaR
	 BVNpE+6NP/AUWonSus9/xjtL41cWxgUwwEly8wbw6NoY+PDml5pTbGcsXYqG15U6emCJB
	 Dh2Vljf8MXAHivf/x6VVpVvoN7qcNiEoe2WNwRX8AbUCaj7V8ppOKZIAvmvVdseFOHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+kSqf285EfWl9/eRRplcUwj5s1cX/XrDZcOYyTq3/f4=;
	b=2DiRoyCz8UNHlXAxgRElQoSnC+p6JYejP/GkSd4yQ8h0bVHC/3cC9Tf8Il1eOJPQeiBv
	 0MnlwomZiZD6DX9JFlGdnXtrN/lG+oOezFA+QMfGbfigzpQ9HCV56fFFpPtvoLnX2KseD
	 YVQBKxIKJWNvZ+Ek/Mi3pcdIS9KfmXbND+BNfdV+OD93qoLMoyP2ERGuljj8qFORFQolh
	 VLkKWJoq/Gsf0SoCmr0YuA0AH8baqwxioYez+c3svPyugIN7p/7bAQJ4DhLnz1mfZlFj2
	 rfLzC0ZMf5+2S2u5ii28neZd568ePavDcxK+iYhaMsqKxD+zgOT8PCsbOIJT/ocsMRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HMZRrDaf;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47F1606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47F1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HMZRrDaf
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4d21051042so740049166b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529957; x=1796134757; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+kSqf285EfWl9/eRRplcUwj5s1cX/XrDZcOYyTq3/f4=;
        b=HMZRrDafOU/zPQUMXT1zbW6RC6FQRh00x4uCIKUkiIP/mvmjzEuwltrRQ0ATHnkNCT
         +bE8+5z5no6gpZon/jQWpcXYeaywVaBsKYXvkyLcVqmI7x7o+qVbEDSD6CtSUAtw499l
         RhjrPGowfX3YTZ7MrrMiVUj68jJLXMeSgmUF3ujmFdj5v7zXilA1Xc+sI+jG85KvBKvW
         KDJD/IUgXIk17egvIj/ikXOJ/NdoiOpcAKy9pJXR/2xO0JXPY47hvMhCNCpJogJWemuj
         /iXJ8LMT2Q1o7/PILO1Wcf/+UA2Soji3cSgevqcHbiX3ZiggcGFVx7q6A3NK63Ped++p
         K7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529957; x=1796134757;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+kSqf285EfWl9/eRRplcUwj5s1cX/XrDZcOYyTq3/f4=;
        b=Oz0BHVypkmnGgJsXw2Hc6ZwZYqriAeY3oETsttIEkw3eRJfksv01BmbXozk5zpeJTC
         tMgo1GcTO9hBlta2ExjjJQW0pLJ82DrQMr+MPHHHM5JuzprVCRnEU2tGE8SES75doF/d
         LIiC/I2KYbXLbihpoXP7TEDWGy87L35uj7bYITJapcBI0j5O3yWYjbHNNRduB1WO7Wd4
         BEz0LYT/7HoVGpYZZDXqdDddGNde8mg3oB10KkMiPfdxK4tV35t5Yv8p1ro4iy0Mz/4p
         mD4VsumSLwmz8my7Fi7piCtWLG3TGWwM5YXyTtaduQR2WITCrHLce0Fe9pwYHx+ebuoh
         ULBw==
X-Forwarded-Encrypted: i=1; AL+hErGzo5JaCKR03IXODRFlCA1T56nJtNL8H1n3CEIqXjZiLG20abHCWpJQCb62s3vOztJHBuUPLWbbleCBwv0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gB39DCCQ5CNwxjO3JwVou2RcXdAnHpvjIzGT3ZSOH1fXfmyj2
	L96gXyyCXIzgUyFxWSV75dVI5suZgEJMmUrQC1IXOPjBTC8V3r8C3dLA
X-Gm-Gg: AZFdTZdFLeJY1BItRaeTmD8j1JSZOMPY9x2vSMBTPpMKOHaomnU5RxfQWgZqfJXwknj
	LXleUOMRJFeqijK6GB7UfDF86WHL3QfsYjzHBB2tFC79hDb8mir5NZ8jMyBCZY+g+xvOyOvdyyZ
	mH4HAdlinT0Xyo3dHXzfdOg03yqs4kwDBKtG3LUx41XjAfheclqKXXcVt+NlZZyqqT/T6kAwVOZ
	MtjbxIS5AJpgCZlBm4Co8jw5tVnyekfmPsUxnk9i2B5cvbrAXHeW9+p2SGgIbY9qqAgmMgyLl3m
	knf7labvvkbr6ePAPMO+8CSazOiLTDK6UFJF8FZflLYKRJyI/OvOamRTVKG4sV9YYIizkughT/R
	u4E1HD/Xlzpv+5mepgSi2pfcUptLFWhatZQDcoXiEvKiu/E27/GlGF6ykET34lkpx5ZeCN0Ajdo
	j9C4kw6mhGRHosbvWakDDW/ZiWNaISYzL+zQWqsKmd5crolipyS4Yx1T3wzhAFUVtsSf6GDRE8M
	EyitcileLRGQChUdDx0ONkfyaTcmd5TiDOuT+fLk0jJNcxbsoxxWcDmrhNTNL2BF8w6wQpiGKfl
	WsuHCJMVaqRoA/Y+Wj5ryxlWg8Opqh5wYnVMLQ==
X-Received: by 2002:a17:907:9d1a:b0:c51:3b58:b99b with SMTP id a640c23a62f3a-c513b58bc59mr1211438166b.19.1795529957109;
        Tue, 24 Nov 2026 06:19:17 -0800 (PST)
Received: from [10.32.31.239] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae679e3sm525342766b.22.2026.11.24.06.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:19:16 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH v3 0/2] Add pinctrl driver for Qualcomm Halliday (SXR2250P)
Date: Tue, 24 Nov 2026 14:18:50 +0000
Message-Id: <20261124-halliday-tlmm-v3-0-6b516e5f269c@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAMqcBWsC/12NQQ6CMBBFr0K6tqZTCqIr72FclLbAmAKmxUZCu
 LstxoS4fJn/3izEG4fGk0u2EGcCehyHCPkhI6qTQ2so6siEM14CsIp20lrUcqaT7Xva8ILlJxE
 vhpHoPJ1p8L31bvcv+1f9MGpKkbTo0E+jm7eHAdLu1z7/tQNQRiVUoAvBQSh9bXuJ9qjGnqR24
 Dsbyn+bR7sWWheMKwmC7+11XT+j+eAz+gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795529955; l=1615;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wlPT/nME1AQhUiN1+373e16OMr/g2AzfAMoT0SWUSoo=;
 b=g8aWd02uvYBxRIy/qz5sy51yisBFmAocdjkZ/XsyRdXv4GzTylVxa5BJeStDKeiu99GbMqRLw
 IQ2O+puS4PXC+dLwp8sMzc8kkkiO9p5WUVVb7qEKz7aIcaSkr0z/mqc
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

