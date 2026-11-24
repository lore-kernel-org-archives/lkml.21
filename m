Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527788;
	b=CnjKqVFyAJ+6QOSQrxQYXalAlvUTa/LejLjcB/EOKR0dGmvVu/Vp43kPldIr7D3ldSVW
	 A/tspSVmhgRntiT5iqoRed7UKFe5EZfbHP/htOJdaHoWJ4+3/PspERiGHupBnMo0n831P
	 oDEeTwqriiUgdMp3XABo0rIkROwHBMrKqPFfEgnFWCZlNS81eLQ9dHIleWhg1O7OzHstx
	 vAqiUSH+8DD+cgCpIu0AMx/oSrQooqrFFWDQYFDEMyIS3pRYSbWRy9ALF8e2RcbDA5gUZ
	 sX1w/7GOCtUXrQboQ9AJ6kF4NSpNoXgcAIJosuWJ5phoWBBrc0Y52R33P03cXxmjmug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=brzZArmNiLtGojpfrPzTD6W6ojCzehjU0YLNHRgcuT0=;
	b=YyvSYe8mcQTe4z+LeUsEaFkv3njq6OJMLaIsI0475TvRlYoFUgy/Mhi/jX+DsFVOQQND
	 8Jyzp9+Q4g/RAX5TPzq6+uhwtCxw3jYGacw1vTWJILp8nreOSRvxUpq0yDDjcw1zqIVKU
	 VNfG9kQnvPNhYrgFHuI6SX7EHWSPgSAKkoF1bPqVgmy4Xv6aW1pMQGzLrFluuW7rx9NQ7
	 d/L9eDLhkl42bUOHxio293SgAYKUhGrg+zIU8c6JUSyZST4Avg13vC5xwDBkewWJhw6de
	 alTDrDorvpvGqzBPec7CaErMf0VeL/7c0ltl8QncubVb5WCfmBEMECfxA6kI/7+nbAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LIMq/QQ4";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C289F606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C289F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIMq/QQ4
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38190551625so9176578eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527787; x=1796132587; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=brzZArmNiLtGojpfrPzTD6W6ojCzehjU0YLNHRgcuT0=;
        b=LIMq/QQ4IIOm/eSfjVYX9OYrBv+JICUXfm7eoJEziTS8SSvQ1VCdNwGawxg5azfH2P
         zWRj6sNn8svVifemctHXIXbLh6osXMxMaslwGCz41WlgX+85W7qL7VRytLPfQCdAigPc
         uFQCeJRsUmXkPuusCP9lXk/4eCUsXD2M9dEnlwDnbbL3nxayAbGPg7B0gf0W3KYZhkj2
         eR6VRDU7TGfuIy0UOJjTZIG/0EeH35KgrG7/Mb//cNUiRvKd/uxlnUWZDT5WlVVuHNcb
         Mu+1u9F8VM8gw6wmBKpXKX7jK0PBQY63JMQhSktozqFZ5pbgEEqcEgkoARLAiEULvlXp
         R5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527787; x=1796132587;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brzZArmNiLtGojpfrPzTD6W6ojCzehjU0YLNHRgcuT0=;
        b=LpPVLY5g7bRtFEjRG6sN8P5XgM8x7A/FJArIZdPpzfIbiwSkDj15fYDCpBVRmUKp/f
         /ZZNFKRmVzv455n9dATtGI6+6rwjJ+klLfyuH320acH9+wudu4vbJ9IptZ8cFZWi+c2r
         EgqQ0dozG9n0X/5QLGR1oX5Q2mw4QWrw07SPeQgYmrqrjDWlhMWiJivm/WyrPXIIx6KM
         YJTuW/qSY4XdWaHZRTzJXr8xAzClmxVngCEHJyDhSxrWNXr8b4TbNQuwrMvikemLLMq5
         m+ukSmVAwhEOvrpgKlbyzz4cEhnS/3ahavWyVq3e7kFjB+ugysoPbDRg6bjtdF7nJ3p0
         8rlg==
X-Forwarded-Encrypted: i=1; AL+hErE+T5+IETzUa/eo9PagKKTurrJUuUKOITZFBh5+M6u8Bi6Kecp6Pi9TKajzNymxR4CLP764dI4Xe8c2nvw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W4xsmR7ZgQl+yp4hCS3nl3ZbHUYBy7VxCJF8xzpxyiq6zjovD
	KL2WmTUzMrm6ZSJufXT75UPRLvaF0zZJjiMeQETXgu4p4u1nFFm4SREw
X-Gm-Gg: AZFdTZdsdxZ1v+8ShoGgB8PaDN+3o4BK0lZgH6ey2UBGOwd/5q6Q3YhfCrDHLkoeUKm
	zw1z9c+DpjJsF5mztC97jR4Nz2dMkTaYKqqmOYhqDHZ+UTS37mNK4q4zRU8dOlYmvA3s1EKxe90
	cxreB9CdVqF1WH3dPT3I5jHTdoi2z7+dULJOLIwh5JwQjdNV70iWG04yoCnfKdM/9o7V+pftQNs
	5YPBa3OgR3BhOeI3tMgb9NXPIkRDDHIFkovWxZ/OuSb8qztRqIVtTXE7tmveWqtYat/3Vx+XaqL
	M06DI8zAALSnpM0OnPf5Oan9hS207Nezi77JuMLyCW4qw4NKZ8mocphRMFMLDJLRq1BdZzPJLts
	OEQWIXpuIUUGxn/QUo1zEa0Zix5pl2ttAxeGJonB9f85Wb6CZRmB1G53Olubuz/I9cRdfrFiRxn
	gbh1zQVocO1GX2GbjGY19rpttGay8x5wOfdWVjvDcbQhZWM8cL0lyb4y57p9YoQtzRy6ftC0Tkc
	QqWLR5MWBaP0PyDZamL3BJEGU8hvNB+egyHp158wg4LYICLI34i2WWTAQ3mS10VNeQwIugrF31N
	oJHQz+NudbIow9HP4MuQJIQYS1fZY2yuUU1YZQ==
X-Received: by 2002:a05:7301:241b:b0:386:b526:24d2 with SMTP id 5a478bee46e88-386b52636aemr5818777eec.41.1795527786632;
        Tue, 24 Nov 2026 05:43:06 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:1412:77ad:61f2:79f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56592586eec.4.2026.11.24.05.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:43:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] fs: sync: fix overflow check in sync_file_range()
From: mdshahid03@gmail.com
To: Jan Kara <jack@suse.cz>
Cc: mdshahid03@gmail.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <zwxt7yvljy7znovloyduos7zkkz7eelu7xd6qzkrl6io36bkq7@ecppjcso6uao>
References: <20261119053827.69933-1-mdshahid03@gmail.com>
 <zwxt7yvljy7znovloyduos7zkkz7eelu7xd6qzkrl6io36bkq7@ecppjcso6uao>
Date: Tue, 24 Nov 2026 19:12:48 +0530
Message-Id: <179552776870.188650.15795112817617044806.b4-reply@b4>
X-Mailer: b4 0.16.0

Thanks Jan for review.

It is strange ,i did not found this review mail in my confugured (gmail)
until ,I opened b4.

On 2026-11-19 11:04 +0100, Jan Kara wrote:
> On Thu 19-11-26 11:08:27, mdshahid03@gmail.com wrote:
> > From: Mohammad Shahid <mdshahid03@gmail.com>
> > 
> > Use check_add_overflow() to detect overflow when calculating
> > the end byte of the requested range.
> > 
> > Reject negative offsets and lengths before performing the
> > addition.
> > 
> > Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
> 
> Looks good. Feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>
> 
> 							Honza
> 
> > ---
> >  fs/sync.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/sync.c b/fs/sync.c
> > index 4a84dd837b86..a1ef2b619cfc 100644
> > --- a/fs/sync.c
> > +++ b/fs/sync.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/export.h>
> >  #include <linux/namei.h>
> > +#include <linux/overflow.h>
> >  #include <linux/sched.h>
> >  #include <linux/writeback.h>
> >  #include <linux/syscalls.h>
> > @@ -233,13 +234,10 @@ int sync_file_range(struct file *file, loff_t offset, loff_t nbytes,
> >  	if (flags & ~VALID_FLAGS)
> >  		goto out;
> >  
> > -	endbyte = offset + nbytes;
> > -
> > -	if ((s64)offset < 0)
> > -		goto out;
> > -	if ((s64)endbyte < 0)
> > +	if (offset < 0 || nbytes < 0)
> >  		goto out;
> > -	if (endbyte < offset)
> > +
> > +	if (check_add_overflow(offset, nbytes, &endbyte))
> >  		goto out;
> >  
> >  	if (sizeof(pgoff_t) == 4) {
> > -- 
> > 2.43.0
> > 
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
> 
> 


