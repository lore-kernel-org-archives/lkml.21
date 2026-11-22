Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795307074;
	b=tDuPN0FCLHXrQCgXgFj4rlO4LLeg8e7j43ibq9o/WGvJ8M4mi/xTUP7VTWGucXG2Ehj+
	 uViGBJ7CM8OJmVEBGqEv76OC8+xnzIvU605DRqdc1bmVffcY8tzktH7ve6pcl9qp2Q93n
	 0Zan6E2a4x6gwa8aPPKaRB+tGqoINaQPUfEEDLfLIIkXiyresbWgLyUf3q56K9dKBhVqJ
	 Pn7OSq89u6Uf+4riyrcI1of2s/s4levUUrMCcU1PaqGkaphcfDweDoYjjX+QDWUE4rNG9
	 2KCEEBLwGiPVIM7dGFePUGt/trCvUBlA9zWWsurg+gQiy8LWjeaRnDvEuR3ORLufCJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795307074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7AutQAwdwwoaFEE4x44ILwTb8k/RmhAWlEsJY45jANo=;
	b=A6nQkIifqhlend45hZVRvDA6DgEHV+abPy6zFqLnaDSa0y4P9Plr5IJsni4o6dCI9OmZ
	 FFRRsxXMkcKv/Ljf8s4ZUEV6menPBR6vB4OYSC5v0tq3OXQAr/0eBzRyHllnjU2cSGWvx
	 HAWPC15hBUeymMACzGklXQaxxhsRmf3ENBRFP7ewIOcSOzLwf21FaJuer6gVHPDev6xQp
	 uFkrL626oS2X5rIKW5mgIY2j0CDm1ByqUGOmVmcp2IWSwDPsaO2d70HeztEmDK1/SUuSZ
	 Tg6aUM7ElFjUhe3NSCz54DtEHYAKYyP8hIHdA5B8OzmXSjk3rR0Tc5/uSQpDn6TNzZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOU5fgAn;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA45B606A330
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 00:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA45B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mOU5fgAn
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so1307984f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 16:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795307072; x=1795911872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7AutQAwdwwoaFEE4x44ILwTb8k/RmhAWlEsJY45jANo=;
        b=mOU5fgAnuSK3v6vTsPnGm7cRPB+S0vG3TKjzKG99IKrsF/M3tHQwDCcIQ1ff4hPFQ7
         894cJITJlGAEXaqJPsc3QGDEPHLPx+4DKzjyZRN7RXIdW5CW1loSBVqzDNnXN2zzKSeH
         80rhQ8uSXOIBnHvXi3WkpJHd4Ltn1cIgId+xZkh/kjJqczMrfjPKxf/075a0HvqpaiNu
         T8ETVbnl2l/5mcD7TeLdOPWx/KAC6z3uLlXXodmpubniji2RsVqKsxgDHqSfVX/yq/tl
         cilGfjwMYjy3MIYWnSLk14jrws37jE7OVTRonVcATs7EIeS+JhX7Y32Et+XdsqUasq5L
         TA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795307072; x=1795911872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AutQAwdwwoaFEE4x44ILwTb8k/RmhAWlEsJY45jANo=;
        b=UpVZSVkyJh5zNG1/c8stsfptpKRWqIfRprKPe43iMoNVEcLCiwLfWgvrmO9/4yhVmM
         9tb/wdMil9I/T9k9b0JnpfoW+6FXT1hpH66U1rXIWMlvg+dkyfJRJZQMjSB5GqIbUEEA
         G03/7Mrij52OPqyvBIgrTO9o6de9Wfdro5fPYSlT+BoW+Kgy73xPKu/8xwYai191wz27
         6mf+oUJE8dFmBFAQvrUr+aCXQFXhfibEjEPkIkcgQMXhgwefAMSCfF8O/5Ol5+UmoACD
         WvCiYI8svRLLLGEGHoKr6tfmjDYlkgWYksbJi7N2JiWyLw7vPE1PRLqUiUuJ8bUTGVsV
         AZbQ==
X-Forwarded-Encrypted: i=1; AL+hErGm+SVoY+kQaz01fmCieSyXZxUZWPLED1CwPNZDcAf8opuhputyQTE67denz5KGIOL9vCKGiguQv9zJYAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m/ks5LCH36WdRP1+EtQfHnt84BJUfE1UvHKHXJhEwOXzMj9PH
	y5ZPi3hCLLC1mSOKCD8tf60SIp6isx6v3SJwYcs1U3HwvkHBMOpAwexz
X-Gm-Gg: AZFdTZdoOvKv6Rndl+VqwIWFrNfqDJY1YP91PpRU5XkrTKb5iTNEWdA2tep4nstTCRg
	6gq7gK1dMUF7CJSfqmuB3ikODC1fLLfe9ufxDNpfQyZaZT9O13uje8R+KF81HRHLcT1rtwh+Uqn
	D+4hPPTl05j9+LSlefOFSv3Gtz7SGAaDIDGfM2VZ5qbO8Me9b1PobMWUnfLmcCjavepWTyeYDS0
	xGDwZYq4NolbwXFD2yR97/CYoYLo9L6DbEvWxY3SSY7LGzMO3dr7TSLI8g2dmWxUJQ6pT4z86MU
	Fv4X9Dt5GiBokD7XsCnGYZH7DwG3takL7P0fjnLwjKKhBl+dvAuW5cMV2t14Kb4CWWuA+V1i1Mc
	APK/Alf9Lp2Hp5LLbtquwq3R2SB9hrBBGqv1S9usXgLcIhLtTbTs7Q1PlrOvsvKe070boGJwdUT
	baOnikorXzAGOzvbx19WFlzyHUhqzuyQYuISOyjEEEmAq240uzcqBA+pxQgm1q2CdfDwKZfk1Ud
	s15mM75qEeC6+VTnNc4tEHKKuhfrFvqZRLAWM/JZ5Sgmugn0s6wVDvx3P8PnBzQtgWvoyfmr673
	0xog8htcMxK25unya1jiJ4mXbHK1C74tHXGcMto8UqNkLCWZNs1aEHi0DIlSyw8V4N7m4kWryZA
	rjs4Q+dFdeOPJafnhlWCwQ7kv8BwuYYk64QDa6zG4vA52bWhDHg5+FY2BEjmIWpOrIFe6SUSZ33
	YTIrSPJA==
X-Received: by 2002:a05:600d:82d0:b0:4bb:818d:8d8f with SMTP id 5b1f17b1804b1-4bb88818955mr181628885e9.23.1795307071931;
        Sat, 21 Nov 2026 16:24:31 -0800 (PST)
Received: from eagle.home.marco.cx ([2a02:908:176:3bde:b462:7469:ce26:99ed])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm88663715e9.3.2026.11.21.16.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 16:24:31 -0800 (PST)
Date: Sun, 22 Nov 2026 01:24:30 +0100
From: Marco Schirrmeister <mschirrmeister@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, akpm@linux-foundation.org, 
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org, 
	lkft-triage@lists.linaro.org, pavel@nabladev.com, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, achill@achill.org, sr@sladewatkins.com
Subject: Re: [PATCH 6.18 0000/2144] 6.18.65-rc2 review
Message-ID: <awI18u5yuXDv-6rT@eagle.home.marco.cx>
References: <20261120055114.182757740@linuxfoundation.org>
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
In-Reply-To: <20261120055114.182757740@linuxfoundation.org>

On Fri, Nov 20, 2026 at 06:58:10AM +0100, Greg Kroah-Hartman wrote:
> This is the start of the stable review cycle for the 6.18.65 release.
> There are 2144 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.

Native arm64 build on Arch Linux ARM with 7.3 uapi headers and
CONFIG_DEBUG_INFO_BTF=y works fine, without my local __u128
patch.

Booted on an Odroid HC4 (Amlogic S905X3), no regressions noticed.

Linux habicht 6.18.65-rc2-1-aarch64-msc-lts #1 SMP Fri Nov 20 23:02:16 CET 2026 aarch64 GNU/Linux

The SPI NOR flash on the HC4 is now also detected,
thanks to the HC4 DTS fix in this series.

Tested-by: Marco Schirrmeister <mschirrmeister@gmail.com>

