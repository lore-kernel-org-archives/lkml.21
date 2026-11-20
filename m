Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218409;
	b=gbRh21fuxhxlcfDhuHA2uxJLdbQExqbh6T+9VJnFD36FmL9frTS05h5mL7a/BVrDlaW9
	 q4aqQ6/g204aNp5ZklipcBqyay7XOEFsBS3RMUhTLfBw1gIPoBSLoH32z1OFbhsZvq5hI
	 JcyTFCPKuHqU2tAuwcrP3Lbi4orTxKan8Ojv0V91f4rraSeGSJTBTUl6N4XPMDgHvV/gm
	 /iQClw1ckKS8q775a1sV6QLoOlt0ICOvJKzboO48ufm1lYH2BVxonU+3gKzmBSlOoi2J9
	 3/VDiVDCssSIpP6kgDrZBQOyFf1tWCWCKHILzAsc7wSasWfTxP8oFe14bWC+7xgqeRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
	b=hThxnyapyXVNwcILu3zEcPf6mGuyPtgDl+Qdb6tPI/tvJl1/agF5lJi/lob/Ncl8e2Id
	 lnVNuAlMjtj1QPJC0cL0X6IF3y9VhvqJwrOAEeCaGItkZ5nbR8/3l0SiOcYwLUM4t0Vrk
	 zyI0nN+8yoQ3yCxqnzzMl8hoo/MfiukGtxVOiaKls+10WFh0eA4ZoCBCc5q6Z8eZfETWr
	 PEcjQSGCmTR9/yEbWWU0i3BVLhpp8F6qk9p2DUzOZD/lZieoCGbKTFsr4+KzvGkabb2ZW
	 5y1qg7E7chI/73vZODycwt8U8fhe8MfS4Y/ly65nAlWqcOM+BmYGrNgfmIt0KJoK60w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTSNHd8P;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA3606A333
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 23:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ABA3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OTSNHd8P
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-491971ac844so1272223f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795218404; x=1795823204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
        b=OTSNHd8PFCoItCuWZGXe8z0/gGI5CMB1ZGziKYvuJ88n2y+8WFH3QDvrqwnZFVwE8n
         afYps7ElSBcGDcYvf5xQbGXPMMQQUxMv2LxOcslinTWT4eoBm918jdOjODb6mmi/5IXM
         mq6z7CjbzBZHzrzosqPcod7REXyYhp2KclAmeB1uc+sh3itIoynHLD48lKufEXCkW6GY
         ZhJEPwc1H6FTfvjgxSJtMExgF87wHF4C3PPEfQgToSBlmXolmgLGa0Ctaw7l1f9G+W23
         mTD9A8Gja1HMz2Sn2+stjkIddPDJoJzRPRuy9R5z7tYPd5NRNROoQWMC1Ak4/017jOkB
         6/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218404; x=1795823204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OFgeIIiISLRE2CIM+y6c/GrjWIn71ZqymM5cDXbJPeI=;
        b=euwAIvmw92dNTC/NF9qLnptx+sTwukw4RxMChXpf+i8F0XQYbD8bJhx+MukRFnvgdE
         GBpswK6ZC9IHnHHYMbr2BW3DQ9zSFUEMw5ko7W9RQqbpbJCw9fJLMpu6YXJkzfXhwZff
         Ajs2c1PXQnScU36Z+l5U9lTYfxksSDyd3ZT+ue461tJ/66inYqu0oDvHrukA52xj5L9w
         s07Hbx8yYXtFeP/CZylMUjRp2YPuwBsIQAFAy6RqXrFRk8LEOCMLH7R9wHSwRb8vAN0N
         lDm5a1v45jnqoZ92Et2zWFWHNqf7Dj3ix93JPgN9n1eVwZMNNMvfvCyJiyW9v18dr3jr
         JeEw==
X-Forwarded-Encrypted: i=1; AL+hErGj6Jfe9ocraDd8qhP6GiH0KAX6F5HRbqKjvGfIvWBBEPzqtFfd8gE4wHEwKk2cnv/R6eUa1WMR2+Mp9pI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/f3sqATq3+ciorbMVM/hWbNtTeRTHiCQkhvhw6ZS5JvmSnbJEO
	d/+v5dYtokTCi+3PxmjVR09AaD3z4T/R4ebGFzFZGU/WY92UId9ez5vL
X-Gm-Gg: AZFdTZfSr3/xffPYbeV6TQvlxhoRAxfHA3zwxGrcdQK+f74Z6fSgCrhnnytsELJiIQQ
	jbL4+4ZyAvDimLoXgv+PDYhjJkn9A2AqFLT2f4AC1/YUs8dPCaGo0NabzsfkHreTJLD5kgHsLea
	jGByo2znKjJHp401yFpPgKLPPt/hzg772Ec2V0tQ4+JV/DxEW7wfDCzQlfDVz45b43PVp5MxDMm
	44DaKoDe5Dh7KaXHlg1buwS1WUyL2S1EPvxsVlsvcznog/M3MVqkTfZjLeRORcLdWZ1oSIJy4KD
	+XcmEDauAiFyNAN5m1mUf/JVNYfK5SVTzbgAzdjUlxG2DjevEMfi0HV1P23N+YPPRlibU0ylF64
	3K9T2xcOhcyAa3I/lY6gFgyP/oHsAZ+eOPR/B5ojLivduJPiaLFinf2BrsrwGrdSOydHQxgAkRN
	HhBot5Kom+iKY9JQQF5opX5/LB9c54aw0YSBy1KyMUhkd1/scOx3RWfu9XI9e3lJQpN7HJH657U
	iYJZHD8Df+QAjGacj9ysd3DR21eLexvqdAxSDkd1K80Pq7XbRxzjoYbw512rTKJu68pPkY/vVbA
	WXTI7moxOaGQYgLohdEYtIb8IO9rVVAs/rlMbZ6AG+nVpEcXqam1ehv3VhtnZB6rDjLL0g9fT1X
	q78tN4TlC4GgPzBEiTK+U5bcu7BTXI58dRihL4M/tha+6pvgHIrJz
X-Received: by 2002:a5d:5888:0:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-4abb47b0fb1mr9327034f8f.51.1795218404426;
        Fri, 20 Nov 2026 15:46:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-95-234-253-103.retail.telecomitalia.it. [95.234.253.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm7605156f8f.34.2026.11.20.15.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:46:44 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] ASoC: Add support for AN7581 PCM driver
Date: Sat, 21 Nov 2026 00:46:37 +0100
Message-ID: <20261120234640.169279-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The Airoha AN7581 SoC provides a PCM interface for VoIP applications,
supporting playback and capture at sample rates of 8 kHz and 16 kHz.
The driver configures the PCM bit clock to 2.048 MHz and supports
8-bit and 16-bit samples, with up to 32 channels.

Add YAML and driver. This has been verified with loopback
and confirmed by Airoha with ZSI voice chip.

Changes v7:
- Convert to C++ comment for the first comment block
- Configure IRQ_NONE by default and use correct type
- Set snd_soc_pm_ops

Changes v6:
- Better handle IRQ with IRQ_NONE
- Drop wrong DPCM values
- Add comments about CHBF_OFFSET
- Add comments for HW pointer reset
- Validate that slot fit in the BCLK
- Add INFO_BATCH
- Fix wrong define name for 2048KHz
- Drop unused header
- Select CONFIG_REGMAP_MMIO

Changes v5:
- Use local reset variable
- Fix validation for channel and bit mask
- Drop use of threaded IRQ
- Return if snd_pcm_hw_constraint_integer errors out

Changes v4:
- Add review by tag for DT patch
- Address shashiko bot comments
- Better protext tx pos
- Set DMA mask for coherent DMA
- Use more managed resource
- Increase users in startup

Changes v3:
- Out of RFC
- Add Documentation patch
- Drop SLIC testing code
- Add MAINTAINERS entry
- Follow normal pattern for commit title
- Improve commit description

Changes v2:
- Rentirely rework IRQ handling
- Fix problem for timeslow configuration
- Better support duplex mode
- Better handle descriptor tracking
- Move to Soc directory
- General code fixup and cleanup

Christian Marangi (2):
  ASoC: dt-bindings: airoha: Add AN7581 PCM controller
  ASoC: airoha: Add support for AN7581 PCM driver

 .../bindings/sound/airoha,an7581-pcm.yaml     |  52 +
 MAINTAINERS                                   |   7 +
 sound/soc/Kconfig                             |   1 +
 sound/soc/Makefile                            |   1 +
 sound/soc/airoha/Kconfig                      |  11 +
 sound/soc/airoha/Makefile                     |   3 +
 sound/soc/airoha/an7581-pcm.c                 | 929 ++++++++++++++++++
 7 files changed, 1004 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-pcm.yaml
 create mode 100644 sound/soc/airoha/Kconfig
 create mode 100644 sound/soc/airoha/Makefile
 create mode 100644 sound/soc/airoha/an7581-pcm.c

-- 
2.55.0

