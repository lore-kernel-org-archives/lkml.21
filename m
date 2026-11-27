Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743011;
	b=qMNTky+Gs880dBQuIIppE14iVhBtBzOGdBu1IfQZrxcdIOjyTg4Xi8f+FgaeY7EFoKeh
	 Kf8t7PIH9Q3rxxMuIh2HWago5RqkzJYfLO3gZVEtzggeriZwjbKL9Eu5X4upu8V6VlWdY
	 IZo9nhB3FRbXOu+VqVxPE4+8L8s3oYiAL3XCETCmWg1MG9pd7onzSl7Heqgd8Ci5iFqVh
	 /LV7rNx7heVPF6X/vKc4sfnct+O4Eu+EAGLYgCVWc9lLgcD4icbo/YBO3tID7KyOhalp1
	 4+1sDJpQWkdjcdHqLvRMcVKqcqi6mELwNSKHFYbhGG6CZQsvCsRDgRKZtVFCJJHivIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3WmyiL6hLBXLpshzprl47BB5b7vCbWHukhD29ygZnKE=;
	b=Bz7uXkNzc4GQ4ls2Y7beGKvgfZPTr+tMw3F9HE3LkcXyRIFdSkhvdoBS5tOQj0yRpXIC
	 KvmEBUkETt4TebhY6E58K2rvvzppr+2wSOkPhAvzQ6TDKXOSL68v/4kae0DcQzscTnnYi
	 VnOtsTfzHrrF/otQOzSUxDJAWAWcbIKQbLjSOD70uyc9fGhMNJOIdappuvg2YJgPKR8fu
	 64vboCm7A5c7oRA0lPQLJK/jUKf15cHLpyJ8JjO/N36d6oERbeQJgZogVdXTHnHUWwfDQ
	 y6c5DvyDlpEl68qi0aE6WU1MzmL98zcB1wzxjpcnfvMbEXKsY57pnTruqs6shsYRO8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptv9sqiL;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6A606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96E6A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptv9sqiL
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8a9f9473029so5684454b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795743011; x=1796347811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WmyiL6hLBXLpshzprl47BB5b7vCbWHukhD29ygZnKE=;
        b=ptv9sqiLLNcVkw/ReeBviRCpnEzRQxZOXIhyLn46idjO1fLUYz9B8gTC484jHpNXn4
         0Ns42z33/amcYM4LvbjTB6AroaNQbRv7GvYJ9kaaNNkGXBuiJCdNh39uxetVqiX1I/Gy
         mFjw3K2hEpTzsgRVSajwJ/7Ouo/rxO6lUGyS8Jv8gwiXBb0aTTLhCs73nHczssepesWo
         s4qxhf2usNhUBAARB+LXMIonbwEO6ZSdKoyrqnFnGPaZGjyAhGkq/usa39honVuhG1hG
         sp1WgwRgLmBGChSI3nNbgWJBh3bOCIdfw6krYpo8ndJb3VEdnCv5/aEQ6FBMJHySrQQC
         IttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795743011; x=1796347811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WmyiL6hLBXLpshzprl47BB5b7vCbWHukhD29ygZnKE=;
        b=tDZzPg9uOCmLaHuNRRvfP+HQ8JWB6WB1hKaDKOxIUF8sFZJD11K0aEeEuUGSPOZtKi
         sC/xfJzMFoVNSLNa9mFrSzIzEcQGB3m3wkSzO4WLc8TBwgU6EyT4n9oROJO7RRSXm79L
         l2LzWTvwrX+O3cKK8FKn9W6WnbF7JpqBw9RDN4EtcM7JfBMvQHKSGdfte1LfMINCQ0P9
         ttVL/PhTAAC71eaGUvu7FErheRhHOL1hGZXZrKWNZndiZocBTeOHwgj7IBxCv3YePfgP
         ghyQWATyuTD+78xEVsHt1x9cBM9fuyvRl4IN/INsfgd7m9EAHBqm4GBM+j06zBpxbYii
         9hJg==
X-Forwarded-Encrypted: i=1; AL+hErEtXcoskYTMC36fslDw6xQKopgJFH4hlImK+qTzXPrCcoSsQNtU+6JeH2ve2kNGmx3+mObZge8NtfxdkgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XtMhibsOXSJg6BUTAue1+QQW+QlsOU7s9ybKkC/DF2Zh8XKVs
	PqhbYtsbZ7OqYSNkUCzQUhlEORPLobTUy+DwvAmeWifFUfrUMGOHAbc3
X-Gm-Gg: AZFdTZd4RREgjrxMv7wC3SgAyNpjh4U0hXaObJ4tTcWzHQ+ipfe/05aLzAF7yURjaew
	RffdoYB/XPxVxubPpMDD9+PLqUmSYcecTQ5uKXjXz72Bah0/NXFyGpNCbXlwQfqg0AF8fxtP4EF
	uiAN1kow5HxYIbU9WP0GgTiszNPof3jXVkSnhwhPz3QeVHFdCrx2HF3esS0P6QOZ/jASuO3ptPE
	xMBsemTKeWFgMI0mXsYlHJd/E0ZrSVDODXKWUhpu/e1YAgpOU+7nqly5eLII/jI+uqnDNd4AN2H
	/DxDv4Z/rPer0QBv+e6hF8rGfZk2iGuo8c4XEbY0BqvgbVG9LAGE57e4bXYTtjuYYMI2MCnu3FX
	46ZThwidYm/DaScABqryLPiaFBIGJSh036W2d7oBCj6w0+LhctI3HVzXwmDDsyU1LJfAARbKiqO
	OAmb/f7jrlYAIYYsqZQKSc2XnpKc66K4U2O4ok1rnswiKQ/Jy6wlUkRUDzK1HTtRCdj7umt4XtN
	PSGjqC8jOHVqq/2oF/yPCrZpJcH/7sS8+p79XfAgybTxKEvSEXKFMhO17MppT1BSE/rrYe/mb9P
	u8kwLZRsc16tPwa3ykp1b1XAkvnIPY+cjk9ij0x6Z9ti4/tgbpwkYSm2N+7G61C85ICqpLtjt0K
	a8rzImNswaQLn
X-Received: by 2002:a05:6a00:14cd:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8c87c388506mr19125098b3a.26.1795743010878;
        Thu, 26 Nov 2026 17:30:10 -0800 (PST)
Received: from [192.168.0.100] (122-117-151-175.hinet-ip.hinet.net. [122.117.151.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm11587417b3a.27.2026.11.26.17.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 17:30:10 -0800 (PST)
Message-ID: <cbcc32a8-0f69-4db3-aa3a-ef62aabed05d@gmail.com>
Date: Fri, 27 Nov 2026 09:30:09 +0800
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
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
To: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
 <20261123122343.6d3f8866.michal.pecio@gmail.com>
 <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
 <20261125120545.76f07ed8.michal.pecio@gmail.com>
 <c5649772-9fb3-4644-a08b-bb165f0173ef@rowland.harvard.edu>
Content-Language: en-US
From: Kuangyi Chiang <ki.chiang65@gmail.com>
In-Reply-To: <c5649772-9fb3-4644-a08b-bb165f0173ef@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal and Alan,

Alan Stern 於 2026/11/25 下午 10:29 寫道:
> On Wed, Nov 25, 2026 at 12:05:45PM +0100, Michal Pecio wrote:
>> On Wed, 25 Nov 2026 09:33:38 +0800, Kuangyi Chiang wrote:
>> [...]
>>
>> But now, if I disable root hub autosuspend (echo on > power/control),
>> connect two devices which use autosuspend and remote wake one device,
>> the RH wakes both ports and only generates one Port Status Change. It
>> seems nobody expects the other port to be affected so it stays stuck
>> in the Resume state (SW is responsible for transition to U0).
>>
>> I don't see similar behavior in other xHCI root hubs, nor in a few
>> external hubs. Anyone knows if this violates the USB2 spec?
> Yes, it does.
Thanks Michal for reproducing the issue, and Alan for confirming that
this behavior violates the USB2 spec.

I'll verify the repro steps again on both EJ168 and EJ188 with root hub
autosuspend disabled and update the commit message in the next version.

Regards,
Kuangyi
