Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795598745;
	b=MfzUfNpOQoHini18bA0fpz91wnIo+X/xHMTGKRggKK5qb1VHmOA5eYosw6p2h5qydEuZ
	 kOw7dieX5O0ofgk6brxI4pdU8UTQI4X/ZrLTTUJ1DdF6oZEFcqJDN6Tcrf3KLWN1UqAbk
	 xOY2Ga9GueaLlGhd+8RJReNopF1m9CjvWRQIOU56sGp4kSEWxJOhd0iG/Ft/VI9Kfoyy9
	 cEJRtno4KAxTHmAMuGXa+MIpLJfx0igQ7X7fm+FMveuIRFlbkLikRDTr0GGR6DQC7CbCp
	 lBuZHWYTOTZYLzfZCRsF5rQ5tf9EiEirWcATl+PV9XvBBLqqAPb16HwlMmU9WlkmfSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795598745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GnB+aZxKe6ZtO8gfhG6inB6mdXvFtFPkZxKmjJASbvg=;
	b=PK/FwKEWEkdOfUVcRtshSTxHztH2EJnjLtGkGls6mTd1f2dCOz0T4EWMtY35W0Uh3IRe
	 YgjaKdt1iAz+GVBgZFu1RLfXYcR68MXdvVijdDWtXsVYjBjuMVqlwFZdJwDTX3+eNno+o
	 F3LSrrHvh1ycLLYniwTMLKI2M4nZ+OrCL9TE0DSoT57H3XvDq03XOPgqM8/1avINdnMCz
	 GE2lmPMPsK3bWGc74ra8Igx+GSsOYTvCxEjK8HgKuo1biQXcdxx2gTrukVz9ZdzN2ikwx
	 CY4re8aJbgZOXM7pur8v9DI66Cx/zV5erFUMEGZZXWrQ7rfBentN7BK6MQmsjsBa0yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOmzaNSL;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4B8606A330
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4B8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uOmzaNSL
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f052ae3c86so29894075ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795598742; x=1796203542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnB+aZxKe6ZtO8gfhG6inB6mdXvFtFPkZxKmjJASbvg=;
        b=uOmzaNSLKm4UoCIsOhTI1WTck0A1Qp9NpWDRDxCMo6mn7oQJNdh71lm6mtkYhVdDO/
         Tqx7Y+QqFxcydT0vWDmTJX4X+64sz5A021bMbb4xLTyENr68YHHBM1MxausvweDDYnKh
         L65DxTKha36XxQBpYwDoNaiV7cKzhoUuPIYJIIm5jx/NY16J5tFJd3Gq1Q7Sz6XImN3o
         Ed/6eCXinAZa5SnQkHQyFmbi388/ANikjHZI45z38Lvk1Ab0Q8xAG8f2l291e16+ik1J
         NFtjMk4XbaJKDm5KZKP8Jpx7kKd/4HgXXVZgSxOyfobQw0mZGRFV0+efXmydwCGbCQRA
         KfuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795598742; x=1796203542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnB+aZxKe6ZtO8gfhG6inB6mdXvFtFPkZxKmjJASbvg=;
        b=pkV//ytmJRxbWkhelzAa50bmEBKlN3KavjPdeMu3M1LjbtvfNcgfbZ2mZortqxhp5r
         4nthWqyeCrN13jysq7zgegdIiq3/xPRhhk3AgmWPk2zHjNiv93wrKKc8LP2SVpUtyg1w
         51aCaq+2+QhKvSVlJ+RhktIPazHTwoZ2td+SoKs2fK+PuMr7sPWjmO+Tc36VjpKG3SJW
         N5Bbh1VXA/hIkOI+6njlV0/G0lulrL68e6kP1Z8jgC6UGPIfW5kIjlAGwIQo0NxlhhcW
         INb2N11MasWtCIvhaNVk02zme+dL2/4y8iAyMGJgkmcI5QUejiTUn8czywG1swuHsa/M
         1JgA==
X-Forwarded-Encrypted: i=1; AL+hErGymTr85EV8cgDyusSOaGR8TUhlhUXmFHeUlczz74536qqHa2aNvdx6YySwhgTlV8uJoUljNwhxpoQuqPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+D2Uds89+TWbRD1h6JVTFsmVs+DGUWLGFkSXYTbeqRwoxydwTr
	/ymQCYmN3z1buczykw8ZbSdOgAQMpZFm1T59AtVo5IL5DABHLov2UMLE
X-Gm-Gg: AZFdTZdJ7NIow+6bDXSWn+crNUOc9ET5vTEILrQ015wVcmhOQLdyhjDQ7FdU/AgbjuS
	AvkoI/6m7SOnIlEqR6A8cLuEIE7sVE8Nn0X/KyzJpayO8gkjaALwqcx3gz9zeyEPltJWKNRJVRj
	cbjqJ0D8oru+qqug/U7nqpJIJtnQHr06rw15Uu2XzIhHXkoblTtZPhb6Gy5eO5o702r1mhp1OmC
	uk8imqoKMG46cuPvteQLvG7MyHdQYdsjy58sH8FHfPeF2nHtCd2PKIjd+5k43YgtL8FtTcovXcP
	ZPa8VX1Nkt61ZW2uBoN1dD3Kt4x9OQ43+hfNvHKD3cf/l341y7mXTznywFHWpzSZGk2dNDYi6FS
	Pz1BdAxXpBp8Pte7uXZSRKpMRpA2vSK6OToWCd/hi3B+NpJ23ESFr+3jqTGk+a/jub8znPovGrL
	nh3OfZuZW3NB02l4WVpj27/wSu8u4aTK/dliixgwFXIKNDJPT+s/RGgD9ycvbEaSDyzWVRXEBhz
	uosu29i5rbGv8K0+PPboVS/t3D1Iltyx2/xfPYOEKCjN3/fvHUcUy1GM1SpH8UusDRwwdyHv2d4
	cUj6USkF7xgDTvolAJa75l8gMQb8plaiSg==
X-Received: by 2002:a17:902:e847:b0:2ed:3db6:2eb0 with SMTP id d9443c01a7336-2f03f1d63c6mr171538965ad.48.1795598742548;
        Wed, 25 Nov 2026 01:25:42 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f142b8bsm80883155ad.70.2026.11.25.01.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:25:42 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v3 0/3] mtd: rawnand: protect DMA engines from vmalloc'd buffers
Date: Wed, 25 Nov 2026 17:25:35 +0800
Message-Id: <20261125092538.1938516-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
References: <20261123070440.3060882-1-leeonion.muyu@gmail.com>
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

While discussing a proposal to also allocate the mtdchar read/write
bounce buffers with kvmalloc() [1], an audit showed that raw NAND
controllers may DMA the buffers handed by the NAND core without
declaring NAND_USES_DMA, so nand_base never bounces non-linear-map
buffers for them (see the use_bounce_buf logic in
nand_do_read_ops()/nand_do_write_ops()).

Non-linear-map buffers are not hypothetical: mtdblock's write cache
is vmalloc'ed and UBIFS passes vmalloc'ed LPT buffers to
mtd_write().

intel and r852 have no protection at all; declaring NAND_USES_DMA
lets nand_base bounce through chip->data_buf as the other
DMA-capable controllers (arasan, denali, meson, mtk, nuvoton...)
already do.  r852 keeps its existing local bounce, which is still
needed for the hardware's 512-byte alignment requirement.

While at it, a leak in intel's ebu_dma_start() (mapping never
unmapped on success, wrong device used on the error path) found
during the audit is fixed as well.

Changes in v3 (following Miquel's review [2]):
- r852: use the core bounce through NAND_USES_DMA instead of
  extending the local condition; the local alignment check stays,
  as the core condition (chip->buf_align, default 1) does not
  cover the 512-byte hardware requirement.
- Add Cc: stable to the three patches.

Changes in v2 (following the AI review of v1):
- Drop the fsmc patch: nothing has set host->mode since
  a1b1e1d5bdfe ("mtd: nand: fsmc: finally remove
  fsmc_nand_platform_data"), so the DMA paths are dead code and
  fsmc_exec_op() always takes the PIO branch.
- Fix the Fixes: tags.
- Add a fix for the ebu_dma_start() unmap problems.

[1] https://lore.kernel.org/linux-mtd/20261119090055.1255028-1-ping.li@horizon.auto/
[2] https://lore.kernel.org/all/875wxl1ea6.fsf@bootlin.com/

Ping Li (3):
  mtd: rawnand: intel: declare NAND_USES_DMA
  mtd: rawnand: intel: unmap the DMA buffer in ebu_dma_start()
  mtd: rawnand: r852: declare NAND_USES_DMA

 drivers/mtd/nand/raw/intel-nand-controller.c |  8 +++++---
 drivers/mtd/nand/raw/r852.c                  | 10 ++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)


base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.34.1

