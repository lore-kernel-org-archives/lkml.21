Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795025437;
	b=BL51+0OUKgybEwf2G8aDB8JysZbK5Gfcor8M0VDnsZW5UqmYEkCuhRMWCaNOk1ua/plk
	 n/CW01Kd1Kqzp8kf2eyKZh8FcYaAtq2wAWRoJRU7yDDs1izj9CwgxmH6SJh/asVZkGZY5
	 5Juo/aT5HXw0FlzMeXioxzAoHzPoB8LnDUvv0IQpUgBuLbt1Q8PDtx2NY08g0lWNJb01R
	 EgIU9C97pz1sjGvXerDYzvdMxv6YnKJzunpbKjEeJwA8vAh3L1Id8SeZynr+Fl+3AEh2K
	 h01jJTwW6JUcgNH8O0hBE6y15A0OISD/k3prTvfdrzi6qPZW2iJjRb7dz7caEuPxHwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=uolXzpBiYugNP3qN288JOAr4dwNEE10S3HaS//txyFE=;
	b=K4lXotHCzlrZobJ3aR6ClEHzTHiVNWHEpNwlGzHsBFXkNikn4Il0UbBH456yqJDpLQa8
	 Jr2i6cLYP3dzjOx3I1yTOP/sqdx8f1fX/5V7hU21r/CD0PUlcVOueL7wWVqMHXhvxXkom
	 wtiLObzJNsrwK/YcQhcgKQ7bR8Vr1vOL7B3c4DiF98I6I7ZKQe0sF1oHhUwokERtev3+P
	 lqandfbSPFzaUqlcYeS5XqQZ3TcQj+DJdzZKTLw9oID3lCiNN8CWa8hiqjnFW7ITPQCqd
	 F2c5mc9QSNXWcgwIfJxWavSBKmQzqPlhhsvZZUR4CvoxnruTr9oy2s93SXvCyQyKMtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QKU81Qe6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F3606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC7F3606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QKU81Qe6
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-717080a2d50so1159653eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:10:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795025435; cv=none;
        d=google.com; s=arc-20260327;
        b=fdHr9/JSHuSiofVPOEmabsNuqmV+rt10zUTeSB2niHGtbfELtmk8tce9iyRCPDIJrp
         4h40UvNIDHlb6Nxa10B3zy2wAz9CrxkNSCPSawC6CAGPcOmhqXl3SoFoRNu8+0VT/gm3
         RMBECL4Em0lnJNEwtFpfQKJGG/ZoDOGZFl3w7A1HSY9n9H56LkvfKUcs5U8WBoaP+eXp
         ZtBrYluUyv6FcWLDSih/kNvnXX3IT/UNpl38ObWUGnCHhGnxpkgADW7aJHoM3uu/A3fb
         g6wgL6sj849zAEEDTluSj8VpqmIcNR7LtB31eBnmHHSs/z5oJhRPLrO2sKSlfJ/uqjO/
         Vo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uolXzpBiYugNP3qN288JOAr4dwNEE10S3HaS//txyFE=;
        fh=bKghhIQp+SsOWcpbkQgfOq8sEEiTELUk1cLs9ke8kmU=;
        b=WUFkU8k25pvjdXFq0BJCvdHaw1UoXEiKF7f2QB2Wm8SeoEC9MXzU6GTuO8uGDHFJTS
         fQG11zwQHyZWfZZLOfhaHqNlg0leY8zBMv9ym1CIRtTYOgRZ5gPTdwWDXi0oKs8lM4mq
         cxVpAyfL2HcPmHvsubxKdcdLHeSlACR2c+vNlU7MBeTEcfJ94SLWrY4uqNMzYhgiP/RY
         fAM7IubsGikiGncnMZZydQs8y0gF3O7rkG9WWIiXFj7OW7Pm5oM++H2eZd6VqoF0KfJn
         P4H6Wv12gX8BW+5rWXhdd1q1KqFs7tS3HkCq4xahf9r1S43rUo3tibkuCj84JgiwZP1R
         SvrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1795025435; x=1795630235; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uolXzpBiYugNP3qN288JOAr4dwNEE10S3HaS//txyFE=;
        b=QKU81Qe6/7cpn0cmLk3La8OKAp9n2wJ/kH3DHoBmbmF1qEtns+p5lGSHbicYebwaBQ
         kTkYQtdf/lexPWi1jv5oSRFvqWpxZXQOhLWxFS6npr9vOGOWWzRNgbAQRb5MekaZxEnx
         9CDD5CGmlwn/7qB4vchZ1nZJmAVtGZYfKrrTnCmG578kbMfU1GZfgzDlcDp8dzVTlbF5
         95nU/431p2sHY2TIVj50FTvTSIRxHYko5p0VzI01bl0tHY7R2pbvCjoyyPiO7laiXAaT
         MaLT4BCgWAjyTnQhLyDjO3NDUGKv+JOSJ0pXpeuphK2p8jBy5yYd0Cyf8tZMcdScZURf
         PLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795025435; x=1795630235;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uolXzpBiYugNP3qN288JOAr4dwNEE10S3HaS//txyFE=;
        b=pkFfA5XxHoWIl+cLRHqpeSX3Y2MqYV3AbU3/6Cj+gNVy/Brm18BA/qLTDJOhXVWeyB
         yhLBn9/7MT5/axXIuczcweiAd3+mRyOrwAfRxIDuBgUIg3ia6odh9qVre0OkQ1hmdnhK
         UxySp3akch9qqMkxP+rL9PYXzSUA7Q7Jtnq2JCAsGMpwgIJsO/yBWU1f5Tmt4iWBBIZQ
         sWu35g1UvJeNermxcx0NWkjWVbifXozsU51zYnCzMUGF/EWZyogm9rxdo/2l+cChPvCH
         PYdpgJvSHzK3lRoROGCr1PxpOfMqE/rCXmbvqlIfH8UzGW6MVgRCT9wM2QbhUiK9NKdh
         RrZA==
X-Forwarded-Encrypted: i=1; AL+hErEPhwzrhYHXQzYJL83X4jBxzC36fyWH4gMfi2llnj/QfuQq+uExFTtX3u0vb/6RD7cVrwpR7Wk4FnmBgRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xqV3mQaD0cyDjvor5ungcD3khV5fKq+xnwg93UMPxs9ws3LEA
	vmUBlCQWq//nSQzvsOnkmy37Lf5nJXdjhE9Qi9nBja9srDQ2C9NeaQ3AwdUK2dZ3NDT/eh9cAD3
	8Ct+IowZ3JGspHH8lkOXIhhj/osBQR3LSmqV27+/RaQ==
X-Gm-Gg: AYBFou2Mt5pGpdhFR+dqDPjkVbn56Ura5DE7xv3vTfgUWoxGAsM/lLV4EvAqedNffni
	z27gWOz+M8ZPDX22/k54q9tLnHhvCJhBELWPM45SbbFkHmFP7OtbfZdELS9QWuO8vRX3ktrnhck
	RKvCpYtVhXHRUSJVrLIkC8OmlTKJZlJc4n8iads80lHGK5iI6cHBTgu7JhkgwiWpplFcTxa7DN0
	olrKvDmwHVH06RpZD2zNXfFzk3DkCHSKaaAJ2QPXmSaNe31fOhvJ5KbflCl++j1J6wcfFhz3NWL
	X80tiIZRwRCBBZeHnzMoq2JDT3tKmSX9r3w5pEsT8OiE0if8dcn0sU6ljWP6hURZo96cpZs8Tpz
	TFQOCxVq+JScpn2SmTg/fdAII2psXzmKBMWxTPSzi+u6FOThGSNVeV748mNvlUIaa/Xk95cHTi1
	BXhWSv4OzS2ED6HkIdszJU5K/dH9C+0YDbqs8EtKg8qUcrV8Uclhx+tQ==
X-Received: by 2002:a05:6820:16a0:b0:71b:187f:1d05 with SMTP id
 006d021491bc7-71b187f2097mr2537838eaf.68.1795025435512; Wed, 18 Nov 2026
 10:10:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028164539.3471833-1-henryzhang62@gmail.com> <20261028164539.3471833-2-henryzhang62@gmail.com>
In-Reply-To: <20261028164539.3471833-2-henryzhang62@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 18 Nov 2026 18:10:18 +0000
X-Gm-Features: AclHuK-V5dWIJh-3U7G0PyQp4ktkynFwmoHaphdoRy6ojuMQSX3jJwE03wIEwh8
Message-ID: <CAPY8ntA1CtSqtDzW-eziAzmLPZPbtWGpxBtYv0gCGMPNobcZWQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] drm/vc4: dsi: Set the transfer result before
 completing the transfer
To: Henry Zhang <henryzhang62@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 16:46, Henry Zhang <henryzhang62@gmail.com> wrote:
>
> On an HSTX timeout the interrupt handler completes the transfer and
> only then sets xfer_result to -ETIMEDOUT. The waiter, which may run on
> another CPU, can wake up and read xfer_result in between, still 0 from
> the start of the transfer, and report the timed-out transfer as a
> success.
>
> Set xfer_result first. complete() orders the store before the wake-up.
>
> Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
> Signed-off-by: Henry Zhang <henryzhang62@gmail.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 5ed3c35ee..aa2b46fb0 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -1526,8 +1526,8 @@ static irqreturn_t vc4_dsi_irq_handler(int irq, void *data)
>                 complete(&dsi->xfer_completion);
>                 ret = IRQ_HANDLED;
>         } else if (stat & DSI_PORT_BIT(INT_HSTX_TO)) {
> -               complete(&dsi->xfer_completion);
>                 dsi->xfer_result = -ETIMEDOUT;
> +               complete(&dsi->xfer_completion);
>                 ret = IRQ_HANDLED;
>         }
>
> --
> 2.47.3
>
