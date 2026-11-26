Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655792;
	b=QKpLdsdQhLWSz15bldPEb+T4AUN5YxsB2IntrkQMU+OMQTkZI3x/XFJDIPH5sj1itubG
	 LgiT39Fp3QautRGCtT1ofqNqMeNCzbsLyiF0PjE4rjfnqhZFAubY5RwxMH27sgydKgcup
	 wgeFn1vi8Vls23ES/dPHkeC2HLYCyXbmpm/yJeuRQv9N10pd9+zTe9qV39o8OtfwqXJKL
	 xPCIjLOjAZRqnGnTH5JyVXVZyf6kg35iE9Z5jKRm9EHIqj5bRUjCc4TImfHqplolit5A/
	 IjGBkHuTS6YQSk8QSQuyd6NZ2W+kZ9ACbHf+fbfYYtCDcN21eZdkqRBlNvSMhBBNhFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
	b=m//ZP3CF6seNMYtkaK2dEZ7bghWSfhQZ/eeKNESnZPeKkOjZb2ioOnWpCzi2FabGsB4H
	 IIKZ6lK5+Vm/yzb4FbCznR7oawTASve9QRAscztADDbwM2cNTc6UoP51eQNrTuhsx5Kbs
	 M6vsgVMhJG+SAhq/1dr0jdJ7NaitKi1LhW7qNE1w6qVScD6UITbPf6WcX9SWRvkhIIh5Z
	 iCdfdFGMDFQ4hiEQmFyaINSO3/bnVFtVfnOElFXWSMNxubu9rqavrCX0tq4A1wU98UAqM
	 4tITGuobSwRzTiL1z1y/nZIucCvMIemkqfjVU/MzYgnRZ5gzLtv5xFMj2aJjqZAYrZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3hiWB4Z;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B172606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B172606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E3hiWB4Z
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b2d14968c9so62089597b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655791; x=1796260591; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=E3hiWB4Zj+L3kKg33G/3K6k/Vf2pySHmj8NCZYgRSDYT2gq9x2DlDktdLL3cq4jVyL
         4IoAI4BW66V/dudYr+Z7ncM3MMMdZmRahqSriEwy7JyprppwYPFa0ZMqPnmh/aAwsawT
         5ZPg1tzHAn4RKfxhygskCZMsE/5Ke5WcMM8fH5svn/nR4in9izf6cXxJQn9fP2bibktZ
         GLmjEKHBoW5Cw/qvmRNVhpnOh1nTfUVgeHI/LBlz2K0ch7e9mOhOcLhoT4VWu98W1vVA
         CL4wu/KF8CpapNCEMXuXHkmp1FIzQ9pFD8iMQgLEmGSxk4sNn9jv9cZv+GyDRmpxUqME
         A0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655791; x=1796260591;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QlSPO9+8YS67Tn4rbTFkn+Zhwur7gCmRYFgUkoNRUs4=;
        b=XzKIYb8QzoROH8ddOkKpkXpwuXNJJXKy9Sf6F4KhGRuFSTrABZVyF5brYfTSbzE4aR
         22AK7V+wCr8OB01QgH66Y6HgeUZ6qtoxgzRrR+oYy56xlEp5hWg/V6T1Tuh3Sxh/DKTb
         cp+ZO75Kh9GRBb5xLDvYoN4o8qD1hgSEjZdHPDcX3UStp/B19WmvnlaiosT5k++7GR8u
         UiXqtI8vf/rOGWmd0E6lvUvELkbnTHXjUSUQDd9nd9nFENw+JCEDYP9kOJRfjLol6Mxa
         7aIwnxKjBdqCZS847UgG4bDJ42HRusm3FHwl8A8CfBS7ol3q4IEFjOtLwtpzNhFQBRyX
         QfKw==
X-Forwarded-Encrypted: i=1; AL+hErEJYctUDbdo79LSqZ4RzvYASFFuzlpm9uvTR2CRRZ8ur3XLqpx785DPgqX2RTFW68j1KkrZ32VEalYQ7tY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jGMJquQWlAIS4tKS0WCFbtG63vec9aicqkCnsGglaodEP+Mzv
	1O63IdZDqc6UXeHId9OopRLCxCgfN9G/4abNcnGtcgLbQ241hgyWT1uF
X-Gm-Gg: AZFdTZddV623pUgNYTd5tInKXpTYSHjx88jv+sv5t3stYftzDt2iBVpZBix74JzMuTG
	GEOzG6p6LPIb+SyPDfQu0WCspUCnnsYQf9weu/0D4watNRcxw3b8l+ieGF5MfIWobzEpvtKKLI+
	/9gAO8uQXsOKfOSAMjP4f8SwkZlVGT8OnmJ6p2aSmxcxjN+5myza+KrmGPLtqaScZWyG8m0ygy2
	5T/JenctN1KGNQVOl1tCtdVB36n7KS1WkrG85AfreHpKOazaj2CtKKsPf5feikpXXquGcXm1Kag
	0ZBmHLOklsSO6zSVj/DHEUjcAX0DtcRmU5M9uZZeU/aQOezYIjdMxHZ1ne5O93bQF8ClGIm3bxx
	QTncDYUQejrdKm6eZOAd/Mbh9YngC29eOhvSl6WOWq54sQClmY9fThEfz5d+iRoRn47/r8oC90W
	ydzT8wYZ33aSGgW5F5QoGRSfu1FNZ1omM12yzPgeqZLVWLrejnxjlBO39zeOprdX5RCKXgAGDhK
	7V5Z7Z/4VjUrHPYH8MLJ/R5UgntuoQbfvPJxu176b3wrOFHyqr5I3wJUfLwL8VGfCPZ1349N8H3
	PRG1ccYQJyPjAH+XNN3DiXvn
X-Received: by 2002:a05:690c:6a06:b0:8b4:d0ea:ca9d with SMTP id 00721157ae682-8b52045f6c5mr70876907b3.25.1795655791098;
        Wed, 25 Nov 2026 17:16:31 -0800 (PST)
Received: from localhost ([120.244.9.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b575ff89c0sm12140497b3.0.2026.11.25.17.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:16:30 -0800 (PST)
Date: Wed, 25 Nov 2026 20:16:25 -0500
Message-ID: <9ec2f818084f2e723e8b82218a302258.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Cody Kang <codykang.hk@gmail.com>
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
In-Reply-To: <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-12-ec419e8e96b8@gmail.com>
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

Hi Cody,

On Sat, 21 Nov 2026 15:40:51 +0800, Cody Kang via B4 Relay wrote:
[...]
> diff --git a/drivers/gpu/drm/spacemit/Kconfig b/drivers/gpu/drm/spacemit/Kconfig
> index 8326a7b98151a..4667cb624401a 100644
> --- a/drivers/gpu/drm/spacemit/Kconfig
> +++ b/drivers/gpu/drm/spacemit/Kconfig
> @@ -16,3 +16,22 @@ config DRM_SPACEMIT
[...]
> +config SPACEMIT_INNO_DP
> +	tristate "SpacemiT Innosilicon DP/eDP controller support"
[...]
> diff --git a/drivers/gpu/drm/spacemit/Makefile b/drivers/gpu/drm/spacemit/Makefile
> index b3b148000cf7b..260d316a271b5 100644
> --- a/drivers/gpu/drm/spacemit/Makefile
> +++ b/drivers/gpu/drm/spacemit/Makefile
> @@ -9,4 +9,7 @@ spacemit-drm-y := spacemit_drm.o \
>  		  dpu/dpu_saturn_hee.o \
>  		  dpu/saturn_fbcmem.o
>
> +spacemit-inno-dp-y := spacemit_inno_dp.o
> +
>  obj-$(CONFIG_DRM_SPACEMIT) += spacemit-drm.o
> +obj-$(CONFIG_SPACEMIT_INNO_DP) += spacemit-inno-dp.o

I noticed a corner case when testing module unload on v3.
spacemit_inno_dp can be removed while a process still has cardN open
(say Xorg or kmscube is running and somebody does rmmod
spacemit_inno_dp), and the DRM device then still holds references on
the bridge. When that process closes cardN later, the kernel oopses. On
a CoM260-IFX:

	sleep 20 < /dev/dri/card0 &
	rmmod spacemit_inno_dp

  Unable to handle kernel paging request at virtual address ffffffff01ac5188
  Modules linked in: spacemit_drm [...] [last unloaded: spacemit_inno_dp]
  epc : drm_bridge_put.part.0+0x72/0xb6 [drm]
  [...]
  [<ffffffff01b0b142>] drm_bridge_put.part.0+0x72/0xb6 [drm]
  [<ffffffff01b0b19e>] drm_bridge_put+0x18/0x22 [drm]
  [<ffffffff01c41318>] drm_bridge_connector_put_bridges+0x34/0x7a [drm_display_helper]
  [<ffffffff01b23400>] drm_managed_release+0x86/0x116 [drm]
  [<ffffffff01b13cce>] drm_minor_release+0x68/0x80 [drm]
  [<ffffffff01b1ce2a>] drm_release+0xd2/0x102 [drm]
  [<ffffffff802b325c>] __fput+0xa8/0x248

An open cardN pins spacemit-drm only. The last drm_bridge_put() comes
at the final close and reads bridge->funcs, which was in the module
of spacemit_inno_dp that is already gone.

Other DRM drivers with the same structure, rockchipdrm for example,
put the bridge driver and the DRM driver into one module. I think doing
the same here (add spacemit_inno_dp.o to spacemit-drm) is the better
solution.

Luca (added to Cc), is module unload something your bridge hotplug
series [1] is meant to cover?

[1] https://lore.kernel.org/r/20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com

Guodong
