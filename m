Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795261572;
	b=CI0WlEpn18FMicHboo1mo37VmYrqWy5DuTp7q1Py0N68SnXrilwJYwIjXnddsmOEWfM2
	 0loW/9BZCqc6FYpT9ZHdHqeTUQwvQ7KCRLScEkOBH5Ce6JQtasuOt0mLIk1d3w8l5ef05
	 vMlDs1QSTqzhOMmzjpAaPwtZ9/+ytffjKqp1FpTkoKT6OnMOSEUbB3bcuz1rWla780l/O
	 U1vFF3W8USmLUn4U2allRNX1qxfWZN7hWVZYVPGoOe6JDqD6gRu8NrOnkyKEhmXLrnI9B
	 Zq/6s6CM63fhRHuyj0oQA7O/rYl5qP8ZsDFyw4BN3GxjiNKopaSd5kJD7IGVBE11p5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795261572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
	b=zVOF5vMxYIN0zZuWit79HxDYmPs1lNW+ji0Nr5lT9ThV0Nspv6j7U+uy+7t2mo6AzqZC
	 C0g2ISykBjv0sHrolY1YwhMwuMMVl7xEAB5Kpbta1+IBi1rtjpcoMFKRPHJNcUnolkxEl
	 gLswpsjZvawK3RkmiMvaTnOmAmiHDBiOHOhZuTlSjJFieJ22CbaYDhu+M6zoby72HJ1Mb
	 +KPwl5PaIZE9bFc4W/Zhxk8MgU39GjM0L34X9x/OIDqlJrDLQx95Xn67AIsly9Z1HylYT
	 A1MDrwnpmGHYi/SWMwBBySCvAvUDq+O75/0hKrupcWgHNWd2RdZ/F1uEKuprj91FFMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=pardini.net;
	spf=pass smtp.mailfrom=pardini.net;
	dkim=pass header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=NmGSSMgi;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04857606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04857606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.a=rsa-sha256 header.s=google header.b=NmGSSMgi
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8977f2785so2435427a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 03:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1795261570; x=1795866370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
        b=NmGSSMgirxB1kw5J9zgoq5QISvw6Yh8iCK75uOY3jeW+ZW/aKB9e+tUf7wxRok7G46
         vJ/9mtgJHMMJ5DAtmtE+Pk8fSME84BwT1R7vRROAN+5X06IYWugXETfDYQo1Q/tWPkHq
         UBY1wCGPQRMK6E3PVBqfjA7W7T2059iNNepjX6jy8DHzrCYo6jX3zaZoijslKUTqaDOU
         hXIqSwG2tF5Nz35paPvbZ8xQXbucMkfjryF14JAVewKjqdRhfmIeGRQXl4TAMxouxaOJ
         X8nOKKe4Om/JYvbSm9+4sP4E8Np3AZM4f1cMfynxtszkLgDWNLXMIodtWGOGa36NpCYz
         x5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795261570; x=1795866370;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bq54PBPl4YCnVxEmHl/CCwjoHYf0FGqHDDIF9WweFI=;
        b=damXVvFXDtazI+/f/DJntkyIprfkOUKPiN1tpp78Ug39h2XleOmMsrSOd4hPmjh4V3
         9ETcMJ9Br0BTy9j5Ek34GXbgmu3GqOr3V83PwU6M7b9sE2XO+88gBM60fKszt9iE4NeB
         SH6fa1pwfkTUUDKQjW+SJJVrGMacrGpusglJ+govRyVH+PgSNNbzCXDqhqxFjTxw4YS2
         d403B9I1G2OoNIRorMTCNU3CsFDZlaiU5TzcJUk9yrG9pz0Q1U9no6qlO/7iyRtKKliX
         rcWVQZisKvzcKuk0dFBzsW5RLUl6n/Rg5OUD8icgrJXmvoLIRB/FIyDOE8qzRFi//gRf
         KLmg==
X-Forwarded-Encrypted: i=1; AL+hErF6gl5bZiprlQArUHY45AGWRU4gQ92muLvupMMc0ZHuCHBFMR1iUXRMgeyjVZEphBKE4f331550tL+Hqgw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PFdaVYj75RUOT2mvKZwrf79eeoL2bpI7lG5iP3nQ+jA3UeRoC
	jqW5ca3D3pnbFZwGYU5i024g8vNhI4tGa0ocUHoYFa8hljjoy6/bM7DuT8OzDv7gGw==
X-Gm-Gg: AZFdTZfBIYOCpoWfw/zk+HhptYV2d+F5mIKVZYU4Ym6baoQeSe5IymZ/4lm+hBkSJd/
	peG2QaM48NlLRASWbS7CCf8GIr+oz0mTCuIdz8J8LLg+7PS0B90t6pmSRp6zcuwwSM6rCCzLwjo
	JIEz8HKe/AV2biVOeIjCq/OP+6JIPqI0XNeZMO+5Eib5coo74btQt/aKfNjesq2m2fd0VQepj0e
	EXpwsbfjz/If1EoJKypfe9QxylS385gKkrx30NnjpJ8zShYxnj1Liel1GVDH3AWCTIL/mdWCfTa
	vkNUj2320LvQdx9k/+4d4A4H/EWR69lU+91LcdRZDzm6/8yioLQ0pEQ6SSqasdX0EYfDeEg0235
	6yFPJbW3tVpiaKuRn98BoeRTM1S8hDNgSummDfhydnZgiOFmsI968kMWaDhe9ZbnE6UmK5N5KNH
	N5olhYA9cbeR8uVcSXCmaNezkff0edpR9TQcnBZgph57k3u9Ki5BCZpNi1x6ykwU+Tj0GYb44hP
	Ic0qBmSeVn/eq9VeGK2zQEHuM/+eaUDEfxhHLX4iSVP5TAWt8MsEXuH8PgGgMeJqzTq/anjao6M
	7ULrwnkxjhVPRMaJzvSTLk2tgAM1MQz/V1X4EjYawaICwHnhYbYEam2x7S3pg0M6zDAFuoJ/P42
	gK+97+jwI8jvUwIjkYlKg2T/HZRa+iQ9ITO65sshEe8YbJgVJ2Q5J6Q0KgyWypZrp/9OuoHSfIg
	li
X-Received: by 2002:a05:6402:134a:b0:6b9:c43e:19fb with SMTP id 4fb4d7f45d1cf-6ba37d632e0mr3291804a12.25.1795261570200;
        Sat, 21 Nov 2026 03:46:10 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:409e:13f1:8f3d:aa19? (2a02-a466-4d7a-0-409e-13f1-8f3d-aa19.fixed6.kpn.net. [2a02:a466:4d7a:0:409e:13f1:8f3d:aa19])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba854bed08sm173298a12.30.2026.11.21.03.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 03:46:08 -0800 (PST)
Message-ID: <9e4c3ed3-812c-4ad4-aab8-b1a783cec95e@pardini.net>
Date: Sat, 21 Nov 2026 12:46:07 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 00/23] Synopsys DisplayPort Controller improvements
 for Rockchip platforms
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org, Sashiko <sashiko-bot@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Yury Smirnov <yurymonzon@gmail.com>
References: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20261114-synopsys-dw-dp-improvements-v12-0-d42d3dc5bdd4@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 06:00, Sebastian Reichel wrote:
> This patch series updates the Synopsys Designware DisplayPort bridge
> together with the only existing user: The Rockchip RK3576/RK3588:
[...]

Thanks for the series! Tested on a Mekotronics R58X-Pro (RK3588) on
v7.4-rc3 (it needs 941e3acfb358 from linux-next to apply there):

- dp1, full-size DP: Dell U3415W at 3440x1440.
- dp0, DP alt mode through usbdp_phy0 + FUSB302 with an Apple USB-C
   Digital AV Multiport adapter (A2119, pin assignment D, HBR3 x2):
   1080p60 on a small HDMI monitor and 3440x1440@50 on the Dell's HDMI
   input. Works in both orientations, and out-of-band HPD retrains the
   link after a flip. With the adapter plugged in at boot, this also
   needs your "drm/connector: Cache out-of-band hotplug events".
- Audio on both outputs to the Dell's speakers, over S/PDIF
   (spdif_tx2/tx5, simple-audio-card, mclk-fs 512, DAI 1). It also
   needs a clk core workaround I am not sure about: AUPLL's assigned rate
   rounds to the current rate, so the S/PDIF frac notifiers get
   PRE_RATE_CHANGE without POST_RATE_CHANGE and leave the muxes on the
   gated fractional divider; no DMA requests, EIO.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # Mekotronics R58X-Pro 
(RK3588)

mvg,
Ricardo

