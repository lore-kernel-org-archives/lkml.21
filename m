Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795762531;
	b=Pz715nL/ilqbgH8nZ1bpN8QAvvImJ7MannkfIEVBtj9kOpG3YCilTJtAl+ExgCypMw6d
	 ikW/7E6LITG2cnJHTXkKsPoYNEi1QNcP8FMWSWzNBz2hEwTfgveKQYCh50jdoJZywSo0+
	 +V24E/qdTz7C9v5Pw4IySMd7TJG1DtLtY39kZnY41tuHkCrZ7Pgy56tg96K6PajCrOw3a
	 8cPFEaonGRjkGp7WbUXtbRk6HkOCCgtaVt4o70XLSBjSsXfz8aiXoiYwIFIstlywduffV
	 2BmQWLNXw8aqZbUdyn3GEdgBWl4lOL80Q+kpf2lQR5YXy46kxnQeriDBji8q/UN9LYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795762531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
	b=VexiybCVbh+4JWzjicFni2AB549eN8WJebiqfJQb063U6nTCx2PPnJZ4tY5mATq40kQz
	 W5jfuIFZxPXkkQg5iqodddFXFX9en0Pm7EfasbO4FgEvRHCjS0TZ2oDsFHlBhmMK3CIOs
	 ZaqNrZXBkYhofVfzmoGTII/MTKPjzmaTrzsnjtEHYNEPpakMFEeDOxpMgrulqW+/VdaG6
	 rIeB2z3aZZZDBasiM6Wf012qsMJ0vvLSfp84N408+herZDTSgVHsi0Q6OGDS2wg1JIOcC
	 InRz40ruSKLbWW06uXb47vTJTYKzxgrN6PBdGDSjyUvC2eBEhP4VjcBP5ZgYk9akZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3KRuofL;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AB606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8AB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3KRuofL
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso6949394f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762529; x=1796367329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
        b=Q3KRuofLj02rVwyoVmfAHVILH6ey0a2cnoGqSC/PlhiFb7H5vxGono1GRqooYtLvbh
         YxbxUKeyaQGtBufPkAxWfHEcZ95hxNDBzxpJjq6uyBU2lNnZyRG2I/hhjG65R9Fj8aXp
         tUS56ibCDM1nUX0+2lQITNQIPNaJrj/JV9IKbzxoz97sNbDZWnmIXNRSRRn9af4c82cN
         INzCkO1lSvBFiUBhb9wxV9mHu6PYvjCYcCqaW1pGrglSvcOHQDxkc5pgaI1QianJWP0V
         ReJ0t266GQxYTSJ0o82iwjluR0Doj3VbiAXGkszKF48OMsyzJyQbPGJvyI0SB4NxMqrd
         NHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762529; x=1796367329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+xGChd51pjAnzNAyJIB1hBECSnermEzAtXmmjhgIfQ=;
        b=xDsOqWhdSqxAxZMwVhMWqviAzRYrw6lm2q16duyNNKEMgMqV7pmEPjRLgNzfROsTZC
         fYJ+kn6aRxMaJlORLx+vCztNnsyN6HBBIgL/k3X5HS8P0uTlkcRlOux/+K6mmQ0tGjV7
         FK/uUmYa/pJzMhw1K0ii1/bhv0zzuZNpIxph0J1LE0Hi65KFGrXwkqwYHbbGX5u/hjxU
         hyvPqwpJN4u8/DxXfrS1iGTIO7Hqd8Wd2rqgoku2hKP2pbC91P+sv0dqgJbXp6U34Q4y
         Y/lrfRrHkvwyL9l0vdgOszQOACqKi0Tfz5XpyocJrwN5oEYFcwHjYNz9RAvmu6jaI0HP
         It7Q==
X-Forwarded-Encrypted: i=1; AL+hErG6k6LNu4ty00EWoC7CE53L1FLqDmwHVzsg0m3Yiko6aC/KYgLAsOalDz5d9czs6mqc4iuT5uMpKVHedEs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cBOaoKLEpw4f5Rib81SW2hCCLS6AwLXDkjAWX+KknlyLTfElv
	l5itfXjKjyfBa33+XpokDDVcTA28sbGQfo210E3PRwFzbCFul2woj09m
X-Gm-Gg: AZFdTZfTqWmV/2I0qHTW5FSFq04U360i7D728bZKAA0uW9efa5btryK+YCPlr5ZhpvD
	qMM7zwOfN65yfNF19X0gAV4OEPOXomLc4IIDbcUbFrS9fdJzEIa+2lRklHvbGJN3KgezUKzL7sw
	bVe1vlQWu8GPHtPxqxHBDY2wZGU25tXH2mB2PL9/+pNd/sLrk+uC/JRUTPmlPBRifkQLkyiLS0D
	O7nYMViAVZpcTsZphT7pUM0YIcpskAvxDVLQR4W6ZYktx5aVs/JsftwhvqwTnV/bbBaEVWFXITu
	eWba0yN3T+p8w5Yp8l2tMXtVE5q6Do1g/LxtWHRZt+xLgHkb+cpLvYLOMfkjwjK10XjDSTvHzea
	1zZ/wMFTq90HMSOPAYyT2+fh0bdDry1BZqwMgDOCLy9s0dkANd0Dtlo49715UXBnQs3qoxCnXso
	zP9AhqI5XlB3Yy0L8LozR9j4XYZizuYqbfuAkpugtiVqNphxJTNDc0a0HNPl8v0RvS791HBgHLp
	tqJ718ESmHORiLa6eIRK5bO26KahzuI4n0u73HN4Ge0OWEhkvFdJLTj/yYDFqzN2+KRStFfwMMM
	0enMDHkGX3OrujX5ebNUGnZ/hvuYwR1Tbubqv97vMhyVJv9mnRvJEn/JQhrhXKY8zJZj47uvIOv
	QvSbPV/Qdij+uiZseFakvlpeLeFIyPjERja2uv6Hz/DYyy6xtIlVqZDUnYGOgtsM4BaG89uTxlk
	DmnGKGwLHx2i1LOwx55tpx+rxGbJdzbOuzYzOIzm/HOrYniU/4BluQz2dfQPkQc0KM+tl2+F8+4
	7EIzIr3B2gBqru2+TTi0ae3OKS6PHR91dbvRr9TyR45ZsRfnaEQAb8A4jvKF7I=
X-Received: by 2002:a05:600c:3b1a:b0:4bb:875b:3d91 with SMTP id 5b1f17b1804b1-4bb88820bfamr501199575e9.30.1795762528879;
        Thu, 26 Nov 2026 22:55:28 -0800 (PST)
Received: from jernej-laptop (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm42574611f8f.34.2026.11.26.22.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:55:28 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 0/3] staging: media: cedrus: add VP9 decoding for H616
Date: Fri, 27 Nov 2026 07:55:20 +0100
Message-ID: <20261127065523.3685726-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series adds VP9 decoding to the Cedrus driver for the H616 video
engine, which runs VP9 in its H.265 engine.

The backward probability adaptation is done in the driver with the
v4l2 VP9 helpers, using the symbol counts the hardware writes back.

Patches 1 and 2 are preparation: the output line stride is taken from
the capture format, and the format check is moved into a helper.

Patch 3 adds VP9 decoding. Like H.265, 10-bit frames are output with 8
bits per sample for now. P010 output for 10-bit VP9 and H.265 will
follow in a separate series. The decoder core is reset after every VP9
frame, as an H.265 picture of another context decoded next fails
otherwise.

The series is based on my Cedrus fixes series [1], which it depends on.
It doesn't depend on any other pending Cedrus work.

Testing
-------

All testing was done on an H616 board (T95 Max, 4 GiB DDR3, VE at
600 MHz) with FFmpeg's v4l2-request hwaccel. Hardware output was
compared per frame with the libvpx MD5 files or with FFmpeg's software
decoder; the other capture formats were compared plane by plane against
NV12 output, using an LD_PRELOAD shim that forces the capture format.
The 10-bit decoding itself was also checked with the P010 output of the
follow-up series, which matches the libvpx MD5 files.

Results:
 - libvpx test vectors (303 profile 0, the profile 2 4:2:0 10-bit one):
   275 match the libvpx MD5 files frame by frame, the failures are
   listed below.
 - fluster VP9-TEST-VECTORS: 242/305, the same vectors fail with
   FFmpeg's software decoder (FFmpeg rescales frames after a size
   change, so the stream MD5 of resized vectors can't match).
   VP9-TEST-VECTORS-HIGH: 5/6, the 10-bit 4:2:0 vector fails as its
   output has 8 bits per sample, the others are 4:2:2, 4:4:4 or 12-bit
   and decoded in software.
 - fluster JCT-VC-HEVC_V1 (129/147), JVT-AVC_V1 (130/135),
   VP8-TEST-VECTORS (59/61) and MPEG2_VIDEO-MAIN (7/43): same results
   as without this series.
 - v4l2-compliance: 49 tests, 0 failures, 0 warnings. A test program for
   invalid VP9 controls, formats and jobs (57 cases) passes.
 - NV21, YU12, YV12 and, for 8-bit, ST12 output of 12 8-bit and 10-bit
   VP9 streams (66x66 to 1920x1080) match NV12 output.
 - Decoding VP9 and H.265 streams in parallel instances, in 46
   combinations with each other and with H.264 and MPEG-2, gives the
   same output as decoding them alone. Heavier parallel loads need the
   decoder reset before every picture from a follow-up series.
 - No IOMMU faults or timeouts in any of the above.

Known failures:
 - vp92-2-20-10bit-yuv420: the output has 8 bits per sample.
 - resize vectors (vp90-2-21-resize_inter_*, vp90-2-05-resize,
   vp90-2-18-resize): FFmpeg reallocates the capture buffers on the
   frame size change and then refers to frames of a different size,
   which the hardware can't scale with this buffer layout.
 - vp90-2-13-largescaling: not supported by the hardware.
 - vp90-2-22-svc_1280x720_3: inter-layer prediction from a different
   size, for the same reason as the resize vectors. FFmpeg's software
   decoder fails it as well.

[1] https://lore.kernel.org/r/20261109175016.42061-1-jernej.skrabec@gmail.com

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  staging: media: cedrus: take the output line stride from the capture
    format
  staging: media: cedrus: factor out the format check
  staging: media: cedrus: add VP9 decoding support

 drivers/staging/media/sunxi/cedrus/Makefile   |    2 +-
 drivers/staging/media/sunxi/cedrus/cedrus.c   |   53 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h   |   35 +
 .../staging/media/sunxi/cedrus/cedrus_dec.c   |    7 +
 .../staging/media/sunxi/cedrus/cedrus_hw.c    |   28 +-
 .../staging/media/sunxi/cedrus/cedrus_hw.h    |    1 +
 .../staging/media/sunxi/cedrus/cedrus_regs.h  |  131 ++
 .../staging/media/sunxi/cedrus/cedrus_video.c |   50 +-
 .../staging/media/sunxi/cedrus/cedrus_vp9.c   | 1253 +++++++++++++++++
 9 files changed, 1548 insertions(+), 12 deletions(-)
 create mode 100644 drivers/staging/media/sunxi/cedrus/cedrus_vp9.c


base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
prerequisite-patch-id: 032ac086f7ba6944b648a3581a1c287ee06c42c9
prerequisite-patch-id: 30e6f5a647b929dcf501225d403dc1f68436079f
prerequisite-patch-id: 309f0f4b5228ee3b0d3e3b80426429a67e238d53
prerequisite-patch-id: a448a9c72886221eb9b1aea1778a88e163d96309
prerequisite-patch-id: c49f2932a2258bcf000e0e4907e9636b2958b350
prerequisite-patch-id: 3c5110c4b6f13079a09733b972de4cbf38d3119a
prerequisite-patch-id: 78a7e370ba08a94aaaf4cbce49f89432151a9089
prerequisite-patch-id: f62f865eccdab559e9effea5b002b227fc0e3bbf
prerequisite-patch-id: 9a09dbecbbba3731dd2518606a02e12d58e433a6
prerequisite-patch-id: a952ffa6ed148ba0f6b9f5253848b7c8fb2f89a8
prerequisite-patch-id: 9879769cc1ed540f2739c2bf8b43b42a41c6ad8b
-- 
2.43.0

