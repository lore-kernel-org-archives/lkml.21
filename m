Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096492;
	b=4VfLnVZsD3tV+qC+IQe54+WbalIiqTE3tyEQ6X63lWXFqTvZb3HH5P1+iTfwEcO1Y0pK
	 riGAuaKRJEElra84IAJsCXqRKsyk36lDwZQk4rl/4XxUPVh96tVI2c4nmWDMFoTSGiFbJ
	 0lBfh+XKyeVaWTd+t4yOPOA8mZjZBGIlLwf2Z4WQBg27PyfSLpK16u+RtR5Z9WgZffSSu
	 kYFJrLknyqb7klLFwJyzEk/2Q4YCzDwWZoKv1fKHe5a/V42JZdQPUK2DfLfPcl2WyqI9M
	 GE21eioRgbcVVRRTKfVmzueShsA97Tr7f5tEQ8xfK4O/Ad2Dz0R6qR/tT7hfe3N2pqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7efxhBC8v8hoV9AoQNptenBefumTTDz5WaeZtXNjs6s=;
	b=lRFioo07JnaYaSCgJb12M2G8QgQt6YfA3MiqBSayDuCP5e4h+htG7t4DmsALWVedOhtC
	 /HEf8AdhJ0Mu+NziVZXzbpp/Cwsf2jX7wwYFYrtNjqa6ZqyiiXuYXOe/MWN4skey35RSd
	 L01KZ6UnWVrjuvo1utcB6MrfNPoZ8k+/SooQvaJnXoRqvjfe0ZOouDrzpsywiQ2IBUrgB
	 GwBKyUfQuGbsLB9M0VJo6BgAy3IJPjNPWM1Yuj/uaP50T1GWpHzc3gfqTrz0yyAdpU+Dy
	 oRiB2YPJmb+hrEl+6FBLtr9qtirbDYOXjv6xLZxxAwvuH7+Dzdjzy113xbavmVvzpxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qQWVfoIV;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E52606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E52606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qQWVfoIV
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50dd1e2f11so339328166b.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 05:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096489; x=1795701289; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7efxhBC8v8hoV9AoQNptenBefumTTDz5WaeZtXNjs6s=;
        b=qQWVfoIVk37Xzh9p3yus/Gl9HA+4rnKDHNbs5NmdDvoW5q5TRL6iYrwZSN8lkdfRUA
         KEiFghvs6w2vkqkvS0ikZRp5cZdIC95ERoIZ6Jw9FZ1yuFuS/Q/hq6Z1V80vJeb0CrWe
         2nDtl4oQD18SuUUnkKmKoAI5fYzkJMhPFqDkqnyAbW4eSahciF82j72uPsZevruUy9Fj
         o/yXu/AG4HALi/RUN5leUEClLfFdx+qs6cgCSXOWwhdbFCcSoNbhm7WhSZM3MhEj23j/
         l+nNXzVxUGALciQHLiBXmM4uZngPyPCUMix8swyjMpujNSvXTX8M1WtAlf8IgPafI72u
         JNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096489; x=1795701289;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7efxhBC8v8hoV9AoQNptenBefumTTDz5WaeZtXNjs6s=;
        b=0Va36m/oMiAwAbFFLiIkBKNAjV5Rkbf0tcX2fO1NouObkme+z2W0vOvYsCrIs33+YK
         XD7PHjUUtkkZGyScZ7trNET2n2WgjU/7q7LnBBkKZC98LsnodicPtKWrtNauZFNxnjcg
         pS2V+it2L+FhInALM+Vkl8dPFPUvpbk/3ooNxOhsvgo4ikZFVCXXpane5/PMSuVdFqzA
         GjOtD2YOEORd9N0YVuMOQ++wI86jgFB33eDY2g+Xhf7QhhVYqsgAePBHuQ449wCupWZ/
         8mUlvMW1vjhveQQq3hwc1NgZfuBR3uY06uie/Dfvu8IJYUnAO2DV1sTQtH2iItkBhhU5
         1uyw==
X-Forwarded-Encrypted: i=1; AL+hErGbxPUTjZlM5buYovBsKOmZQkkLSHasuZw7IgHTdGFuKqNa7BNN6Y84KZMcJzX6czUTbL4k5Qv2iLcKpEk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dRuFX17iYm0kyR1tX6RqzyphpceE75/WSMxgafp8A+QdpuxAb
	43jvvs7/+1qwMhjJ5gMhZdDD5G57WtJSO8U9M+7FjhtgyybmOAFBRGoV+WrcTD9EStQ=
X-Gm-Gg: AYBFou35yMbDXF+/FgDesNha1J4WVP4zv/R64zjX3Rq1rshmbbih0uCfq4aXcTH10j3
	TmwRUmno2wIey+Tn0wxhVnxjL+wou2qVgQVVgaTcyGsPweL5+gfBeH16gkwhrNet/3prniF4bu1
	yxzz5zLZ9lBtO4zRpKnl2ztEGEjS+cSjSXTy4YxI1iP7SMvzI4GJdjppYx5VXen20TNEy5uVG3r
	86nMjBGkeBrpJf2LVFopa2sQVJhOYHSwg7+ZqUcDxrCrO2Rg5uTubDjsWt9htLWVpMHwv0RYjjW
	vr2A/f+lDGRbTfiKbX2j/HN8o9+c+iKpxiBqw3r0nyCH+/CdIsAwGTNNVYkNErbvY2mo7yXMXu2
	toy5MZMszochuBBH3ztymWpDI1liQ8YgZXB7eFpAEqtGYZbkmjBileGuDF2cCdLPyp2BR6CVXTu
	reUlGx2FgB0mQx6zqBW+i/qNwrbIP0BYX4X9ierz5H9TnVwU0he10elS0WFcRyLx82wOgOw09o+
	r2xjlYffZrsIEDHtCxLqJenxDMLLxDFWA9tpJVky/zxxp033peHolmYNcHj0ojw/HBRUqjdR4OX
	fxfTabiWV16BHocbivMDIqBAoPZctJmZNTuED88y3kqy/pwiuhOXyTRXpCnn9Vtqck2u2LiYA2O
	qMKQWFzZtuc0=
X-Received: by 2002:a17:907:d89:b0:c4d:f63:642 with SMTP id a640c23a62f3a-c510e50d843mr581627866b.33.1795096488539;
        Thu, 19 Nov 2026 05:54:48 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:48 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v4 0/4] AW8695 haptic driver.
Date: Thu, 19 Nov 2026 14:54:44 +0100
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIAKT//moC/33Oy07DMBAF0F+JvMaVX/GjK/4DVZHjTMgsmgQ7u
 KAq/47rSggh6PJa12fulSSICIkcmyuJkDHhMpegnhoSJj+/AsWhZCKY0MxwTf3Fatd2k183DN2
 4qm6ImCFS6YySHJzR0pLyfY0w4kelX073HOHtvVzY7o+k9wloWM5n3I5NNgdFY5Dk1p0wbUv8r
 Ksyr+U6wHH1/4DMKaO81aNpVSk6/zx6jOu0zHAoVyqcxTfGGeMPMHHD+kHanjslB/gLkz8wIR5
 gsmA+2MCVNAas+I3t+/4FFQ+trooBAAA=
X-Change-ID: 20260716-aw8695_haptic_fp4_driver-397431e97638
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=2105;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=vSG/kPXqNPwYJI59MvB89WNJPXibeQ6CHHNfIpWOoy8=;
 b=YexMVoUCILJpwVuo4OyGHfeT7YUsefgg8CHDaChHZUSALkKgd2mkpyGTeW9n0EQQ0kGUfEEXT
 96zq5dcqYQpCG2mycu48XVC6774E8YUxyVAlgfLqoQSAoxLLgJrE9+D
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
Variables dependant on devicetree have been hardcoded, and unnecessary
functions have been removed.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v4:
- Level now changes gain of waveform played with the same calculation as
  the AW86927.
- Level is set to 0 in suspend to avoid a playback bug.
- Link to v3: https://lore.kernel.org/r/20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com

Changes in v3:
- Removed potential race condition in power management.
- Fixed dt-bindings.
- Added MAINTAINERS entry for the aw869* family of haptic drivers.
- Link to v2: https://lore.kernel.org/r/20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com

Changes in v2:
- Added power management.
- Reformatted DTB schema.
- Removed unnecessary IRQ dev_dbg messages.
- Changed reset pin bias to pull-up.
- Changed error handling to reflect subsystem style guidelines.
- Link to v1: https://lore.kernel.org/r/20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com

---
Griffin Kroah-Hartman (2):
      dt-bindings: input: Add compatibility for Awinic AW8695
      MAINTAINERS: add entry for AWINIC haptic driver family

Luca Weiss (2):
      Input - aw8695: Add driver for AW8695 haptics
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics

 .../devicetree/bindings/input/awinic,aw86927.yaml  |   4 +-
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  26 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw8695.c                        | 813 +++++++++++++++++++++
 6 files changed, 859 insertions(+), 2 deletions(-)
---
base-commit: 19d1b4de6d37bccecc3ad9144d279f1baa405eb1
change-id: 20260716-aw8695_haptic_fp4_driver-397431e97638

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

