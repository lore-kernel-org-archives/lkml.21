Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777499;
	b=EfBqYTZDd985L17ENAk+4vkDSzCfHxXVbYDyiDOs5ZeVqZVkmbTIJNCQo2+Ew9g7wIMo
	 mY6acTaCKAwIJJmAmReF80qP/qbEW3u3ELXdUpeC8KCYb4cfilMcIJ1ASoSE+rXkI5pt0
	 LzUBQGVkdiRTsvqFcqx6pwgKtehloDYyJDPdjqmFSXwA/r26yfwCILpAs21Elh3x4xmjN
	 OxUoMolVBPtdmmsPy1jjL/6Gq/hlPD4Mc0FTi0My57vWqhLbCajuf7I5cKKyoO2igaFoY
	 iPRcyaViFBAdkCL06pkM+cPoec2K3ByZAAsgHQnSK51zu7CiypfWO+T3R+rkFThhHHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777499;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ER8jZocxPLPmILHQgyoN9JTV0B3dXhV6CyXeBPGIICQ=;
	b=dNXuEhoK1atXPvF393EN6ONmkTZ6kTb9BIFm6ZlsdZ19CPwvR6nTpGBFu6+0YWYTNKsa
	 iHdnLikakqtkbXsmpN12IIaTGMcsDjJ4490v73XLGb4fRPt/cjDlcnDBVx/7f0rqgT3DZ
	 zKGMfVGhnsuFHK4JNuwWYSyM9i/Z/mGyo/jFCP1NnBRd1WMN1HTY8E8YDWFqIwezIALuw
	 97biVvDjbtDzv+akzRrXbCCKa46NiEmk9KxkWWaAagumK/U5egw9kJjJN9FawwoJSKFxa
	 ULg5lILK/QwhGJMDchFdLg/EW0AFtj4379TDqsxI/BF1RjYXjXDYCozkQOKCedaJ36Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=w1wiWbX3;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46A6606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A46A6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=w1wiWbX3
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 52ECF1A17B9;
	Fri, 27 Nov 2026 11:04:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 285C46049C;
	Fri, 27 Nov 2026 11:04:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D76CF11E69318;
	Fri, 27 Nov 2026 12:04:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795777496; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ER8jZocxPLPmILHQgyoN9JTV0B3dXhV6CyXeBPGIICQ=;
	b=w1wiWbX32tVw8kVzORE+NyhFnc9+sPl6VK1ZAnUJAAVJsuHcZthfxIjEhb3bmLTh7FDam7
	RKcH5N/wVN1JAYOLPPohourLcH4EfACdnOG7OOMnup35NtnCxME9ijH4UXATFCZw5izwXD
	kLmzg6TpvIEHE1UgsPQIHhEEgPnEpPb88MIYWDkAJBbSIHrW6+yZwIEpUO6SRl/irvOUu1
	K/7KqrW5/2MY1ZCimY77RBPExVh1crhKIKTr58OGqMByHz/fP3WXwzSTzzOlRQ+luESnbL
	sg5i/qp3WWL6pM2NynT0bW16jBs8cNjuONX3QlzVDJnfmlTHi/3iLtWEOrHhvg==
Message-ID: <67f6aa99-c625-437a-bae8-ea7a1637afe1@bootlin.com>
Date: Fri, 27 Nov 2026 12:04:53 +0100
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
Subject: Re: [PATCH] i2c: cgbc: Fetch the status of a write transfer
To: "Haberlander, Markus" <Markus.Haberlander@rosenberger.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Lee Jones <lee@kernel.org>, "mfd@lists.linux.dev" <mfd@lists.linux.dev>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20261123-cgbc-i2c-write-status-v1-1-5b0fa0322b57@rosenberger.com>
 <179568834099.302193.16315749597111506309.b4-review@b4>
 <awgwO98qx3zX4MaY@zenone.zhora.eu>
 <b0d32861-c123-4f4f-8bac-aa0e7e48c719@bootlin.com>
 <FR4P281MB4840894892BD79C05D844CEC84412@FR4P281MB4840.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <FR4P281MB4840894892BD79C05D844CEC84412@FR4P281MB4840.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/27/26 10:20 AM, Haberlander, Markus wrote:
> Hi Thomas, Andi,
> 
> On 11/26/26 9:18 PM, Thomas Richard wrote:
>> If I'm not mistaken, USEC_PER_SEC is only used if master_xfer returns
>> -EGAIN (arbitration loss), else __i2c_transfer() directly returns so no
>> 1s timeout. And we never return -EAGAIN.
>>
>> So why should we wait 1s?
> 
> Thanks for looking into this! I think Andi means the one-second loop in
> cgbc_i2c_xfer(). Before my patch, when the controller was still busy
> with a write, the next call returned -EBUSY and that loop simply tried
> again, for up to a second.
> 
> My patch now waits only 2 * read_maxtime_us for a write to finish. That
> is enough for the transfer itself. But if a device stretches the clock,
> the controller might stay busy for longer, and the write would fail
> where it used to succeed. That's why USEC_PER_SEC sounds like the safer
> choice to me. I'm happy with either, though - you know this hardware
> much better than I do.

Ah yes clock stretching, makes sense. So it is also valid for read
operation. So we could drop read_maxtime_us. But it's an other story, I
want my series to be merged, I'll send a patch later.

Markus I'll add your patch in my series, and make the USEC_PER_SEC
modification. Thanks for your contribution.

Best Regards,
Thomas Richard





