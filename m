Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424335;
	b=viGYxD+m59Mkkb64K7KtU4ZEbdQ51tL62/ghSL4BiG32hiLuO3rtdk8A2BCVEqaZs39x
	 bx4Vd7DR/VXnV7dpHcFSw7idj8JBFOLleAoYAm35d7Dr77y7X9hfyiY09hldvOpX/X/V1
	 PCeVeEcjCW71IZuc/CkyqR+K2X59cA70WuOecTkMsOMGr5dUPO5GBObcriauYZdB4X4lA
	 IDCzir6xa+SNEvra9LrAz6J4U3MuZrQyqBcDnykVWzmGXUQUarxmoNcIVrdFXmbigF/lQ
	 MtcS9U/2+QQ5Dj0nLWMh1hSdYcBP/fGn6KD9GB8YFVY+4aPKZjJYle1f+KiystjfM9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
	b=qSVcpPzp+3r9w8dI8Zyv9WHESJN/KMBGZDy6QAHT76YiIGufSLJKQ7TxWpnr8rasra9G
	 jFzrbcF4/vhWgFpcu+zKnlKO7Ps3PHwy93/voj7/0zkmLkSe2Ab3lgjewJmBvbk9K2a/C
	 f2gxcDEelufvnsr7nuXkhFQ3yOg3wvmgoSatdQDjurSjkJQThk1Pfc7MYi1Exu4uV5R/x
	 jHMWKZhCPSq+crlQAja+AyeFc/BAvY88MH2w0RPYen30i4a1KO0tRxTx0MlWiNm63aPLV
	 9I8z8Wutt+RiTzbBOAguVgCIMcf1LC+a6J1NrqlYgYRGN0qi3PVmFga25IrbdoDDnMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG3Ypb0E;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A66606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:58:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A66606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG3Ypb0E
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a210470b49so28273135e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424333; x=1796029133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
        b=BG3Ypb0EPki8K0XfjcKNMNuWucIAzL1bgG6ic8Fl526qhYmAzeJDj04amPik0ZIyEv
         krByJmeBrF2EX27hvuynzUkunMkRLag4getHQ7U61x3hmWpf0mbHApq2FDGN4WcadM1b
         hKrWEIaFZuIiUEsHWT+L3n6n2vGpXrBHUzRMjkjxIt3zt9VGNIj9wvkm3TxCwsJKULRv
         0lOp3y3mHl2HWuQZOnT+senHO7IIyQCtRhkt5vPFG+unrx0G8z6mp5tUFrDw0bWj5e3E
         ypKaAoimHoA3QkKyr3CjJU6ZOz4Q00PfVy/Hy5U9Tim91UYEs4FWfISIww6Sjsx3yXGx
         Z/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424333; x=1796029133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fw/YKdGx/bEJxv6m8dJuQDKu0hTKbF1u6pYTLgihK3c=;
        b=J4P+t3JUPHGcmkKkmu8ismcaCTeTWaxAIUoWWmGHG2zgv5+r82cPnHAaHLrGC63oIq
         zJJm3BQLo6h+droYivX9NHOh5jVLoplgTwt+FkMF1GRF4FEe/iPk2ydtz+vPrPwokOQW
         E+QqhYdvwpGJfGjvJTd68qA1aLxi+ndkGCkxCPQiznwelS1v2kYb3VC/ST+TeUyUTgVr
         0aPTjYKGeI+g5ea9KcpJ0nxg20DfskueS0rvkfQ8k0mTdsxibIf3D9CF12nNtcf14nbx
         pyOdDWBeM65R+x19Eu6rMCMVk5Oz0v+gmMtfjAaF9BOknmEnLO0gD2iKzXRaY2bKgSnJ
         QcnQ==
X-Forwarded-Encrypted: i=1; AL+hErGRwqxHE4JB5jKYeLOA8W5LRfwsCmKX1r1ZmBB4UhS0B8tg60VcJJJLZB5bIIN+c8D3v89TBY8DTA1hgVU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R2wpQL3CtMAPd9uju3sraqG6GX7dToava9Ta2yaOQ3mAwzHas
	n5QMTDc+FO9W1q0jl+8eXKbn1P0sKQcfVIc4dAAB8Tgcf0XLbXEELEOWCSlOA51R1Pc=
X-Gm-Gg: AZFdTZe2XrAs5qeQ0Ptj830gZfzOzJR6zmO6nJxXIGPr2G7uB2pU5S9KL3i3ZylSixw
	oUIYiIkIBytLib6wMztKjAvsXmH58JR/MxaiUdqVguwju+7Zol70ifqx25MplCCvzkxVKgcHZXQ
	PXUOGY5wOWZVmyt9/49Qj4bQBlH6fSKInbrTpnQl9vT4Gm1pgYFcSM932RMQONUVjlrzhH4ZPnp
	wNv+5a2BkXdQCaqg+j8YXWplsYfVifw3K0en6eZT2ZwpBKQH/6f2WVEQeE2yNftz6+3TFZeMWJh
	BNy3I1He4RVHB7ns58tMc0PMBv5+aOhPLBQhVBo96sFwIPlSFi2qnaHGkX0Vo8YepZZa4krqv6G
	yMKirk2thAN0Tgvp+OtNhMZkIS+NJA56IHQU0cEzFnJ3VvTdRMb3ZBHcIp7c1tgZWkSNZQ6tAXc
	MYvponnUT7x3nJqKhDrDHWY9NIPhP6qvNfTL+RCc/O+TIQfcj4JBbrHGBdqvQxk1HC9DxOXmsU7
	8giP/MQOsYSXYk6UM+Qiiec8kK0PMAvh8Jecd69bUf1KhCkdn0OSUI96vv8FB0SKO6S8yGadYuI
	UyCZjdOfF7tZRCXhxiQwvLvAPg==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr217464265e9.10.1795424332866;
        Mon, 23 Nov 2026 00:58:52 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm375960755e9.12.2026.11.23.00.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: mediatek: mt8167: Add DRM nodes
Date: Mon, 23 Nov 2026 09:57:53 +0100
Message-ID: <20261123085840.8687-1-l.scorcia@gmail.com>
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

This series adds support for the main display pipeline on the MediaTek
mt8167 SoC.

The driver bits have already been applied in CK Hu drm-next branch,
together with the first patch of this series regarding the DPI block DT
binding. I am including the latter again in this series because it was
un-acked by DT maintainers last week due to the addition of un-documented
alias section [1]. Those aliases are currently required by the driver to
drive the secondary (external) display pipeline, but the main display
pipeline does not require them and they can be safely omitted.

In version v2 I removed the nodes related to the secondary display pipeline
to add display support for 90% of the devices that only use the main
display pipeline while an acceptable alternative to aliases is devised.

The series has been tested on Xiaomi Mi Smart Clock (X04G), Lenovo Smart
Clock 2 (CD-24502F), Lenovo Tab Essential 7 (TB-7104F).

Changes in v2:
- Removed the secondary pipeline nodes (rdma1, dpi1);
- Removed the aliases block;
- Implemented the complete OF graph for the main pipeline, using the same
  path that is currently hardcoded fallback in DRM driver code (output to
  DSI display). This improves backward compatibility for the upstream
  mt8167 Pumpkin board.

v1: [2]

[1] https://lore.kernel.org/linux-mediatek/bbefcf0b-b31e-4f74-bf79-b0ccc983f62b@kernel.org/
[2] https://lore.kernel.org/linux-mediatek/20261117122802.728987-1-l.scorcia@gmail.com/

Luca Leonardo Scorcia (2):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes for primary display path

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 297 ++++++++++++++++++
 2 files changed, 298 insertions(+)

-- 
2.43.0

