Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422478;
	b=lduggDoT2TBsQjvRTtodyNV8fNGAa2BE8MjGJ4/RRT0oVChcIQ0l+VtZDq2eqkRlvIv7
	 aKyb9H7YacBUvmEguTWvgHIqbEQ95AfdEHY8lmz5vlYjNHUCIEnHxqopIss3uXqNb/pD2
	 CmESh3Bh4xrEjDydRukVr8ZSZOYEhp81MpjixmeqE4jbygCoLLMOhaIRYVyzhtfiWxUk5
	 pptfRkDAEFIJY1ACDjxH+S7ScLVNyR+pl0b/+hhKK3HIN8pVRy8HZcBq5YvJt9Tx6qVhL
	 RhRNmK2rbmmSnQWqakueNz3CdshAogbK79HzqAwvYWU8Fk4Vl8ZdphKgH9NkcZFYiRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=eAf/LYtQdzETgJNaoLTxIh/MMYqJFTgROGsz2hEz7zI=;
	b=wSd3R5niBLFS5YNUNdOlRUIVkEzOKg9c9iYKt/1Lt9mSiClNnptKZjpWCnSIPQiwCj6v
	 Q0a4DtCCP1dVyNVoeVRtDG1jXXq6ZPf95hYyFi8At8gad4XW1HE8+YxeSaWxJuR0Vqq28
	 IygTMLytSEOXCpNQONSjpr+fH02SKrKbC73jtqMXTvIPPHIa+twrjLevIWhwcsXJDZyBb
	 LrcZvS/xRXJfGKYeKppP5Zd7Vvf0/A9Vp4ndOQDxmTraDdFuAcy7+AoJDmojRSeyscNh5
	 B5lrypVn5XJEeyKcobCRkpHU0MmZqzGdziMNaOob7aEV07ajwesXbXvwwLrk0ruCvpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MUcg5Qs8;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862AD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MUcg5Qs8
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso1347966f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 00:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795422477; x=1796027277; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAf/LYtQdzETgJNaoLTxIh/MMYqJFTgROGsz2hEz7zI=;
        b=MUcg5Qs8HOGbVD3a9+8+XyUDTDo2XHgDr4iDZMV/QDQh2BbTJc27yR47TH7E0ckJv3
         zRZn92fj2+uJBhQbW2odayK079NQuK+L4CJuRSd/VyxbvDXBFnmmnUQtcyNz8CASVjfA
         xUsreHPFwe8b+qlE70brFZI0TOxf6FAY8u26l2ImsYu60ijUIE1Q9QjjsBadc4zOadhj
         iJr7JmfJfIf3qjrm+nD89qsuIeBsdKaSTW7ohuMXPPowo9D8Fk+uh0QEfPTaUyQpGMbS
         vz498c+CfhFZZlsQLchobeuLiOCJzwfuDwxhzGAVF6/+Ts1ZpPOmY2qAlKsHoKcM0v/g
         p3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422477; x=1796027277;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAf/LYtQdzETgJNaoLTxIh/MMYqJFTgROGsz2hEz7zI=;
        b=EPketeEhZSvM/xJtE+EafGG0JeXCWPkxKNJ63QayZBcA3/ZFoQONvsTz1EDWl1R27A
         9OXeDpUIklfjzf4ffANS5q4hC2BLUW8fesaQUZJATYUWxZNUHWldX1mdXmA+2lNy/q1x
         tePMTJEuuODAL0ou/6p+9+sjp8bF6vxhVLkxNHJRReFKErrvXzSGoPckISn3vg4YrEMC
         Mgnad0PsY2IVQ/rrfEqBDIrWB79pHTbeTYzHHAyQNf4tA+eca8jFUnEj7cmK4xl1KfxY
         b2iG3JkF5ZYs0kboUi51ba1ItJO/dTQJBnSn+MjWDcSpbwrUQYt0NIxtvUquUlr9AU3C
         6jfA==
X-Forwarded-Encrypted: i=1; AL+hErEVsa8ZEIj0fkSXH1SQibR/KFRxwP1s9a2MZlJxYocQGhva7z2YmpH5Ll7uBvYzODKLJ5/ngmt3dafyUFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UuecC3hH1XvAZP0Q+Gej/JaNiZWcFBc3HQgQwKvVAh3v5VlwL
	cyNfAOHnL2mJSvqCCRFUt7Hw+zO5HVR3yTk/jUmPDCQ1LwsbC8kAIc0xnZ85nWxMVPE=
X-Gm-Gg: AZFdTZflbQvkLRGGaanyvTJiV4/v7L6gUDvZDl7t21WdR6HvS32RTGnCsOA9QBwrA+z
	Nxyl15Td+b+YFnO8c2AppmMgcqtYFSJkPQfZZo1ZCK0ebAu8maif259NFQR46qmoBv7AUxBcy5u
	DWvxRYxovyy8cSSbFgOgYRz/Yeq9DWNWSaj4igWVltxMSg8nTHEC5JIwZYa0/jw8utCrWPKiiN0
	2qjhMcmH4N5q/6TCyBeuxdCl+N05TG+PwT0cGfT6JevS/NiQOxkDyQpkxx0O8/DXFm/ntec5QiE
	gP/lOjKTgjA9C+p5kZkBYj2gYlmDFNygfSGV5TJM21UeiZzem6kgJaohYA+HaUZ1Nx4glek6buq
	VzH7FIa+Bgm+DY649DM/pKzrjrCfOAW9mYJVoMtFuEAeKxKjkWBl2BV7JZdmTgiyJRwj/4q9tqn
	qQ7d3u+z/yRy0Avepvqjr0zUyGR+5Y+xysDxf3Nft+nauV2S+DfU6ahH+t4b6sR0gkaoVSkTX3Y
	x8fHQkhBK2+teP/dJpSzbE+VhCfx/428vyi+qMyMUN1NLrt50HufOt0q7HSAJHYgx6x70EhA4NH
	bmBJCnCj3aMHW/+LKuBCOv5oOgMk32AcVHObTSU5Tc3X1PscGz4MunlgFoPF5AHFP/wPJa0=
X-Received: by 2002:a05:6000:188a:b0:4a9:dcdb:2e23 with SMTP id ffacd0b85a97d-4abb4f59b64mr19748393f8f.56.1795422476913;
        Mon, 23 Nov 2026 00:27:56 -0800 (PST)
Received: from ?IPV6:2001:a61:131e:b901:6da9:459e:7c6c:e85e? ([2001:a61:131e:b901:6da9:459e:7c6c:e85e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm21089807f8f.6.2026.11.23.00.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 00:27:56 -0800 (PST)
Message-ID: <68f6376d-a0cf-4f87-9cbb-0afb7b8536d4@suse.com>
Date: Mon, 23 Nov 2026 09:27:55 +0100
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
Subject: Re: [PATCH 1/2] usb: uas: expose US_FL_NO_ATA_1X in sysfs as
 ata_passthrough_disabled
To: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Alan Stern <stern@rowland.harvard.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261121155253.4980-1-mat.jonczyk@o2.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261121155253.4980-1-mat.jonczyk@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.11.26 16:52, Mateusz Jończyk wrote:
> The uas driver blocks access to ATA passthrough commands for some
> devices it considers buggy. However, it does not expose any meaningful
> information whether the command was disabled by the driver or is
> genuinly not supported by the hardware. This creates a problem for the
> smartmontools program and makes it difficult for it to provide a useful
> error message.
Hi,

thank you for handling this. One thing though. This requires putting
the emit code into every driver. Can we centralize that somehow?

	Regards
		Oliver

