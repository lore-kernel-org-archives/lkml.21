Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677893;
	b=aACJRx9C53yq2uMW86P46pIKCo/9R+WFW1tMKrsIPdSTNPes6+PdEBEhRAsKDqf07EPe
	 HiebiREkNpRqsQOtmVgXlSuefYVAnikPFMc7j4qBR1jg3J0lTYB4v5FZ1+ThojGAGJZwl
	 ITn+OVCuc4jBpmU81c1XusFmyUBe1qkIkIcqIWCcyCLiC2XO43AJ5b90tu9xFGucYSSpE
	 Q+scm9w3gfFgn8FzkWOwczhSrDi6wRNoRU0nS9aiCnv4mXusCcSYvmarv3YtaeO9jxMgZ
	 0AMgRZXbFijVl97/YgoHEDdywHIlDFJ83AOM4S8WulDMk5SJLcxp1ynPGadgagE85UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mk/72Ud1w99NhITuoR5LpdVTpngaXRQ5Qgh0L/idvEo=;
	b=CjaH3nyxajYJaBR3tWtaeSmU1dyjaSkzPsvM8pNIK0xFj3IWL7wQj+AOTcXDZ94tBVWW
	 3wyguwSc962oCI6glJXMntqKgRepN/TrYTuaNcLGqXddvaqt5cm9vrOvHCAnyyDI8rqN4
	 +aLAyK/45FnDNctUaqeM9DSMps2c1+YkC3OTDiID8C0/Bbeo8Q1ZfWcWzV/SLsdwXbOzu
	 qsRUOmB9KXH3TQeAC7vSfokMXLNktGc+JSnk1qkwFS48WZAoYt0iapAIP2Dt93nYthQAs
	 ysLrkKjQU46KokpRPrNJ9pn9XKiMYKXOa6TkwleDyJNDJdylihgn5VBWmWPDbJqeSFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrOzT7nq;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D39E606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 07:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D39E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrOzT7nq
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso3379726a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677892; x=1796282692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mk/72Ud1w99NhITuoR5LpdVTpngaXRQ5Qgh0L/idvEo=;
        b=QrOzT7nqsMKQdm1h0hM5kVEdttUFmTjDCZFoczT1B3aYxsWIQThcVUHk3pfelT1jwh
         EN49IfvEiOImLzrZ0pCpyI960PEPTP7XSal6sBHYZcP/ssTw6Xcd2X8NX0lgjAvLTPCe
         /T0An6yGxJiI5HGn/bJ4LdFT4YYnm5bfJHZh8cMXI/4nq7KhoWQEE9Iet+rypk9qCmyF
         kml58u4rUspDyJiP9+qGJ4wvFdI7wTohjMtyyqoNVOz8qkZehSXlfnOKSUsOdPo/efep
         mk6ZMlQoPJPthnLOwnSterVZJts1IbbG0IfqWnwgCcwC1wkXUMQSMNyz4Ks6AvuVhbrD
         zT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677892; x=1796282692;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk/72Ud1w99NhITuoR5LpdVTpngaXRQ5Qgh0L/idvEo=;
        b=K7BNuGp77rNYXPlgSFtAY5i5sJslHLA7d92J/StQ+lHFH9qb8jrtOXsfbuxni4AjWw
         z6ljPlMTM/p+HyDwZ+nO6z7dbJepLfZvnEphqBqJYo9vIsJhHT4sWpTFzsnW9ileoKoK
         IKYP9TACZdiR1cEhW2Hdg6oRdgcwjplwCetmZx2gsqzN4DHuvOjNO4Mv6kOwOzD4PJfI
         Yq2QaOwUmttOhvynaMAqNQLOGwhggzIwUg5+2EMgM5XBuayes7HJGxTs/EdFNvpvTtS0
         f8J6iMJlfAPLhcr+hdBOC8hgcKEhw4etwwIwWcWPb+Eq5GIafyaE22zTD5JXLA7OZZbd
         pvLA==
X-Forwarded-Encrypted: i=1; AL+hErGf9KLqG9MjXJdjUp11RHDg8N8PAG4A9Uy4S5DfiUxQ5LeV+U0HHeCG70BucZ2SdlKT08BnMA+BMm9OnW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aY+DB7kj2pk+Kmx1vUWnUAXiafsRM+ziF5yeUlzurJIXLnyDf
	LE3oPE6sqPMOqZpErrUyootfaMlMvICEPtJnwoBcZgigNEP3To06JlKQ
X-Gm-Gg: AZFdTZe51YZ4fxI+Md9kjYrL4Mrh4Uh9U9mcK3U3OEbX4TY3357jnvKMWINPYpdpuGQ
	OKqLBUkBLJv2sdZmEwUVcqMfDSGBxlnNRvWSY/uzfifqx+4J9TYR/W/6PKhSyY78y2kU4JCGoWJ
	Dm4MC0AnpcZdI+ZodgwnrRL1en1VUfuqonQNjiNytG1PuM33eRmu91huRMhjEkdLYDWBm7LXf8C
	DJ/GrlzSqj+gbsqrjokOQ8iRCKRY4cqTDbwHhx6m8ps+O0OH+h3MnH2FEw10iGv5DuTkF3za7LF
	2Ct7q88ivGR7Yl2No3Si3waI/ej9142lBh4fQAaP43mNigVkCNsVinaA+OTwfFY+G8kkWrBLQWX
	SrdWvVKf56hemtfCg4b/vLj6unxSZV2L1ZhLFUnORrZnGm+M/yIeuLIP17vaaSvloHwIIX6K4E3
	8paYdlH4JSS2Qpa9kahGa3H8nP+1jlE0y6I+NY8SjA2MTXpBVa9XCOQgCSfiQLwC7v2w8MybOXD
	43/e6FdZBHXjx141mUzwGUTguXIRhaPA4ueqc0KSwjQ5L4+DVw5jMgV0pt8LLveICAVbCxHdSYw
	UsU2/Gv2zXBV2vGmOsAyOT+Vj9w7LQEeTJVdgmGVO2Gqs0ioDgGpjm9lwbOkQoFMKm9B8z10iEe
	kCcrcBG+kI3cNkhCgr/lPdszqt0Xtac1J0SFAkVh+MchzdEJc6mFo6I4xah5OCTFXDjVopLdgK9
	G1mQQjPsc3yEeORvFmHeTDPs0=
X-Received: by 2002:a17:90b:2e49:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b41c90811fmr19051550a91.25.1795677892416;
        Wed, 25 Nov 2026 23:24:52 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm15526820a91.10.2026.11.25.23.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:24:52 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add V14 G2 ITL to ideapad_dytc_v4_allow_table[]
Date: Thu, 26 Nov 2026 12:54:40 +0530
Message-ID: <20261126072440.749440-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <598e22ddcfa810915cead43afb9886d0564e9319.camel@rong.moe>
References: <20261116171817.21802-1-kapoorarnav43@gmail.com> <598e22ddcfa810915cead43afb9886d0564e9319.camel@rong.moe>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Rong,

On Tue, 2026-11-17 at 01:31 +0800, Rong Zhang wrote:
> > Fn+Q does not switch profiles on
> > this model.
>
> Even on Windows?
>
> If Windows can switch profiles, you may improve the relevant Linux
> drivers.

Sorry for the slow answer, and a correction: Fn+Q does switch profiles
on Linux. I only checked for a key event in my first test and didn't
watch the profile itself. With allow_v4_dytc=Y, each Fn+Q press moves
/sys/firmware/acpi/platform_profile to the next profile
(low-power -> balanced -> performance -> low-power).

Fn+Q produces no WMI event, no keyboard scancode and no VPC event, so
the firmware/EC seems to switch the profile itself, and ideapad-laptop
just follows it through DYTC. Nothing more is needed in the drivers
for it.

Thanks for the review,
Arnav
