Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604901;
	b=zxBCQ/BPkXH4aGjXd6UFNkqaYwzwBHpcpttLAMVnGzSCaie2ykCwLk3ZlOpE1W8SI7ll
	 Cxg2DIHkoAzPLltJ4Vj3x6likoGHf2meo26pGJEpV8ZNbl4R2JIr3rDOPb9k6I8xxC7uN
	 IONCS+GYg5oZz8k7KiriRudpH1S6Qvvp4M+BFYIXSQhXNUV7cvfNJYGA4u6bLCYY3FUhl
	 iIxGTWEpI6MR+x8+9KjjkEAYW8dq/uITwZlc+/436Z7zwxBk1hkyc2uXMV4e2oSM+E2hb
	 k1/OEvYL+k7vBRnMVbOFagnPmh5qjshCe9iA5ADU/WDfEWluZ6jvDITmwyFVi+fKaBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
	b=x1Vs9bL0T4U8ZUz8lUNIEzWHVV9waIZI/rgweQMOk3ez90tWypsOv+SeF5c6hzP1PFWx
	 O5jGAJFQWfPR5voc8QlK/Ntm4/RDJNhP+Ajen+1Ja5jA0CW3B0wSQvQcjPTnJ/QGQRys1
	 8XsF3YMYvVhwuEhv/uS5InAly345cDVlR0WMotgH7+GtR751lN6hJyjl+v7EjJbje5eUK
	 GRWnB/1z/1+r2MnOykm6NTUSeIocOcS6sBSXxDAmO+P2zUc9+W8oCmIVvZTt2Us98julz
	 JV6CRyPUPKZAKgaT7Ny189TEMDjFxfeCl6MchHEtyZdLx33P71srsa9vqVKSIMBwl5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFYeXBci;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77569606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77569606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFYeXBci
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d21051042so52980266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604900; x=1796209700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=wFYeXBcidB6bUPa0ITenvDyBv8wZDaQpp3EpsIXZkTsArAmVChIcxDvhUnBiCCb+/t
         WeSNE2euEeWKnRuUgkFsRIVv0m8LgqAU3Sgf0JhoVqwC8MM0GyF4WPGToccLYGXCTMnR
         FlhpL2nxRtspw50yKDr8EaLMru20w3BcngHhuD6GM4ftL16diaksn72/nZFPDjnbbxqm
         fxL1lQpzHwe6f0Dk+Ub7dRZCD6aiVopqowh+UdXP5dfxzHeSaVurBDZo1Nxsd+cCyISq
         1DUzMBxwOy779Q4vp3qKWS/Qfr4+pKSvDxFORflGFZNUQD8SpqEuboUqHSCMS7Dlq4Dc
         r9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604900; x=1796209700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vim7sbndF1zYQuJCjFH9ennVNq+IgaxKfDCkwcZwj84=;
        b=BR0Tk4kIQT6T4odeZJ0fy66kretH269OGi5TYPvLdGucIG1w/PVT77J6JP9n/3BB/a
         rOmg3r2LGelboPFVki9nOqMRwWgdLrxD5U0VTVYVK2KFa2tfp6ZaH6hO6LdVTZ5fQgU2
         CmhEMsE7l9iVbqosGsOldY1E1xlowASBBBd1dnxkbFQwJnrNo2B7A/yQXR5cWlnZdrBH
         alGak3VqHIQyecv+b8+O/No3EsVqZZbiZnbSNo2Hs9yRJeEnGkgvxvOjvBSGE80qAL6t
         z2f8IUJueZA4ThuaArz0TEtPfq9luNl+mffQOzOTNrjdWxTiCFnshHPlbYXzluXTJHjz
         v5pA==
X-Gm-Message-State: APuU4Z+J4KeVt3Jt067qeLh4GU8nM6SQmFtJkYM1Di85R2SDRp00wlJM
	TiT+P3b91hQbx2PvX2SyOvRrLT+nJ1HJBM/93ANHmFFMER6bZLh/0jtg
X-Gm-Gg: AZFdTZcJX8tXe6cN6ZH2iPsxIW/gFSggQboJ1abYYwJSSW89XMjytObNSYmO0O6N9Mt
	wTkUuzbV/5UCOhCxKB2D8Cc+Xhmu6RHJrajJ+0M8JTacShOWidSqmxQVc176bGevB6sSAxcyeCj
	S3LBIZCUnvdAKfA1Mq1+I9pUiEFJ05d6Cit2x395oNNNsZwO5GruMTsTuehcKWmu2Wsa2ULDHjG
	/Zm4Ecq1hCtH5p/rFYq2jLlUUTOCZGuvnAAg//TVWU4wnkDirzwu3QTuFeh8w4LheEYyRTKLSoV
	HFxUlVZnn/Oaaq9dQhg9QATlG0LKrib1z37WYyKjoN9Ax2Tsy2rzenHyE3Z4WwJGvkS3cQlT2IL
	dj8CxqBkjwHddBd0no47CxXWskRFaV49x/LI5qj6eyE/H5K9mwKE4Hz97j2ULdeiNcKPD/gLCxY
	VV1hObSJ0aE2y4JS1rXikgGD/ZOpnI6vyRFo0b5sfUIVRO47ij1NWDpVg/tNI29LVSGZqXigzXZ
	AEyQ3dGoS40ZgG0S4xj+3MoM45rgFgxG6PMk47XoYV5WceaAlRosMEJTqwdKogsmcKENog3vPnM
	faatdq2Iz2baBBrE9sPXWatUCEJct4wTYweFGR5a628EaAvvMb/LWZh6jtJN07+9kCEFiJ/PDrb
	GvA86L9O7Dw==
X-Received: by 2002:a17:907:1c9c:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c519ac70721mr350640166b.48.1795604899681;
        Wed, 25 Nov 2026 03:08:19 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:18 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 00/13] tegra-video: Convert to media-centric pipe
Date: Wed, 25 Nov 2026 13:07:37 +0200
Message-ID: <20261125110750.223628-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A minimal set of changes required to convert video-centric pipe into
media-centric. I know that moving to /media should be last commit,
but it may be beneficial to keep this history in the /media subsystem,
instead of leaving it in staging.

All changes were tested on:

LG Optimus Vu (P895) Tegra30 device:
 - MT9M114 front sensor with complex topology and irregular pad mapping
 - IMX111 rear sensor which has simple pixel array and a single pad

ASUS Transformer TF701T Tegra114 device:
 - same MT9M114 front sensor
 - OV5693 rear sensor which has simple pixel array and a single pad

Nvidia Tegra Note 7 (P1988) Tegra114 device:
 - OV5693 rear sensor

They all work and produce images.

Svyatoslav Ryhel (13):
  staging: media: tegra-video: Move driver to media/platform/nvidia
  media: tegra-video: vi: Drop controls consolidation into VI device
  media: tegra-video: vi: Expose all sub-devices in the pipeline
  media: tegra-video: vi: Drop subdevice passthrough and input ioctls
  media: tegra-video: vi: Implement link_validate for video entity
  media: tegra-video: vi: Populate stepwise frame sizes via vi_fmt_align
  media: tegra-video: vi: Report stepwise frame sizes instead of
    querying subdev
  media: tegra-video: vi: Enumerate supported formats instead of
    building bitmap of compatible formats
  media: tegra-video: vi: Configure capture format locally without
    subdev calls
  media: tegra-video: Remove remote source subdev helper
  media: tegra-video: csi: Scope pad and state ops to TPG mode
  media: tegra-video: csi: Add pad and media operations for own CSI
    channels
  media: tegra-video: vip: Add pad and media operations for VIP subdev

 MAINTAINERS                                   |   2 +-
 drivers/media/platform/nvidia/Kconfig         |   2 +
 drivers/media/platform/nvidia/Makefile        |   1 +
 .../platform/nvidia}/tegra-video/Kconfig      |   0
 .../platform/nvidia}/tegra-video/Makefile     |   0
 .../platform/nvidia}/tegra-video/csi.c        | 298 ++++++--
 .../platform/nvidia}/tegra-video/csi.h        |   0
 .../platform/nvidia}/tegra-video/tegra20.c    |  18 +-
 .../platform/nvidia}/tegra-video/tegra210.c   |  18 +-
 .../platform/nvidia}/tegra-video/vi.c         | 643 ++----------------
 .../platform/nvidia}/tegra-video/vi.h         |  19 +-
 .../platform/nvidia}/tegra-video/video.c      |   0
 .../platform/nvidia}/tegra-video/video.h      |   0
 .../platform/nvidia}/tegra-video/vip.c        | 102 ++-
 .../platform/nvidia}/tegra-video/vip.h        |   0
 drivers/staging/media/Kconfig                 |   2 -
 drivers/staging/media/Makefile                |   1 -
 drivers/staging/media/tegra-video/TODO        |   5 -
 18 files changed, 433 insertions(+), 678 deletions(-)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Kconfig (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/Makefile (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.c (75%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/csi.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra20.c (99%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/tegra210.c (98%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.c (68%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vi.h (95%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.c (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/video.h (100%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.c (71%)
 rename drivers/{staging/media => media/platform/nvidia}/tegra-video/vip.h (100%)
 delete mode 100644 drivers/staging/media/tegra-video/TODO

-- 
2.53.0

