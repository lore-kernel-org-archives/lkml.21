Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196030;
	b=PEqNz3fKzCYjEJt6XlIgNQpovS7EBSPciY4xvKV7TfnsuzIZjqP6bXMwmJmhOUWHRFRc
	 mWtU/Rl/Ke/9crhxERjBPotCJ07OqKr2IyLVlOOo4qemSg4PchU6Axli/t3joH+USqg44
	 reZ0Vo/Z2ZXrURel+BHfnXQm+JP68Tq7APDWnMuCBtjZooHE1PMwzDLlGSJnYen7Tnp/g
	 76kCJ3jxSamA2u00KYnKbWH3tw+a3T9x2nadzkydbwwLdzuTfv+/oheQ0I8NtgmG7D04S
	 ZUm8Rb+UWz88IBBbdTE7/J6hBlI/mcNRxK85OaLCLkytTUOtPZHYvzwV9bT/EpFxJ0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
	b=N4kkXZpttEos9q4qT0zBviRLm6wzHrGkFCfnmp9XwwrBz1m+6Cyi00hUphj0jttmA5L2
	 5xCLBfanbonnYllijBQuc4UeaSj92Qhhq87TKq0cavBrymiJMoYFacuXqHh+mVKFrLSin
	 MZAyKQZoIwgJA+1L7RGXp3Hq6botDKdakUaIsF3AOKdews3d+7Z6hkTqKt1cASWjuSxEP
	 Tfs0p5/ki59cngOGzqFZdClTnWpSkrMXJj4nNvkZOf69w5nCtGrnVmuxuRP5Ee3mOTWDe
	 EUBnjivEOgGypABqyTN4yKMFT2aWTQby2IMx0WV7+afU6zE4v7ec2M6TBxSxSMfR0mA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNCh40ll;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC42606A338
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCC42606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNCh40ll
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ebf39def3aso400322e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196028; cv=none;
        d=google.com; s=arc-20260327;
        b=mhFazAgrhK8KWtBzN/xK5wgP6yD6lNhcGI7mRf/HWAjIZ7G3OCgAmupjfOKSjF3koK
         GFFmIvoGWmyDVjzQUNex7FTq7od9S1+vfe3pQRx85jyNMp/+YAMt8qe1h2kZngcktdCu
         0lPNpP0EzL2RGCzCVSeJxNuaN0yeSIN2DWH95dq0KKYQ9x/iSqbF8omkvvkHwp6SJnyC
         I9nfr9of9BuyQzRqBr16wBj9PvfcYRYM8MhOzo06lLzEwi1uSF6AGxiJzb+SMiS9/7ZR
         nYp8t7p1KogQX/dOLGIICfEQMbZZw6/FFYf8W7zFLSf1x7tjWeAdpH1YqfXEAsYvQvgZ
         LvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        fh=s+22Dn5ro5NejmjtK1+ayuWMv8ioTBMID892zwhwS78=;
        b=DJY+75bTjFdjwisiWYZmUAJ0ZFsJeLNKkEIzlw7hQPfd0m9X2/vBJRdOzgkWi0WBsd
         BZhkwk5SVvjqO052WXzUxOaQPfY5Gpi5TmLSlkGvlqGKwgrZwF0Nar4N/zfkycKsAjtd
         g046E4RVSlISkNyW8WQikqWZI2Nwx5cbmZVgpJGisdbKLuBWS/gPpHmYJeGtGlklvSsH
         k+ivhVU3ieb18KTL5KbOgBrz42A+v4/QJM/o/nNVLEH/64+uWN4ragtCVObGQi+lbiHe
         D8jHdubDEMhykOl5pTzkeiXemSR0qAAKj9Ymx6Z8RKCgb9SoL20inDdV7FGyTZXuuGYe
         GjKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196028; x=1795800828; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=BNCh40llylyfMoEcn+JRi3qBUCD77xmyvT0e7q6aQlRavrNfLzUiUXvCF8T5R48B3z
         ginbpYCu8l+f+FG/sxK1aBbkDck7Fit3fvqUmSUmU/t7Ax8mBhK29Hv1+0a1zLq15NIz
         uviJKfV8CqclQCAk1dTfgpvO2QijP+mqfd90Xap7w5M2VObqUtBWVdNdqdrdNkruvY0/
         8N5DlZSuzBuTixLOt1XO8eIJNa+PtpSJp25D/EZzyndqz4ofZ5jvjTpaGjpM1ZpNCY4l
         UHJqFd0il/rL29r+82RC/eLc7QLJ2QmqHiZklFYLrcwqVXIw9F5oLqzmGGgOGVAXiPQf
         0v+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196028; x=1795800828;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7VqJxD8mYb5fVhIvZtGeBcvOXArpyTEScr8Bn60wj8=;
        b=kJBCrJFeeH/iQe0ZDky+AY2C7usUwfwbbOw9qsju9FURKa6dd91vbKwhrLKnX6HjVd
         ze8TgMBReO9rwIOFwCJfHMjAfMW7vWUj0N2MrIhA5alclXcR4V/yWevO56+Pi0NjxV2Q
         nEEtyrEEZ6Z9rioCuup5inwCdvPA9fGv4rhaUvQZ11C1/3LwXKf6yx0UsajnuUBMqUFZ
         PVFLHoKcDZZY++lkFFlDynV+kUmKUo1kSK2dZYLjdNv8gdKHSRchB4kqrwVws2n/LioJ
         uDFrBFdWXmo9y2ZKhB1F1vMewKAM+yJ7sjrMeBOwafhfW48LJsZnXKMINozTV/k940lQ
         s6zQ==
X-Forwarded-Encrypted: i=1; AL+hErHj5ThnEKqmA3dFj12VSDbRt4y6aL6Fp/5EmyCVqqWK4WJCsSKPEFbNvhvzTm09tohoqmlMyS5NZpY/dJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fuITfcJ99ABuv/wck1ZTnEktGZCOeNpImrFwXO+WEr9fdh1BA
	6T40LwboB5/mN8s8LC8HCVW8gaG6ue/HIi0TwkmsNfQTzwNZ5LjwMasnhofpMOQDEEd2aUf3EkD
	07NLCMI7ky7E6pITEpJ2ooX5hUjaSP0w=
X-Gm-Gg: AZFdTZci03pn9iMzLngQ2X66oj1FFUGUTr6DlHF4tGtep1ewHEh4bJq7Lv5Mls0ac2v
	pC0VSuc3U3NJHV+9ES+c+kTUuCwSc2g2Nae7XeER4KigqNyDYa/L9p6RtvmngFpfyTovU6SSzRh
	aC9k/Mw5CAs3vxM8yjC2H+YDZz5WwSzsXNw+P5dVjwvRcoLeU5mGXmjMwAWdpK8hFYJ+w06qJSX
	snyOvFZeEc8s/Q1cguGJKsjvO1ExzKRMLI3iZFHWBrHtX+4Rq/TSBRngLceXJILbCAy3Da/3HGo
	elXr0L8dGzLfrU+ioC9C/IbyCFFna+ZlGVtXtZveK3beI8tJ2YvWzxyxIasGpZVcjIQfVbEAY6R
	d9gzFSIKkcddQxxxyyFfrQFxSyAfwXeKDQj8nvNI1GzTUaF6djPB666CV/Jbz9YpLeqByq3fVHh
	Ml2zDoCOHVMiu9U5Sc7rTjE0oyJnAztJdrM/CiOpVkpamubUVW29eMjWdSiUEpIVpvBFmv3lwgK
	BRP7RMntx04PeRL4RUJ4xnUaDYRHA==
X-Received: by 2002:a05:6122:1d06:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ee8af5443bmr1845996e0c.20.1795196028572; Fri, 20 Nov 2026
 09:33:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-sun8i-emac-rx-checksum-v1-v1-1-f186d127b39f@gmail.com>
 <20261119144848.4ddd88cb@kernel.org> <CADvTj4oJ6HDR2k6qVgefUX-h0TGh2n+AO5gx_dcJFzzWML+2UQ@mail.gmail.com>
 <20261119161151.5251fc86@kernel.org>
In-Reply-To: <20261119161151.5251fc86@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 10:33:37 -0700
X-Gm-Features: Aa3M54rQjy3WuSYK7qM4qXKPc456YWlaTnH7_OIMqG9iK55grQSbT34CyqfskX4
Message-ID: <CADvTj4o_hBYRzpQVvAcyP6MfYjpjy84iGxwoeDN59eVTbKszAA@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: dwmac-sun8i: Honor the RX checksum
 offload setting
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, LABBE Corentin <clabbe.montjoie@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:11=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 19 Nov 2026 16:32:58 -0700 James Hilliard wrote:
> > Would it make sense to address the `rx on` drops in a separate
> > follow-up along the lines of Oleksij's dwmac4 fix [0]? On sun8i that
> > would mean enabling error forwarding to DMA and passing packets whose
> > only error is an IP or transport checksum up as CHECKSUM_NONE, while
> > still discarding frames with a bad FCS or other fatal RX errors.
> >
> > If we leave the checker enabled in both modes, `rx off` would only
> > control whether the driver reports a checksum as verified. In that
> > form the follow-up would replace the conditional bit-27 write rather
> > than depend on this patch.
>
> I'm not very clear on the changes needed to get to "bad L4 csum packets
> still reach the stack" / correct behavior. Would you be willing to
> sketch the full series out already, and then we decide what gets
> applied where?

I posted the two-patch series [0]. The first patch fixes RX checksum
handling in both ethtool modes. The second adds rx-all support.

> What I would like to avoid is us applying this fix to net (which
> seems legitimate on the surface), but then following up with another
> fix which unconditionally clears EMAC_RX_DO_CRC since AFAIU we
> need to clear it for the correct behavior.

We don't need to clear EMAC_RX_DO_CRC. On H616 I verified that setting
RX_ERR_FRM lets packets with a bad UDP checksum reach DMA while
EMAC_RX_DO_CRC is still set. The descriptor flags the checksum error,
so the driver can pass the packet up as CHECKSUM_NONE while still
dropping frames with a bad FCS by default.

The new series keeps EMAC_RX_DO_CRC set in both modes. It replaces
the conditional write in this patch, so there's no need to apply this
patch to net first.

[0] https://lore.kernel.org/r/20261120-submit-sun8i-rx-features-v1-v1-0-505=
8fecba6b3@gmail.com/
