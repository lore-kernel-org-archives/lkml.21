Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424336;
	b=dPRNJe2Egn8CRMG9gEo8h9T/eqVpvgadNzkhyJYE7QrEVj6AVX4EJtztcE35vsmMI3nQ
	 4sQrSXN+vlEv4N8KlwNxCa5OEqJgZxWxcwxiv2mXYzihlFOdzn/c3EjguBoI9Ciq3iuyy
	 vW2prp/mnf5PWMsNaLnYUDnbhL1ip0IkxCstUP47fBUg8WH83jpC3mvkOG7CEhrMgAHtt
	 i/ukeFYPXD/bjBOHET6/NLH9+gLm8nSHbk8yoSb8owuGeMBpRn2JegEv1cqSEAWt4U3Ft
	 j6DCDrmUlidkK1Pw6aog0w/QpKe6J6ut9kdlDN8pVRuo5wUWpC+mVL11bt9ZmInNAyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
	b=I2GuQ/IG5qh/dm7jaU8jQtzCMZlYNZxSGFaY8ao56yX9oMgMEqoGFFsPq386rYuut77Z
	 eUPG4CIvQfVEr5v78E9b7GnTb/lXKSeWZD4i0tB7i9npjkvkdP5ZwNbpYw4DC4oKwQ+JI
	 GRaNzp1Pzyg4ltq7xgwp9xtf2eTgu6SzvN89JEE3W7kHtv1zYloUbh+any3ZylCC+Cl+X
	 uZnLwDR0A2kaSN3okkaqBafOxCIKAF7XU8WhQITgVHGmcHwQ0j2MxxcPnf+jfkUXE3PKo
	 /9DBtTRaxX70gCpCu/eihLAO8lIzlRzz0KtxMZYduJNzKvnbxU5ak0t2baR3uZkKOeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ba8TENrB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FBD606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35FBD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ba8TENrB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso22927405e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795424334; x=1796029134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
        b=ba8TENrBsjirPDWfts90pUDcL14i9TR1XCG+S+Tfh52l3iwLA8bl+Yt9U4knjgpAED
         zl5STchzMfkrtpt5ovoJmtjS6AwDkqqFTugCW8/6NWNGwpDvkmN3DQ4mIgC3qthroXBM
         5kzsoyw1RLr5bveGAHSfJQWFNWbdN9L8YB6s8fExRgHhQRx+/Zi5irO+B9lQ2/9bL/9Q
         enQjJskLMKDYh4UnwLvN/DkV4F4eiTv0uXxL0RtKBOihR9rcMpCqXty1kJZIKjRQUq6c
         HnZiWJIIlQW0PFfwheQU1j1zubbOLhsVR/gbRIn0PfbPQcjB/wgBypdGqaIambjYdgXN
         SDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795424334; x=1796029134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s8y1Uqc1mwCpun1OXoOsJDUzZaLNzgAL1GBXFJFqXhk=;
        b=s9siZhly88PvNfA86cxQ9/qnjnmOHSOcQFtJFQATYgcGNq1mRA1wccuJG6ABW7J3Y/
         5fg8RsGGzRtlzYXl7hAva2WG/Vt7L1DqlA5BnnaqUTD7GKy70tGBeJ03H2HrTH/Ik99M
         jCBAJT8MH4Bp0LwVwmlFGVTKjp21vwX3x6XYQNzBypaiJdW0yQPW5KatfmwcVhalPePZ
         XWBZCB6j7TQtMEFAdMUyNecOnqRPWzgyrezD3/Kpxz0cxf7MXhJFAJ6IIrvalHIyk057
         qiNoUcekN44wavh3qPKJR/J4s/2udiAWk4tBqYXHU4dzXmTPF9xrvb7pi4+l8cxZkcHO
         ct4A==
X-Forwarded-Encrypted: i=1; AL+hErE1Xy31omFPbUSX3Nuti7PONDSc4BdPUy4qRY/zZMyLsQPkYy4B9+AAdQXmoMOEjK6PiHfiAAZp/M4Y9Gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z83erHBl2xSw/xt1VZqmVoHWBeGx+D2ujT/9fZUUBe1fZAG9sFb
	VV+18tygOmBaP62xD7QT/MCla8SkZRfzOYMyhCmKGMNCUDu8Wz3KGZby
X-Gm-Gg: AZFdTZelqPqbZuVdWcDdP6V5i52Sbpix9F8h5QUuJNlchRrtVAHYaEU8xqrFL6uTlrH
	LrH/fiUoDmjiG+C/exI53ARtfacYZIPacwGMlK9mBC0gEJm/J7psYovVaQmKXlivuFvrley8wc8
	V/stm7QDByJhkZsfnjn0jgMeE+/wjCQTB6OH7/WiOMWJhs1wuZvZhvEx6QaVqmIqzlYRks2OzoR
	WfO5mmc6A6Qrpv4Jge1dA2UVjgsRQSpYja2aLyJQyUZkniCzCGYcdRbPyXEfWuRBm7q47m2RGAZ
	HnG9mdg2AUveRYPU9F5ImwBJU37DODf7wxBWi5b1dYthTptPfvF7PcDrUqsSWk4tMFl5/lZWtM7
	riFl6Rf7ybqLro/PwEGxiIRb9jCsdUP2YpTMuXWIu+Pi0f3rPqhxL6YbJkUAsUA8BmJtifn7h7F
	w2kObJ2gLfIAy8WyseptIJypYeo7yX8/blTFB6DBerW3gTpto+4BR93Kms1qPKLLKKgXJJ/C9aW
	wUCPbYRDuOS/Un+ic5FCzDNJOqhFlVTsOenx8CabJvx0wCQEgkXEz54alVESe91PSQPu1eZLlPh
	JU9TOPjd6ZidxyPwQoQ+NE6l
X-Received: by 2002:a05:600c:4514:b0:4bb:6823:3d3c with SMTP id 5b1f17b1804b1-4bb888169d0mr234585905e9.20.1795424334315;
        Mon, 23 Nov 2026 00:58:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm375960755e9.12.2026.11.23.00.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:58:53 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: display: mediatek: dpi: Add compatible for mt8167
Date: Mon, 23 Nov 2026 09:57:54 +0100
Message-ID: <20261123085840.8687-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123085840.8687-1-l.scorcia@gmail.com>
References: <20261123085840.8687-1-l.scorcia@gmail.com>
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

MediaTek mt8167 SoC has two Digital Parallel Interface (DPI) blocks,
one can be routed to a DPI display while the other is wired to the HDMI
block. They are not compatible with any other device, so add a new
compatible to describe them in the device tree.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
This patch is resubmitted due to the un-ACK of the previous iteration by
DT maintainers, because of the addition of undocumented aliases in the
SoC dtsi changes. Those aliases have been removed in this iteration as
they are not necessary to drive the main display pipeline.

 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index eb4f276e8dc4..6cd96a5cd4ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - mediatek,mt2701-dpi
           - mediatek,mt7623-dpi
+          - mediatek,mt8167-dpi
           - mediatek,mt8173-dpi
           - mediatek,mt8183-dpi
           - mediatek,mt8186-dpi
-- 
2.43.0

