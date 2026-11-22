Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795339013;
	b=wmZiwpdI8bLmMPda3YeqfFygY3jb5TrlZ15FYKkn7IFtr8RaTwpuRuFzIBNIQEpmqCUC
	 jvd3t+X0WuDpsrNOr1cHIX0ef0YrPmea+k2M690wmGUVxA+4V9Ki8+8FrHJyrj23fcpsu
	 CPOCSe/Mk3BoqRYOYpyAumMMeUuHQOwtRGbUI/Zb6QbXeeb//833emYu1ow3o2uv30AhN
	 y4yKwvNQTIOED0DZqp10ShTrrZ7aGgrgXisPHKgjBiBLfzvMC7TncEcN3RJ8PST5p9dEZ
	 A9P0nT2PIkg6J/4x3ua7Kob0e9xp8e/RFd7+xTV3x9wNJX0UTq0pMax9ww7GVJz+UZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339013;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
	b=Z5GS8bQSNSNK8o8Jtov8At4JQHJ5bWKqYaKpIbS/n0z10fO3VYb7RSfTVxoludmI62sP
	 uYBD18V3dAAqi6cJl54EeEgxdDgLYKtAYEv8MqhyqN7cC6mRJ4XcBgOnLNImON5k3PMRE
	 KQQverwg+KA30nKHe+EKwIWqpnvEl5MO2IQowEJTvDI236wIZnCHhpfuXrgJFN6Hp1Dze
	 kPuMZmJfdgXJdZeo+dufXNJf+7d4u5hvJa7v+lUrNgHBjcPKPU2WH7bEG5jia9RYSFZdV
	 3q2RB/MUQlYHASpqiYqwayEPNRJFBEXZthyCFq+RWT7w3vNykQshRApWnRzK0FEy1Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSQajXk4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD906606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD906606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSQajXk4
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c00c727a26so177396e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 01:16:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795339011; cv=none;
        d=google.com; s=arc-20260327;
        b=hDCGZA2q66VSqMcwzVX6c3JXdzWcnkg+viDB3Vgf7hoOZQYLaj8vaQlj8mcvEZOXsY
         NpquVIEllXnB2Y7e0pyYhb7nxmV+sNearxgDpzERq8xCRNVZ6CDj89GbCC6/Jb0cXF9C
         E5P6LNQ+myPM2S7tNj7CzVHbV6v2abCicLu2MuyPqhaaPIIZ4Pu+soRQEjD0jXYngHtL
         i4idQOQ/BwyHorG7Y/4JPK4eU/61JFP5M5aGf9BDddfK7F2FldJkJ6xW+NQvCVQftLe2
         F2jalIaL7jvQjrqFx1e9GoYzjouCcIQWroCM8A2Qx72EZSEK0d3q6ZvwNbZFgbRkDvck
         Te2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        fh=ndWSQkSjHZgDqcSbIwIRCw50BtCDuChn16zKJYVns1E=;
        b=U+JFcy/piqOByWuLfhkHjiF0OwCz8nnjU6PaFmsafTBVIUZeqKjFApbCVROT2TlMLm
         rlnBYTOBopTCPvOUW16pfO+51Wu1+K9nPgZAAFJeANnzcsNPoP1cVQIf1JqnY9kPTfM5
         bkmjT3uvtAUJj58458xDvYevCONULSwwBJs3jQLCaf9ODIjR5/+MrjpN0XRnoaIgDxv1
         hXoG9cmaFs4LT+MPwlbxYlTDz0bFvY9nctD8e0pfWZ0+W+bx22rm/WgnuazGaLfIb1lE
         C/UTaPEogNwOh9amg1mTcKHFpkLh0ZJMcWSxY9qNuQdSS/FqhGRg3kxlk0wjZAiBeqy0
         dHHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339011; x=1795943811; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=rSQajXk4yyxPvW6GnUHoTRPWJWDnM+/qTW6hZKO/1BwoSTNW6ekQ2+73Bi/VdKu3mk
         fAwYKpm8YWpXT8EgQ14v0X/aettSCXoyBDG1T9L5ggPnpKXILi4Y+6U4OKb3B59py9l4
         CeNo83RhqEU0GX2vYbM1ANJryPiTSTftVj+KdBOqJ7GPhvHUtvOoDp6h3xc5ecQatPyr
         WQu0rzcI2lbKPCifVkkvoVwKLyi2YMpRgZR1e9l9u+FAzbl/b2+gRji2LRLBwmU66+GY
         LnPiwS/j0iAX/qQTOol7ft2W43LMXHtVpihoVFnSax3j78bDQYBmP0i8udGrMF2RuZQe
         sdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339011; x=1795943811;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jlk4MoliGvZW1IkxqxKZvX+OlKzVs5YdkLc7yt4n2p4=;
        b=DiPvJAiqRbIRdqiJnOeb8A1CF/PmKtSF/3EyZyl44oZF8pLblOpe2mSjGJ8tTrN8Zs
         Sh13vv2skiL9xPXgIEqnZo9/cImfGnXBu6cDV/vvTmN82g0blQvbUrpe4xorK4IGdWtR
         kY3oFEyQuYNyffgALLDOY6wf+839VTOSQIJQQifEf1rDE0+RVblw0Pf0fg7PX0dk1vAN
         NFJTUHxwM3dpkBueH4lln0ROGt+PWScAn7YDd59L808hfqj/s0+pe+541nQfx17p7+2f
         N1aokNTmaHprUtjaXBXE0mSK8KgL8n6d9wJkoHRG73DpuvrBzqzZYrn3ZRj9s2EgvwFr
         e8aA==
X-Forwarded-Encrypted: i=1; AL+hErGtem7HRFCQhPlMBrnDGdl28aDqNTDKRcpTGN+xHMPUJx7OjUmhYfx2bzMZ8WTZCpiEDjwqhCIcKNisPNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vNELjjFj2fz4xxZVX/bGdd0LKBukIUSjDbj1kTYjWFpNgAjX0
	AWKySv+iIru3+pn1YY8qFy54iG5CPADfJWs2okKwo/kWDvg+0wB3N4Ml6YZW/Gor+/I2E4mwSRz
	Yac3hydC++eBB4e15SRZwbFpokPlKo6Q=
X-Gm-Gg: AZFdTZckxJj7pWDFvHrBdOHvDvtPFli770bqHdtqSPQpixd4R2dDG6ApkZ8tnQs4dOy
	lZr6PCt9w083bMJBrldCOTe346ZtzLajPc4kM6pFgzRXDBIhaGwhUPiZX81syuZVYO1MSlRpBFV
	Abci0ByVABbNLAdQ9rp7eUdpRce0UsaXNc/gqhmp/IFOWGGbYjbl/Z6eWCtUo1d8QmN0qGE6S0Z
	18S6E5aStpun/RXIkNSqssqsEEKPjqnaQUiheU8HXK2mTeVblXJbVJRt+H3yYspYVz/cHj5WlwC
	44DqStkV2bstOn43uZZZTp6U5sAESKoQ3PH98ufMQUs/99yBjiBAfH/kMaz6v/zzp3LIwdWnCMq
	906E072t+mEUhxHxamVPmkJUNPyGB+CmMTV8KhEwf+nYiF7a5aqkX04WJuz932izfqIa4N1o=
X-Received: by 2002:a05:6512:6719:b0:5bf:ba43:fa67 with SMTP id
 2adb3069b0e04-5c1bc935c91mr2187197e87.6.1795339010786; Sun, 22 Nov 2026
 01:16:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmail.com>
 <20261119-b4-cedrus-mpeg1-v1-2-aa5ba1192822@gmail.com> <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
In-Reply-To: <1a1f912f033.2efff015191157.7190884739957848478@collabora.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:16:39 -0800
X-Gm-Features: Aa3M54oE-VNyvNZaxxRREWe_L_ECyiIpVpQf2rmUEBWZs2-DphbG3Q0KscfmLqc
Message-ID: <CAEy9hNVXZvfbW6U=Y7aiONidPKee7npGWpWuR2yQOeUu4aOVfg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=C2=A0=5BPATCH_RFC_2=2F2=5D_media=3A_cedrus=3A_mpeg2=3A_decode_M?=
	=?UTF-8?Q?PEG=2D1_as_V4L2=5FPIX=5FFMT=5FMPEG1=5FSLICE?=
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mripard@kernel.org, paulk@sys-base.io, 
	gregkh@linuxfoundation.org, wens@kernel.org, jernej.skrabec@gmail.com, 
	samuel@sholland.org, jonas@kwiboo.se, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, ckoever@outlook.de
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Nov 2026 08:08:50 -0500, Nicolas Dufresne wrote:
> MPEG2 requires MPEG1 support. The new format simply add noise, you can
> fix cedrus with V4L2_MPEG2_SEQ_FLAG_MPEG1 alone.

Thanks, done in v2: the format is gone and cedrus selects MPEG-1 from
V4L2_MPEG2_SEQ_FLAG_MPEG1.
https://lore.kernel.org/r/20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.com
