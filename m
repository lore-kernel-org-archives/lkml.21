Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952497;
	b=iia7ukzZuS8jmmC1oASS8+hoeLM+xdMYQrmJqYxKaLPSK8NUiqceO1aWtqgqxzPohf0X
	 LoH6PoTM7x/JZ6eSxH1vvPF6jwtPHqQ1Cj5KGAXUrYiwgxBsf4MWbIm7IH7bwPNehYXsG
	 oCuHgxcUt1gka+ZsAsyzX/mlwm0eGk4+XNIZnaL71GuKsVknV2VCbQ4vEL53CF5s5/dQR
	 7rhqy4h0WggB55eMIOh7Rnhe0d50PfhbE5WF/CvQptwvsU3EHd32Rax4P6oQL4GOv4vyl
	 6ldddkfifcXFtxzu1+oYAl66d5byD/a8cO7KhoRspaxu9zR0ucxeQKYkW9C0AK6unAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RcRX8bqRjaSVetvCkAy5m45ZgWHcmvyLy0Z8oTre43A=;
	b=mCtjV1cdQq5mtPPcPv4SX31KPqDrJhyOJqlXNCbyODEIrCKOcvm/Z9ZvYibXadRyimit
	 4VSHOr/OEwvZOuyPDB6CRXpPB+W6YiabaUaD+oLwKshS4bMY/TB8McVj0XNgOX1w/PzMh
	 b64WnnH6BVR6kW53O1Hc2hfxpxDL2sGrN9qkOpkTMcwUuWuy7hgM7wpi0ghOx18bsNx8V
	 JXPOmK4/uYnKe8eJOJ0TaPIRp9hZwRLhneBPO/8vefGgeDsnz5Kq8PyhSRi0MXerg/vzu
	 1/RHKNmrYo4iXB5aREyOUMeK0AeZvek0T95g5XUlRU7ha6KFXsrRVkFVCoE4IrfSv5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkTZML68;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94E8606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 21:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B94E8606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RkTZML68
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36dbde64409so703254eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794952496; x=1795557296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcRX8bqRjaSVetvCkAy5m45ZgWHcmvyLy0Z8oTre43A=;
        b=RkTZML68vRcewlJnOF1Bz0/MYkCN4dcXe7c6CjYSHnll1rUQ2Yiawq2Wm2VFWTzAv/
         27Z91WaUKSVq3QbS/1vY2moZiNNvjjYHzqXRhRnfVd6YbB4QIcrA9WKNsaSDHY/+bbGc
         RG/aBioiJhnhk+Oqlcom37qVFyAK87dY6Z5yVN/+gALhO5zdqlaD1bdJouPEBVs1Nhsa
         faR/3v4xkScoJFv4J0lQf+tINYZqXb2SVxqKscCv4PYX9c7SaQuHWoXzDhh2V+RonaVP
         +nWkNtlJJsyloPj3LwERsrQqIJmn3B6AUiHzFrZun34SphyGz5ngikgXVv+aWA1UlNXq
         qqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952496; x=1795557296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RcRX8bqRjaSVetvCkAy5m45ZgWHcmvyLy0Z8oTre43A=;
        b=aWmH5f8Qb5TqvETpJNURCKBgys9BxY15qAae+XxvLqI6CNSGd0kYhn9KPW0AE2E0CW
         q8jJQyOoOBhuQ/t6jxkpD+vnj0sdvjwsI0orfAbicoy9t4ptl8VjUBZL4fsAM54ITZG+
         VgvZ4zMPXw5h9DIw+nOw2OeqbEKE4alfNr9RBtidxkl4rbICN88jE/Dszx09VqQyQqqI
         Vm7dYYz92TR/8M7REl8FMGoRg4jkNtQiVrXetYQqNbrOzTt2uRKTRkv2quRfEq53FRLL
         dMaXFZmmVTrIq8qEdWmG2sNwprvPRGOA9iuAmp64JJgnunfwY7uYvaPVHumVXEA/95ZS
         a5Hg==
X-Forwarded-Encrypted: i=1; AL+hErEf4eI+aVVjpW5v5VZqJuXf7RQZY8LErZe7sXsH/snduNJ5yXwPtpSwE1JO7XGbZKiuvIOy5YTRWNg/9RA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jqqGGZoNcWKf085b7lHxUqceX7Wr9y6wDTZSjfzvSe+YifMbe
	pkw2mBfP+mUJO9motBgxpqWc33eRljsIghgtvLZqXyTzwH7zh9GOzPp2
X-Gm-Gg: AZFdTZeSl6woYYdpBasgNmxEjNrN7woRHxBmDDEpyUvosdp54QvqSuydTufLB7CFpvR
	9jCL5LgbIxoKCiTAU6sFzbdmTmrYHmmeAbNQin34x5VZYY07ybXTF3t4ylGJQQoXDB7kj0iaqT/
	6hE/jx+JACnx0MRDRnctGEAjNm09Ofj8n27GK5dL4j5hgmP4oZz56g7m1nxrAOIutbu87bwvf6q
	R3fx1h94o8cH9j5NpaYBIKyrwOM9lhU/Ms/tVB6ESw1xIXe4lSvXMBUaZEHil7HQgQoDBtwHEov
	eJTysIb7ruoSCgrlvh9oE/emdfqnSO/xXAUxyZHIEpQ7xEu2sowmNuf+rpQBfgckU++toRV1TFD
	A7jfdHpoXaTo9EaOm7rZyhVX/AlJUN/weEtpSWWphc0vULg1iR9z8TitjAN0/WiAsIDj+WvOgTm
	73AOP/5PnOj+dr+5Tiwc0n2Z39Xh7zZ2qjJUIxC769LxGheIV9tApO8rgq0rQhjIXcsFLibX1dN
	uEXkavtcQwdEFAeKbPkhZ8U1bdn14PWAR+pXmuAyyqYQrRSUz2dpoQPJ/N78kyfj+ZOmP35UbAp
	/Z6DtkXQ8j6ChJnU7w7J2ElbxZo5o8X5N8ngMRawv4969eDgeYBpCqf3bvVlrNSRV+Zkzx9nf+g
	Lvw==
X-Received: by 2002:a05:7300:101:b0:375:388:a6d5 with SMTP id 5a478bee46e88-38281213cd5mr636277eec.32.1794952495726;
        Tue, 17 Nov 2026 13:54:55 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6304efbsm1423784eec.7.2026.11.17.13.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:54:55 -0800 (PST)
Message-ID: <abd36a9b-5094-4b74-b24f-704405d3d362@gmail.com>
Date: Tue, 17 Nov 2026 13:54:53 -0800
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
Subject: Re: [PATCH net v3 00/10] net: au1000: Bug fixes
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Jijie Shao <shaojijie@huawei.com>,
 Simon Horman <horms@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
 David Yang <mmyangfl@gmail.com>, Herbert Valerio Riedel <hvr@gnu.org>,
 Danny Kukawka <danny.kukawka@bisect.de>, Mugunthan V N
 <mugunthanvnm@ti.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-kernel@vger.kernel.org, Manuel Lauss <manuel.lauss@gmail.com>
References: <20261117193223.2795612-1-f.fainelli@gmail.com>
 <179494428616.3291.2255681676266334895@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179494428616.3291.2255681676266334895@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/17/26 11:38, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.

The issue that was found during testing is that doing an interface 
open/close/open would hang, every other issue was a result of code 
inspection hunting for other bugs.

> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.


-- 
Florian
