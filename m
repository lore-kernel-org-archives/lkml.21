Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172735;
	b=pn35SsLkahxZGoksOCfWiZvexxZbvC5nu4HwbJ2qjwLezVitKC0quqLvnvakGYYf7tCw
	 mlegexrTwgSOpGWBP3fLxcuXQ+VghYRoNiyldD/IglybXhyk6R2zFLcyu9zt05NWxLoPO
	 L5D34dEvZoSbGffp3HDPrka6Ro36Vkx+Yd1W+DiFVM+6wVZnNMEVHWv/uWVoYgfzVhpWp
	 NiLwvf/9ffw4KTyw/Yg7GPylne8m30NyoZ+B1lRcPIo248bCLbWh911GNsJBHVglTd4fT
	 4hXrXQ+gdnadu4QQCnZchs1l4Mq0NiBsJWS7zIcMql4pOANXkOurfp4lE5OvA8q6AOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172735;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7Fsqs1iX5umt9C6HSg0iQYMwk7igmLmbTGhkL3PvPnc=;
	b=5lfHXqaaZf8qEBc/8UHRcPrg13+So37/wUjUg+ylx2WXHxw6gQ8ta5Ne2m/WAOEqyKhp
	 JoM2qpC1B0Hn3i7Wm7u0XzjL3xo3pCTexS4zjPhma5gSJWiY47lPmmdQhBgm1wAGmeZQt
	 uYdIeHXeiV1Mm+BzinI6U+CX2o6Vhhrbq4x2MdC3FMdALEdoGURhfZ04W1KquF8Wiooug
	 cs5luDo+S5vm1gs50Bgl4pIwoKnEnee9cYR8H6OadyMiMXokhgDJu6vWVGVLizhXEW+1o
	 LRzlW1dK4dnwrSsOK4poY40k8H/2vbPF5dg2jakHmb0OKydueIAHf3tI8qjrjnFy/ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFFF606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ecde8e8e5bso206763e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172734; x=1795777534;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7Fsqs1iX5umt9C6HSg0iQYMwk7igmLmbTGhkL3PvPnc=;
        b=C2IE4oNALm4QQdHb92IEQrVl9rBtH8pHphjp4UlGzb2ei6uJASvLJSpNOUvKvyR92e
         W2Ms8/hn3cUoEDX11RgQ/de6m6iWFs4IkKNqcgU/2UbhynNxey6PBgmHYCqKXD1ewVXO
         4/L6oNFc9F+a77G8oRh9nbcBA520Fzd+EbLTKgOFMiUnk6WueNwepCJzU87xvHV9m9Km
         lV0adB6iUHoxDkEATKmM2AohzyyPSg3t0sg3WX6/BQyLLrMBuxkiGmq+YWksiBXWA95G
         5rusUcj3mEPh2S45MUIBj0dXNBSBv87oW93w77URHQsxyJvd9I7tdNXKnDsPfO5K0Uui
         gSfg==
X-Forwarded-Encrypted: i=1; AL+hErFRJZmodbo4svpFsN6xNN0VbpGU2N2OnuVAw/bi4kGl+2GHc76YpahBVPRosrDrO4431HBKCOoOilga5PE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wLy/5qlbtfHGUyhJgqPWufYKTdZzz798m7Owx1V1K0YVpk15Z
	tc+9Hy8wFhllQ//A+0ujSVLn3GBsy561TmB/l7pxHwpSJ+xtKVtfIWuykPOeZ3Ef
X-Gm-Gg: AZFdTZcNDFhZMKfP2UvzlRb/czdCcoNkUyOhprf5oxxSLcLzYsRzCyhvBk2Bfal2Fmu
	7ne+ApLXtfDTzKF0RlIDPJ6QrV8Sy6LmNjKEiV7NnwcRmECNJz4Vi1NKi1sSrkpyDRXSSVej8HC
	51FQycHLdAsGGfXsUwP9vRVDqlOhnFD5LlNrh5oMBncNCT23xJc/bzA1PGV847ZJLMRlnJz5w2Z
	wmvm1Fy4kosem3/ivrFzUTC0IAGx5rX9F079bQ7uNgcdTdxsC9Yi1yQjTZTHX5tUqnFek110dv7
	OxjLLiYlIQZczwgl7RwAVnv+7nbR4Dbv18WERDlVclEraPZd92rrqWEdcb2EhuS1woGwPTXohgU
	IUY5rpoLcybiIgcDglBjX4WgvakapxbV0qxaoyIwwDYF0EEO8nsVt+rbtGGb/qd256jOYaSOAr9
	sOfyxX8x6AKVXgElIjHC/3erlan1jkJT4JQtU6dEx0N3XfP/4WFgpMuRK/7X0QKMpOQ0HwbR/ix
	KazyyaezEFHh4fjjhQT9QgzyWmRSjjoTJsgjwg1MTzOy9tB2nG2UB32jymQ3cwzoqvhhzp/tote
	uY34mKnbMxKKrb4nl/IPQCN4kWmpo+4uZWb+AsPigy51E6rssXFlONkFXoQfVIXDG9P/VmvNQT8
	ljAt4yjYmdi3o
X-Received: by 2002:a05:6122:310f:b0:5ea:dfbe:c51c with SMTP id 71dfb90a1353d-5ee8aeb4becmr1144090e0c.6.1795172734078;
        Fri, 20 Nov 2026 03:05:34 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee8b609bc7sm2259500e0c.12.2026.11.20.03.05.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:05:33 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99e0b348a05so212446241.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:05:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFkuxhQjRTM/56t4bYTn4Bbo0+uHNqSptnnZFn24Fi2iN995JPngr3ImDeQuiNKHMFbf8dxtvIDzyFFLek=@vger.kernel.org
X-Received: by 2002:a05:6102:2926:b0:7cc:9d47:9c9 with SMTP id
 ada2fe7eead31-7d73963f00dmr849125137.35.1795172732962; Fri, 20 Nov 2026
 03:05:32 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260902141544.565763-8-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260902141544.565763-8-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:05:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXhBKV8zoi_95WsB3qSC2tm-nX9opurqFPO8n3mn3L=UA@mail.gmail.com>
X-Gm-Features: Aa3M54qJy6m08CrK20MF4Bh-SEahYYaIemU7d5t_ENxV4MsT0OIrWbFwbx-tam8
Message-ID: <CAMuHMdXhBKV8zoi_95WsB3qSC2tm-nX9opurqFPO8n3mn3L=UA@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] arm64: dts: renesas: rzg3s-smarc: Enable CAN-FD
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: mkl@pengutronix.de, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 16:16, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The two CAN FD channels available on the Renesas RZ/G3S SoC are routed
> through the Renesas SMARC Carrier II board when used with the Renesas
> RZ/G3S SMARC Module.
>
> The CAN transceiver on the Carrier II board has its standby pins connected
> to GPIOs that are selected through the SW_GPIO_CAN_PMOD switches. By
> default, these switches route the GPIOs to the PMOD interfaces.
>
> Enable the CAN FD controller and its two available channels.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - collected tags
> - used ti,tcan1046 compatible
> - adjusted the standby-gpio property along with CAN PHY node name and label
> - adjusted the CAN channels phy phandles

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
