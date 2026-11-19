Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107735;
	b=PmxwmTVPeVpOIq1X49Ch0gzBxWgaaf/Eae/2psUYCnNkzFvG94HpldsXIcaPSodws9Go
	 iyihZXrkmBk+tZtYrKxwpMFAF5f6K3ltluYsLBx9XtuE8HhnxJPJWovuMXXzgK4sCnDoM
	 XPeC2bLPWms4UXcqiuSAfYacZzjZ/eEeqWhr7SsRD2ow8J77zdRiqoLbHYfmZxz7bVbdH
	 6DvqZrulIn+uNzE8BC+WtUOVKtgwQrFyqkB82txLOc5PyTAcAceFVhX4oh4cjdSTDcUB5
	 pXchUf1BoqJ7AzS2ET0LTQY3/hmxdL+kqiFbektIYidu27+k2P3BByEM5BTJBgu0y6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TTmdANK+IkLy05CsjTQ6pOkhGNqqFqWM2skfBKcModw=;
	b=VzgRu6CTuageSxXc7n958tK5EaqO6FdKnzxoXsGG201+NQzbQmBJg+gInAbTZtXvm3bC
	 R7frIC/cTZzNWXatJhOchvydetu9Fjg8rQQC7u0ah5rQmWO9PcYSs7QM4QjBqgYfl0DQx
	 AWimv9J2DLCrKJiMpXW5CUYeRhk/NJlZBduSBkZ6l6KubzxpCMKlGXseEgH38jFAKcy0W
	 cFqgna46w0ATYYxnCr66jflHhQw1d8v5JQKu3DcdsGNIp3PCZGlXlbqet1sKBZ+399yL4
	 6dDFk2qlaHwZtoDhGjg/GO903q/vClCMOQUsK6QTYIZb67RxJPGeo9RoYBT5icvaI0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awkN7fJb;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11CB606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E11CB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=awkN7fJb
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-380b40319bdso3567494eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107734; x=1795712534; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTmdANK+IkLy05CsjTQ6pOkhGNqqFqWM2skfBKcModw=;
        b=awkN7fJb9l5fbunrhGLkjVO+98j2MYJVNiuo9hSQanF7wgXY+sVEh19TZPXGfHgiKz
         wIMV5qb2hgT9ipUtvHENcHj8lsSd16Ee+M6Qi3cyXdAGwe7oIfhpJg65un1DogjOBuVb
         k5b2wwaLPZkHr3ChWRg3Z5Y1Nhtsfo2MVIOAuumg/YLPWsD5Y+XJZmyACmLzdA1ONn93
         0JSMz0gniTZRfI40AQ8qm0IJl3dv55rDG/b/rOJvCTQVANQFj4cULvHF3DTwVZHhkGE/
         hwfB3R1MSmSVrMtlH1rVPh9/xculp9zZo+aEMpDPgMgYx9cTLqfkeMz4R6I3Q+MeC+VQ
         eEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107734; x=1795712534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTmdANK+IkLy05CsjTQ6pOkhGNqqFqWM2skfBKcModw=;
        b=Qwu9Y1ur2hqLyPGxDgI3/Wsm1tZIb62Y4jkPps5fnbNajXPGIC2zHOJdNXbIpymCqW
         Es98awdfK4VLgelJgzpe4AdPP4LRLUBRi+0QGlm7bv1eUEhBiKxyT9cee8TMlEcYMHjQ
         UEeIC6O06rrkoe2VgKmNRq03fvIkShjesevE3CLNYMEp+O5Ji1cr6bsz1sncxwyyy2gJ
         SBCj0GwBJzqJnA3CnwG+SfIzFPUvZ/DpP2OqZ/Bfh65Czpwzl8MJu6gieRD2lHScEXDZ
         oKZV46HBVSQuP6JzfjuhrlIPj/9mJhYeHTmoRLM4rU+ICsWzHuusvsNGAUIkFo7X4vIH
         I1Ug==
X-Forwarded-Encrypted: i=1; AL+hErFp0DlVa4W+St2OSgH4tczK15C5NwPG+bdNgSwBcAbQgms1168OyhDN0WOuhM8gVtXEGQxSEAHdJ+v36yI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oXhc67cu4GNCl7Uz8b8YauJCforCSnb6eobhk12KnY+D1sUPL
	/8h2Lenm9MDuD1bgod95gDtXkIuPDmN8AoCoiA29HevfO8r+iAHRCXHB
X-Gm-Gg: AZFdTZdVCJXkku6Me0R4ACnbBAFc5Y/UF46j1gMVYfEGzYCz0mb9u3VsBK/R/EUhMnf
	2vIFl8dHJ9/X2gkxmZXEjs1wePP1FrCKtjPAGX0XpiugcO0GqxG7y+1BtAP+zDLaKJYB3m1E+NM
	fP0uicpGvi5ZyJY90sOyDO3qoD1R4rTpla1zkFv9/e8bSv9ufvf2JBT/erOLxjZne7lol8CBBAy
	2/QtTkLpX2CT54V6W0k8MmlfvYsZHDor4gkCXK3lmTHTf4sZW4DmXfajF04Hu+Fj0o3WTmNi2ll
	LWnwMvXd4JRwea5Nsvf8fIWVmQbiB7arjYQc9A017vMExZbiDBrgDHkphxt1+WQQXzJD7XATEmx
	JZUiYM4CfpEe2n8UYgUZE1YNGVQScAaTZ34idknGHvI57XH6ekR1I1dsps+o3X8soq9b6Mvhx0l
	Sfzq5gnE8vEUIyOtDfWvXERqKEmYoZLpYk4TIf84N3eyeo1W40lBjXGi+pvo6+vdIo+e4xXDmRA
	tizET7EdLtzlih0MGRio12w+M7hfHVklq7ZxfTS2oUHP+tcjmeXyhKYVetfTArSTBftFXgQ8uZ1
	phaxBm4VzKL3HfJbROyr/1RaoSWF1Fz4
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr10608eec.1.1795107733537;
        Thu, 19 Nov 2026 09:02:13 -0800 (PST)
Received: from embed-PC ([2406:b400:d4:2c10:2a65:1948:5abb:65a2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm138922eec.12.2026.11.19.09.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:02:12 -0800 (PST)
Date: Thu, 19 Nov 2026 22:32:07 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: rtw89: 8852au: Add support for Mercusys MA72XH
Message-ID: <av8rj6mBU8i5vA5A@embed-PC>
References: <20260710030055.57438-1-abhishektamboli9@gmail.com>
 <9bfdb983981d4bb98a4692ac6f1711f6@realtek.com>
 <8fb9ced500144618b7f43e54c12a25ff@realtek.com>
 <av5ztQNkWSsLE4NA@embed-PC>
 <9a88c5da71314ce7ad7100d1c3e94a03@realtek.com>
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
In-Reply-To: <9a88c5da71314ce7ad7100d1c3e94a03@realtek.com>

On Thu, Nov 19, 2026 at 05:22:09AM +0000, Ping-Ke Shih wrote:
> Abhishek Tamboli <abhishektamboli9@gmail.com> wrote:
> > > > >
> > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=221738
> 
> So you think I can merge this patch, right?
Yes, I think it's fine to merge.
