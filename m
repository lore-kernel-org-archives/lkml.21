Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795257018;
	b=MGvPqP/Gc5yr/eTp+rUXl0b7VwYLTFwAaX3eXCNXp2Mwn4glXMOnAVlyGGcaVesOBvtM
	 q09XBSUy+vGwa0qbH5PSpp9FhLbKwdqPU0jY/nitXMzmWiucg2HP231H+hHQvzBxIWpYA
	 57Yg0/Pbl7sa6fQPHWlnDZOAyATXIW+odlHSM7AzUrM4TlpIxy9ZUE/jNaTZBHIBjZxY8
	 P/8S068jbINfHwyhTmy2O4FlmT445XwgnvzOc79Jh0BBJ3sAHYycB4hYaYcEuo8UP/XQk
	 DjNuUv1YVvvMBJ/++dE99IUoC7Naq76C2Q4Q695fZM0LWLkZ07Exp5/aygXNlq1OTRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795257018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=kVw6GMeWVHtwp4C/YrzbIL6SlnpGcWp+X6aGpcy0sFQ=;
	b=pc+i4GqI1dojqEb7pbFlsPGIvRiXIYVIfHfC32L1DcXqmMtyXs3WdCPe89bip7wQ45lr
	 MVX6R/M++gsFLg+eKIfL0Sk7McemqXOepij2Fk5rzTllMtWxE/pVspwiidLndZVYY1OZp
	 a0VjcBIbYayt6EETM7rjNKmYb6DxiR+KEeAAlfUo11PRnoxXBNaMXUSAgcLWchLN/PASI
	 OljuIch0GINqcs8sR8MruQ+LYwl5XGnbA1XDyc6I38SUC2vq2+2sH1lKagpDOJZXaI5Qe
	 UKaUCouLB4lq7hxv+ONDLkPFFCk5a3Lzy4EfiwkGVzgGljWwS931aTIyEpKNWMX9arA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3YnkHi;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2FB606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA2FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gZ3YnkHi
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2510963e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 02:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795257016; x=1795861816; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVw6GMeWVHtwp4C/YrzbIL6SlnpGcWp+X6aGpcy0sFQ=;
        b=gZ3YnkHiT9lxYM+2ddCCC0t6F4DWz/Nk5WhlpF8hVe1VWHKVz0cgGp/+qgjQt41LMA
         3N0cREWCdp4bZSWnnbVihOw2PpGFBVAUrSg4IaaGiiqO74Q1J0wfUDEdYUeL1M+gNBU7
         LvnmmKZYs53lGmT5U3N9MuMEqkMKUze4viuIqFQ8bAUZ9lsiuDffu4f9LI+MOJ5BxkKB
         pfZ3jqcdVDTk6QmW4xJ3V52i3YSJ7bN4xRhTxrvw/wp8Cgrp27FtudSk6Fxt/XrRWcCA
         oE5nlhG/uB3GedMgZyoE8NfSZzZtmPEQ3qU6rh7DJt8Rar2ozmo74WjiE1v4PfQ1PYSj
         2s/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795257016; x=1795861816;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVw6GMeWVHtwp4C/YrzbIL6SlnpGcWp+X6aGpcy0sFQ=;
        b=2aDts7bHuZ4fWAMjJjUqVt1tUp6vu4zMudvJCvc6U0+0dlBtRNw1U26QvC4Yq21i04
         ZBLANWy4Bnn/WALXdxkawpla5QfauxJ3gjbQm9zdU1VM4W6eBiBc7gz5AhUGJbIMoAUH
         WHfuB/DOOkrX0zIp/heELRFLWA+xGWe2eJqiKhDlksit+d7UZQi+RdOICg0QhrJYjBOp
         O6z8BZLgNScYziHcPMWRmIg9hLmBe3roXLq7+7urGJkM757Ij3R9kdYMIXnbxuFf8mlR
         l4IXV4V3jRNVQSKCOT4mN3sfpLmQwR3AiWkLdWDPwB1G3A4z2n0LKb1FxiZU6+X+u9jQ
         ki4Q==
X-Forwarded-Encrypted: i=1; AL+hErEZPzc6t3fN16FeNfKaPdYZfESD17VaEHafpbcHGmVXnsO4iQVUfgxaB/9uxXqa4LItRjVXKfYyJNZYS1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z83Qkk+icJ8bQXRIDxpv7KjoSloeUrm3IyMS2M42LAitE50m2Un
	Tch0LTxouwiVvOMDOZ14/z6yc2vlJfDw9xBeHx7lS9s4m5uje3Ylgcw4v+YnYlxhcsk=
X-Gm-Gg: AZFdTZdQR/k7QPxsBSTY9ql5b1f6qSzhSTEz3HbihO43fVv6MWQwSvsCxVJsL1z9qaH
	XswOgh6EiwOPeNxhgCQwcldv6FqKHh2w6p1ysUQnTltvvM7Ytg87fynNUVdYXhmnGVa+O6oHgZo
	Qyy+MBjhv5N+k3tmViviez1q9UB3VVEzCLsmy2BQnEWeBUk0ZlyUk4dlxmOpAy4Bb9iIbidfvDB
	6qcQwqv5rVnhLTGAMxFOxzSBJslx2zjNI6+qcx9fpfvCDEGvLM4bZcrg4oMCxUtUQLviTGiT5NQ
	iLFwHacpB7sj74jXTvKi0tylHtDWVdDjjfd9/uWukeCFyX5Oaw4es0wrlUxX0w3yGpjhAc/ZH8+
	cpKMGjtRSSMSgNlbP1IwnB/exWK1/iT/AICiQajuyyma1hx/GjDMTmADJcwT5wILj7O/a25OPCY
	cje/nYY+37bIVULB73U35GbkbI66RLMXEI4SU9vRwLcC90gf9ZtyZg2RZFcXHFSWcIIcz1Gb5vX
	+VkuZMWpKtyzROfIKMDYceJlfoXUcaXB7lkM5ayqojKX/Oln9prAs/OarylSFgzliGyhIVpqyxo
	qMt4Lw12bR4HggtTI3zERUDtwke4fSdGGRrVjDVEHW7eNekKMph7h4Y=
X-Received: by 2002:ac2:4f08:0:b0:5bf:db9e:426d with SMTP id 2adb3069b0e04-5c1bc8217ddmr1883998e87.34.1795257015698;
        Sat, 21 Nov 2026 02:30:15 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171d7sm1257891e87.30.2026.11.21.02.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 02:30:15 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6] watchdog: Add ARM TWD (MPCore private) watchdog driver
In-Reply-To: <377b89b7-90a3-41c9-88c4-fd3393055f91@roeck-us.net>
References: <20261118-arm-twd-wdt-v6-1-ce5c85b45c63@gmail.com>
 <377b89b7-90a3-41c9-88c4-fd3393055f91@roeck-us.net>
Date: Sat, 21 Nov 2026 13:29:42 +0300
Message-ID: <179525698278.4.12784611811620173233@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On Fri, Nov 20, 2026 at 08:35:52PM -0800, Guenter Roeck wrote:
> One possibility might be to try cpufreq
> functions (cpufreq_get / cpufreq_register_notifier) as fallback.

Thanks, I implemented this for v7. Since the CPU and PERIPHCLK rates
need not be equal, the fallback first measures the watchdog counter
against monotonic time on CPU0, then uses cpufreq transition notifications
to scale that fixed calibration reference. Calibration only reads an
already enabled counter; an inactive counter is temporarily used in timer
mode, with its original registers restored afterwards.

The fallback assumes the PERIPHCLK/CPU ratio stays constant. Platforms
with an independently changing divider still need a clock provider.
Actual clock provider errors, including deferred probe, are preserved;
the fallback is used only when no clock is supplied. It requires CPU_FREQ
and an available CPU0 policy, deferring probe while the policy is absent.

Frequency changes reload the counter against the existing deadline, and
the maximum timeout is bounded at the maximum hardware CPU frequency.

> A MAINTAINERS entry would be preferred, but is not mandatory.

Kept the separate entry.

> I think we can call that on purpose. Maybe add a comment along that line
> into the code to clarify that.

Added the comment and corrected the commit/cover description: the device
PM callbacks retain the deadline, while the watchdog core's explicit
keepalives before suspend and after resume refresh it normally.

Full ARM GCC and Clang builds, module/modpost checks, and a GCC built-in
build with CPU_FREQ=n pass, along with the host regressions. I also
retested the exact v7 driver on Almond+ with PROVE_LOCKING: takeover,
CPU1 ioctls, timeout reduction, keepalives followed by expiration/reset,
and restart from CPU1 all passed. Those hardware runs use the DT-supplied
clock; the clock-less fallback and DVFS are covered by model tests only.

Sending v7 separately.

Thanks,
Fil

