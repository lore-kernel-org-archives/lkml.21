Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795683483;
	b=R3pEvCXKyeKqELOmlrOpeCUMyJsE+7fhqKQVz0LeHeiNcPV1rei0Al3Z2V3ccVRiDWNF
	 h2FLHwQXCikrLBdzQB5kqMmTqh9rth2wyLGk1yqCrRIZL3n365FdSOR/qp2Pjf+G3FzWd
	 juGwraBDxp/GPJmmUC2nIk7hIqkuW2I6wY6395n83mecgpMYY/qAssCK18t4GCTXGUUOr
	 sFoiJA4DCWrsYmXyaUNutWxZ63atyJ6uOBGkKrai9Q+/tRm3hEj3pbuQu9YNXJKlNIvgz
	 453zcP75Oq83fBFKk9SCGxY6x539NqoYDZeFd9BOZAkQPVIYuxMNlDvZ137xofu02Og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=YIg1MlMF3u8HPPAvDDKpapxWNkVM7jyo/FfJ8kDzLF0=;
	b=FnuXBiZEiIWfV88izSGBmX/tatbND8l1QdwkxzczsrGcqzWby5a5jrpP1yi6ZD+L93sF
	 QvkaTDvmZKUJ2AJYqkGCCIjKT1VmIWCxTSubBQqQ4dOKl5yUDpOSEFUHd9S2EwPhsgu25
	 dQt6/HZESguJei03r+TLgY/5NBHhZO4o+kmjPJyVmUpigSemhORmKzZ/irX32e2QLMWIi
	 5nX4Lhx/Jc7LQhXj4ry1pqFXJpv3bW43RmkawFFVls3BsJRhYDIPk45UR+HVOMfQst++h
	 vUaNPTf3WYIlUwSZ0L1mJgTksUq4nP2Y/S8x3/w0d7agVxCKWnnVkCxYHHxLw0Zc56w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrAfBUqx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760FC606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:58:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760FC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jrAfBUqx
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae10409ceaso6543571fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795683482; cv=none;
        d=google.com; s=arc-20260327;
        b=YsdZmcmcnbEaahcK15ILyvIqhvGBjzoiVURIcWPSwS3BH4IOVHRmKH8H1+Qn4VuMYG
         cHA33lxNN5z2/eLzpPjJyD26KxDoSe9Hc/EQLDFpCpwMSf5UynKFCsSQCvvpHa0zPGCC
         Y61hLlbCx6tEM7H534N9a/hfceAAB2AO+inLjlD9/9+QFE2OhScmqzbgCCWrdO+mewQq
         CWUhaYMvLu4CsjTRqRqWMe/cbYu00qqr025033JnO/QOOraliOMwFoMhkKEW3I/tGtcC
         5HyEvymCp+4E9m/USZ1UpOuyjIKHD+u1ZV/CIv0NAc+sZZxWrChPhshjhTYasG7p8pPg
         AN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YIg1MlMF3u8HPPAvDDKpapxWNkVM7jyo/FfJ8kDzLF0=;
        fh=Utdc/i/Dx1fDYdIlNxy3feAkeD1KemzI0Xcq1FDtffw=;
        b=dG/v/YIuIalJhjtBKF/BNw327Npvrlxxp+avvfQ/ErTfS/501uGYXDtH3CcL3Vo7Eo
         CXYaB733cdCAG+3fy6ZvSU7+5KIsy0i84kw6R+xpvhSjmWh83A+J0QHau1j9VLC3Cp+Q
         N0947ja5Wk0b6dC5G+hGHrid8TDBTnWzznMd+QC9JXRDHOfKeftLS7uF9KOjmQofFZYo
         mQrrZbyc7z9EXFpHkCmrd9h1chCHXBqjODUMWU6cOg5S3yy2agAbkOpe6mv5JcW6qEkR
         xwOTdoVsvwWrsnBOhsLT0im6spZO9HBPhwO64jCcfoIXdHS7H4DnJfp0n62rqq0SLT75
         ZmgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683482; x=1796288282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YIg1MlMF3u8HPPAvDDKpapxWNkVM7jyo/FfJ8kDzLF0=;
        b=jrAfBUqxTPRrUwm9XyJ0uv3lp4bWKmBCrMAXYhMMT7as272YN8v+jHYsyOtLs4YX4h
         LCfJQdFaMzGSPOFJJCAd0IQ0Et8Msvk5zgjhdxLiajy6OrdeVCaqU+Y6Br6/u2S1F+2F
         r0VViiuZ/lMJxscVUet2kefXChLLsN4NxLB6mPy/cRlicAokK4fQIS2h8ZK/t8J0pA0i
         BxErLKSD4fmUm2zYVOqTzWIHYkRJGJk0VDyKNRT0G1HGyLkbPAQDSSHYs15tKNkQ2e0e
         m31nEMNNSxfsspWGBZDSiZjoPvgefhfh9/ZNUQLI8lUv3E704CW0jAGaiyeiW2SDRbbv
         URYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683482; x=1796288282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YIg1MlMF3u8HPPAvDDKpapxWNkVM7jyo/FfJ8kDzLF0=;
        b=fzAQOr+1VEZleE8Mw/MRN5JeBZ8djG+xXrnUxBrmssDzgv32THPVM3QEzK/aVLAnke
         Psrup4sspVnHG3mhxAIQcPJxgOvXC0oteHSf+xBj51MU5TBsvwMf98xLAKI19ThvHnuu
         wM9gl7/JSWu/yR+rCN93GAwhIO9xyMaPTyqNOzWMV/mI1R7ovgkZ2tB3ONSLyPDPM9ax
         chnjZw1Atu/EfpwjqSs9/34APa3SIT2SyOUiEaikflj8V5UkXWXnil5Bdb8iPUm46Sjl
         e7lvZYwgtQCSeSyrYE6u8rG6mD0wHnWAkwG5VdXyROtv/kUjkkcXCxiI6nKgN2Hwn5W9
         uyFg==
X-Forwarded-Encrypted: i=1; AL+hErHDieUevC54Vd+hGfo1LNVzP0TwlL8jXP+1OYQZkXkz26DbdOMtVrFqjTEWm4WhVwXqclcp1NZ1y3Kmldg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CnDDeeHlNIBXdNYkpp7ObK+STnYCK/SDzFoQ857ZGI3mqxHkW
	aOQP3nMYSwQGBxOGoD32OnhrZ+HT21Nq6oYJ+Nxy4sVcDrFNL0OlfvvSoJr4lFxC/QJ8abxRatd
	VFzka1VNgl7Zxa0GHi76HBZjgrcnuxn0=
X-Gm-Gg: AZFdTZe4OpnkwLzGaicOytWExTZc7btQbph3IBeYXV0lF3izJYbvf19e+FuxSVXizdT
	uArjNBc4Vi4ak+RK1erlTaFOnhWO55WmJNdnI8Kmy0eMPmTl1EWIDho0iuZdcHWnZ9ZdJX8NJvB
	vPmMynrHyQ3iOfa44SK6VauIed8ALyhY6+6wWSL9hBIW/AXIIOQMNiUIb8CPRiO9UN0UDIAyPDa
	L44cJ4KchGlaZvksE1cP/TRLrpUVHG4K7TZERkS6sB1Ndbr78ecxKK32+QZdk13A44udTPIkb94
	zfrOhS1B3A76UlXBFQ5V7HXO8RjWdEc0ikBSW4qDG0JmanSglsaKwzPX/28rLKRsdjvmXKNVP87
	qw8HMujO6ZWOCJiifdcHlA58TTH1rDFo9CzpHAwMfBhfJKlTKqYik1jjDRuxlmVqCIq8ZAnw=
X-Received: by 2002:a05:6512:318d:b0:5bf:d00a:b6c0 with SMTP id
 2adb3069b0e04-5c1bc78eb99mr7714957e87.3.1795683481551; Thu, 26 Nov 2026
 00:58:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-ecc-p521-small-scalars-v1-2-7b114f076b33@gmail.com> <20261123033705.91056-1-laveeshb@laveeshbansal.com>
In-Reply-To: <20261123033705.91056-1-laveeshb@laveeshbansal.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Thu, 26 Nov 2026 00:57:50 -0800
X-Gm-Features: Aa3M54p44oBlSMt_NseT8QNw9zL5o2sUlh_BC7KfHA_Wix_VB7brgmTVGhl3_PU
Message-ID: <CAEy9hNXzvwUCUHkERWgq+ziqqj0K4ttS4XqmrpYKrc8K=Ma2FA@mail.gmail.com>
Subject: Re: [PATCH 2/2] crypto: ecc - Fix P-521 scalar multiplication for
 small scalars
To: Laveesh Bansal <laveeshb@laveeshbansal.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@linux.win>, 
	Stefan Berger <stefanb@linux.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Erwin Pawliczek <pawliczekerwin@gmail.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for testing. v2 will add the k = n line to the commit message
and a KUnit test for P-521 key generation, with your Tested-by.
