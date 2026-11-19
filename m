Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076695;
	b=fVm+VuOrPWXzkGhzp6palINkx8W03A4beJi0TLel7VWmpqi9/SLoeGb6nDn6BHPZ20T8
	 GRPddhOojb06vgcquoHnPC/ydqKqOvnkrQ2Nu3DpbSyhcxfrgOm5XfXLbvX32WB+RreKW
	 dsVhfqu/Xn7ar8Fk3rt5vodmVMiqLRBLZp/FKmJ9C4N9EuR4YBhS3TEo0b8dqlX2IaHoV
	 beh0KHG+4Cl8hiNj53iGtmRqaxFgZO/O0lfzXnIOb11HCcp/FUbbp6n8Njt+YmIq6AdAs
	 P+TdU8devSzcG08VMvilqnxIcj71r2/z2iSfzt0dqb0UI4XIE3PHUPodn/mFtLru1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DI3TttXRNgZd66O1yc9sKDUMyfs6vXn27b+N2Dlv8xE=;
	b=aREk0r/Q/dP5VpCRxSQczbsd6bIZ3VbO8WnM+2eRcG3skSbnpe/2RhCAY2NxN0RoHz0r
	 6npd0calf/3RiF3U+K2aYvFvbuyV7B4K2f5Uz6NT5Sj3Mb3HfXtXTArEncvO3WytBJSZq
	 6E8NwgAdrEbVjuOl6Nd8OzhSOGPnObYxmzk47vyAvFytWExIAqmlNGrnx3HWBicvUUGto
	 Rptp+K76sQsuzgyGxxKPdGDAw3TFYb81euvQYi+aGg/nE+TsZlhT3nq02HnGwlXwPZA/3
	 sBC362rPwR9hTCiNTEbTTffz38XQtnj8DAGMhE/0d91gNFQJcBuXGHZN+42u+swME6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SiWbWZKn;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB34606A339
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BB34606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SiWbWZKn
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so20024185e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 00:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795076693; x=1795681493; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DI3TttXRNgZd66O1yc9sKDUMyfs6vXn27b+N2Dlv8xE=;
        b=SiWbWZKnjA7Ovs6rPdXzbE3OUrZPjwvDAx0EfukuK5ewVvyVaeOblh8NlKLM1oCSUZ
         JwcCghmFTUD06I+d1fznzYL/gR7Dw74sYHaF7TEmhxIJtmY8lqGy6vOZ+ArbFSCZs3aQ
         +bkyAf/ibqQETB7LlauqcwizfTed66cCoBt2YM0EvWQBbMH7rZ2LNEVwYXKAl2NOhedg
         Uny84avTAI96pmlsPKvMrOCvd3fncfDofKl6G+nTIxx5NXE4jwjfPt9Mo4L2FnEeNAHm
         61BN1ofFzXhygNAuaPzyxjwARN3tyS6WLfzvMz51EVsKtQDFIMGJIX8AtYmMDSBWEnb9
         IkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076693; x=1795681493;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DI3TttXRNgZd66O1yc9sKDUMyfs6vXn27b+N2Dlv8xE=;
        b=iSDv+sN7IpStbhde/MY8aBNdZibTl34SE/smJNqSnkyEeHROpkf8mdiCBg8fJdqGO+
         3pa8YBI/SPKWmKC9ueZwoQIgmCKiHJU5P2YfIv8W+1vMNDVd4PGNJQoOmFNHeKMao8m/
         dHew0ESt8Zm+qdb+TNDVpZLZu8nm5scDJwF5mRy4e1wTMYk9DBYjps/fvx5xRXhWHGtp
         QStzgVPNLLarh+V8grfj7R0Wdo1rCg2QS8jHRnYiizf8Q2R0rNSNvJHb8nX63w0zyB31
         f1jz/f7HdRiymhRPd5uahT0jiZ6j8pmBEe5SNApP4AkHmq9ngDnSOLCt8xL1oILApSOl
         HTTw==
X-Forwarded-Encrypted: i=1; AL+hErEgT6QCFuIevEpC+pALuL3v44xIGs2Y5jVv2U0Av7JnWcfAKSHHFBIIvaNFVgABVFLzqv8h5/GJiQuiFHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/sD3pi6QAZHgjYuyko4Srn6L21jTUkzEmuVxKLhzxcfSNNJyxm
	rrzhOvwVKf7xs7SpOTh1LliYT/WcjoXWoE7kFE72nfnouESozVePRdYTmayfZ7s8RAs=
X-Gm-Gg: AYBFou0IrtlwPOjJjxM3VjY0n4uT9/PF1x59ujWZJP0OySU0+xb23dCJvCOn8LZmbgJ
	MyGdEGdpSY65c3c0/AiXSt6tNHTbi3UPatmTsaeudABFoMI6vG0fVtMq0ou7Pdi+xgsol0BqPjQ
	1d2lJx1DLKcRpTlaKi9qh3XcvVkqFHPOiBTZvAKGZcWwD3YVeBm0FpSpt+fPgAhNObE4qf4fw3o
	rWr4M3SizNs3v142Xi079o7ghOGcX/Ee0AlTool4OVqMy+64jZvjnZkljLjGoxYJIdmZiPsQ6jy
	EHMIELxcudvNJk5MpdhbhyIRtriZoraqBVVZIatECCwgt/8xbPfRrwWYzx5/NXNL4K4d01TA8JX
	Xrc6orScRm6Ad5NsVkjULVRtPwX/p1HLYv7cEBO5W58xT8zR9fAfEwUY+vwekTlpCEEEZfD0K9M
	ZIS7QAz4zkp21Hv0CBrCRVN20rAW71kJVtq7aDRh691uD2inNJGi1llulSaiPCmncAtLS3nNSpA
	gQFNuJ9UwVFOWYpArtNiNObgtQf1HGMOfjKzG/IDXZJkXS77K51ViUukHbcxNSjtUgAdagcMWDG
	pxixcra9rtGytYTB/dmQvx4bu1S+Ucu4H1MjeV42e33Asu3SeqKiuc/Gvf52E30M0Dpyb2JUQjd
	HkHVabuY9F3DZjBHXWv4vew==
X-Received: by 2002:a05:600c:3541:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb7da23d3bmr103851875e9.17.1795076692821;
        Thu, 19 Nov 2026 00:24:52 -0800 (PST)
Received: from [172.28.20.244] (ppp-88-217-21-207.dynamic.mnet-online.de. [88.217.21.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm18620975e9.5.2026.11.19.00.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:24:52 -0800 (PST)
Message-ID: <92980914-a5f3-43fb-8bf3-714674f1b1fb@suse.com>
Date: Thu, 19 Nov 2026 09:24:51 +0100
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
Subject: Re: [PATCH] USB: cdc-acm: refuse writes after disconnect
To: "William A. Kennington III" <william@wkennington.com>,
 Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Havard Skinnemoen <hskinnemoen@google.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118145636.3534234-1-william@wkennington.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261118145636.3534234-1-william@wkennington.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.11.26 15:56, William A. Kennington III wrote:

> Pin acm->data alongside acm->control until acm_port_destruct() so the
> unlocked dev_vdbg() in acm_tty_write() stays valid across disconnect,
> check acm->disconnected at the start of the write_lock critical section,
> report zero room in acm_tty_write_room() once disconnected, and set
> acm->disconnected under write_lock in acm_disconnect() so any concurrent
> writer finishes before the URBs are poisoned and the buffers are freed.
Hi,

thank you for the patch. It raises a question, though.
It is not clear to me when you use READ_ONCE/WRITE_ONCE
and when you touch the disconnected flag directly.

	Regards
		Oliver

