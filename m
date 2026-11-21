Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795291250;
	b=XWBxvivNik8JiCjnqP74YWOh1T+iAiuQcgdrXIh7Lh+cRxgveDqLoYCXXMAHywAMlSyD
	 /HYuAfawkZRzIMZ6avpEFTc/QGcvDELGQVKRKU2xeKf0Yz1hK5rIZnskMPagI48MoBN9w
	 JkKKeH5vJMyFptI7s1dHx95Np1HDE7Dp4ADzCK5NULSR1zU53bKZqAyvIuc5mJ43Icarl
	 hqfFee6XuIXHzHTxnQob13QJXKoH5WeikujzPQ0xLySUbauQhKdLvTmKm+YrEaspIUByU
	 V9LDxUJTVZXbu/skyqUvRG4s1zswi4tW/SOiMh3zlpnP5ivCM5bU8jd1Jnf1RqKUv+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795291250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=7HhrTcuAlkekQD6nLymqH1QuQkx+iwC8jwRAw0bA46g=;
	b=PmvflPDTD3oKrrEPvLaPjuc8aw9yRNhnPF/D7U7H9Ur6IAaVUnnQ4pX+yhNQC+0UxVQZ
	 ZwuGqN3rUMHRpI/FdiE+JZDkgRSFIbFYW80LH2wiPT1Rckm4FP374Qc8DhnT1dxp1Sale
	 djfA+FUyZmhjZgJpe+4sFVq0pH5p6s7MCw3goQiBayYztSHNRi03G0YCYbFJPuV41Q/iF
	 BU4Y+Ls+BKQl/36vRUSfHJ9jXjLgln7JSDetn4ebRoo/ZAdm5YzbPzzYDVX89up1hIRKL
	 OYLaE6E67ceYJQvGjYrSx0PSgtdGvhyzkjeT/NPOwSYHP0zb7FxZFFf+qVjr2Kfu+GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pA/HvUny";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89844606A334
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 20:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89844606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pA/HvUny
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so2474462eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 12:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795291250; x=1795896050; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7HhrTcuAlkekQD6nLymqH1QuQkx+iwC8jwRAw0bA46g=;
        b=pA/HvUnykyEjuEMak/FiXGOfb0wuOZhIVkWLGpFFZDtExn5xHTeAIzBTM3m7VBUqpU
         E4+CamvZwbRgp60kuGji98jZqW1Ze4NshVgm343IT302QCIbtgWivnRZ8galqXbtHbC1
         MEVgLg+4wf63baVRNek0OWuiB9vwpFjIE0rp8Ll+XRjAq+K33mKHdZFyZDWOuBlTswwD
         M+TcRjBxAhVj0/XOjvhkl9fAzEbEPaR44OqIwiCh4TY/KkaPldBR9H7+DAa7uggRv1xZ
         sPbGKTEW3Asxc/ifezaY9zfujY3Dc1lEKsDLt6p64yYUQ1usnOwzA1VDc310dUmvzJ18
         93uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795291250; x=1795896050;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HhrTcuAlkekQD6nLymqH1QuQkx+iwC8jwRAw0bA46g=;
        b=ywdNnVlUANpnzlykdd7UgB1tvGkWuvPZksr4MQzt0z7oeJPWxOWDcVUsiom1WswqTF
         v1vAPQElI+Te5pS5nyoqE+WYZ5yKrlWGb4KX2d46xEBrAJM0TMKAn6qAQEuIxMot4+yT
         50NPcKpwiSNmOXDaczxWUGpzCuzL8pcfZ/ghgNnxYyh1HPnapukq9UI4cxS89Jqu9SGG
         1Q8B1GMSQ0C2lwFln8N/yvosWqQvCRYdUISYEgI3c8FeFtTscMszWvWRmx396Ms61vbd
         YcbPQREvRTpkag30H+meihczQGYZThc8lJ32G7UpYciTcPDrxbr5gzTyIzrP5zxMl4Q1
         zzew==
X-Forwarded-Encrypted: i=1; AL+hErHq+ggpPWYENHfpVhxx31dWMZv0oDPNr13kfe17XpoDHaePHBh8WJyacLkNNsi2atCosXEjFw5mmiSye50=@vger.kernel.org
X-Gm-Message-State: APuU4Z86Y5VtwoUgS2vEJAfWxj9kExUeu6kNedWjKNdv64swISS9GDn4
	pJAL++6ywZpl7XJnxiRsLcviQXQ8in0m64xra5Otpo9GPT899RtkrmLj
X-Gm-Gg: AZFdTZetFZhTz7hepUfrkfrjirvEo5OHuD3jnCH6pdT5ppXlMdQBu5i7spQj1jmQzmK
	c18PcWoYGgSIVEALN1gUo2FEfKkiACvPx/UqxlunuKNuCfYWGDcgIo8haa/wwoah7aIh0a9AwsO
	LA6HDs27p9CgokLXaVf2KqJq4KhSEWqvcS7PModplrUpX/xejBpO+oxqtQFC9NcFOvHyrcqOg1c
	SDoy8ujcrFlDPtv/tx6t2ViNXAtjzKS3wlQ5bO6ZaDx2+JKjCBQ6bWb88JBfxAIQkbsaFISIPJ3
	AfwZIdzSAZ+gm2ItaMYpBwSWct8xjPZOkXfKiVoglIUpFoJIoWrszaPZPlqN2rZCUFAzyMBNCj3
	5deP36KFWJp6y5b+DfChAzd3rho1iDXsRdo4ljVL93L3uNbTEFNTiyEUSbDmXZmeMmnb1IA97ip
	7dvjygRr0UZE75/8xyhbj6a8k5srI8P96zt9MsSsQChMBNf6XmV3fZQ/KhTJjhYnJBHaRUAnka0
	r6fzoV9E8YUoooXAnqmd2xziKTQqJe9sdXn/Oybc7ZdU6B4YLxXmAW5ruWPXMbL5tgyP/A=
X-Received: by 2002:a05:693c:414d:20b0:382:cd5e:dc9e with SMTP id 5a478bee46e88-3869a1501f1mr4067454eec.13.1795291249505;
        Sat, 21 Nov 2026 12:00:49 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm23438603eec.10.2026.11.21.12.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 12:00:49 -0800 (PST)
Date: Sat, 21 Nov 2026 12:00:49 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, Breno Leitao <leitao@debian.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/1] netdevsim: bound the peer TX queue index in
 nsim_start_peer_tx_queue()
In-Reply-To: <179528990077.3294.3095834745568902393@kernel.org>
References: <179528809256.2009509.5007624677973207521@gmail.com>
 <179528990077.3294.3095834745568902393@kernel.org>
Message-ID: <179529106761.2109137.12232270002163099425@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 21 Nov 2026 19:38:20 +0000, netdev-bot+sinfo@kernel.org wrote:
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

It was found by an LLM-guided test generator that we are developing as
a research prototype. One of its tests relinked netdevsim peers while
packets were in flight, and KASAN reported the out-of-bounds read in a
QEMU guest. The v1 report has the details and the reproducer:
https://lore.kernel.org/netdev/179505710275.3511681.13434978152402269948@gmail.com/

Thanks,
Kyuwon Cho
