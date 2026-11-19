Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795131621;
	b=uCpXHpZpbXM01KHKRkZCj7EUYWAlpIOfCpEN3ZMOefmta/O1QflFYm4GJ/G52VjZYW7o
	 x+H/sMge/143howo/4cjclYhEXe+T8CUm/CwBLXFUoRNnQtpcFvw2twoKWEpIxo4B0fBd
	 i31nFi5TUUYCNJHek/yzNQYO6txxIJwFvoT733aLCyw9hd0rITDnsR2hL6rHwX7qjS2/z
	 8CumaDtvXsKVQ0X/1EjjEZKEvuYkWEbM4sGuoCMz21I+f6LTbz+1xU4QWw1TZ2oGleBB4
	 Kqa8XEXRRVMzkYknt24RhMioWV7pvyQEPBHUKe0RzC+3QAv5R3YNDL9r5LOsEXEnQlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795131621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ujRBUPW4rzGkgFXhZZSaVMhS3xheXh0mgN3K+pM1GQc=;
	b=VEBPuQrfs0qEE/yqyN62vZ8Yd03j0/A5qYSjcgUX60MaH7SGZ3ApZd0AZ3Z1JZw+wQPl
	 g1MTkTCNjJmmFzLtwZRjCcWGMxggmk/fifkPlVVzqxVopFnsdBZ8JCpz7oSMOsiimJ/iU
	 GPljk+uQj1NFz5DBrV7H3P4TGfNvgcBbLZbV7RVVy+YDHbOa+613rYFRvZZEeQhEhKmMR
	 LybLrknPdnH2Ndz8VCmVQa78UQOrpr775vMYYjeWbPeq2ELr0bh45uUX/DlwiTQ2D5Isx
	 FztcyMR9u4UszxFks0cArLNgrVjXs+YfKBcZ++7xERyzy/w6n+X6+nknbtbv5rOSJBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LrSy9a3N;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992E6606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 992E6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LrSy9a3N
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so489264c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 15:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1795131620; x=1795736420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ujRBUPW4rzGkgFXhZZSaVMhS3xheXh0mgN3K+pM1GQc=;
        b=LrSy9a3NaoomosxPTFIlpShr2EwluSs1obYlE120idTnP+lnvSdwC8hexjIT8zAK2d
         YzbeCiQVTKtQJTU0YRo23uvVK9s+t32NI3p2WWeiXo7YQS1PFtcOEQStd5POd4VQgWxl
         GXJYC+zXkswSNKvnPbppox6jDLAxG0LylOvscMy56M+53p8wB/iJUbIdk/7DMZruHClS
         uPG/XVVI9tnm5IFEJ7ywZHnFgBKWC9L6Mpx4FVOlBgZqu4aaHWmuco99LKXTs+XgL64o
         e8tBUd40+X75xBjPToTDLuGj4UpDzbn4Xb3I5tPtPAjv0nDurLLjJ9G3CneS5pM4DoJl
         TklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795131620; x=1795736420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujRBUPW4rzGkgFXhZZSaVMhS3xheXh0mgN3K+pM1GQc=;
        b=KYLZHSqm248dBI1a88tO3Pb/59TrrYkg/i7M3wNft849zAZXNXQPjSCbtqNHHBKoZu
         aM0sfHiB5/l4F/s+6Xhtpdt9/kS9S0RiG+whWtJs0sLgVEdqSs90DQP+U6uPJJIoYj/1
         lTa8E4mWuJ4xj1k7D4wUoiVfELGOqtPZbYMyb93qlsVtjl5pw836RUCdYaQI1TcEUy1P
         zI8/NwBIv4znc8H/gWE+6Nfe4EsVVah2oxBzqKgpE7AJXRwXGKjZWlJDRQYg1I50hXaX
         pkvj3YnJKvChilSCdUqPthSt4rJm3/84N9CRW95ZHroWsdSMVRY3MV0T7n8tXDU31tbc
         o5Eg==
X-Forwarded-Encrypted: i=1; AL+hErEfuGMvz7+BCIK/BFkQ0GoWidQq6bqxMDdGkCvBtMuAyGeVm+x4wtjuMtWOz4suK8mT8BqFgTQo0fPoapQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+T81PvHZ9ZwjJB2XV2aj/aMu1MCvzFhlQh+hu+3GNTf8kzHmZZ
	06iZcQaXaNWpFtSBZ7FFWL1a4S1yrZUrX+AJy92MIMVLE5tT7+7h+jtVR6yIorWy4uw=
X-Gm-Gg: AYBFou1iEtzrdKxczBrgN/O0ZFejBdx4Wr0rAjuvu/ufy/6FdYFsWrZZFh/shsPdpqs
	Doxu9+6Oj4I0wiv7Ph2nVLQ1HaKAG6VX9VnVh29628sKp8R0KlzdvyZaYfdBugVBoaLH/AFIfcD
	DhOP3SkGVTs/T/GyzOobX+QyGJ+zBWh4KD2jnCSQqRJaJXyy/WlJ7zqRgA5M+MwGlEPLmlcR5+A
	3dQgTd+1u+dnWxLswKOHvH0IUPMdk+Taqug9JXVKMJjYkzEcSX/KUBx9g8YUoBKwqsSXziicgP6
	lSL7fOi6dlQr7/P0d53GGEwVs8Pg1Itu0+DTgCrBj/2mB7YfR00d7I4xhlpHdsXobyv0JxR90Xt
	PmZMxYOKOYxo4AY/4OtxfUHf/yg/gBZyoxg8r8ad5tSwXiIaE+VEQF077f95w54ALPVt25ZrCCL
	eaHTS5GhNff55wOXBn4Ttzwd/8Gy1cLdlDmrM36arv3mXZRW7wlrfTZbb/KscpT7j28VO4p2d08
	E4xrBDt9V4nVYwqGiiJWK+XglxDjMuv1K4e3dq44ohLJo6a5FMUuHcSaJghNROfWxI3pNPt7Krc
	XwS1cv1F9Y4oacRNqeSHSFArJTL2RoMTdNuqbGaU68M4dnb/G1kpzwyEupSq7lm45M3wf1UkCJU
	BBSv6GdjMJ3MiR5cDlhX3SxEF3Q==
X-Received: by 2002:a05:701b:240b:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5568b38b3mr1021228c88.14.1795131619590;
        Thu, 19 Nov 2026 15:40:19 -0800 (PST)
Received: from localhost (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm1828018eec.16.2026.11.19.15.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:40:19 -0800 (PST)
Date: Fri, 20 Nov 2026 10:40:15 +1100
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: guohongyu <guohongyu@cmss.chinamobile.com>
Cc: dan.callaghan@morsemicro.com, arien.judge@morsemicro.com, 
	johannes@sipsolutions.net, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, 13057616121@163.com
Subject: Re: [PATCH 1/2] wifi: mm81x: clamp command-response copy to the
 received skb length
Message-ID: <pqir2s7da6p4rjj2bqdrjbgdfgrpgyowhpxwj3qnv72fjl2gof@ooe2zsoehufj>
References: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>
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
In-Reply-To: <20261117032227.154874-1-guohongyu@cmss.chinamobile.com>

> Cc: stable@vger.kernel.org

Really ? Is this _that_ critical?

pw-bot: cr
