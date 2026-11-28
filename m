Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883357;
	b=Q1exvrSth1cP8C7qrbO3gHoyp+rzNgMxN0QBWTRuz1l6AFMyMVn1NCUv18P4URfJS6Lo
	 kCgq8DYMd4Do6G4trzMKeBq+uoX93LfRQHaWnRSzF4LvMvfgsOPiKAIROZZw9hQJmYuiX
	 tJZSNhPm8WWRJPVYU2whxyaDiLLbqdvlKM3UPgTCqEJ2waDzMxp4OJQ4etVGGpGhCfE3H
	 yM/HeJ+8pfb1477BNArrdSXcrMUX7MrX9L0Wwp7KJ4NFJTarsqr9rUx6JUpW+aYy59HGK
	 5pPoDlmn+++QIKtPk/QrG5Q39BEKfDhAwbC46Gemmk/KFUnK657zTgHFR+kaF1xGfSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oaqMAPDqo4CVsQghvM56aonjTa5VMPXE/zJHzseSvyQ=;
	b=QSbLOrTEwzz64aHK1ZYlwHAINMX4lT4rCHIOKfJ9PoueG7Jhbj2wRNBnIhrKUhzgk/4y
	 Kmu1rz1gJqoxJhE7KmpJhoiNZO6GIgFW0GI0vba8nD/57IyzQ3pNY41Z/bVQAvhoCn1UM
	 KQvPFrr/5XkvshwpH+JgEKCa3skHRrs7KmjQT5nAeUT9nDaFy3QssEsGq1YmefiGw/pJy
	 uNfgwQ8Fl+H5B5TAmnuNBd1oyP4h/Tbkuv7ga7eNijIIOb417vKjN3Id34N4FUP5KyHEa
	 VvaGNbkKbuY609II2twv464Dz5+t1cBSMPuxa69sIJkAXwWn5wosBBf8/Vk3yOfhCiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBQXjsU1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE6606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CE6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FBQXjsU1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso64588085e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795883356; x=1796488156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaqMAPDqo4CVsQghvM56aonjTa5VMPXE/zJHzseSvyQ=;
        b=FBQXjsU13uD1rDhMUS0iPSSYxxRzq8zLX0ADe8HRg1yx/8ptjK+GmL1CXNDEsDvorN
         Tr6v1j2OyUqR/3s2ye0GcuCv04i+IFEzK8YZZS430uNR9tox8w3AyMeLN6JjAfhK9/Ow
         N8hCr0FVyeuFZHqod3GuL+YKf5I2QofjwuUpc104uLpx5rtksnEj2LFhnwWO5QGmZAmB
         v4csXswvnlRNuY3jUk2UxTs2KnrbrZVDIYq/y5YKHtFW4/TL3m04s+LHOzVU0pdF8cS5
         PLDNrboKoeXvr2Rhqjyupa+QBve3wgGAQ2TdSlFABO9+sV3kVm6h6MRZT3EF7S4iCaYe
         rApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795883356; x=1796488156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaqMAPDqo4CVsQghvM56aonjTa5VMPXE/zJHzseSvyQ=;
        b=RIfgN7zg6MrbXWfOCGqBNs4NBOuc5vo/up4VoXXubukmaWfk1dFGgDBaTO52k3sDqY
         1gI/vsY1jbQaRi4nNwXElVslEWsegssUZLG+6Ja4CkUJlFGASDw8mwyf43gDF8y/JFHq
         /pBRD7/gjj3iFIQyAO4i9JXloDSMVDpoZGhX/OaM9AiDnXW/tM+RQ/W+2mnWriikUjnu
         sfpuHHslNZFY8Mr7MCp4CK93W3Dpsopc7YkimqUzMJtILn4JXykZi1YVmHc2X2yIZBkH
         QKkWTZ9DDam7IJwhSo2+g30xFtwPld1DAc3JYZsrCe+hILgIMXfwSz4JtzwXayM772C5
         8Xsg==
X-Forwarded-Encrypted: i=1; AL+hErHt1dMG5ciVTTQMEjFi3ZR9qqFa1M1Bgx3WusZbUSOd7+u8uQBYhBzswEzs49lR0BLl+P2J/Xjro5XWCUE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MChm7+uBSPkbgSetz2PfR8BnSiIvVOZ9bzz+TBIOtrGa7kkF2
	pHvSK5ObSb9azdHmVPfQgF8K9dVBskjQbUtFifV4mkkSr+P0NkF06Xl5
X-Gm-Gg: AZFdTZee4XkDY6p04bVxo6Vbqe/hHeCkfG1R2G2TFYcfif9ZaAqCxB3v5lQ4LI6plqe
	pE/qq1RgtZf3NYJD/804JONZtHNnF0OYv0NlMditwNPQk/j7rkfHWktYOjMSo9zmzhf4IUUM4CL
	4d8L/zDcGJPuQnOeY6gerxXKyjo9pH8DMsOZjhSWOhY4Aet4G3Ay6BMZt5p6bhcwBqT72sk8UBL
	e30GqV5s6tWjTHKPick/oC9YBBGK5KzQB5AdV6hY0m1OCxwJAPHlVKyAlfSq0Bj6Q5eFev6L9C5
	ZSIIaC9NNE+OGN53NPUI7LgcVvZpcOteXjJfu4rLqZlqbfZGfs/SfnAkN+03UCZ2WKZdVmC+EzI
	ZzGVOcGu2skv8RWiYsny33lIbQ4Mzgxdib4pcdGZoipCVof5s/9pJ6tiFvmc25J/3OKZ4OEsNSA
	KCy0xGjlGz3Igjxvy09HuLPnuLhZZb7pFuakqpUGNT9efOg07fzriJmmES1cMf059Fwlo7aNUoO
	jaWdPAp3QMkOZRSLuD3JZkrTlr9LupPBTQg2kLAjb8vVsImXwZkhBocWNGMSjxf8NdhyJaUm6+a
	1dZOLE1IozvHq3t5rhsqyaRATz1/TP3pNb3rG7OFiJoOAkVRpon9vfvqA7W+kIC9ijt/XRL+QFw
	x4jVTwqxS98QoVDcNSGIFNaNSqvT8gsJAdwN+1H0x+wUZ3dzveEiUjmJ04GFvndjX1eRA
X-Received: by 2002:a05:600c:4584:b0:4bb:6c71:b269 with SMTP id 5b1f17b1804b1-4bb8881fbd2mr569003715e9.28.1795883355573;
        Sat, 28 Nov 2026 08:29:15 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:7966:a38c:a84a:d91c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm307819185e9.3.2026.11.28.08.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:29:15 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Liu Ying <victor.liu@nxp.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/bridge: dw-mipi-dsi: let the glue compute the hcomponent lbcc
Date: Sat, 28 Nov 2026 17:29:13 +0100
Message-ID: <20261128162913.2534854-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <125b59ea3e5c6d48d325b3ea0c04dbba140bf1c2.camel@iscas.ac.cn>
References: <20261101143031.880389-1-romain.tisserand@gmail.com> <20261127095556.1794628-1-romain.tisserand@gmail.com> <125b59ea3e5c6d48d325b3ea0c04dbba140bf1c2.camel@iscas.ac.cn>
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

Hi Icenowy,

> I have to copy the ugly extra lane bandwidth logic from the rockchip
> glue to make my panel work.

Then the callback should help you too: with it, the TH1520 glue can
return its own lbcc from its lane rate instead of the core guessing it
from the pixel clock. If you try it on the Lichee Console 4A, a
Tested-by or a comment on whether the hook fits your glue would be very
welcome.

On the GPD XD panel burst mode is not an option: the ILI9881C on it
gives a black screen in burst mode, it has to run non-burst with sync
pulses, which is where the lbcc mismatch shows up.

> BTW is it worth to get a GPD XD for $50-?

For mainline hacking, I'd say yes: RK3288, 2 GB, 5" 1280x720 ILI9881C
DSI panel, RT5631 codec, ESP8089 Wi-Fi. Display, sound, pad, Wi-Fi,
touch, accelerometer, LEDs and suspend work on a mainline-based kernel
(6.18 + a few patches); headphones and HDMI are still open. Boot is
from SD with the vendor RK loader.

Thanks,
Romain
