Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695590;
	b=wqt4vucoudIH2YyLJrtsXFZN8ei+X4cf6yTvvD7O0sTTmqHdlLTFGQwJ99BtbscomOL+
	 WF77lDmvpQGVkmGtLoP18yFwWRzAvT9X1nNyFjoIuN++u7EYce0Mb89SCbzbS20rnnyR3
	 XAC79IaibLBJH5pYsSHH4qTEr6Y01tL+oknlkVDsTQayhLyqfHZsqgffJ2Y3XMhbW9OF4
	 0XBxQDvPGeAOgXEmYAKFjVsQN480gO7K9VjUW3N8ApyhZes1caxkEkWjeKPGMldUpSund
	 xu1EuyXJIE+w/aSrr2suDThgJmAQFh5CjW3IzCweOLbuEtsgrglbwds5F537F+CkBDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
	b=36hpGSQ6rA8ZKGpCx/nQrRjPDXx8HV0UROSVv5FdtXnFPFclfrPFumKUzXS7x9YMxCQv
	 SrCp1Qm+iY5aeuNfiOAFYe6WGQuBj+vI4Noifp1Bxm9zdVPU/aHW4ABNGo2jZeaZ3Oqw0
	 Uv+EvKkuhPyfJ3Kmv6oYWNCV70pFYb0n/YUU8vmGt9kyRmh50uMXFAUTC8Eyf3TtMQyad
	 +3qidzZxkE8XyxpSP2KsolYZDh+OzM+QBrOX30DUzpZx/sCXy3wNJXk1wfAFqR8UBoaHH
	 O0E+sYyAwJNbpRGwvr5vofS8TqE8SR0lK6aggpJPrWKWe4r0o1uRwBuHLk2wYE0fBEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmBxGrzJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2374C606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 12:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2374C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZmBxGrzJ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4625111eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 04:19:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795695589; cv=none;
        d=google.com; s=arc-20260327;
        b=CHSEQR0QjsYMutIs1RywCHjld5gH+8Z2YITHH6LBGb/YeS3yj/51sB05GTHykLOKQm
         fqF0rd/diDsBbK6dp6P1PbtM4tw5Gg1uQv0XubSyUZ4Iy26YRhLFWYki0uWA8qAt0sdF
         884vmwIqQxSogtKLQHgQV+piSb9LDcKJhOHbw6XcnRWYAENesmWPYpqpcDw1FBwwmtyZ
         m9cYQM9XLJJwJGLDNxGezPNHDDn2iaGNSFStfkbffaf+sN3o8DQTfVdVJwl1J3VS2Ki0
         JmgyHd0fu2ZRJS5ZG9QrOLoibm87ANvtSrD6++ZxwJevyO+fyNqG1eZPH1rPQp2itSB3
         zntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        fh=ixGACzW/PcLMnhogbrGPVrx4NUFu7Q/KRboxUuB6UeI=;
        b=WekHLvAKPr6DxI8od91qljTQb+PxEoLXOV1QG0kpxcs/I5+fT+y+wz+8BFNkQYeI6g
         Ci9zuYdK3I8dIAKMVF2hGottGzDegcFC9q6exAGThLCQ7Wo+A6qvzMx6SHZokd30P7BB
         561zMxRdmx7bK3/KE/YGYTjD16X6pYqdlKQsEQFC3BuFF32iJB3+I9ECxkzRiCj35hVr
         xpJ0DRF+fVsRPbbr09l/rqMB1i1Tq5k8UtfYVLcEpJjQX0B5TgRzg/00dY6Pi+MuQ6NK
         UYc4MbMe+uqNngaJf+pd53KBLHy0P55V5NYcaZw9dGWaiRvnpoEMKRJ8D1hYRTduAHXt
         I5WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795695589; x=1796300389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=ZmBxGrzJhTff5aHOs/gdEmaqTtmzb3cNqrz90ByOV0nsd9sPJVTvPw4ib2z7Xz2U2T
         zeoXuExG6ztFaCDOlqkdQEmEeMK7kF3NEU5rPx8H1zECXtvx2SX7/ffeOQKvQZ7oQRaa
         vZDDRbGBOrawAgXtQ7876XS1JciYFJIeqr79tg0yZUFupgk3irXaVcRXDKYdhGbqI2uU
         K4DSTfkrhdalXsS5yJt5ndgebJqzCOYHImC4VFLvkqLiothLQPNJi2B+BL+2Pkd8Hsy0
         7npPQ979+vZbmCzyUXKxnAcXwyqxDJw2KLLTk5aknnzK+/+CkAjtOXm/iCa6EWAG/HOu
         m8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695589; x=1796300389;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYEewzeGbNDfeOmY59g+Qph2DiYQKE8Yfta5ll+tJaY=;
        b=Q8kU+DHbWdA1vZV0ksnL2802bE97fXGz7SOL2yep0TU92lG2iWjWow2M9Pqwi+/JtT
         Im1VR8hCzuuJaAJd4NwTOZoiOMgxTLrGfamm99J8CinM4IP/wB2FecoBiQDqLVjQNU7C
         RxKNzEW3rZam7t/pww0WP7qphcKwcvosjTTl/U3S+HALGmBxtr/Ul5hs3WKVSNYWY57m
         tF7P5lpCq4pmrQI1OnjHI6tnQ7bXuMQ32WdWY66LNTvxL4pBl+02mCnpn9OtaS43LwBz
         C43bJ/QSga53k326aaKkTljRTLDAHc/HaM28qRuu1hpixnIx3O0qF1eX/v/dWQEbUJOu
         v/4Q==
X-Forwarded-Encrypted: i=1; AL+hErHKfnkpgln1vfWDlsEuM6BFtrDG6BEw9NYukR/AaAMSfDiDKfGLtcgnmKBJ4O3yJktUzygzAPWO1qJo/B4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q9ApCyrLfCDlMNPl/Yd7+WxGg3jkm1Pzxh/6QJ9ZLv/BwnzJ+
	fwNq+ssebExgJTjKaNGKiW3vZDqOyrSQRaGEAahZEleI1CStTJfBYzrKkXQYwSR3kRY0L1PPdAq
	7V1u3ZVWxUwIWdnSi9GBEBaDcjH79aBw=
X-Gm-Gg: AZFdTZdnETGPrFrz1ZYxI+TclzwtML6CBvi9TKdY8O7xmQtsjwl6NA0LHXnyaDdjjHj
	mHpgThZv3tCYstAYc963At3guW1WjtHyd8uK+QmCQbiwWznKn1+OZp0cGfHZAIrCseM56Lbov5k
	VsPY3w/xqcsISgk5aGldTRiBpSDECoEc/dNZRmZyCbR5bAbW99TlWAqBqcN4nUyRE0uHmzXz427
	NAywMSSVioeDSCwSfRLIi5HzJnujxEyj/3kohQ85Sbt1xmcs834lYHiG/c3/JI24DCsl5qXIkHs
	56cLSzrIiztwOQ2+zfE3udOVR+TPvETzjsZ4U1xlyRQ602a/jhypZmBkRg938s29zA5mArJFeVU
	H1Xc39cgnfHb/fWxDrlpUHdmBjLZb3qg5QxBI6rTn4dCLREwyyc5NAz4pcfJqTB1hj61JJ1LY4a
	f7fsXQqZ4DMNksMFAei4RBILwenhw5BA==
X-Received: by 2002:a05:693c:895b:10b0:385:cf42:9b98 with SMTP id
 5a478bee46e88-385cf429dcfmr20910606eec.34.1795695589053; Thu, 26 Nov 2026
 04:19:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115085826.89641-1-clamor95@gmail.com> <20261115085826.89641-5-clamor95@gmail.com>
 <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261126114728.GG38590@joneslee-macbookpro.roam.internal>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 26 Nov 2026 14:19:37 +0200
X-Gm-Features: Aa3M54o45-8oLpV7u0fds3mVX__iIW7iqATGNdrlwb2jFlsQvtadJWGIKMAZpQU
Message-ID: <CAPVz0n138PXP88++q4QXiao-7=nzade=e_jAdfKK0_xsEyPtFg@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO power supplies
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 26 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13:4=
7 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, 15 Nov 2026, Svyatoslav Ryhel wrote:
>
> > The AAT2870 supports a dedicated main power supply input alongside pare=
nt
> > power supply for its internal regulators.
> >
> > Add support for retrieving and managing these supply regulators
> > (vin-supply and in-ldo-supply) using the regulator framework to ensure
> > proper power supply dependencies and power-up sequencing.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  drivers/mfd/aat2870-core.c            | 5 +++++
> >  drivers/regulator/aat2870-regulator.c | 1 +
>
> Is this a build dep?
>

More a logical link, I can break it but it still will be part of this patch=
 set.

> Would something that was working before, break?
>

Other way, it was broken (aat2870 may have a dedicated supply) and now
it is fixed.
