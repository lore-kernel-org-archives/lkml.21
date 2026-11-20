Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199587;
	b=teJ+ZYqh2q0+0wz248RZCsy8VkXSfLP6lDEF2lg9e7B7bc9eWRd4N8cd2PHNx9jo4U9H
	 BfvAMhdyED+sFzSi5d6+7wABSJqbAD8QeLbYbWa+WMCujhVGpsw+nsIuef+L9iK0OZEwr
	 5GjOL3lfZiWmToy6QzDGpDeDMwo/asSy8fpjexDuY0ZRb4a/1VYrdzorWR7irP83DnFMy
	 f/eWp8ereMiRoLOhKSZnf2avtl6LTxJBoql205PwgnvHM41upsanr6oaRa698/mqQkvMF
	 GPz5YvaPoCnKBCc+4I6Gy5WGke0GuVUGWavyHGXmOgUazwuqdZjsTELWzviEZXag6IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
	b=0k1Jb/BBxSG2l0WwvWBSIL6ZZUEXzUBvthKMHkmk9HWMni4pshQavShjwla4xBy6jN9F
	 nyp85s8b3l0qCSwth5qfKl8o9CNeprep3ejoX5Rrdp1vMkK6Rdql2g+f8CeaWC3wVD45x
	 9+ReNwH3y+H9UiC/s8/aaE7sj+IRu27O17jn3+JKz29em+05LAxBPNxTPmjqcDtmLhH/O
	 pJpx9r4IS+4Kj/dmQKLRoekCSzj4GPAeTd8A3naoyMwMu9wwbNfJMM4dWxfEmKxNjuKEA
	 YDiM+MBvnGtmcL/iNn5bm/YcvxheR3cuOz8yjWOzs/kCg5yffIHcMMfMiXe09XmSyBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUOFNvqx;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE3606A33F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADE3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUOFNvqx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so14625405e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199585; x=1795804385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=JUOFNvqxr2F9hFrMFKFGqDX0kyqm4QqIooPOIBVGXhHRxyYspXyRlj6Ac/9gTLQUNE
         Mvr8zszCTHQ4Zks9zsL3JvVxMrNpsRgpDiI3LDZelsCsKhUigBCcl06YtbH9rh9OODq1
         hd0LCI8WtZJTKyaeADRa6EyhG3gASKCyxO5V0j3WKgGprLeriYVOLD5ew2WITO84rUhP
         TadgH7tIbMvbXqz7Vd203I15iRC+r2eQpb6fcVqt1Yx6VJFCKukPmoJ/6onvnZoHl0dS
         p8bAOs+DnWz/XllCSOe2FPkPN3/+9t2k0ERu7IqO0QTLOuUl6/VqaJZWP/yZWsiTGb8b
         tvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199585; x=1795804385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GI03jlm6wghRp7o/prx2Jk3c/vuwKISJcgA3BS1S1P8=;
        b=hUvMJ6SS/DGHuat+7J09wc5nFrOg0whFrRnDoXWetpm6FkWXP/kvi/6LSAsQxAMTuF
         nlHc9yMb6kquJ+XsE8OzTSestAQjPhaz38ntVvTuPbECGMWnzlXU75n/5ECGMJDAs2EI
         v8NnerpX2Belxi12eakOw/nNRMSirjza4uT1MW96wkEYH2NtWOEZCyZ926xH33e7Pqkn
         mA+emaQnUQQTCAjmZF25NXBKlwFVcnZPkFX/NBfrjc1C/VZrq3ngZ6jdHD7Sx6XZxnJP
         dXtRLjj3Rs6RSGF0a1LzpQZpc2f5mAo1a08sJFC5iwMyIQgNWgmr6kUN1xH8JxEqRBXt
         DE3w==
X-Forwarded-Encrypted: i=1; AL+hErHNrEzeLzxM03PrHZvLA1spW4JZ5Db3sDRLfGwJlqXvO2MMCNtSze7TU4VgkCtm0q3vr/9KQ+rpPssK/1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jiX646PjayBzhGeZnPegHMAGl/JquXAALNxb0yVoX/qqdkSTn
	PxhadU2QN2ya7oSPqLf6w6/9vqtZys+7nXbbi37RHf+v4DdRB2LX15vy
X-Gm-Gg: AYBFou1XGNo6wiR/KDzy9GvXn9EFTFo7Mv/drHecs/TQAk8yCGVBkWSrGz/BRs9Hlg4
	0wi9TPDSjbUI5fPLiZqGPvJ9cjALbCWtlh/vyl3IyK9Pew6OIOBQT1kETnpGMIU2GILNKDCcDDu
	tbQn0ufPsvaVYV7vTJeCTJF5eE72UYh0ArHndC5IXuUSoMwAKNkOjyX+JAa27crc1DYHZyBSn7e
	+nfEEWyESwGWt2JdpH41QtPuiOmN9YnZ8ba3TF0mz549PJtM7Zd/KWb3VUI8n0lmPpH7BCXS6kV
	+rHQxqw+7foVIgv/r6lQfwszMjLJeEnbFnfgKm/OGjb6rc24vKssCIetQHKWV13jmba625PDi8D
	+nhECO6nc0b1IOQAbF3hGSqvy3b6z37tYgLqywl6c8ca3ZD1Yd8HOxIMqYwj0Ffl7NwFkepivPE
	vRbX/qRu9uqIXMrHi0MScLKpOmc0+nYo68/k/JkebgzYcoobJW3ovjM/bxx/B+fl2TOxPvSVNzt
	CBvsSVVPGuSLqUFP4Kk64b8gFur5T9XVT4twBAwHPCEVQ39i/laK3B8/d70z3+OJLnf6hzAnxUf
	miYg2/TMWHKbs7c2zkdvVUFXzs+QBSTdhGiaA/WA/8Z118K1j53DPZhcEIODcRfWlLtBG54Xzxk
	4Gb/+nRR7m53rzxovlCLzhg5+BlSEUdOr8NJOBiMCw6HfcbY=
X-Received: by 2002:a7b:c4d2:0:b0:4a1:d291:d863 with SMTP id 5b1f17b1804b1-4bb861394f1mr97174585e9.4.1795199584794;
        Fri, 20 Nov 2026 10:33:04 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:03 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 0/3] arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
Date: Fri, 20 Nov 2026 19:32:27 +0100
Message-ID: <cover.1795197853.git.stefano.r@variscite.com>
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

This series adds Cortex-M33 overlays and combined DTBs for DART-MX93 on
Sonata and VAR-SOM-MX93 on Symphony.

The first patch corrects the Symphony resource table address. The second
moves the M33 reserved memory and remoteproc configuration into a common
include shared by both modules. The third adds the M33 overlays and
combined DTBs, and moves the common include from the module DTSI files to
the overlays. M33 memory is then reserved and remoteproc and MU1 are
enabled only in the M33 variants. The overlays also reserve the firmware's
peripherals and disable dependent devices.

Changes in v4:
- Add a separate fix for the Symphony resource table address, changing
  it from 0x2021f000 to 0x2021e000 to match the firmware.
- Move all M33 reserved memory from both carrier DTS files into the
  common include, using generic memory@ node names.
- Move memory-region-names into the common configuration extraction
  patch and include the common file from both module DTSI files.
- Let the overlays provide the M33 memory reservations as well as the
  remoteproc configuration by removing both module-level includes.

Changes in v3:
- Split the common configuration extraction and the M33 overlays into two
  patches
- Use "reserved" for peripherals assigned to the M33 firmware; keep
  "disabled" for dependent devices.

Changes in v2:
- Enable cm33 and MU1 only through the M33 overlay on DART-MX93.

Patch 2 uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

Stefano Radaelli (3):
  arm64: dts: freescale: imx93-var-som: Fix resource table address
  arm64: dts: freescale: imx93-var: Extract common Cortex-M33
    configuration
  arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

 arch/arm64/boot/dts/freescale/Makefile        |  9 +++
 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../freescale/imx93-var-dart-sonata-m33.dtso  | 55 ++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 33 +---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 14 ----
 .../freescale/imx93-var-som-symphony-m33.dtso | 50 ++++++++++++++
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 7 files changed, 180 insertions(+), 77 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony-m33.dtso


base-commit: 33adc96ac217d6e95b7c44ac383c19ca4ae2ff52
-- 
2.47.3

