Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795457561;
	b=aBIHCbcfr07CCvtWdriVV1OxVm3Nrau2k45jOYr6mmaEIRCdCIfsvzf3xQisoo5sHDdf
	 EcCzBM+6MXIZ44+WdiNGYk8NA7f2+7HZKATvxPmRz8o+OjAGcmwF3u8mPexxwAqfo2LXb
	 NLOwuIsGbxn+b27GnKDZKscFZmqoqXctrldTD+gYRt/DWnXsW6JqrHI8ViwHI/Kb8aUba
	 PqpSoAD2Rvf85OiJ33W368nQbR6GZXr/z34AQbgbw5Vds4VoylFjE7hxAxdAj0kVn1T8L
	 jRKTGRrTA0tXNVGvnT+cduhzLQ+37cf2xNQEMxv2dJxXUJ6FOiNWV4KR2KMtro+KpLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457561;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HP8VBm9AwBGBl3fsWmTi0HJKAowy+01FlMfGnwz4/xQ=;
	b=DP7z9gRhAG9d6BeR4LKrANpdDsC6NMNwbI1ejU6i4itZ96otWYLPeWZRjBC3z2d3gXCB
	 m6ghnRmJGnPXS30GpRUycVDtkH9LhY9di7qgpSvs9w8z63Bvcl0oHAE38xzKR1y8f7dti
	 VYnXIW11LiW0Q44HCEdVup8qcpOM5ZEBZJeDKe4JdY6ndiIXI6fz5+WDcGsUHMGZh16ti
	 kVltChGg3OXzc+rvDedbUld0Ebu2mM601a479iZkfofp0o3DNCdG3WIMA3GPFOjiWeF8A
	 Wm3jcyfZVckP2aOvRwXdE90Y1cmtmkjIAF0SXCvu7LksZmeuGm9F4Bj0jnSmaQBomHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZvLZA2pc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35465606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35465606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZvLZA2pc
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b4c2da74c0so22197767b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:12:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795457559; cv=none;
        d=google.com; s=arc-20260327;
        b=bcgQUtw+v8p94JNaDo4N82Bad3mnxqxx4GiNB4SH4q3rDwWWAIqvSvOikXjXlZkNyc
         4MknrIGcJxgRd7bmMD2xBKURJSyeBIw9t703vuEtwdJ3ACQPsVYur9FEmblSVqmzIZKS
         cm8moF6o5rdM+5la06l6RUIazq2YRjlSQ8lNFYjn1raUWukgU944WUgRsSD/UhEP4jRu
         vj5zmlSmoQ+836UOGFOgk+vvXfGVA2FWnZ8YuLpFvMjcvCtqreys3vRRHPOIEWpcq1NA
         2xlggjYA/L8DGBHkZDC1ET5/DDIhzve5DA2HNUeU1YuC/Z/9eTvbs1Cbl41crjVBUm6l
         tloA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HP8VBm9AwBGBl3fsWmTi0HJKAowy+01FlMfGnwz4/xQ=;
        fh=08nNSXJ/SHX0mPN2zhDz3RHQtNeiHv4llEfoRvmVa3Q=;
        b=iGgJrE7PGNOXcVKPgejeHYjn+kt6GuUVzDBPnTcO0V3TwK1fMDczoetIfADtZyA6Jq
         cr3oewu89NWv26uqp/RW/vH/I6j2sBOUb0FbdmuNaXFWiFkK6LDVY7Z49acDQo2SqwjK
         J9tRzhscoSPoNbpYrwDRNaO6e1wwhbXmwr7RaYvSqYnX7D643ieRYb2r9Zhry+eD8fWj
         y3oD7WIqZFqex4mSGliVFVbv1PGm9jqUwof80tvOjB7/ti2nOWfX+UKxuT+HqoCPF7YX
         87KMXjOReRRa63NnTHxyVIxiToR7ySBMWzT2qhrQCuEGCzcLSwrwoI5vZbpkknta3to5
         DXaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795457559; x=1796062359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HP8VBm9AwBGBl3fsWmTi0HJKAowy+01FlMfGnwz4/xQ=;
        b=ZvLZA2pcD9FH9HECe7LfubP1g4r7DtXRTfLw+a0fSCVHRJ58hcWDYhSRacl6iWIhx1
         vem+3JyEz4vOLSZ+IkUJHfzXgIjCFVthSNx3d4mzu9P79SfAolAw4Jt4yzHmEPZftFFs
         rR44xHk1UdKlXpN4nsj8cuw28Pu4f7r8OoDysRubVnO2x1wYTvw4Cv7a++edFCAgU7xv
         FwyOp8/bmeVoA8845IWW+N0pphOdNNyL2IUTX1caZ67sYL7dqc3DVPzzaQ1OhL8UsU0T
         ppHemCUM2GWad10r+4RYwS/DZlVBqx2dNyPjbDasXB+7Kxeyd98kKRzbZqgwtR86cUL7
         YuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457559; x=1796062359;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HP8VBm9AwBGBl3fsWmTi0HJKAowy+01FlMfGnwz4/xQ=;
        b=np7HDN1srX1MLHeCVjD5lGk3FUdoDk/UgYWtwjrN2ee8fNuIusIphmTfBnWMcXNxuL
         50cXnfi1pva6ixCDp59RAAfUU4vhY67liliKYr2i5VSOxDCX+2HVXYXV7HceUzi1Nrmz
         4o796ze4gsEvXynpf9n9uWbJt9H/eCsp+X7tqcxZuLZaYxM7PtZwykhedkCL2id/QzGF
         dduR9M/z/zxKYN+U3vvdNOOjEA1ChUSLXSB/HA0KG8FICWI4YW0WOezZ0JLaDXoM5d2S
         vpMP/p4zXxyRWM1/1ukEH1ISK4OljioebX0fZxYJKXuVeI2cMksgZbBj3Afy/kulhzAq
         uVzw==
X-Forwarded-Encrypted: i=1; AL+hErGuk5EXVyYvq6IW095GFpgjkFWztARHnClXtSw1luvu4Nuigpceu2XCWSte5J81NiBKPXwpNaYbuImPjA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rD15N/ccO35eq8WyGMIrZPvTAy+SPDh9VeV/bL9xWc4Yu9TNT
	DoMJu1p9T9I7nE7O3D2cmmtVIB9oXbjVuEeTDOzAgxtG0sXB9nhPmxtjB6plg9AAamX6RAuqArs
	YkUi/WnPpi7/mZKZcStqbkyDFvVaITUQ=
X-Gm-Gg: AZFdTZet+k2Dw/x8l/g4M2QAK3yfWycPocp6y/eoTf/Nbkisk4wgqYbt+bx2ILRLMIc
	g1luCglH0OwosMT2rSOKhkDvdFOVIX1aj/UUm+oZ5/6okzfxOcGNz9fcfCljuIngWbghnuXApzq
	EuP+IapizdkbCGOcYwD3ZOBuuuxRq2Hs7ixo4P25PWZdswu+i3pjUpk37ncIc1TLk99JhL02hTj
	55tLzEm2dtVBafzqA7h84bJO0RvpVPS1xQQrGeneaTlZsHXbcWXkYJ2qG6bhehfdZFg7A6lMRaj
	vFW6Va4YMW8+uXQkuZHyAk60o4DG1zL4ZbQTMU8KlCTeKrGKTqYI21d8hhN+WjaEaEvGPKXaem5
	8Bg2rm13exmb/JSD7NSITcMPPPlLE0On9j9aXdoafbDLXp8QZmXdpR6c0nSdODTUVu7HgMVddvG
	XEht93pLck+raqQnY1GDZvXD+zTQKHrCOUROUZ
X-Received: by 2002:a05:690c:c96:b0:8b3:4b5d:b26c with SMTP id
 00721157ae682-8b520435e51mr43853877b3.13.1795457559039; Mon, 23 Nov 2026
 10:12:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121-vmlinux-lds-v1-0-49818f3f5cc0@gmail.com>
 <20261121-vmlinux-lds-v1-2-49818f3f5cc0@gmail.com> <20261122115458.1da4b8e9@pumpkin>
In-Reply-To: <20261122115458.1da4b8e9@pumpkin>
From: jim.cromie@gmail.com
Date: Mon, 23 Nov 2026 11:12:12 -0700
X-Gm-Features: Aa3M54p7oziKjc6uiBqsKJw-wMOKZwA0vwboFiGz1_X4unEm3KI8bOmikp-yLOk
Message-ID: <CAJfuBxyxu6FgcX-0yr3QaYOyDH0VZwvtaSU7HpqBU7_AV8qCVg@mail.gmail.com>
Subject: Re: [PATCH 2/6] vmlinux.lds.h: drop unused HEADERED_SECTION* macros
To: David Laight <david.laight.linux@gmail.com>
Cc: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 4:55=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Sat, 21 Nov 2026 15:49:20 -0700
> Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org> wrote:
>
> > From: Jim Cromie <jim.cromie@gmail.com>
> >
> > These macros are unused, no point in carrying them any more.
> >
> > NB: these macros were just moved to bounded_sections.lds.h, from
> > vmlinux.lds.h, which is the known entity, and therefore more
> > meaningful in the 1-line summary, so thats what I used as the topic.
>
> Maybe remove them first?
>

yea, I'll do that.
thanks

> David
>
> >
> > Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> > ---
> >  include/asm-generic/bounded_sections.lds.h | 15 ---------------
> >  1 file changed, 15 deletions(-)
> >
> > diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-g=
eneric/bounded_sections.lds.h
> > index 8c29293ca7fb..268cdc34389b 100644
> > --- a/include/asm-generic/bounded_sections.lds.h
> > +++ b/include/asm-generic/bounded_sections.lds.h
> > @@ -18,19 +18,4 @@
> >
> >  #define BOUNDED_SECTION(_sec)         BOUNDED_SECTION_BY(_sec, _sec)
> >
> > -#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HD=
R_) \
> > -     _HDR_##_label_  =3D .;                                           =
 \
> > -     KEEP(*(.gnu.linkonce.##_sec_))                                  \
> > -     BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
> > -
> > -#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _H=
DR_) \
> > -     _label_##_HDR_ =3D .;                                            =
 \
> > -     KEEP(*(.gnu.linkonce.##_sec_))                                  \
> > -     BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
> > -
> > -#define HEADERED_SECTION_BY(_sec_, _label_)                          \
> > -     HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
> > -
> > -#define HEADERED_SECTION(_sec)        HEADERED_SECTION_BY(_sec, _sec)
> > -
> >  #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */
> >
>
