Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264601;
	b=Z9GqYeAkMv5hQisbEpUnBhtutAm3RfDKXqwn8g0wRLwFQbh6CqqJgPmkvJYzJfx4NHFk
	 jHWr49a9tvoVBHGWwPrW/1d4u2gwAP5imLQphiuaiD5bGrkWn60mYMWEJgluvN8lHZKzd
	 EmWk2yuHxsjZc5QvdZYFo0spzrU58Cw0DlHRivIAZneisghgYWy6LpIUVb2lj+CjYSj1Z
	 W3bsZhdTDJY4w4XTi8eC8n4N7rQS6EWMRIgZ8czJP7M8Jkx4zjgYeHtAEoE9u6kyfsVDx
	 2ME/1uA7ZOesxoqF9KEWa27Vzn2FZNw/iuD0MMGUUT4xvkCVGXqGD1x4H09X43FzKyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264601;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=rcuwWYuIShywrwdReRTzxtDAqrJLFL0BZUk9awwAu6M=;
	b=LxoCIuseeJp+vy6neLKGt6R1tW4B2zF6tmYaY9SAuCthguVJm/EDH+0ic61aQwzGal1A
	 d7DaRBKh1viOFPfS0RAaSAS/DmOHfWZqegvHj4+pBk74S+lia6v819nPZ1WgY1u9hY52v
	 d3tHLYlShyyTOvxYHqD/VHafmpFvfe5TzeZEoq6CTJYugZgbg3zaOgyVkLSNt6ugFznr/
	 4BmX8EYmASdX21JMXg2C3lLEXGVUTY0mHEIlYQ9geC1cPVb3v5e0z80gqnCy4F6v41WC5
	 wdTprjy+XHjPVt2VuxrkCHRwtdkBks1N/HZ4gon4U1lhVILxC3HBkmLnZXQhNDHa28A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=unpTNbXC;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76EC606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=unpTNbXC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 75A9DC6222B;
	Sat, 21 Nov 2026 12:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 33867603CF;
	Sat, 21 Nov 2026 12:36:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 423FA11BC05AB;
	Sat, 21 Nov 2026 13:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795264596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=rcuwWYuIShywrwdReRTzxtDAqrJLFL0BZUk9awwAu6M=;
	b=unpTNbXCOfhekgHiuaF3vBNRjU4KLHjsAo3Osz74DwgWnxjU+ceGqGpMw7nddWL5m9b+Vb
	PgCyvrgoZcFCLjafG0+7lRnYQejB9GFOSeHNNp/v/VjQAN/JaaT3jtSIBqWuoKEp9OGNff
	Npa3FUcJLZjhETqcOgTLRqXRbsnQQn3krTC+ROEBrl2DLGhtQ+3/RFlx3Mnm4EFw4nCduB
	XEe2QO91oemSn/hokoAMdN0iTjdIDQlgGf3Ui+fTNOT+yZaWhpZqMuOlxc081fad/wQF09
	tbZg2DR0F/rh57B8Uzp9QMwjdtvCj40Tcp1Cw9BpCpOFmu7FIQ5idfWtDXAD9A==
Date: Sat, 21 Nov 2026 13:36:32 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Stefan Kerkmann <s.kerkmann@pengutronix.de>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, bruno.thomsen@gmail.com,
	giampiero@sferalabs.cc, p.rosenberger@kunbus.com,
	antonio@amsobr.com, Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 3/4] rtc: add battery low voltage detection feature
Message-ID: <20261121123632576d91fd@mail.local>
References: <20260311200237.3531981-1-hugo@hugovil.com>
 <20260311200237.3531981-4-hugo@hugovil.com>
 <eeff2fb8-889a-4884-81d8-e4cda7ac5e9e@pengutronix.de>
 <2026112013404685aba5df@mail.local>
 <202611201612495c31b58f@mail.local>
 <20261120184027.650463c9b2a1ee1d5528ef36@hugovil.com>
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
In-Reply-To: <20261120184027.650463c9b2a1ee1d5528ef36@hugovil.com>
X-Last-TLS-Session-Version: TLSv1.3

On 20/11/2026 18:40:27-0500, Hugo Villeneuve wrote:
> Hi Alexandre,
> 
> On Fri, 20 Nov 2026 17:12:49 +0100
> Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> 
> > On 20/11/2026 14:40:50+0100, Alexandre Belloni wrote:
> > > Hello,
> > > 
> > > On 06/08/2026 14:55:00+0200, Stefan Kerkmann wrote:
> > > > 
> > > > 
> > > > On 3/11/26 21:02, Hugo Villeneuve wrote:
> > > > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > > 
> > > > > Some RTCs have a battery low voltage detection function. Add new feature
> > > > > so that it can be enabled, disabled or queried at runtime.
> > > > > 
> > > > > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > > ---
> > > > >   include/uapi/linux/rtc.h | 7 ++++++-
> > > > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
> > > > > index 97aca4503a6a3..596eec119bb3a 100644
> > > > > --- a/include/uapi/linux/rtc.h
> > > > > +++ b/include/uapi/linux/rtc.h
> > > > > @@ -134,18 +134,23 @@ struct rtc_param {
> > > > >   #define RTC_FEATURE_CORRECTION		5
> > > > >   #define RTC_FEATURE_BACKUP_SWITCH_MODE	6
> > > > >   #define RTC_FEATURE_ALARM_WAKEUP_ONLY	7
> > > > > -#define RTC_FEATURE_CNT			8
> > > > > +#define RTC_FEATURE_BATTERY_LOW_DETECT	8
> > > > > +#define RTC_FEATURE_CNT			9
> > > 
> > > This is adding a new ABI and it took me a while to find enough time to
> > > review the datasheet for the RTCs  we support and others. What we need
> > > instead of a boolean is a voltage threshold. So maybe this should be
> > > better named something like RTC_FEATURE_BATTERY_LOW_THRES_MV
> 
> I am not sure to understand that proposal, because with the
> pcf2127/31, you can enable the low battery detection function, but you
> cannot select the threshold voltage...

This is exactly my point, there are RTCs where you can select the
threshold voltage so we have to design for them. We can have 0mv mean
disabled because we are never going to have a 0 or negative threshold.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
