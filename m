Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706989;
	b=IbgEDjQ0sfo1d531ylREMgIHGQOQxuKSN/y8avzKdXh11+moFNRSO+SpkWgeBs6+wjUF
	 EEmhcAtS8a22pzcRS2wJYThv1p/vQjvzpF8qmWb7lnSVm35/dd+4uMqJpRXSHAvOo+2rr
	 Kh2O9ogL/zCl/ajEtWJVLIUhBZyOxZipfX0N6eMOxJ+pQY2IOAQZly+Pwj/Q0QgZ5pytM
	 NYlwJQNere1uKKG+Bjcap9WvG4EbasmLH/WB47XIdSlSBjn6jfP8pPm7CsXScXXSNgBit
	 /kEgaXNFZFP/T9sDxK13gEMnl+9RkjgFhSfOUANlXOllUi1TJtXxE/e4yhxy+JvXwmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3Z7nPEaoyhJ41r3bk+azLIXCJVO4Tkbh+/BIA8Q8SWo=;
	b=G90pgArIdm41BmUROZhDNKot5QutBhLMtPA2QmZ/4qiSaN+14o6INawbbjRw/6v8XDLR
	 WoNBKW7GGVUdflXkqBmNLw+gS/KpFpRsJ3i99mOQXdFmjkcmcgOFGhYula2qZz5DhEvBJ
	 VRQIQ5XSWaspJFb6eut5GWgfUHVmPtTQ5tGTTxkHSbIE5RDg+2u3i1kCoKJECW6ztH0vL
	 FGbRD7IpwSLIrJiS3O4V0MwnWJzExWek6Z+3wEeVDn4GwLmfFzip6nADNZq8WKi/UDWE9
	 uUGUKdzAgf7QnniK0waTF9AoVADnerwEeW/P9QIdjLAPlOh2bBFbrVAkuJ0bzIOb+4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=GjMdjqQ2;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A439606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 15:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A439606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.dk header.i=@kernel.dk header.a=rsa-sha256 header.s=google header.b=GjMdjqQ2
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8d1aec63541so263737b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel.dk; s=google; t=1795706988; x=1796311788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Z7nPEaoyhJ41r3bk+azLIXCJVO4Tkbh+/BIA8Q8SWo=;
        b=GjMdjqQ2XrzHynrZkiyhonkCN8ImWYx7PiVDtrnvlMytNmMKcItTmoYy1yvs/VA0Jl
         GFnghbePsp/ef/ngLSGU+sQbm5hEn3sDd3mzDRlwc5LcKseyYcB3BW6e6c6iHBSdd035
         olFy8QGW/0j2acreNbQV7pWYc/rG20jU93MejM2AOpJ40k9vXqye01MLIDXMJUzM1thK
         47ErhQkoTzsZv6h0WAMeCigHqaTiQnV/JiVWKUPWFbV6RtgJvAe3YXpvYYjIU0gResRq
         cyTTOVXAIa6Zgg5TWvh6Esin+9Qc5WygvuRczrtFPhd3y0vb0uHhaqYtZakLA6grvD+E
         qm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706988; x=1796311788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Z7nPEaoyhJ41r3bk+azLIXCJVO4Tkbh+/BIA8Q8SWo=;
        b=bizSEJ7d3Sy9n8lw+kqtK1gfIuA/usZLlG7iVE+TFfYfINY34JjX9nL9EimpNT48fT
         PoIemFYqwQBaC5LCY9CDjj5LR+CeEij8r0epOOAt1aEacESE6ZDg58I8/vg02Y0yEM+w
         tathz0Mj8ImZLWrBxVLmSTi5Pt9za/E0Jyp6yczQkSEbAQEeMKVXU0QKh97ckjbkod+z
         qTEFKdcthimM/VAi2b5+WK6yY0O0Ea3YC9mI7hT4vz36qKpKYsI2RFuG3kMBqHxXAph9
         Hyobr7BcT+DVUJhro4DrvNnRgYMJsZduru1ZQtbo7wi+1bQlUqdYoMMCrTBbK+rGBOGN
         0CfA==
X-Forwarded-Encrypted: i=1; AL+hErFY14hyZcY5eSynudh3BhPAXsaIJZggKNa9MGkDG7TobHeeHmOawjt/crNcx2pOkCUxifVYDeJvyL2uX34=@vger.kernel.org
X-Gm-Message-State: APuU4Z+GsJZCw1DbStEJiWMsNKa45YEHr1p+6UuPnIf+N9Hy3mBYaMST
	itr2uS9Ke8y6smf8kbk4So0yaEj67mP/sLPqEBbmIEGjCVv+/YO6EC0LhXhjqUbZArM=
X-Gm-Gg: AZFdTZeoubISX5LzAylzU+2VqA29NRut3xgcUDzQmiMIbHgEMON+VZAVsUBmgrAACQm
	oyjU/SE8K6o5ltEqK+0TBo4J27wdL6TM68sCqj9vUBn4DEaG4KkDnurJ80b1a+yB+xISWxxcwOu
	MozvpiXhP44kdbz75uHm0iM75RlvYNvPinFcLa9TwbvLNVtdSel1tJmqLPHe05oPA5S1GnS3tEU
	wD4DB7n0k1nNDOjFxek8nvPmlrL4UzncBAvGYk3iub4AsRtLqfInAnzy+1sh4rI6YW5FtT6lLAV
	56sYixFmlaciHjfk5iVm2sk9nQT99ze82I9kBzhFiu6zfCbr2f+5snnFIgtZz4ClcPF9WyH0aWS
	gNTpbgpz2FlghcLu1yC1ZRDXWiBTIyewhHt4fVguejy9h7yIPwErY2ZfqIV74pwwE0futF4+ZZs
	zkjxlFvvLuGdBU8nb0SaeaZEv+3EsOrzWnaHFYv54EwbYfuOsDxh7zTi+t/zHY5ivBOpf1OteGQ
	bq6cxiJRJs06AUv1d/mkS6xY7jv8kJDXJVIaxpEC5mXqhJLw2Fyqgh3BTWR/T2MR+PwnHr2Q3Zx
	qgOjeDugOXFihYFAMAAJQqxGS6YQ1IwXUvHi2ZkZamaJ03Fxd0Vs6i/UO0+8u/R9kq2SyH+BPqK
	6bCZTN0KYWhlOXAK5HEsCIiuW89GKEC1pSTdlY5bkjAvwpBafh3xFjmt2ycDRhLIVbrpzjY8=
X-Received: by 2002:a05:6a00:170d:b0:885:e2eb:23b6 with SMTP id d2e1a72fcca58-8c87b9cfab5mr20410631b3a.11.1795706987829;
        Thu, 26 Nov 2026 07:29:47 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285ccf4sm10534872b3a.12.2026.11.26.07.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:29:47 -0800 (PST)
Message-ID: <970946a8-855e-4d65-97d9-71c7cb2ceb20@kernel.dk>
Date: Thu, 26 Nov 2026 08:29:46 -0700
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
Subject: Re: [v4 0/3] block: delay support for error injection
To: Christoph Hellwig <hch@lst.de>
Cc: Haris Iqbal <haris.iqbal@linux.dev>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20261111215838.103356-1-haris.iqbal@linux.dev>
 <179501806989.17649.3138860274842922761.b4-ty@b4>
 <20261120164416.GA32719@lst.de>
 <edb8249a-7bc3-430e-bbb7-243e1881a0b8@linux.dev>
 <1cf30693-44c6-4761-9900-e36259082e4e@kernel.dk>
 <20261126083421.GA7403@lst.de>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261126083421.GA7403@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/26/26 1:34 AM, Christoph Hellwig wrote:
> On Wed, Nov 25, 2026 at 06:49:59PM -0700, Jens Axboe wrote:
>>> I can resend with the fix, or send just the fix to be patched above
>>> this, since these are already picked. Let me know whats preferable.
>>
>> Send a fix please, that should always be the default as otherwise
>> I have to rebase the tree.
> 
> Unless it is at the end of the branch.  And looking at your tree, it
> seems like you have queued this up at the end, but in the 7.4 branch.
> Which I hadn't noticed before, and which seems wrong.  Not only is
> this a brand new feature and we're at -rc4, it also makes it really
> hard to get the tree in sync for other features pending for 7.5.
> (which we plan to send after this lands).

Gah, yes that is certainly a mistake, in my mind I had it staged for 7.5
of course. But looks like that ship sailed, as it's now in Linus's tree
as well as part of updates from last week. How broken is this right now,
in terms of what fix(es) we need? We can always just disable it. For
7.5, we can just pull in the block-7.4 branch and resolve the conflicts
that way, fairly straight forward and usual approach.

-- 
Jens Axboe
