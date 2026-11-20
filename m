Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172898;
	b=GMEIcXH22i+BKYgIMLqv21ra2HtkdylVC8BVvha128ytdkr9lbBkRLSk6uZOwL9qbXUa
	 kRL7iVx86IBvIBNj12tpl5spxkcQcJ9InH5kAQpEqok1kwyHTFm2V5OiCripZBhf6VIez
	 9vt2bJ1Fy3gWgks3JETJ7sjRAiHUTyefVpk23Rf4aS98Jns1K3mRXoPldByuniL9uBsdt
	 BU86rB7xZ+7uCs4oV+5Qzg7M9UPuk0DQf8wrQY9MVvpOwDLVu/vqbYWDT7t4PrWi9ZaBG
	 bOE4Wnv/NH9HQoWcjh216rr/leyE5Rp5s9HHE419TRIVeCxyQvqARp5ZFNqh1aSh6SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172898;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=Dgzf7aguqheoAiwvW86CTGnaIKKdaAl+KcGgpUHUbOg=;
	b=vmqqq3aThju1vU2rhtIIQETLTZ8b+ZqDt6re5QmdnFEzdiYXsRCm3i7l3GmTvBrGn9sB
	 Xua94F+QGkOKyix1fRGSfTbaK/vCGfLZsrBXLI2tQnRJqJ17Ji/BKX0wxT4VBmR/4nvlU
	 U+kI7QBbopUXumUvrGy27Xfzm1DgffIH6lvzUEDc9Pea8/I8IrtLj3d5AUlb9cx54TbQZ
	 QP5RawdjNYUlf2MHPalNfWKGk2hIfnIdUDn4A5vdQRqKJEZnBxUoWGNFCEo9LKJ+z0kpa
	 Jy3pyYPqj82+JVw+EZkha9kcH1pNsNRE/9yxr/+zKC74DbGI5vZnAtIug0nmCfcoI8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7460A5BE2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DC7460A5BE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc751eddf25so576463a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172898; x=1795777698;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dgzf7aguqheoAiwvW86CTGnaIKKdaAl+KcGgpUHUbOg=;
        b=AzlqMsTPtBHo+I61ksTDVC09r7BX5DNEy1S4m2TphYB/lkF9Vk1GYKth40Z9oyNDgq
         TNIJ9litY5d8RLCH5+9VurIUT+9vU+Wh1iVJ+SgB50uKKYo5TurX9EqYkcQEzEaLQeLg
         WdkMLAxsfNIcpWvelUYsnoaTV8cpBZlUWmhY7VZQ3/fL5DNobq8VCKJQfaYldeSRbsQ4
         HG0hLrgO8/T/AqeFx2zx7hgIqAYLO1WXMfoX7bBDGtUv+cKKwweYHcmC4nuTiCsBJJDp
         Ig4GouIriZSM16CskugG5Z14/8mSr6G2gcbDUtm2QOrG11/TT/oc81OGJ/3Io+SoM+2v
         A6sw==
X-Forwarded-Encrypted: i=1; AL+hErGY9CIp5wZtR4DMQeKNXlURBTCUZq3lum793eiUmBl7/jhh5uk9TTWcZoRZvf5AZFd95OhZZxe968lVyec=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kfKMW5vHAFIHCFAcTFw1NkS/mT+vz9T3HEmIczx9pL7yPA1a5
	retLBoAgh9OO012JvMLO8TICf0sVZfGmP8hkT6U0SvneAhjXh35jf0IFZVhVqA==
X-Gm-Gg: AZFdTZeKI6giOUWwWw6LE/EMfj256USheuxX+eHW7KOUnFFg6DqtgKIlydgaEJppGna
	2ryNLIE2zBcVB29oS5mOmrVff6G+/ZC9jZQzbjZHsHtdsKl+WISWFxZ9LQkrO3BGS8g0N++SYBq
	ZDYrd9ZWxmMzwgSmK/ll0xvl09D2UAde+hbBUHlJLdE3WJW58TAz/vvR/QnKUUnvHRobf3rZbGE
	Ff9pYHVx9lec2O7hYzwKf5AhJYg05/gsBlY4qoBVZvfqlAFm4anVme87BjrPdA2B5sOImAZjwck
	1xycREtB1gKKI9d8JaxCyG3+0UG59WeDdJNdfnPB3kaeVTwchrkENmdRnKelloMoOotqLeiksCP
	z1gkNQbFgyuaTHEo1dlLulOk527zqxvTSc+K0DL63gG8q4VcFRpJfJXWgftnoTgBQhB+2Tck2vU
	7AMtEewqnH5CfxpXjHqpgvyV7dOhnPpDGV7oh1buOa+Wt85ZOnkcsXQ13J/b8e+r9iZ/MKYhpVL
	6nNVk7aGO31SniqWuzD7m12cyq3x4l6C5OppZDDeK32iGwN4i4uZ8uBJZzMjrBC0Julu0v28xzt
	JYWxLWPJI/RejI4DpcluTU34Ypru/ftwf3dW7/jV77pCko8KY0AeBwqIlwBoPrGGFiTuysA=
X-Received: by 2002:a17:90b:224e:b0:3b4:f92:ade8 with SMTP id 98e67ed59e1d1-3b41c7e1174mr2715348a91.7.1795172897627;
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com. [209.85.210.175])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41d22aaeesm1415635a91.3.2026.11.20.03.08.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:08:17 -0800 (PST)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a594d313a3so598938b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:08:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHP4+wX5+Aq/08JdT6a3dT4OOWLIx+9h6bjk9od5fyZV9GXcUVu0PbwLKWxVM3x4n+QafHcrRkGId1ETP4=@vger.kernel.org
X-Received: by 2002:a05:6122:1307:b0:5ea:94cd:c5d7 with SMTP id
 71dfb90a1353d-5ee8af38b50mr1262670e0c.16.1795172579449; Fri, 20 Nov 2026
 03:02:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev> <20260902141544.565763-7-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260902141544.565763-7-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 12:02:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHHpawxb_bvbC6Oi9t3_5ExanfJW2zhkCOTevawtZLew@mail.gmail.com>
X-Gm-Features: Aa3M54rengaq81sGnkGug22WDB8YugYyeSQm_WaDyvyTw8kAqbaCOVfSJpyWwN0
Message-ID: <CAMuHMdUHHpawxb_bvbC6Oi9t3_5ExanfJW2zhkCOTevawtZLew@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: renesas: r9a08g045: Add CAN-FD node
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
> The Renesas RZ/G3S SoC includes a CAN-FD controller with two channels.
> Add the corresponding device tree node.
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
