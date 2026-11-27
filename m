Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749254;
	b=g19OOyWsHqV5lbm9YoDOSBWqJTAwROo7YXK/KsK9kCrCvkoHE1z8RW9PwBzMY4q2WUoK
	 qouMV5iT+iTAPw99yV85UfQkuSm2tVgYPcgbPXftXYaHf7LCttHkiF48eiJjmZEO8+9BI
	 zb2nwCoJ25CaWH8VoI7OacaIm3SPcvwm1UfKNVwbP2dLD0oGFYIpYoYBw+wCnEW7drorn
	 XeOgH6u1ICbQ75b7UJQ8ebeVQoMr3NjsbMdGDDLbmW2kQRhAbFK4RPp2r8FFHQuI+jY+m
	 peiQaLH/4HQKRI8KGa7OVg62jLdFiGAH7oEDbFuXKmXdV6tAIkzSAiwue6m8QMy3KHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
	b=fs8WeFdJCkK2Z4AulOK9hpowCq9eIf5EPk7JPd34WnbCNaiBXv0bIp2V8CSkwJmavo49
	 AuYBzeu9UBay+sv+NIkU0AU+6fG3yIYQziMaAe1mIakI3mPPaDJVit4bX55pf3UiZaLUS
	 sWTpJBzEly3s53N1IX8z/FpPWCGm6F0CA4WpGGJf0jH45YfUpz3DxiQJNI+MiNE7INlYb
	 uAYP7rcQvbXuTwfoTUmLpCXHNxHAg1fmvrBKFEpRNGKo6pa5/+FUlrTZ6+RtgvyyZD4LM
	 PranS6hb/5V7sSH/uFGrwYIRT49G4OS2wKE7aHAuKe8hXuQpA6pxZsAH6fhFTXZnlmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kzn4P6HI;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A47606A324
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A47606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kzn4P6HI
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94961bfe1a0so484623785a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795749253; x=1796354053; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=kzn4P6HIOv/zbYwhqG11ovEs8UbbLBUqqnN/DzSK4havfCIROjjWcg0BrcBmJo85MQ
         NPbAlUHSbbB5M41z/0WQSyM5fe2XNDZr0OBZgvZ8zx8+CcyQmSe207HGqcy8I8oiIPbp
         I4B7PoCSW+l2RpUL7Hv1TUKMkLsYLMlzfhaYbVudYzujMd0rb5RM2nfwTqZH5TlKxW0P
         HpEX8trpfurG4Z1t2A+O7R3SZdJQvK3StKsjR1Ec8GCNLG0AjS9r34Wer23E1KoihaPz
         YHVtcYnVFuWk8BVoztC3faEVBHll3EzRi+fgo4KU9nDu5amo6isvkNrJ4MRldH1yN919
         /wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749253; x=1796354053;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=KWFe7+4kEQAI7tws9iJggr6QCRpxbb9maykjj9hkwgiOoIaaRucwlatHJqavDnivkC
         vFmwzd0BMw0aRa8gbtFeGIznJMGzCcd+Z3Jakqy7gEFFjSgmgGv1EfH5MfDZpVnOGp29
         3JangSU4P6AoxDUlNhI1YCrkuQLP2BrNxeYVxJLS6h5facJYpacE7Qg5/040HfqN1rcI
         EKiIPMV/XXpiZEKVC7bovWdQ2DrhlNm4L+S3+rIeQGVnw/4NIzRoKTd2Ko9njUGO9H5u
         LlcP83Ns2fSMqaekCPklBF00ZuNUjzD9l82ODN8pmM5rmsZfwHgDbLrAI/bYLe1UAi8L
         AWXw==
X-Forwarded-Encrypted: i=1; AL+hErHjNeDcVbQp9X9mscmLzYMcwPh4cnbP0fTWN6UqhLJi6sZ8vY9CxvysIQPQxsdFHQsGSG8yK+F/bV6uUf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RA6LEqxYVA5KePioXfTwaFSK2TY4Il0ji+b56iAcmBRWk4iT/
	oNS3mnApBhrGyRjjWM6x5ftsT9nVVooFs+MrdhhTLOVlY8Algxwt7EdGibvlJaX8O1o=
X-Gm-Gg: AZFdTZevaNggLt/WdAiJC0pJUFzHIKSdfWPCt54ccKBtH2eBejTzQFRMhLfJHVOW4kT
	Tnlbis7HE6XUNh4f9YOlLkXjZ0DwYRu8O+2e1xvP3sxUPCtJf4U7Wr/L536t59pUS/q6SMdBPHw
	JxLNPc3dpB+ztqmB+hfJ/TApj0WOBQoJ7GxuFUGUtWrBjWrJ0DFA6wPqiIPgFzyQBKeP7/jf9zv
	K/Hnx3o2qwWF/2rsJOCnLySixv/uRKm7eyOcfVB8Tmt3YcpTxcryJ0enAPxuAz+yHUzGR/9veHY
	Rlh1QllbwB2mSzwtm29I0DJau4kQz30PclHK5hJXO52Fv+xuwi7Vy5rL5HYLzp7yK4JlXCgWBM6
	GeLJVtL1k7BWDEW/RPtwicO7hTo836nM/nOjD8cb3h/UgoEN0+VVAptfnpDr4eEi6Vf2FRafgAb
	no0vgWQopXxcRlRymklnUu2Ssfyy+msHim4rw2oyFUVFS4kiMEeUCissa5hivY0a3DZURuywQRi
	C2CGZ9n6Luphg683NKc0wXaauU+1aEIQzD31+Bgu23ayIL/4LsxJhK95FDcpsrtcH5W1KvOH/XA
	IkQch4PLAxIDu27Hus6QXsE2fPNM8VOz5Fc5tiJTMa3lzVslZk8NyJE=
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr3894266285a.8.1795749252644;
        Thu, 26 Nov 2026 19:14:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::5ac? ([2606:6d00:11:8ec9::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm1733363985a.5.2026.11.26.19.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:14:11 -0800 (PST)
Message-ID: <1f649c8c2c08c31f1f6ff7d7a17ea02301d89579.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa	
 <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko
 Stuebner	 <heiko@sntech.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Date: Thu, 26 Nov 2026 22:14:10 -0500
In-Reply-To: <awanusdfmrjYpdHT@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
	 <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
	 <awanusdfmrjYpdHT@m3>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KBWr4qryrDMK+mhbuy3u"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 10:17 +0100, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> On Tue, Nov 24, 2026 at 05:16:47PM -0500, Nicolas Dufresne wrote:
> > Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-core.c
> > > index 922cf74c4eb8..384ff77771ea 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *fr=
ame)
> > >  =09 * According to the spec, tile_cols_log2 shall be less than or eq=
ual
> > >  =09 * to 6.
> > >  =09 */
> > > -=09if (frame->tile_cols_log2 > 6)
> > > +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
> >=20
> > Shouldn't this be 6 too? (log2(64)).
> >=20
>=20
> The max for tile_rows_log2 is derived from the spec (6.2.13 Tile info syn=
tax):
>=20
> tile_rows_log2 =3D f(1)
> if (tile_rows_log2 =3D=3D 1)
>   tile_rows_log2 +=3D f(1)
>=20
> This is also what eg. gstreamer does. I will add that to the commit messa=
ge.

Thanks, note that I was also confusing AV1, my fault for hopping codecs tha=
t are
similar but different.

Nicolas

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj1ggAKCRDZQZRRKWBy
9DsUAP9PRVkjRHpiRiSLgzM8l9UhjnS0sDzgmwo4BJV1vzvvAgD9FAmOhu7fqhJ0
E9UOn92W7ZLiKmduKFmpzDXkPI9rEQE=
=QqIL
-----END PGP SIGNATURE-----

--=-KBWr4qryrDMK+mhbuy3u--
