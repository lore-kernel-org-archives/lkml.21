Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795862288;
	b=Ic3DMPdPqV5aYhOnjdJtXWdaCTk6N2vaP+lVJqchbiIalVQsIJUk/UYFK08QvoQElSU6
	 4QkOXcoeOuEGFEEJK5FqXw6H+QeJ6YdHVdUFKZrKwiBsX9M2ZGkEYmZy/VLh9+A12PBi1
	 5JYiNiDFiipMpbW6fRJa4O+y9UIHFIlR0e5KF1ZuvnNs4nA40urGosap/8ZTFRF8PLmZ4
	 qmQg+FrYSPTv4q67tW7YisTLF/aIeUCIl7EIZo2H96aldPnzC3mA63zQ3nUeiJ2xgnyWe
	 HPeAN0cksXoQtwGp9/3rPOy+E/9R0CV+JqpTfpIdyX/rOaTRgD70vJ+vZzd+jADAMow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795862288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lwyHdZrIt37fPawafrGp2eMQQXYbv+RrBkeaiIqXtM8=;
	b=iUg0lVcRw7Q2aWlXkyKluAlCtYEPLUA9RJpfYTZMPH642PGLSlLhVBw7Jwi/SHDgUhxX
	 wIE9h4GAzxHoE/JAS1IL87UhSQ58q2FfO9/qhWLwL9eMEMiINJ2jPbpiVK/bkdeKvYgyW
	 L6gFHoDGLSjELncDdHSCZQQKziPkv8FXXV05KC45zepWl2vhEFEp8z86EuSzCzZMBb951
	 9Lk78pOBHF4grBWwPgEa2N4LA9jf0KfuXtDipUrg4TDv1ZPTS20TFE/+QsAYYlxdB3Sk+
	 t76tDphneYFxzqC7Gf3eSX369aU5N7AJ0TkGTWiUiuEiuM8OTx8pa8B0LZfBrYRvVbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vDwvR9BB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA52F606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 10:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA52F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vDwvR9BB
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b10d24345dso80244117b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:38:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795862287; cv=none;
        d=google.com; s=arc-20260327;
        b=Y3KTJxFNZNkDSG77fKm4PWB4V37WRRDZp6dhTsrdRucg6qg0AnWfGAAtcBfntI7aXT
         glhL7QELNtUHqGevbx2VuZwXoWjR0JYtZyvf+tGJC+gZFpcz8qos+SNHNAxWhBMndj3a
         sdL2Iqvn2wU6EtrdwdiHrON7KiD23lbkakKsybPjgZft5sLMeXhcfz/j24QjpXJUX3Rj
         Ui9EVbTfhYQXbjVE/PhV+ntcOuUJsOgapq4VV6jO7teD+PGfSWtpTXtowI8UYBZShoua
         CL8S5XcvpFvZsnqaKUr9aMm8nti1hiYzu9vU/jVTETyn5FjXIEi8ufRDyAm5esRY+esV
         ePcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lwyHdZrIt37fPawafrGp2eMQQXYbv+RrBkeaiIqXtM8=;
        fh=awv9rhvg2wwurognii0Yq6j1dORN+34bRapv31aScGw=;
        b=gO2+ahUcm2yvixZRVxK9P0b547wloV3+gxm0GbQIJxWw+fWy7+ZjHxTji37wCaEkfx
         8PPcbe46q+uHviaVRSTrh/48JLGyLACG0adweLcoKCOyC67L2QJbODbni9RI0JOFcIZA
         jmRohxzHSxDfkexuOOTR2GYvtgdXqMC9oH/iLd1Azx6JYN7WFhwuLUBMPCavLarUj+e0
         nZtd3xBhbN8J65G+tpoNwTf6yjX4Wo2N4JbgOSJMF/WvwTnQdPok5fdoqGglwF+rfA3t
         Qu8c3qUOUnfplZXxH6OukksZaGhjrNrMYZ2NsNcesDVldefOcygibJCZJBuAbhMpqyWz
         do6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795862287; x=1796467087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lwyHdZrIt37fPawafrGp2eMQQXYbv+RrBkeaiIqXtM8=;
        b=vDwvR9BBdpjQ3G8joaGDJRaUV5jS124HvjZGLj7uHk8NKri2VFFDC2exXnj6FYJlXC
         goC8qD9we1ivYYYQjQ7BoUbbJnOWTkoEsSFiEI4kxV2O8GjTTkV2IOr5PADmXWcIFKAz
         zbn8LsXtyYafRkO07aOMoORp3uxZU8xyDtOFRR07M6RVWLWasiJSah2QVcE0YMNkZJAS
         nDgAaqySwgTVCmjf6oGYMBdlMlJTFl7dYR+cv4LXk4Zqz97/7qRnb/dGKYK06bxJdmj8
         mFLAlw+EVv3mhauzIJb35S35NLzOmfjRcj9igT8N7+ujAqdntfnf6xIOOkCfcOUBFN9q
         U//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795862287; x=1796467087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwyHdZrIt37fPawafrGp2eMQQXYbv+RrBkeaiIqXtM8=;
        b=pI+s7VTJwrC8DWAV9on7oTQD7EgC4IwnkDHkG0Jc9lt2R041ZuYSzAEZXk3PuBUJbT
         cuNFVUpxz/QwShX6UvyLsnp52sqXF9xY/o7YZRkTKJ5D6diIGZgH6CQwpPzhidHG7Pk0
         oZ5ghqD9YnT4WrBdycOQage/2CGxWjp8i3zjWXuWqQDkHMA5xgQ0Ntgfei+VaZBIT2WT
         SHSqImXEOuL0S5lXEc8Xjzxsdp8tP5/1nwGKhtOKcuZFpKEeHqXl71Hp0scbUjQuKJzn
         qjG6MNnXGTVxoTDyHui6E8Tm3FYgyb+wLsuSV23bOImuWryhZ2IMJsn9HnyDrrdb2WOZ
         K8aQ==
X-Forwarded-Encrypted: i=1; AL+hErGRI8hC4CZy8ChdILMK8A8dq8VAZCh/rRJl7YuhAPjjmCqNMGbjCLpeurvkA6RL8Tjp0+g23HZf13R9kfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WTgEhO2fF4hRspv/TiRIoyOUE0Di0xPkhWsW6h3IWug61X7pI
	S/7fgA8FA652SQPurJCteSOcRy4cpU2cdeUhW+Mw7S+XRvE/GhcU1+Gc2MKKI7peyC/lxNI3AMs
	PGq7776kxAhcU8DLrffd5T8g14PtqIeg=
X-Gm-Gg: AZFdTZfres+DBOVebk5XB+yyuALpHZkcZ/DnezX9KjB5Sg57ofcg3I8Qf1EJFXBZNb5
	9TYhUq1MM6vw6uHZHEbRlS4+xPT+eCwE/lNvpvlJy0PI8flUJveJWNpYw6Z1Wv3iCdG4hx2iJlr
	UZgaaR/W1lHMirjlXzAtjCnRTOEZVBRTGyifJS0y96chkkTmozyjYbEni5Ejsb/ibstnczfZZp7
	QZGrJP2rs1bxOSeAjwh2Ur4pHuuMolNwRbQGT5wYdNUGRdknFgwtyhsej2h5589MBfddAcgMxq+
	ewUaMv+j0+sRb2XJAYttkeaibfywKXW9ntXBHuyZWwbKEoiBxX7iO5nLtTJCUcWUYKk2vaZddVv
	Ljoq/yjqBw/ojI7ZZ+dBsIo0eJoxn3P7S2ydQ7Pw=
X-Received: by 2002:a05:690c:7348:b0:8b4:cba5:fd6c with SMTP id
 00721157ae682-8b52044065amr126739297b3.22.1795862286628; Sat, 28 Nov 2026
 02:38:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261127080132.266236-1-congnt264@gmail.com> <20261128030319.3205806-1-maguicai@kylinos.cn>
In-Reply-To: <20261128030319.3205806-1-maguicai@kylinos.cn>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sat, 28 Nov 2026 17:37:55 +0700
X-Gm-Features: Aa3M54oYapQM524laP5MxH1c1g8R2EyRuvG3jfItLB1ggZgI1yiJdWq_mT0z3GU
Message-ID: <CAJpJ=Gs5hzFGeR_qmrtfL94LCWWo5HCUhkHewMG285gR98ZyHg@mail.gmail.com>
Subject: Re: [PATCH] apparmor: return 0 from unpack_tag_headers() on success
To: Guicai Ma <maguicai@kylinos.cn>
Cc: John Johansen <john.johansen@canonical.com>, 
	Georgia Garcia <georgia.garcia@canonical.com>, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2026 at 10:03=E2=80=AFAM Guicai Ma <maguicai@kylinos.cn> wr=
ote:
>
> On Fri, Nov 27, 2026 at 03:01:32PM +0700, Cong Nguyen wrote:
> > unpack_tag_headers() returns int, where 0 means success and a negative
> > errno means failure, like unpack_strs_table() and unpack_tagsets() whic=
h
> > unpack_tags() calls next to it. On success it returns true, which is 1.
> >
> > unpack_tags() tests the result with "if (error)", so a successfully
> > unpacked "hdrs" array is treated as a failure: unpack_tags() destroys t=
he
> > tags, rewinds e->pos and returns 1. Its caller, unpack_pdb(), only chec=
ks
> > for "< 0", so it continues without the tags.
> >
> > Return 0 on success.
> >
> > Fixes: 3d28e2397af7 ("apparmor: add support loading per permission tagg=
ing")
> > Signed-off-by: Cong Nguyen <congnt264@gmail.com>
>
> Looks good. Because unpack_tags() rewinds e->pos to the start of "tags"
> before returning 1, unpack_pdb() leaves that section unconsumed and the
> profile fails to unpack (-EPROTO) rather than continuing without tags.
> Since tagged profiles cannot be loaded at all since 3d28e2397af7, this
> probably wants Cc: stable@vger.kernel.org.
Hi Guicai,

Thanks for the review and the test. Agreed, the profile fails to load
with -EPROTO,
and this wants stable@vger.kernel.org. Adding stable to Cc.

Thanks, Cong
>
> Tested on mainline (f4585067150b) on arm64/KVM with KASAN and
> CONFIG_SECURITY_APPARMOR_KUNIT_TEST=3Dy: the existing 30
> apparmor_policy_unpack tests pass, and a local KUnit test passing a
> minimal profile with a "tags" section to aa_unpack() fails with -EPROTO
> ("failed to unpack end of profile") before this patch and passes after.
>
> Reviewed-by: Guicai Ma <maguicai@kylinos.cn>
> Tested-by: Guicai Ma <maguicai@kylinos.cn>
