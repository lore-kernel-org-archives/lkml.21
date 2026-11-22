Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378148;
	b=XSAw+yr7L+2Qv6M6hbtAPQP01R0O24Pv8R8HyZbdP2B3E5kDNhho8LGLG4XCHvubaCb5
	 ndwvrDiQpthch+YNTHgGQGGsUBo76nKLyQIq0zmnrhhuGLwHu5u5EP17aIC/aQG9laBP7
	 7k9o/sU5uXaemuyc5haaawvYM9oJ+Y3Y7SejO2vgQ8zEtQ7/kkxvQOPiiZ74Pc5rOplOQ
	 Evu1Hn0KlUhsumYZWa5od19bKlIJmKuU7U/hz1gCciA/QCr7ejhU8iKtJMC4Ug2jc+Iav
	 WXjC60SfhlmQpqT7OmEkRm1/M2lubk7fuJA09AkLcWYUvqK3/pr2PsNo+7EnhSNGFtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378148;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=D0daDH5HLqNQ6RtLqLSp0TJc+PTT+VjlTZzQwFmEgXk=;
	b=uQ7kcTZi7sWCcyjnRTtevH73KYsGdePxXPzwC9Uam6Ffkrma7TRj0Yv8YbfkwW3ee4/R
	 og0hvkvRszUha4/JYDm0XNk/xyv/RK/Wg9Nt+bgObxfLVl8r+up9gSua22lNpGNKrG0Iz
	 ruLHdw1YT4X3p74QHr92ve70c5BRCJqZCIakaMLsXBUt7LAhisLozM8CfQ6V4QTUTmFKX
	 xb1z+oCcEkb2Hx7OEvH8Qvnc4n8FytCYX5i+EyaFONNHME45vGqQJb0NbKHB4vzXdAfwt
	 zIauRvH8OopPE0rdGgOQq2uMJvR8uoulEIqj48f/LPVtep8sMvM/zOd0sRL27cnCEpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PtDyBzu9;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E3E606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6E3E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PtDyBzu9
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1329052a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378142; x=1795982942;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D0daDH5HLqNQ6RtLqLSp0TJc+PTT+VjlTZzQwFmEgXk=;
        b=Rz9ENnrWaD2kNTl1yyISXubMuJ1sI+YqpGGoiq8qTQGXp1l1/gbqZq8UY0Czi7sFuD
         n+fGsOoyL4wj+IqQtl+bCR+NAt6TT/wBZqPN+MFGQPh1UTUn401M+/c0KDZ7BaQQ/iLx
         YoDXd6embw1cLBLQ6+2+ADoYYDCOSFFNZG7lms/V+0RMJBCGfuF9lFa0Bh1OgmVA3WiM
         driFLr+vTWBDDtObgsVuUbfYqVWrW6ecsCGSEb9SUDvzsSIVr9kqbhxnKcV17h6d7fbc
         b+LQSWbUoO7ti3ASFsDQwsxL72EfZMFyfDLMICb0afkENz4XjZmwTtrEvU4xonDJMEJG
         U/fg==
X-Forwarded-Encrypted: i=1; AL+hErHhLThu/o8a6g1tJLBR5dXrqCyS8j7FpivakxbuRyIA2nMpYfsUYZ85O7U1ErabHveQss/1pQ4ZqTNeLHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XkbW7kI5wCXofBH2+RqK5zXUb5hknBkdXZtn/T/56gn2b8N9P
	/JmcWIuhs50vDBlDqxAQveeULTQ1KhM732VtxRVyxSNFF1zhT1WaxjPCY3GAiEl/jYQT373/Lf3
	0e2QMkUT+5Czlj+eM/zUY50JyVoeaBd++1FewAGX8dMynY8YfoqsjrmuekuylbL1w1/bODXP+Fl
	FvKQwrhIv1w0ya9iK+kj+w+5+oOlyLZCI9TEHdjQH4vsVmMYtKIFLnFuF+7RW/PK0Evo5AE7sZt
	M+UeQaYDOluYRSZxaQo+WM=
X-Gm-Gg: AZFdTZdhUb0W9X+UB3a8Nyb8q7vfmvLcO2Hi1zS07X03y9QKxKxtrlpFDd+hyzOUOJg
	bChvrcqtjOfVUWPCssWc5liETuNcmIr8bguEEOFgT6oAbEtu5ufvYmlcTtm9vV36iRoAJisj9bC
	q92s8QaGcm60btHVv5GwANBk9MXrTbTtQLCDGKEUirQ0WTj1v3AudwkRN9tyOpJ4D2YceQgG2Q6
	ppfp/1omXEzw0REa7DbWMxgwlBLNoTfEBj5DXWpnSxXCzaUjP3iMzUQXj/qv/QDraLwj34B1KEM
	McaLRcxGujiFfo3b0Y/9xxtRXx2kJjN+XGz4jcax6E8uG/h9oSshIPc4lpZYMxoDbLvCggIf5Xp
	b/eQdTH4gVMXMtjqRD27FBqH3+sWRWYUlp5q0uuQA8hh3WsTN5o05LbiAnatg1olumYZZHFJn9Q
	/yJZyLvRmGeGmGnKK4tImKvRf8tQ/VwGASRRWhrYDFig==
X-Received: by 2002:a17:90b:4ac5:b0:3ac:8af9:4a77 with SMTP id 98e67ed59e1d1-3b41c8d47d4mr8107425a91.10.1795378142116;
        Sun, 22 Nov 2026 12:09:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae532fesm6928522a91.7.2026.11.22.12.09.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso2679380c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378140; x=1795982940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D0daDH5HLqNQ6RtLqLSp0TJc+PTT+VjlTZzQwFmEgXk=;
        b=PtDyBzu9q/pTHMeMXE8peI8UEK07iI3v8t+WNlIkQO9kXFw6k+7OYNgLFdofWxBgsE
         Xf7fgo09Y2ZvHfZ7XUZTMgIndXSCO+hCICgItiZG3z/PtTzMMfMj6KSQrWjPbMebThuk
         dOdyzMFpFitWEXbjwajE7BdsE8vY0Uu1L7IeE=
X-Forwarded-Encrypted: i=1; AL+hErFhe8wduSajBXx7FBPBU0t2J/o2gWMNUavKKdeJHvZZR5QVDkJcL8fYgMERL9Hs2NyfmrHe+c/F5BJ9G9g=@vger.kernel.org
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr8092092c88.1.1795378139980;
        Sun, 22 Nov 2026 12:08:59 -0800 (PST)
X-Received: by 2002:a05:7022:f106:b0:1b3:afa2:2d7e with SMTP id a92af1059eb24-1b5567dab3cmr8092063c88.1.1795378139246;
        Sun, 22 Nov 2026 12:08:59 -0800 (PST)
Received: from [10.229.42.90] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm22632889c88.1.2026.11.22.12.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:08:58 -0800 (PST)
Message-ID: <68def4e1-3429-45eb-b025-dd0fa10cb58c@broadcom.com>
Date: Sun, 22 Nov 2026 21:08:55 +0100
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
Subject: Re: [PATCH 0/7] wifi: brcmfmac: AWDL for AirDrop on Apple T2 Macs
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <gargaditya08@live.com>, Andre Eikmeyer <dev@deq.rocks>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
References: <20261104151547.70333-1-dev@deq.rocks>
 <c93fa1b2-9d05-4536-9025-6c4d1e6e6b5f@broadcom.com>
 <PN2PPFCAA8F915813E84B62E1B2B919F11BB8712@PN2PPFCAA8F9158.INDPRD01.PROD.OUTLOOK.COM>
 <84585c89-9f57-42ce-8127-6a4b2da205c6@broadcom.com>
Content-Language: en-US
In-Reply-To: <84585c89-9f57-42ce-8127-6a4b2da205c6@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 18/11/2026 11:52, Arend van Spriel wrote:
> On 11/11/2026 15:28, Aditya Garg wrote:
>> Hi Arend
>>
>>> I really have no idea how to deal with this series. AWDL is not part 
>>> of the IEEE 802.11 so I can imagine the kernel wireless subsystem 
>>> does not care to support this. From driver perspective I am not keen 
>>> on supporting this upstream either. My limited understanding of AWDL 
>>> was that it was Apple's variant of TDLS (802.11z).
>>>
>>> So what does AWDL provide to user-space and could the same be 
>>> accomplished by TDLS? From the explanation above it seems AWDL 
>>> provides more knobs to user-space, but not sure whether the awdl%d 
>>> interface is merely a control interface or actually passing data 
>>> through it (patch 5 implies it does). If my memory does not fail me 
>>> then adding vendor commands is generally pushed back.
>>>
>>> Regards,
>>> Arend
>>
>> There has been a lot of Apple specific code in the kernel, be it HID, 
>> DRM, EFI etc. So why not a small bit of code in brcmfmac. We have 
>> never faced complaints from those maintainers in getting code 
>> upstreamed which is different from the standards, but is needed for 
>> the hardware to work. While the concern of unable the understand the 
>> code is valid, I believe the author can be questioned to clear doubts 
>> before upstreaming. Getting code rejected just because of inability to 
>> maintain is heartbreaking when people work hard to make something 
>> good. Also the patches are just for Apple Macs, and not for supporting 
>> AirDrop on random hardware, so it shouldn't be that difficult to 
>> maintain.
> 
> You are reading stuff between the lines that are not there. My concern 
> was mostly related to the new vendor commands. The vendor commands are 
> out of favor as it was used to avoid defining an generic nl80211 command 
> and thus avoid true collaboration in building a device independent 
> wireless subsystem. In brcmfmac we currently have one vendor command 
> which allows user-space to interact directly with firmware for debugging 
> purposes.
> 
> Also AWDL support is not about making the hardware work. It is a 
> software feature providing the transport layer for AirDrop (and 
> apparently t2-drop). I would say the same experience could be provided 
> with another transport layer, eg. by using NAN or P2P. I get that 
> downstream users are happy with the AirDrop-like experience, but that 
> does not make it a must-have in upstream linux.
This has taken a bit longer to decide what to do with it. Adding support 
for AWDL for some Apple wireless devices does not feel like the 
collaborative work that makes my heart skip a few beats in excitement. A 
vendor agnostic solution would have it racing.

I had a short discussion with Johannes and in general vendor commands 
are banned. However, for this feature we do not want to push for a 
solution with nl80211 commands. Hence I have review the AWDL series. 
Patch 1 was already rejected because of a similar fix that was already 
applied to wireless-next. So a v2 is needed. The patches 4, 6 and 7 need 
changes. patches 2, 3 and 5 may carry the Acked-by into v2 as they look 
fine to me.

Regards,
Arend
