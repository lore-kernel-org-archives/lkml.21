Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795222495;
	b=1Gnw0kkxJ98BU2IhIMNRRYxIVRoDMyKtO/KAg2GgshhqZigdbqUBCk4SJtme9oP9a4TO
	 CfqiGh9n6RWX2SPX2HqE0uRqrUzH3AVYT/VxEiwzFPrsGrMsJ7TQKVluKxkTgFhPT2/eR
	 3h+55nPThWR8INxXTFkRnofsanobTSi5M2XN9m8EA/HOBhGCGv8EuKQbkHE9wu0Tnckag
	 puDtP90g1Jh41cQD5MgN/ghIVhCOSrJcLRaSMShPkG8L9i0vAfbpJJxqn2MsfPnk727SA
	 izszSAdmedFevgm2O00y1ftScPYm2ImAuiJu9YyGJnaxDzySBAoobceYypFkIgV62lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795222495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xpjVDG5DIBxUNv5FmdAiwH/Mw+gK21icOFrFtWo0EwM=;
	b=QPwC1QeU8Vzn2pffB4nFHK74oX8AECljVdJkqQmMF6thSVXfAe0eUpqh6+fa6CiIG3Q7
	 zdqQevFnGzZQuYitoK00gJ4FLoSUUG2iy7IoyC6aHegU6ptkuRemo7reQs/sMgW1M29JZ
	 MI+rtHU4+t6Iu7/ybM+YtY9NE0c/P7kOe8Odsh/BQDG5ndr4BrXnuER2naSpdwRJkgYeP
	 RzglgMc5NiJXAo92JdzWXCvgyliN9WMaBfoM1xhfycVh5bTYMAfHXReyHOYYYfLLzcwU5
	 yFI40CDDIuoVKlPhaM4Xl1549j2S6wge0BPWtwnvzLmyRJzMRdnQcH/fmuyp4k5RjJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yV+jdxXK;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0C606A6B8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 00:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA0C606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yV+jdxXK
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55d03bfd477so17364951cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795222493; x=1795827293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpjVDG5DIBxUNv5FmdAiwH/Mw+gK21icOFrFtWo0EwM=;
        b=yV+jdxXKs8E1Ii5RBGD/Le6EXnnuK+YPE76MclgN0OHR5FWNo4y/CGY7dI/Hkg1LLk
         /RnGUYWICm95niXcS7wdCRb5nqUSD4jBdhcabnGYeehZOUhkZpi2dETK8YTqDqqJTKL+
         KGJXIVZibG8KIsQ3Kd5ugtIXm5DxxFnm2A7LLlgNwGhQyHrXm07HjPSj/3irCF7bZLHG
         1ZdhqP3q3QQBJ3SyYI7GsjyoGmnGyQfluo/qUNeiF+75Z36ddGQCfMN8Ka4hHmY43L6J
         V+jkPeyK5371tGa8xH8d765GNQE8pKngA89rssXM7sAF0t97Ng8HIPtdqR6I2Rdgt2pU
         gIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795222493; x=1795827293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpjVDG5DIBxUNv5FmdAiwH/Mw+gK21icOFrFtWo0EwM=;
        b=OVdtbcUxBXgRo1lrN0FQbFhkoKsemfrX9hDIDaq4fR75slE9Asmqxob3/MV3jJ21lF
         jIXel8cxSKGib6BdO7Bd/aKmA3yP5BOHAkTIBLQy8jSg7L7zsPOKrGjTInLQMGidXOP7
         2Z3G/wWhSpnsf7eCGtUB/166M2PSLCjOv/Z64/7rJNOvfouhj4EUaKS5IalPPOfilmzQ
         o0yWHBPQ4Na8ioR+MeJa6IExPN6EwOnTTiMICjp6V6OLRUMgqjrt6VcpWDEJM28QE+Ar
         K8aFTEOur1k1w20YCj5B4ss9hcc1eH8R/zj/gujyYcOk2k4v4Lc2s+C2R+bksI2RTLBN
         MtUw==
X-Forwarded-Encrypted: i=1; AL+hErGlkxTeBwUvttrNOYSda+X2t5UBg1S8D7/9mabAtfThTD4D1RdluWnUKQ66RS2JshZdH6SJ0BF//bJ/w40=@vger.kernel.org
X-Gm-Message-State: APuU4Z9u4WM80HNODv78e96VVGgYdoD4h7xoA45fe2/oEhrMvwwAa69E
	R6mADa2RaO5/tr/rseR6h21Zpgz2eJ3y85ut4iR11AfI5TaI+T1DeX/Gl+DvHg==
X-Gm-Gg: AYBFou2+efP33OzaCZZbNZ27A4wWrKWFcEW/q0xlgOhzlvh9tYmZc7R4r4uvpKLlg0R
	D6odl+yCBsa67swn9xqi2YR/2RCPvJev2/eFFdhIshqidahm3RgVUYpAQoEpD/Oy93TywA57a3O
	YkOf0jzP//WX8455prZ4ck36y9Tl2wicKdRhMRYsImKgxKRcxXsxEmQPqmTdleL7hl+Hoj0PmpC
	VudZRbHgpsLGXCPJfoGrHuqZrVcACBqkY08hkz4+RUwZHGzi5XXV2PiOri4i9/2/eGEmqOIcLnQ
	vEGK+KhIoKD9bi5YHoi8HgcYVK/3F7Ej49r4CeCG1BNWdVIJjL4UBf6Ds313gjdMnMA7kYralXL
	UQcRqkskwRPNpfZRJKX/tqOalAM8sB4v5/k/Wq1JyGux/h/sUNvJWVw7Nw3u5+J/yQAku8AlUGz
	Vsd+Y19T9w+HMNqWZNqe/IoMY6HJohGpFmC58tqYcdk7ThAB1xHSRfFck90e2+Oa+nYHC92KBcl
	Zqwiox1fgHi5GF+HHhZVfXZlT9QgXkCN2ZKzaDE8J9xB3SuLEZgQgC59ldPagALD5zPz8jRPk+t
	3TSLZBwtYP+MPgXCgAzbmyhIguL8zhfGXE7C3ipuvVzygqn0+iMKXkeU+Q==
X-Received: by 2002:a05:622a:34a:b0:516:ed02:c85d with SMTP id d75a77b69052e-55d7693862dmr90608371cf.3.1795222493469;
        Fri, 20 Nov 2026 16:54:53 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7c654585sm29801261cf.5.2026.11.20.16.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 16:54:52 -0800 (PST)
Message-ID: <189e3942-0a1e-49d9-aca6-88eb3aa5e0e3@gmail.com>
Date: Fri, 20 Nov 2026 16:54:49 -0800
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
Subject: Re: [PATCH net v4 00/10] net: au1000: Bug fixes
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
References: <20261121004809.1690280-1-f.fainelli@gmail.com>
 <179522240067.3294.10288163066827919663@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179522240067.3294.10288163066827919663@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/26 16:53, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>   - How the issue was discovered, e.g. hit in production, hit during
>     development, syzbot report, manual code inspection, LLM or static
>     analysis tool scan.
> 
>   - Whether the issue was actually triggered, or is only theoretical
>     (e.g. found by LLM and not proven at runtime). If it was triggered
>     please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.

The issue that was found during testing is that doing an interface 
open/close/open would hang, every other issue was a result of code 
inspection hunting for other bugs.
-- 
Florian
