Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795521348;
	b=36wft8DoxD5iKc9nMT1mbguqodWOfaf8vpJk1ZLBQuriRmcmrGGKQZZtMOtC5lZCJmbG
	 pf/Zkc8E05ws2FI2TNhYB8G+MIO74KwjZ8TEnG6I/HqNmYR2Rmm75FmHdMEjWBIZ9Diq4
	 osTvEwNE4dwqkiDSxMD4oHLd3GwmMtXMUzG1EPvKkj5FQcHzM6vbMaGCgbSGbo1zx8LqD
	 ZczKRprfOiJyWQR/mJ9dYI5GxUg8l9mIu87g9ByEJi1QtdMmmUardvdYLrtkM4Y2cN3Il
	 IVou34KP0cuD6EUF6OwW10y/JdEYEaiZUiBRL+8WfNgsdi5Fd7SpMdFKUkM08dwcwDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795521348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
	b=LewP66aHzcONn+tMzPLcYyL0ybEHYZgP+TX72qSWK6f7X279XRKgufPN0eyjXv6gJaDr
	 95XAa1q92YiUUK5VjZISywJBN7gXXZJC3ggwm8ltzdKyA89JWFyEkBSBlmRtzNzkcl7i1
	 6EwjaK37UMojLn9mQ1IfScRo+ZWpnIDt+vFAODHjZzIJg5LcpKfLB5Bmgk8IAcd2zpGKE
	 kILynW8Cu2ZBsBkhuT9Xdfdoyywn3tq9YbCNgCj0wlD/KmGGUWEXuzGjIAcHtFl0v3ffJ
	 woLnX9Bf11A2iGjS+jJ60V11GAdt8QEa0iaaZrkuPU/ahaVASDHFE4RShyj2jVarUQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f4Rq2wm7;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E485A606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E485A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=f4Rq2wm7
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so3757531f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795521346; x=1796126146; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
        b=f4Rq2wm7uaY4zAUXmqNT1XTFX78jWfrfq+IdPndw5IG+L+GBs4zOF5AzWDlhpInAxb
         kYnJot0xov6lABblQoQvxhHyBVPlGLtgU0/wt0anzGZPH9Nna9tLv36ALJ4HJk74FrRx
         j2pzG9WcXoJjnWtQhbhwt7d53J7WmvkthRw7wWr7WGs9zp0FjloM9f0Y97H2cMYqYYSG
         sjVx8GFIBCktfHhm/iS2gOjgL1ghVl0A57Cl3w2EHonQ9EahVleOe/Dlz9NdMYtkAvU3
         4W1F0ziI4PUfp7U8BZxKZWDZ4LLMyJ/AKODz3kjunuwhOjwYaVObyyAS09bUHGyB1PWN
         ILkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795521346; x=1796126146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnwt3Hg75Jqhq/RX3EnfxRob7Sm62Nv/9HL8t2YUaCw=;
        b=A0jt78+ta/KeWndN4WkfKJ/plBsFpQ+cI9v++VZevii8i1+spO3DerHasnewzB8Lml
         b/EOTcN9P5m9DTe/Am+cQuwxFqPrII52EQcta9URon5uJlchynMLD28UbQIT4Te6W+Ad
         XtUWc0CBSsLyuW6hsjiMrg4kS2PsFHGyO3Iq6UJRigYEfHBTAWwWCZz+q+Z3CaLcXjej
         0mFgm0r0nJBb/lTckA/SFiX5SbrTyVVUNvDtKS2QDyQLKEP0J6MDA3BDcfq7e55n9LeC
         hFgr3gMkStSgD+xNT6nyzvzPhbLp1ftSyWmYVA8xImjS8rabdko2hKkabNn2p56bEh/w
         IdFg==
X-Forwarded-Encrypted: i=1; AL+hErGl8hcEvVEbPufuQVC2Basz2FeWSIT7IJwC6CeVxUngSK37iwtw3U8ByI0Y6cRuWgoGYxddEGyzTLWNgAY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+LZZweuXAQLJZJ7M8l39BEQ47PHgzQQ8vMlQpQfvPDdzTTUWU
	jNnY8XstlaUWRF8YD5Hk2365etqxf1gly2rb6Ft+edzrU0a83XbTFuB0VO5TMO66Ahk=
X-Gm-Gg: AZFdTZeFgUbGutMPPPNOPfXb0S2gNVzO0I9nCfCFpGPnoya2DlEEFFpugBQ27hlNlSP
	rlaGDWBSWL7f4VoAPeLO0rWqSB8adehYi5eivya0Egfbawdfg4QbXI9JUKVdBj7Y+rc5o13Uneb
	CJsbReeptCqhbboBIf6ZEMYoqMnMuIisENnLdcCRkLsE0rsNL37Ct0Bb2rpKDJFklNv9ewEWmhe
	pSj44pijPpaGCyS+6JUckwA8goyO2w8B54+7n/85uLYUp+6E0Gt1rgh1K5xzEIn76smvfd/8jVB
	9jr8rXyLGKF0krLrYTdkDkmuufzYwXQe+lZhXOstT1JsSCWNHltSsl/jGBxHDmIrA2yg7TdwknB
	7mnZVmR0nZE8gCSIU9PeBdDV8imTx5vUsSZ9xXdTAqyVqhGI6dMtoEfQEC3/m8QOhKUUVwoeGog
	3jcoBibOCtLXNFzKaLdrjr4bLp+hrQyjf64OeiWIm3u3FFBfRdSgfcmD/m6ayaENzUHyfKNnFyE
	WIQcdR4aKCksyaWFot1vPRFqQFIamN9rHP1lF2FljofTwSGyZk4qmGS5SQ8UkrBUcNENJPjR9rR
	vDil+SHqfLM5D+qlNI8sehnQF/fIAFMr6UuabO9vcDfHf3rql9U9XuwHUyl49BG5Ze5BK0IGh0o
	0wpqW9NStlBUGRFBwrSNiE9E=
X-Received: by 2002:a05:6000:428a:b0:4a9:dcdb:2e11 with SMTP id ffacd0b85a97d-4abb8406ea4mr29382891f8f.41.1795521346404;
        Tue, 24 Nov 2026 03:55:46 -0800 (PST)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm26566053f8f.40.2026.11.24.03.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 03:55:45 -0800 (PST)
Message-ID: <bc4234bb-8901-4d0f-bbf9-66f9715c11a9@baylibre.com>
Date: Tue, 24 Nov 2026 11:55:43 +0000
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
Subject: Re: [PATCH v18 8/8] arm64: dts: rockchip: enable the NPU on
 rk3576-rock-4d
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
 <0bcd73278a4c7a0cb2e1b8bdb9aba306355384cb.1795478392.git.gahing@gahingwoo.com>
Content-Language: en-US
From: Daniel Drake <ddrake@baylibre.com>
In-Reply-To: <0bcd73278a4c7a0cb2e1b8bdb9aba306355384cb.1795478392.git.gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/11/2026 00:01, Jiaxing Hu wrote:
> The rail is switched with the domain by commit
> b1bff9ced657 ("pmdomain: rockchip: manage the RK3576 NPU domain supply")
> in the pmdomain tree; without it nothing holds the rail and it is turned
> off as unused.

You can omit this part of the commit message. The dependency is stated
in the cover letter, and domain-supply is standard enough that it
doesn't need specific documentation.
> npu-supply is set because the binding requires it; no driver uses it.

So why does the binding even exist? Is it because it will be needed for
implementing voltage scaling in future?

