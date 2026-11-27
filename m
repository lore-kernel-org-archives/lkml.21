Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798846;
	b=HfCGmVLZRe3s+dP4VO+SPAHk/K7Ghpfu2w/skP30NXTjWu0ZAnjj5ROBi338+11yQoWy
	 WWEvIWl9Yvqj/uHY8dIDLym/Zh+JVyCrlsgUCZblO/zfchlenUl3CQ9voayzYi4qFB+nD
	 FfBDQrootBHRxx+tDXgzuxJf3e0mK+fI0HVrgoCBtHFGqunJFlS5Wc1QNqv3XJl+NB5F4
	 bAWCfY2sq9Vmtu5e+ywfwr59UrYo6yJH1hHHBFPlD6dg/8fp+Up/eKUjwpvE7pOXhcEfL
	 P1a0ZFWPomAAwIU4lZtDDq6t1qdnxG4VgFCDLm6zoIqwMEyOERC7gdRcJw8IuI8lbPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798846;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=U1yLLCVNt57u5GF+uQ4RZt1RrCY+NCxvna0eB8L6VaY=;
	b=eopg7Qk7BU54vgW4hxDbD688XTeUIva2JjrvXWk0nRAoABg2x1unbJEs+QZn/LMaEn4/
	 7LlzPl8DhMx6KLjtPlgGKtk4ZrSiX8L+N5tH0zLhsxKQcKLzzmrVeRpZkPeyLDGwLb+u1
	 vYuuwkmeryyuGCnLzH139mytHzPS3ikNTuNMxQ4DDTPYunDkgDoK7/fcL/qGWa6jQ/ld4
	 Z0gk/WoxBjTcdADEwvYl/yfj8ZiRLsaGwi6tEkpWc1R/efiShfYBIWXNhDLId+SFdIFOI
	 h3SclphnYLp/11D51REj1NShkhLTVbhe98PDihNwJokhrvrrAogx7bEjGThluCjplgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A1C606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 17:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A1C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795798823; x=1796058023;
	bh=U1yLLCVNt57u5GF+uQ4RZt1RrCY+NCxvna0eB8L6VaY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=VYTx6d9ZdxGH5l81XvuuWIPnYHtdFZItIsvM6pQWRUqF3Iqn2pTfo7abM7gjUKzh2
	 Irp6q3gykmkf+v6rBYbl25atF1ZxmiCHkOnTNvCbVu1QuG4F/a0+6QmtaKygRbK4wd
	 N67LVxwJPkt64LR4XoRrjya++TNX+BjrCjftMEuy5qv0i9PX+nmuRY11sF4AAB0ZsU
	 oXZITO8llruZdsdF2Rd522JCHjXLL77ne2Sg2VpJlyLwDdaEkbEYF0iY6JU5+8BzXo
	 6W2/C8dzKBwVHW8bPud1NaAp2IyDyGzriunuLvzGOKZ5OOt/oweW4Eo8x5sXMnxPy5
	 7m6Ll2rpGWWJQ==
Date: Fri, 27 Nov 2026 17:00:13 +0000
To: Andre Przywara <andre.przywara@arm.com>
From: Norman Herms <dockseed@proton.me>
Cc: Enzo Adriano <enzo.adriano.code@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>, Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>, Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>, Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>, Lukas Schmid <lukas.schmid@netcube.li>, Cristian Filipescu <filipescu.cristian@gmail.com>
Subject: Re: [PATCH v6 3/5] arm64: dts: allwinner: add Radxa Cubie A7S board
Message-ID: <AzjLG4iAqXVYU5xs3jzLGCHNElMjyalfu_xCbgGLeyvgkAXIXMDFHCm4LUyEe1sq6C4gcLhjyje0myr_eNKHhYEmWpoAVHJF0YHgGW7cDVA=@proton.me>
In-Reply-To: <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
References: <20261126-a733-cubie-a7s-dt-v6-0@gmail.com> <20261126-a733-cubie-a7s-dt-v6-3@gmail.com> <0a7f4a31-81ac-44ee-8cd2-7b5526af7442@arm.com> <IUp5Ow8SUNdgtour7we7BN_rry0fuoBNw-ucfXERukfbwTWvoWo5QjYLXAzxftTjGnsuhCCnwvxZ5fBpL6pFPL62oTr2hZddgE6XmrQ76o0=@proton.me> <fcdd57ea-8f03-45ce-886e-f0efb6f23d3a@arm.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: e1853d72c46332b596795337445d7c8e003b41de
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

Hi Andre,

> Regardless I wouldn't want to leave it completely unbound, but instead
> provide some limits. I guess for VDD2L, potentially the same as VDD2H,
> it should be 0.87V - 1.12V, which seem to be limits Google turns up for
> those LPDDR5 specified values.

That covers what we have read on the A7S: ELDO1 (VDD2L) at 1.075 V
with our chain and at 1.1 V with Radxa's own boot0 (V0.6034, and the
same on Radxa's Debian image).

In June we also stepped ELDO1 on an A7S in 25 mV steps, with memtester
at each step: no errors from 575 mV up to 1.2 V, where we stopped on
purpose, and a crash at 550 mV. That was after the training at
1.075 V, so it says nothing about training at other voltages, but
0.87 V - 1.12 V sits well inside it.

Radxa's boot0 also sets DCDC7 (VDD2H) to 1.12 V, above the 1.1 V
maximum that v6 gives vcc-dram. On a board booted with Radxa's loader,
the regulator core would bring VDD2H down to 1.1 V at probe, i.e.
after the training. We have seen exactly that on ELDO1 with an early
test DT of ours that gave it a fixed 0.95 V, on a board with Radxa's
boot0:

  [    1.792706] vcc09-vdd2l: Bringing 1100000uV into 950000-950000uV

with the DRAM already trained and in use. With our chain DCDC7 is at
1.08 V. So 1.12 V as the maximum for both rails would also cover the
vendor chain.

Built and measured by AI agents (Claude) on my boards.

Thanks,
Norman
