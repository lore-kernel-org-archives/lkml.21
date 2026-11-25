Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590363;
	b=oLZ5daZ/kA35dte8fEQNOUJni4ejEM3g0F9wmKc2JIQV6U7o7P6cWRdDn5LmvimtAKDu
	 yDiEqmV0/zhT0VN5IQS1oiHfGT+PQ4UUpxa5jEXIGGeRVNTgMuD10or2gGkMNrgmXCAGQ
	 1GF6czn9L4ukIfAu0C4VwIkHhUnn+bB/abjW63TdsjdjdyKXTJ/p6Q9KR2VRtCH04tQ3N
	 mNuETV0xS58wSe3Wf1+1hJkdkwpx7qwEwiE/4p2Sy6p24o9ZrSFFP42UjoeTS9V4kcoin
	 IcAki9AgT810kV2b7NqVj/ErdeNG9i5zClyKLKN521X/nPiZK3oHhsn/kKeVuzMXn1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7KO6BJkPL4Xh/S2hlOpY8o2wtZX2tSI3Ngql/Modzpo=;
	b=iZjqGPYnDPTG6pWPZkohtCNF2cMW0r/cCpEDeP/xYkiFgfUozIgw/aZf/FpA2Od+wzxy
	 swGVykLj1FAiF5ApZMfky4CVv7jJq0P6Sbutpz6w/7nifPFPI1ftyl8UXjlzt3uRMkR0M
	 qYqVYFSFB9/gpL8CDknpoOmigfjlNrNy+OP7LHjA1w6+OfQNISD38aXTik66YPbVTfqLq
	 9/tUzBNCEu5tosZk6yeB0eGeS6RdeI9kTbsEya0aGavyQAO/hyac28gHeVENE/CGNzqud
	 RI+7u/iVimYby9qSGfkZV+wrrh11w8nvWAzh+LV53enaIyKsLvUvMxUIxiGewXhGxIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JM/gUZ6M";
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B92606A33C
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74B92606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JM/gUZ6M
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso2538640a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795590363; x=1796195163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7KO6BJkPL4Xh/S2hlOpY8o2wtZX2tSI3Ngql/Modzpo=;
        b=JM/gUZ6MnB0HIH9eK8aGhMfp1BgxgrDR6Q+JcQLNpNr+yAn80p2kj2lImXPdyhGH7S
         HGIXV1nVDQS/KnYzNKjeGkR1qd0vkBh/3DIs8x6Sj6LCH+LSoOjq52kJnC9BD94ZGxHU
         vkLQdMJrwopevzUAbNgJPRyn6mOEiYpAfbcuQoyF0AiPl+6Zj4d+4WyR0yNdFj4T5EG/
         vaKsl8Y8Ab8u3BHS0QAZ2aipApB+EVkqu4s+59UDjAwCxlimSUepBswarAd23qE1Ayvr
         HlRa2MSUGe8udPcKd08G8JfhyWXlB06/llqz/+84qoo5m91HKAr+JdHMdpWd0xTw/ctR
         VwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590363; x=1796195163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KO6BJkPL4Xh/S2hlOpY8o2wtZX2tSI3Ngql/Modzpo=;
        b=N12kJj07ukdYGqyMTdcAcVmYY7e9bdVOnvX3SjikPZB4ocE+Sx9JhBokqxiybK99QR
         BGiFrX91Jx0aEn+FHzFXH8QsmHQWJJBlbVLHWYJPtYFbXno4z89mw+6+eJlAsMqVPLk5
         VS0filX5ZSDL5k2o5BmO6IxxiuhzMzNfeGeBTDqV52Hg/f4xBetKyeo/9T2yf+EQMUr0
         jD9mLBwkMnSJa4GbeN/Q5uIB26cyLJN3DX25i8nFtk6UvevfPUQ5VN+zk6TmIm61O1j8
         6Sd8U35oVMk3luGAXu8r2qmzbpimiUPsBi/+2S04Pa8zOieG4bkiygm8rPBqNPbsxFjp
         UP6Q==
X-Forwarded-Encrypted: i=1; AL+hErG+eHA6dFUPf2krzt6Qd/gw13jxpS06zvoDJ4LuEsUTV+PZEGXNE18O01L/r6dxHrr7cFCboCNrOb12tx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iYj2hYEQHoxJWTiMBJNHAm0zyXZBg+XghgdcGoBSWoN1WmI5H
	2zpvFVeHsBb9Q795QD+fsCDO9kj5JM72Ouq5UtdF7fj6ans+T4uminqW
X-Gm-Gg: AZFdTZfNcPGGNXs0pC67EAH63VOoDI7gTikJkCzic50gJQKPR+4HdIhfbDymbR54oV7
	JHAzYaBd7+yJtV6ci6DqpI3BlNHiTvKFUa98YVC0l3qt1JosdvO3YcHjP2ETEFWPXj+7+olFElW
	0NoxyR/Ui6aJZQr7Njbe/qSncoaopgIICAo//dxowECC981xZKZ2OB//jZZgEciPPJnCJRZJKti
	B991BDJcjAQiaku51z2ycXfSJ5kcZBetrVLkO/YnnrDS3F9kwbAbFaIBDtOE5Tat54UPrOdz25O
	HFbyWeOBKrQ28yBHzT+yalU9+vWI6uHW5HlR20t/SRQ9U//8sCX4E5QFCaKGVQ5swvDQK7MAZtW
	525gA7luf9bFOroZZUHS8auFmSyvjGQKNMn7r8PI6Tix7d+TgylJ9I+nECPgOdNoaDNlvCP2CRB
	/6wSSnQk++un8JaKv6aoaTFTm7qbkbtZ4+63jrnd/lf9QZDkesQCm86XB/7UWtazB5hXuIe+5sY
	81NZ6asswKhUDS5LDRnqRadTsVaorPN2EP+2b0P5HkyhTBfUqILoE8A39A9vHhqAnEhL2Py2sLZ
	Yjb0v+qur5HjQbPSJNohZrEwOeNraBVu6X6dsg9cVA==
X-Received: by 2002:a17:90a:d2cf:b0:3b3:b595:2473 with SMTP id 98e67ed59e1d1-3b41c906b61mr14892216a91.24.1795590361654;
        Tue, 24 Nov 2026 23:06:01 -0800 (PST)
Received: from a-VirtualBox ([168.188.125.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm25898247a91.3.2026.11.24.23.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:06:01 -0800 (PST)
From: Minseo Park <hiyoukou@gmail.com>
To: clabbe@baylibre.com,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	linux-media@vger.kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Minseo Park <hiyoukou@gmail.com>
Subject: [PATCH 0/4] media: zoran: fix capture buffer size / geometry desync
Date: Wed, 25 Nov 2026 16:05:44 +0900
Message-ID: <20261125070548.28989-1-hiyoukou@gmail.com>
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

zoran_v4l_set_format() updates zr->buffer_size before it validates the
line alignment, and zoran_s_fmt_vid_cap() updates zr->map_mode before it
calls zoran_v4l_set_format() at all.  When the alignment check rejects
the format with -EINVAL both fields keep their new values, while
zr->v4l_settings, which is only committed after every check has passed,
still describes the format that was accepted before.

That matters because the two sides of the frame size contract come from
different fields:

  zr_vb2_queue_setup()     -> zr->buffer_size
  zr36057_set_memgrab()    -> zr->v4l_settings
  zr_set_buf()             -> zr->v4l_settings

The ZR36057 has no transfer length register, so the geometry and stride
registers alone bound the write, and nothing compares them against the
size the buffers were allocated with.  An accepted VIDIOC_S_FMT, a
VIDIOC_S_FMT that fails the alignment check, and then VIDIOC_REQBUFS is
enough to allocate buffers for the rejected format and have the chip DMA
a frame of the accepted format into them.  768x576 BGR32 followed by a
rejected 33x24 RGB555 leaves zr->buffer_size at 1584 bytes, so the queue
allocates a single page and the chip writes 768 * 576 * 4 = 1769472
bytes into it.

zr_vb2_prepare() does not catch it, because it compares the plane size
against the same zr->buffer_size that was used to allocate the plane.

Patch 1 removes the buffer size check in zoran_v4l_set_format(), which
has not been able to fire since the assignment above it was introduced
by commit 11c9c16f7cb5.  The comparison used to be made against
fh->buffers.buffer_size, the size of the already allocated buffers, and
was a real bounds check.

Patch 2 defers the zr->buffer_size and zr->map_mode updates until every
check has passed.  This is what zoran_s_fmt_vid_out() already does for
the JPEG path: it negotiates into a local struct zoran_jpg_settings,
calls zoran_check_jpg_settings(), and only then commits.

Patch 3 rejects VIDIOC_S_FMT while the queue is busy, which the driver
never checked.

Patch 4 adds KUnit tests for the above.

Verified on v7.0 with:

  ./tools/testing/kunit/kunit.py run --arch=x86_64 \
      --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_I2C=y \
      --kconfig_add '# CONFIG_I2C_HELPER_AUTO is not set' \
      --kconfig_add CONFIG_I2C_ALGOBIT=y \
      --kconfig_add CONFIG_MEDIA_SUPPORT=y \
      --kconfig_add '# CONFIG_MEDIA_SUPPORT_FILTER is not set' \
      --kconfig_add CONFIG_MEDIA_CAMERA_SUPPORT=y \
      --kconfig_add CONFIG_MEDIA_PCI_SUPPORT=y \
      --kconfig_add CONFIG_VIDEO_DEV=y --kconfig_add CONFIG_DEBUG_FS=y \
      --kconfig_add CONFIG_VIDEO_ZORAN=y \
      --kconfig_add CONFIG_VIDEO_ZORAN_KUNIT_TEST=y zoran

With only patch 4 applied:

  # zoran_set_format_rejected_keeps_state: EXPECTATION FAILED at
  drivers/media/pci/zoran/zoran_driver_test.c:70
  Expected 768u * 576 * 4 == zr->buffer_size, but
      768u * 576 * 4 == 1769472 (0x1b0000)
      zr->buffer_size == 1584 (0x630)
  [FAILED] zoran_set_format_rejected_keeps_state
  [PASSED] zoran_set_format_accepted_is_consistent
  [PASSED] zoran_set_format_out_of_range
  # Totals: pass:2 fail:1 skip:0 total:3

With the whole series applied:

  [PASSED] zoran_set_format_rejected_keeps_state
  [PASSED] zoran_set_format_accepted_is_consistent
  [PASSED] zoran_set_format_out_of_range
  # Totals: pass:3 fail:0 skip:0 total:3

A W=1 build of drivers/media/pci/zoran/ is warning free with the series
applied.

I do not have the hardware, so the DMA overrun itself is derived from
reading zr_set_buf() and zr36057_set_memgrab() rather than observed, and
only the state desync is covered by the tests.  Testing on a real card
would be appreciated.

Disclosure: this series was prepared with AI assistance (Claude Opus 5).
I reviewed every patch and take responsibility for the submission.  I left
the Assisted-by tag out of the commit messages because checkpatch.pl
flags it as an error in v7.0.

Note also that VIDIOC_S_FMT rejects a misaligned width while
zoran_try_fmt_vid_cap() adjusts it through v4l_bound_align_image().
Making VIDIOC_S_FMT adjust the width the same way would remove the
failing path altogether, but it changes what existing applications get
back, so I left it out of this series.

Minseo Park (4):
  media: zoran: remove always-false buffer size check
  media: zoran: do not update device state before the format is validated
  media: zoran: reject VIDIOC_S_FMT while the queue is busy
  media: zoran: add KUnit tests for capture format negotiation

 drivers/media/pci/zoran/Kconfig             |  14 ++++
 drivers/media/pci/zoran/zoran_driver.c      |  21 +++--
 drivers/media/pci/zoran/zoran_driver_test.c | 123 ++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/pci/zoran/zoran_driver_test.c
