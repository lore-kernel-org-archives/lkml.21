Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452781;
	b=0K/MCSzecbnYAEZh32aTPfDZwU5mvD2oyWp9YOz18riTLkyN2ZaXkNLRMQ0Opcw4AF98
	 EMWnkkUGoLy4diPivCeZ2S5A4OQnevkgl1t7oFdQtZoO1jBvmZfDtZajNEyYQfV1abcVh
	 Q5aXlp00bUIqqL2rdof1dZMucfTUIQJYThNOv6HNX0zk/m1kck2xCt6TuCS0fhBV4JJHL
	 duTFuOTX4U3/TpMIuF1asOunVT8693VqVptkgiPIN0XlRynUmElIyW2Ux3HeijT/gtjNO
	 R3XJkyPslletgVHDBv5sLi7oLi4m1pIYO7Ja0Ka/N3kgJtefwDRJATLMmbSu1XOQ73g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452781;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9BqRB5kTJT+JMgt4lOiUNJwguaSAdZSfkI2AQoVz0Ag=;
	b=upibmTSZCibA0joOin8iDNmNUv4OAnzvlus+1iRNFPjd5CkhUnA2aoOwLnnqfx+9qHMA
	 D0mgYAMECSZnuBUD82bPwNIk5pK3SVNpnnwMtTLNKetpxpNOa/D7K3MDMCEGMg+RWUFj1
	 zD8LVlkho6IpHsyrSAI3Ybc65FePAbKiiNpQCscbJmMao04W1Pu3L8AjWg38Mk6sKQ9Kz
	 Ql0j68vzuQi9qySoGSOsy7ecVUWwGMsqGteMdZCCzaT6nxOKxoau8iZiPzyuTYXV9xdWA
	 q9R97/klggFnO67hqCFns33MtRBrXY4olXPlgEKhsYAS+Tc+JEErbSecARXQUqi7CLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Y6qZYzZy;
	arc=none smtp.remote-ip=79.135.106.120
Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC6606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:52:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DC6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=Y6qZYzZy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795452778; x=1795711978;
	bh=9BqRB5kTJT+JMgt4lOiUNJwguaSAdZSfkI2AQoVz0Ag=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Y6qZYzZyw1VQDAKvt06Wnpme3L41IWvkKpFFVZhSpW3AdK1QsHMY7ubdJsvk+O6Yf
	 1wFJfexOMBrmnRCqAZKNXjS6qz4P+Vvzg47HpgCS5C114nMQE2SZhnM6huRNpTKJkx
	 DJqe9FPGNTYTsKNuM94gRmngc/sVysGnQq2mrUUIyZThR6GGlkXPX6o4SDqw9Am5gV
	 ZL95wEuJdUCYwltGq/fFyRuIJyRieOORfJ0FnZE4CMWqzLxsRjlkX/W9Q3F0ovt2db
	 cmo0qaLFE+lEiHhGvlCz6ugqQO2teIheYfOOc/+vZ4lxPmgQmOfZWcHQGFgReTNzGZ
	 jRyM4pCEAkLDw==
Date: Mon, 23 Nov 2026 16:52:52 +0000
To: "luyang@redhat.com" <luyang@redhat.com>
From: Norman Herms <dockseed@proton.me>
Cc: "will@kernel.org" <will@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "kristina.martsenko@arm.com" <kristina.martsenko@arm.com>, "jhladky@redhat.com" <jhladky@redhat.com>, "jmario@redhat.com" <jmario@redhat.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: clear_user: align __arch_clear_user() to 128B for I-cache efficiency
Message-ID: <h2Yz7IeYKGRjKTvtyae9lgHZIlzgU1Ze5lPbucMya5_pi5-E78h2z8BgJHbZ0JG3ufYHoIE_2ax0hUF-_TDkXfXnPwhLilCyFV0NHh4GML4=@proton.me>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 11030693f9254098ddbc395036ac3c3034d694da
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

In reply to
https://lore.kernel.org/all/CAL2CeBzYkr-i_WTF_pF9QrqO4K8BE+Z7D8tUY_M-HJGwZe=
SUUw@mail.gmail.com/

Hi Will, Luke,

There is a layout-independent cause in clear_user.S itself: the loop
label sits in front of its alignment directive,

=091:=09.p2align 4
=09USER(9f, sttr=09xzr, [x0])
=09...
=09b.hi=091b

so every iteration branches back into the padding. How many NOPs that
is depends on where the function lands, which would explain why
unrelated changes move the /dev/zero numbers. Moving the label after
the directive runs the padding once:

=09.p2align 4
=091:

On an Allwinner A733 (Cortex-A55/A76, no MOPS) running 6.18.36, where
the padding was two NOPs, kernel instructions per MiB read from
/dev/zero went from 797k to 536k, and throughput rose 46% on the A55
and 25% on the A76. The layout dates from fe59e0358d9b ("arm64: lib:
Use MOPS for usercopy routines").

Measured on my board by AI agents, analysis with an AI assistant;
a report, not a Tested-by.

Norman





