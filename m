Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795506038;
	b=nhRZZUI2Lv2xhXBc9GD8A3JPUl1iRUd21+ODwo1AOd2wLipaBKlqUUdF6qsHSQFoetSx
	 zRvtS6XXma2AIgpwmM4CwQy80Xy+n6maRqErj9gLURe2BNYrs+BIlEiW/bRbwGP9Xc+xy
	 dP0hL7oG+3POVSd7dTgUEXgOm8VtWiUYbWxBmNzdDS88XAp++H7QJ+Ajml1QPQlI1jLNG
	 vNKm5UTNz7bmQQDXWPwckvhQxR93ckToy0h2c2VcJs7IjwnnAQDjL616vRLwX9t08Ry36
	 jhxfX39JCzLW9C8X+R2yvHMzBOjf6VvOIHieD5bA7Nkm3K+yybWvztUiS3Z0YQ+XoVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795506038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4CXeOR2kr0QWxwXVJ8kgxv8jpZ3ULeKkBDrgo80WNA8=;
	b=hZ+59t/7VAg+gWY3aMJ0hjhend3EI9bqNpSLq/Odz3I05hBSDoCle+AR02pZBYv8lYnq
	 9Sk0gdEIccges0C9CHVk9FmxQSlsRcfEwZ44m3IVnWSYh6RSVQk3GbmNTQZpTUX4sVIgn
	 tqqzbWYB5JXTPoa+xzWxkC5LaZ0Ee56KfOiiLHTBKcQyszJDfUq2TMwl3+1AHY8Bdzh/T
	 schvWodQw+X1646Wp71UPWwR4BH0qMmz73bq5MdHjSC1RdAm8/9A3xjsKW8SfO6n2UfXK
	 Ud+N79ADIkgZfD1Avi2LPufYhQ+MT4hD/IcSqsMeEJWWx+ZQNX1uiRnNXYrLbzW13Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxkH3z6S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97A606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 07:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B97A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oxkH3z6S
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so4304296a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:40:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795506036; cv=none;
        d=google.com; s=arc-20260327;
        b=jHDes0Luu7kQFBZIYSOMzwbHcSk6mKtJ6R8cXH+UaxuLD2Im+Q2NN4HW6WJFRFamM7
         63UuKN52qmkiSOGPdkMRpA0DAqTqPw2MiFbwunhkCMhJUcT4UU4nuh2SM6RZgcGPUnp0
         dm37bD5YzIlhyjAXaBL8i7wyXikMIkMLh+TpmEHDWWf+DGPK43oHrFsRCnj3K8Q/80iw
         bhzmJfKUaLlfq6jguIDFuHAdeyoagLWih0CXpYqMfrVwcgZhuEJz4RX99DdrSm+DbpC2
         m/jd9TtKsj9yPP1yByS7H5WXUZKPfm3IvLBv784KAC2B14Tf2j2u6IOwb7dfAXQPKHQn
         QqVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4CXeOR2kr0QWxwXVJ8kgxv8jpZ3ULeKkBDrgo80WNA8=;
        fh=LTXH8A6MGzuGQHx1qsvUYY3oLkfPLLo4fvicmwHe3ls=;
        b=Zv1YOF5GvtU0gActiRo6oy50TMHFjHPh4H71mQLBwTymP7wAlSsy9HcbLyi0oEbvaG
         j3yresdiNJRgWHOmQpb1Wef9RJiqoSoKJHpHczUj6f8MeAEZToGLtM8Hs9/TlITrMdDk
         HTxQ5qS3x9uvo3n7Tr2+hVbgZcIaGOLYxVeheKHwJMti+wH1Ri0v42H3waNbbiffG6/f
         AARvfgnMwNVknhqyadhHksodbbacaLBz+pZXRRcBNItlCpmaICtd0AIgyzrB68U32gvT
         w1rBEwN7Qyss4u2Cal5CKO7SRT9e2IF8rGEF1PSdTN1yrcnKEvMv0RR0HDBjwFZR4uyu
         X0Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795506036; x=1796110836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4CXeOR2kr0QWxwXVJ8kgxv8jpZ3ULeKkBDrgo80WNA8=;
        b=oxkH3z6S5oobQJgtcXfQH0GuAqd/cenjkfGF1tqjc2+bcqwAyKj8T7knhO8Wa1HZ8J
         uHfRO40Eae11V11jsAbdsmulEYbPqQhxYRMLo1h9iaHOAO4jYvm0wj0QlDzhsxzvvxSN
         I5pFOem1W3Se5Tbtt8oQA1wjRqxkCkU2/v1La2JpxDv/tFUTE0O5Ws3eaBWAJZrqe8a3
         ARZvrho7IB/gJodkTfuzAUlT5BqaCnVdmjMEHe1Ys8XmrqZFl8aqpXNQcqzLj4N24S/w
         9ueWzbVdR8tQh8YGttAdCgtLjPNNCKA2Z1Uosr8S569Tg7/c3OBwQfq4sovDsqeJ3hXl
         B69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795506036; x=1796110836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CXeOR2kr0QWxwXVJ8kgxv8jpZ3ULeKkBDrgo80WNA8=;
        b=syQh6/PAu7DDQzkQ1IyvH8H/D2neryj3eS+tvCi2q8bpSUe0R8S26Mri0aW3/O+iL1
         lAHKGVhtfgI0OTmTxc4dsklzRnXRiH2WTxPDz8HBidD1twDu0RielMI89skMz8FMK45Z
         tc4jlRdqKzqGjlZZqG9qHBlG7nZvOPZcJRuXSR4klZeh+TxoZgVJFY/YWiUy9uIGLCpa
         2Iez+QS30yz1mJaAn7lv/g1DCsvklbmoI6eMdYncLA1sN5HkkjtMWW6i/TXeTGRK4b48
         m/UGOoCA6KRdfWGUMMTUfojW0GzDiahJDm1hP52H5dwVkMyVWr5WpIAFiCx4zCFtwj3n
         +kUw==
X-Forwarded-Encrypted: i=1; AL+hErEVOR1bx7temES2HKUiY98ZZGG0GtWysmTkVk8JFuF4QZhONbD7jD6dIdaoHtLhZqkQTSHg0xE0OnyxQcI=@vger.kernel.org
X-Gm-Message-State: APuU4Z82ErsyZHS5a5x1x8YCbTM6r9vWJUD9OW2g9hJUBFmzTX4znMaG
	o+lPm8nL09iNGNPUcw8z5SSF0cmaOe1s3tAh5BI8nBFvRbp2rS8YZ3N/qxJzUMV0lHICQfyM1xa
	SwE5MXrba/zpATDejdoS8xNdgUn05CtM=
X-Gm-Gg: AZFdTZeOm/nzwQuEVjMw3dnJ3LP9ASYGxtuaOwDgkq0vKSwM3YrhK6rQhO/htoxITOE
	LAWOxiUVf+cWrusLmzR5gxuIzf9MdXy1krNKJasOY/EoN1syz0c01aTp3T8643/pIf1qf94mWtF
	mP2Lx73OKd5nkFsectAG1bxPt/a79rl+NwwJonb1vBXpeWvIcSMd6xNqlle1NCTVu1DwDqlqrS7
	9sqcVTFV+IJD7fEOSiq4jdlL8j7DFZu09txspG79II72TJkM3KwUg7rCvdoWDFmwY24F3PKG2q5
	wXP/n1TvyXz3XXAXq7GGXTKfGV6lk5snT6UIRAmfUThFuXIDoM00lPJWoHd15H7Cwc4y3syiU6b
	avi/v+ZkbrWHIud24gPs2Tlfo1aBU51o3P/nWeG1WlDHvN9HzinXDpb8TdJI2Cg/cYW82wqA=
X-Received: by 2002:a05:6402:90d:b0:6ba:6654:6a6f with SMTP id
 4fb4d7f45d1cf-6ba66546ba7mr5596605a12.10.1795506036198; Mon, 23 Nov 2026
 23:40:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-delegts-fixes-v2-0-960ce0fb2fed@kernel.org> <20261123-delegts-fixes-v2-4-960ce0fb2fed@kernel.org>
In-Reply-To: <20261123-delegts-fixes-v2-4-960ce0fb2fed@kernel.org>
From: =?UTF-8?Q?Aur=C3=A9lien_Couderc?= <aurelien.couderc2002@gmail.com>
Date: Tue, 24 Nov 2026 08:39:00 +0100
X-Gm-Features: Aa3M54pDAnp4nzuVx3_sk6ZGaLciZePtabVFiusFMvgfv9iLGaYf856NyG1jvWs
Message-ID: <CA+1jF5rbGGB3iqc5FObbTYLyhT_gN18f1QfHRCuuOuBeJXLitw@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] nfsd: don't grant write delegations to NFSv4.0
 clients on CLAIM_PREVIOUS
To: Jeff Layton <jlayton@kernel.org>
Cc: Chuck Lever <cel@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Christian Brauner <brauner@kernel.org>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:59=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> nfs4_open_delegation() refuses delegations for NFSv4.0 write opens on
> CLAIM_NULL and CLAIM_FH, as its comment explains, but CLAIM_PREVIOUS
> skips the check. An NFSv4.0 client reclaiming a write open during grace
> can therefore get a write delegation, and NFSD can never complete a
> GETATTR that the client sends before DELEGRETURN in the same compound.
>
> Apply the same check to CLAIM_PREVIOUS.
>
> Fixes: 1d3dd1d56ce8 ("NFSD: Enable write delegation support")
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/nfsd/nfs4state.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
> index 5c2151b329c4..4b28553efc8d 100644
> --- a/fs/nfsd/nfs4state.c
> +++ b/fs/nfsd/nfs4state.c
> @@ -7533,6 +7533,9 @@ nfs4_open_delegation(struct svc_rqst *rqstp, struct=
 nfsd4_open *open,
>         open->op_recall =3D false;
>         switch (open->op_claim_type) {
>                 case NFS4_OPEN_CLAIM_PREVIOUS:
> +                       if (open->op_share_access & NFS4_SHARE_ACCESS_WRI=
TE &&
> +                           clp->cl_minorversion =3D=3D 0).

Thank you.

You can add a Reviewed-By: Aur=C3=A9lien Couderc
<aurelien.couderc2002@gmail.com>, please

Aur=C3=A9lien
--=20
Aur=C3=A9lien Couderc <aurelien.couderc2002@gmail.com>
Big Data/Data mining expert, chess enthusiast
