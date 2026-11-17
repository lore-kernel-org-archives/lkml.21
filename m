Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950539;
	b=CBdlLAlX92/saYCIhyPw2N+t38cbG1KQgzej5EprbXQDwjkKb/6MAUZCJMSPGVOqss2T
	 IhVlDXxm4LeKJpEoI9YZEw//MGlOr5Klt8AoFQ+o/JjXx2Kmk7638NQLm+7tTuQkJZto7
	 iRLFeKb3+ZKrZBhNe8p/z+XvU7+CpccwWGiND1RdMQeTpi4xbWdk6UTyH/5REpHOG0oE1
	 GjLc0CbsevCub3Tk+BfHtG8g/ihCzVeCuQb6XsmaJzCwRFtEkcEelXxMjYL+/XzbLdg4O
	 SvrEjLXXHlYUMYqcGVjMbt2IivGKtVVSWR4wEhswMUe55yshVMCwJD4c13CP47M2xEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950539;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hR8zqcaVFufUZJbz6TpjpMzsfZXJTBa7dHfRmHijjs8=;
	b=jmNJ1oEY4l0prxX9kTp7zyJPgHEga7zoC2AmRQvSXP5JuwGm3peKv6qCmguemog5VVho
	 rN96rRr7IHbTOwSuvuKao9k23U9P01buz9kD33ykjmISOYhNGa82RCl1Asnx1bY2pcL7t
	 K5JaHo7sQiPLEeAHSm6dWX5IsnPjnwk8ipEbId0WeKKFfzCzNkPezI6S9LS39LlV1TeDO
	 CaXfesvLsaxTourlAapmPTlpK346XFOWyYt9ZAkUaYWEJvvqBF0kfKtAmGAJq1Bw895e9
	 IdKWP96NnJLIS45d8z24JallqE+WfJwGby1O8NbS/pO+QEnBd05+aFQeQ9e1Kbdqpbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A25jxWUP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D8606A334
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A25jxWUP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6FA1F000C7
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950539;
	bh=hR8zqcaVFufUZJbz6TpjpMzsfZXJTBa7dHfRmHijjs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A25jxWUPYHW7w9VYVoXlbomo3G8mmdvm53v0mBIA6oJcnerOOTb1O694kNsIJo4Qo
	 OtIPA4HjRXIbNWszJbAkgvwU84Or8LXV/cOCKbcKbw9iknTM5+MeiSMeEj1N5hQZ+v
	 SZGE8pAYBcaynJogDCNSo2DI3Xkl7/r/Kg0Vbz3KyEhaIEwr5+GTF7yCHA17+AmcQG
	 ANKiZDx7/4hnEB5DmsnI2eRCipZSBtsI5vt7glB8emqQEnMAN27lO263KYQD9hDl+4
	 NZUojAPT9nAhPj/9TGeDo3cJJKLv0+eORTjHfyHWzPbV3XuzhiGuLWTu2fhk6jjX4M
	 47/cwY2hq3FAg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c15956ce07so1261488e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:22:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEAyHaLlVB3ScfcU7zqKn68uF+v3Opdzh6EuO+A5GtyAjYocUOkSkjsO2N18rgOB2ebiysfhgEIWDP9biE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Bg8X6FQOxSnjnEViVq2VG07Pe8igueGqov+XDzc7+JgdQ8zzz
	1EmUr9vMX55lJSfF0E8NZ/9vodFVqoIzB2hSIgYZp0UP/ayVmYkh+khRTEV+isOcLveWtWstp3o
	eLI1Wl2LduTkHPRTypcgnFtKnAVu3jn4=
X-Received: by 2002:a05:6512:4014:b0:5c1:5b12:1f87 with SMTP id
 2adb3069b0e04-5c1aa2d4048mr95529e87.26.1794950537809; Tue, 17 Nov 2026
 13:22:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn> <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
In-Reply-To: <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:22:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLk0HkzOUR_1aa8e-Ybt1cjQyVJnjWDoLW8fbT2Uyj5J3Q@mail.gmail.com>
X-Gm-Features: Aa3M54o5CUDu839zFyLh0vC4KsKZyd2Q82HQWkF6_lEO4Q3vIMRJ5Sux77Di6k4
Message-ID: <CAD++jLk0HkzOUR_1aa8e-Ybt1cjQyVJnjWDoLW8fbT2Uyj5J3Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpio: brcmstb: don't turn platform_get_irq errors
 into -ENOENT
To: shao.mingyin@zte.com.cn
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	geert+renesas@glider.be, andrew@codeconstruct.com.au, wbg@kernel.org, 
	opendmb@gmail.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 9:12=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> When the "interrupt-controller" property is present, brcmstb_gpio_probe()
> maps any platform_get_irq() failure to -ENOENT.  This swallows
> -EPROBE_DEFER (the parent interrupt controller may not be probed yet),
> so the device never gets retried and the GPIO controller is permanently
> unavailable.  Return the original error code instead.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source supp=
ort")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
