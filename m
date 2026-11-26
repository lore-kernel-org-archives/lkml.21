Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795690850;
	b=5pi/aPw12RhIqh7hX2bGdaQzG9hiMr8ivvVJ4EsUo21/zyA0IzlS73HZ+nPhfRawTqnN
	 P1Mx4NrVKuDsQQWYBRH4JW1MciQGu48WkZfuOaHIZ0ZbnUVtgqdezZX9t6kDSkXFodw7E
	 JpWDJL5A61dqoWEwH/fpsDtl5e/aZgArotjSnDT30+InlQ8jgjW7rGX48hEZIAttxa1y6
	 cb6Nk+kWR/WFGYvSzJe2L2vWmaN+pv+szvDE/d9yAi8Z5tgLOOnLFh2VoBCR7GB4IDIAx
	 SdVmq9pTSwmZz5zIeXc+3JQrk1Bt/2ZCyqhGaOIAoc932w7CySGdtJ8UVjB6FejS3CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
	b=ON2TLngqQh1FqoD9SVaPKMe5lFLKRK5k/ytlLkpX0K5TIqfHrOjiXu+l+PucGgJ1xmXi
	 6qlYkD/GR39HzUXaeKRNa24cBgJDGrEWd8M5XX3+rlX0okGGpPjE6hp2C46Aq8B7wcsxZ
	 HxT83k9VdtUK8aQQLM0h5KvrlBsqMvqvT3oa7rDsY+M3k8MOcpf50YKStt9IAhxtBz6A8
	 KDeVGKWpYnWNhqrz5v2oF8ILnoiY/ju3bWjhzaxppsF0ujoSHx2WUpF59bd9jqMbaloAw
	 jh0MZqO2tbrJXqKdb4Do802QOzcBY6f1O0V/GVWUYGklSusWnZeUnbinqHDh6sI6M9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvS1hfLx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8016A606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8016A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvS1hfLx
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67583c777abso7174234d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 03:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795690850; cv=none;
        d=google.com; s=arc-20260327;
        b=GC0f+cPbKatCcmvLt3zJQuZ+qXzKl/a5/Gy8u/WzEDPXTG2LAjaDPUiYp5hNRW8j+/
         ekU2Jb2SjJYZM3SrBqmLrQhVW0zOayV3b/IxI2GgRv//37m/+f2iSqxgmCXKjQaoQ6ZG
         cHzacKdw5513GdCWK5GDfgodPRbyniwut2eXwGPIzrI1kU3Aa68gIar3E9jKTqW9EBD1
         GEvQazIi2GN7HLO2tfym6RjJWkLQW4piGtpJy7/9A8oRmvUFNEYOey4iMsRW8UIGTEXL
         BfrSfVlSdzpsqB1ehE5B8GH+kXbNQkeBFHyvyoc2XAPhRA27u5lDfQ+gZwDo2btSrGyf
         Y7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
        fh=02pyRPzpfYTYorpSH+ez6eS9wh+rfVYK+PYQWiOmo7k=;
        b=di10qoGzeFzuHnIoOAnDmW4aGUda9WDavhWMoHBry6MMoSTV9N3GLP4SuLaseVZe1J
         gXI3NrCNb2+q8ZqWOUxMMUVPp0h5hiosOFSCMqn62BSthIWGxbcIKAvgQXj2uF3i0RAc
         1lqKJuh/+jpGtB2qIpKZjse36oCeZh94GnKVaTfuxbeE7Iqd/J+FQyq8nu5x9T39+2xm
         0g1hm5G8qK9Hhfl/FFEPcCpt6LN3RUodtc1as/jOvVSGYhZ3Ic2sHVz/kneSqnBrGd+I
         m29NDaTYgO7Cgi0Irop3V+QhIiGdKse67m3uet3DA5cEKXf+GZK+UPSrYOGMQhOgt/Wp
         5+cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795690850; x=1796295650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
        b=pvS1hfLxhlftEaWbAgidd2ly8kGrGI4XkzJQDvuzbvyETadHYLmBq7EEkYpOCtwMkn
         XdER0L0sZyTM0GDLXrOe1uAC59a5Z7IHbTpipsKWfqA8s/CA3xE4ynITkny/kxfZwKP6
         jLPiZAE9faAhc7/sO0ymg/Pa7sxvAv8PYYCpHVMKbGebBVlytTmF1IXEMraNZNRLdIpM
         OOPwiJuvYuy/vmLJB8TJVRQFlA/NPikevlKIQ23YP4R43TEnaxmAWEGvs7VLW7lXQyTb
         5+sVjLgppZPh8f7JVhiRoOk+/3ySPlcJ+6flvWPxv0GvulqZjViIqqcf8ICAokobqj+3
         Ce/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690850; x=1796295650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBjrgG7MLY5ulGSrGu9idWUw2qJwnhY95Q5JsiJ363Y=;
        b=pdqXNGfJDuFyLw09S3ayaj1wNwUb7dBg5eJ1upN1GuP9pmibISrTNIEj+DS8DxbmC7
         5CNDDg6QU4Vjbo7IUbtStLZaQ7g6sXMkulhVcT/VuT+RzStbzGHb6/1ZKShdoWAl3T5l
         zOw5OIgXXPoEwCTKJW8/DiEtCQct/kbP+nn6YtoJ4hLhxpP4aHljyJ4TQeHgWqW9P5Rq
         tdsDjcAu1EJJgLMXPVBqqiUxu8jgnua4p9JtUyayi3p5jNaLpnm5O2Crdm4Qh3gdg/4o
         7Ur2s86flAglEDbulJ2e1Wt6zbuiMLgB0tnQm8bT4VSwXbjFoZHgLWC1Coxn5EQEJYUb
         H+GQ==
X-Forwarded-Encrypted: i=1; AL+hErFguDJr0OtYbzClPHFspA6qjZU3NzE0syMdTXAu5MggsOAp2JhKM5LtaWPPgicIsr/io4vHfYHG8SKqIjI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+B5AXHVOgBxyYbe6phU2tcnQhokNvw7snNKajW1WlpkVBMX4iB
	a1+kN3JIiaKwbO7R6VGYIKwcN9XQLagtCcrA9lpWFKFLjjx1yGLLQw6ARt/P1HH4qSXKBoPHoZL
	hv/FJdSWLsnY7QnjwTcL4/5VlllTm8b8=
X-Gm-Gg: AZFdTZcaSjuzTniIeiyKyD0KRf3fWjqeVZDqBSfHvRsIqu7m6xI+ZiuUFMPVtSd7t+P
	u9/bUTKkfDQFIaICq5AT8ZhTrbw8SCWQGecE4TfU9F8TYy3uGqk6SdeDSDEipmt0n5GfYQ6+oju
	6aqHsmqnDxK5EjVTqxxcJyVVoiz/UiHK1br3PjbmemqE7UIORXI2jEJ03pM788iyCgZTmLDsC4A
	U204pxsbsWhkluxSrIyCOGUcyyLx6mesP5C+dvvIhJEktUw7ZlToq2hDBY2lLQc5afEj1l3Obu5
	a+65ZOUsQ0HqTVVm/BgTrnpkMYqU6UpG6cspRvfKYSqW71P6j30cOdZmYGuvKqczKBvRtp/qr06
	/lJ9Jj1KbB7/FtrEMpbJ3318t30/bvqSzd1S2NA==
X-Received: by 2002:a05:690e:480c:b0:67c:6bcd:b905 with SMTP id
 956f58d0204a3-67df440791dmr4500687d50.10.1795690849512; Thu, 26 Nov 2026
 03:00:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104133158.3187525-1-luolongjuna@gmail.com>
 <20261104133158.3187525-2-luolongjuna@gmail.com> <avZ3jEbnuVu5Qv2G@jpoimboe>
 <CAKL4jwX=ctyjXmm=Oz_+HXe89vOHWHgT_-KGyL47fOBEQTYJiQ@mail.gmail.com> <avdWaZboJeDyyOMs@jpoimboe>
In-Reply-To: <avdWaZboJeDyyOMs@jpoimboe>
From: Longjun Luo <luolongjuna@gmail.com>
Date: Thu, 26 Nov 2026 19:00:37 +0800
X-Gm-Features: Aa3M54rwjsZu7jMc1Fcx0xLlcwpmIPWCqXj01ITTPuucs-yBR6GhxYBGJrQyqJo
Message-ID: <CAKL4jwXZQKf2XrkRmpws3BK6x6iyMD+BRY-NMfqzR1DMmowadg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/11] objtool/klp: Fix checksums and copying of
 wide strings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: peterz@infradead.org, mbenes@suse.cz, pmladek@suse.com, 
	joe.lawrence@redhat.com, song@kernel.org, puranjay@kernel.org, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, live-patching@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent string-related fixes as a separate series.
https://lore.kernel.org/live-patching/20261126105325.2521938-1-luolongjuna@=
gmail.com/

On Sat, Nov 14, 2026 at 2:27=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Fri, Nov 13, 2026 at 12:32:20PM +0800, Longjun Luo wrote:
> > Sorry, I left out the debugging context here. Both comments refer to
> > specific kernel build artifacts:
> >
> > On Thu, Nov 12, 2026 at 06:42:36PM -0800, Josh Poimboeuf wrote:
> > > Please give example(s) of such "wide strings" in the changelog.
> > >
> > > > +/* Wide strings, such as the u16 PSR setup table, end at an all-ze=
ro element. */
> > > > +ssize_t elf_string_len(struct section *sec, unsigned long offset)
> > >
> > > What is the "u16 PSR setup table"?
> >
> > PSR stands for Panel Self Refresh.
> >
> > Source    : drivers/gpu/drm/display/drm_dp_helper.c: drm_dp_psr_setup_t=
ime()
> >             /* macros expanded */
> >             static const u16 psr_setup_time_us[] =3D { 330, 275, 220,
> > 165, 110, 55, 0 };
> > Section   : .rodata.str2.2 (SHF_STRINGS, sh_entsize =3D 2, Clang ThinLT=
O)
> > Bytes     : 4a 01 13 01 dc 00 a5 00 6e 00 37 00 00 00
> >                         ^^^^^
> >                         220 (0x00dc) contains a zero byte at offset +5
> >
> > objtool   : strlen() returns 5. The checksum hashes only 5 bytes, and
> >             the copy includes only 6 of the table's 14 bytes.
> >
> > > > + /*
> > > > + * FIXME: GCC's range_string() uses a one-past-end string pointer.
> > > > + * strlen() reads past the section; preserve the string base and a=
ddend.
> > > > + */
> > > > + if (entsize =3D=3D 1)
> > > > + return strlen(sec->data->d_buf + offset);
> > >
> > > I don't understand what this comment means either.  Please make sure =
all
> > > comments and changelogs are written by humans, as LLMs tend to write
> > > nonsensically.
> >
> > Source    : lib/vsprintf.c: range_string()
> >             p =3D string_nocheck(p, pend, "[range ", default_str_spec);
> > Section   : .rodata.range_string.isra.0.str1.1 (8 bytes: "[range \0")
> > Reloc     : range_string.isra.0+0x9a: R_X86_64_32S .LC22+8
> >
> > GCC note  : Uses .LC22+8 (one-past-the-end pointer) as a loop bound wit=
hout
> >             dereferencing it.
> > objtool   : Passes offset =3D 8 to strlen(sec->data->d_buf + 8), readin=
g past
> >             the 8-byte section. Fixing this requires tracking the base
> >             string (.LC22) and the +8 addend separately (left as a FIXM=
E).
> >
> > I came across both while testing on full kernel builds rather than in
> > production livepatching, so I'll leave it to you whether they are worth
> > addressing in practice.
>
> It's probably worth fixing, just the comments and commit log need to be
> clear about what exactly we're fixing.
>
> --
> Josh
