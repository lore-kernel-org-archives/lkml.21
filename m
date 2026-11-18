Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004887;
	b=yUeSV/HweC8xnSLF7I16NVRYmg+r8yuMfCcg0eowuL/f1J1Kr3jry6fJVgcKe6aFadmB
	 AjRscsz0kVV39mSDf+pvRO08tNx0xNe+N4n60BYEOSb2Kj+aNFkKdjSFuWxFMq2wuoL9a
	 KDGktEOlTeLKsQCpJrmTK+N82ZuzS+E3C1SKPmRR7UV4zEYub8hxKf8EDW+uc1NSZfJnh
	 qOHJCQFjg/v+U4Z9WdCbre/13tLQq9aLLq8P5LolFA35ZiduQ8LCCZs/u+dB3YC2Mk5tu
	 JblDHHDwu2uoskWA0jfoJ9ooGvW8ORFcBkc+zjyimKBohXvfr4bQK9HTLH5LmFal2iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
	b=s9RuXP+nA9hRkYSx5UxJ5NmL7XhLOTI7Hfn2gFI5f0tMrZORnSWAoMK9wCtoSSICtUaz
	 xadLn1l/1G3Z3pH5Z3VmZQ4puTAXH//qaZ1I/22JwS9+jLnBYBoisspFRgyDs6mVx+jox
	 3U+sEelY6xAhWY6OQT1fVxDnRK0zBZ1L4Mgh8/1l1JrIc+bhF00cz6a8372hKjQ54/lCD
	 lQh986uOTZ473enh1t055tLavSadWnHNN6CG3PL+Eb6aCSzC+k42BC9RveCbrtYVKe6gs
	 PIgIGs7BZWPtkv+Lo4ORAaCzV47ODR8OJv8uW1ensPaXgwdO0k5zyudZXIGLOdmldVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dnVm0iMu;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C75606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11C75606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dnVm0iMu
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so757129f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795004885; x=1795609685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
        b=dnVm0iMusTVZbWBGatNwsGk6hXJItGdBDtoycC83d5TcCKDiXmqk53H28++FqZOpWg
         sEy77ThBd3zr+JYDthizOa/Ef4up+kU/sEk9gWZ0EKQNXNTkUHZ0Qt0R5/h1CZpo0O4D
         HRrdZdEnfQpVJqSCOuOfiEkxtgkykjYwnK+5F7wpyGnuDEhUc7ecgdj3uz5Lieo3i/3w
         ey9N3gNim8Xh+TivB83e5BAQHPQHVOb+j2YM4ybFqLOYbWPsHZS+5GV+KGVdSnrfBhw9
         ULHSWXepTCZshnNubZQmqHROdOtpzVJ62YljmAaUndhAU3CjrdIq8LXgBdLVPvb+JloT
         Ao8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004885; x=1795609685;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ByWoUJOn8xt5bIjc/DgDVb/Znhr0IJHP27C3VPG/e4=;
        b=KHGp3dgkf0y2E0GtF341cjKWE0g3tsXVcOv0vSQraQRdSmF657GFznN+9aC7Dtbjx5
         jFD8g9CgfzPubB6GDClaz9r8dZHh5huEfQhCrEvpwxEWou5hb7cfHk3bd6sJVTAC8fcY
         Ck27SJd4pPz255Q7bwAcI2v5bsq2UirCMEOxkj26Gq8viJ7crIq79PlYzTGV2eQysCCi
         1BXKlIwa9BKGJVesdCkghY3zXkuVlbJrbVvYHKHkrOGPHw3fIc4GHdV0tVZSiOcsby9F
         2NtPEFXp0gSkqxRkjDB68SLdaIjDaqSooHZRkBIpvFmiGZ5WpzXr2/URu0U/XuP3F2xZ
         wQRA==
X-Forwarded-Encrypted: i=1; AL+hErF+B2YW42VXui794WHZo6V+xe1isuOEm32PvkaDnXEpzNn6ZuLZ177LykxdK3cUcjrpsvrVR4CkYKz5fw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2eGII/FiscZzTnqb0i8fqAatFw/9E9niqoA3X7ovNr1sIDwnl
	qPfOMvEaCX1YYQkLiJE7pzQJxDhbgOwN5B2vSXEolX86G5xjLsXe/Fq+cosmgzc2d0w=
X-Gm-Gg: AZFdTZdoxHM3yimFKdmA3ofyGkdV0YifJaER0WDkQj/YgTjZKzaLZyskzUKpnXQg58/
	qrY0sY+5u88LZKQz1tfyCFFUQFX+1yAxugDr/rnozOkgDZ3nYr1a2U87jlYwnQHwNMC5S9qwZHM
	Ws7vRFFpWEHuWH7yhiLanAo4BotvaACGyt0eHacOUPNVymIUZAft9FR8VX9oHiFt2IMrZurMJVp
	zEX1ddNdqivTUGunPFYVOu0O5HNyyvTqafFt62UyJTbJT1STWL/ibtH9ZtdW//e6LX3r5Zz3rPk
	xLdGFrLVTt7bOcX6ut203c4Js2wLi62mLFOAt93caZ3x4xKOnpbS1SXNLw7kwAfiw5q4Bp/Dv/h
	rOzRrR5j8zugNaP3g+myg5+/bIcN+BrByKfcyTCViUY/VYYbfPnIRCQhMNCPah2MLYkPcmo9Vxh
	J/OeIixRarbsgeWt8SxYMOdSqKdCVIeKXoTSLusrozT3v23qNQ41lKgJZginFLBaiHYaTs3Mk+/
	9Or+NqQv5tvwuZlCaJLScBgRF9bUTFZc/e72NJ3fqM4Xt7NoCV0W1+l96ye8vCipqRvW8roLeZE
	rjv6/YmGI6Ya50W6rJK/HgmSwmoqMNrP61OHmYBTgTnOJ5S0Ne8k3fBkL/WzGI19UTKe0XvFp7m
	cCQ==
X-Received: by 2002:a05:6000:2608:b0:4a6:8012:198 with SMTP id ffacd0b85a97d-4a6801202dbmr3938687f8f.31.1795004885474;
        Wed, 18 Nov 2026 04:28:05 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c23bsm4011448f8f.12.2026.11.18.04.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:28:05 -0800 (PST)
Message-ID: <c5068359-e155-4374-9f3a-1b89106c6fb4@baylibre.com>
Date: Wed, 18 Nov 2026 12:28:02 +0000
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
From: Daniel Drake <ddrake@baylibre.com>
Subject: Re: [PATCH v17 09/12] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, ulf.hansson@oss.qualcomm.com,
 abel.vesa@oss.qualcomm.com, sebastian.reichel@collabora.com,
 sidong.yang@furiosa.ai, u.kleine-koenig@baylibre.com,
 chaoyi.chen@rock-chips.com, shawn.lin@rock-chips.com,
 finley.xiao@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 rfoss@kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1794615324.git.gahing@gahingwoo.com>
 <57874e7459ed84ad47b2e31a62871ff535da249b.1794615323.git.gahing@gahingwoo.com>
Content-Language: en-US
In-Reply-To: <57874e7459ed84ad47b2e31a62871ff535da249b.1794615323.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 14/11/2026 03:05, Jiaxing Hu wrote:
> # Conflicts:
> #	drivers/accel/rocket/rocket_core.c
> #	drivers/accel/rocket/rocket_core.h

This needs to be removed from the commit message.


> diff --git a/drivers/accel/rocket/rocket_device.c b/drivers/accel/rocket/rocket_device.c
> index db137e2ec15e..868af86d00ce 100644
> --- a/drivers/accel/rocket/rocket_device.c
> +++ b/drivers/accel/rocket/rocket_device.c
> @@ -9,6 +9,7 @@
>  #include <linux/of.h>
>  
>  #include "rocket_device.h"
> +#include "rocket_drv.h"
>  
>  struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  					 const struct drm_driver *rocket_drm_driver)
> @@ -27,7 +28,7 @@ struct rocket_device *rocket_device_init(struct platform_device *pdev,
>  	ddev = &rdev->ddev;
>  	dev_set_drvdata(dev, rdev);
>  
> -	for_each_compatible_node(core_node, NULL, "rockchip,rk3588-rknn-core")
> +	for_each_matching_node(core_node, rocket_dt_match)
>  		if (of_device_is_available(core_node))
>  			num_cores++;

I think it would be a little cleaner to do the counting in rocket_drv.c,
and pass it in as a parameter to rocket_device_init().
Then you don't need to share the dt_match over two files.

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
> index 68df1596014e..59a6f548e108 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -31,6 +31,11 @@
>  /* Bits 3:0 of PC_BASE_ADDRESS hold the mode selection bit and reserved bits */
>  #define ROCKET_REGCMD_ALIGN	16
>  
> +#define RK3576_PC_TASK_CON_TASK_NUMBER(n)	((n) & 0xffff)
> +#define RK3576_PC_TASK_CON_PP_EN		BIT(16)
> +#define RK3576_PC_TASK_CON_COUNT_CLEAR		BIT(17)
> +#define RK3576_PC_TASK_CON_LAST_LAYER_CLEAR	BIT(18)

This introduces an inconsistency in the way registers are handled. All
other reg definitions are in rocket_registers.h (originating from mesa
xml) but this one is placed here.

I think you should add it to mesa as some kind of register variant, and
then regenerate rocket_registers.h

