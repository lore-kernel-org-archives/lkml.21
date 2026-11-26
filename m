Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657738;
	b=so4uEATRZ0oF1ySjQJRqLCukhidXFG7Qhtb9AIA9uFueLhFQ4kuLN7kPCLoQB6gChLqz
	 bILRISIeBiAJLeiUMzmgRhY9vxUETBSXpLZSJiEJwZ3Y6cyWxIub126mP/WvV+ozRgips
	 Gbqj6wU/udYISk1FVrPcpEonX0x/7BDYxTWQOJVS9aO/79sOG3ewJ5+lwe8t55H1PPhA5
	 b9wzWYlI/tpNBZxm6Dy0t/0o3XOiq768OWZ1AoCvB3xc611MCtAc3emjF5DurhTNfbp8t
	 fWP+Ib0NruENg0q3OVJ/uJPlMFdTZDcTgR3HZkf678WOQEX25FPI2t9qVcBH41rO2dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=HJrvEI0w4/nagFajlzLVreq9xJMwT6Dei5ExGu8K1us=;
	b=s7Bje0qyy0UrUVXvOcAXgDeaNE0mdx7muE0wVIvaH3cTfatzoXrzTN3iKnJYxik0hyeB
	 kI/zsQ5lofkP9z/8dDEE28yxt6cn9RFEDCFyoGukrDjubcfNHeUDma9IJuNNhfjYirafg
	 NlsbzLhKtRqRU9P+3NZno20Y0x0BhvalzD50qML91bsv99mQdm1g/RcCHp7KLfI1Kxnsf
	 LoOgfxU1PZzBt1g1XwtP8pHIsszz7OzSBoI6LAJcIGPLF8er60+YNlvmgObFRhHPnwwO1
	 Mhff+r2d3l3ugKSb5uWMOwCwuHP8tpkWZfOduUMY2rHYA0XeYdM+wBBJyGUBoHslnzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=DetbId0m;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B147D606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:48:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B147D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=DetbId0m
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b5786e099cso4968183c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795657735; x=1796262535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJrvEI0w4/nagFajlzLVreq9xJMwT6Dei5ExGu8K1us=;
        b=DetbId0mZ31noCX02Hf6XnTXArek3IPwG4PAw2/ENsbzw9OCekMtR1hksjyZC46Asg
         TI5FiTXxbpmaZI6Ih9txi2Pksrhvhdr3bChuBfET+Awcx8eqAGMC1hshjjvxO3TkypTE
         jFE5+RxcZ2XwfK/NqIw24++6K3st72Ng61Y5bg2UsntjzGPiewITtHpgUuHGw4Vb6H/z
         csuc+sKylCVkrmFgrlEObPgstGi9TPpFHkIB/B4gT+V2RfiN8Zc2YXeW9l8sKD4XHjN0
         kzrMtm5r4ZGlrmyr/CdOSmiWjpQ+KKSGCbj37PEQOsJRjZc8sDctwjx5GUSkJndyNLD6
         t2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657735; x=1796262535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJrvEI0w4/nagFajlzLVreq9xJMwT6Dei5ExGu8K1us=;
        b=LDlOO0hF5khW977z2mK6GSBCpeJI9B4+V2se6nFvJyWGebZrqvvdCq7o05YhabqcxZ
         mSkcxpr6R4PYwGPduWt14PqZSAVX9boWCe/yW8IOC7egFGIemyjf1uy67iBiy45zzkiL
         oCnMXI4r4/LciS8yHABJnH0faiB/a4Rf40Ew3jaWNx4XLQ5Jp+TivIas/gUlaNtpmxfd
         CKYFkJRdfj2aiJWL+bArcL7MZi5FY18clR2vf4uUYFqZND8P8GbLd7/M7+9Q/BnWuCJS
         k+SOW0Df9l/cp8OLd3eo2C0AvpYl6Wj4m6nBkd9ef0MZbnVsu58r+ld0D4jtLw6pvHdX
         AjRQ==
X-Forwarded-Encrypted: i=1; AL+hErHHv6XPB964cMZqAjrlVJgtTKcukQ28QrIRJtPfWdG4pIc1gNK01i5PioCddq+/EoBykrFM3/rw6rRZQsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZQEqydNVZFjkvGhnKWgXHM0J/Jqwj38/ijCAxRqXEXQr2axMr
	y4TKU9K5caValCF1m530MYfJy8vpGhi78sodA5TapdmFFncCIcN/mJHTqiUSwIuilA+7pugH/9h
	wTSO6is8=
X-Gm-Gg: AZFdTZcsHewmWjEIk4/v2/hGIRNrGj8oehMFf/GMH89XEa8/sbpKeIFOxu8aPaD/LqL
	rWqzfRsFtvYLP+Hrw3u37g0tfCfJR3ZZeYHy3ljteTJbmZxUUA4+JyuW0AtdWUyVrcs5YaqjZpH
	utGqNmCZO+//cF50MZ1ZFEUG6pCk76o1Q8g08b8AYfd/zJHqV7hZ+5hmss6I2u4vJcV5Sn2bxUI
	uH6fBeK861DuVy/AZNvqwPCv5KwFH0Hb4sJy/qCm5KjUOMw5Lig2n67jSYxEhqPGPRPSo+cghuW
	sDz8+xOmg7wDj/QD76/WDLHIwb8ENLOTaTiBACQtp9I4RWdegnDIAKliPNaKLK51p/2CAXMOXOq
	XZptk5Wvu8CtVyRQWKHAWrJNBYm6n4CiuN+lnTLb82U8cfKzRsjftgRisfzKwkb+iO0WvyFTFqX
	jfTgPMhQHveP1DUrexAcnpKqCyCuF0YcBdm4a66NRuYPYaJmy5oVQCsihdLJcsFjb+dmzy0eb59
	SkwfBMvGtJ88bnVf5SCViddxdByGzAG17q4WJtew7x7pVfuCWZw9N93L4hfmtmTwod1wgapeZ2K
	r9GWNpn3OEO9rNyeKyGT/iDqWBbUgFdnBmMfD5MfGps+dQtwUF27K+xjuQ7Ralg1eb1oXjNfURV
	BJchEKSImGdycVvPm9cIFv69b4lLQNdg3+TZitu8Nn7wn8q2t/w==
X-Received: by 2002:a05:701b:4583:10b0:1b5:5915:bb34 with SMTP id a92af1059eb24-1b55915bd9amr17158608c88.4.1795657735413;
        Wed, 25 Nov 2026 17:48:55 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm60595886eec.22.2026.11.25.17.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:48:54 -0800 (PST)
Message-ID: <6bddb1d9-fc18-4308-8d64-73705254733b@kernel.dk>
Date: Wed, 25 Nov 2026 18:48:54 -0700
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
Subject: Re: [PATCH] io_uring/openclose: allow an empty path with O_EMPTYPATH
To: Jori Koolstra <jkoolstra@xs4all.nl>, Hengyu Liang <hengyul@cs.unc.edu>
Cc: Christian Brauner <brauner@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>,
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125180817.3682397-1-hengyul@cs.unc.edu>
 <170898867.2781789.1795642036410@kpc.webmail.kpnmail.nl>
 <86fea5ad-43d5-46d6-b2e5-f93b8a6afb8f@kernel.dk>
 <805466896.2784291.1795644146928@kpc.webmail.kpnmail.nl>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <805466896.2784291.1795644146928@kpc.webmail.kpnmail.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 3:02 PM, Jori Koolstra wrote:
> 
>> Op 25-11-2026 22:47 CET schreef Jens Axboe <axboe@kernel.dk>:
>>
>>>
>>> Reviewed-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
>>>
>>> @Jens - You've pulled this already, I don't know if io_uring appreciates reviews
>>> after pull. Let me know if not.
>>
>> Always appreciate that, the link is in the commit too so it'll be
>> discoverable after the fact as well.
>>
> 
> All right, good to know ;) .
> 
> I know Christian does some magic with pulling in the tags even much later,
> but I don't know what he does exactly.

There's no magic, if it's in the commit message after the fact, it's
been rebased.

-- 
Jens Axboe

