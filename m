Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457622;
	b=HYo33ye/zex3ESuvyiGYS66UZBi1fC0+peceemmQz2gmueksHxjWEIR1M3oXj2kbiWHv
	 OtQ1TQDxoaykaMaOAidKdjpe+sJQWDoeY7+H9cAxVn2DcJzJzHUGvrEhzR6TXgMrt9jO7
	 M7I2xCAXiSfbxCDk29UQJPzJ9xrUd8Sa5jY4v+ji3+se0njyh6h2pttvPCA/SljoC4rpa
	 6wFkSB2FkIoPCNXWYM9XNNs1oEdnIKrXZ2nGcvwoqjIvwCCwd5//igaeAcWM9vVKWBRmc
	 Lx8cSUlg7Fwj4rNr/GFS1tA82yE1I/ZOqP7Oqh+s9toj+MzxWpL/QH1UfmfnRm/HTuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
	b=GauKTRh51NjiI/HsJpgHuvrkw8BXj5RbuUCqDmL4+BGXuDTo6faT8ep8dyF19LGQnnlZ
	 CTY6SJ7IsRzUl5B2JHs2lEqi+4GBj3ubKKvIIEO5GoR0NDWN2zLYioemLh8sFqV9nOZgg
	 iWeRIlsc9iCclCEvdk4SpWYmBg3rIYpE8xamUTYJeClHby9ZgXXJceGlOgn4N3v7eriWm
	 Ps1/q/4fLEEq3mY8+FfgzC1NkYWpDAEi0DNR/79tamk4wQ7+3e12hnMs6OZGveHZxIzoG
	 TmvmRV7zCVks49GkviCpT+RUgyNlSL9btXFQelNX4mtUrhDovCGLHNzDXChH2wLL+gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="LQWETw6/";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CD4606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CD4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LQWETw6/
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1364687b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457621; x=1796062421; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
        b=LQWETw6/ke0AGLdFlDY+tyTnXcM9ROpZvf/O9lyXAKa6wTIzmashTimz/E8kj1KApA
         wb4OsxJEdFKQdpnrylbAc42fPkjMV9KF6K5tcEN6czX3uToTayip/oLkXxIG44Oewo2j
         MnnCSjRgOJKruiyA99C3EbhjfljR7wIStjR/a84mepa1x1FVSs1JtWc0fFVh63kUIson
         HJov0EerlPzZQ4dQgXomLFGaaoxSNLWEYtE5swf8nnXCl6H6b0kleCeF4Zv70ND1cx5a
         IX5N0gwKAPBH3iEnAfOKtpavO5WHYBp1Hokm1R1yD5Y8sY5kTe7kVg+IWh4KLrEAjnli
         PRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457621; x=1796062421;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JF9DK5BWLD1MHzXf1P6k3Cfpg7JcJUIjQB9CILaEZzU=;
        b=EWa1r/dUfLGoCp7cZS2mU4bgL7e3lt4zTw/Se92vsAENCFRWYeQ/HQJxSQ4YtEjd/W
         zy6imcqPWtmHnMSB9YEb4qTK5V4gN1cHNpHT0eJH35DLCIsAZ+Y1DLkwSFGa1/Y0SyUc
         K1IlBsdF9z9pGSSvdG5Ngvz3k5nTIE+mfKsehq36LHWmFirb3dOgjlcNrPq0GejXwSeB
         ccxGMN6RgWo0Ix65jgWP6UiI9MbXAY+m8W9GE574k6E+28QlYMZ/rDj9KzkOfcXWhhei
         zT0TrIa+o4B/RRhYRcRyLfnCJys1ZabBTzxByKVQL7SOlIP528ALQXjR5KrFRNGpsCfO
         oGsw==
X-Forwarded-Encrypted: i=1; AL+hErHRoNvL9CuplRhthUOSQzBjxQNcsBgtDA6wbZk4yxM7kDCuTEGyAXy8Q3l5UUngGSqKSnFZfi4V83nfaKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aiKcVGuiap0fNpzGowlZxRVWGccIxUp4x77/FAm9zViyKLBZf
	mmKfJXJiPVRV2WwwDlWTczG28fTsqel3pFiIIN+Nbr5/RGy6FVxn68KqWGQciwSoIQ==
X-Gm-Gg: AZFdTZewp1s8mT1HJ6n/CuzbDuUg/lK7bWsXqd4FOOE9Axlv7KC7C/Pt/ckWugU29L7
	SQC7zrDtw8eezldwxiU8RozGnYX2h7EXnkaKqEQAN5o1LvKaxAYnvJUELQ6TzbhrTtWsYauQf+M
	e8qSDRibvxCGtclffQpu7CqE0IqddSXLk+qof1tz2rTfZg2ok6tqE048HI5+gNuQuq7hGNPXFi+
	15W1PZFwfLI1WDaIFQqdBUIxvkKgzx+Gl1lG5Uehiw+JG0MZ9i+aKpZY6VdbVjoYDrj36DNRjvk
	gz/OVxr6Gb1JLtj5QTNOTb5KxgFbeyegP3/Ls339AEidRz4Y6tp8mhWqUYu2vwspcEPMjF50fk/
	gmu9w5oqLNhWUqnsAVi/nw/DlmqbtqGKrXnKCk57tZ/Uwd/ADIWGDlGaJKVyZPwY2jnOFSriIi+
	+BB4rnvFwm+RM4GQmemgQCI/XAitM9sLB23DTzmw+/ZXcTedqMBAsvWyJ/QooX6oc1r8LcrByZT
	EE2ejzb1oAO6lk864QUQo6aClMbVnFfvZ8kv6/tjkEfTDATiNDk4B4ImWXcwOfgRD5tFuXDdQRe
	r1WJLnMf0AVInzXxWR/Hny7UDNy+sYj1tTAxV6pK3HCzrpAJF19N79Nh5bywdu3G
X-Received: by 2002:a05:6a00:9084:b0:89e:9c7e:fd56 with SMTP id d2e1a72fcca58-8c87c768251mr11001006b3a.33.1795457620349;
        Mon, 23 Nov 2026 10:13:40 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c263sm5956386b3a.11.2026.11.23.10.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:13:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:13:37 -0800
Message-Id: <DN2SLUVNO0L5.3NUHFPC0J7QTG@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 07/19] liveupdate: Add helpers to track the files
 that LUO manages
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-8-dmatlack@google.com>
 <2vxzbj7j3ga2.fsf@kernel.org>
In-Reply-To: <2vxzbj7j3ga2.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:15 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
>> @@ -788,8 +797,7 @@ int luo_file_finish(struct luo_file_set *file_set)
>>  		luo_file_finish_one(file_set, luo_file);
>> =20
>>  		if (luo_file->file) {
>> -			xa_erase(&luo_preserved_files,
>> -				 luo_get_id(luo_file->fh, luo_file->file));
>> +			luo_untrack_file(luo_file->fh, luo_file->file);
>
> This looks dangerous.
>
> Since the previous patch set luo_file->file when xa_insert() failed,
> this will trigger in a failed retrieve. Except, the file was never
> tracked to begin with.
>
> While I don't see anything that actually breaks because of this today,
> I think it is a bug in the making.
>
> I think the below is a bit better. Although this change probably makes
> more sense in the previous patch, since that introduced the problem.
> This patch should just replace the xa_erase() with luo_untrack_file().
>
> 	if (luo_file->file)
> 		fput(luo_file->file);
>
> 	if (luo_file->retrieve_status > 0)
> 		luo_untrack_file(luo_file->fh, luo_file->file);

Good catch, I'll fix this in the previous patch in v5.

(But luo_untrack_file() needs to be called before fput() in case the
latter drops the last reference.)

So:

	if (luo_file->retrieve_status > 0)
		luo_untrack_file(luo_file->fh, luo_file->file);

	if (luo_file->file)
		fput(luo_file->file);
