Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204541;
	b=nfdaVurzAOKscaTvS315NA8YAXdMltkDHr0Vo4TuJumFuEeooaJeXUOf5Hl++XkMq9WG
	 s5B/jx17kH9zF938bgiSm445pBgdnX1JC16tD75KgYN3luptB9o1ONhl/xZtkTzYzcqJP
	 BgvoAchXuQBAD4ye8f90CXdabAX7JXCvgmIv5rZFyyb7GGXH8g0PHtQgvW5wPS3H0ILo1
	 zl9bBYAZRgx3cvicJ7jvRQdawC1jaOdWSssUOzaIykXCAMxoWoK/CAK39vhE4uw08iGPj
	 vfXdRycjtCINQ5ySyxVWO7Zvz0JfxI4F8Wiz0n127lihqiajLM7UEWt01D0V7fBGzMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=e2Fhjnzys3548VUUVrNzALEf5q+GtDOzAxsUfBpsBKg=;
	b=K2xtZzEFipEU94hArfHP5d8M0K2IKqJFWkxjUqElTEzkSBrr3dZFL0VRYmTQGml90MH+
	 HauxBM1k+BTKKUXf13UIrtvJvbzf7itVCqqQowHjhIx5WNrkJzG9k8P9W9vflVE6qcIVv
	 fVAWrqOeL+L+dG9okr73AAKT+CCnRLEEQ/mdhHic3h7HCWvCcIILMhCF90fAWIrtfGz+R
	 iHmSFTTTSeorE31QxmtNPjwC349BZkMhdQYVgr8mx1jT6lKxLN1B97XaYG0+eVH9/4I0K
	 OsG/+ZSJ+rKf+hTT7y61GjceaoxsWr81UJ1Yj0OalLWukSKEZpCgLIJQK5JhaTML9TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUufgEH8;
	arc=none smtp.remote-ip=74.125.231.136
Received: from mail-oo2-f8.google.com (mail-oo2-f8.google.com [74.125.231.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192AB606A6F6
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 19:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 192AB606A6F6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oUufgEH8
Received: by mail-oo2-f8.google.com with SMTP id 46e09a7af769-860f0ac44a9so390185a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204538; x=1795809338; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2Fhjnzys3548VUUVrNzALEf5q+GtDOzAxsUfBpsBKg=;
        b=oUufgEH8xfkMqykVG4YLjcG/EzZPyl3wRJpGsebMQ/3Au/JpU7ftDmH+CAJ1QZ/uf3
         zGeVyNXYf4OB6jONckjv6BSN9ZZcIy37IAZoqmZQ/BAfwg4YPdSiI139Epb8pSObWn+D
         rFiHAzgAoHR1VW0RhfvWps+mIQcOSGJWfeMjn27MUqxAOEUq4+uhPzA3REkHyS3WDWnV
         4rwlJYj2M6nuU2jHCgSHcNreBsfbGkC9b9e4mAdmuTJY8rmHR7Jg6M85ydzpM8Zxqbrr
         sxzawHqAnQS9kaegGdW6ek5vion5ObqZD3FR8VSaH8SsCa6xMdMLsJSt+yLBHj8D74xs
         OhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204538; x=1795809338;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e2Fhjnzys3548VUUVrNzALEf5q+GtDOzAxsUfBpsBKg=;
        b=N2iNVcK34gP5cxxyjFIA21KZLj2AN2VqkLE32vIqKxrtivWMO4CesJe6wBVhw6X8Hb
         p8b0V5qjClLwQD9MxPiI2mQ73SvqjUlrxGGgUJsB8I3Z/ilfn9o/96RqcYXc11NvW+i+
         jCrqD7i255i/4AehzKWFEfSYPF7Gbz73u44FmKFzqxluobNSmy3TEIz5ON6Gj2pv6lef
         294x9O25QlGGSrfCNDom+XT4WPXg4pXyK+5w1410FPA5S+a8PNGZq6qOC+eg3HX/jMYm
         K33pXh8dptD4vZFJqih/oLChpvLEJvjGn1kECZ/ImC6fKGwoGzcKeknXRa7ZzMW8xFcu
         unUQ==
X-Forwarded-Encrypted: i=1; AL+hErEEWz4g9DzG4ZHyBiI/wUXqovWeb2V1MUrMI746eh2EekzLYuKWZGux4o93IvZQRa4oW/pexPgTOehInsw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VPW7//VpUY0n8X1uLOygJiCzZ60hWgzp2kBjKmIZ633ylo4Dc
	25lHDq8APxf48ucDkDdOo87ZpQ1KELADqvmgwMGOmF3JaDI/Ar9xrR+w
X-Gm-Gg: AYBFou1Us6OCfXnCQpXd/Ij9URqWjMBFCPLDE/gxjetmZRc8ZH/2b+Y5Thh6ch4NmNG
	NNYZ1YvImbt1VZ8mx1PhkMfGG61zfSb2gXwMnF5AsUGf9ph2+9iU11IChExY72UuHyAgrT0YyD2
	5cv9MNRzeb+SGt7U+uuTriTe5i+JPAnTKcWdL5aYkMLADs7uI1jFK/ye0D4wMKWhhsqkGW+eeRP
	Rg7+wgLw8fz4g8WgfinTriiNaWNMLTP5Izif1bPYoCiULD/yE8bfJIqDxq8wEVgla/HkYenrf+l
	3Wn53A76JQAbeVX1ZU0rCnN+QQBbDdeXIAlGlhqkErl66wWkRHshtzt9hD0uyOCeO5i/cBsPTXm
	ZI0uaJ1yFrcWKdrwxV7xcj7Dg+9iAO4mvbVqewt5Y8M/OyNVHd0aA+4VMdr+r4Jvvkdp2jDoWV8
	xZCew9RosRGuFYiAVX/Y8WdiVQhGFtTe4Da/L9aT9ClT+kHjidaqJQeLb7UguG7sZ8RNm8bN4hH
	9+LTPMAloRsrSEC4tBAIf99HC6bnWAhu40cKQATujHGUM4NcTCjm09LydnbaAYb2k4sjwSIb+E6
	3mOLDcA+PUDpzddjDx3OlTi4nKON7MqXMIFx+hS1pT5wIzs69gooYkmh4iUW0NU9upHlUExYUKL
	Lh3slwA36U3FT8M5ruLo=
X-Received: by 2002:a05:6830:2642:b0:862:b1cf:cdd5 with SMTP id 46e09a7af769-863159c721cmr4406988a34.22.1795204538133;
        Fri, 20 Nov 2026 11:55:38 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:37 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/8] media: mediatek: Fix MT8173 decoding through GStreamer
Date: Fri, 20 Nov 2026 13:55:34 -0600
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3JUQqDMAwA0KuUfBuwCnXrVcY+bBtdGK0lsTIm3
 n2w9/tOUBImBW9OEDpYeSvgje0MxNdcVkJO4A0M/eCstSNKkEaojb7Yqu5Cc+ayYt7feMQtUcS
 cKi78IcUbTaG/h8m5cYHOQBX6B3jzeF7XDzq/Cz19AAAA
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=4416;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=VP7GxHd6QGZNLfrMHS9rdtlU1bt2rbvg7SOEleywfG0=;
 b=fvrpVhoZFFs4rJ90JD45HwXsof0avahvH6hEyNvlIdbV16QgmoIGzWayhPPUbbuIvfCynr57T
 fhmaHAn3Qr6CWjK6wxuBxZjUacdnHkTsQwJbR6C+r3pqeQVCrh/TgT+
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

v4l2-compliance 1.32.0: the MDP passes 48 of 48 with the series (47
without patch 6). A downscale beyond the MDP's limits (1280x720 to
16x16) is refused at VIDIOC_STREAMON; a 2:1 one streams. The decoder
passes 47 of 48; the failure is in the controls test, about
V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, in code the series does not touch.
Only MT8173 was tested; patches 2, 3 and 8 touch code the later SoCs
share. Patch 8 makes the stateless decoders refuse VIDIOC_S_FMT on a
busy CAPTURE queue, as the spec asks; confirmation that ChromeOS's
clients free those buffers first would be welcome.

Not fixed here: a resolution change in the middle of a stream (dynamic
resolution change, dev-decoder.rst) stalls on MT8173. The decoder signals
V4L2_EVENT_SOURCE_CHANGE but never returns the CAPTURE buffer marked
V4L2_BUF_FLAG_LAST, so a client waiting for it to reallocate waits for
ever. Stock v7.4-rc2 behaves the same with one NAL unit per buffer, and
the series doesn't change it. That's for a separate fix.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/20261111-rfc-v2-generated-v3-1-e49697d20806@gmail.com/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (8):
      media: mediatek: vcodec: Decode H.264 access units on MT8173
      media: mediatek: vcodec: Pick an OUTPUT buffer size when given zero
      media: mediatek: vcodec: Report the visible rectangle as default compose
      media: mtk-mdp: Round MT21C sources up to whole tiles
      media: mtk-mdp: Do not refuse a crop for the other side's size
      media: mtk-mdp: Check buffer plane sizes against the format
      media: mtk-mdp: Refuse a format change once buffers are allocated
      media: mediatek: vcodec: Refuse a format change once buffers are allocated

 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c  | 148 +++++++++++-------
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       |  58 ++++---
 .../mediatek/vcodec/decoder/vdec/vdec_h264_if.c    | 168 ++++++++++++++++++++-
 3 files changed, 287 insertions(+), 87 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261113-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-8e7b09b7663f

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

