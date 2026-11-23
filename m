Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439534;
	b=rrpK8q+4KiwnPi2+1Xig9ABkz3z0sp95/s8qPBoMsIGkkNqMOsTWjzHgcnmVwDKIr57n
	 f/zBFXxIqlPNAjeDiQcMEA1D8sGnbt4tbU/DSopjynbkUJrsS/SDUNZ3iBIxoFOkqV8kU
	 D1d7H+JDIMWAyjHZcp3DK+Ez+ORWm5/ouQkQB74/lttYmQWGVC+3fiCqsnoOQmPrBVDZ4
	 QBrHy4P3jZZq/0hnwmuPsLD+sToyBLgjlyHmlAW0moPZ1dMOmunmFtEd7TmZVmFQOiltR
	 6mih8qRF14kvtmrZGS/za5JnlWYaLRlm48IlYTn98aivcHYZ4c79+58zCJqyT+czWhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439534;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E7U8G6i0xepos/3PMIsIuLoAJuXWxBLJeRFOqwOSlKU=;
	b=H5UFeHmCbvsxHdfgk2SSKZiK0/B/5g2p5nWm8Hh4Fq8DjfSzmksEkSRwlK80T0qt0n4d
	 ao4GwAgPeShEUOMbRzdSUM3P79sg60jOwHKgdphaZIwMhNyg1ha1Sj90mQ0ISgFyU4A9k
	 zeX3xj2gh0sbqM2NymPwzKIxH8rdwHqLgmFv9+WBaI2nv0ZG4W6D1UO+nxNflFBRcbvpM
	 cR5cfCroOw8ch6OwAES5UWMeqOFPJvhqJai78RX4H0rMneG+KVyRoCyng8I7jhnlh6BG2
	 Q20yjk30n8HDb1gGTPiO9Oln1HC7aTCbgbBCi/nwFigKNisxjNhZcC3gTjp8W0kH2YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CWYvHpqr;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6DD606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D6DD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=CWYvHpqr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=E7U8
	G6i0xepos/3PMIsIuLoAJuXWxBLJeRFOqwOSlKU=; b=CWYvHpqrl43SKEugm+dV
	aLXrR2GBZhEOAtLQrcw6GDEUIDrHYXIbpMIfIhc/pv5ovxu1bQRT4yLIsT3n9qa1
	iHbn/WVVOh8gcGeLn1xYqN32ibOL8Oir2MaospU6thdpawDqgAyqyibSctBADWNm
	idkuaavZcbtDnZpnOD5/48NIOPKAOvKM/kKNvSzjDEOIcltuY/nwmEjvw5T6ezM4
	fO4XaJK6AqnsD45S4+zjhAlKCb0s5dsF8YfqrTndEc/pW0JdFzUft9DMB/2MoZn1
	oEX0aoiTarZHo/5WxL/txHVjlbI7E6n/xcR30fzIttIn9Gt8Z7CjvGX6CffHIZic
	Aw==
Received: (qmail 2737992 invoked from network); 23 Nov 2026 14:12:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 14:12:10 +0100
X-UD-Smtp-Session: l3s3148p1@3kNmV/FgBoUujnsu
Date: Mon, 23 Nov 2026 14:12:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] pinctrl: renesas: rzn1: Use devm_clk_get_enabled() in
 rzn1_pinctrl_probe()
Message-ID: <awQ7qa5FGG9RETtS@ninjato>
References: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e05bd9db-c855-4972-86bb-3b7346cdd278@web.de>


> >  static void rzn1_pinctrl_remove(struct platform_device *pdev)
> >  {
> > -	struct rzn1_pinctrl *ipctl = platform_get_drvdata(pdev);
> > -
> > -	clk_disable_unprepare(ipctl->clk);
> >  }
> 
> [Severity: Low]
> Can rzn1_pinctrl_remove() and its .remove assignment in
> rzn1_pinctrl_driver be dropped now that the function is empty?
> 
> With rzn1_pinctrl_remove() gone, ipctl->clk is no longer read outside
> rzn1_pinctrl_probe() and platform_get_drvdata() has no remaining callers,
> so struct rzn1_pinctrl.clk and the platform_set_drvdata() call in
> rzn1_pinctrl_probe() can also be removed.

Ack. Please update.

