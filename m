Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795409344;
	b=SZered/90nrTdrbiYt+LTphR/G+i9pvCkeGiMXVaf5PSaT/wGOsI/I385dTZEWwOFvb1
	 EFV58uPHoG+uc+p2/r6hbnQiWOdBVd+iOYgHSGlTQ3VtPDi5RbOjQeLFDjEoMSSX6ZabG
	 /y4kN00sbiSk1NhAAjSftKH/bAWGOYseszrM/Zw5+Ynerszo5szpADo/SVIhApUXdiMuP
	 e4nLdNiOqUDRkOCj73doTjbXL3A2xmGb0W/ON4BuB/oyFA50JRNCnCvMWUYAODW/q7ItB
	 jjcBUqY7yLpOD11dBpRSfkgcX8D9ebUhRttc95WGRyS8jJZ12AvRikJC8xQUqndqfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795409344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BAHrssDvoJWyvJEt2ijYOpc6taHKwRkfIV9AuIwRDeY=;
	b=oyIKtREfIBUG150jo/uEHrtdyO3EnVgcoSnVRkxRe9sWpQigtwrdkKlYzn8xnKuEPRLa
	 9USLg5w1bYvCs6Ex57PthyNJca4YlafgG74x4oncyG2gzwn0FisAmms55+PhKAYSeYGIB
	 g92rZEZsA9qVUPv+g4vlFFBG2r9o7oT7GJ63oJRFidG9qCTYnHJK2SX8a3FTR+dSUG9xp
	 dzXNGntbhT/P468UW3jSZPO+naz6bZJqUMJcLMA794X4xQK4X78Zl2oN4IYcvPEXN16QM
	 QpMPlrLJMq3ZWAJGjBnQ3/qc91cJcJKNsBceAOiREQZq32UZbwMukI+V33tw7TNaXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5zqY7Pf;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B555606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B555606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W5zqY7Pf
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38587f3de36so3485784eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795409342; x=1796014142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BAHrssDvoJWyvJEt2ijYOpc6taHKwRkfIV9AuIwRDeY=;
        b=W5zqY7Pfm0VZ1qs2KuucHTU0x87cYA55l0x+4uN8ugZe9MURfC8Xd+IAinCo/v/Gk+
         /vUOCHmq9qjzPuJpKYT9m4/msiC74kW3amdp5ynJGVPgcn/H63TqtPT7nhKUgold+DL2
         zdHTDPMBJSKqVwon8OrMFTxOzUhF5sRa2onsbmB8XDYtyvMaXrT65+tY1pl1DLtLpp+A
         Uf8QqWflB/YGTh9+jGMmynSFJ/o01HyQu/bZMyxczMFvW9XjsZT5+4zy9G45fy8AQAj7
         QTvquYBG7TgQpvOvVyoTUr4TW0+VxCw0RYZOx5vKYbnuTlBl7sXV1GyioVidXK2m8xS2
         WJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795409342; x=1796014142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BAHrssDvoJWyvJEt2ijYOpc6taHKwRkfIV9AuIwRDeY=;
        b=LhJrPj+mmv7zF/Cucezfq8+rGykOs4eRNWQmHC+X/MhiBHE5FzXMv8CeLgJtJOrXYp
         UlgeqOx/VlyrwrOmWS3mzwkiPtiYujgaB0zfgZz3oBcoX7V1RK0NngusBxD7MnU7eL9T
         /bs616O4i2lhFw0SFn+vZ6aOR24YYle2WQ6m1QxV23pFpUTyFhO6oyPpapTcih/5TRXM
         xJ5sTbEA8FLL3RGLNQ5CVkP5T/7m26zHLvSf0d3YxWZ3cikj9PoVshuR9gkY5c+KypXz
         eJHIQKrZ9pBvEwmcwnqhfcRyGznOf4QK4plSa03t7Uiewx9DXu2+rtZv2C/62s69gfDt
         o9mA==
X-Forwarded-Encrypted: i=1; AL+hErFQ2+3eOTGcPL1IVJ1NbiWemyiL+2BsDxmfLmMf708Tfvcj8lEK1b/EMSy8bpeN4srq5GnGkXgCNP7wYJU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AK3/ura58lmD4St5umTY3HIDFmq0li9HhY+1/ef5bECFrixu5
	hDm41iqEcK/CxnTDRr5vm2n7+DhtncQ7g3IDC3/mkpcBc2hp63v9pzOS
X-Gm-Gg: AZFdTZcu6s4Q/FphrpmmyHiIQIMA0C8Dfh43oBawvfhOtkqwvPf2f4XshJVCtWuZt2I
	oX9lGr7ovxcyOqNZm6vZCpWObBI7hlLOpjc8aXZJJdf7QW34LNa/6fM8ZfKfH7tM6YLMm0SYM85
	Jioyo3Y7N9J/uKGZsns9sjG8CoMMEs9WTyvVIr73oeJ+d32s7WIucOr7YpOaNRnZPbdMu19xbf2
	mOabxa1hZ8+tWOiF+E26lCQQ/tCu2sBPsSykxL2ov8jGyTWqukHEzr1Upkdh0BOp7P2YKrUQOtA
	iNTX/dmd2i8RFuNQ34VUbJaAyn181OElaMf8H+GfIAJ21O9Ez+PqzMPc4naa0zNvzOujtNZSMhE
	ZofpGhrETRROTnaaJp68xC1amEwb1l9Uf0+grnP0cyNzSps81jrhgvay60QdOKdpss/34evZMWi
	PiKn7gGZztKKaCQllmqLM8AvdyJneNoodAMwCgaUZT2vvp8hghgICR9/hMH9t2WLe+MCfmeOHGj
	sKtPQJ9/zgXNznsfP9/TqJD4QugXrnZy/6WFmm2or+haN0AP8+Xwvjbm86E/tuFEtAwQkniLVdR
	nXZ8wFJjmo/9MSpdLTfZOFHW4eHWsOz2bvxhF9xZoYY6dMM3y8bAJUobbbc3miyGl6RVvs02YOO
	kmjzZby6n2CrPPLYd
X-Received: by 2002:a05:7300:8807:b0:369:5583:bf4c with SMTP id 5a478bee46e88-3856ff5bb62mr11127752eec.28.1795409342440;
        Sun, 22 Nov 2026 20:49:02 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm37583575eec.11.2026.11.22.20.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:49:01 -0800 (PST)
Date: Sun, 22 Nov 2026 20:48:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cyttsp5 - Use dev_err_probe() to hide EPROBE_DEFER
Message-ID: <awPFtpjkzpQZeheQ@google.com>
References: <20261119-cyt-errporbe-v1-1-7faa44e821b4@kemnade.info>
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
In-Reply-To: <20261119-cyt-errporbe-v1-1-7faa44e821b4@kemnade.info>

On Thu, Nov 19, 2026 at 07:34:56PM +0100, Andreas Kemnade wrote:
> Use dev_error_probe() to avoid unnecessary noise if prerequisites
> are not ready like the regulators.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Applied, thank you.

-- 
Dmitry
