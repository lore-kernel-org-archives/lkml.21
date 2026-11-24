Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529171;
	b=ID6VHcJw1axvefUUm9nTPvh20hcxvcQ3gcPYCLL+Qz4YQBXJCfFPUIZRZNjyPXsYJekm
	 I7L6WLVWhH5eUEDDoCDhOihA5ntE1xRWBNaXypTk9YDO4EkngLidpWHDLv3b1Rw4qqQ45
	 cBlPZGC139aQXmi+BxicjcYUSOWDM1GObRE5UOUNUlmZ+3C1ly53FYFOn++OFkBLlCPhn
	 ybNZCcV0baoOOC8V7F9KWaIuadCYckB3xCmTmp9bs+7Vk8o+fsMfzos0QpnJ0xZi47+0T
	 QDzVUh/Ak7ZTq4z+s4pC+la2nnK+GHZB5y2/rvLP3Dz8AnR5JVMDidM0+vl20vR/fDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S8YJkHkm/SxGQO4kohbKqn+J7zEdKLPkqIyPpPevv7g=;
	b=WLadQeZuq+ToUwTcFn6UjfCGpraC09dq4/hqRatm3Ssxir7r6uIzEBI2qcsa+zNPgHu3
	 zr1kosMIj/d75wTcEgT77wQZ2KztnQrowolslWabIfbo4zHO5sydW4U9a0JEAA9Rc4ESx
	 xJBLM5c7ZMPTFrsYS27EVAfRHm/VwhGTWHNrWnOee3wJN6AnJDmMtnZ1cyRfrEQhSrxwX
	 Mp15RlTMOc+3086yHaXPxH42fuOSiyVYNP1EFN21FQFfPoPquD22RK6gl/xzvj0iWXyp+
	 nQjhQT3wo6jzNWdUAg66wW9tQBid9Poa8tmra+DaAcn3vd3eJDdgDHF6YMnoMouLq6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjVVcq;
	arc=none smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5CB606A69E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD5CB606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSpjVVcq
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5c1479a959aso3332724e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529168; x=1796133968; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8YJkHkm/SxGQO4kohbKqn+J7zEdKLPkqIyPpPevv7g=;
        b=DSpjVVcq8TeO6xu2p0bIyse844LUdtnK12XipX9WJfEckvekJT6TGuo5IfecGiEZsr
         v071ioGelwCA7o5zeO7eJTG8/QBO1Kz+VIB6TlcVHLWi/N90IqBjX1QiTbM54iYGrAPI
         JFQVArhHv2J3shIslplatk9W7G35DDP6cJWcawYkLSsAl5n+yef3zBa3+aT4zc8WvQ8J
         JPApD3jOSJsDnOgqnDl7p7UaQ/3arAd91Z+R3l0h27Bs2EBq0xvRdp3Jhi6A638poxVG
         o0qf8wBg8e5vZVka9anRlXVegXB+wg91whsM1cfYYn3A4pR12aDrZHMJpB9ofp3f7dPA
         HTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529168; x=1796133968;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8YJkHkm/SxGQO4kohbKqn+J7zEdKLPkqIyPpPevv7g=;
        b=FJ5GdTFCqLnFI3MooeTIKjTyiMDyH1S3x8BCzK7ExjKHz7+g0cgU2pTfwBpZVYsfqh
         n373M/jsVfUTx3I+vJOybsS+rKgB/3SNfo2vkUsfopG3AD3mLRD/arOeA0wBJoRfmELD
         SgQsjYqbhC9/QHSZ7+HYcPc4DyVQVqyU6Ic9RrYhU8DRAbajI8pIyRpOVOCyKHxd8ju8
         eM4rMnGovm4jyIgqtPZdkwAk8RKxVmuurdslR1KVpLXRdsIKFFsoeVBRFbq7FdTMFcq1
         Xsqoxm3OQCSXqLjWMR2rQosEv1P/IeX3Tt5E8GzuVPFLv0mgovW2272O+KwhabzNg91R
         rzOA==
X-Forwarded-Encrypted: i=1; AL+hErEBoxJRVGjpD50CMs8p7A/0U35iE36fgN/3DkHnVSIoRh8Bs2mq5nxW6qmTPA5K2AXQ5BWbT2dGJKj5Wmk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JvSW+WsE7K4lDURKnTRUjb+RWgSeSHPFj0ou8Izkz7DrQXZAk
	rks3iA1u4d5r+oVIVrUYRHpGbsdNR+NUaPqITd/ETjeEMrmZz8EraADR
X-Gm-Gg: AZFdTZc48xPF1a9Ra+eOnQcbsOq9dQLnZyeegmPLV4ztcyyuwi4XxfK7KRuDkUN1DY5
	HxvMDbF/oLgQZ+acmsJmeb11uZSlUXt5HZVI/4+QU/ITYVgRMO1KtrIuCE6uqj4WylfkhqQNcH6
	UBgzHO+TVI+MPO/utpaoRlt2j+/Mi57sxOFTJ5AqJGY++5os1RmWvLW2rPS4IlDVGO2qhq270rp
	UwrGNhOLNXYE6uP8pFv6FEEFfMPlZzZq9eVRHNiS1HWUSAw0V+0uEcdvPT1GVo9tq0nT6aWUxI7
	6+ve/KRnYM2XsBWflfbyM91rQDQwp7JCwl98fa71g9A6woDWdzkUB+raIBFKmWFkutnZTytGp8G
	QdjpWjfnMMJwX9Wiiex6/PFAClQJoizBWRXcuppUabbXGWI+I47JuWicpJaHcrAFBFepToH6XtN
	/Z//waLSShDrxhvp72ZChslHZ19jbgwfwZUPtpzuHijmzgj3j+/4e1kfhn33x7klVhjIX2pBYJn
	B9ieIfbDRaAJcgNmkkZQNvjhBVkQdWTnqMLl2P/EBgGhyxUlgBnMIFy5qhd8yZFTy71++bRrSj4
	LW1Bf8jQFHrOPkDDdhnBVtp8MNPIID8MBReqFb8ZQV6iC5Sg/A==
X-Received: by 2002:a05:6512:3043:b0:5bf:a34d:5961 with SMTP id 2adb3069b0e04-5c1bc660762mr4326463e87.1.1795529168154;
        Tue, 24 Nov 2026 06:06:08 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm3787629e87.59.2026.11.24.06.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:06:07 -0800 (PST)
Date: Tue, 24 Nov 2026 22:05:55 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v8 8/8] gpiolib: remove the shared GPIO proxies before
 freeing the remaining IRQs
Message-ID: <20261124140555.GB48187@rigel>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <20261124-gpiolib-chip-removal-v8-8-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261124-gpiolib-chip-removal-v8-8-aambrozewicz@nvidia.com>

On Tue, Nov 24, 2026 at 11:20:39AM +0200, Adrian Ambrozewicz wrote:
> gpio_shared_proxy_to_irq() returns the parent chip's IRQ, so an edge
> request on a proxy line holds an IRQ of the parent.
> 
> When the parent is removed, gpiochip_remove() frees the IRQs still
> requested on its lines before it removes the proxies in
> gpio_device_teardown_shared(). The release of a proxy line request is
> serialized only with the proxy's own removal notifier, so if
> gpiod_free_irqs() frees the IRQ between the release's irq_has_action()
> check and its free_irq(), free_irq() warns:
> 
>   Trying to free already-free IRQ 22
> 
> Remove the proxies first, so the character device on each proxy frees
> its IRQs before the rest are forcibly freed.
> 
> Reproduced on arm64 QEMU with a shared gpio-sim line and a test delay
> before the release's free_irq(): 3 of 3 runs warned; with this change,
> none.
> 
> This patch depends on patch 7 of this series.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
