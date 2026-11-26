Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795729482;
	b=OqIvvZj9GvmST7kgeSSmjln2AVlMJj/R/LdS/Reswniy1euABn2DigFXXAgpx9o/uY6b
	 9tbdI4vgs1oxeZlqgLApdYWe7nknmZQfcn2sA02kvpXfTYsisff7gJ4D3bpmqcvYkwdPM
	 84PcPVIhsFdbI1P5ahddYEKl6vOr+g7QT84jBeryFGaac3srb2CKVU6hyKvcwytsY0Ntj
	 2e/qOP1+wApepob6gx67jBQHct3skTL+7U4RsYxf99XFv2g/NPEtwM5GEJPKPOACaHhPV
	 +jyaGR7rXbT/LL8QiQmS8zJimhdm6ialeNacbjAQA+f1QBjdHYkXzdUo0Kgcz9UkfiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795729482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
	b=JLjXlFVVIQ2ge3/ddr/WNDEwkqKHfEWnab6zIOGqzMTqol9LzCB0iBotj7mKJaL/Mwgo
	 7RLx1aG5YZKL83/GymaIwUwLQyin5Fss3D4AZBKclFUvRlsipLmJAO4I8OxOllgUZTWVg
	 A01fP02mzfsf/J7abBvRw8HHT1kptc2eYcK35RFLfThr8JrYR/f7IYKS1yH16LD6pXuPP
	 ZffOzKBv5fAQvoaxaAu1akwe2R5ujVzqOwp1RSI2cvfTQArWxZ4slEfB6DsRGk6UKFa72
	 CAD+pSUJOofEIGhtZF4CWL7g0QN4rMAaCDXZtEGBeWnBZ+Uu7dVp//+XQCzNoQWBs6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="P1QbyE+/";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FC7606A6BF
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FC7606A6BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P1QbyE+/
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1527372eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795729481; x=1796334281; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=P1QbyE+/ZmZHXBAetcgcFJcSma35+komyh3M/D3cAlQBYTKdH2dBqUKPv7ssH5/Dit
         hqAr5iGuk/2kXi7qcPizrV+eztl6Lv9vK+BEn8XX9am+s1wCz31+8CvEica98HDq6F3E
         wT7g9EyOHWWgaLowjY8x8ERdBgr36dRTEBScqxJEdZLm9wthRgCVREvjGghKXdKU7Fp/
         0wdmI6kd6L9tgwxG9v6g9XeRWQu302gZv4TWPzZ8WChgPFaD6KsTmq3HjcNdf6l5Y9dd
         4Fqvo2jBhSp2YalxqxJcIEStoPHLN/BI35026hDGBmriCJQY7PnpcUNd1qsRiJZ9kzwa
         O5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795729481; x=1796334281;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UYJTRpYCZNTbQQiix5R88SQ1NUZI9ZYUAhpcRTfR3qA=;
        b=XEBLhkfgfo59/YNRNAhG1eANxJo/NL1eGorRgGNENpnCc39qZz6La7gAwFov5hkWUA
         F6ADmzp9hblufVKihbJ3RpIXannIG5xC1KTxwMC3fmI97+CpIDYxOnPNCMhSvn81e8K8
         9cjixZEsj76bWxaS+ebWddfEsM3fFlHou8SLhV3dWTZ2gWxehHe5hoc2IkJOcs65kGld
         ku6KEaId2GqYTw6x0E1DRx1hKOLLVWeZvW9+nj97vcCtV/WKAb+iOkwZTTcPALXc7g/b
         /ErbWosyGXjjaCyLZ0YuNqBEYiyua5HJwqIuUUl6X6IdvT5WoSZN8qGuXFHe6rKjegQ1
         Sq4Q==
X-Forwarded-Encrypted: i=1; AL+hErF/Ja+wY0cfK+CelrgR8f0FRrMJuWbPEI4BAfIh6hL1WzqQFzbOzHN+C2kuqZwhDiyDrLY6COHREqRHZNM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cOhqzWcLDHwXrtvVUTk4pwniLfT+b18+vg4ov9TWiywrJlkGp
	FGNt9hUxmm7efB9dMoP4AaAACyNfh1qWGhWaDpuvk07LpgL2bMH3mtpG
X-Gm-Gg: AZFdTZcxOVfnx0Y8+uToN/4iQ9pV2YONKV8GQDI6H0s+MAxrsAoo+M8WeU1CsIZx7Nl
	pUUeL3UVZRy3kVc8sp9qdQypim5QketPVGFOrcivfI2hrscNlz88Wltt2gnFHGvdz4w3/GnUBvv
	xiRTUcZgLIenCXOg7nMT3gM3JxOpjKjg658HAu6FO94w7gU6IkB9qVyl7xLSH5oe7+ykMw+vgVh
	kBjSN4v2hQWzIEBX2oB1Ns2MpVqnt+gMlNZMW6j2WnpgGLmSdl0rM7Dd061VLY4nAv2unnCtPj0
	L+cCJ+KgtE0vsHvJOibWr4N2jZbzEE9cn/h7hlfeUFuYSmkORDx+hei7TFq4KJ9XHG+nM6itvaP
	SH3+N+4XNmJVJ6otmUBneO6/nJGNCkW6yY5VeLXCQogw9OZgrb3eVVg7mM01y+JOue+ELXS8RVC
	EEjwNzBRNmDmsw5VoYnePF96bu+i0qPcNqC0X9Q3nBBYPFLvb7NJ3ioSQS5JUnemSXoISMOsq1Q
	P9Zf1ilr8RM9fkfUNH+ImNw5gecaMsYwsE5ySWI6yMlQzWSqetYeDcxXHSAzn9qV/BpqASBgSWE
	z1qm0vJC6yNXcy6/YT1dMjEzA3ILZneOFTnYfEI37G56vqzNMbQeWgXy4Ebcij8=
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr21960944eec.20.1795729481384;
        Thu, 26 Nov 2026 13:44:41 -0800 (PST)
Received: from localhost ([2604:a840:3:1e0::1080])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm79578155eec.4.2026.11.26.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 13:44:40 -0800 (PST)
Date: Fri, 27 Nov 2026 05:44:37 +0800
Message-ID: <73f6ebde526f60ff64064ef602e0cae9.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Icenowy Zheng <uwu@icenowy.me>, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Cody Kang <codykang@vsit.ai>,
 dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-clk@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 12/17] drm/spacemit: add Innosilicon DP/eDP controller
 bridge driver
In-Reply-To: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
 <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 25 Nov 2026 20:16:25 -0500, Guodong Xu wrote:
[...]
> I noticed a corner case when testing module unload on v3.
> spacemit_inno_dp can be removed while a process still has cardN open
> (say Xorg or kmscube is running and somebody does rmmod
> spacemit_inno_dp), and the DRM device then still holds references on
> the bridge. When that process closes cardN later, the kernel oopses. On
> a CoM260-IFX:
>
> 	sleep 20 < /dev/dri/card0 &
> 	rmmod spacemit_inno_dp

Thanks for reporting this. I can reproduce it.

[...]
> Other DRM drivers with the same structure, rockchipdrm for example,
> put the bridge driver and the DRM driver into one module. I think doing
> the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
> solution.

Agreed. Will fix in v4.

Cody
