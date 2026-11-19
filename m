Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795086499;
	b=CouBy1t4iTgodoc1iyJXT2sgPl3cdW5+C0zSXOGAh+vsVHkC0/tSk0SZuAcaQ0RdO2up
	 h1nKyPoqDz5VhHmWIDvJdT1WfJElA141WvmQZwwinUKBeyvgkH8bBlE6gF3WD+YXCqv1S
	 ya6Qrr1j7zu2xPv8mBfWPupVJsIzRvR/8H0DM2HX0F1AIo960HN0KFnHoh8GGQHCmRu1h
	 1pdIlbH1W4Wc5O0OOR+URkPQi+/PK44otpg6SnBIoXA/9QlCXrim4GVgVjrYeqYcmXh4l
	 8TOGnJSCZJ8OtPbpaSYKgQeahw//CXzecrVK6C0LB5EXwWcoVu5Bk1XY62GLzdOItGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795086499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1gFFQM2dmDCAWo152jTDOkXj2oU6JPJwu8xp6zLm5EU=;
	b=gsspvCigyZWudC4CgdWz/uHlIhqDUAAWANxs5iigiTk0zKjmlML0YSI3kMN0vRItp8n4
	 qzj+xnYPjZ1yzTwOJTO+zAxZRSIy2COgTh+OILslf8aiD5sIuoMMJjurr338xqOXFTbV/
	 LJaja/apPHtCq7h80aybXjuJ+CvDwXuR0sz+YF+l2mdPuNxrds7c30E+J//2JPs2IFXuV
	 e1Rt4VR5IXQpQ95NIkpfUOycUhtkWyqpkTFJSFNpi9DAoBkAypOPypkyzZ23fyZdxHsII
	 qjXmYH8L2294D1s2yyCNHte80hJYt1d4RmakNbrgjm7pTPZqixMQ4Cls/4o2ACQyq9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mt551NEC;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7237606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7237606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mt551NEC
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so29878155e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795086497; x=1795691297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1gFFQM2dmDCAWo152jTDOkXj2oU6JPJwu8xp6zLm5EU=;
        b=mt551NECXTbG64W5/NdkHegyk4ADIgTfNkwHizUSE7AbKWkGel0padE3/wCYjgnFnr
         bM+riGeE/5NQCZ1h5PER1SglfaAnPewcn9RgfPjEvsHn1cvGl14U7TwXytIsP0Tyhdca
         A9NaCUfxE/O2Yr2ZisoTTjymDBHXKOUh45Ea4LgeZVI90wF5kozULxfJ1b4eaTE6eu6c
         HM25CvZF+mgJizuhHgixxh6SAf3PFYN1fAHCq8Q43/wEW4fS3isql87SX2mnn4pSzkxF
         xoSN81GiHJdZKQm3Vj0/fi4MlrA0/3QW82lDE2IjChbNUHvmYrtEhVFbBkQ4cfwABkBA
         aYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795086497; x=1795691297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gFFQM2dmDCAWo152jTDOkXj2oU6JPJwu8xp6zLm5EU=;
        b=dQ/OUSFCE6QYm16BCF96g9y4dt3Z6WevBWMxbHyTxYPi6hoLQkMGj257sXuExjjSoW
         qc4wC7fSMOdhdaexuMi7OShXsmp+be1BXVvV0tPK/GLoS3u0sZMu54SWMDdThHI3VGZG
         0p2Cn0ugFIfuax2fz6+Eugxx6EwXSMMet7gfs36PYdDjc5S4AmfTMGjo2Az5gEGY/qkP
         7/dza4DD827xLHfiWrP9U0sHTIXtIQWabiArxEEacF0VuYMDST9asWkQqdxG7YnBHAbb
         x8++TJhwBvaqUrdRFxI1wwIsRDPz4kuZi347lMVHiKJ7x1zNiAt+ahqqjNwaXyLXO6Wf
         gNXA==
X-Forwarded-Encrypted: i=1; AL+hErEMFRD2185TdUg6IdYzjqlN5UFL0jAHI31kZ1G9qq2h4SlQqT15Cc11PuQ4yeOga48E8I1pWWtbRAHUTwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YIv0uq28315u0IBG6iULti/Pl9kyZMOtLWTYZDL82rcd9pL+i
	GwzrtxTNsGcSmNfAZLHf1SW4ff/c+jlS90fDVFj8xVcnb9/UiAuV9vd5
X-Gm-Gg: AYBFou2FbSIEDkTA+cwuXp7OcPD374h+1UjNxW4EP6QG9UN3dhp6KVF7q9/FG7nDFGe
	JGCUZm0Dl5T95yehyv1Zm/+q2y2J3PaP39cCMoLrPw+rTBme6ilHmN1tsG8icUlhCQdo3u+ladN
	0vevrA7zisCP9QDkSyaAyiCItJpBEpEyl0um2dXCyDoWyx8YuuPaFtbSHTqiyFtTX8/kxILc5pD
	Z0O4Uu7i7pFtOxM9uFFZLcUzZmW6wZUAyZw0odSWAZ0hykECmQ3inpwOhs0oTl7gqL3JOnoj5BG
	IzXZpIeWkn2pI+E6dyg7ao7nds+JsRTxB1G9/TvdpsCqC7fga4HQ0FB06nw5Qolt98XS2b/Rdhn
	r+H48lZTKYThPVWafmFTXxkCs2QYWsYz/ncMkQ1HqI1qHidroNif1/FmBWRz7AKTzW0R1w3es3l
	sZUcViNqVJJh5uPSDbRslItdmzGn73+k55NGqYgl8oWv5DZZwTq0qwncnfewjVW7cxnchd6dVlp
	TTmUgoflPzZPFctRVQyw420+2IN+Ohy1vYOSZ/e6o/b9vg+WZhMbj4hAdKlJOzo1jYQ9sIjdnOb
	MQjuCS8C0bXU9t0nnbtF2y35eJMUfRXdbQfr1oDCtxCRluo4RsZJ211+AwQ71gECPlhphIAQ5gV
	JNJ34Do8pEOfeknqiwwnAMgGLMvmz69XjzGdgGz8wWSatC3SYeODNV7+pt+PPGlFNVZKIY0URsG
	OJrf0nIiG4wo0TAmZR+m4O533Kgw==
X-Received: by 2002:a05:600c:4e50:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb7da1edf4mr105406365e9.20.1795086496881;
        Thu, 19 Nov 2026 03:08:16 -0800 (PST)
Received: from eagle.home.marco.cx ([2a02:908:176:3bde:c85e:e9f9:a271:af77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm29479975e9.12.2026.11.19.03.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:08:16 -0800 (PST)
Date: Thu, 19 Nov 2026 12:08:14 +0100
From: Marco Schirrmeister <mschirrmeister@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, 
	lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, achill@achill.org, sr@sladewatkins.com
Subject: Re: [PATCH 6.18 0000/2151] 6.18.65-rc1 review
Message-ID: <av7WKeKW4NdFzDk2@eagle.home.marco.cx>
References: <20261118150121.603863898@linuxfoundation.org>
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
In-Reply-To: <20261118150121.603863898@linuxfoundation.org>

On Wed, Nov 18, 2026 at 03:28:55PM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2151 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Native arm64 build on Arch Linux ARM with 7.3 uapi headers and
CONFIG_DEBUG_INFO_BTF=y works fine, without my local __u128
patch.

Booted on an Odroid HC4 (Amlogic S905X3). No regressions noticed.

Tested-by: Marco Schirrmeister <mschirrmeister@gmail.com>

Thanks,
Marco

