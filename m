Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672127;
	b=OrT21J308JcREmtz4nn2fQSvntwNihNkJEFDliAEy9Pz4s2WytmmQmbksnrz0rci9gd6
	 PAmGkURdd5xz1oagkZa+VzIRCB4DBM10LHV2hhMwEUnvAaImP6EhIEMky/VLnZiRk/i/l
	 g9LFLwrpsP9+lzPqL/NJFA25+nnC40tZX/F6Lm/0hmnqV/eiwUCTT5RjQaQ3WZhzYucEL
	 qXXIdIZc6nAETMkH98Vs8yW5KBmwB+bTtJqkgtDF/JbI26ztR9jiHc+gbNINblxkSssT2
	 vG62e7Dg+V+uPskaT+gPdnNeNUR2Xc4T+LFcZpq8W+0Fdvor15Px6RLQgKkQXkfS2RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dB5Cc0GlIwAe8K481F3VemkeNW1/IrDh/4u9ChxI8ZQ=;
	b=R6y0woH7vIcxpfbWK7EKZpOFoTGkGTr5FKOgRTCi57NJHuOrmWms3aSCMMtzA3WZG5vO
	 ahupThPojQG8rI52focxh0UK9pumIfPqg+gCFAYrDKkIAowQBtBOoighy3avl4bq/Ton3
	 Osy9whYd+vtcrRovt16392U+u9eDn7gRWfGpU+BWyp/G+YTTKG7Zjy1RQty0e5iT7s9SQ
	 W2TxAqvVxURGmPJgQSC3M6t2focd/bbBDNngSzgGuQKDtAwdJwlEKWQWJ1/x/CLCjBhxv
	 u3c6CyCoIm2EQz/PO+6jYPWaZFpMrhLqkJ4Jn/8IimuKlrDGLrD9kqQ7MuGzw/N700g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y7cYVK4Y;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230A6606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 230A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y7cYVK4Y
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385c497bf94so4682534eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672126; x=1796276926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dB5Cc0GlIwAe8K481F3VemkeNW1/IrDh/4u9ChxI8ZQ=;
        b=Y7cYVK4YAyORmvwJGgHQkJmCbjNQj1MahNRXOkKUM2+or7Dp3kSTuwH2dkxXorV5Aq
         8uQmM3WipZ9LGqJBq8n2JGs0CkQ1MQ84pF5Yb1KZNpcIKzXdHNKMWzI29/IutitHwcZl
         +Knni/KfskM/TU9DmO7AAFsnLNeTOUog59ju2YsxtYzeUQ/H5F4LWv2ATDqhfS6m8W4x
         B4VCNUsiQhd7yDMrS3iAcFyBTm94BWlfLgKWGoXO2DCTJf5Q5bhrMJl8H+nT4YDcamw8
         V0WWqkJYJ2EUlatDSqBpD6s2a3nOpkBBLgwEI68Uugntz0K36Z63fsw35FVvkJpVHWwQ
         p67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672126; x=1796276926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dB5Cc0GlIwAe8K481F3VemkeNW1/IrDh/4u9ChxI8ZQ=;
        b=Te2tN4YY3Gq30QMbCamgkQHqasa0MPETqwOSDrSv2mQtRoLgK6jCQ+M/Tfz0Wrc8Yh
         B2//i1/GZCgq4e3u89WnPe8c3sjNRN2k9dAzKUypiMKkjUr8rvNd8c/WNmV3VzNk5ORJ
         YRwEcBR1Tik+G8YBZXFt4fyjOfPsyezGUcGd98tQAQFECrUH2ym9kj6uas6YtuS70RFZ
         aSI0QFUQMuIOrcLZ7swbf7PieU1XlySSUVb2XHMeJ4p2o+5iBLlIr+rGwgZDYZYywikf
         WRPrZceaHdTMmg2e4Eq2Ok1+3eSdMHBea6j1vNg8zGU4L7LQxExEvv5tbIVkSpTDuXy2
         Xbzg==
X-Forwarded-Encrypted: i=1; AL+hErEVSKGNBwSli3BaOCFOGIkzbQwEqXqc7VKdmE5koiJpghu89w1Buhsh95Xs+rkqMiXiyHopvR5UL0gkHj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8c7dA5w+Oc8tscSMDpTkC3nGe9lCGHCReeVUYiWbUAk5Wjr/cs
	Dv3rhQlFYIpR0hA8Bpj1D4mbt1zcd+SlvQY5QpvzAw6hNCxGrlEqMhozEI5vGw==
X-Gm-Gg: AZFdTZee8U80ElewcYsvfgsgVnHQiKDpxWfRC+pA6b1+ddqsSHTBHIzGdrrakmCHMJp
	hW0hM/hKVAWD21K3OF38mrCt3wxzhFadrq8z7x8FQB25bnPOWwELbfLCRrVbNUFLgVSLuK8Waaz
	dFyv0D8Fp9OHlqDeAOtaDWybM09Iv1+4CjoI5bQQ0wv3ZDWH2WC8573doLHqOT1CUfoet8G4bbu
	ZssMIZ9y/N7THdr/rmB5cTWi9eW28rfAgADR41QU3LM7SXY/kD50UcrYcdCZ0mDO8Cma/WTLGXf
	01p8G8fiMF/Wx2ecPnPT6fqBRIORZPwADBUN+lfRPVPBWkSz4qrnjSUi/1QeOqVKCkPSR5zWjZT
	cG3GU4fXG1bjLm0VLGNq2bkjonlO8OEQ+0UQrnNaDamGINPCIJ1poygKCAkSAdYStK/Fa1bxF8I
	TYGYz32AvrqAMb7MIVEPo2zkFT93bRLlw1hIZSkhf+nhgT/tZEiKCVkIC5rlRAdCG867MvWBUFd
	t01bePd7T10Kw2qB+jR2kDezITQ/WJ0Mdc0HL/T+vrxxEApVUol0h0E+gBxj1MdajwR3OADYIqV
	4Wnph3H3UTpIa91PRAsJVE78s5ASihxU/2/JgP0TUTSvDJD//shLCQHzhXqjhaOaVcidhJw=
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr17113659eec.36.1795672126140;
        Wed, 25 Nov 2026 21:48:46 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm30832597eec.0.2026.11.25.21.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:48:45 -0800 (PST)
Date: Wed, 25 Nov 2026 21:48:42 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: cobra - use scnprintf() for the device physical
 path
Message-ID: <awfIN2YNK4aY0l9l@google.com>
References: <20261126035206.1062-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126035206.1062-1-chenaibing@cmss.chinamobile.com>

On Thu, Nov 26, 2026 at 11:52:06AM +0800, Aibing Chen wrote:
> cobra_connect() composes the physical path of each port as "%s/input%d"
> from gameport->phys into a 32 byte array.  gameport->phys can hold up to
> 31 characters, so the composed string reaches 39 bytes and does not fit.
> The path is informational only and truncating it is acceptable, but the
> call site does not say so.
> 
> Building with W=1, where -Wformat-truncation is enabled, the file does not
> build at all today; COMPILE_TEST configurations additionally turn the
> warning into an error through CONFIG_WERROR:
> 
>   drivers/input/joystick/cobra.c:184:29: error: '/input' directive output
>     may be truncated writing 6 bytes into a region of size between 1 and
>     32 [-Werror=format-truncation=]
>   note: 'snprintf' output between 8 and 39 bytes into a destination of
>     size 32
> 
> Use scnprintf(), the helper that expresses a bounded, truncation tolerant
> write, so that the file builds warning free and the intent is visible at
> the call site.
> 
> No functional change.
> 
> Signed-off-by: Aibing Chen <chenaibing@cmss.chinamobile.com>

Applied, thank you.

-- 
Dmitry
