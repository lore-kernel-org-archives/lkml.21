Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706561;
	b=SCONk24WATio0un+GV5uaxpJjxz974xIZQgqHwPZBjon/XbOQ23jEb6v4upob82uBkBQ
	 rJNjI/dQVEMMPIJmGAsDneKOhvbut/mBHw3iTLMQYiV6MlRu3qRkCfyDBWEW+8+K73DTT
	 b4NZXm+Ii/8nXfe2Kgj2XmVCxC0SNAs7IThV0LuAvwOlTntgTkzRyK2XJrdrM+Q3LAeHD
	 CydjHFWOdldFcAy0thY0zY9kI4a687suDZ7j4EPXXJAph/LeYatWoZ1CroSjdFjB9Pn6k
	 s2MgNOChdudbeA1kC6K26lBF0d+JKaNs+dfhfkA7G4hKDtzfXA26gUdiK4atWAsDjWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
	b=SxC/gGxjhJutcH+N5T2Wf1D9ZQCtpMfyDAHtQyUqL8WTffCswrhE1qcDQH8YAqpjZl7F
	 PXCg7ojWRuFD3FDHmB45bHHJL4dtnI3x7hddGMzpQXvQePA0WBFQCMJ9nGuWMt3Ydu+VS
	 t7VxH3ENMcnkFsssS4r3ktkVcn1PKvwJ5RXGVJp58AI/UXGtd24zyktlFY76mPzZhGMf/
	 I0LgNu5Y1m27aqUIOYlRQRcD/V+eJI9UZEbT3FDzljnsq2iq3ABUHNyGQR/InxuXp1a64
	 PQKEIrEUMHhrhf65d/xS9DU35YUNXlLvJ0LYZMxc/YoLPdvmdzgouGlqt+RNWcj9cfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BF5606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BF5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDi+MWpz
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so67245675e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706559; x=1796311359; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=qDi+MWpzqiBvWgwSOPcp5Bs3CfXNH+cOcpFQJSl+RIc6CH5tZlaLUj1iH5K63qXesn
         xxPWPzxoH/Wr5Zgo67x0S18ZH7SdnyDipqkJlh3d3WHtsWGsfRL5jWCgjcM74a3Z6j/u
         fSJmLvJ+R6LM6/dQ8p3lWoaxk3l92dSawUICIKmJCGh8jB/VRkeMjkXQOoMJGs8PPnR/
         0oAOwtmp18ownkufiDgF/vbNxqfSLg668cuFtmlj3rh5dDiVJN6e9zzGIlvtgVMXumqH
         h6pSoSsa+T4bRQpm/DodcogGBrdlC8e9PIKgqxrPNRCs5fzSCmFYmoucQAW6r9c8y1JI
         Prqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706559; x=1796311359;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TLwf/5d+l4N8n7PuVoS9ZNZJjMd7n/Wb1SbTt0Kuwew=;
        b=iOmBxw6VdlousRKBqTeaaazfxRKxBVV+q+m6FOjLT+HI9guQ7k80YHxSVF/rpYt+Cl
         /hugW8fgJLPIt3EFvmMg6chowmNVovUuYVsnWT76RN4Qx4O8r4H7Ja9m+LSsF62fuHwA
         BLvPSlKJoqPMA4iioOnZwDnO2uuCzR1SsCpjZNSXegCVuepav/9/g19zVxWcC6EFk499
         AVvWlBiPgXbM5A/ei7jIs4bu8SIHQEvDAX6Bm2udN6hRU4kQgv7VXTFaYeY+9oodYnvL
         E4webAD07RlOK4Ra6tjciYy1iYpA4W60yG0468vVuBfnFyN5I2rJVKT4OAIYVydw5ZEf
         RT3A==
X-Forwarded-Encrypted: i=1; AL+hErHIlPci1oz2HPDuCWm0uZGToLMQj4o6rY7ufgkKL3fVV1Quo+2nFdYUgUpEuOwUvPzEVfjecAFqmdGJhAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hu3A0Rk2iDyqccwzmITarBDtXpTDjCVpyx/IK6baxoBqHZGNT
	FalxicauzkIPcxOJzoFYpuRs+ca49so1Z2KW1UwOtvjQ58ne2KK3iUYR
X-Gm-Gg: AZFdTZccqMsNKi2X3PN0wRuYID8MvT9LZqVG1sylwjEwzE8ATBHlbAcbdS4RDtqRnX1
	qTwEMjcAgRefacm4GhWKrwHXsBIVZkcUS2CCDwiu0Q4Yf+R15h6+r+VvUrk5FAu8ZPLgRPXfjNA
	fY3scXX2iXdR8k1BTa0G7j8G/I6VrmhxUdXznw90TVivCQAJVkqRdRDUC1FR2DSy4RLZ9befN5Z
	z+T/4XlJa9TcSxx9P1kp3K/C5GCFevv1mdPd6RrXjmsXJp4TLyigyQB2p/JzKP0Af8HMr6BvL9C
	FSBIJw3p0Ro0WP/7HjpOwra3AHSEqXjXmC0KlnaO9U4RA8q+hLvKFtjDBdRgNSvuwQpew0HjicZ
	E8mKcMa/r+H7pocQYuqUPe3Gl77lEiGGqG8HXRRma1ntYLDaVygrkDRt2cG3ndwLmFKqpsA3nt0
	hNyJIF3Wexii5pXxX1uZ+QlvnhQKCHShd1ATXb1jFMVk1KZhyaQFiSJjC7HHQWbSzcSvubVqylR
	VIqlbv0K/8jyMXxL52bQhPn7BAPccThZ0/s+5OPIUj9lG3FKVi0hby6TrBE7IH6BSuzFLMFKnp3
	xtyWg6S5NAajlVtPtS9TiCYdpkUfpoHCTMqk+w==
X-Received: by 2002:a05:600c:3ac9:b0:4a2:a3b:7aa8 with SMTP id 5b1f17b1804b1-4bb887e068emr451013865e9.3.1795706559520;
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
Received: from [10.32.31.209] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm591589605e9.15.2026.11.26.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:22:39 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Subject: [PATCH 0/2] pinctrl: qcom: halliday: Add the gp_mn and gp_pdm
 functions
Date: Thu, 26 Nov 2026 15:22:31 +0000
Message-Id: <20261126-halliday-tlmm-gp-functions-v1-0-b8543d6a83eb@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIALdOCGsC/yXMQQ6CMBBA0auQWTuJbZA0XsW4qJ0BxpRKOsVAC
 He36vIt/t9BOQsrXJsdMr9F5ZUqzKmBMPo0MApVgz3bzhjb4ehjFPIbljhNOMzYLymUWik675g
 ctZeWCOpgztzL+pvf7n/r8nhyKN8jHMcHLsoeW34AAAA=
X-Change-ID: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795706557; l=1110;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=HD8degU7LtTIkgstinfaN6iEKPajs7uLNNN6OR7dmMA=;
 b=DbhUTn77kjaP14rmgpnE2tKjZrsTz+eG3NVAKIQqBaftM/TYrwCoShxPg/rNFmKWYqst3Mam9
 XgfSwrfmVbdAMzsG5s4pyXsc1IGO+A2CqxofzopdvEz2keNGSkToRYz
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Konrad Dybcio pointed out three pin functions that are missing in the
Halliday TLMM driver [1]: gp_mn, gp_pdm_mira and gp_pdm_mirb. This
follow-up to the applied series adds them to the binding and to the
driver.

Qualcomm's downstream driver does not have these functions and the
Galaxy XR does not use them, so they are only build-tested.

This work was made together with Claude.

[1] https://lore.kernel.org/r/84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
Stanislav Aleksandrov (2):
      dt-bindings: pinctrl: qcom: halliday: add gp_mn and gp_pdm functions
      pinctrl: qcom: halliday: Add gp_mn and gp_pdm mux functions

 .../bindings/pinctrl/qcom,halliday-tlmm.yaml       |  3 +-
 drivers/pinctrl/qcom/pinctrl-halliday.c            | 32 +++++++++++++++++-----
 2 files changed, 27 insertions(+), 8 deletions(-)
---
base-commit: d1e44b75cd10eead6750f929e3cf68febab8586a
change-id: 20261126-halliday-tlmm-gp-functions-8a8ed8d454dd

Best regards,
--  
Stanislav Aleksandrov <lightofmysoul@gmail.com>

