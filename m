Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014388;
	b=tViUQfHEwzZ8zeBtn6WAEfbW641kR4xeo33Em12HOO9cgCPEt+a7rL29pDWOrRQSPYft
	 BfJVKcgvlECipFQzBZsY0duHjFlR5AERoYZW8iTkUnpoMUsIwED1cmedxzemq5xLdK7i6
	 +qggGUmOJMiLqZ86muOchIESN/Zhc8RJqEJ5S67f9sU2gvZMGfPf3hzDi5r3rE/Qo+urI
	 dH0Yj+sc1uBaGqAzl2EDcozcMGjVGdE7Di5YNEdICi2c5t33UDn1U7XbgoSw7Hw1Z+D//
	 N2x0PZd74Tjl5cgSN5gkignuaTSKxFs7wizKd5pZx37u+Pef0N9l/OSA+lTZ+l/KAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jHlByj6w46Y/+nbmYcY6Ogje+9NQ+ts8+a0iA/PRnf4=;
	b=nYB5VR/ne95LSfMjKQfsGQCCFktAY0SoyWIIgPEFpvsXip8jruR4hAEJESRIapauKvJC
	 l3DXDR/6YlDwIoz1IKU2jL8COpslhx4mqinsYsLobYwcaxepqWoMk/t3KrsARcnH5t3mt
	 +fLj1CSNPTkMyFPJ3olGfF/jXv5RavdH+MCUbfYqG2m4qjyHDUpCLTDuGuJ4OGyw4Mq8K
	 QrkdcwaBMNnYhVKBo02hWD3womAxRTey7XKNBy8U+g3CpSUqZEbXtlcJPI2Vim/1PJSgD
	 aBKtw3MaxCKyLZdTMUj8h93+GBYw69n42CmTi9pJkHN2I23e8so0K0cfJpSmlysx2XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G17s9g3o;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DBE606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DBE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G17s9g3o
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb61185057so9028285e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 07:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795014386; x=1795619186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHlByj6w46Y/+nbmYcY6Ogje+9NQ+ts8+a0iA/PRnf4=;
        b=G17s9g3odbf5bQI3h5H9X28iA9fq42iID3TiErP8boaS6E7KrTfK8bIE9GEMeFH1tU
         Cr/a2yODBDcSdv19DgrmvgPryKjUOv2bPtETEM/1RZAZZFf4wWoON8t0cRhxAOBD5EK3
         ZJV8oyC10YIfGj1TMwJeMbTrTbljDiJ2nv2aP5+7Cm0RFn4X5XaJo4eUJXEMJvgCb5dC
         n2evhIoweFixBDiszXRqIAp5lXEXqn5Mo0yTtuC1SNbhoggyU5Kz2KxPxbXroJnkM+e+
         JROtYJuosKf9dE2SwY9KypmkqAdLZwWWlFhCFcnPQ2vEsXRqVDh4fsKsII5+V8gfBlmM
         o97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014386; x=1795619186;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHlByj6w46Y/+nbmYcY6Ogje+9NQ+ts8+a0iA/PRnf4=;
        b=c9c8HQTsXf3mGGPwHdeNdHpRn4/F8v2SZtxK/ZzMkw2bi9ej2fyOH8ff8RxahZZqTN
         Qx0qL8C77Iee/bU/bw19ZQL358DPfrlXe8eyAiJ/BgwG/wHCeQtVPCBnh1oTW6nLvAYT
         UYcio3CFDSHk03WVhkZ1NjGNySZnn5nOdGGnGiBzHGl2hyvkpiMkm/qvN1UHo5+csb8W
         p5btE9/g83ljJhVOJqM6Yn/RFQwRyPieXM99/GFxAzF1sx2Tleky0NANxYhAyNpMm1AU
         Hu1wL8Gat1hBRYpRmCScfdM9PyLHAjOxw2rIW8aRTFEWU2KP0swCj+t+gu+UMuXmPFnt
         jmmg==
X-Forwarded-Encrypted: i=1; AL+hErFUA3SV++s6pIHH2Dh3yQ0OT9bs0FcWU/KT5LTLITiZ0JDNP8bDoCpjQcTksNpmwxs2MlQnzXg49ZAo2iA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dSFuS2/VIigd+CxFtyNFo0C/fb5uaWiTYaU/KeTm/v01muIXc
	TvRl2zi7qUnL5YV9/BqvJC7qOdx0231/SCoKvgLNTGI7Th6ZYOvDgTVd
X-Gm-Gg: AYBFou2lnTFPg8N+E8XI7H6ZpvPZwER6eCZ/8etgIeAn2dVm3ocIvobaqCcjOSFlE6j
	yU3kFGGbwoqhMx5THyg3rbXua1nstN/H2chuGkse72vwxpA2gE6T3Knj6ljdOYNTB9K4ysPgGn4
	6ErQhswmj5Tv9gZA5Z5DuRryW3a5rE2oa22EceOfiuNszOnnP571LexXN8Z21c2cngRWBCEvAj/
	P4WllG0X8jZUpxViFXP9gqL291bRAOVTqdOAEEdmhW+6pOUaGfr3pMXMBvRLFCSkWrd+k6plAd+
	IazUHuWH80TAyn3w5G5L7nZcclG2ciPNMRhs9yFZwGUk22e8j0Kqi+rox3d5RrsXwqnYnZpLWW1
	z2+iwTtlQs+zZ4GJqp3cfo9IAhtOKymbUV3R5H0mPfE40ZolydsNFZJ1uBG5AJ5c5LrSXOdDUCm
	wHJxHIy2RgNKog96v7M1HJ1T5wtnJkqDMRxP9bY3Ovm6BUTUkUQaqZNKpTNqYBss2meU0J7LXcF
	DYzr+kl043BZCjAUoBtoci/xKhErccsDPxEEtKj8Or3IRig/Xh9PPhyxGRw5Lxya8I6lcii7dSI
	qr7BKfIIso1+ezi2SSiexDeJjAQ9azq+WQ==
X-Received: by 2002:a05:600c:4685:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb7da5a6e3mr53477425e9.33.1795014385984;
        Wed, 18 Nov 2026 07:06:25 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm164487025e9.1.2026.11.18.07.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:06:25 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/vkms: make argb_u16_to_RGB565 round resulting values
Date: Wed, 18 Nov 2026 16:06:15 +0100
Message-ID: <20261118150615.722935-1-oaroraetimis@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20260928005301.367977-2-matheus.aalmeida@inf.ufrgs.br>
References: <20260928005301.367977-1-matheus.aalmeida@inf.ufrgs.br> <20260928005301.367977-2-matheus.aalmeida@inf.ufrgs.br>
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
Content-Transfer-Encoding: 8bit

Just a thought: DIV_ROUND_CLOSEST() would be simpler and cheaper than the
fixed-point path, and bit-identical.

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>

Thank you,
Oarora Etimis
