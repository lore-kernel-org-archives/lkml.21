Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593127;
	b=sqgsB8Vam7Qo42wvxV2IKLncPbJu7hr7ISOK4FqWwe8ZJJkCoD5ZRfJF+7PFOIpZGbgd
	 D5gk+icFIim4Ofifdszza0oU1iaZjBz1g0+uJF3I7QmgEsDqWG92ZlF4/tTYy+gJRU47P
	 Mp56ok+X0rQoYhwfqct5MB09lmhKJAcwNq4JhQajUzx1B39rn4GU8cBBXU7Ip1LH9ZXss
	 y4QrcHliZhfazqy8uYP4LjdOz3qOwa/4QaNFwmy9cNuGG6GEJuqgsaiQ40J5eOlSqZ5EX
	 tXtaQSLQ6n2RSSasJSJMMkpEb9VkK+lTZ18EkNTx/ppgiUIzLSj8i6qLul7NCDOOt2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593127;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=019GwQ/x81qxKZSVVtOD2YBAp3ZMp6lcDwLA7mJ+Cik=;
	b=gOHZjR1Y+fkApn5bllBLQkxGeimAUXcEZw0uDQb8EHii5IWdSFtBZFwuMVIy32C/XxfT
	 I4M6g6uUPwOxy8NaD0wdeD5Kkybp7IOx0RmxViQY5LMSfzrj7GxGvV+mvbtIea+ROrfDA
	 VQ5bUVy/DP0e3ogHOs/c+59wqjWPkNfQlYW0iJDbmdr/vmDeuLW9C0ugKKHu0H8e+UHcF
	 0Rnih1fjRKTyfZ9ACpQIaH3+ZoW0K90UTAXtLYSSIKP+mmg6kgWBvGY/ogi08J12p5Cs1
	 U7sS94SsFq1FgVlj9CJd6UkWlvX/TdnJPZBgjK28Fe7Z1JbLOGNX4lUaQMG5mvOUylQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YgRac9er;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O07t6f9G;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D11606A326
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2D11606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YgRac9er;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=O07t6f9G
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ED6FD1400307
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:52:05 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 25 Nov 2026 02:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1795593122;
	 x=1795679522; bh=019GwQ/x81qxKZSVVtOD2YBAp3ZMp6lcDwLA7mJ+Cik=; b=
	YgRac9erSiU61TQkYI1ioth44/P9sRSYS/JW/avtEZH6YizQVW6zqmb6qgIoKqWS
	FUUwRKJbq0dQjI89eEmi2pSqwB1ev0dPtd/7ipWWkV4Hv+GgXcBD3ySkEY67BJzM
	PjQFocAes++UO3gJxE5Roe8e5iGiFRuWCVnByrCCzoNTM+bS5mwt99bNGbKYT1Bl
	WU8WLAqcWCQx2nuo8Fr4tIBf3B5BUDyKXzvrRMr77gW7Ny/mLbK3cXMOEmTaW+Qx
	fRlfI2NrD0Y++hRymdi6fCrHL9/32syp9/AHXRj42gpSOnid5iDwRKXUynVd1JiW
	mNgp6movnOu0e5DarJtrlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795593122; x=
	1795679522; bh=019GwQ/x81qxKZSVVtOD2YBAp3ZMp6lcDwLA7mJ+Cik=; b=O
	07t6f9GUgtUCqNna1FBptHE2tdnqLC72ZE/7S59RNyRJtM0FQRUZwPPBjlOvSSyZ
	eqqICSgD2eJ13lJYQgbdL0AmeAN5CqFiUPjwWEDPDeUQKtJjVfBCD6NzPyRF6Y9E
	JxUHxxwlqfdq5kGuyrQHN2VpVB0YCJR0/Wh2J6m5DAZd6kJJ5tc9uLLKHoNE8jmb
	bY2ndqTIo5U6YakL6aCDtK9ef6sp+8gL8nzo10ywa+B/xgSmUyifziVM4PPRNHnN
	ictv367qm1k9TrVYxjbWDHTQ16+hlL24ntoc0znlmZGu/WHzcJ5NbZA6ocpTihB/
	vF28GV5YJP5dULrO5q/QQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795593122; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:R3glRqiwLQQfxEucCaHvm2YKeygkNzv29QImVDBkFJd09mt
	uoUwIqGfeGKZOore5NLI8g8phTI6cVFee4AXKsbAOBQdDg4kot7OUsiuLVoJNOlR
	1elNRQbBqfv6bSBgkuUDNS1rlChsxzopXeBS9oYk09y58TpS+Wffzin3pvJaEgJT
	x5b/aX7BND4yMPeio7Qn+rwgdq+lGy98858SMtjjoEJsqLTaoMnA1SQhEt7YteEz
	ap8hLuIIVMzDb2gtm9ORTcB9KGqg4wsOVSmsf3J/N/GzjDdZwhzvKpSCspp8GH/q
	L91jEI9L4fgWFTDwo0WmL5czLsHm0tKc+RvvXSg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aSFAEiZCTpRiW+Wu1woG8Vz1ZQwpvzDxc2eGNqTlgrY=:vpzV28ZJxRuQUL4xVOIgcB5rr6QBx9o4DSwGH3trdVo=;
X-ME-Sender: <xms:n5MGa_its0_6WpEfVmkP8nUkELi5X7lOCVEVLb-9RvGIjtXW_BvPWA>
    <xme:n5MGa222_Kl_p6ZWq5DFXxZ1olzbryv-uHQyHqqEiQzJYBC1Z6Ybgkwr6LtF5a9sD
    0SEDnF38i8cV26a2Czauhu3Zn_M3j_TI97drGA9qgOTAOHC18AagMAC>
X-ME-Proxy-Cause: dmFkZTEZGMjBJZt1uWfkWP6nvt4pWCnopsg+g8jDAdQavJeS2L2MwltpTlwNaEd8djtHKn
    EPizddLB0fSbdLPaJXfL7ISnFQ1pA7d3q5xXjlkKF7Llg1RwP63kPcq0bI3SJaaGtsYfUM
    gGjOAMhxF1D//iqBwYraoqBzGajUVgZp3yCUIaTksE5UyL9pMmgUcyHL3LqjZ21dra+EFI
    TAy0zbgO0K7vfZ8Hct71arlCzW4J/YEmPJ6Dnl95xYkw0QhXDSpkudPc5Y9VXyic7+9pAN
    ximDmVNWXRqAzamP6dwkNrFM7nu1F9pqX22e3CFb5mk+WWWg3//eiPy7g2RkhevTNwQUia
    85KxHy17Q9kE3c0+N0DVqR64pqIBOD3atDXgk9TbJ+i01Nap+C/J1N006rWkFj9IE3Lju1
    fTSX8tEu7+kpTO5vuH98xqQ0egpd7CvdzszNDX3e9OVABgEBb7IxZEzDVYIxm6LlbrmDBQ
    GeEOjj4/Bm70q9bfMm56k88nZv5Q350CNnIE3eOHbHrL+7ShQVVzwMg7HXBs1fv1INguEw
    tqsrDwly4idlE5qP1w/PsAaePb3xdDGuqqurHaelJ0sfjyCcXsDbzmVpH9tfQPezIrkCo2
    W4Axz5JTf8+nRZ9HOEPtPANb9047WcwGN1oHwpchW1Bo17ShzqHqWvqPvtTQ
X-ME-Proxy: <xmx:oJMGa53x4IFkgjCIN5aU2Y9IKKjuCVKzWVl__moxFdRA-MkUCCzcZw>
    <xmx:oJMGa6ELf73cxEYdK1hIxGRzKxy3lACevEvI6mchurc13tFj1dXP7w>
    <xmx:oJMGawgoNVKqvEJOmvssjpIObYUWCcCRRw2PhFMjcVxahJ4kK2DJvw>
    <xmx:oJMGa1A5sXqUNQxIW1-zqq-kZZ6W5jCV_rFV7bRMqTw3_ev1j5D64Q>
    <xmx:opMGa-Klzxrw27CydToupd8Jqjm7Xmi2dpSG3veRuZmk557St_3kgZ2o>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4314F32A009C; Wed, 25 Nov 2026 02:51:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AdoFu5rB1Sng
Date: Wed, 25 Nov 2026 08:51:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Brad Hawthorne" <brad@sim.vu>, "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org
Cc: "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <92686f21-9c49-4cdd-ba39-25c163fa3183@app.fastmail.com>
In-Reply-To: <20261125025650.1159785-1-brad@sim.vu>
References: <20261125025650.1159785-1-brad@sim.vu>
Subject: Re: [PATCH] ARM: xip: end _etext before the read-only data
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 03:56, Brad Hawthorne wrote:
> The XIP linker script sets _etext after the read-only data, while
> vmlinux.lds.S sets it at the end of the text. Hardened usercopy
> refuses any copy to user space from _stext to _etext, so with
> XIP_KERNEL=y and HARDENED_USERCOPY=y, copying a const string from
> .rodata to user space ends in BUG(). The first readdir() of /dev is
> enough:
>
>   usercopy: Kernel memory exposure attempt detected from kernel text 
> (offset 2955300, size 1)!
>    __check_object_size from filldir+0xd6/0xfc
>    filldir from dir_emit_dots+0x34/0x80
>
> Commit 14c4a533e099 ("ARM: 8583/1: mm: fix location of _etext") moved
> _etext in vmlinux.lds.S for the same reason; the XIP script was
> missed. Set _etext at the end of the text there too.
>
> Tested under QEMU (mps2-an385) and on an RP2350 board, both XIP: the
> BUG is gone and directories list normally.
>
> This patch was written with an AI coding assistant (Claude Opus 5.5,
> Anthropic): it found the cause of the usercopy report, wrote the fix
> and this changelog, and ran the QEMU and board tests; I reviewed the
> reasoning and the test results.
>
> Fixes: dfd45b6103c9 ("ARM: uaccess: Enable hardened usercopy")
> Cc: stable@vger.kernel.org
> Signed-off-by: Brad Hawthorne <brad@sim.vu>

Looks good to me,

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
