Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433167;
	b=eNDg0UhAv7vr60M4Qd07NUIn/HvVTx7blA++J+XnvL1hsZHDzmLf/PbPoyU3eJWl5ARH
	 QEJivoILkdB1xF8Cpzpe2EfVBsrvTRZOJ9xhjYdV3oTIjRuVqiECqZx4MtnTCdwQf5vEX
	 YGllfaKg9T3N291/SiSGO6ILXa9DL2BFE7mC3uxq1jkXSJNfh+uSIv0pm1lD10URlgopF
	 UjrnkwIkUo2LPvntq0Hdhp/4YsFXKo39Zmz61UFVoX1aR6sf+r4sD/YxX3cLvaOIQ/Kyl
	 mbtDPJ1mVySpdohDl+1FEt38s+7rAzysfvpXmtb9t3jWDO3FqfjVHdqIs8hGkiQyQjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
	b=N/PtmOVvm2Aabno85mQJtIBRCDKuzqbArqL0kTEviST4NVJP8UpgmhUfn3I4gcQfhxbb
	 akyVR6UHOwRa0612eniveHGzKC16iqr4rviAizScD7zMWB4YADkvSAnXah/TUD/RQXHEt
	 Z6Wto2qjyHCVc7wnNLId8S0XwgyAnrFMZfZFceRnDRfeaq6Zi/aouS9EJk7PghzMORLWQ
	 n8052dp1BpSYBEiwuyw/btaevrXyIBB22arCUfeHLcMWGqig+4YolIg+wW6Jf9/DnWunQ
	 qo5DCiTRC8X01A65i3/JhRoRs0DckAEMoYYerIERt4O7jJf7ajsCtj+oJf3J1l+/AIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmuyGlSV;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB39C606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB39C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmuyGlSV
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ae93a86008so1736499a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795433166; x=1796037966; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=DmuyGlSVyG0u5kdHOp1ild90T4N/HC7n+JkFjIWZ7Qz0SJ/qFf78h+3H1j8N1TLC8/
         dFYgp2JnaSmUDKnkMd4SWTZ7Sr/32VbO71cd5+kUIBjBCy2YfgrbHSjV4Mi774QTss4L
         58rqlv5QMJZSVsd3hLGM1ziY8Udp8cnfbjZGpQRuZYH3E5ojg/owA6GyvNumphsyF8pw
         F94jWV42N+KzboOAVlP0DCuL38oHmXRmrrCwE7OY2+nFiA72NaD7E1UQnts9UqCt1WLD
         zhB31LMAV2ev4ZD5wC+U/dscosPhA+hfIuN3zZZGQWXcML0UnxKaGSjP8sIH7mdWslFM
         KlHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433166; x=1796037966;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Io7ujKNNt7SQhbgiNtNsmPHGRtWoUuLSgdS1AFaBjnc=;
        b=sLUngKJeAuvAt+OzNfkJKQFRmO/pPcoQ+hUXxQqWf8C6ecnoabf4jbOxD2pzkbjGn5
         NKMMvW/3QPp8tW8RCIrmVRO0yJZoDtuA29KSoGsptsP1sbdQ32l+EBiIlE/gGgsI6HBs
         4iPBK1YopRYLBufPtRh9XebkYZaFAUkfhAyt0EMj1v2EB30CMNkgAm+F1YnZysaHg9Su
         DUvSn0otx0oiCnSfFAxYWqReU6/FxZLSdJKxwOsPsb5hZFV+4PT5ADrTbPKChWopimMH
         Qg9xeKN7DL/p84cUael13Bd130QF+1/RSzkphX5RDzSLICDI9MQ9MGqKinecUnQIyiZl
         OMHw==
X-Forwarded-Encrypted: i=1; AL+hErH6XXK9nyEFSTbH5l/w40acqPOq+WVPrkIYpKmmpPIaYFzHaf/+UvO2u17g+7ochj0+v8qYhaKvUv7ZFvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wwhMQJabwELoBEEWJSEb9f+VcBfG21kFJ76KHNKisUiCkanQa
	01Xy8qgDA3SFO7sSWxweuybg/0odD8ubx1nJ7i97offQ4ki/RalokVxu
X-Gm-Gg: AZFdTZd6PCQz5/3noRh0gCgxuZu4lrkxfepO5QHo+nFFtaOJ/BP+3OYghb9Gq3AMQ0O
	z/H25IRf7lqznTwI0yYNGx7PHFjNmvEx1ns8BaHhqD/7nPMzghfduuayBgjK58MTthcidnyfPVf
	Psf7TmguTSy1XhL4l6bPbUGJg/BukeJpIY8kbavsqGkQlHQl9WQbche6GgBIe9rpScQzCFjAdAz
	rAdDRf1F/eaTW2jg/tTMJ/a5t67k1ixd2nBJhW63vov2G7DYA3+Uxv1ZIt0h/6cCwPrq1R5uC2E
	vXRB8IhIaAsgc+IbX5b45CrXPoQ+b577lRKC+a4AxcI1NlwTpO3vHVp1NYeE0fy/GaSsJ8GbsyV
	GkL08czbsHyn6nWoKzCfxSFKM+mlCyTDjmoiqXmET3t/a420rPfbNBY5I1fWESRx6g57AMEPrOp
	SzGRORcWKHhJLkg76+n2velK0u6XAkOuCMp5zNr/0GZBVjKhxfeM44JLNm5JYIVqW1L6FcQs93m
	ZrlRmvw49OtFZ+sbtewzYrmpTG98PlePrZnalx4qPU5EGDJc8vgDavw3FGb2MjcZCQaayt2APFr
	Zx7ePe3lwJJmaZ90Toz+Mpl2DgKRooeKCCY=
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr10517519a91.52.1795433165943;
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Received: from localhost ([2403:2c80:6::10a9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17449770a91.11.2026.11.23.03.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:26:05 -0800 (PST)
Date: Mon, 23 Nov 2026 19:26:02 +0800
Message-ID: <f5c6f44bfb6040289653cdc079b1cb2a.codykang.hk@gmail.com>
From: Cody Kang <codykang.hk@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yao Zi <me@ziyao.cc>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Sarah Emery <sarah.emery@canonical.com>, Ze Huang <ze.huang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 10/17] drm/spacemit: add Saturn DPU KMS pipeline
In-Reply-To: <awPxPHpr4NYxqdmf@houat>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
 <20261121-k3-display-v3-10-ec419e8e96b8@gmail.com> <awPxPHpr4NYxqdmf@houat>
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

Hi Maxime,

On Mon, 23 Nov 2026 08:55:40 +0100, Maxime Ripard wrote:
> On Sat, Nov 21, 2026 at 03:40:49PM +0800, Cody Kang via B4 Relay wrote:
> > +static int spacemit_drm_master_bind(struct device *dev)
[...]
> > +	drm_mode_config_reset(drm);
>
> You need to use drm_mode_config_create_initial_state().

Thanks for the review. Will fix in v4.

Cody
