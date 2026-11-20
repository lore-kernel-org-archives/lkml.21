Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795138030;
	b=UaNU33kOXVoYMUjV3Ss753DcDgs6hDqJrwvWs6WEmB8P3yEbGNEvHaQibagptPZYZwCa
	 uLWsYkfFmGI+KBYCYxwt2cYEjChowEMzhmonYDKJyQfn8qKcsuVAn1PuC+ym3QLqWVama
	 CMZpIQEAvvJ9yb+RGCV0iOcXsXZFHLVl36CGhmUpAchb9F/OKwiNjTOohsHOihQi2gVUP
	 De+sCnN0/Ejxd0OKFohzf/Q8EMvhFQXYInkqk8fpa+uv1b691AKhzOye+H9JwZToDtY+n
	 v1brrzq1VbcouQAAAZO/PwV7LiFdzSdvfTmCUjCkk2enTLipdCGEsS65+q40IhWLIlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795138030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
	b=vHEh+koTe6y8reVCEIZKC875VQcqZ8yo9lt8POzmiqDZcicqC4peEC9v0JJDNwGFhu19
	 kyU+8nLxlJanolxvyRGxKL80O9gBsRjejABN4Ki1YkYiUuSLMTpt/40pZ1FL/cjosLPwe
	 aa9ekGB19ijrSGb5dPcO17ol8cgQw1yMYvIYt7xhXxlpr5mpModiUj9Pi63vAmMl6Iehd
	 odptlpcjaRbrsA67LlGE8mqCeaRnMcLg0DkDaNPG1884LUs5iN9Pkef1XrBdybVtB51KJ
	 YN/AWX3TgCXziktBkMlxBzCIh1GHd7ug6xwVwVpzEDBSXMyAaO7mbKdFWO7pfY9GgvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT5TT9gF;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163B2606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 163B2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oT5TT9gF
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso177405a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795138029; x=1795742829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=oT5TT9gFVeRsVpTIRpd7uVSqmIfR9E7HLDq2Z0TbkOyEee0JmDRfsxeBDU+HFuRvdM
         HcggF3/dyEQ8otgi5HAxGJaevGnotQqnq7jqFzIz96tQOjSB8r/6PJnlFjT516lVoRtj
         UFQ/YZR0j7lgtbQ017QIHjwf4wrLs8u+zg72Z5BNwh4m5vI+VnG9hpn8zZshlpuihvyH
         GTnutHBlMsVbpryYQYyOKJOsdeYBCVluqFoVMxhQ25lZKbZiOKzYQmdHcqDHb0QOHwOo
         8i8f3X9HZvrq0zTbebY9d0sPIJRedlPqOykfPGl73ZaJ0T36q2sWbbpBbx4ilTsirvkl
         CFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795138029; x=1795742829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPbHP917yUHY/BF57YXHo4DEomZ+zhTMb9fbIaZ6CZ4=;
        b=GzJYoRHxyFfaPasf5ZBxS8/rsUDVmFDpBvoZBd297QCzbT3vVmXE54EARl4wi6vlpW
         5KOHQuevlyfseHRQXqyMY5SWA8yK02kWeEGa+UCE01PNHaSTOuEZzXJajTbIv4vPC4qU
         Pe6ML1SmDbpkWW5SqkrwIv3POfBgsuU9x6DlyUBrCa7yxbG3zU90UgJKL0GDI3kHNoKX
         00VMJUdbpIoavw9NgIdQV8h1pnle9Oa7ZDRliI6pZDUxSxeIt8lmsZIf9xnIacZgB4Dh
         pAfcTte5Ujs7b3GzbENdINWhIdehPCs3Bk4IQca/tT5juPjLPKPJQ6lYh7ma3qvedqHu
         b/DQ==
X-Forwarded-Encrypted: i=1; AL+hErF79yHbmfK5Lm0wFYISxaFCOW8XWnN9ZsqPgsjvJQgdHFoE1BSb5YzYjnb6YsNsW4L5hUqc9DhA/vmEJYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xmDY2EFU9wVkX73F939pK5sr9NP3SuHpoGHEAceAjZLYjs/bb
	sJFERB476RUIW7HTTqKB7Y2y+6ey4/4Kp1Ui8YGTlOGNYHA6fPMQXQU6bAoN9fnvwA==
X-Gm-Gg: AZFdTZfnqfczsFrizeq+OtVd3jSVRWqYHqxxLwocMDQ7aoRlYJZnW00dyfuS2qOx8GS
	OzVmTnFFRPDaAnDBMmdXMsDwoPaqp7AOkAR/KKx7NGPJrCmIZvB+TKTef9biRPkbOwnTX0edYMt
	Rj1Jwf/gd86fpufXYK6hsfvX3aUIK99aFeTU/r1cjl8ytkQVrvY9f68jWyTk+v5DmLKUQm2pPcN
	EITt3aJle17VUbH9V106S1gzl9ywQL359i9BWqUmH3WZ4qQg7UbVE35e0JHa96cAPmAwAVDHjRk
	FOcaxNuSzHLf4F/4AzRkH0pC8Nit/gAOCwuJCjzVEU4TrEP63BWzze1A9U95jeg3wFyOMyKCrQn
	3hK0chF2xrCTdIuERp5nb0EYTpDVoO8BnbqN3o7//FIqK+764xwWlf4V5V0Vmfb7KUwhH4R7C7I
	6/Pny7nn7x+4eSbzeRjZjEZeWSY0LGTio49DkR4Ecs0IYen3v7GjUVCnFgcvOISSUte8MSrGIim
	+hPVbQUR70MDPIT8Qeym6ELvxu/kI6sXbikS8NgYMlNR6/0IoWQ56EoEpeQbGnn+Lx3Wt95I6Kl
	2ttUkPCbHQPTzTacr+eqttKqG2l1RU81zKkAuFzGgczWSvBDV7g2pbVWp6wPwuF7XmINqMNi/CI
	/TC9NMhCVnnpS+ZLI
X-Received: by 2002:a17:90b:4c0b:b0:3b4:12a9:2e1 with SMTP id 98e67ed59e1d1-3b41c931d36mr1334543a91.33.1795138029298;
        Thu, 19 Nov 2026 17:27:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm1763326a91.4.2026.11.19.17.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:27:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Rob Herring <robh@kernel.org>
Cc: netdev-bot+sashiko@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Fri, 20 Nov 2026 08:27:00 +0700
Message-ID: <20261120012700.1878745-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119230614.GA1147583-robh@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org> <20261117004133.1594972-1-jjc@jclark.com> <20261119230614.GA1147583-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rob,

Thanks for the review.

On Thu, Nov 19, 2026 at 05:06:14PM -0600, Rob Herring wrote:
> > There is no other user in the tree currently. If in the future something
> > else in the kernel wants to use it, then the solution would be a small
> > driver to mediate this.
>
> Would doing this imply a DT change? If so, your binding is not future
> proof.

I don't think a driver would need a DT change. The property only says
which CPTS input the GTC push event is routed to. It does not say which
bit the GTC exports. The role of the driver would be to mediate the
choice of bit in the GTC_CFG0_PUSHEVT register. The driver would bind
to the ti,am654-gtc node. It would not need a regmap of its own, since
the register is ordinary MMIO, so the node can stay a syscon. The CPTS
driver would use the same phandle to find that driver and ask for the
bit, instead of writing the register itself.

> Not the kernel's job to validate the DT. If something in DT is optional,
> then whether it is missing or wrong doesn't really matter.
[ ... ]
> Is that true for *every* kernel version? Again, better user experience
> IMO to just warn if something is missing and continue on enabling
> whatever you can.

On reflection, I agree. For v2, if the ti,gtc-push lookup fails, I will
make the driver warn and continue without enabling
PTP_SYS_OFFSET_PRECISE.

James
