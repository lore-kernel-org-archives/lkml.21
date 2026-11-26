Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684181;
	b=FecyKloftzq64HpTFJOiQpiMLboP2B9eFVhpDuod+iOjiENXYBuRKeSSxEUH+n+avksi
	 3tqQbxj98Bt4Ccm+4v4nGak7Mg0ai4LoIPFychhpruPYiEm59fOVgznnB2MEOuhM/80fy
	 i3skUc7a06MOh2cfQMIqzPyKzLPum7ghnfcqEL4NtmH6z+32HEiY21gxjTBJH5/NHDitX
	 Y+ZFPnx6bMbEjYBeiSBkAruUfHrmaEwVcW4pxlbN/kYh98RJVjeY1L95zkeBSvZetkV4q
	 1hcvUbU65svJ1QrXFkxM/fgj4EFbYUvy/oJrKs7tbq2XWK2hqONr2BS+wXlBN2EwoJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684181;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
	b=seEZr74miVsVCKT/mHFcbszG0oMtGssbqPH5t5sXhZb5x2OJR333NamPvd3ohYfaIFfg
	 xutezgJ/Uq0quDSqfocSg1l/7nNpjr/6e3sxs3j6uV8ayrF8kHBRFIrtREmViySsSc/Lm
	 qwYA0oo6KEOoCNgEjCpbIuOxII7L2p/NLvSUbi3o6C22MLeuQLTMIaDefTcIGPEGs7ZEy
	 5Gkc/Ju1VGtiS6cv4aMHBZRj2oe+dB4mDUtr/w+POhHzzBsW2f98wTZ21eQhqghnqg9Wv
	 ZDhV115PhQdYNxbbCjx+APofZTC02pR1rpn0zjHJ31kR2+ekJcPTi2hWgj26XoMERIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ofdAHN;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536D9606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 536D9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0ofdAHN
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386ab9ab619so8843614eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684179; x=1796288979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
        b=c0ofdAHNY6p0nzbi9Dd4vE0hr2HXmbCm+t/BaPPRiML3TtygeYvKsvz7coqZTaQw3A
         C8FKJbFMnncb0ucyGWpjtoBDkM5D/O6JRp/EA5oayMDp88hW/4kLu8UXec2L9L9j4ki2
         8LMVLFzq9EiG8IofVsgucdi4zooQ5tya4KzCd9b3GcdBWkAGuYMPMfiLVgiRoTwiLDzX
         m4ql+oxmeScoE96yqesSyiZSilZq7cflvrXk2ZeKypst+8CmcopPtrw4Bs3wmwVU5ro5
         QDjuV+fRpX0ol+8iydPMFK5kJtuUHTOV+M6rr9uYsn0uCSIPUs0QfswvegX5Tztl8iaG
         9oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684179; x=1796288979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6j+nTtkEYU+rOhympPIn3n18jdsCRRFadJNhZJaK9Nw=;
        b=Aepj0aqMNgCkae0cphcixwy3eONQICu5r/FaLbdERBYAQJMdniZpXM9Owj8gVn0Szc
         yctnPYIk9f/PfehLHAmA6MUT7YY72dmpO6eNx89ojBjjjtXVya01rNeovEzfoGWIlzMY
         KDEdlAGprRnmlWeDpcP/cdJ/RVcVVj+dznZ44Dq6qReQYNxzTQI01N0UtrDVGUUcF20R
         C6M4uvBCFd+iWajzucbiPUHrGfQ+somXpyVs53urk2a0eIqnvhtvqoApI3HSVYWnZUXE
         pPkaJGO0V2mttYZLRPN0RkFieKN4/egQ9Z3aFkFfSJw2IMnA+9kOipO88pzVDMUjPDd3
         2URQ==
X-Forwarded-Encrypted: i=1; AL+hErFKeRigeryu3RbZd0zHNrSlQaMFvVkc7IOeBYTKk38JjApUptHz5FXZdMvSgxIB5pm3ttJPSFaFcnbz04Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zij3mxavhssHj+nO4rdyEHIVALXdJ0aovOBJ0xpBBKQFpgCbP
	mlw4dYvtFXOMfwfgUYr61XMTSiBfRgCElkObIG58vaQX7uROL1qOTTej
X-Gm-Gg: AZFdTZcVyI7Sgr1uSakCZ0r8nwGXA6DYY9V4intf1B48kL8XwNdI6+E1AU73FqqEuTh
	uutzTvfZll0w6NDxOribPx/uE1oiVrfQdWJMjhXd844QEIWkdIaknwHn9Mz9RtpMZ5v1169RRGr
	5QUuJKy0BrheAFD9OvB6etGsfz0as1+L5qCOocRxyMp55ibPRlBxOg/Q/Ooveuatdsjs+qxcKl4
	wV8FD5tF6zEzf47cx2/YmGNpwf2X1WWtZZyNzIimvhoSDRPva/jXW7tOBr8V6smhud0DhdkgAm+
	v1t+x4hU7zQB0elnWHGK43QxVzjvLzl9qmxeHTugaqu77hHhY3ib4eaua1UddkBore13H/ly1lW
	K3ndenRTHZ3iatx8y3jdzUp8UfCZQibK98crEJAkHWq4IMmeqEPlwB+yCbmPgVtQrkZz8lcOsSh
	xnLMJ5TiApyuLquxtkGmaY9O8aoIiOXzcGn9H/5/Pfp2QqXfPSflaomIi8pKIXTEb35bV/f0y2r
	jP/Xu0XzeKG2bxCxmfz+8r2JEUvrBsIJbj2OE8gX04lgSgYbPfotvLUqBHeE2j3GOIOz62kbB2g
	bpH5/ALSxPm7qS5tt7nWV/u+CSDx8N1GwyF5L80gNNvZvjQbWNQPdMyd3n3/A2LWuv2PU5dmjA=
	=
X-Received: by 2002:a05:7300:d08a:b0:386:240c:19dd with SMTP id 5a478bee46e88-386241b6dc4mr18249807eec.9.1795684179444;
        Thu, 26 Nov 2026 01:09:39 -0800 (PST)
Received: from 192.168.1.36 ([2402:a00:163:2ce9:ad38:eaaf:b00d:c452])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm108374649eec.3.2026.11.26.01.09.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:09:38 -0800 (PST)
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
Subject: [PATCH v3 0/1] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Thu, 26 Nov 2026 14:39:27 +0530
Message-ID: <20261126090928.73637-1-blfizzyy@gmail.com>
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

Changes in v3:
- Rebase on linux-next and include lemans-embedded.dtsi after the
  platform resource split in 1f90a2bab7f6.
- Drop the binding patch, which is already merged.

Link to v2: https://lore.kernel.org/r/20261030074404.33517-1-blfizzyy@gmail.com

Ajit Singh (1):
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 514 ++++++++++++++++++
 2 files changed, 515 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts

-- 
2.50.1 (Apple Git-155)

