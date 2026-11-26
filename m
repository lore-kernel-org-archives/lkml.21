Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682710;
	b=uIiQc60v/qoTnPXZ/uaFDOnag9Qllh1w2FjzgdBGaYQooaLxHhvAGSO69Z0eKSKeFJOY
	 UU7zr567exgXduS3K3kgMIh47JL3L4iFf5ejNSGD8yhYKYfzNNzJ2Krzvjeot8oBQ4Shv
	 ADxCfeGiimVtB0yui9E/tlvpWTVzCPV7i9+uV4zWzS4zSaVw4oOuOv8qoYJdAgPWdJFaN
	 5i3frYFuY7T2Qt3t+b/BHrWANSgSJTcebjxLIc+7myl0ADqOxNsGpPvYRglzP/rfhdFUK
	 VRrw4Kv/Pf9Mlku094PrR7J7bcGnZUF1LhY//X6u/50VsJNiREYwaSVylgtY97gvy9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HHkvrm/cXf+KKJ9uHpRzjH6xQO1oeJsTmoSROPx2mwI=;
	b=E3FHQ4V+CUuqThetD0LE5O2JTtqqxoBzPmGf3NrhYVlD8TbW4b7jrQSQGwmv+f9lheeQ
	 /iInNTTm2uw3GG9Rriq5SCXW2Cn1J1si/wyK8E074X0T8fBqmUVXUhmnxUgG4wORxvsgp
	 U/3Ft9sLCqlNAYjQzEdjM+Zf+fJ9PZEnZNirTW/9u4u8X4T7/iQbm2r0hPq+91c25sU/S
	 Ex+HwCoiwJgKOHlp6b2kKvZlUTT5/CtmbGiKaWtNNI4qoCBSo1Od+yGWThf96WkZZ6FvL
	 jXyML8uPLdekpwjIVoCD9+rG1p8wSvQlM4kLEex1naAlHKRX+UQvPl5gENfg+VR5smQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIzkYU7m;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA52606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBA52606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GIzkYU7m
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f0621eec70so47299625ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795682709; x=1796287509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HHkvrm/cXf+KKJ9uHpRzjH6xQO1oeJsTmoSROPx2mwI=;
        b=GIzkYU7mFawi1+iRiV0RF7M/b4yifGUAf2zlUiLEgPlPCSfyhLH2zBUsGxCftKDpK9
         x0lpCBorByFuYbZhfoDa2xtq5zdzVOZV6GJiYmlbe1T/z1eDnfc8JHPHekcgamGasQsp
         bQtvnQqsbxCi4OjtLs/VcT4nqZSkaNwnzfM1WcrFzNOyawI/sBVtAzzNGhMvlJ+ThxDA
         ji2PPdrZnPQVY8U7thDWl2uczfgMO/e1LiqFycRABmMY7MNSz+zF3o7aqbpubh+PWeMg
         GdnpwX+pHcvzA7/AAI9EKLWcvZG1Lp+1MkDcVB+tuacHSedcriA1WOxWPiYfU+eeEaGc
         diZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682709; x=1796287509;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHkvrm/cXf+KKJ9uHpRzjH6xQO1oeJsTmoSROPx2mwI=;
        b=F22IFxCL5oGSI+FMjH0f/sjcNvYg7aIuyk111j4F3GW8GURZbbJVOEzMj8eWSw3N1g
         jyIWo8yL5GGLQmAhkhADN4rCqAN9FRLgXG29tlKwZxJnFQnCaPYI+gCaL/tB3QQ49/ZA
         RrhleQUIv/kKslh0M5ZXRT/luaCbXpcFLUrh1jA5j6J30iIDgEGF27I3tNaI2k6qOW/t
         C0oyEjboV4fo7P9H3rDxnBg6doTtuFOKIkHMsn2djMqMIKvQRa/4XRtxHGfYJXJNnBbi
         f52DiSOVPJ4f1L2wjMXbUGiEinA7NtbSvYc+YUA4G/mhX+5wxy6U41Udp0IVWUufv+Sm
         ARVA==
X-Forwarded-Encrypted: i=1; AL+hErFqDORtuHe5UZZf1vSJB28Gn/L8a6TErMfKWAsUNr4Gv4tmxxrWKVyXyd09QNMtNhJu9EG/Uzh8mKBI4MI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/L3jFr6vJG9oPRU/g0AX4hYxI0dWX7OAu0zjxv5flUvCizEeiz
	rPx6+FdRiaAVvrjrCOpI1Pj2g8VEkqVxljrT0Lp9A9U47uQUseuv/W4Kq18UHe8aaOE=
X-Gm-Gg: AZFdTZe/58P8bZXy3KiI5XPd7p+JthaeGGANQTx9gxyZPm4WL1ZiO6trISvKHra+uBb
	iGwZmumpKElU16+/e6YqM4Lvl3j0qdY0oiK+8J8cd13hG8dOTDt1o+btVY21RHfwYl9tnEosuLi
	egUHtA51PtlJJUKTESP1biPEwuyvqXY+TZNGl09Nyn8tSYfh5rX9kUFgvz26PlZeAVX4c0hGnZb
	98NkyQL85k3j4XvcTiWdmsKj0b8MAxCxzMNPLSZ5zWE9KTuKFpLkl1I4+LnuBmVcO/MWaQ9poKC
	JfF+fslzbZSqGGCJZvJiCiP/HVG28/USloFCKhGrdR4+Dns21QGyV9I5OBTdZte9iaKv4FWN85f
	0IGkOiYLISUfT3Rh0h08aPvikblv1Xsvhb5ZCSxcJniJNVfYmsEQIfJyDdF/hXJ4XjAvSS3pdYc
	nofiy/djc9nJPx/b8wl21DnJ90mxIR2QK2+j748zkTNln/CEKr9cBqjGgyzXnVW7g+R3HKl5mET
	U5whsFAf489DygGTwOq5YudsBUo+2WHV/9MN3IMMz+xUlRDy4OczRZL6kcZVOdmCYjvIOjSY22A
	JPesAoeSHr42Bll6Wiqrj1NWIFHEoAPCsLdJpubk
X-Received: by 2002:a17:902:e849:b0:2ef:f37c:723 with SMTP id d9443c01a7336-2f03f1cfb80mr227770735ad.9.1795682708843;
        Thu, 26 Nov 2026 00:45:08 -0800 (PST)
Received: from localhost ([27.122.242.71])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm102021965ad.6.2026.11.26.00.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:45:08 -0800 (PST)
Date: Thu, 26 Nov 2026 17:45:06 +0900
From: Hyunchul Lee <hyc.lee@gmail.com>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: linkinjeon@kernel.org, liubaolin12138@163.com, ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH 1/6] ntfs: mark the record dirtied by a resident write at
 iomap begin
Message-ID: <awfxklnX3OVrMoom@hyunchul-PC02>
References: <20261125073547.154150-1-zenghongling@kylinos.cn>
 <20261125073547.154150-2-zenghongling@kylinos.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261125073547.154150-2-zenghongling@kylinos.cn>

Hi Hongling,

>  
> +	/*
> +	 * The record holding a resident attribute can be an extent record.
> +	 * Mark the record the lookup found dirty here, while the search
> +	 * context still points at it.  The writeout of the record cannot
> +	 * overtake the inline copy: it is serialized by the mrec_lock held
> +	 * until iomap_end.
> +	 */
> +	mark_mft_record_dirty(ctx->ntfs_ino);
> +

If the write fails before the data is copied into the resident
attribute, the MFT record is still marked dirty and may be written back
even if its contents have not changed.

>  	a = ctx->attr;
>  	/* The total length of the attribute value. */
>  	attr_len = le32_to_cpu(a->data.resident.value_length);
> -- 
> 2.25.1
> 

-- 
Thanks,
Hyunchul
