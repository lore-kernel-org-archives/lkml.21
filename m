Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795196526;
	b=I/TD1L47Y1BMoFKKvCN+BIToYBlpihO8hBu508ezVyQkDaGp9W2tbI3h14nEc0/cUfyY
	 PGVZ5YVJ5hZTSSb8/hIdqrduUgPW38ASUmgXO9Dh9EhPlwHSu1K8zlyP6CL7+kCmEBu1o
	 4h3XdtJ36J0sQ34ZR1yLaVWP3n94emrqEi07Ka06x189estfI8QiVLTCR/B4KaxJwgpqp
	 vp+WMnFdqYlxjZdKVh/75rcW6LBUDazfSWFyuXKDrLXEgjSA5aJoK7c5WtmJreVY+3v6X
	 OeEAt9cT9y7v3yKbf94HKG008toE1H5Trs2qJxACrahBXQ7LCibY9AHupXagCJaavAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
	b=dC3EMkucXxRN1vKsaeRqvaD89GWw2jTfoa7DYZ9NKMjq+RQBg4pLMMeNN7PxloWG6z2m
	 hVd834w8AkJAp5QE+sPE6rAzGrUuj1aplRsIJIaXFPRYGAlBB10FCQjy8iYuf81qJr8BB
	 MxjdcWV3ARVFDvfxJyVkRZF9oNbuD8nx9KUvBUzCWA3ioUS0uALZnVSI/tYONJgHhuWVa
	 WJ+1NZcnXCY6nvNwXlI8EbdR2/QCOvXUTfSrok7U1CCLEFu9iyWZ/56oC3GJw+70ucwvj
	 ChwX5mYr+1T+CbAf/RUGtbqR69VlQQlAL4HS6DsWyyKjbZDCvZVs3eVqUq2YrhI2IUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="mJ1Ij/nF";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DA2606A7C2
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0DA2606A7C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mJ1Ij/nF
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-54492d8a988so281cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:42:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795196525; cv=none;
        d=google.com; s=arc-20260327;
        b=Vzu15dM9ot04KHW3DojOVClVSthM92eQUZjzw+2bGDWYzxYWfixlSvIzym2IdAc0rT
         LrYub+1yxB4kuH/tPwrs0yGix8Ifi1vDYMsWqSDqXsnaJ07q55Ul02AaPSNj1wIdBKjp
         XhNJwS9CqPXN2OX6k1v9EpOteHmpyJNneot+r+SzV942JSgNNIzUu2yZsHVknzipIkEs
         woj7PrlmVYkHpPV4Pz2XDuGTEPU8kHwQBTFxmOQO0nvLTmLUAnQDr5hq1v3aKz2hkFMp
         +p+WmO0hztwkrvWPSdHydEiCI10mW3gRAKF4KFJBlvCMb6hD+7cAFcKi6TJxe5GyvtLS
         RQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
        fh=F15sItDv/63poX07D+jL/SGXBJsMLYLWz8IlEtaIBMk=;
        b=luTFMIzGI1MtDQ2lZKpq5fX/2UKskjBOLMx+saTkFo3MnZRwf1ZnIdNU4nMpeWiPBW
         Tt3uDMu1eTPxlzo4MDwmYnUPtgwzM2SHnjJFHJZeamFcTGyEDS5R6OWbMxDyTioeXuWd
         j/Yeo31oCPUo/YvH+tr8CCC/MpJVAligwyPZnQUE35vlJd4WILug3CdrRd4LvAoMTy0B
         8EjRIFNBaYgiFvJUYK2zHhdNKXyAkQeoJxP2CmSIRtpqcZug3GQ0FRWWk1Mb+nOXZAGF
         rafqBQxkOhz+xPshpuPcLfjVGMndVtFgHlQSR5n6cvBhk5sjM8I/pmWEZT2Tx+eJdqIT
         Tv6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795196525; x=1795801325; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
        b=mJ1Ij/nFdAEldwa1bKqHJeawNzo89wlrU53BuQWpRah024pVOsGHr2oE28U29HAjXq
         NsZoZe94qH2vwDrlK/MLLgTg6kxr/kj0UdSuJBRgSAdQSWfJeagQ7/w0kpmeLw4lhSXd
         R11KvgR4jvIo0OYszlLSmRcigICxUArNvJI5QBPwxxpxAnqCz3iQkRLyjf/cdBr8ZjoK
         KNUT95tk0V0HOT7Jp6WSDC2i2xp37V8iDovu2VLtzS4Cw+58d9+/9v3XnXD0f4G7sq4v
         6IcFr6QibdmO/xCGSjm8I1SJv3XHScRVpMex/gS6sVErFVoqUCCrnBaq3QgWr1pDqJNL
         wb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196525; x=1795801325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwdDvq8gf/8FaQGY9k5cefpkzPVlUilKxb2tJP1eGzo=;
        b=yR3V3jkOj3arz1WtXkRXU3kK/c8XLBqVeIxGgpcWjt+C62FYMOoaHqyjYZR9//Q81b
         MHwmFXniPBZXpUWEsuWWYKapYky42V3fziNl1oR6w1TVjpnRulDx2gtt/c8RHlAB/pgS
         PC6tyOUDhjboBi4nUTQZGGEKa84GJjDmUhyHenMjSxs6seVvjWQ1/x4+4Eyi0sFkLga1
         uZLQwPp8YRiPViHSCkVGEAZufYwj9LJI64fawul5+3xDxWQ5X+/vq3I/ZKTfe5csOoR7
         eJST6Hwy5WVe7agNcM4ktVKZ3jj9In9rKg+J49Q3TS7Y5CP0dFmi71XF6bKwMwKKN4c4
         ITQg==
X-Forwarded-Encrypted: i=1; AL+hErFWb/DG0sWhzIsoW89mXXChY61kMb+xvQ83ccvrHpE0pCdvFJnh22+Br3i4m7DAEwNmEb5zQxMH+G+4Iyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P14XLJSMbvvxNpS3K2uqRIlRS5M6f6ztJuV9n68yCMOzhkafk
	TzVMoMBHZPJ6nvUP2YsgoZY654bXHEhXC2w1iY+WZ8aPeLG9Qyj65K4lde3MzzZzKO7rEkvdYdH
	FMtaEpWbun3VVp7JRLjlqYbaPrBUVmV91lqO3+EAoV/FOt1N50++BU6MQWcM=
X-Gm-Gg: AYBFou0u3VIh8l0MgvXowRNE+1Ywip1/0F/0SM72mvnNyESulGHyhQj/bciOBmay7Ke
	iOF72ofHkcTa0OByR+g6kuyUfCaANt4491A6oQpR70HJjGWcUsatvw8P4b/uQ29+jdxlaDMM9fN
	rVNkq/mz4E0fdOTIw/T1xP6JlkeH7toa1UpKGjs2NILN+KFnWHKVPtvE66MEntRydBULGaQm+ho
	B/sUfONSVd28iCXv79QiIiA+8Epz5HoUFN/03wyerLDOZh3+vjcYftPAgY4N6ZndxYu9nMP5fyE
	xgyjTqc7cWxJGLB+WGUos9x31E090YYP4JnPCoRzW4Z2swWc3ZcJ+k/zi6ppCg1eBFSAct1tQPF
	4n4ibHU+fFQ72eIE5Qs4YRPXBFBwbQl68/QwE
X-Received: by 2002:a05:622a:5a17:b0:531:282:6560 with SMTP id
 d75a77b69052e-55d7a3bb532mr19021551cf.15.1795196523725; Fri, 20 Nov 2026
 09:42:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119170722.1524088-1-irogers@google.com> <20261119-magnificent-ecstatic-alligator-3f4816-mkl@pengutronix.de>
In-Reply-To: <20261119-magnificent-ecstatic-alligator-3f4816-mkl@pengutronix.de>
From: Ian Rogers <irogers@google.com>
Date: Fri, 20 Nov 2026 09:41:50 -0800
X-Gm-Features: Aa3M54ogoNwKUPyvyvGecVyjPhxTJ1dmEEtQ54WzRJLYnFxgBCjMRa5J1U0aCPg
Message-ID: <CAP-5=fUxckfL0ZCa9nVf2sOAdinw_HoVkd1CY8PwYnpKFxLWww@mail.gmail.com>
Subject: Re: [PATCH] can: softing: lock card->fw.lock unconditionally in softing_card_shutdown()
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:27=E2=80=AFAM Marc Kleine-Budde <mkl@pengutronix.=
de> wrote:
>
> On 19.11.2026 09:07:22, Ian Rogers wrote:
> > softing_card_shutdown() calls mutex_lock_interruptible(&card->fw.lock)
> > with an empty if-body ('{ /* return -ERESTARTSYS */; }'). Because
> > softing_pdev_remove() invokes softing_card_shutdown() before
> > unregistering netdevs or removing sysfs attributes, a pending signal
> > while card->fw.lock is contended causes mutex_lock_interruptible() to
> > return -EINTR without acquiring the lock. Execution then proceeds unloc=
ked
> > through IRQ and DPRAM teardown and calls mutex_unlock(&card->fw.lock) o=
n a
> > mutex not owned by the current task.
> >
> > Use mutex_lock(&card->fw.lock) in softing_card_shutdown().
> >
> > Found via an x86_64 LLVM=3D1 (Clang 21.1.8) allyesconfig audit with
> > -Wextra-semi-stmt enabled; fix and changelog drafted with an AI coding
> > assistant. Build-tested under LLVM=3D1 W=3D1 (-Werror) and -Wextra-semi=
-stmt;
> > not tested on Softing CAN hardware.
> >
> > Fixes: 03fd3cf5a179 ("can: add driver for Softing card")
> > Fixes: 47fa0336c1b7 ("can: softing: softing_card_shutdown(): add  brace=
s around empty body in an 'if' statement")
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> The driver is being removed in net-next.
>
> https://lore.kernel.org/all/20260815103428.117201-1-socketcan@hartkopp.ne=
t/

Thanks for the heads-up, Oliver and Marc - please ignore this patch!

Best regards,
Ian

> regards,
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |
