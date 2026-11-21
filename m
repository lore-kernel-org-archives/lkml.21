Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795286861;
	b=vouyg389q50vXlEvRUI9u96W91egvwXp+UzVJEv0Oa3TMJ9KlGVRcmTJr0PkHGrJO+HK
	 xOi8n6v0X18jqtBrWLlY08GwCqTpJlT4LC8u0F9OAE7XYG6ihpTg5ZJjrzkpAWlQoEDQD
	 WiV+1ER7GWUhe6kUyS8mp5iSea/3KR77Y5ZUmQ/gx0vg0M+pkMMvYeYWI7e6gyJaQ9kOl
	 eqoBrax4o040LlqDSBcvxenG6uk/0+muLHCNbrhJnXclZiHdMbTL4c0EiZJkeALLfxKX7
	 F44hlT9/ntck6kT7/FmQzJLy/eXwUS9alL3ngftIGTRrI2Qri9/FDch4FIJBmMHz3oA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286861;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=j5jbazIW7NGjz1ZHelHp3m2k+qHIhWXsVf476/9zuiY=;
	b=q5Z4Hk7CwC8s2mThNOJpJujRFtFInmuK25qtjTDG9DvEuQ8K7z/W7QPdVl8LNkNGVWbF
	 SMhrgJUdfJ4afr5SOgRXlCksu8jv2BZ/ItB9vDEFwEr6wDiAJNGED0VTiO/Dgc7rkZlve
	 WryM5Yqg6PTDCXsAgGlwsxDGLgqnH1rP4H/8r/2fCxBKsNweveqpn7yphBfIGsq7MdBVi
	 MCFMY3+le0v747l6Tjm4BA6iyGym7TJbUMPD6GuoyN0dYmxyV8a5gcSgg7rNwLGZBrGUq
	 rsere4t+mtverO9m9ERRCRZQk8ucDJdiT1SpICXNYWgd4pfK4AnibVuzAG/wVuwnr+A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=cRiL+raH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C17F606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C17F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=cRiL+raH
Received: from pengutronix.de (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: mkl@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id AE833200243;
	Sat, 21 Nov 2026 19:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795286857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5jbazIW7NGjz1ZHelHp3m2k+qHIhWXsVf476/9zuiY=;
	b=cRiL+raHAoQqk++HcxGmV09sTymEhkSNg8rMPWyvGgV/IdPc8MFTmh58XLcFHSifVWiLGJ
	Qd3IneHR5ay+85URfYir4zhQ+jFcrEDbTe0blBaH9qpiOCvWKEn71Usx54cB+KugucixJJ
	FT/00xkqG9J6rJHblDmqnPffc8i2VKhSj66G9SxYJx0f9FYrd3LXVRcdMKTYxNzrAkU8oC
	bnkMIsDSSTWyNP3wRa3BURe2UZv0etzFJUPxXCQCq4LmWJvpE6UXFswzdRsJBx17eJ+UF8
	thPJ29nmaqjtta8hTtEuLj3jMUW3VpybJriC3FJNU6FyExAKnJECTZrTjFjLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795286857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j5jbazIW7NGjz1ZHelHp3m2k+qHIhWXsVf476/9zuiY=;
	b=Cu6LwIwvwZ/Gj51W+4xADkng4EmpeViaOgKjqvQACCv4EGwr3pDGAM0MIvOtqkq8qB+F9U
	E8uwZJSFjuu2F+9SGOXrC2VqNoma2ek+Y6KO7nEELO0l5e2BGx+gk5lrxvjwdm25vCqcUY
	mt939LhNqJ85JRwyf2aIHkIKDjyhHtf7o7KJkdNrjkfb3dI1+RTkVYXok5K1D25PrPyyop
	Y2mAU+jQzO2lgIgkjch3X4C+flxO5JiRuYEyPLwInCJFJfyBF4/kPpV8n/iL+lumJCHPD/
	ePdnFNMOsJrJFDWzTbIGlOuwK3LBbbJMT1D9Z/Q5M2wEa/FLwuEWECh0jlbcFw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795286857; a=rsa-sha256;
	cv=none;
	b=bdlvJdxVahFYl6TjiM0JXX3IO9VLy+UCt+OPQAz41H4+5DuUVQXNE66stT2TILuuSHDL1U
	kHC1Zegi8Lnn40T+txo4HGCA25/uCk+L8vAuPvRhLkcSxN76KZH+X427LIDlKIZNx4n3e3
	KQYne5Ah16hZRx7xaiXcWcKTZy06RzE2Pzic9zYW9JHkoXHjjc7vb6aseGqAgDUm7k6M4Y
	6UgcyOz5SpMZpRMutAuPFPpKdH5im+TcPmf8codzdPStfXnkDN3fN4h5h+hlxYNp/J3A8o
	BtsqVFDozuVZl7fLt5uaxmFsxDzqAu3WCmgqGg+U9PjVldxzQFS6aHmzfdr6yA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=mkl@pengutronix.de smtp.mailfrom=mkl@pengutronix.de
Date: Sat, 21 Nov 2026 19:47:37 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [BUG] topology.c fails to build with clang-24
Message-ID: <20261121-brawny-aquatic-ibex-9c7790-mkl@pengutronix.de>
References: <20261121-lively-delectable-duck-f7c503-mkl@pengutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n7dx2nb4hjl25glf"
Content-Disposition: inline
In-Reply-To: <20261121-lively-delectable-duck-f7c503-mkl@pengutronix.de>


--n7dx2nb4hjl25glf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [BUG] topology.c fails to build with clang-24
MIME-Version: 1.0

On 21.11.2026 19:41:20, Marc Kleine-Budde wrote:
> Hello,
>
> current Linus master commit c44104f3642d ("Merge tag
> 'drm-fixes-2026-11-21' of https://gitlab.freedesktop.org/drm/kernel")
> fails to build with Debian's clang-24 from experimental:

This is already discussed in:

https://lore.kernel.org/all/20261116-topology-wunsequenced-v2-1-54611119172=
b@kernel.org/

Sorry for the noise,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--n7dx2nb4hjl25glf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCawHnRwAKCRDMOmT6rpmt
0rgxAQDp0doQnVp3yBRi/+M/jtVlvgsuCP/bUY9POrIw2kJ8MQD9F2Qiw78/an0i
gpnF98RE+Jn0+Z8tgzT+bwoNVnav6QM=
=7N0x
-----END PGP SIGNATURE-----

--n7dx2nb4hjl25glf--
