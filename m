Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795187718;
	b=yCpXKb2+WAdGB5sh2lxHSwerwRORj0wf79swvh0HN4lIWccfAGLGTzi3mV1icZbS3oVn
	 7hfV/uSRPsmWe+T0jsrj/fvZRmjElkBRvMX+acPj5MHK5ppuePD3ij/2od3MWxL6ioUZ7
	 8nT1vlYlN9mo+k6DHL6e7/DOF3qTmRc9yZ9BzbCGl1D8b9TkUV+U4M4O1ryp4UmHhT5Or
	 VQOrVTDqXe2zB5bgWzTWPNHHgajtj1AM3sIXpOpalCKL/Ec/xpOUwpHaIeG7Y0ls2H54X
	 OnsUmDi+4hgt1B/mS2ZxGQJlBxCayNuLjnbrWXWUeyU0i8xhSel4h+dbXlcCx4owTYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+PMgx4pqXLlAAf284WBbeP+ZtkTL8k9uBtgLQ7cbjKo=;
	b=GPd84I6yvbBF5zXs79ErD2k7xRRl+VdpJzdaEm5PmBc2q+oJ9cwqidDHCGd/tHCO3WN/
	 MO8c8ZrCj5SttV1j7aeDwpzFzF9jjO90T8lIMVFhhdJbbeO90blu7UoPIjGjKybbQFw12
	 ppnIWwmAYLWK99zYBppGD1X8tlNi88QKz4RtKaMDDA5Ihlw4XyxSdnJo6ceO+F8mbQeP2
	 WTVpQRjnUfOYmynj/sPGi8+PJ0Oih69mFH+U8uAQPJGOvEnc4tykfqc+L+MWzwIVokB9w
	 Npq69wfE0hli7ykhYQtSYB7Hhsgb3AFsH7ehD9FUUCu+Rqqq4Eg6OFUKDU/hBCFzwgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WB6veaaT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3907606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3907606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WB6veaaT
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b894d9a075so1149998a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:15:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795187716; cv=none;
        d=google.com; s=arc-20260327;
        b=lAou72WBCLHJ3RjunHvGyOI1qjRtchwA37pniAR2BdKBb4A4+8dW7Am/xsIKCfr/v4
         lnymG3abCnSbB2pExtrEgaI1FYCxN9Zzn9nHatO6q6Dn/mt1xW83b3peyGl+9792Jx17
         Pmtosc+9H7sOLiICvf0ZHBorE+tIBIrx+LLA2jTOEG5+euHyXrvHEUjInfUrkVpS2Zt7
         H99lBur+ScAmNnzJcfHQdZLfXbVVhJYlDd1RF15XJ/H6eK67Mi2J9CqI1uMwpvA28F41
         aBqaa+PFfNl/UxpfXM80se3F04dVXQ56RUPYtKqJEZhyX7OaeaSMDLhYA1RTj5oCQmUK
         0kYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+PMgx4pqXLlAAf284WBbeP+ZtkTL8k9uBtgLQ7cbjKo=;
        fh=ImnIK8QyN+Pd6STqJtOe55x53fgvr52mSvsiIxn87zQ=;
        b=hOSXLFDNvCaaO2GBG7L3lu0J2yuAdVOvB+iCkqenO0ccIOcBFajMVRga+szsJFjvwH
         twEet6W8rdMV7UHAywtGPIBhNpICpaGzc4qJ2llrOVJXY+5uH8mplFm+4hutn8gBzyJS
         A+MFnXdxCTIppN2TKu+UUXHSa65W9S5IKjpKNJhI9/24WlBUzFn7HRk6rp7MJKMGGU0C
         K+8+UN8ith9KWxek/7jbwkFcPG/u/RLDOQzJEkC/yoH4hMN2NhqV1IjHjQtfb6jvDXEu
         M/ulJ1LKNg+oXQ50BbEiaWClhB28RATGu8KZDz8r7HRdDDKCmyJrR2ci5Q7j6ntTj6m7
         eVVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187716; x=1795792516; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PMgx4pqXLlAAf284WBbeP+ZtkTL8k9uBtgLQ7cbjKo=;
        b=WB6veaaT7RD6KXcb4FqtmeXHtv5W/X9xGJYDEGOMSVxam1yIpCuTjCg5pRiQbqFjMZ
         3bhdNk5JPtVQQmso9lVZDuxFUviFSzN10ptFZrUkaOA+9sAqTwPVQ6qaePSivqT+NfcG
         p8fjKrnua2EQdl/GVeB+e94SAgIoKUy3qBJPd/c7SnOwTY/nNRsUX0/bmzwkWkI0VJPB
         dnX/nSPgBoj5BRjUmSR0ANL2F1BhoLtEswxF8nyzPqYmpNUoYn4CRGquYinQtxscBMHH
         w7QqMpYAheZcTRm328UP0sj8yOIpaLIXBgFVj99wv1h+CB3Sp0ppP0+wjqraXewczOLe
         7liQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187716; x=1795792516;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+PMgx4pqXLlAAf284WBbeP+ZtkTL8k9uBtgLQ7cbjKo=;
        b=YVyTaS8GkX1KzdCtz5rfqW2N/L3dvZp0U8u6kMOTAdZJYXkpikzYFmex1sDqf3Sdd9
         aQPArosixB8Z5eh5QmX4RVjK09AtgHt8+e45dGUP4fict1nTQ//PHR5Ol7+ib0RkhPJU
         YjwqVUWwp0HDryTsPD0bCvKPwcKzqGjFL0YjXvx5GW1oBc4wABUa260nhXj5FddIhehQ
         CYUuIy3xLYFW296UiPd6/yoTAboBRXLOUDcmPbBGN692+8QzJ3aD1CMChW0kIq1c+c5u
         NT7CjolhrZlAmPV+A1FlYwuTvYUCogUQ+4xRz9Dq6p8SWHRExjCF2lSnNWWITXBMlZFm
         G3yw==
X-Forwarded-Encrypted: i=1; AL+hErFA2Yz+zOCALSd6b4QfGocqg5d1WTZAgio7NDKMB2L0X/uokPNJqlahiDejK/RBmNP0Woy6uZesancVZs8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xgGBcTSY6NNUhUbJ9Vh8Yxukz9rezepnevCmEVQk58/USeuLF
	ThuLfKQ/K2D9lnVX6qmnUZkBcZfd6rpbomnBi7NvtbjelUZc2dZrVUbuXs6fbByNBSAjAlz13j1
	ChHedbNAwBBE2l5J9yCw0v2xNbBrKBi+rq3NrpSQ=
X-Gm-Gg: AZFdTZfiAcP4PgaqaNkR8+W2YzGiVFq2vHLbqJyyVdJwc4H3CyJc0etFzWQET8o3Kpn
	uJWaMb+gxjSqwWLGj6GSIjuYr+oqSPfqdCnefWQkh4CGNr/gswTCfbPJHVGoaCeqss78ocfMoZ5
	yVkhs1AUfZCq7UIK3QmoseTA8FMiCZP3ePSEu2dcQ2j5/jKUQnk//GeGStDB7+BSb/XUTltc/1V
	IvmTEwrsdtlUTvz07S8OrMoFYdmgxokNF7C9g/zCAs0dR2Af9YGTeT5uV3bdHYxReb6lsHRCPNx
	2su5I1zC+wn7x7H+AHnKWq9AXDqbEyQE8SdbYiXmEBGEhpdaws+bMAH++Acyzs3P1tppbdsv7ow
	x9juFOKZFgQf3jlW6R2P8NNU46QFFsrQDMelGV98=
X-Received: by 2002:a05:6402:5516:b0:6b6:ef7f:600d with SMTP id
 4fb4d7f45d1cf-6ba37e74244mr2491665a12.21.1795187715950; Fri, 20 Nov 2026
 07:15:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAFnufp1LcTCLtCrd=iLxD7DPaOouov=BW=Scj_yXJ+Pn96RKLQ@mail.gmail.com>
 <20261120051457.47753-1-dingf3ng@gmail.com>
In-Reply-To: <20261120051457.47753-1-dingf3ng@gmail.com>
From: Matteo Croce <technoboy85@gmail.com>
Date: Fri, 20 Nov 2026 16:14:39 +0100
X-Gm-Features: Aa3M54pn-HG5H7a41MND4h2x3VzprW_q2-HWoQeLPusNnhR_Ijaw1bfAmJZdQ8s
Message-ID: <CAFnufp2Tp8x-wddZBpvzFP7brKWU_b9A2kFN=84x0Qy8K9uA6A@mail.gmail.com>
Subject: Re: [PATCH] fs: fix overflow check in rw_verify_area()
To: Ding Feng <dingf3ng@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 20 nov 2026 alle ore 06:15 Ding Feng
<dingf3ng@gmail.com> ha scritto:
>
> Hi Matteo,
>
> On Wed, 24 Dec 2025 at 00:28, Matteo Croce wrote:
> > Following a discussion on the coreutils mailing list[1] I think that
> > this should be fixed differently.
> > I'll be back with a v2.
>
> This is still present in v7.4-rc3 (65e4fd942). On a 100-byte tmpfs
> file, a read that starts below LLONG_MAX but would end past it fails
> instead of returning 0 at end of file:
>
>   preadv2(fd, 200 bytes, pos = LLONG_MAX - 50) = -1 EINVAL
>   preadv2(fd,  50 bytes, pos = LLONG_MAX - 50) = 0
>
> sendfile() with *offset near LLONG_MAX fails the same way.
>
> Are you still planning a v2?
>

Hi Ding,

I think that the only solution is to create an helper
(rw_clamp_count?) which clamps the value and use it with
iov_iter_truncate().

I'll prepare a v2 soon.

Regards,
-- 
per aspera ad upstream
