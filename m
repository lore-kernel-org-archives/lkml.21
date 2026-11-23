Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425561;
	b=EMVZt2AhC+52sSTq+dyVq55azKGTF6vuHBOdR9FAE8fWrT6jr4BCO3LMbHwbul30wBvo
	 mimYJ24+qx9M06t6dPCQcg2VBG+aAM0EsovKgHJxrkIk0Y74HNhSUA6dFoHjRTUsvH3ao
	 KCwHqbgWS3iGQY3Lh24FphK4kJvTjo6/sbPfGnVHsqS/QCzdyTot2L4IRXWm5eXS5E2ki
	 EvjOZ95SMyZTPKbifO4hpWQd353tVewxA1AbOSqFlXHCT2VRwY+9e9G51C3B8uNjJtI5I
	 /HV24OiLLShTlpsy4LTlqt5FdQSRFZXQCKHig2FRNfy3Mz+m2Hf+C51iTuSTCsmJrdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425561;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=LYIir9UbeEi2CT2gDPhDzZBEiArUOUKkyz2EAXQH95Q=;
	b=BSJcJbj+LYpLT5ctCUEwnt53hzEomcNjT9Lm0n1SDnpAjPMkNkO7WREPs2UriLWZ8GvA
	 H5XWMRKSLx84m/QWAWpyVKiw1B+RO13B6UfH4SiGujkLGFLJRqpV5TZGJoqdIYzhHesYT
	 WsyBG/6flib7uZ+GDV6y1ccIoa3YWJXPsA/xjQI83p4KPHIx1G5f2DJuvtK+bPXuuXL0a
	 CkP0FbHycfD6rDFEBaK2WIxK63L5o/54G1nFDOYQTA03rLZFE9u76nW0IpWqz2IjxIyMm
	 P/kd9qpqsmdLWu588ZASC2lR1ENw3x414nptuirJ71QsmePehV9tubP2X2JgHFnJGcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="MT6Kc3/K";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fITYLaDa;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6C9606A327
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC6C9606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MT6Kc3/K;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=fITYLaDa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795425559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LYIir9UbeEi2CT2gDPhDzZBEiArUOUKkyz2EAXQH95Q=;
	b=MT6Kc3/K4+jZUKko057P+AVb+j8CAn/NIYowTP01ipWKBedAWKSZIvWJMvmV5FO1nDG00T
	S5nhgypU8RSeTH2T9ERFVevP0J98iZsfNrk/Q9Lt8oCM9LjP2xoWcLDWHCGeP+WI3zwPOu
	qI+nbBYoekR6AnX7dNkRgebRVSYhTgw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-0wViIH3uPR6JcA7agG3TZQ-1; Mon, 23 Nov 2026 09:19:17 +0000
X-MC-Unique: 0wViIH3uPR6JcA7agG3TZQ-1
X-Mimecast-MFC-AGG-ID: 0wViIH3uPR6JcA7agG3TZQ_1795425556
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49febef74e3so28064055e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795425556; x=1796030356; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LYIir9UbeEi2CT2gDPhDzZBEiArUOUKkyz2EAXQH95Q=;
        b=fITYLaDaEqtEzqoPJVRRd7q7xbrapajFWLXWyEf8UNAcjYTO8MmCDyckLPAhWQjLAB
         hgBN3HNGVukDgGwRgvaLb7TVztK7eYte3n/ZJ2DDKmn5Ee48sjJzRHJSAP1IupR6YOQF
         EB3NFqCFZTpB2/+s/fc6Z8ag6o8HcfBjqA3FNrvkYOU9hsFlb2R0XE9ixeLh0kKQUAm2
         mbmC0jFaT6wiwYzzK1bWxCYfSEDG8PjBoxGFZJIQZwTLZziFDccfxBGDz9UOrGlchlEf
         PZyD5zqRGmkhgY+KF/ZsgMij9aMx3tlzREFiNJSaYfdyYjZeJ+JtuD7jc1m57nX7Nkj0
         Ao2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425556; x=1796030356;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LYIir9UbeEi2CT2gDPhDzZBEiArUOUKkyz2EAXQH95Q=;
        b=Wox5aG4LQY0w4DYJWaJU0htULXCv4uCqdLbpD5Bn4Q7CTeZ5eKgTEt3fsQqzRsIwYp
         OPWpz/ph49wMoLOnLAEGtLr8R9YdWkIa/fLytyQKRnAN6VCFj9mjGoDW4qz3XGqCcvD5
         IpyJdvPqrhYDdD+2U1LRc1UDmHDHDI2wgb6nsKlgBe1/Mkar0mqjsISVsinIR7LWnh1i
         c6+WxE7loP4cyd4As1BszOteuOgywNZ7pNiFHY609lVr9j8rrsafumyHcNm3r1jyLD2u
         ndVpspzv5LUdaSZkpJHse8CsjU1Cd7IItiu4pmfdoXwxcIkhoABdff2yHaCzTlTA8TKY
         xwiA==
X-Forwarded-Encrypted: i=1; AL+hErF36xeSE8M1jhpaIF4aPRjFAb69HyVD1CtNWuu19cnF60aFwFu1kQBx97CWpLTw8j9sIP/y6fG0F3R209Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z86Jzm/O0UUeRrDpzCEyXfNPLhNy05eStIrRQfuDHbQ5/FALZjM
	iDXaOvgFu7sR1MkrMIGtCXovtaaBzE83HFdby++BcHU1a6UHnust78/6LWKCzHlCiMwHG60TsHx
	DpGguK2L2NHtR0NpRtnySidRVXtUTUyvt3qr6unTPa02+NeBN9krQYyrSohSB+fzPeA==
X-Gm-Gg: AZFdTZdjQfE6nMQ1oiNZEVR8rCcQcrubiWDKEoJJohXJhQARcQPRmxM+QfW4A/oqWpH
	676KlL7IKwGzsqVot88cDoO9MfDHNA4McM+vnoDpnK5n6XMjgGEQIkGIyXx1mIzaGj6LdmWvYVl
	NQ9op/AqmpnmCP35qkXY/n0Nikk6rZ5JyH4jn/tu7OayFbRcjHaSgBeRE8aQ6kd2l4n7sSb7lGr
	K2UD5SvZkaqt6rRLo4L1YDpQUvq9j8DKsNU08rNuBdUODZKhHHTVmdQA8sYuV9zBSxZJIkGUBCq
	3koB1+lMZfBiGPKP48iRRK4J+FTWJpZ8Jl/YBcURtIuKr9NZJJakhoAAvlkfYeSrRZeG/ZTge5Y
	nS2YF/sfd2usZTP58v2UVcJdai70Om4osCOqBVPr8JaR6o/sztNOEsUxdNG2iWI0i1bJUe/d0yL
	5H
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr234333175e9.0.1795425556197;
        Mon, 23 Nov 2026 01:19:16 -0800 (PST)
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr234332685e9.0.1795425555832;
        Mon, 23 Nov 2026 01:19:15 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm166276135e9.2.2026.11.23.01.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:19:15 -0800 (PST)
Message-ID: <58930dc60d410ae8dac5a5bbe5e9048501b5b1db.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] verification/rvgen: Validate the monitor type
From: Gabriele Monaco <gmonaco@redhat.com>
To: Chaosheng Qu <chaosheng.qu.linux@gmail.com>, Steven Rostedt
	 <rostedt@goodmis.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 10:19:14 +0100
In-Reply-To: <cf05914335850f6835ae79b34d6b4ad891128948.1795252297.git.chaosheng.qu.linux@gmail.com>
References: <cover.1795252297.git.chaosheng.qu.linux@gmail.com>
	 <cf05914335850f6835ae79b34d6b4ad891128948.1795252297.git.chaosheng.qu.linux@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, 2026-11-21 at 19:31 +0800, Chaosheng Qu wrote:
> The monitor type is pasted into the generated monitor as RV_MON_<TYPE>.
> Nothing checks it, so a typo yields a monitor that cannot build and the
> tool still exits 0:
>=20
> =C2=A0=C2=A0=C2=A0 $ rvgen monitor -c da -s test_da.dot -t bogus_type -n =
bm
> =C2=A0=C2=A0=C2=A0 $ grep RV_MON_TYPE bm/bm.c
> =C2=A0=C2=A0=C2=A0 #define RV_MON_TYPE RV_MON_BOGUS_TYPE
>=20
> include/linux/rv.h defines only RV_MON_GLOBAL, RV_MON_PER_CPU,
> RV_MON_PER_TASK and RV_MON_PER_OBJ, so that macro never resolves.
>=20
> The accepted set is already in Monitor.monitor_types, which the help text
> prints.=C2=A0 Pass it to argparse as choices.
>=20
> Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
> ---

Looks good now, thanks. I'm taking both.

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> =C2=A0tools/verification/rvgen/__main__.py | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/tools/verification/rvgen/__main__.py
> b/tools/verification/rvgen/__main__.py
> index 246b43fa2..6053db5e5 100644
> --- a/tools/verification/rvgen/__main__.py
> +++ b/tools/verification/rvgen/__main__.py
> @@ -38,6 +38,7 @@ if __name__ =3D=3D '__main__':
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-s', "--spec", dest=
=3D"spec", required=3DTrue,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help=3D"Monitor specification=
 file")
> =C2=A0=C2=A0=C2=A0=C2=A0 monitor_parser.add_argument('-t', "--monitor_typ=
e", dest=3D"monitor_type",
> required=3DTrue,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 choices=3Dlist(Monitor.monitor_type=
s.keys()),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help=3Df"Available options: {=
',
> '.join(Monitor.monitor_types.keys())}")
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 container_parser =3D subparsers.add_parser("cont=
ainer",
> parents=3D[parent_parser])

