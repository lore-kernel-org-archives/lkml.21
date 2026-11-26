Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686511;
	b=mMbXKRXLgMiZlUrbDSUHt9Bn9aLNmd2DUdYt4Z1l7bmDQQkj3Z4oSgUwoxcvb4Gs9pbR
	 830QNW1uy5Ao73T+Zxxwkgi5WTzNV5WQvDcJSoxId0lYrT2VyJAPcY/9ptDAoQwrJE2YW
	 wTG7nV8rXzt+zMUdqnbHF1BBR8TRNNCqnrnIbEsKw4ZuZtOjWemgyBGsOWSXcfSeDWZ9E
	 ksq34RMRYOI6lxLM6qpdhZ3xbC7jU0/uj61TyWvgKg9U84p2PM3Z0hAGw1LTuAQWRIGhX
	 U0Z/McihG0szxH6HHzz0MyzOFBTXvEu6c85Cj7p9M7knVzZW/QWJ2NLu3kwjt3Al9VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
	b=hIEE/64HjUG/zxX7egYC3GEhAaTh0l/6m/2jPhZiLH3mf1LqpLTN/tqqRlxkPbAaFE//
	 d9AaLSYghAOoAxFBbvjXqlstbRgiEohAB0bZVdCmN+uUqCpiE0ZBilEZt72rK1+z47fXu
	 +ro/IBo1Ht8PDHy5wz4Hpwk1bZ2+tI9XqajHmzBUKmiUsYCuXekpX/Me8HsDVdcFvc2Mp
	 6GtAfx5wJ1/8i7r6NtHDTByJs1ZTT/lBTghWqrfTVqodw8KbTsuiLhGRklvCUem6Geuaa
	 LQ5oi6w/+0MzOsRZ5YO+GX0qwmypSvZsPIg1N1TYpl4leJbKZdbbPc5na89MFFrjAFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMxaLUjL;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7CF606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD7CF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DMxaLUjL
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1aefd1bf74aso3559137c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686510; x=1796291310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
        b=DMxaLUjLA5BlKaT6YX+N2yYET838u0pZcFVXo+fjXewh8keajOCnUP+WEalIa0pm4M
         scCx4aQLbdiRKGI3dAts5WvNvtN92ADRV+PDuZKBKnZte2uCb7aUcwwNosGaUhGfFbou
         /4fGB2k9MpVzhDxUhhd/f774mnw7RoeSuszx/XksflzDlHUMar4VDueO2H9wpvl05r97
         Ds52aKW7qa8CoDQOhKF/FafV+zawzdjTjllz7buM6pwiIQCqs0ULFzR41yvedG+idzlB
         yrqIN192zJFzz3mnlsRxNP6w3qq+ySVLKCM73/zH8wkZ46oihXrjSwEY/SeQNTveXDzg
         VrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686510; x=1796291310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Za6MacJG/4uYb3nMvFDyzid4e9GAP1DjcxkycMoIOM=;
        b=MtVMEwSLatqRg+VpgL6mi5C/9XgggilFwgFMbBBGUIllZrOTpqTYULV1asfo4nHzZr
         hKGBFMtZ8096DKhmeaxMnzwaHbFUe69KFJqAv2RlA9cpfgFNDEdi8Dj7s4JuraSbNrJ0
         0+CQRq0rF55ysDkarj4+zJ27XXMY3f56fy00ixaYNSctyBSKH1aAUshBWauLGw+V4HFT
         D/DA8xFw2gr8NijEPUkUgfvxK9E9+5e4z22kEDHglxe9V5JontTbScLIwYxbUJTurpLJ
         RDhM6Zrlp5xRLPHfE26/P2rCbRYG/osFTOYhccNs1r/uv8JDUDwmQ+kVxSfWPUoZG8db
         lQfQ==
X-Forwarded-Encrypted: i=1; AL+hErFe7VRD6z5p8qKYw+3eZoWUOESGJFcteuCNoG3U8rr80+yfPAN/dHwaeUyssB5LlcmZvLwIaJLzwcdfNlc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RKFy5ucG/sB3PqVmIzQUjIE18zb+/l7UhemQYt3+gl8SWiOVi
	2auf/NaThAQs7ezNDpbGb8xXD+fuxfMmh8Q+Q2iShI6BU1lf3Nh1UlXN
X-Gm-Gg: AZFdTZdlephM3MpyjRGGjB4WaNwx+JUcuRcNIzQudOPhknlmsHTCMS68Flxps7WvVR+
	LUEl6+rnlfy8kZEfXF0R+YjBFrZNEPt1A/mxPIW+UJghBtAFU9/QXsu5/xdJYGaiCS7VKQu2n+Y
	/4ffSNuON/hWtWDVtC0yalpmei4/uVutQN2IubmojxP3nQn2peH9Alz7AHCPdMSm1xePcwWyEUB
	w2AuqElE7KTaU5LYKnJ5qc3HOIq6CNh5/AaeP+jyXFwPinLEq9ZEUztb7JWUFm9EnlWgOI2BeWN
	f4BbGx3fJZWKZl59pWmeqXjpCYOPhsGRlN/+EDEYZIgACn+Q5W4Vg38aYyagcwTb4M8uMeT8gYe
	W51DM0a7Szb4MM/i4Lm12nJfiHsToGaWEsVCdx/5Rpo+Gb9qXbTizR0G1KNzmq53UK/BdNw8jmj
	HnZbxBkPlZHhotBX3oMQCfjFnamN6adsdYhmYhdvPMDbFMFqSEqd6fclEXfo5BuXkaLhR3tUS8e
	cd/OyB4VaLXAEmpqkjDL2Rq4DpjvZaKYC/kNOAPDg/YLw1+Mk2XL6bjKZ0TxYdU8UTxrRTWaNIW
	ZEU7jmodSSfaU6ZMsVjT3W50Ieo7EkolpYrCkd49k+2kAlnu3vaVxX648wJ8EfmrrxYIWeFAfA=
	=
X-Received: by 2002:a05:701b:21cd:b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5567e661emr20009355c88.1.1795686509781;
        Thu, 26 Nov 2026 01:48:29 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm71781172c88.14.2026.11.26.01.48.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:48:29 -0800 (PST)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v4 0/1] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 26 Nov 2026 15:18:17 +0530
Message-ID: <20261126094818.77473-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

The compatible string was merged separately as a917cf9dc0e9
("dt-bindings: arm: qcom: Add Vicharak Axon Pro").

Changes in v4:
- Move the PCIe1 PERST# and WAKE# GPIOs to the root-port node.
- Describe WAKE# as active low.

Changes in v3:
- Rebase on linux-next and include lemans-embedded.dtsi after the
  platform resource split in 1f90a2bab7f6.
- Drop the binding patch, which is already merged.

Ajit Singh (1):
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 517 ++++++++++++++++++
 2 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

