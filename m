Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795150338;
	b=KnGZVcDpW/A0DMR1WZF0sq7Qd3U6x4L5sxOMqq+sVWRPXmM0YS7YGxIuDtH4K8tPDL8M
	 QtMHyc+t4BoUp32fo4sDgtKH85zNbOuGBAbtzDdNldeLYmQlcIRq13s4Ebbu9Rau3SBfE
	 7/ExE7wzNz6vh6FOtda+Hp/qmZ0zQGtAKDun3yJG1uk+sfafiKJPAA6mpH8VnzxWi1YOK
	 hzqipXrYVPa7RJ6ODlq/sGHPmj5nrIcDsn5V6aVhOHDP/JX3G+yfJkWaY2D0Dk3b/tF3T
	 vZ5gFTbj42dFmj/iDk4jm125XhJwsk+4Kb+AxtJbLemaXSFio3ktVArtBjfROP5nEWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795150338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
	b=eOW58ct896ze+sMJn/FtnPpz88U4rgzNcQFihWdHE7BJmpaeI1ArXLtxawyNoRpb9kks
	 E5vOFWO0MOKv2Qb6dHxRXtMxvYBHHweZGQehrUMN67/lvkK+35mT6vFy44dn+Z9Bz4h6q
	 1NFwVc1wtQp9vrDefttEDAYrsNDN7e29F7aXOdO2QFx2PfEVGM16qZQU8qtSq/CrNOWXD
	 Bel019zWyhQDKSkhtK9Qm7oHenLUkceqGlYt93IlzY9oJeEAZkIr6vZ9C5p0mhnCw9/Rq
	 lbcDDzpE1tOUEuO5i21bmDaQwCgwJZdo2vA2AvOQMiCntbY1BwsM88y8xG5Zxivi3/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H98u83vO;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208060A2600
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6208060A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=H98u83vO
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a315ed211so517049eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795150335; x=1795755135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
        b=H98u83vOkfalU240xjpIMlt+5Ai3M+igDGGqnu2J4T3WCinYN4eU3bjbNo25Xqf3GF
         3WH6R0e3kVkH/lk5gSMI2AGxA91HKrwcHgfdDz0M8AulF6QLgCJyNwyfULF/lonPCDpV
         en9LyytncUYqyVy7+z6lg1edwwhc3OKhtX1T6vT/fsk371aXcWn1SiWTLkkjkslB0t39
         Whymd2zckO97J5hdawRoOrwlTTgz81tt6o0BL4C1S1I2A4+TM6Vu6i14lqtkEWeMwjJl
         41lcd87Q2w4LfGGWkMEG2SpWDV3jUynqkUnltR20y+2qZLAKvbW8T4UfoJrFfaLLJOFL
         CxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795150335; x=1795755135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+rPTbtnQOxgg4ps2+oCkkvTGsh362mR1Rpl2s/oucf8=;
        b=gyWtYJmg5fpU+7yRfbfyqIZjuL8PY2Gclk7/HSaWQSzhOFX+Z9wRy15SgzbwbtJciO
         XckhsaXOFi43nw/3LqXoo9Te4g49UOaF7QxwGN6hjOy4Oy9WDm6dDGSGvFa/21SvVDD8
         Rh3e3acK5uGE7TBxGbJ8dWozk+uV4uhEDVDmtAJdPKBn9zS4/Xc6C4Nb/ZaFLkqtEaZw
         PH4J9TG+adIMsF85+C0GQ28WRIs9GvtF0Sx/diQOfg4D3Vd+iDDElw4rctqeTy1gnsUG
         Q6DmNhnHLGSUaeyxmNhm7GA5AjD33b4dodTZn6X0DYHsG8PFvTdHkEC4VQn31ejQ2604
         2gvA==
X-Forwarded-Encrypted: i=1; AL+hErFZjdEN4CdwCoz/wQNgjxHmQksl+MU5AocBaUlVZw75wY47bLUrrDEklI+y3tG1BjmbBdvSu9AzD6ocqAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ONRmwv0hCFKswheXF99Pv0SWDtcF+g9TEA9ho1tdnEgYiHAIF
	42wKVbGgd/sOvZ2p0q8NxQcWT0Zs/V+cEGnDNrTinjbeHVVNYzjDSFepBUfmDvUWO/8=
X-Gm-Gg: AZFdTZcP9w/GF+0fC5dYJStag0k0zJH+Rg4SpVrsHmjBkmxLxzUIawpvR6T7ZQgtZzF
	PfBTlmaF+IYjwPhIRRZQyU4tBUENfvYgf7aZ/PpVbtWfo4ymGtyjHsH5mq3LifV+ssOR9+2A7io
	34KPJP2puiranV+cc88Ca0M0KD+2LKfoucdg5AsRmdbN+PnBv+BehRUw/kRVo7rilhlS4j1y3A/
	2DHME28jspTgvR/fvKVTliEbufnG/KK2XAzwRvwLcvEJ06C5ZOjsx+zjQq6oEODXC9twfRS1VkS
	3LR2SmsKE6n08pG67AxezlAjzRQVA5hZjeC5c2nnh+9mQ+B0SWqFGAUise6sYKlv4ZwR5v5exEx
	wg1KCjJPe0thccoozhckL/DcscqNUuZ4ISXMUtSl0dTzBo1M9UHcr/J98/3SR2DH+VNEfCyPd0w
	QCb+/6OWbObFRPF6vJ+K2dojsPUYNy9Wlk1IKAFycAafGMPHhpxgSu2GrFWBW93RbWRtG1OFoVn
	7a4ifBZBXNwgYKF4yBTIPOi6dZ+gE8dpvKXSq9gC/e2p3IG8KHn/ktACauEGdBFIKkFLKSQeIv4
	81XCzdTKeBf0f9Z5Neopo5dpSsF0vzjvKJlqhYHP36w/ATHiRqg=
X-Received: by 2002:a05:7300:51f8:b0:375:85ac:d14f with SMTP id 5a478bee46e88-384b3e786bdmr3144891eec.14.1795150335207;
        Thu, 19 Nov 2026 20:52:15 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm3768338eec.7.2026.11.19.20.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:52:14 -0800 (PST)
Date: Fri, 20 Nov 2026 10:22:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	zhongqiu.han@oss.qualcomm.com, conor+dt@kernel.org,
	treding@nvidia.com, jonathanh@nvidia.com, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH v3 0/9] cpufreq: tegra194: add Tegra264 support
Message-ID: <av_R-8aMX7lL83ln@vireshk-B250M-D3H>
References: <20261119111217.902071-1-sumitg@nvidia.com>
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
In-Reply-To: <20261119111217.902071-1-sumitg@nvidia.com>

On 19-11-26, 16:42, Sumit Gupta wrote:
> This series adds cpufreq support for Tegra264, which joins the SoCs
> already supported by the tegra194-cpufreq driver.

Please rebase over

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next

The current series doesn't apply cleanly anymore.

-- 
viresh
