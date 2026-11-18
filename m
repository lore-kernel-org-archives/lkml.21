Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034029;
	b=15sEqywG9jv/Jhkcg1zP13EJevIxZenBZ2otcRRbBg0Xxp61wDDY7NmaLyDQXIP37eLJ
	 gnPEnThLjGLg01rUxsfl+1gwBiSaidW5TA2yJYh3Y8jJcS1/yigZ3xJ6Aa2BLmgEfbhq+
	 OT4ssI49B6nivP01tkfqS0QqDdF232w850C/cbVFLkVf14oaHwuBnDh+6Ejb+jrtSTvLA
	 R4fhm0YXEuRsxhoFpxEa/ypehmvZ8H1YiddDR9sGmSR7VvBgOgdwDj0RAD/OOEsssr7ny
	 TV90H///JKBDvWwyTIzbktXoAlSR4vAcQW/4QjWGCpr6bIpJaBTSm3PhEPgsnY+r2Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
	b=F8NYouj+w3xyzJwC8kHds7rzYNSZDtLR7WrAUXUHgTKqAt581/UADC1f/sAB0BchRfZu
	 ftyfSTdI5o5OI9CGsJEns8fLbQX5XQAkoOLLP5x3ymTya9lX0R3bpdAUcYNYY1YG7hiMj
	 IoZXZ4rmfu5+BFCXCnpVkbBmIBGn1o3ynzC22OtCFgdu88i6E9GDMo59vPr0iGYw1tFF+
	 Rrylba1PkOab0Z4xXrm8gq47jG8sAKmuYyFMnokepcDGNjGpGe18E0H0kK+jAxQDMxIp3
	 RgyLhbwOHbR64zcJqKN7NnVPPUDJo/am/FwvlqP9AnlyUSoBAsuVwIENuDmA/Om/xvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jL1ED1+2;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067F2606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 067F2606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jL1ED1+2
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea63087d6eso867265ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034027; x=1795638827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
        b=jL1ED1+2rIkiH6cLtiWQ6HaBAuiIYqB4B1afZGAUeiaNG00/sP2dcuzxprHbG3Cjv1
         q+9QwORxgJAY7Ny2UtVj/+xnHAyK8HyNSCwQudvjjmqMAYHUKYl4ZZW1PNl6adeFBeRZ
         4DiRFr24h6mNq3SfuLpNX9pYxi4Nkc2R/VnDuwTjiyUHWiszcLUGo60daNgJAZuiKNOw
         d6UeGJOb9cRzMG8j8k+G2QwpWq3Z29TcFqvIlkkzHXQIFRMx+lpes6i2VMGv8+AGNOZn
         gbU5ZFOS/KrxxTITytJMRgWoocYVAlI0PkgYb0fSxsA0/UigT4Zx5mXp1YGmwlMc2r1S
         Jfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034027; x=1795638827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZ8flJOS7vt4IlbZiE/b3qc9/s7rsTbEqNnieP1+rFo=;
        b=NGfv+fcLG/kocSN6E7DVChCmTCiXWrOWlRVdKA9OGk94uxoXMEYNzVZdPvbNNUUkaC
         N4ByxsrxaU8xBGh55Eb9FyXiLNMkdklGoJFjHlT00SbYIOGk2h862BE+3ZFy4k5Dgq5S
         BDRTlQeQsDnEWzKkVTceTT+gPGtGyMfaXbPUAwtZoHi4QqXLZP7lwF4e8+lIir4cZonB
         VIXa1ix/Bvff5lOAXBbBSgqIAWoVEMCsSLL87vF3FxOxX++qG1hnDkly+hF1sP8cd0KQ
         VZJQYzaoj00N1DVb7y4TILpEQj7MCtxm3ntb6mcEwGTujNnmY4oB3gxlRGLPnXOzoIUv
         Whqw==
X-Forwarded-Encrypted: i=1; AL+hErGt4mg7kE73R5Il6pFcrCaEJkvKhYtkQ1UtFny+6f7i7bRfYJBteLRU+CI1Snbm3r2BBs+5qy0j5lRcCtY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EC1sPlDgdwf8dQ7D9HvMy9slbBPjvquoaPXaGSogHHMAsFqnI
	qvrySwxO7N5lfNbkaExxVy1W6CsD51GhODLN2hv0Ffobm7R5t9bvCzwy
X-Gm-Gg: AZFdTZcvQYj19InX/yfITZmKV+H0zjOL/79LrCIwHaEN1ue+FoEm0gC22q6dgKpLCIo
	n1NgcYQ+mPpGBGa9hs2Uvdd1l4Au7JzEcaNALyW04w2Smke/ujMzOs2f0DH9hE/tkGDyqwvl9ea
	L7pcB4nq94CKE+cABPdoRoV/29h85zdHxtIvs6Em6flmoEQm1Te9DtYty5T5gwrJCS2PjsivLAj
	4xci0+ejX+exrCvhsKTrXbEYKK4CrqKMpfAYqeAtKwkQ7ZiShY9sUfW084aSXqaA4IEDd4bNXMA
	K5csF/LAsG6TQhCdg/brtsaFvuPYhh280LERMtPJ3s7ijlMNPDsp1qw8T1pHbJd5tAclNgFJHBA
	oBcy6G4m9UXPPUDxY1EcgMW6PCyTFWHW5HFy0Yahc2N46zjVFqfKH+cd/+i17TvmPwEyGSW8mDe
	dP3GJQbF/UJssZD1/kaHRdWkBijF+ou0wDXfYaeJG05eNaX5ntoOS2+oi+lGva/iVMckgfI+wHf
	9JsipcgXAdwWM103ytwW9J9NabKWx0KBcH21o2zL77xfMR2QsT6CSyh4479CnZYIz+oxKSqg8Wv
	ikFIOUOhNFbk7RrFt5Xx1mxwp5hZrWha+k+Y1rAWGkl9x2zDLbPznTdzFafhsA==
X-Received: by 2002:a17:903:90f:b0:2ef:da10:beaa with SMTP id d9443c01a7336-2eff71f59acmr62060055ad.1.1795034027132;
        Wed, 18 Nov 2026 12:33:47 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:46 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 0/2] media: rockchip: rkcif: ENUM_FMT and bytesperline fixes
Date: Wed, 18 Nov 2026 13:31:32 -0700
Message-ID: <20261118203134.315591-1-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two fixes for rkcif capture.

Patch 1 filters VIDIOC_ENUM_FMT by the media bus code, as the video
devices set V4L2_CAP_IO_MC.

Patch 2 aligns bytesperline to 8 bytes and honours a larger value
requested by userspace, so DMA-BUF importers that need a larger stride
alignment can use the buffers directly.

Tested on RK3588 (Radxa ROCK 5B+) with an IMX415 sensor, using libcamera
with the GPU software ISP. The DVP part is compile-tested only.

Changes in v2:
- Patch 1: don't filter the DVP output formats, which have no media bus
  code (Mehdi)
- Patch 2: handle all planes and the DVP interface, and limit the stride
  to the line width register of each interface (Michael)
- Patch 2: drop "on MIPI" from the subject

v1: https://lore.kernel.org/linux-media/20261105232310.385463-1-faizel.kb@gmail.com

Faizel K B (2):
  media: rockchip: rkcif: Filter enumerated formats by media bus code
  media: rockchip: rkcif: Honour the requested bytesperline

 .../rockchip/rkcif/rkcif-capture-dvp.c        |  4 ++
 .../rockchip/rkcif/rkcif-capture-mipi.c       |  3 +
 .../platform/rockchip/rkcif/rkcif-common.h    |  1 +
 .../platform/rockchip/rkcif/rkcif-stream.c    | 66 +++++++++++++++++--
 4 files changed, 68 insertions(+), 6 deletions(-)

base-commit: 7969a6f407cf55b5254c824c87875452655ef11e
-- 
2.43.0

