Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681875;
	b=p9wvoI6ZnC6ZxAUwfpAR2jIHgpAgLQWyMcz/odQY36a2nMyM8ZmjqM6ZdhpI8ry3ZUfN
	 5crE8kEfZjkbq3ySFy5ZdOepnXjFKuEh6nGQbdNyiFrurSuNgwsTjrHnv6N5eNqU5/NGH
	 4vJ0bsyFqfsqxNmzg6FFPx59Lejqui18AOqKK3CUpinxzIGcdrpD/o3JA7DntQVZxrS+T
	 LbsB7yg3T/X4d0gSrS6c+Bh/pxQk96R9CD66E5aTJluYrjxr/F9y2HBWTcE8j3wJAujmf
	 dkN1ZPYeGVBrzvmZOz4JQwibvoeD0xRfep3wJe592EaB/gL1vUgMolVH5+8PgNKp8Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681875;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EOFVyGyYJqU+rNVdExuIa/A4KCVvlE3VjOnDJf/GLKc=;
	b=V3uS0mRAM0fxUlua5UAU0mBwcF6oY4B15wKc6eU44TwyzEh0Ei9uzORAaU5AS+xcFSy6
	 wrTRKu95A5tfuQm4sbWpJWbtzvntKgpNOBhxN2yOxhxsm/b8brvhA/hJ5dtjnIPQu7b+8
	 seDHIrsI5ag7w/MZJwmVHdPXj3Zy63vQPio8jp3dr1t019vCnrO3eX8B7YV/m+Dvi5F6h
	 2ecpEMqWCGyLlx4dE9IneU5wJKBjeepo9fnrewFpWgMqfnv4cMuaBXgFDOhMSkZlCJeOl
	 o2bTAQl/UYtbzMj3QlVBEz0v+ks1AYdCJlivYsGFBu8dlj7GhJi4iMHQ43j0smiagHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kos7nORo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kos7nORo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5241F000D0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681874;
	bh=EOFVyGyYJqU+rNVdExuIa/A4KCVvlE3VjOnDJf/GLKc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=Kos7nORo2W5ieReE58LGqeTwKL9Ui9j7e+fXVsWObncWqZQF/zyQDNDtPMsu7kZot
	 4JaTUQlT2vA+9rauHVdYM37L4AzzMcxwvzgiVZ6Lr/1CXh3ts5xvvE1v/Yx7Dh6sRD
	 MWm3iPQ4OHwDJ2eDJBIwch+4m+e+FKW69UNVzbIm3bRIMm2S1SoMMP8oSXsXTDSFtR
	 EXH2PWF4G5zXtRYrMSVl4bOPodP88IS7GnWnYPcev2FO+oDKdWn1sXiLBC+A8bhvoZ
	 0jmGgK6flR/THCtKPLIkUq2ugs8dIEMgnyQ8e7wWI9e/ZhStZKd+nxTTiIrV/rSZa6
	 LsAW2PBDn8KsQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so6184178e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:31:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFnKrs5OkGPHzyfssTd7Orw9bQV7KmmSx6Tib1UnrUI8tLIl4HQXTzo1gNo3ubNDxpr6CX7jiXlR6/Cob8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zwe4HXEdYb1FMaQwzp8GD5pAR2Uyc/1HEBAnIuTg6fZ9HWV1+
	xMPd3UypiVh8q2Ba8k4PLmPLkKGCz0GNd0j4FP9tF+589jUkkJeTgXK5OmJ6xIxQjKeiWjPjr38
	Yza++cNNO1FSXIH95UQIiNbvuHlezroI=
X-Received: by 2002:a05:6512:2255:b0:5c1:ace3:131a with SMTP id
 2adb3069b0e04-5c1bc8661damr5652240e87.48.1795681873045; Thu, 26 Nov 2026
 00:31:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
In-Reply-To: <20261126-a35bb25eb5-u14-0@mail.sdu.edu.cn>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 26 Nov 2026 16:30:58 +0800
X-Gmail-Original-Message-ID: <CAGb2v65-HypXGomrmDzq6fK2sbF5NwCXmGDgfKsJ_UhBu18YLw@mail.gmail.com>
X-Gm-Features: Aa3M54o43cu-6A0TaGG1ukqNIvNBVoMGzQ0_0epz3dGZK25t85Du9OaBaHJIHPA
Message-ID: <CAGb2v65-HypXGomrmDzq6fK2sbF5NwCXmGDgfKsJ_UhBu18YLw@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: mediatek: Unregister apmixedsys clocks on unbind
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: angelogioacchino.delregno@collabora.com, sboyd@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, matthias.bgg@gmail.com, 
	wenst@chromium.org, drinkcat@chromium.org, weiyi.lu@mediatek.com, 
	msp@baylibre.com, fparent@baylibre.com, linux-clk@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 4:27=E2=80=AFPM Guangshuo Li
<liguangshuo@mail.sdu.edu.cn> wrote:
>
> Pair apmixedsys clock registration with removal on four MediaTek SoCs.

You are checking the wrong tree.

This series is mostly obsoleted by the following commits:

c9c2fd1a53a4 clk: mediatek: mt8516-apmixedsys: Switch to common
probe/remove helpers
68d1fa487766 clk: mediatek: mt8183: Switch to common probe/remove helpers
9421b0b085c0 clk: mediatek: mt8167-apmixedsys: Switch to common
probe/remove helpers

> Guangshuo Li (4):
>   clk: mediatek: mt8167: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8183: Unregister apmixedsys clocks on unbind
>   clk: mediatek: mt8365: Unregister apmixedsys clocks on unbind

This is the only one that applies. But we probably want to convert it to
the common helpers as well.


ChenYu

>   clk: mediatek: mt8516: Unregister apmixedsys clocks on unbind
>
> base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
>
