Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795419232;
	b=uDRkQVXRfXVmFWq/rkUVW58gnz4wcag6McgSFhhPV4KIKVk+/6EVIOkZQF+UIHL2o/rB
	 fRbXvZCzF6rHUw1I3CTCzjV9xwYxJhmwKKtxPLLVgMxMkHb9AZqAMJDg0vJL59uwUAf3L
	 nmoGqAUHcTtvsBbqDQOt1Pmh+r+MQisuSzkfPnPsTcwM2imS+R426Nz7EZ9nYakmqtwR7
	 XrrdQFQIzhD0f0V7uKeZrWHMj3BHVsWuMcVnxTd6kG9YyJ3QH0fxnioTJq65URJ7upa+/
	 9mHUU08nY6tEfqZ7cBrVVj8VZNmsneh/R20bOeoeIb0MNcy8RANovdcRqVQTkLQDUAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795419232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=vCLV3XBRX2wh16raJXcCmA/lhiX2jHGFoT2tZZcD4OY=;
	b=3p+TKLkuOvctXNhBYq0bJmXkvo1WT5pRDJOq5kFT5Y+kyLn7csn9mTr2oRJ5MdHyi8ja
	 F8EyTrFR/3THpLkwLhvvFjXh1GI/GDZCeshOZ/bWiT8knzTPdnXEi2bYIdzdQ0NI+SaaB
	 ZkmXV6VfPULlqREWijefvxwlU+aSFNMl/KsRTSeqBKdIhqCgoBWB/xemJ/dDRc/1QmirR
	 w7cRCR0HOyyQKSBX3OpG+TOROQ8wS+mSUVRcqLbyVVmUO3zwDfL7se7Z1o0u5FhD/3FQx
	 x5Tgjgw/dbETWiL4G1ltWs2PEPx3vE6WQKx9iuddZSr/f6wXmQIJEXJM1HqvCemA2yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCXfCOp8;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DBF606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 07:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DBF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VCXfCOp8
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so27909455e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 23:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795419230; x=1796024030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vCLV3XBRX2wh16raJXcCmA/lhiX2jHGFoT2tZZcD4OY=;
        b=VCXfCOp8x1ww4uHujrC7pVcFsWm9ll5+3jP0cPhMcx6ttmvaIKksQfsbujU7V5fNfm
         ctHYjnBcBBTT4iIkk6KdbHo5/r+xK4lb54V8TIjrNLqzU9wbBIOxfykFhyr/S20GxGm3
         vw6ND98u4X/U5HRukUPAhHEJhhk9aFDp9aR1TPXRPj/dyuRCe+epO1zbsxgxD23UmWQw
         VXLT/C+Zj5jQtXbZBwee4Rm+x1xJyhFWc3amKhZ7MsIK3o2vwF09ev/Qn41aHXSigxAz
         5swfuCPMclJacJoet/DPjgEimcCUX+Xhri5N3Y49v5FjeDbm0UnBYUI8f+6xV33PhQRt
         SMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795419230; x=1796024030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vCLV3XBRX2wh16raJXcCmA/lhiX2jHGFoT2tZZcD4OY=;
        b=0o8EmaNuH5eQT1UtVoxC7HVlWFrR4KBh5iKgVZ5QwpFpSP+5THJHneJ0PMyBuCF6h5
         23KIpu5Nnb6Lj8qGEb5D7mIfhtv/gQQrVdNtwuAF5zAePRzOHGKEs+vxDtBcAn2rEd3K
         qS0/UuWiYIIHfihZc1Icqvs59Q2vz8bZ/vTneokpbzO5AVWs9WksxyNnuRXpCe95kfh4
         COAFQpGxtjnQrEao955R7Rvby+3h7K9SkYroNvQX2gsZRy8RE6pvXo1gLFh050dkS26w
         PwsMuydWuVOliiP566ayhZ+u7JJcBPoZEvqbF8ok21Qs0yBf9T+O7laeJrBRkGAOFyOk
         uvjA==
X-Forwarded-Encrypted: i=1; AL+hErFb6Y2bfqxA33W8yOVjHiC04z2KHYYNbWXnI3VBwDLDSK6UnT7J7vJo/0CWjyI0u+36YfTtVv/X17dmNrs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LXrw8hpHf01TDhVzEF+uV9wH15jqRXN3fsufNEVuGI6wGn5oU
	7Bot/eHSY54T/JlMSQcGZSo9ApWp+iDTE5LI/RJ9AoDCNlKXHyw2qfvw
X-Gm-Gg: AZFdTZcrJe9m8e70IhgSHcv3n/ePfFhOEEHnJYGnnbS9QNnAsZTjOB+tLuRHJBMtgju
	i7BROh5RGyHCjtFmqqi8nqhGRnk4SEtiP2EYaL0QvHfA+wTpb7LI4ihtv495kumHr5AQJjCTDin
	M7OuudS1exrxa+HGZj3efcFKVaU/4JgSNFAAH8lBPk90V0vu2HTSno+zr3qbhOGC/IGJonU09Cc
	FeY48Rmi79xqV+sg85FKWqo9ce5qFGw6x+x0Mf8T9bnl7zkbNunbU2qTIbFGpfKgs45rMCQXPM2
	7dzIBy+xg+mmuRKzoHAxSf2n20l5GTbFOF7WDCgkgIyEQVnRF9/PoLoYeV0IiQ1mt2oVJ1RfZiN
	BXXehhjTYgmPMM9n58nfectxYK+NjW0IJE6KEWwuMX6cQoZZNHzqIH4KiVkeQHqEhhabf23uIHp
	vAmPI/UbS5x0KmBQ9laLUwCm+Djqgj6h48CtDuAC31XxIWH7oZmLsC9KOcXwnaNKtezLRAQTY30
	zK/ppIh9UhIuQVff3bICmJoXciOwMranzG9HhKEnTOXdoi2i49f61DQtoSXJBls050NsXk1BsOI
	FWUhm96Sb5jqtt7SIUYqSNR0aMu86P9GtrxfZxHuoZ8PAcGnKpADP+Mteud0G49RAzM6PZ7go4L
	PhwytHoELPGbDun9ra+CLU4Hjb39EBtv/+8btSDczABnWMgwlTcxr2ngPB0upAceoB24=
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr259331755e9.12.1795419229774;
        Sun, 22 Nov 2026 23:33:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm311285775e9.10.2026.11.22.23.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 23:33:48 -0800 (PST)
Date: Mon, 23 Nov 2026 10:33:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Use str_has_prefix instead of strncmp()
Message-ID: <awPsWXOo2MxJcX-g@stanley.mountain>
References: <20261121133843.127718-1-vaibhav.chahar26@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121133843.127718-1-vaibhav.chahar26@gmail.com>

On Sat, Nov 21, 2026 at 07:08:43PM +0530, Vaibhav Chahar wrote:
> Using str_has_prefix() is cleaner and more readable than using
> strncmp() with strlen(). Also avoiding the possibility of errors due to
> mismatched string lengths.
> 
> Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
> ---

Ah.  The str_has_prefix() has been there for 8 years and I'm only
learning about it now.  I like it!  Much more intentional than
strncmp().

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter


