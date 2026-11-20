Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161495;
	b=gz84zUUnXs1Yi3VvrZraDAciLUXDEtb09IQtg5EOB/j9ufUkIdSGXYM7Ri0M12+XILs9
	 tDqQ5NK0wD+e6NdyEzBNSWv7TMs1LJua4ngpLr2F+aeXkgTFoG8ld5tSXM9nLimfnoDw1
	 rvL21SY4gemQaEOmZRgy0bpwM3BWQkMGcjwX5Z4xsWQB3zst8QFwG5e2oWhDjyKBRtaEe
	 crK3DlgASAXltxu1GyTuF6ZUAJ0ZgFAyQhIE3pe/9ZpjznUl+hDzVQ5l0OeU7DKs8tgPL
	 UPR/GWI9VSgyXczL8MmFppOmPgi5jTsSejYvhoVknwYKKtzpxPkx8NziMhD0pcC8ahg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 In-Reply-To:References:MIME-Version:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
	b=HmD0xer8X5fH+59drqxlM/+0Pnv1I9MWx0VcV0gxfSDU+3mb2dy/wjqRaM1DbxwlUJ2z
	 Iq83+SzrtTPu6WEaFO2Tq+U7o1s33F5ET2g/m+AkctKxrhRmznSOeUQ6eXtvFVB48a9Mi
	 5bATE1i47NkkzI/Fe394pakcphCV0sfSBbXH0dmRRi9qyRum3d2I+f1mmDzsgOBLFMTLf
	 yZznzethQABbHUVLLmONLaqfLgkG/gMyMzDrHb1mbuSkFJBXVZOdu1W8J8eN0yAbVAkF0
	 y6vCPRh4iTJd1i5BDewprOSy/XEjUJp6+ek7uY6mcY9KiCnFP9Wf4CWyS3AjZZG/9Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3PRDn+a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD227606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD227606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3PRDn+a
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67da564d9f2so1082720d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:58:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795161494; cv=none;
        d=google.com; s=arc-20260327;
        b=q8GZ8iH6VNKykffOROdBV2vT+aVf+U8omfb5aWZxqPptmTxsFkEb2it/P5nRgbWi0Q
         +v8GvaY33Bis84slgRCJ0mn733hLlkifR6rI6zMGqbrbYy1eeO+U10f2sovk0GyXAaS3
         HCqYtTDl7o75EKtGrUc0U4DvYHlFi3xm7edMJYVf2u/idHOXZaWXuZN2fLVmlm9nzKY4
         6a6m6AqPTs4/V5UaZAONHN1cRBSNi6BM1vOroOBe/IZebD6AdyuteFGtqaO1//0Dm3Zq
         VysVI3UtrmCM7w2dkCrALFe5vwr3yy9x8XuRN6OgHxUI+ezMtxDBc5CYV2JmrhxnREVm
         Fpig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:references:in-reply-to
         :dkim-signature;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        fh=SSrNZGWaDRpPz3EK1ZFab3CmzeUkgE0blpY5isqdrRs=;
        b=U4SzsCvMg2fklRH2cIoLlUaknwZrQctntALWZl3llyccz6/grp4//0ir0svAqjL8VS
         S7wTwE0ptLTma6e9OeJCDMcHkP0/aGFDBYX4dCl3LyuFtJv3vgpX8oir6FjOJNkngoAc
         9pJFqwE8LVdrU5Qjz8m1X57q5q7Rpn/YvVW8kCOoRg6LXHV4GtTeUBMsgWRYXlSypZkP
         2z99WOJPyuUmPG6GfasavLgJp20bisK4cn/RNbu4L94rAJoUv6kt2YTc46Y/TdTmHk2h
         xrlappnd+nsIdCpDuNXqrRoTlFVBNTG7K99yaYELJDRoFbtgChBO8z6t+F6rLINSZflz
         jnnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161494; x=1795766294; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        b=x3PRDn+ag0GJGwdQFEJpvNTgaSWoLRjaqTdDS2YbvgUzPrxEiL51PsqpGtNTkJZhsn
         kCZt4/7F1Z5jSrTaHPTiW4vehFvE6DmOH3UDpFSLgtEsRP5Xv06E2XnEEbxJvMSRamcn
         6XsPYKmiDH1WFYZ8/K29Vb0OaSy/at82HxfIYfB9cEOXYqVHVrVuDz2DVtdxZp1BwnE3
         8I6TjUinuQBfg7ub2nXQZ1VNxF8Dh8rRvQ6v1ZcHaKiiAJWbwFaD8elgp0+KvD6our8H
         kA703WQuPXKQRSUQSk88UVhG+ryRnO0TiiD3eH1wlLMBjSJojjc6LxEG3R5B+XX/JcCU
         iEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161494; x=1795766294;
        h=content-type:to:subject:message-id:date:from:mime-version
         :references:in-reply-to:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uT5yC1vz0hTCCQYbRPqrM1RAS3M39jnWDO+MUUDgNVs=;
        b=q6wHMyIVbSdyTpunPxjFQBAq/9CIHVOLCSm4X+bek1bl32vA3395lN8zFH517206Rn
         +9/89zT2Wty8RbYnvNNMRsOginS8r9rjZZHP0WffXUJOJJFDDuE3Dbh7k9ziZJvFNXrl
         vhkqQVLCqofh5iRgHxGwRxlSxZjyYoZ4ajPG5mSUnVjXQ3St4S1qUw387xslLXiqZiOX
         qs03UIxh712bJoxMnB2BZQGBsF9iDotCdtTi5+KxmdgxKQwkp+rw0IONZeNGbVZPFL5N
         GcmbxRsncKrbUEyacxrSSnjqtrIf6Cuv8LXG5i287Nh2nuOWBS6AXux2gknk7N/Jp8ow
         UkLQ==
X-Forwarded-Encrypted: i=1; AL+hErGWatOJZ/3OjXDofeALb0MwuRR9kGQ7AA8DOUIb6XSZZKv5v/VEEPgT49gl7q8FdqmNg/4oiBUhJ8N3Dn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IhMLcbVW5vcsFn5iLgN08D5w5NH5Y1QiNrKcXvJkeORfZW6ed
	TVx0arXAy9RpghlICgrl5MUJaQ/yJZdAUyt/CHyks1eAZWFNupa9Mc7lCDkIgNF8Ont82li9eNg
	e2dOonl4houtGKTQVFobPfTocstG1DmE=
X-Gm-Gg: AZFdTZfxCzV4E5uxtCNyIyxLZXjK6PW6l33RzFfCASgKCYoAAaThaUh5srR73dolRB4
	OmKIRQUQlaKd3NcZ5lulXQkBqONfCdfKZgzQ1YFEJIberN/L+vxyCIgT4pXDLfnIm5H/sZjqLcz
	Ecubtas5kh2nk8og12xzCDv1ptdnN0tKa2oemXD4lJGLCtmDUR02NI93ZuFOFKyeVr9nRtjP3jk
	MqX5DtClhfybTAtiHJV88bLHl/78fhLWROrduKMt3Hdy6/GdsIC1MCFi+nWCDk+hzs9BMdn1OTR
	weU3ngDArLGxtnAMa10S4IJHzeEwTZ2Qu1C/LtPooYxq6EsLXtuH+GTtSH9rnHqkY2L8DfWn32l
	db7seVs8PXB/MOoTLZfTsT7GeHEQy0OvOH9dYOStYH8bMXj3/t19WfjVlkvV9OWErP8rEXTCq6K
	LLRPfKX1jl0UekZU+19DxcfazUh+TL/JmMuFGBuEeJO6k/RL9kbVQ=
X-Received: by 2002:a05:690e:b81:b0:67b:ed25:6981 with SMTP id
 956f58d0204a3-67df446b547mr1140071d50.77.1795161493596; Thu, 19 Nov 2026
 23:58:13 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 01:58:12 -0600
In-Reply-To: <2026112041-suffrage-bonanza-e079@gregkh>
References: <20261112-bcm2835-audio-unused-decl-v1-1-3b63a24b033b@gmail.com> <2026112041-suffrage-bonanza-e079@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Yusuke Hayashi <yusuke8h@gmail.com>
Date: Fri, 20 Nov 2026 01:58:12 -0600
X-Gm-Features: Aa3M54rDBssWS8x-mWGeSyXCm49DwKaFGXNNyDKNZuSemUCxLCe4Jn6SB8XT-cU
Message-ID: <CAB59oQ92ghkX-GFoZPU8bVSe+DPEpfDrjs2aO08AAG0Ja8y0Sg@mail.gmail.com>
Subject: Re: [PATCH] staging: bcm2835-audio: remove unused bcm2835_audio_retrieve_buffers()
 declaration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, yusuke8h@gmail.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2026 at 08:21:51AM +0100, Greg Kroah-Hartman wrote:
> Please read: https://lore.kernel.org/r/2026080354-skater-urgent-31b2@gregkh

Thank you for pointing me to this policy. I have read and understood it.
I will drop this patch and make sure not to use LLMs for drivers/staging/
cleanups going forward.

Best regards,
Yusuke
