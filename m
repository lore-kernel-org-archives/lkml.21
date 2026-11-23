Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795436984;
	b=romc3eRfoahuHa3B6GCXnEU0W0stw69nTscSR/Ymp/fO4Xd6H/YhufwLH0rYFj7ZCZkf
	 2I0AH3qT48SO5VvUrGowrg2anEn0BUoFlJo3+Dse9Cp67Titqc+Br2eOWJ/grGqgF/AsW
	 BBGMkwgFhjpGKGj6gKeYsTZmnzVDgaJ46l/ZLa7j+/ccvDjnCFAAe9k/0zCBDMKfjtqNY
	 POvVoQREoUODwhFdj6Dw6wIwCopYGq12u0XtiLnyeI2dDeUkxgllLCVPm7dtDmiBCSHge
	 iKhqOAtGgm7tazXNo0w8xyI5MQXJP4xs16flgeGzwGThjprAIqeD42P5qJ+nvDdLcrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
	b=fmRsN974S6p3TXf+4SQolQnlOW1+fbTwOkIRvYcA5XIcIpq/IGfaDypww9X9gMhb38AN
	 j/Hi+CGc8nSwcXid/yswltXT1QhF/B1WeMrwyv9YHe5r05rT0cvhZyR8d2N8wpYSZ+4KO
	 jz20iPyFjYsXsKUxoPo72edf2unSTSkd4CIU52B/4W+VlWuPdm4KZK8MEaq/XyEZXc80E
	 NfXjqQjnoMKiLSirIuj+RH5bnd68m12w/galjDFpeDZR8nftcqxJF22e0fXTm3eBQAWf+
	 3B7B4JitnbQI94exbQWpYBJPbjD3aypg0v3FBJnjPvIZ/Y/1EB+6XMYgnZwUHGkk6CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGHjuIpH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD5D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD5D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BGHjuIpH
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380b40312e2so7811980eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:29:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795436983; cv=none;
        d=google.com; s=arc-20260327;
        b=Mf7JUQ2QcPsb9+bhfAQQHtKs/ie2Jhalmp0MWx5SP6AfYr/eTUoOaPW+aO8bIlDNk+
         //c6auKABIn/J7iRfjCvisWP9xKo+XA5Q4QkSleVD73qW1kY2LL0mkn1pWlgD1gUc30z
         xR0807Mb5RwLQhZNPl9JdAWEFJJSrZDf6SYp/XQQHkym+GCnfNFY9jrXpmP8J+V+DMVB
         BMJhv4t05hkX0uqmeidpsi5+JUfVTD6J3NYuBjZqe/j1/G1tWX5shJnIOyVygzundLIm
         FLK4vF2/PKAHnV+9BIvmawvNIPkLzEMfaqqXkEjtFy69GtQSPbI7cz2Vw9EszW/pp/ls
         N3xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        fh=Zx0gO5rZAuK+f19xZcv+ejyBK5DrhI2dDiAxy6yuxB8=;
        b=A0TtZQYAGwUazZ9U0Jfi1oZymeAw/zRRAz2NkT2+WIVf+310i7bvk8ms3vhuPJQA0+
         aqGyQfrOIYvywZ5mFmL6NDwlG8zq/Bg7uACxG+XFl2N5gGGDxPQjVrPeVzsGFO+a6QUP
         BDHwkFi+o/FgwHAOEFC0KkHtNaRgWCj5JHxtlA46/H5qMB/W7Kl8L3aTrQvJyI8UCkNt
         oX8bNU8ZvQBo08Sr+dY+jy7ejBrB08NFfNnF/8VnUVapzaZxO+s6/+cFwgNxt20iGgnR
         1l40TTzN7/r8TXBZEIAd7XTmJw93BPCYEV+g7jtfI50beCmdm1G7Gyiv8+KUbAe782Tp
         gfKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436983; x=1796041783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        b=BGHjuIpHKx1HmZeK4dAx1dqiNlSjkCcoIWx2fVvjB5cchTDfvhJ912m0xoDTR2SVJx
         3sx0IyYFcmXLHbLBpSfugKiXFSDAZmn/8ccDNz0OaI9SNYR25/fIhnZsoJxS1y0cgiUl
         91FUUtgiT66UoTBLIc7l84l+bVGYYMWvomsVYXclcdTZnugp5VNVOyCs1poFTBTsPTDt
         OUEDN3njepH95rBYr/ETQoXcPjwlZGKAL1JPd5OGXB3xJV2T+tLV5pLNBn/B6PnB+aZz
         4pwkDVmP1CJH0AUcCLZAfLLFjxRqPBEAfWmGhayayLNX+HHslD+Th/QbJ+Ix0MPMIb2i
         PXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436983; x=1796041783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=769kmgvvE4NJNYBz1ky6Ntqci2z1yIp0iuj4i3YhtVI=;
        b=kzoNdaqzp6jJRRerC+Vdlj5PqEJyPQ5nfjjbZJBrnmyYRn0tknTER5jCzpgabWdLhu
         Xg7+JY8QApv4C4lMTLAobRSCcOvCxlhsfo40bKrddkrU4tbCFtKXHYGAEHIp4SoBE+FJ
         AVAv7IiuJ3EbmQZ4+/OGCYYvdEnU1mP/ysI2Gnf+RnyP1A/FInS7FfJQNadquE0ezKsS
         t7y2lbc6ceN9FGPwKXkfh1xSFaAbEXkngjcPdIP4+c3bTVuxfozxz1TXfV5USk8QPxsJ
         3xytVKR7/J4JaSmmLJcau8QgSTrr7vWeMdbHX3tjLPqkepm7i3F83xyTTHXH1auFG2VD
         sqog==
X-Forwarded-Encrypted: i=1; AL+hErET1NLDF72B9yb3UMsSR6k5glyDdf1Gik9/pmlKD/+B4l5qBEyysazVVmcfSV3oTRt9AjZDX4rKVXX9Qac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uInr93WLW4ysmfkf3ZYNnUYQ+vA/Npkpu68+eYR0gdXNOJmfm
	ZUQXCEivc+1znUAGtbgZj82qBEF3Tx9tt0x3ATKpMdajBlHd0/CjAR7f0E1a7Do1xp9ZvCRTjSN
	LNBSkRRkM34dP78JABO7bVq+4OS263HrRug==
X-Gm-Gg: AZFdTZfgrSxfInpiGe66R96ab73SHnKcU7qPNaeHMLuAh0APr+S8u0SCAEXr107qVPV
	PBN02bECG3Bsg/UccVRamvIhx7zLfKatWawLxMasM6Ce/ZAiVlxrlQv7XjFQ9DNDG2i7p3vYrBj
	Yczl0rSyw8I/EZPRc6fubrsk3YHfPwlfu54dn5o8dLtva8z1n59Bs7leJQJTPYMTnTtc+R5h49B
	f5eDL+X7JW2VRAND42JwzdoiyeTDZHCGNE5gY2t2EIFQrrU8s6/FQyD9+41otbwX4y0aL6A6JHE
	FynMZiiNX0qU2BMNaKK8WSJeCEHTnt6k6KDYqtBcoU35Ek8k0UmxiTzX0k7IbqVTtpT2OXKNLPp
	l80rz1pAwJw792FZLYM5ha+9179lBmzSNc+L8M2r7EIt2sk2QS2Vr5aOqaxFH/EbZ2xqw3qyx3T
	3x644dAOKVZV5RKZXZuMY2VOWdsST9wA==
X-Received: by 2002:a05:7301:416:b0:356:7ddb:2e54 with SMTP id
 5a478bee46e88-38570f27b33mr12240392eec.29.1795436982705; Mon, 23 Nov 2026
 04:29:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123100228.77797-1-clamor95@gmail.com>
In-Reply-To: <20261123100228.77797-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 14:29:31 +0200
X-Gm-Features: Aa3M54qdKM7FZvWtT8WQZcdWMo3hSwhK3iAkQqlt8iIEs-0xQqheq2rc7TEhDHk
Message-ID: <CAPVz0n0r7NTVwhWwkWNv21Fjy_pjmWiN+N4HbC0x0++-nOxF9g@mail.gmail.com>
Subject: Re: [PATCH v1] ASoC: tegra: Add support for mono channel to
 Tegra20/Tegra30 I2S DAIs
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:0=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> According to the TRM, both Tegra20 and Tegra30 I2S should be able to
> support a mono channel for non-DSP formats, while the number of channels
> for the DSP (FSYNC) format should remain restricted to a minimum of two
> for Tegra30+.
>
> Implement support for mono audio by adjusting the I2S clock and divider
> calculation logic for both Tegra20 and Tegra30+.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
> I2S clock calculations were adjusted to match those found in downstream
> sources for Tegra20 up to Tegra124. This change was tested on the LG
> Optimus Vu (P895), and sound was consistent with both mono and dual
> channels, with no distortion.
> ---
>  sound/soc/tegra/tegra20_i2s.c | 21 ++++++++++++++++-----
>  sound/soc/tegra/tegra30_i2s.c | 31 +++++++++++++++++++++----------
>  2 files changed, 37 insertions(+), 15 deletions(-)
>

This seems to be unneeded, additionally, according to downstream
tegra20 i2s format does not support mono channel. Sorry for
disturbing.
