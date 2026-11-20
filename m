Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186840;
	b=1iDq407iRXrfgWbD9Q2jVuv1187AoUXRHnu9DynyGpQRpBLScPTU3/hieq5MiPzSRX2u
	 uNi1L7GigY5d8Z5GKi9wyhICyKbAhP8en27rEqKg8WNexLltdr2YoMCOFmE1q2xLFllBN
	 0KL6LrmcNx8ZRIk6tEpne9tARCxYZPr4MxY20vfR9b9TspVQFcB/IgxQ0PinMG3yt2aUB
	 6CR8jtikx1TZ1IrAx1G2hjyeGCSbFORdAA7gp8NprIOAhboHQe+GkIhGEcVIBBrwtSDPV
	 KDqwiy/b+nqb9apfyRi3y2h7xGzpJ2iOIjXJBGXqUlnSbT/ROS1oBs/XlyK3Mgu4sNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hkTkGMTtUaKFrxnBbafQYRcaD7/eLuV7pxYbd80cjOQ=;
	b=0qwxnOrhgFhGzX4YLWLcTHz4HsRNNKNBFlpM8B/nEVyy4KN5m+vfDSeqXFkHcPomvSAD
	 2oPBPGBn0YR4NqWgVliAkSl2i7U+cjr+OMnqavAV45BduDpK+4QbQWnHedydtTs1HSgWV
	 vkq7bvjMhRmF1vToQbPdNtNQWb53BEN5xLGfXOGdmLtrD3yA08q34KGFg4z4U1aPbktOz
	 K06YjV8XY+Bb6rYeXRuc1u2z18j47/ptgFDIdNaT4ivld9JqU3rcbalGRehBu05mp431o
	 c40rf0Hx1HqfZSo+awMluBxDujoYZrQcPob30XxkIX6tCmuMOQ/Z2WFdVY3W48bYB3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF1d13go;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA16074D10
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6BA16074D10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NF1d13go
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492f0a1b685so709892f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795186838; x=1795791638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hkTkGMTtUaKFrxnBbafQYRcaD7/eLuV7pxYbd80cjOQ=;
        b=NF1d13goE0X3h4LHbeoKQhvjOGCBgTjHfoH2p3U86EcjWwrH6x+A9wj31Xf8bxHqAg
         0JfL62Y6t6Ug6iFOc4WXvJiOicLSLI2QAsHmF/L16iloMf+HFXUBHbq6qh3D2pWobnD1
         omjeFcBljrsLUM02kqiWQUqPg+H5JZeaA5IKVIJKkokvBFPi3qy89h8voY8u/tmjlVqp
         NdhkAb2qqPGhGBnCRGSDDG2d0FuTI7BFs5qgEqjKmN0HYJn2ZlA3pEYQX1yRuCRwMdHm
         kC7TlHHagKgrFOorXsJeV1CTzUJer7fvuHVO5NrVIDvjMAZxcZRwHHcXXo67uV0ENjMU
         wXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186838; x=1795791638;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hkTkGMTtUaKFrxnBbafQYRcaD7/eLuV7pxYbd80cjOQ=;
        b=ChDC2AmygIb3utd+HLCgO9pn+O09rI4QHamPsUi/itxkJttyftEw7yaP8n85T5fRZf
         pm04707UNPDX82TJCJP1VOv4R3IUt6MnWb+v05Do0gXvF8GL97GsskH8ug7xm0SQI+5/
         gEbKH3iGNNIxJ2DeaaDMb7byYa64Vkp57c2u5aoiPuElCxXFpXrIDfkXyTFOH6GYDGnQ
         q7oxhtfhV4zAqILyherptGHoJfb2aoPUsboehN52reau7Q7G/n6/Ls2MyLsEPBGQUHSq
         s0pVPVca9N1zB9IJj9jNlb1H5mHVMtmGv4j4ssYDWU1665fLT11CY8sLOsWDput1Q+HD
         FEaw==
X-Forwarded-Encrypted: i=1; AL+hErFRSRgbt0hSxQ6Ox+7bFPU6hwT5Tk18aI4C5JE4gGi0aoONtLfnu23MPuS+iRAvVzyXEzdRZl76Ht5itUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FzapmzEAk2dxSChUherXSLjOkPYuS6fhvXfktgg7XtmbhQWDt
	TuycM3Xn1m1r1apJKEp46aV2dCXtuVqu1SnR+w5r9SlXIfA7cwdGrY/I
X-Gm-Gg: AZFdTZeJXtICHsaHCtMby5d4aZJSz5gXykWYQzbuuANppnos6wVTdhvAOb2341Ofd4J
	Ohn+UAhwrOuzD/73Me/iCB2CSGBUJvbEhHqfwCJf7rZ83Dpiuw1hs4nJ7HE3I+rpgTbiqWoz01/
	oTiG/abzZ/tScgghb/rginG979vFR4dhj5AJ7ss8qvEOtzEzIv3OS/Tkj/i6PCPs5Ull+sQJlNo
	fjtbrBJNEFYT4u4CVhv0uR3oYPK7nqUMwptHYbn0lLiMPzuFkqI3XjveqTsaFnj7G6TIDo+lmsa
	IQ0AUTZ91V+HyCDOdZJrVMKYrnvMfjyh5T4KdWGD6tEQNoZvus2B29jmZ5y3ne/dq/x6HcOG/lL
	EUXBZvDJ4zdAlUA2CViPscyACN/cHnSSnT+7ah4VEmNeFGZuFbwB9W1gBQ4jsZdG4YKPAucgioQ
	q3Tp/5cBTzGgBKT5OJ5ZkSmZCoKnyBeOeU7UikuPt+vsvz4Q2UUrV9zc2hMOYS1KdFyDjlfZy+w
	O54s3ndgtTpLOyOnm23sa7u6bp1eOrzsRUK0j+B5xNUJcjVclmWhRYMQMho0ODKy/PqLrHvt+Ae
	mbKgZ5TsMm5Yxb4pfwi/jjDVGU6OKgkSgelWeg8Ighk7fUTFYBBC/AEpop9r34lo5g==
X-Received: by 2002:a05:6000:2489:b0:48e:2108:4d28 with SMTP id ffacd0b85a97d-4abb1baaa3emr7219457f8f.13.1795186837816;
        Fri, 20 Nov 2026 07:00:37 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680483sm6063058f8f.28.2026.11.20.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:37 -0800 (PST)
Date: Fri, 20 Nov 2026 15:00:35 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mips@vger.kernel.org, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Paul Cercueil <paul@crapouillou.net>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] MIPS: Ingenic: Allow assembler reordering in the XBurst
 secondary entry
Message-ID: <20261120150035.4ccbad0c@pumpkin>
In-Reply-To: <20261120050827.804767-1-f.fainelli@gmail.com>
References: <20261120050827.804767-1-f.fainelli@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 19 Nov 2026 21:08:26 -0800
Florian Fainelli <f.fainelli@gmail.com> wrote:

> Remove .set noreorder and the two explicit delay-slot nops from the
> XBurst secondary CPU reset entry. GNU as emits identical reset-entry
> instructions with reordering enabled in both the CI20 and generic
> MIPS64r2 Ingenic SMP builds.

If the ordering actually mattered then the fact that the current toolchain
doesn't break thinks isn't enough to guarantee that a future version
won't find some way of generating invalid code.

The explicit nop in the delay slots might even be there because there
is another reason for the .set noreorder.

If nothing else the commit message is misleading.

David

> 
> On CI20, two baseline and three updated cold boots brought both CPUs
> online. Each boot passed the CPU affinity check and 100 cross-core
> idle-wakeup round trips in each direction. Codex assisted with the
> assembly comparison and hardware test campaign.
> 
> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Thomas, feel free to fixup into "MIPS: Ingenic: Add XBurst SMP support"
> if that is simpler. Thanks!
> 
>  arch/mips/ingenic/ingenic-smp-entry.S | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/mips/ingenic/ingenic-smp-entry.S b/arch/mips/ingenic/ingenic-smp-entry.S
> index 290e23c65707..d6aa4b4b1a17 100644
> --- a/arch/mips/ingenic/ingenic-smp-entry.S
> +++ b/arch/mips/ingenic/ingenic-smp-entry.S
> @@ -16,7 +16,6 @@
>  	/* The CP0 REIM register only stores the upper 16 address bits. */
>  	.section .text.smp-entry, "ax"
>  	.balign 0x10000
> -	.set noreorder
>  LEAF(xburst_secondary_cpu_entry)
>  	mtc0	zero, CP0_CAUSE
>  	li	t0, ST0_CU0
> @@ -32,7 +31,6 @@ LEAF(xburst_secondary_cpu_entry)
>  	cache	Index_Store_Tag_D, 0(t0)
>  	addiu	t0, t0, CACHE_LINESIZE
>  	bne	t0, t1, 1b
> -	 nop
>  
>  	mfc0	t0, CP0_CONFIG
>  	li	t1, ~CONF_CM_CMASK
> @@ -50,5 +48,4 @@ LEAF(xburst_secondary_cpu_entry)
>  
>  	PTR_LA	t0, smp_bootstrap
>  	jr	t0
> -	 nop
>  END(xburst_secondary_cpu_entry)

