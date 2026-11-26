Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699715;
	b=0dWiMLaGoGche0WZKoU89iVWCqntIdJpnefZCvRHuyF96x3hD8K6gVI7Vt2asBxRH0ow
	 zuqBC/ENJSAy6+LDQu4ZWaKWlMe4knPegQC+a7ui3V2CJpBVSgkZZptYKDc9wJVaZ10qJ
	 A8H66MNtY6JAdNQniQvfChQve3HiY6Rd1JiY5i0NxHHcvbo0+X2NuQSfJn6hKVeC6Q5oO
	 lbMQCQIQMsVrbx3HWVgCfRD3hofJtZIW1s7ehGUUmdpRhM/rjQeyPThHVLyTY2KK3JswC
	 qjChZLrM+p3SBCdEG82wBZDNZO0o17cRBwdRmKqQCkzxT/F4Steil/eOnpslsyiiRzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
	b=XTXKusCEv4aZRcZt36iWgGiczfTPny6lVNJESsJ2QVgCI3adodrlfbTa8QY30kaL2aj1
	 GbMvQOmcZ5jvo917t4wnJDUk+sGjLhlZUl2wNl3lVYXt1+Qboh1XCaqhSB+S92GBsukLm
	 NLHCg9PvrK2J/XnFsel3iM6xjR5dFfPajUHFyVcBxU1UK3FGHwC1WL6HfnPV9ZuzE5xGP
	 PnkZhQ4cGnLyPKpr7NpXfrAxAncd1MwgL7gBLPflVSyqsLsNiZqNcguQnQVmz0QIQBupk
	 cleVOliVOpnM/xVU4INYmLWi3NenlAleYf9Xa0z9zQNrW9MF+Lp0/EuGgL1enWUaczA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="MC/TKS47";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24CE606A333
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24CE606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MC/TKS47
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so13610929eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795699714; x=1796304514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
        b=MC/TKS47PCVThH4hxBVbgYAI17PI8aoyvnUrzLlf5cUFLIk+p2ddtVf+hQToBZH+Q/
         rB5Im9GJK7ymW6o+kw2H38ubAlvFSPrnLV7QUMeiielvCCVXjFgTv9pPaMj7j5bKFWgq
         IbMU6BMgevQG1NxYkx63x1CZ1CrFMrFtSuCi8sABEky3K6kX7E0ldh4+6UPuYNnMdTHW
         Bz1jigNK9fpe2VkAaSyGXsKvGbRhb+8I4k8LzZkkFdqc/bZrTYAIonP49b8b0MsEuwkT
         GAW+ARRDnT9SD9ayDaZpUz7XLSvG1CfXy+gvHuMerhQ22jporeapnIv76onGGYCGVYpw
         lXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699714; x=1796304514;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pFahHhnApCqp4xWzSbnlx6J9bvCFbftUctTIaRpbdJw=;
        b=Gsqxi5uVDYdw7oBK/2xlxlCJOqa+Tw1aWOPTogKR+yMc8dquIfKJ9Z6WKMh/4HGpUA
         LpdhL1LsfsPISNw6aG7Ba29HKXTW3pUI/4JmhouNnZRK0M0I9WKx5rJwWeBepoB+ndsp
         r01ws8D+YljzicRcGj83khFzFAVPLymUNXlhV0hmSk9UcywXzFDRrR+zYcUOpV1DkYUh
         U9AQEVqZeYFk7t8WVSKXqFs7ppFFQq+CFTBEoZYucLaWIwt5cYKdyZLEubGcHdPogz2G
         mUHf1s/SKW6VyOqdbXmBSWzqAwPRel0mO5g5no/rQkh9OgEjAPpEC/CiRbEKcHiMzbhf
         Osfw==
X-Forwarded-Encrypted: i=1; AL+hErHQ53dI7njakpJf9kPuKY3iSqYpeSyWvq3kBUdcWih/DK8/S8QNJZBfLHYIfzXedP6Naxd1DE84ljPUfJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MjPerAuyIP2tydLHmLhp67wZdyQDoBpH3ILbtp807ukeevqeU
	kHB43NUPugy9l3Anzop4gCgUn9kw6wkZd27twaVeUuazj+3EPDE4FIwH
X-Gm-Gg: AZFdTZfw+89y8j4aoaU23Bd/a1pJ/iINhyt6IfaD7F5/lGJ6k4MMkMODiQjqgBJv3uJ
	V2yf+AnMAR0o1u06NKW8oXO44IAXWkM5vrSSZuq+oHkNJNjm4tq+SXhzQCr91u4GXkLxXZMiZaf
	LncvkS/pAq8tOVD4FU6J3z+PIGoTwHplv7DlF6sAbUmDpoJYtjw0o5fnBG1K4SklMt6remKODRC
	YqZU2EtbPx7FaBJSrbbuC9w9dDqj7/PoN4d5b0F8XNnaXzpgJpm81kdt3KpkUt9FKA0Q5gDG3Gm
	Dyoc0Yz8gz74tq0aeqDrakL/dtWN0HlO9YZCZv/awpIZ8hpXuUM5U6Hzly7vfZIOIiUGzVVwRF9
	issdr0BK26laW/re1Y2i06l6SGXODZGFGhaBxPE0MqIeCo1Rba3kNlhhXJ2HGid3Ho5herIWry3
	DHW6Q7AuSqI7T0vWZYDsiQx+fG2nNtxCRLXggw0zHrHHdjdBwAXKtKUh4K1WaiyEv/cgyfgWbd0
	mdLCJb17j2NPNc+TgytJD7gcH1WM4R8/n7JAN3Er/s0JGjhgnvjD/CyMf9lTMgZLZ2YQjc9hDin
	fMiIIvbV7KnY67VnII7IH1FmpDsGVfT2hFc+k0iRq0nZ+RSgp3HC80926fdFOdemTMg=
X-Received: by 2002:a05:7300:c00e:20b0:386:c3ab:ab7d with SMTP id 5a478bee46e88-386c3abaf3bmr8681892eec.3.1795699713612;
        Thu, 26 Nov 2026 05:28:33 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm59213477eec.7.2026.11.26.05.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 05:28:32 -0800 (PST)
Message-ID: <86a7174f-c44b-4663-862b-3631b0d6c5bd@gmail.com>
Date: Thu, 26 Nov 2026 22:28:28 +0900
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v4 00/11] PM / devfreq: rockchip-dfi: cleanups and RK3576
 support
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20261119-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v4-0-517a68c008fe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/2026 10:01 PM, Sebastian Reichel wrote:
> This is a combination of the DFI driver patches from the following two
> series to ease applying to devfreq tree. It is based on devfreq-next
> and there are no other dependencies.
> 
>  * https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com/
>  * https://lore.kernel.org/linux-rockchip/20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com/
> 
> Changes in PATCHv4:
>  * Link to v3: https://patch.msgid.link/20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com
>  * In PATCHv3 I accidentally used the patches from PATCHv1 as base with
>    the wrong DT bindings; this is now fixed
>  * I've fixed num_clks typo in kernel doc (Sashiko)
>  * I've fixed incorrect LPDDR5 BANK_MODE_MASK for RK3576 (Sashiko)
>  * I added a fix at the start of the series correcting LPDDR5 bank
>    mode value (Sashiko)
>  * I've added a fix at the start of the series avoiding usage of
>    uninitialized memory (Sashiko)
> 
> Changes in PATCHv3:
>  * split out DFI driver patches from both series and merge them into a
>    new one; clock controller and DT patches will be sent separately.
>  * rebase to devfreq-next
>  * collecting Reviewed-by / Acked-by
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Nicolas Frattaroli (6):
>       dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
>       dt-bindings: devfreq: event: rockchip,dfi: add rk3576
>       PM / devfreq: rockchip-dfi: move to per-variant const structs
>       PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
>       PM / devfreq: rockchip-dfi: use bulk clock APIs
>       PM / devfreq: rockchip-dfi: make RK3588 use its clocks
> 
> Sebastian Reichel (5):
>       PM / devfreq: rockchip-dfi: drop incorrect shift of LP5 bank mode
>       PM / devfreq: rockchip-dfi: initialize dmc_count structs
>       PM / devfreq: rockchip-dfi: move register offsets to variant struct
>       PM / devfreq: rockchip-dfi: prepare support for v4 DDRMON
>       PM / devfreq: rockchip-dfi: add RK3576 support
> 
>  .../bindings/devfreq/event/rockchip,dfi.yaml       |  89 +++++-
>  drivers/devfreq/event/rockchip-dfi.c               | 297 +++++++++++++++------
>  2 files changed, 290 insertions(+), 96 deletions(-)
> ---
> base-commit: f9316c13d6f621af4f6f4a6089d3c989ffe899e6
> change-id: 20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-74727d64d729
> 
> Best regards,
> --  
> Sebastian Reichel <sebastian.reichel@collabora.com>

Applied them. But you also need to send the clock patch[1] and get it applied.
[1] https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-6-43ff34ac8599@collabora.com/

Thanks,

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
