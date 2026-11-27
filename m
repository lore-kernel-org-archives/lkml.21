Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746240;
	b=W0jPocjHWQdDQziKtqjrVFynVPKjRLHCrsXIG9p8lHGfGAv1OQMiYRgnclIuag6X4c+k
	 h+ht1wq6Wmz3dARvSyZl2YRfawpVwNvbSfJuUT9TRvOYE+Aq5uhT21LPvpvdJDbPDmyW+
	 5I5dvGhHYVH6VsnU/Mibs28jbOKk+bQ3Le+fo6OqTNt+NmWYTVqOdB+lS2X5GACjF6trR
	 jLgb4H4gWS0lWSZ6MzosOw/zZIGWTl/xC/Az3PB08k+jmTBHdAvbzFo4UhVfplew0w3pE
	 rjMPAAA7iQwQsGZ+tXYnMlh1MQfjuG1YR2OadaDVDOsanJXPuVL88KF62FiL4snpfNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PACmn9X6u41EYHDumO1r3Bflx64JZWil41mGMYpeds0=;
	b=kgRJZn0HAA/8exPLAqL7H6INdU9Lb2WcTddWe0HCiNFgtSM1ULEs9CQY8jMUcvwIrqJB
	 Ub8j7fNclbzQNAprrxHReo031lDDxmdYQuRVp8pOdyY8yKr3Ub4OVQQysqlocSOqvRAFz
	 YdxiQO0HqQph9/mYMiKanulJWw5Vs/UJfCue0qdOg4gBOW8tZ0mFOZE2DnzUJ4Rznyvhm
	 SKxAwZGSGfVOZDfUpOrz1EDyghjahgFARHRuO3vmkZc/rpqw6HGVdJPzoCwiX8GnIbsaU
	 NyLpB+rPiTshKP+BSEzCXAR3NyfaU/qYa0uVP3FyAGYKoGtji0jMbllGBkkZf7nwbZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Em8ljrc4;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95377606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95377606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Em8ljrc4
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b3a914e4c8so4314203a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746240; x=1796351040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PACmn9X6u41EYHDumO1r3Bflx64JZWil41mGMYpeds0=;
        b=Em8ljrc4zsNuvXqaHZWtrYo8RTgJPZWLcn6tl3boLda0DKunjpAJlNBGTar3/9S6FY
         sue4dETxXaJ/UZtBmqDpZSMaYu3R+f1U7m/iF3UmkGG0nMB5NukKfQdHP6cx9Ai88M7l
         jYL4ZXnSZZzJSk9f71zgHZPkebKBM1jTFtRWZpEGVe2MxBlYOvbNdtk9p5NacW0JrDLk
         xEDTjJyPB2H4vO0DIStfoDpDUy2Zdafi6wG+mHnqc7W/VAPleOdUnkbO3RVVwXx9oQqV
         XdYQbBPbY23Ssr/Ga6hejDXGHRV98GwK879UJX4CB+Jq/CZ8cLu2++X05Bz3T+DVh2fd
         A54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746240; x=1796351040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PACmn9X6u41EYHDumO1r3Bflx64JZWil41mGMYpeds0=;
        b=0Frhat/0/dC0aQPjfuQNYpu/+qLkdUY7XV1HvPDAdfSujivObyiKmOXcGjHli/RrU8
         Ea8VRnwEmL5Z7kiVRe7pJ4Nzf8Kbpj7tqzp3SVCPk5GO5tExccn8VU93YMIb/5/BShgU
         8ZkiZNoFoyMM1lEKx9dfQps6slEd+mgFrxrlmwsT2aAZhsOo/Y5BYN782a5kTNm4KzcN
         YIA9p5DsqKNim/g6jn6Gc7Fsmvn36dPVhWiDtJofGqgozei3bBgtMai6tXkPa1T7vmOn
         xio4DaigMLlrQGbSFtUh00+CeT1ak27pYsoqzQU5MFQuSLkJbY7Olp6ojS8FYTR1JfBa
         xtOw==
X-Forwarded-Encrypted: i=1; AL+hErGUIGHkiMV5d8i17OvgIuV3QR9k1/ZhfY2u1bmXlWr3AyFRT5tiJCLCVe86V13qhDqBgROAkpOz8L5bATo=@vger.kernel.org
X-Gm-Message-State: APuU4Z82fCCLwGGwuhAHZrPbYg/sr0UQchpywXxNqp4VaFM9T65AqB80
	ltTdLWlBskcHcxge82MLfX0+3vp1szZcJ9HcxnJRsZYCPIkK4s1Slq0R
X-Gm-Gg: AZFdTZecRvJVIS3eNGNoyxyqdPJr9lZ6W0OsvpZ2Uyd70msLK9Z4lyS5GeFbTvflpzo
	LVRN0tTQdn4zqvxWU4Ovj+dQebIN64KbNjqYLi+eiOt5HXYLwAMxttVqJ/Vi9fxMPQs10H74pfQ
	Fbn49KyPyftWxl8BVc+mBWA7NWzLYcj0g3ZNigwMG1KJBInG9g2cPcwxZcDe+obpNQ/d7YeJjBb
	7Gwutjm9ocAfeK4zQBcv+D1rR1cVUklPf8AjjLRbBC/9zoHT9T+IFBS/FM9JakaXWFxLC2tOYYk
	UqjYZQ9OEcOTkmwKCKwJ7HOGiu2Ro9nK489GWbH0bfRi12E3VO3XcCzPfpm75W31Vf7LcNULeY3
	s7uy4Ul6wbGjfRaARaX6QeG0iDHl8XKDp0l9baSMrA0UfUbZ5MHZK4KCMKwYn5Ggwm9hUJu04i9
	4NKi94ZxGJL1DcNx0/UQ958mAyDVW4YcBw0o8qOElV1YmF2SZNHWB2nUfysuk5+aJH2uYIhYFHN
	O0zFDz2++xANt5reP2P6rDVIgEUMpHqe+WurO9oPGC1p7g+JBIvy1wRDQR57mVt6oi43DTz6HGH
	GbKINSVshhIKJmkGh/4eF86cOtMFxipiFxDgPWux6rmbplZlQH3RIJmKhNhXYmhQHUcXR84tZWr
	vLK5ncE7WYdKkZW9pTxuqJitvfO8HggSeUUdNjav3P+bLn1SKODi2
X-Received: by 2002:a17:90b:4c12:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b41c95408emr21354995a91.42.1795746240009;
        Thu, 26 Nov 2026 18:24:00 -0800 (PST)
Received: from [192.168.29.169] ([49.43.113.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm16720268a91.3.2026.11.26.18.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 18:23:59 -0800 (PST)
Message-ID: <32727766-89ae-4e23-ae39-635f7c0c9a6c@gmail.com>
Date: Fri, 27 Nov 2026 02:23:54 +0000
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
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Language: en-US
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
In-Reply-To: <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nathan,

Thanks for taking a look and for the feedback.

On 11/25/26 23:10, Nathan Chancellor wrote:
> - Most people are just going to be using a previously generated
>   KCONFIG_SEED; can these issues happen with the default logic?

Yes, in two ways when replaying a previously generated seed:

1. On 32-bit hosts, randconfig generates a full unsigned 32-bit seed
   (0x0..0xFFFFFFFF). Half of those default-generated seeds
   (>= 0x80000000) overflow 32-bit signed strtol() and quietly clamp
   to 0x7FFFFFFF on replay instead of reproducing the original config.
2. Even on 64-bit hosts, copy-pasting a printed KCONFIG_SEED from a
   build log or CI report with an accidental trailing space (or typo)
   silently discards the seed and falls back to gettimeofday() with
   status 0 and no warning, while leading whitespace is accepted
   (asymmetric behavior).

I suspect it hasn't shown up in reports because the silent fallback to
0x7FFFFFFF or a clock seed just looks like a normal randconfig run that
failed to reproduce.

That being said, I completely agree v1 was heavier than warranted for
this (especially the test file). Once the 0b check is dropped and the
tests are trimmed per Julian's review, the C change is quite small and
brings KCONFIG_SEED in line with the existing warning for
KCONFIG_PROBABILITY.

Thanks,
Priyanshu
