Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938274;
	b=sWL5oH4z+c13js9fNEwAtbwAXyli7WoOG12qLf9bTYcrmn9FIh+OVSHMeFwM5gWVGp/9
	 296Y6ICSPhua8uPCDMJtuUxxC9yBj+HxOL0/xRE0HLbJnoopxmr4BaJxpfhKqKRxBLr6U
	 GhRg9Df10/hCg921/bSaF4N6ha3iI6jSiX4MOzVxyhDtF0nuBjkH9V/YX3oPeeQYswG1I
	 4ugfvyvSGfpWVQE/OyxviqVqprjCTXtqpsm+Rp2wp9hgiSAk9tPSrznKayKS1Fd7gtxZ8
	 pD4H0V8GOvgxWfepFeerZMDJEkNedxIcazCP4ox8tlW8+3Lmaxi5XwlB7FzELTka7Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6OmLsnYmVAhHtUT/tw7I0eakdU+CbXJFeYEGxxFLd9U=;
	b=atPsj78pQjpGgqQBjhnVJfmlZlnsWJg9xHCLFSAQWrdwMkcIFSonzs6GfIMApgZeA5uQ
	 24tEqXat6shyzPTJjGPytb87CYWAdACq5Qc+1HjgjETthKQrwjBxb6VQwpBZwIVVfWwdj
	 6iI6DMwHyg24OJ8bepJtlvoEQaEBSz3pIhMzh5tpt1dp+iFrOQaDavuezXkPtES7MQZJ1
	 I0F+pr6VUbi6HyuZGyM7YoOkkuHnSFU3j17fzdm+PMWF6k4Spe4mLEHzH11f5AH5ma0AL
	 U2x1HHqMAmkXaUJYq7uUi5ACm1208i5MnFL9OFt7upYG+LqRcNDvTK8YOpHIESrUy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xTd/rpxX";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E2C606A885
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E2C606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTd/rpxX
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so1066565e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938273; x=1795543073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OmLsnYmVAhHtUT/tw7I0eakdU+CbXJFeYEGxxFLd9U=;
        b=xTd/rpxXnSuEiCi3nlKYbImD0NRNAlU3R7IP/yeXQHD/2W46U3TD/8Tvup90FfMIGq
         1q4KrU9r7N2bD+qJfKWKO7/wjC5MT4jAr8Z1nwTcrq9kR1+pB3dhtBCrh1OFm2id4mrc
         bbyra1qF8hRyczHOAvnn0K9cIfplyh+1jyg1mYEeZm+wwwjGNMy0W+scBh+AHe7FOPW3
         +5XFRXB7CXsUj54BSkHoe/C4oXx/rhXLuNk1ZKGuWHJxQqmbpuh8ipIeqhlEeKncgTwl
         hnU23Hf7gW84f6ae9Uw1/yfAxTXzLVP7aPL5W692KoL74+h1E1esTWBjV/U9psrpMjDQ
         fFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938273; x=1795543073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6OmLsnYmVAhHtUT/tw7I0eakdU+CbXJFeYEGxxFLd9U=;
        b=wBP1Qc66PZG7cqbXLWp949BNAFwYbJ6J1H9/BSK4rLO8sKvxtduX/NryMvrTmO1Tke
         KFrXM/Dq1YtFIPohn1Ru+6ynU4gpyYaYnN2YSj9OmkLOlyXt3OzFLye4IxWthfSPkLE7
         7y3U9QzvA9otgHtPF+7hiKj0A/N9WbzkIYm3whZhJYAkYgFKypgtVKGmenLTkLssc9fB
         w1I5BHlv0PX5jpGbXq5ULA4By7DR4JXFARIbwozGjhNIA/XxZTyjLoa57kBN291SlDWK
         sqk0/CzUB8XR+Mk633LR2CsEcxoLg/g514pWs5HQvylOclPrBxotdObCnk69uW5mFqV6
         HVNw==
X-Forwarded-Encrypted: i=1; AL+hErG95okM6Yevoq9cnaYw0iwZJTBZhNGY4ti63yNPtjLe/TjT8U9owzHh3HVBEBDFVFLDphVkfuq4b5ZvjMY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TroVeAfcKtNvUGawmLW2tSOR9YbLspwNZUOWtaVZotLdAYwwk
	d+6Sd1KMWEmZHcfWqLsllKOEDEqGzTMCYinLY4mpxV7VenfuY27RSKGB
X-Gm-Gg: AYBFou2ZxloItI/gOk7t351P2836LGlJC3WIg69UY6Ttpi9IV2SBnMEpN65tuEbwetH
	zAJHyBIQwh4kJI8ODwf6+14+QkuyiLJVntxTwZm87bGrkkQUZLhDJzcaMTvxiJZVMi+oh2YdLLi
	hgEj7s0lUM9xss00MvYFbxScNrDkmcOXiPZqARsq4FEuzeVrh1/NazfrBZuSW/9RkRVbw7GADEt
	5IJYXZ7kWXZz9/WzZFJ6CLGsJ68BWH4cVr+gbSwJxoPRVjUz/hcjmtOgw8f8PJaMDo9lKsPw99m
	4D2pwDJKBLYmLTbnulpzAxJj7Xm8vss28ZYcFFz7vj1P9NXEqQnBKhwj6YDACUHo5Zf+msiqHVD
	pVbkMmxU50WoaL+23SYe5xx9GgnuTlbVrfjugN4g0bGq5FLC9OwKxfErUwLRaFqhHFaBK8qlid3
	JdYT1l2t9qKgLxbhp8+KvrD4aXj6JUMUoUHI3CBoN9H8KKrBLWfkbJA4feFWx6Ce0ODDw0r1Af6
	HoJZ+MNkogcUGDCpg+5i+PDnVIzfkUHTHak0FYhmf72kjoZndloEbZBZbQYb+tyhKlWlEaWQOkM
	aMiH1ul3ELY4uTjTCHquE4V58BG39i7SnaVTXACE51QAgg==
X-Received: by 2002:a05:600c:1f90:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4bb55a45050mr312420955e9.5.1794938272804;
        Tue, 17 Nov 2026 09:57:52 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:11a1:dc8c:1ed6:51c5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm1590935e9.0.2026.11.17.09.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:57:52 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org
Cc: griffin@kroah.com,
	hansg@kernel.org,
	andy@kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: flash: Add driver for the TI LM3554
Date: Tue, 17 Nov 2026 17:57:45 +0000
Message-ID: <20261117175745.11897-1-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116180809.26946-1-volodymyrchapman@gmail.com>
References: <20261116180809.26946-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lee, Pavel,

Andy Shevchenko pointed out, in review of a related camera series, that
drivers/leds/leds-lm355x.c already lists the LM3554. I should have
mentioned it in the commit message.

It can't be used on the Lenovo ThinkPad 10 as it is: it only probes with
platform data (no ACPI or DT matching, and nothing in the tree provides
the platform data), it does not drive the HWEN enable line, which has to
be raised here before the chip responds, and it registers three plain
LED class devices rather than a flash LED class device, so there is no
flash timeout or fault reporting.

This patch follows commit f1aa35ab5943 ("media: atomisp: Drop the
atomisp custom lm3554 flash driver"), which removed the atomisp-specific
LM3554 driver for the same hardware and said that it should be
re-implemented with the led-class-flash API if needed.

Would you prefer a separate flash class driver for the LM3554 as in this
patch, or extending leds-lm355x (fwnode/ACPI matching, the enable GPIO
and the flash class)? I'll do whichever you prefer in v2, together with
the fixes for the issues the Sashiko review found.

Thanks,
Volodymyr
