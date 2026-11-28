Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795881730;
	b=daJDJtnXw7QIh6e1E5uzh9rgUlc3VK/n2m+Us829B5ydJlHhtIJD2HC5ZJIQvXQFWDTT
	 KuAjPTM+0ZbNpXQvvJ0bRVzRKd07K+/qkK9tCuQ1cYk1zzNuujs+on5YWbgbAcHiB8Ete
	 iKIh/gAm37IXrK/H8izJszsKvqeVKxAFHb8RY6lLpANmksQ5A++RepphERXUJypB5+TQR
	 wHDGhzCqG+pK9HliKBi9bjPrq4wwDo79AArRkx7+cmGEgHKsPvP2px6Cy0yz8M+bV1rAd
	 MLFn0xZ7erHQ19hqeHuUX1YOONMopq97JCbTDRYg7qokTMCPUPYTOh7kQ0lE5jufCUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
	b=CA8KJPgWWcgWBL3InExEL3W2q4BMeHwiZ7lwP18abnr1pn4CZhRYY2kiY1ptMPBfRcCw
	 jZef+r6x8ZLDPZB2P5gVP1QWCQK0V87TQ52apdBS0G5IJjyyZkt1HShNsOnTO29vjiX8d
	 srmLtN56p188EmvjA44GTVbAuKx/e4AYMrlVSW2LSIlhFSVQSC4hgrvgEi3PgqmIrLi7a
	 cPbdcRAZs6tqc4c1m95ndSavahwERN0C9M03V9yu0ZSLlwIA7Poc6UbzJTNC57rcZXsEJ
	 lDK7qFCS6J92x2H70UWsqrebSvb5KnWNS2gAXpBxhZxi3yRp/v7dhs0ziKK7419hF8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmk8WOA6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7353C606A324
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7353C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmk8WOA6
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f04244c3d0so70440515ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795881730; cv=none;
        d=google.com; s=arc-20260327;
        b=Jq2ZGVpG452e3Ta4IT733np0j7ja7nTxn7i0yIarzO6mj2EQNH0T/Gbati7qiC6l7h
         mNM9+Zyeh1ZapG+NFFjBav0R7fm8ct0T1J/IJQ79BnexB5kuUVsTNarBqBWRacPhcVKP
         Ln4r3bsbeiLXfeWM7BGTJSXQIawAU18L4p63cGpQRIjyT0PbIgByLxER97FvBp7cyQSG
         qdrSBV11i1gKcX8WzvW68Dk4TICbdT+BrO7p+b6R7Z9SDzWAnVv5+82euAmmxVQHpndv
         mMBL7FyMxIfPTvJCNJ/a5BsB8/pLzbA91zzenbDznISnLRzBCz58K2h3w94wSnQ+iCjm
         T5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
        fh=8lj4ZgprgFXKpBnOLiwFhaL6hJzVwnkWk6GmQZ+3PWY=;
        b=n1VFL/pd+Yqnl93HcmLXyjV15L4GRXgVf9y4XPqbsMO9G8SDOxy21Fb/QP+F4ss3VZ
         3w130yNCFSIHoiZf0CP8lJ/b8wBGRD5ueheMZCU6u76Gp+nCuvyocVv1audTvEUS3rAd
         e1zSknuz/BIxNhl+6gyBhYHUknOOTVFkj7U7swLuzoM0GmlDrqMH/jcM0Du0MtdZ9pY2
         m2uAINlIGmlJp0umHwAjPHeAtcq4kF3RI63nJNLeWYwC9Z+6Vm+79VOC1HEhEEls+oUI
         0HzA2somDczZU5T9lXE8Fg+SrfrLNzjns1TzYSh1xNvuLbHWud+mMZT0oEqLLKtQdU1j
         012g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795881730; x=1796486530; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
        b=zmk8WOA6FUDJXkzrmiZ27RPo5EKYS6p5UA0inW4mHOCJ1hJB6wDY9hKSR+17ZPcZnY
         2kTnILZGlnJ1GJmQ0pDqJi4wslgtc0ZMHodhjVE5ntoT4d8YZlOCNUvl/+pZ6GdGYLT0
         ksYHLFxcrRzQ2dhPZd5HqXFiPB36u7RMvM+ghU3XdamPndXpYdMC0fMF8097QQEMsC6j
         dI9QBAnJXx76IjDCn6o609q0v/ZwaWdDb5Ybxq20pCnoVKJQt0BK5pSX26gu0PvWUqmz
         ZFdibwAJBT3b/c7hZvl4zfDW3pS+A2X83GREaAKemKnW6khlworuZeIsiDzWRgv8oqKR
         Zptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881730; x=1796486530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NHGpgIfT9gkN8XNOZtZ1BNbjuZbQs+r1ps/kAc1Q9Es=;
        b=UTpWkF2YTlcRLrTAiwJiiyhgXNeM99hK5WEKOFBZCzslQrDp3N0voatcHk1cSmy5JR
         xcImRcd8v69zFdRc+Se0ryyuopCpcW4G0/ypFoctWy0bm49yoyoqQvQQV5q+JQWPPfGz
         VDiDughUwoo6R1Y0Ydo3GBmobcfY5FWXQZ18vS7ToCL4JmBsTPr9DGQko7uiAFrgdnWH
         JfjyqHxWd9UFYOfjEt1QDZuJKkc8yejxIYcmCSQ2KlctZzghARwmNesSDV5qzZ3r39gM
         QHGdiLjvKCVacUlN+KSvBAX+mcuuTHgOpqMnDnxg2LzE+0CEJco1IFmei4S01fCbsBmx
         gsZw==
X-Forwarded-Encrypted: i=1; AL+hErHThMZKVtvPlZvrdL8J0VhLlaAXtEuEKfaYkjT7RFZcQNKx8knCeVPO55bF0RZ5ruUcAXd+ubSptJl3Ass=@vger.kernel.org
X-Gm-Message-State: APuU4Z87ETf4zOhhQtqB/TxqwU9uDsw91mWHADA583Bf2oKaIe6oV4dc
	NRJHmLJBoo+0M6s6TInPqJmOz1vFpeQW1cW51igzfZFt4C3ZLzbj/cqyAVnWhW78BvriXSI9aoB
	YTkqoun7GAp41yXKUvYZizDHFZ797DV4=
X-Gm-Gg: AZFdTZcZLVx+UcRExp0ib2yL/snvKRbHMwAeG5Rzw6tO4hjLEVBFZrWT05pfG877NkV
	RVQYxdAFfOSqGYr30OvqREHbYoGbyiRvvxSsfwQFlCVuFgzGaFaC9ph2ETvBa9SMjFkkPfEpa3/
	UUdWhXWiQX+5968FS10SZebUo7ndVIlau0y6jmTmye+Ha/RnOZDDQHEEfIQAFJY9FkCxP3xkODl
	irKOK31NZYLlKqUUlofS31VxbMsKsqtQL6xSdi28qbXH9Az16xtzrMYDVs27PKszm0bDokH4weL
	59zVMMzL+smqh7+VDove3MAvCvYguopwS1GzeQ6vPvH+MkcjueNDmA89cg2mMunzE6nQMhDj/vN
	hxmz3AtdQcT1qkfrrStP7CP0T16Q1zXwp4pjdoTaKX7ATuNmWqbu82LYkt5oEDJqp5LKrvIDs67
	6LufQApBnu0K84CroTLDE1dc5JJJZ6uXUhj9RhIOu0OmkJ2TFO301G
X-Received: by 2002:a17:902:dacc:b0:2ef:d54b:fb64 with SMTP id
 d9443c01a7336-2f03f16ca9amr296567885ad.47.1795881729557; Sat, 28 Nov 2026
 08:02:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017182455.1884-1-aamsdoumani@gmail.com> <20261017182455.1884-3-aamsdoumani@gmail.com>
 <awnPKRtczyTiEcN0@willie-the-truck>
In-Reply-To: <awnPKRtczyTiEcN0@willie-the-truck>
From: Abdalla ElDoumani <aamsdoumani@gmail.com>
Date: Sat, 28 Nov 2026 10:01:39 -0600
X-Gm-Features: Aa3M54p_u_6mkEHPaD6ExPttp73kj64YHWdX--Ern0ly-UwQ8x2k4BuVhLkwJnc
Message-ID: <CAB8CcCh+kCbC=5mM6ueqObnDudAkXAw+dv3oG01MdnKUC1__5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] kselftest/arm64: Check that PR_SVE_VL_INHERIT
 survives a second exec
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Abdalla Eldoumani <abdalla.eldoumani@ucalgary.ca>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 06:42:49PM +0000, Will Deacon wrote:
> Since this TODO list was authored by Mark (Brown), it would be good for
> him to assess whether or not your patch implements what he had in mind.

Mark, I took it to mean checking that the flag survives a second exec(),
since one fork() and exec() is already tested. Happy to change it if you
meant something else.

> I can't see where the initial parent touches the prctl() and the way
> you've added the fork() before we even print the selftest header looks
> a bit weird to me.

It's in the existing part of prctl_set_for_child(), just above the
hunk. It sets min_vl | PR_SVE_VL_INHERIT and writes max_vl as the
default. The middle process never calls prctl(), so the grandchild
only gets min_vl if the setting made it through both exec()s.

The early return in main() is there because the middle process is
vec-syscfg run again through /proc/self/exe, and it can't print TAP
output. I can move it into a small helper next to rdvl-sve and
rdvl-sme in a v2 so main() is left alone. I'll wait for Mark first.

(Resending as plain text, the lists rejected my first copy.)

Thanks,
Abdalla
