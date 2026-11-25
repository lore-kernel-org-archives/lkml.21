Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795637769;
	b=m8xvnxQWh+6HsngqwF9eDZdcJIa7OPETaGZz5KxDAVL0A03HIigfqowSMQdtzBZuAw/A
	 yR4MnLOj9p86gwEE0V8s5cmO3lnJZpTR99r1SRUR4EVgJiWorjHWz4zdfH6QhnY69JvZ7
	 Y6BxJtcMgG6JI2Q6oHP/LQnJX2OoPijconFtyoe2kgTZw5fDbQy0SV7NHrGS4iI7yvJTA
	 Ysc7fjltHwZC3dncXZr5cAdm3Q7SYUMKJ3tMCFHU7KOu7QGxxgMwKHnB//C6yVCUSXGF6
	 BqanAkbD/ZovZlSc3ldANAPMQbYfzeiJIawyDu9TwIRDEkkjNMXLAvfc5rYdbFTZ8AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795637769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=dAZBhqePErN5XoE3TjBeSV916TZl6zwKukFpkFOF1YE=;
	b=bUpZYgcUXrLJoFqJpQ7QdUOS3rCX6G5N53dMIUjRP/KZjKRdqUioSLpIB4OS3iErW0f1
	 X517quzrfGBe2ZJca6qABqzJ6QAC+h7w7A6Ulzgk5PFvgN7/LxmE3wdhZpZgumePjWOvd
	 lXIwOcqWN0ZbO77vupOY4B2w/sVK1jB8Zhw0GV/G/HWD0c5vurWLm/Olqk/Ec8gYupCCM
	 zm/LwYFqo5OGhDEkfJQEjpTpBKbnI4SjS7j2ZpToM0mocY6gvPhduZcTWaPn8DNMIE10D
	 c3kKhcPGq09Bx1rZwwUe7hruxa5wAmPwwHbAs/n3DcDcR0f6x+sbv5rKaM8oDLIIVRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQpuFhdt;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813ED606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 20:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qQpuFhdt
Received: by mail-oo2-f0.google.com with SMTP id 006d021491bc7-71b2566b798so598001eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637768; x=1796242568; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAZBhqePErN5XoE3TjBeSV916TZl6zwKukFpkFOF1YE=;
        b=qQpuFhdtBkOgsEfNRBMALwsDBIVgLX42y69LA0eHFG+7ni6xl9mwkUihQJDmwehruy
         UD/TtGkGeSYh/dN6+YX80wYiNcrNIRDoKQSZCMyyDU09U1atqpuVP56cfqi5wLver4Th
         JPWU6gU6Nqpv6koZIL871KP+hrf7iqDjmDmParLxeiI3nj1L40otFcqOrPe22eVrkYTx
         F9tB0g+gyKmx4NWWBB6foEGFiLhrfT4Wwc6wr0yStTKzykIhoIefmSykbBwSD42ihHwU
         wlSyXDwsGp4GTa97bIGuIDFXGcMlHp9V064/oinHycCB7p73dhsoqqa8NJmyt5Oobedd
         K8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637768; x=1796242568;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dAZBhqePErN5XoE3TjBeSV916TZl6zwKukFpkFOF1YE=;
        b=HfIlVCZKSOTSpDXjcQsJe7P6nNzoD7RW6b09rBStLBjGYL6UHT6jSY6dFqEWDRV452
         2ut1IIcEAypYu6LZdifEOGLQBFXpJbJzgWSeOuI17XBYXrH/Egjdobx0zNusi49zLT/P
         r2J72plc2hT3qAzN99sxixCGrX+G4pdrzLNB/JMKfumCdSSVH77qDvtNSXtZPJ3fRx7p
         c1O+iWJviJlghlD3ZYbeHgjtMZlRigYb8FePwIamZpg0ffaPlmbxf4GX3RXj4derTe+9
         2YujPJpp64uUpKyRsYees00oNjCI2AcikcamjICZekHu5t9SrZhFIol6xVlBrChvTCza
         VtoA==
X-Forwarded-Encrypted: i=1; AL+hErE8nbnCFK79m+7VtqRHYzW3Knit+KjEPI/m+SzoTVtttyOIcq/6jsuLsVaib1rJUlKNax3h3O/4kIg+jwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G021Y423mVEtGYVUGAoAm2BAwEYH5RktR37kEbAfnwByGcPY3
	y8uGASyjjO6DP5Ftyebk2zBo1taBKD1f1xpWi4qMjLL3Ac/V6ZajI0nW
X-Gm-Gg: AZFdTZdHUgnuWxJ6T/3esFe2Z2J7qFxCDEmDukSs9gKVLwvIo4+d9BabHKktQMRY3fe
	Hw7UGT8B6pvOw9bB2X9a9fsp40f6/AGfCRpTNyVGRurQ6TwR9RKXr1QDP1xEFuYZ1HYV+X4cKXk
	+W5OpXquaBVnYUauDEAHCHOcB/tvnst26zwooZRjIztQg1rfCvRbqU/NxixGqqDFcCXP2mAQZsb
	KrY/6aOPDGCii0fyDdP/Rz6HijdGDYeQa4P9aFaWdg8h8+QIQmjcYI7ZhbMZVuADlCma4EKLldZ
	9JmrhchLe+LKoed0/M9cdRM/G+U1yUY1+njicwjwtY5xAqCUChsCaxj/IxEUj5LEk63UQLysM2C
	75mNooFx0FRzCnun5Q9P6UbeLyXRc4RRCF7esQyRWrZ+j7gV9BOIDUEwEfNWBrrNDEBiIhEtSPq
	DmuW05Ri2IiBolz0yTYw/p1CiKw3t3vRW+io1QldW0G6wbSFSNXCzKZxlb8zud9LJCiTSq00lwr
	8RIc1UC9mYvuU3xNIuEDXbonMfv3lyeV7ivt7jK938XIWXbsqLnx0MxZQvqhYz1lNuovzQOmygQ
	j4NliJImbj/WKJxu6+2osyPFKOfRHIHDBq2YJ3jnRFOh24Tk9XUslI6V
X-Received: by 2002:a05:6820:571a:20b0:6de:aeea:5c90 with SMTP id 006d021491bc7-71b39438320mr9788646eaf.26.1795637768381;
        Wed, 25 Nov 2026 12:16:08 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:07 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/9] media: mediatek: Fix MT8173 decoding through
 GStreamer
Date: Wed, 25 Nov 2026 14:16:03 -0600
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5XNQQ6CMBBA0as0s2ZMWwxFVt7DsCjtAI2WkhYal
 XB3I/ECbv9fvA0SRUcJGrZBpOySCxM0TBYMzKingdBZaBhILishRImxiythWumN65yWSNq7aUC
 /3DGbYMmgtzP27kkJa1Idv3SqqsoeCgZzpGNAw25twWB0aQnxdeBZfOvPkfwvJwvkWCtlSYuzK
 S2/Dl67x8kED+2+7x+kWw2Y5gAAAA==
X-Change-ID: 20261113-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-8e7b09b7663f
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=5534;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=70e+oVtA9v6pUdkJvj3m+aYfVUYdPR/nbMSAxA9cKZQ=;
 b=nNtr/9rlKDMFX6JMSeSRjVOYdatf25eVzakwEpG+SSDQJcu6UNbe/djR6lJ3XfHhMH4ZpqiZi
 EIrwIllhk5iA80UPYlKMbf+GwX4U/9n4HMHLbnbGvei9Hc/w/mUyaAk
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

These fix the MT8173 video decoder and MDP for clients that follow the
stateful decoder interface, found while getting GStreamer's v4l2 decoders
to play through them.

Patch 1 is the main one: the MT8173 VPU firmware takes one H.264 NAL unit
per call, but the interface hands the driver whole access units, so any
access unit that begins with a delimiter, parameter sets or an SEI failed,
and pictures of more than one slice never decoded at all. The driver now
walks the units of each buffer. Buffers holding one NAL unit decode as
before.

Patches 2 and 3 fix the decoder's answers to what GStreamer asks: a zero
bitstream buffer size, and the default compose rectangle (1088 lines for a
1080-line H.264 stream).

Patches 4 to 7 fix the MDP: MT21C sources that are not whole 16x32 tiles,
which the firmware refuses (1280x720 failed on every frame), a crop
refused against the destination size a client had not set yet (the
scaling ratio is now checked once both queues stream), buffer plane
sizes that were never checked, and a format change that took effect even
when it was refused. Patch 8 fixes the same last bug in the decoder,
where VIDIOC_S_FMT on a busy queue changed the format and returned 0.

Patch 9 fixes a resolution change in the middle of a stream (dynamic
resolution change, dev-decoder.rst), which stalled: the decoder signalled
V4L2_EVENT_SOURCE_CHANGE but never returned a CAPTURE buffer marked
V4L2_BUF_FLAG_LAST, so a client waiting for it to reallocate waited for
ever. It now returns an empty one after the event, or marks the next
buffer queued if none is ready.

Patch 1 carries no Fixes tag: the driver has taken one NAL unit per buffer
since it was added, and the change is larger than a stable fix usually is.

Tested on an Amazon Fire HD 10 (2017), an MT8173 tablet (board DTS under
review), on v7.4-rc2 with VPU firmware 1.2.0 and Youngjoon Lee's MDP RFC
[1], without which the MDP writes nothing on this board. Through a small
V4L2 test client with one access unit per buffer, the decoder and the
MDP turn H.264 Baseline, Main and High, H.264 with four slices per
picture, VP8 and VP9 into frames that match ffmpeg's software decode
byte for byte. With one NAL unit per buffer the output is byte-exact as
before, for every stream but the four-slice one, which cannot decode
that way. Through GStreamer's v4l2 decoders, H.264 High and VP9 also
match ffmpeg byte for byte, every frame; 1080p H.264 and VP9 play
through GStreamer as well.

Patch 9 was tested on v7.4-rc3, with an earlier revision of patches 1
to 5. On an H.264 stream that changes from 720p to 1080p to 480p,
GStreamer's v4l2 decoder stalled before the first frame without it, and
decodes all 180 frames to the end of the stream with it; so does the
test client, with one NAL unit or one access unit per buffer. The frames
after a change were not compared with a software decode.

v4l2-compliance 1.32.0: the MDP passes 48 of 48 with the series (47
without patch 6). A downscale beyond the MDP's limits (1280x720 to
16x16) is refused at VIDIOC_STREAMON; a 2:1 one streams. The decoder
passes 47 of 48, with and without patch 9; the failure is in the
controls test, about V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, in code the
series does not touch. Only MT8173 was tested; patches 2, 3 and 8
touch code the later SoCs share, while patch 9 changes only how the
stateful decoder, which only MT8173 uses, behaves. Patch 8 makes the
stateless decoders refuse VIDIOC_S_FMT on a busy CAPTURE queue, as the
spec asks; confirmation that ChromeOS's clients free those buffers
first would be welcome.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- New patch 9: return the LAST buffer at a mid-stream resolution change,
  the stall v1's cover letter left for a separate fix.
- Rebased onto v7.4-rc4; patches 1 to 8 are unchanged.
- Added r-b, and cc-ing stable on patches with commits in stable
  (Nicolas).
- Link to v1: https://lore.kernel.org/r/20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com

---
Ryan Brue (9):
      media: mediatek: vcodec: Decode H.264 access units on MT8173
      media: mediatek: vcodec: Pick an OUTPUT buffer size when given zero
      media: mediatek: vcodec: Report the visible rectangle as default compose
      media: mtk-mdp: Round MT21C sources up to whole tiles
      media: mtk-mdp: Do not refuse a crop for the other side's size
      media: mtk-mdp: Check buffer plane sizes against the format
      media: mtk-mdp: Refuse a format change once buffers are allocated
      media: mediatek: vcodec: Refuse a format change once buffers are allocated
      media: mediatek: vcodec: Flag the last buffer before a resolution change

 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  | 148 +++++++++++-------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  60 +++++---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   |   3 +
 .../vcodec/decoder/mtk_vcodec_dec_stateful.c       |  44 +++++-
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c    | 168 ++++++++++++++++++++-
 5 files changed, 335 insertions(+), 88 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261113-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-8e7b09b7663f

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

