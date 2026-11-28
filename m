Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795865226;
	b=iN5K1sbQRCY1kMCjTA0l5V4Qdy9BWILcNKMxGznr3I752G+Rrns0mS8ETZafyfibMPXE
	 +Fzh4Tfu262YVzlKUP777A3/EV6TMnN6jvMbMqaHCxO30z/1kS12j3CCzP5qJg8rOcP16
	 MDZOQ4tIX1Tjm3TrHUnOXaOsAuBsiy7cb89yMEIUuPkjW21wT4H9FjDy3aqaML7twUg1l
	 9skhvwE7171io9MydcDV+V9+gjR79ApykpMTslrtgRxe7OPRYKkIDGZQsc+RiTF3b9E04
	 0C1KTeUSjiSA2K7LRYx1g/TPlEWf8NPfWizaXRtPATikiNPn6OHshQNl6Btv0b8qlTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795865226;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=7fS8b+Eqb+oo234TWXOhDPoeXw32DMJjd+DlpYrhdR8=;
	b=U9v33v7vZgLO2m1rQHvPoYsGfhrz7rRDazcdCmx2+uzLK64G9CvFr0OwY3AfOmyJysKL
	 73uPL/vyC2TVar9fdJbEhkR3cKRS1CptxoKe7wMM0sI13hYHVQo1j5K3FTvHx9Bytfats
	 qR5rs+j0Q/lxiJL8dEBZpd7bF7/BVe6hO0LlVQpCi/Q0KYRr6XGqF9Upv8p4KWpp/BcnP
	 LqKJYAEz5Krd+0tiZGXfcczCFB433g5pYC5lN2Wr1WnawLD5CW1xtr5a3EKmNagNh76rw
	 sA9j34WotwlZjbjoC7IPHr0x9yuxoOjebzu6j93Ncg8zwn6cz1CoMJgeZsSDygc2RFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=xlxwWowv;
	arc=none smtp.remote-ip=109.224.244.27
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46671606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 11:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46671606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=xlxwWowv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795865218; x=1796124418;
	bh=7fS8b+Eqb+oo234TWXOhDPoeXw32DMJjd+DlpYrhdR8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xlxwWowvctaSX4Csz2SZDuKk3vLeeiIiTns1/4+CKCQK9o7EI34kUGUp1UQdxcsmT
	 sFpO4wlZ4wZ8l4uqORzKIw2SpZr5vBBoEMr9WHTWbIeLoZF8v8qiX1NoyZ8Oj+LHl9
	 4XueQ0gGT/xPOKBeCUyMzpss/7PI9qeT2USykl3qWVGWW+ohhG5xODTG7nzvDxIijK
	 Nn7YU6OZEJYLkDjfd6AXIdgoQBxBv2uIcu2RO8JBIl7r5wzHRWGQRlEa2DJI1+71BO
	 vDlLAWwomBwrzbj9ris+m/uyWQx2L5Pi1bvbM0XrDFaqID6ErvSUzf68Q1d3cpHKEA
	 YFvkilseC8/rw==
Date: Sat, 28 Nov 2026 11:26:54 +0000
To: martin@rfdeck.de
From: Ahmet Zeren <niko3x@proton.me>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT rtw-next v2 0/2] wifi: rtw88: honour rate, retries and bandwidth of injected frames
Message-ID: <VlXplLX5apZBM3LPGxqkM1o7u2AvhUYD8YHGKQVhZo2aZhE5oLqDDEAP1nheF3fmtNHE3TCLvFSMhnFddrGV7PBF2z9h_kXHMHxX0BlLyBA=@proton.me>
In-Reply-To: <20261128113304.Horde.AlVGhIssVk0T26G9XwXTpD-@mail.your-server.de>
References: <20261127161943.Horde.JkGhYA0aQ3kFZkRWztLNi5H@mail.your-server.de> <semDCz-DacL4vKeB_8iKu6ZwI8pQDusEK2fvgerTJWRkQ1MAxvs0nX-lSJviX_LDplBuBKniLMaMy9FtGH2_EkckFD-LR2YY6pPSPwrTCk0=@proton.me> <20261128113304.Horde.AlVGhIssVk0T26G9XwXTpD-@mail.your-server.de>
Feedback-ID: 201311995:user:proton
X-Pm-Message-ID: 1613c55b2053936d1257d52061e984f677cf6aa5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Thanks for checking against a reference transmitter, and for the
Tested-by.

> So on the RTL8812AU, VHT MCS8/9 either aren't sent or can't be decoded.

Does your RTL8812AU ever reach VHT MCS8 or MCS9 in station mode, e.g.
in the tx bitrate of "iw dev <dev> station dump" with a VHT AP close
by? If it does, the hardware can send them and the difference is in the
injected path. One thing that differs there is the rate ID: injected
frames have no station, so they keep the default legacy rate ID. If it
never does, it's more likely a hardware or TX power limit.

Either way it's not a regression, so I'll mention it as a known limit
in v3 rather than hold the series for it.

Ping-Ke, do you know whether the 8812A needs a VHT rate ID to send VHT
MCS8/9 when the rate is set with USE_RATE?

> - broadcast data frames injected on the RTL8812AU don't go out at all

Thanks, I'll look into that separately, as it happens without these
patches too.

Thanks,
Ahmet



Sent with Proton Mail secure email.
