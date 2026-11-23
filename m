Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795457114;
	b=rBA/mgT6n9aRbFM2W8m7yl94lEfGEYdEhOnbaNDEeqlHMAVzF3VpwTrk34jpIvpc5Nth
	 Hvc02n9hDoMUgbXoDFMug/at79yOhxgiiuZMNEKUIwC1YhuE49aVnXWp5PBzMRJN+pbVT
	 3zmTXIm3mgnnlMMxLdRPtNAYiJbqfzIuLZRxrHmumCK1+thhzjo+kOe/oCzbXmVKphNTg
	 Yuzk1smFOGxtGamW3IYuTbnlRtyZgq95DiJqbXosvH+lOkMlZ4HVWSeGpN/f4GVQf2aYl
	 wfOTetBL2l0riYwCpfOs478tR4pVz/HxOKqXQMKilDpc/yIu2aKx5rVxulLnSmUBdVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795457114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
	b=RpnS0zLvGrmeTFVSVXaZJS7midEUjaSzRNqFJ8RhAya0/wGs47sCJshLSzZb2jh9qYJX
	 IavmOq5sPUhuW4vdiTI7lVp3yJZ/JktR33+qjnw7zzKfMcHRjXoUq/5VM5E23uv0Qg9o4
	 Nm+m6Z2yJVuY1SBU+7DYPaBRh8U0XI6CerkU4YI7LCISSD/TuBy5/jJz6TWr6qiH5gu0S
	 UmhkLBrXAeiTXrjCUbTVCktVvF5BuzXRMh3NCJ11rO/bfuEWyBLJ0ZQk94QN3dHYcygtz
	 Vb6SFCdkHeyzCRIbCQeShoy/0IYIr3dWbWnKEP1kQ2gcPl1UUyVVUyJWwRuBzp0X2WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hpz7Nbsq;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184BF606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 184BF606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hpz7Nbsq
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1413853a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795457113; x=1796061913; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
        b=Hpz7NbsqTvn0QO5IqNcw2feT0b821er6TLvP0tMHcFy2s2RO6h4B7KLuBx9vHKKEMt
         XPi6d6slnuO8vHJclR0sIh0igUwY7Pdl9ZfFMeRGeZ+SvSE+1WBVrZ400kCw5Z+IxexD
         ijdL8ud41qDsI9X0qsGhnz6Qm9/0rexBUBtv+7iJcGW9UzZtPZCGmIjXKz2prQYhk6XR
         QZYEi8i3PriRVOjedHIZ1YmV6WPywJAE3bZm+QBa2Wc/KgmPHGNDGB7JyWU0inbohZ+m
         BUfKSka2ZXco7wmR+wHT+2mVB6yowLRmwFmM9Jb/9bI4Fh/IeRxophzoWqOqwKaJLb1h
         U0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795457113; x=1796061913;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw8SilefRf5vO5k7eeVpHgnCi78conTEfmhaXVb/RAo=;
        b=cP0dlZz2a5gAtZRMgHevjk9MunP1o6KQ63MH6ON5YTxYa96R/QwPNPFUBYA5/rJ7JP
         Ww0hOBqqx7+Sdtq4UWyOR4ZBVO1hNlAPdpkvm9Lm7RltYY98K5YRhWttweCAQVZ6ra3e
         +WJt9yZjhRspXLgPsE94QMnzuOpRHVJ+9TZbbkERa8Q3sAwDlEiW6mAwQjvD9e7jGIXY
         Yen6/X7MHWuvjGBiQ6rlTnU58f0wCL38vLdP1Dr1COCfUMVdUDx0qTHLjZMrbJgXKNjM
         mD2O8RlxURYIsjPKy1l3J43NMGaVYRZQow+PnQG1ki1s03SS/gHiwNPoryyglTrhNkdG
         To7g==
X-Forwarded-Encrypted: i=1; AL+hErHLALCEmKvZUBf87d70HsupPkmhkA7TLogXUgv54hb35K8uU+ARbf1OjIpH2+ceG7tWfgTzRTPmh1PsdRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SGdYR1Jm9wj23H2wZfT/aoINCg4DQUT8YObBnfkatJecJJArR
	MifEWFe2yBI9wwW1qB+MrC/3j7LFhp84hbJQ6F20t4aHwmaPB9H1FjWwzolAWh15jafHPK7pXtk
	6TV8dsZ9+
X-Gm-Gg: AZFdTZfDT0+JQmXy6vgcFb820UMkz/Oc51mQKhjEQYvUAJyu6KTuvGCVQEDE9s3bYzt
	hDrLzhck7jIBNgJ43hG38vmh8jz7KdzLed6+4sn5Y1FvLIx/bPzqpUxlGEP0x7QTmelovwtDwO7
	0Sazu1Sxg1xh/TZZFHIVUgqG+wanxcqS2MPBNlelSdj0gum6FUAzbGDmDkxJWtlndpsIh1vVf4i
	ufBEUiTkqnaxNs3F64o7nTgmqb+gsLSPfSw+Q8Iu74IAC6H5bPYMBVU7W1ZIagx9df9gNn3osPg
	Oyi+3E3mBx9WL5YnPv++puK7EMh6osUoH+ND2R4NMT6fRflQJv04DYtGgFFimnF0AfVxUjXubkl
	iEDhTsg5Mg08qT3fE8HQPKQu9hQCrA/s1pTh37wBe3zIGEWgpx7kMHdBLl2bp0R7yC+zivksXC6
	f7aDnNtrdSJte1bF87QiuWtuRUMRtyoAFcxc5tHyUBkYT1+Lg7Na0mZCKqlDA0/JMsyjnGz/itc
	EMWqjVyKrIC9+Iw4u9QXoL+CvkHewMqspupUM55znhgZNyPJCEFJ90QF6ZbtoUw2Jrir4AlDK8x
	tgkAQGIhBe5eMzGA3loizTzmxu3T8AGuUdID1+vqe4iha2aeMszNgGjlsiqSLLAL
X-Received: by 2002:a17:90b:1d4d:b0:3b4:ca86:8bc4 with SMTP id 98e67ed59e1d1-3b4ca868c1emr225054a91.46.1795457112373;
        Mon, 23 Nov 2026 10:05:12 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm18802720a91.8.2026.11.23.10.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:05:11 -0800 (PST)
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
Date: Mon, 23 Nov 2026 10:05:11 -0800
Message-Id: <DN2SFE0VTWYZ.30XIXLSZ0OQAQ@google.com>
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Christian Brauner"
 <brauner@kernel.org>
Cc: "David Matlack" <dmatlack@google.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-mm@kvack.org>, "Alexander Graf"
 <graf@amazon.com>, "Andrew Morton" <akpm@linux-foundation.org>, "Baolin
 Wang" <baolin.wang@linux.alibaba.com>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 08/19] liveupdate: Let file handlers retrieve into an
 existing file
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-9-dmatlack@google.com>
 <20261120-gedulden-rausgeflogen-spruch-cea76174d5e2@brauner>
 <2vxz7bi73fby.fsf@kernel.org>
In-Reply-To: <2vxz7bi73fby.fsf@kernel.org>

On Fri Nov 20, 2026 at 3:36 AM PST, Pratyush Yadav wrote:
> On Fri, Nov 20 2026, Christian Brauner wrote:
>
>> One thing: Please just install a new fd like for every other retrieve.
>> I think it's pretty meaningless to return the fd number the userspace
>> just passed to the ioctl.
>>
>> The fd number is also not useful as it's not tied to anything. The shmem
>> handler looks the fd up once and LUO keeps a reference to the struct
>> file:
>>
>> 	CLASS(fd, target)(arg->fd);
>> 	[...]
>> 	args->file =3D get_file(file);
>> 	args->fd =3D arg->fd;
>>
>> Which means, another thread can close() that fd or dup2() something else
>> over it before the ioctl returns and the fd you hand back refers to a
>> different file fucking over the caller (shared fdtable etc pp).
>>
>> That also gets rid of @fd in struct liveupdate_file_op_args and the
>> special case in luo_session_retrieve_fd(). And a retrieve into an
>> existing file then behaves exactly like retrieving the token again.
>
> I suggested this approach because I found it odd to return a FD that
> userspace already asked us to retrieve into. Any sane userspace would
> just end up closing one of the two. I didn't think of this race though.
> I reckon we could return -1 in the FD that LUO returns, and let
> userspace use the FD it already has to work around this. If userspace
> wants to close the FD in the meantime, that's their problem. They don't
> get the file they asked for.
>
> While I like this more, it's not a super strong preference. So if you
> still insist on having a new FD, that's fine too I suppose.

Thanks both. I'll go back to installing a new fd in v5, like for any
other retrieve.
