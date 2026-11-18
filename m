Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794978844;
	b=1ACiQ0ws8KaR9XK1cNKBpbSHBkmKY7B6u81kyYKuiV5cL2Kdj693XyL/ciZM6w4mEIKD
	 L1Fjgs8G8R/jHMR0rxTSYsK3n870YrEo9zKYR2QmyUaTutMwZhURryZqP8E4224VwKwYm
	 Fxe+xXyEM8z+Rlc03EPWtg3DX85LQAVvwgduDplB1/ztKzU+pxeQZj5YU3FG3HuXqCzjH
	 pYv51Gy5oGdEFslBwonKoQaVFJkBWPTKU7qdLvFRnvoVUBLBcpqi/R9ppD0V0XHZyIl4E
	 XsQSO8u8LN0BqtGcfvdLNyNQJM1N6knE7z/MSBKWl/SUT7+UlnnHI9dzfchapufzw5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794978844;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=+W/ni9L0RBizArBj6WZVfrSfA+j0sVZBhYaquLUBeLw=;
	b=2kA5EZ4xgM7ym7Ya7+pHQiFJIBi01q6Wh6M40xOzx0nIzbCYf8pz9brT60LMQq2a5wYI
	 c3YDkDTb/mJ8kdqXE06eJ6Qc8SnN6uBV4+f6uWpCuQbkIHnZpjmVRFNqTVLmtdcoTgMeS
	 K9w3NsBxbG9T1bNWefjQiQcRYOdYZxOK64dVlSYUc0DWVzu78tUVtJ2+zc7vu6wAZcQQx
	 hNVGqjhpaG5pyIrbiHxsfIKCE+grBNNjMnccpj2dzEAELeRq4YrN3DNMz6Ep0ELfzFCbC
	 HoZy95aZdYl8UZkdyYqEAnPW4J0qvm8aT69Fdjpsz1kGAAIb3DA7yz8ArNMt4gf77SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=timdoug.com;
	spf=pass smtp.mailfrom=timdoug.com;
	dkim=pass header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=hLS27fB3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1cJGVGbQ;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6783606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 05:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6783606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=timdoug.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timdoug.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=timdoug.com header.i=@timdoug.com header.a=rsa-sha256 header.s=fm3 header.b=hLS27fB3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=1cJGVGbQ
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A81791400197
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:14:02 -0500 (EST)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 00:14:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timdoug.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1794978841;
	 x=1795065241; bh=+W/ni9L0RBizArBj6WZVfrSfA+j0sVZBhYaquLUBeLw=; b=
	hLS27fB3KFDyf2i8lBu77JC5NcrNOt4QWttWBCXwjuMNP3aw5IdVkCGCVBB2H5gg
	YD5ndgPz3BYzPDB3d/OkPmyQC+9u5YvZB/UbEsABY6dDAWp9UC4JCZ4EIW/+FlMk
	iXShhTiiral3oiTVnH1oHGTPCXj01VPGkC0/RfKxhRz1eqC9AfLQa5aGoptzXFh2
	1xhI7gWd2KimRiCId/3L3YJkyUR+VYf34ICNSa6bs+gshWEiyk/lGhHDwDbovKPr
	E2q16SxMU+YOxrhwfzjtj/nvBtkP0xv/M6XnjcmQY/tm41hJAmTTRXWHQTNpMdU2
	B+wIP0Iyzv4/tCT0VbpKpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794978841; x=
	1795065241; bh=+W/ni9L0RBizArBj6WZVfrSfA+j0sVZBhYaquLUBeLw=; b=1
	cJGVGbQYAB/u+yaQJUOPo0Ae1OyE0lu2WF0uLgo9/vhpJlN8RNFuw67aPr9fKA+V
	QQYouDLdOSJqMWK3v/H9RCNe/jVKI2nmznX9NP4Zq9hCDSiffQbF9mc6WAsVgsdo
	1KWrWDHFiE22ZHoI5SdTO4TVcBOOh5VoiMNuuzxTOLTlau8D0AxMJ/wUkGADwMC/
	r9Dju3seia/7+/nfe6hpscownJP70t5sU4JnkVjl9g3uVy4L99txAZGPbAc8NLcK
	jPyGhFCchTpwJPpvI2j6RlNOOpVOfkh97yfP/BR7rnCnevS0daB7L3/o1fDZ2kBE
	XqRerlx+nRrhjF0sFP4xQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=timdoug.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794978841; d=timdoug.com;
	mf=PG1lQHRpbWRvdWcuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:TCxHVzyBCo4oayZpANiF3eHx94fQqGAX2QOdRVXGlI0nmcC
	6qyOK2D/9P2mce4ljkuOua1X5MomyPzdRPTeN4PlaH5HdwUYORU5j3qb9WKlFTfC
	laje1pO5DMhY2EpMi2deQXjTtsoabb1l0oy+JaKfr+nCbY9Eaqv++bJrEUBxI3dx
	Y/2e5ThYqRX1DOA6AyNSju712WiKuQPCkCrOOhH37FTn8oUzBM5uhoI5LSzSaixs
	XARB+5hFwDHSkWqSMQHfhz65Bzr8zZupGbytg1XZo2azVszbc7Ixrv9SV3eYD+P2
	v6y6f+t8spvIdO/Cu8jnnvyS9dTQmupKNMs9zMg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:zPhCh9cRt9n1329fKxc92DFlpza0jyPGqzGUOnafzxQ=:+W/ni9L0RBizArBj6WZVfrSfA+j0sVZBhYaquLUBeLw=;
X-ME-Sender: <xms:GTT9akwUwUuUJFuVmiByo8aePz7fJdTUkHueTdBZFDeYUFI110iW5Q>
    <xme:GTT9ajHAEDP0bSicI_-v37pqyVypuyjcL7bphVdFZMg8-3qZIVAG3nfkyWayvg-lt
    heWGci-63EHDr-kGJiF2qtzs-R7YoNcBGoZGk7oVqrZJgdZiIZ5bA>
X-ME-Proxy-Cause: dmFkZTG3+SfvxaV0VpNohAinF1ZSequkxKFmnQqZ/6qU3k6uLmRRUbQqVaAAW7ysf/k2Hh
    0tHliQyqZ3FRwCQpEXQYLIj+R2O4b1bNMOJhwwOZ5ZeCkxvDTJO5d+J9mSo4tBLp5C2yn4
    9WNoD+H5v5/JlATc32KLoFybqbJeRWR/N2P8x+6bXrBeg8CZAD1sDDp2PFp4G3GKl8deb4
    JQshhXXRs9ZC7HbOq2WWgN4cDpVP6lGt091Tkdv8vgGf8w11H3z2AEwedDIx0sAhIeKjwr
    tYmRG+2Sf4xwArjcaoMNfIcrCOLt1GEBrolX6gK04TfgfpY0nqMng/662nGIM6I4/maWAd
    ZIGs/tkPRyF8wTaAUgMFkMsHyhEuQZh5j7756f3jmnASRz8++Xb5wOV91o+qw/+BYAAf0s
    7q4JeHKQRCU+7UNN3qncwkokjGtNH9+k0Z/Ovhhejwz4CwfqRVh9IYk3Ro6BT/vYeMF49W
    jAuWl6et0vusdjYKeIzkmCEfj66DnSD0kQ9n5SO4bb7fbfat2rdWlFcR+fndQ9AF4n417N
    +RoQSMmONaiBj4XosggrebEjjssDOQduij7P2fKUOKa56mr+5PnRkY9+BM7zX7FjfMHAuP
    Pye4zdk/yoFd0Ayx0GzTT1kI7o7CwgkSR0r7cq1vcyWbX4BappykWAbBoHsQ
X-ME-Proxy: <xmx:GTT9an9kSspLjrn8lhDaT2f4foHbu8Itip9vxJbK0cX9zZw_L-q50g>
    <xmx:GTT9aso9B8P83_N7BBmk5TZ6XcBc2aVVC1RY1EHHoqf9PVuO3fOJmw>
    <xmx:GTT9agkTCgSO6sgGnOc02zcGAB8HV0I4gvXykGocjvJw_OJ8KIZTQg>
    <xmx:GTT9ajhyIRdU6SxVAx0kXeOTUXXURkTtkQQvfhKsWwze6-4XPLb1rA>
    <xmx:GTT9agvxtZFvqKZOF9xchXm3y5H6sZxkOQeV3TsK4belwlt8pChm0yf_>
Feedback-ID: i12bc4175:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 11E2EF60084; Wed, 18 Nov 2026 00:14:01 -0500 (EST)
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
X-ThreadId: A1SLg5mlGAe3
Date: Wed, 18 Nov 2026 00:13:40 -0500
From: "Tim Douglas" <me@timdoug.com>
To: "Finn Thain" <fthain@linux-m68k.org>
Cc: mkp@kernel.org, James.Bottomley@hansenpartnership.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <322e7882-b45a-4503-a1a2-7926f1722889@app.fastmail.com>
In-Reply-To: <ee193416-6116-7656-e984-5a556490997e@linux-m68k.org>
References: <20261118003746.61659-1-me@timdoug.com>
 <ee193416-6116-7656-e984-5a556490997e@linux-m68k.org>
Subject: Re: [PATCH] scsi: esp_scsi: report the residual byte count
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026, at 11:11 PM, Finn Thain wrote:
> Regarding that front-end for the esp_scsi driver, do you think it can=20
> replace the mac53c94 driver? Has your driver been published yet?

Thanks for testing! Probably not. The front end uses PrimeTime
pseudo-DMA like mac_esp, and a replacement for mac53c94 would need
DBDMA support. (The "cordyceps" Performa 52xx/62xx family is a bit of
an odd duck, essentially a PowerPC bolted onto Quadra-style IO.)

The driver is still in my local tree, happy to share the patch if
you=E2=80=99d like to take a look.

-Tim
