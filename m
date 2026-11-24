Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515983;
	b=Ck4N9i8CeugIgxj0xwzPbtXiM76ZLU9vCCopi2pGDTSv/vnlDlknBdCRGDF/PciOQXD/
	 caiQkrVU+LRf1f8zRsIGmF/DhHYGlJCD89FlufE36QFez5y6lsPkDuVS+VhzsB8hOPFy3
	 Oyo8FkUEefDPFBQ9y8d9EVQUrMF83SwHg3DainXAtkkVXvDiapWoFMSgPzhaleDAphBY9
	 kbmlfqK9x2nH0Je8XlOuvMJJkwOmvC2wyFy1LrRLR0iz462bPD8MmkC+Udbs2W6Y5PvCA
	 Z8aisI7kOKTVV1F7aonb9WTflY63SNbim/TO6qAPOWz7p2dFZe/yo+VReITCUN4cc8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
	b=Pb5WgDMzzBwfO2b6mge9F0OPs76jJI9PQxMvG7vYPUtUo4v6vDp9Ec8xs9npGhnEaG6o
	 qawa/tvv7csQQPTkCi4q5Eb77CJgDnOUAusFIKOuwpszXXIkPGwd+6+rogRImg5HxsbhJ
	 01oAP2ALFhz28p+FlSa9PqYTCanEKIMNKL0K49972V39UbzMtXEDgdVMgnWS/V+PcRA8t
	 xbDxQQfZ4qZCSFEfp/CBi4Cn7K84s1u3NchtPsr+S3px+NCCZCbY+K6tGigDh5ZK2VJhb
	 ToQou8Z4JRvbpGikUvQNJ6xKUrrkWq77KZ5HcArp6RXE8iSCK422WXG1N7JqBcqmkqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RYrZtf1b;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C08606A32E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3C08606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RYrZtf1b
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49465892f7bso3139320f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795515981; x=1796120781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
        b=RYrZtf1blAhSLOe9QzFCStGYT7gGBy45WvSvwem3GGY+G55p3vjoPBCzIMbxTMZtW/
         OacLnbrxHzSqyX/QhvlPTWN3x7WhviOi6kkf1tvp5PXu8qiqnOvCPGoW0WzmtJIA2BIL
         Ra5AEV5VLWHRIFTHowkBgTr+PgnhYiw7KVvZ+vGHjvpPYozk4lXwCrPWpprhqU1yk0RO
         fZshjvq+lqh791ytCR8j9Y2hgGTS108bJafwrCJXF1GyBm2jON/qw3fK62Gj0ml4tIH/
         tKfvuYRGYZ7gII3s72pYuirE8FwliDW2Jt9m+D1kMWqm2V4NuEuBs8aCZ5OaUmaxPKZ7
         IgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515981; x=1796120781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rjPQj6M4ULtn6j0AWEkFprT+kxdBF0dsfklPDyAkphE=;
        b=N8aGwEf1XIYC0W9QfIzMk6aH0LWct7PbIeRCGcqmXpyfK0wBFOZFe4M3hCHgtuA+vd
         meeA/026G0qx6I1hwx+ngYN84LMDxiExMnrmJZL0xlR2Ph+2h7S9zRr4KT/o6Z/OXf27
         KeLOqbDnLzN1Rr64z4jzgCftpLqWW1BQHi8Yw01GI9n60fPwcgZ48SNrTlDHOYQmFGYs
         yKGiIyl/QzZ6PrvL0INo0eGaheWDztLKBSVQs9H7yrvBaD6WDB6QnwOSABTEo0boB+uK
         MsxGBUM4H+MXZpXiGjo0QDXZ02qjCDcIyAv6dRxTAFpN0n7y5x5F4uQjxksIy2Q8wXOd
         Fbxw==
X-Forwarded-Encrypted: i=1; AL+hErE9JW0UlrLoHfvT+2ekhOJnGaoX25+HqDCsbQ/9EnbhhJkntbXtPShdDAeDZHCQcSUYrElPm7KfoPSuw5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y4GvVQ7emSWTAPIjSrwnEUtPUqscWWEplgMh95kRYNenk54yA
	EFFG7VGD9VLNFlbcgaO/Bx/V8t88Ca14fK2HD+8kokEL1HQWtKKeN5oR/bLgegXo0aA=
X-Gm-Gg: AZFdTZc9t/iYmkJnqRyuoiP3sh2ZdamUi4RzomMGc92e1mM82HTxVAXY/q0aiE4JJpA
	XXmqrgM63J1YuTSSAECwYnn3eqRluMDjd/cPPqULnVrXWbkDm+lywQxJ1nkTXc/E5HxqzqSe+i8
	bR8QjHoySwyeqDMeBKVs7V9uGzhEf5hIvKYwx5O9sEF9ayKYnAi+j7ML7ZMVJqK1Z9XyOy2KxNh
	2uhtqOt0VjoJKst1pTr/LaXCubhkYhcv1Y0Fzu/xMFmgVkjpbH3WSzZ+TH7effrTUuVcoi5oI6f
	OxHjRlYLWTtI5ADMRnPJCf+jrsSiHJjQSVoTxsYDxll/gNKaRQm9lUQhpBrRMO/rvFsTfPoc11x
	wiQrYdz/nynr28aMtXFNjVNe1X4ZRdEuibF8rVNwKF6uW0TwPPQrNpvRyIXGeMcCdNX0aRYFXGM
	PhTmySIzsX34aAWc1aGb7bHPkz2gcIhIPuZb3QcqRzVjjB9WVzj8jGmxwwegvM/SarX79ED8EFS
	7CpIsN+mx1Nx6tvbJ3pICbE7XtjtQMzBQpoe4zlCqkj7UaJTOAB4+kYhE4F4BXSjxjpMYhiFGee
	jOAxguqcPqcXWVJSulmwRKts7dKocKMhXZ6hGwWdHHm8mM0o2Jv7qOg8rq7vAl8CghCGR/q52ie
	iUQ==
X-Received: by 2002:a05:6000:29d6:b0:48e:20f9:8d75 with SMTP id ffacd0b85a97d-4abb58ec00dmr16232655f8f.48.1795515980993;
        Tue, 24 Nov 2026 02:26:20 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm27197538f8f.50.2026.11.24.02.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:26:20 -0800 (PST)
Message-ID: <13dfc467-1f95-4f86-9d01-8a5830007d51@baylibre.com>
Date: Tue, 24 Nov 2026 10:26:18 +0000
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
Subject: Re: [PATCH v18 6/8] accel/rocket: add RK3576 NPU (RKNN) support
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, sidong.yang@furiosa.ai,
 ulf.hansson@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
 diederik@cknow-tech.com, alchark@flipper.net, leonard@lausen.nl,
 vlwwwwww@gmail.com, jeff.hugo@oss.qualcomm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1795478392.git.gahing@gahingwoo.com>
 <c57db6883bb9c977f65d34569f1ed9cb5405bdda.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <c57db6883bb9c977f65d34569f1ed9cb5405bdda.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> Add the RK3576 NPU. Its PC_TASK_CON has a 16-bit task number, with
> pp_en, count_clear and last_layer_clear at BIT16, BIT17 and BIT18, as
> Chaoyi Chen confirmed:
> 
>   https://lore.kernel.org/all/4f300b78-d96d-4d98-8819-dc292b0c9b97@rock-chips.com/
> 
> Add it to rocket_registers.h as TASK_CON_RK3576, generated from Mesa's
> registers.xml, and use it on the RK3576. Count the cores in rocket_drv.c
> against the match table, not only the RK3588 compatible.

In the corresponding mesa change:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43804/diffs

You had to tweak the header generator to allow two register definitions
to exist at the same offset.

From what I can see, Mesa has another way of allowing hw-specific
variants of a given register: variants/varset used in freedreno register
definitions. Have you explored using that?

