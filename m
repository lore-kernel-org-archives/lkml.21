Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445007;
	b=by+J93PYyGujXwrReClLkh2/M7uRNM2+NQJu28h4OYGJJh3xR78JcHTT0CCj4stN5rxl
	 181vDFHgaxhu8qcWupVhTa7LB3/zwzGONsA5is/jMrIgu2BqbyzYGmvW9324IuFvrdb6t
	 IdyizFKgm0CGuZreZ4GUfqH5NNrsJGRe47pt2lC6sZGLOsi1FDwl6I/eKG4PBETIlTHIC
	 PtYQZLde0q25y6w6uhpjzMN/QiVmFjlaeKTBO1Tdmoj8iXuDyCxBvz6EuXLyi/z3U9OKG
	 ffjx1G/xPIytJVgPFUlrelDL9t6Mum9z5FPvVUx/41dXGh2PKd8ofWrUSwT8CHxzmNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445007;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=pdcWROCO3O0LeKiFXMJqWflTzNA/CicS+wgfgye+MdY=;
	b=RyjrsCGOJY6txi2rs4gQrbh1ntoF5u/UoN0LxJDtAoC/6S4kl5nHX7zYE8TNNkj9+9Ty
	 OzYeUJ4op9+/zh9bU02cxCjVI2cre1zQwwMEY2GolcXbIIWnL9Jt3dWKn8vb3fQC45gl2
	 M4bh4lt+CgW/V8L8MGrNzW1yZUwBmeAypmypRglsfCK4RpX/XnFVnB5ILW4W4L4dcFCqK
	 pMnYc7x5ViFOq8LQGR7JaMtYutDYdRjuD1+kqDyPOTzyRUbRNstSOB87tv7bS0XJwhRIV
	 cs57Fz1HPjkegfhXncZCuRpic3JELC9RdNkkJdDKkB9qvhLyXZT/Vej2eLX5G0spafw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CVFYpkIF;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Evq1Igvf;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB3C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CVFYpkIF;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Evq1Igvf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795445005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pdcWROCO3O0LeKiFXMJqWflTzNA/CicS+wgfgye+MdY=;
	b=CVFYpkIFrBWibMZPbRc7ZrQNEbD0PisStdr9k8xC0r4tUq5g0FRY0xoC3JjTikXFnqD02F
	BAYuOWQfODkxW+DzHci99j5uGSIvTG9q1UbOOWALxJQX11R0+OhmbEAkUeZElcHQezVI0B
	lR/jGr8lUouDGI/jhXXGlUrx1hL7sXc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-sfAmGhdDM8OTK0nSS4ArqQ-1; Mon, 23 Nov 2026 14:43:23 +0000
X-MC-Unique: sfAmGhdDM8OTK0nSS4ArqQ-1
X-Mimecast-MFC-AGG-ID: sfAmGhdDM8OTK0nSS4ArqQ_1795445002
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso4679615e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795445002; x=1796049802; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdcWROCO3O0LeKiFXMJqWflTzNA/CicS+wgfgye+MdY=;
        b=Evq1Igvfcu0i+BPf7lFKtQlnuY0S7dGWKQkrz545jkjKgvOxKpTHpPZmlKmtaCPkdz
         V1xRdwrsQUtKnFcsGOLiRqLz7Q2rlN7bUF4UrG7WL4RfC2PV+zrHKI4HhV19XQOSOSDX
         DOyMdI9HXv5ryVCwMLHWXnGcEwa8dh6q+P8d5YoHCeFTq2/+JZ4Vc/3c3s/dYbTBW2wx
         QPJ047chcBGbFSGBOaH4CnBwUww3Atzkiv3ngL4klPhfz5DyKlyE3iqdur+nkKhRlNxV
         ltvN9WEt7M23CNHoATQaUETOabSoyFlX4lDZeUxTU8gJ+Uq0jgff98u9/6ul6BJty9cY
         UGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445002; x=1796049802;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pdcWROCO3O0LeKiFXMJqWflTzNA/CicS+wgfgye+MdY=;
        b=JCXKxpSVbso+K1s6vr/vcdS+RgTWpUKVHukaQ0dCyOUeqWS3bmYDWGtqJ3sDqH8iyj
         lFDvsU8eqJQm/o5QDNDQOtZ56IGtUxpGxZ2aTWo6Vo1ZG6Fn8+/zKCEfFSMdaHzHZ9Jl
         hNZvh5SubdV4+wnMYpfEOGJsnc8Ry6usRy2VdMmF+CO2ZTtC5nk5JTtJBQQtmenAAXr8
         sHe2YyRuxNA5aUJ/arNihDHwi3c7fTvhfBgJwkoGceN+R1L7sFPztz1iVzui4nHMLfr0
         ncKNF2txuUSE+7oLDEKMOq2glRQtWyiTsyA2a73ZpAChjMPB4m2SFKNWrFwCHa6zZS3L
         jJEg==
X-Forwarded-Encrypted: i=1; AL+hErFKY0w2r8S8PiFYYJIJxQ52mRbnmxDwv66q6xkKzKiq0jjKh1MWOwPujI2S9zXJ5GtwBaIQCRWWQLhlhdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vT6NPIwmXpU1qwGZjCY3F197XoSXb+LIEgV37+bt+BHjxz7Mr
	CZoyBPNBhRx/Qq3BTWoz0d3Q9Hdg1yMzVQWMQrMbJGS2b4F0LJmqV9wxorlodz+isQRvf+jsVmD
	YPnd1p1zXvyrAZXrtLPDLtXx2b3mZMuo50/P2v3rW5u5uitf2fwLquPQ7x+qufXuJ+g==
X-Gm-Gg: AZFdTZfx9H/NuRrceAcME/ms5yjvzt57iAY0yX2W8G3x/asohXzm24cao4wH/1CJ4qv
	C2naphgnzm9YBE4mWP/268xNFjmBVWOJpGrDKZLcMqBGE/k1aZhOzRRpqXXjUZ5rCOFEehPC67s
	OXwwkPT0sXmZSzfkDnm3xZChlYoOmlem99nIzu1HNwBB9PlwKVRquhC8glPyyLLL2uur8/F94tp
	M27WxNWUvDiHDd0kLWW7QrGG5Psf1uZT7ki6jbCiNciLoUcriMh4bN2SUYfn1cBhzKDAiHCQ0OE
	8uEwFs86Nsi3GEbirrp0jjLXPDAsISXfdRPpPe79LN1tfZ48L1SkKsC4GYBHYYOyBeWkx3/gKTw
	Ma7TR5wqaByDCXFJ/UtT43MccWmuzDl8A+TTWkXgyG9WvLgMRz8FJYQft99lOwwz5p/AlHeyGfL
	b1
X-Received: by 2002:a05:600c:4f4a:b0:4bb:6752:8413 with SMTP id 5b1f17b1804b1-4bb8880015bmr273057915e9.8.1795445001888;
        Mon, 23 Nov 2026 06:43:21 -0800 (PST)
X-Received: by 2002:a05:600c:4f4a:b0:4bb:6752:8413 with SMTP id 5b1f17b1804b1-4bb8880015bmr273057625e9.8.1795445001514;
        Mon, 23 Nov 2026 06:43:21 -0800 (PST)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.168.96.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm18481531f8f.35.2026.11.23.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:43:21 -0800 (PST)
Message-ID: <a0ea5b88df11b325895a446a2e6ed18a60807ea8.camel@redhat.com>
Subject: Re: [PATCH] rv: Fix empty tail container detection
From: Gabriele Monaco <gmonaco@redhat.com>
To: Avi Weiss <thnkslprpt@gmail.com>, rostedt@goodmis.org
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Nov 2026 15:43:20 +0100
In-Reply-To: <20261116084530.87088-1-thnkslprpt@gmail.com>
References: <20261116084530.87088-1-thnkslprpt@gmail.com>
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

On Mon, 2026-11-16 at 10:45 +0200, Avi Weiss wrote:
> rv_is_container_monitor() returns false for the last list entry
> before checking its enable callback. With CONFIG_RV_MON_DEADLINE=3Dy
> and CONFIG_RV_MON_NOMISS=3Dn, the empty deadline container can be
> last. Enabling it then calls a NULL callback through
> rv_enable_single(), causing a kernel oops.
>=20
> An empty non-tail container already enables successfully: it is
> marked enabled without activating any child monitors. Preserve this
> behavior regardless of list position by checking the tail entry's
> enable callback. Keep the tail check before list_next_entry() to
> avoid accessing the list head as a monitor.
>=20
> Fixes: 8d7861ac507d ("rv: Fix out-of-bound memory access in
> rv_is_container_monitor()")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---

Well, this is not really a supported configuration, but since we can't easi=
ly
block it in KConfig and your change is neat and simple, it's still a good
addition, thanks.

Acked-by: Gabriele Monaco <gmonaco@redhat.com>

> =C2=A0kernel/trace/rv/rv.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/kernel/trace/rv/rv.c b/kernel/trace/rv/rv.c
> index 29f155c6968b..a142e877e940 100644
> --- a/kernel/trace/rv/rv.c
> +++ b/kernel/trace/rv/rv.c
> @@ -222,7 +222,7 @@ bool rv_is_container_monitor(struct rv_monitor *mon)
> =C2=A0=09struct rv_monitor *next;
> =C2=A0
> =C2=A0=09if (list_is_last(&mon->list, &rv_monitors_list))
> -=09=09return false;
> +=09=09return !mon->enable;
> =C2=A0
> =C2=A0=09next =3D list_next_entry(mon, list);
> =C2=A0
>=20
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

