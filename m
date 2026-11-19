Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092430;
	b=WOSWvL2Q5+nWSOr8chVgtDWE8Krv+x9vmOOM0CVmEbm9v5OSLw/eLdCJ4hac+ztXg7F9
	 lUgbcpYdZLAboTNeP3X+7twgzftMkDJQiymi2KBmlJNW3C3GxgW5MX4UmRumef09pMmfq
	 34JX4CB6NgP9OZxsq9tl/VN69VILlI54qs/YL0ZI11mw/TKHVS5IkMAIdkThXuI0MQ8MI
	 2UlVnxAZco6ScTNbflPu9CBstwOC2XOYLWvbi81Dccx6mK79AGUBO0HSSgZhBOCiGNQAC
	 KssFXIAjJ/42k/9nSffGHhWbngIJUXFjO+fwwoX9hYnYlIK36HXsrI1XVIFgFfhwSKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aPwkHNTj6RUG01VnZHwQBe6NlajTzrd9yw53YuOCt9A=;
	b=kdxy+EfPHLIpgrzSg2TfhepVuH91ifDd2IJKRn/VuuuwI4q5yW5lSjLYqaSWw54wDPwi
	 C/+XFkKhtwaXsKx05mdk1fPiY7qe1GlDaeFZwn3Aj+M+8osh7G6KAoJ55KoRwcB/a4OpY
	 kjJgfblIyVp2D37aQnm//lgJNhphFP3X29Fe3n4DCUyEQaeHTBBZJRNLP0Feg1ItI4Pdh
	 pyoQfYrJ0sKxkLqrfXRVzgvDJbbc2Sk1DSjX+DSWmUrP1MAegXp2TCNsC4m42RsoXl1gz
	 LszbqjJi9ArSaHXfwE89TOFxNLlfkhfhA2Ot9VbTLuqegqMeQevvTuHM+ubgTOMp/0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NvwwWLRD;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACE8606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACE8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NvwwWLRD
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b467581b98so25814005e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795092428; x=1795697228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPwkHNTj6RUG01VnZHwQBe6NlajTzrd9yw53YuOCt9A=;
        b=NvwwWLRDp7Qs5UtSDGgAABsVFvqMBo2hh8Z/WQZno7bgQw9t1McyppSQDAAAFFJnHM
         zmpK0HLKciV1gu/5Te7mXBNOakuOo27N8NPeoLzbwket3yMFoHB9M499ittKYxkfaw8d
         vYxW8+yd6wbh326wMOE5DHUqiWsa+JxHiBfWUnfYovtExfQ+tdW239H2AOxZA+nTu5oW
         EDWHRmfUaT12N+2kFSPfneTa97maN2s9aA/PV8tpflWJ5Hii7ITem/+Kr9ketFFb8ee8
         91SpXmZ7lgHsQFTpNMeMKq5jYN7Ifk6JNc7v0mRIAei0JaNLmYMRM2b8eC+1ng9Xim62
         50vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092428; x=1795697228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPwkHNTj6RUG01VnZHwQBe6NlajTzrd9yw53YuOCt9A=;
        b=dtOUEO14A1hysDLeniPOnjJCIqKUv+8qYaiHY3k8lKIIlp3ixYMybDjM8kPitKWmZu
         DoQMiWl6U9cQDKiliR0b7v7TDacPSomnx4HlQo+/sXoQLDtxL3ky1oKxk3qbLojAQWBe
         PfEtR8pmkswDYi9Jj7TZjsE4Non4s8jj2GafCAJs9z0COpDM3dYsDfLCWv0N/3i0fB2V
         iZjaa9uoI8gShRR+y4WzDPzbZ7/A1chhKQ87wnzVy87MKg80FVnp8QyZ3sYhdPKUHoEz
         Ld7izIigArcIxuuY68xW9f2aNvhKK6Infzwa7Vcsex+wjDA+5s2Q5VIVr5V4aL64u6gq
         BlGQ==
X-Forwarded-Encrypted: i=1; AL+hErFay//yX7JgLIstXOMgi6RrGySDxD6GBCT2ACtKsYNV+gJGSpHX8eu+gyW6hsXAHjFvIue9aHcQl3a0ZBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yWO3xclD7XJFMak36dMTRDxkq3CGpmDQc4604hnlnKeceWUwt
	5uJdloN28oh4Uj7ZZbWN+GTv0QI81joWSMW+Y4mMd8fzHPo4CqFU0r4KpQf6wBxaFHo=
X-Gm-Gg: AYBFou3Sfh7a9GbZUcxR5qI0/MTwXOY5m195LFx3t6BBDV9PCevQfzYKz/8jiMwx5Lj
	z1dlBDdNBxFhn/0EQK1q5brv92purYW2nKqw9lt9+tqlkDRlRnHrkzBtta5Y5xohzCnZQfGXlRJ
	b3Kon6KtjVUAj88wg6Nk/fEcX65Ee2TZLqmUEsXd0/lGWEZN19QqA3oSX+Fh8fJWIP2a7aM4ApI
	B92VBwTAIRmiqz/WMA1+iFVLQuiFgw+AqaNFRgNwMYFrEENHC6lYB3EUDVqZ0RN2BSC59UKjl/o
	8mTys/F1Zfk0L1tQBvX4w2TDenqoLZCpf4xL0jSXW/B7qvwUon0oL32fO94KP5xarTSXEB5EABP
	4HZeFzO3w6KIiKeyEJ8hk4R8l/gPIKFNakvagtVmDK0A8C+Tw0BURXhfjsOxpFVa90YgVxUO1ga
	CMGZDqbVWBlrBscroJFnV+6XTbFOFinVs8IkoaHE1aD1GJyotmOE8UQPwxrIUfr5nNHERkBx8KB
	0Jmzbj4xxsNP8T+ltVU9VfH6mN800SDGs1BLsfLnO+oxPcEmDf0w3XRFijeCpgu+Pp7Ff0Nv2al
	56nNHDCAmuIaVbPh0kjrYsS87zfqKLuPk/Lzh7R1+0cBoczFOtkAuZ6hc28SY+15iGlO
X-Received: by 2002:a05:600c:8b71:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb7da2c635mr107058465e9.21.1795092428543;
        Thu, 19 Nov 2026 04:47:08 -0800 (PST)
Received: from ?IPV6:2001:a61:13e6:9f01:eee3:1629:f0cc:42a? ([2001:a61:13e6:9f01:eee3:1629:f0cc:42a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8535741esm54667975e9.11.2026.11.19.04.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 04:47:08 -0800 (PST)
Message-ID: <1817932e-469f-401b-bc04-37f30625c3ec@suse.com>
Date: Thu, 19 Nov 2026 13:47:07 +0100
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
Subject: Re: [PATCH] USB: cdc-acm: restore the line coding after a
 reset-resume
To: Piotr Kubik <piotr@kubik.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Francesco Lavra <francescolavra@interfree.it>, stable@vger.kernel.org
References: <20261119122842.3611681-1-piotr@kubik.pl>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261119122842.3611681-1-piotr@kubik.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 19.11.26 13:28, Piotr Kubik wrote:
Hi,

thank you for this patch. However, it has an issue.
Let me comment on this inline.

   
> +	/*
> +	 * The device can lose its line coding, for example when it loses
> +	 * power during system suspend, and acm_tty_set_termios() sends the
> +	 * line coding only when it differs from acm->line. Send it once, for
> +	 * the control interface. In a runtime resume of the device, an autopm
> +	 * reference here would wait for this resume and never return.
> +	 */
> +	if (intf == acm->control)

This test is problematic. The interfaces may be resumed in any order.
You are setting a line coding before the rest of the device is
resumed.

To do this cleanly, you need to look at the counter.

	Regards
		Oliver

