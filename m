Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424566;
	b=dXhv/tTY2JHbJkyfq9qOHvAUljDM3QCO4jYqRfcXZUx1JBEX4QTRVmrDv+517/1hMCyv
	 kmJUucDCJhwGvsSdZ5VWrarM9FT0tezeXNEOH4uZdv9Jl0RLZ0Oj7nrztJ8m6VjuYAO2n
	 1vB7p7/5PhYOFL8j2m2CyQJpwfIeNHt1jVBaYtJwIgCtWg8576IcENrS+Fa8L5uhr03cN
	 P4q+J9SQWU4c6Cif97uWoUOeO8qHqYswKAc3QfJkojkc7gUBS1GoTCuD12X1U3hr71/Z8
	 CYeXxkt3pB8RxPiq0ZFTT80yXUvszQT0VoLSEN+VcVGAJ++dCBxJXB8CEa/NOC7RNow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424566;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=mSMHW4SmZ7OYr+vBAy7Z/uvi3mUnomgOnauIX7oa3es=;
	b=UMA5KJXxQF9y5bVh+rCLu5SQajhduX9SZZGJloVbwasxFy7F1jGua/SEUiR/HM5qGv7w
	 Z9rLC7SYQbKdkqzdmjSfShjj3xKHupatinYERpE7g7x8aXdyfjzrSyX2CYj6o4JY/Y9Ry
	 +wn7p6zDTOyzibwBVSuzcSRGfIy8BL8YD5CeGlv8Hj43wIN4/1KYkssKXPOpQ/315FUIi
	 C0sr8KVYxPz0iuKivBoNwrkFlwBoSqI01zoIEc/BiL4rdMiZN5iv7TYe3edMctPF52hNq
	 Nv1r7zAKxM3QeOMCROhXmbRBhypIfF2rNiyl33J22uvpV3GGJLXfCXHQyExRSMhe0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=fpxlC60b;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4MkzlCSf;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E9F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=fpxlC60b;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4MkzlCSf
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 73FE81400225
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:02:44 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 23 Nov 2026 04:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795424562;
	 x=1795510962; bh=mSMHW4SmZ7OYr+vBAy7Z/uvi3mUnomgOnauIX7oa3es=; b=
	fpxlC60bM6d+JfyxhTLEzy0J2w82OoNEjAhij7fAfezI05lGutEljsMTcwKO2VjZ
	Q+d3h0FtJbom2lLxYhTs/3vNwko/hBKxLSWvtW4In7hc9oFVRBg2ThIQ9wHKQnKU
	cAJPBvxMtl6LVSfEij94+l8tlVRhJZILs8P1XQ5aVFDX6l6eY6wAjDlG6sVOpk/h
	aKEFd6CGChKK8TqN+3JaUmCsKYWGA8Wk2KcRfv6Yyjw7HeKg0tGNWbeYh8UGMH+w
	kmgFlASoXWakyk6MIJ4ikXMNlpuSXAIld0PHfd8MD6jrd7/9mRGwNuBEnvCdfbg5
	Lju6tOnMr3Jevf8q89RRDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795424562; x=
	1795510962; bh=mSMHW4SmZ7OYr+vBAy7Z/uvi3mUnomgOnauIX7oa3es=; b=4
	MkzlCSfhwa1uB9QClYolpD7GussMQue68b+1FvyoDyyPXi9/WbU9HuErLnp94iPO
	u4KPSoAjzG0tDvI7I94wm9XXNG7R4pDciPQ4LDEnC0XQkCqlwUvDmqXIYyH+/1uN
	f/9AaHCsCkZruiPl1B4Lqs6Re5yFlad/H3i/A7orewTd/NtnYzcoptGIt3//YvGM
	KLNAVMONmpvZj2d7JiiOSpDy/r7Uw2zesJvGR/8J9kZBalmkorWDAEahH+QEu+Pd
	cJtnywJIx95u63j5bpBVRi0kWtLxwZ5SWoGL/VH6GmKORXR1DuTZZGszSP728g9z
	dZGB0x5Xfuw3JKx2StO3w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795424562; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:c9BizuFYRsT2DbAYQCfczONqjLvuN4yuiGNs4S48UxaM9oz
	FVc1RDDzvOOer3SJrfsMjg6b5KYWmdpTdp1dtZqCv+kVAkHVyxJVpHyFqoRiWHYr
	qPyaqmW6zzFdRnvZmWQKFxcvYnwr1w7+YHoFOtaw7n4bX7KCEiS2DgsvfSVz0RiI
	baXcmTjKFeGQS0B/WVwLZHb2rDPz772+8D4mqq75z0U1I2gZo4sSVC452hCIPMPD
	FST4dAszYC81ZJr8oIDfP5WZuhU7lQQ3f5YbNEPz1mIpfwhFXCtOvbHXLbLCSuUE
	kPyr6Pna4Xl6k0RD8v0S64C4+LiptrTUa9ypzYA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tmvIL/cahxEGzpB6SnMH6xFzrQqc+W+Phe/Jt9mB6VQ=:7qk2guwvbFcpSziYnVgksq9uHBCrUvs17Vv8cIfjMUk=;
X-ME-Sender: <xms:LwEEa0LA4UbHIUGPBftaT23VpD8V3IZts_k4uNWFIonSwe3zzsCc3Q>
    <xme:LwEEa-_7QFXV03S3sNVlKMlduOEUiBTd-w-uMLwPmnIBH25QKgn5Pxu3QIwCi5Kyf
    xes0267U1_RXfz5yfOaOTSlhbOX9Ln18YmiWUZGVXiQIjXXz3nL_Ccf>
X-ME-Proxy-Cause: dmFkZTE9Y3bDyglrTkB27cTrD9anESzEMkv2GhLbk9MHV7VdB19BLh3aknxC8pv/OdT0OO
    13hymE4x0RdBa5v+V5RCo0yMGUpzt9F/qDF3NZJqw2MaE6jqmcQzg0eV2s7or+C1wsojf/
    sWfzHbrqscDbDJ1U55BDcx2bmx4OK6L4AMmt0jgq25z7ncnkK3LD+yhe6e5TgJEtoGfJYi
    08ByI6j5c3uoEM2+qTpW1HUZ3ZeshsCNXR6lFgU931+f6qEBHls58W0AEce3/fTcRIcZq6
    nqiyeVA29+RNZyMXzSEj8qgVYDLaXR8k3quLuO7bXzsEGfAbAZiIrR8e6lwzwwVL/pY/EC
    de8Rbs5qrJbdz7TUsow12VuQihh9nTJWMJNJfbIZfh7hl2PA8w7YD0+6/erN5zb+8oUCXj
    cTGEvacABfmp3siPPM07gIWsvoqX4IRo59tIlNJzrSIgqIp+pb+WDQf1jfU9Ovrjc5vSvn
    Vmwx/+ue74p+1REUDJ7tIQcLRZ0IxqPMNeEHVQqwh4icDMF/oS7gOYGuFkRrzmVbb7uGnb
    uqwG3JH0V2krDmrG3l3bRtjehOwgezpLwiMpuQS788fTUWXA0x7FO43B8rhqYFWvLRZIuF
    RJSk7c82AA/QpeA4rW9q5pKl2TdK6VOVJzxhbLYJbn5lfublEGxUH6MI02rA
X-ME-Proxy: <xmx:MAEEa2jekWHxIUONRMlo4W2Mg_O_99PuKGJfz1XlAUYAPzAwS1s2_g>
    <xmx:MAEEa09qBifBzy-WvlfkR2UfbrOhEZb1JMVOSHw61w5SEXFQsg_Hzw>
    <xmx:MAEEawZ_g9s9PsIxtitF7WeuUYtKbjb1ZVkZwcNjKqSENNZkQaOgZw>
    <xmx:MAEEaz3UZzFnvNskrMHZN30xmwBI6EkrpINJ3sHgQfJ4Yf0l6cA8rA>
    <xmx:MgEEa1jMiPI1Hk28KL-zwW5wVlzHsd5sOmBQyZPRoc4VsiE6YETYyj9O>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4AB3C32A0099; Mon, 23 Nov 2026 04:02:39 -0500 (EST)
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
X-ThreadId: APJ_bPFyyT9Z
Date: Mon, 23 Nov 2026 10:02:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Vineet Gupta" <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, "Dinh Nguyen" <dinguyen@kernel.org>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>
Message-Id: <65dc77ce-395b-44b9-ad03-601d06c1040a@app.fastmail.com>
In-Reply-To: <20261123000645.2097033-1-vgupta@kernel.org>
References: <20261123000645.2097033-1-vgupta@kernel.org>
Subject: Re: [PATCH v2] ARC: stop linking libgcc
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Nov 23, 2026, at 01:06, Vineet Gupta wrote:
> With the generic lib/ versions of the shift/multiply/compare helpers,
> the 32-bit divide routines (only needed without hardware div/rem) and
> clz/ctz all provided by the kernel, and the 64/64 divide and floating
> point routines gone, nothing in the kernel or modules resolves against
> libgcc any more.
>
> Drop it from the link so that any new dependency on it (e.g. a raw
> 64-bit division instead of div_u64()) shows up as a build failure
> rather than silently pulling in libgcc code.
>
> libgcc elision can break -Os builds as older gcc generate millicode
> thunks: disable them with -mno-millicode.
>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>

Thanks, I have updated the asm-generic tree to use this version now.

     Arnd
