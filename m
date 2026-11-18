Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016643;
	b=gpp4rNeEfastVkF2XG1OV7G1ACaTG3e6zdLH6uoLFCUqFjvf9i+0J65B4zQQrdugQaY3
	 zamUO1kSXEWePm6Szuxua64KuYHW8OYeU+NBH98d32YsCrupkhG8xDla4LD7x74Txvvdz
	 HLfjy+SKe3ZupsOoXA1fsXHghc8AmfmKjYEjYYhxukaEuAfvaCMdr8RxA17SrTnt5Qc/I
	 h1s9akAOB2XA7iJErY2NMmtym3RPxejWb/iiwOUTvoRyihmNXyjBeBTZxN8LGJRVX9KIM
	 gxEOXSv/pFjG2rYqhXeVtLXL4P6mR7Ljm2ZcQvBsw1rqo7dBax62ApYwvPsNFmkguHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016643;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=2KZXnkNfCltL6Moc4oPNbXGMPcQsDQhA/ArB9jtZRKw=;
	b=YPdMl1KHqfmrfQ6gQsJSTs+7FbNH70mCY6OInPdkauizTBj/zYbJT7OExn1H1QhQP6St
	 kvv/Za4iiBp4Zl0hIGsD5K1mySPAGbDxg6TIDchP16uLYwjR8GMMFkLtQ1A+KxedKo6SL
	 jyc873H5HhHFXyLvBciwBz0+MDLW9xZfA5Mqhebp9z2lh2vfqj4+EZKKjZMSt0a7z8dZe
	 3yM+RHAojKCWas9sOGC4GsqMK94db29UfeerDUxwsOkthAnDTKeMR6HgYiWAL0HdX19HB
	 gpVVNmVipK6atU0P0yJLvToE5tClpsYUwI+NMZTmac1btE5Oo2lY3/MKToTuIBeI7Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=LZyWxPyc;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="TUHhzL/7";
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A438D606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A438D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=LZyWxPyc;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=TUHhzL/7
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DCAF67A02AB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:44:01 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 10:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795016641;
	 x=1795103041; bh=2KZXnkNfCltL6Moc4oPNbXGMPcQsDQhA/ArB9jtZRKw=; b=
	LZyWxPyczK70BIo2W6eGvpDZ96SYsB+I1wwol1vt7fr24fYhX7c/q4gdT7YHT1YF
	IHmMMVtIgyFckyUEwgdo/z9qy/pQptOLIK/Xmd+zTvo7OapBtunsYMjhKqH4kTly
	FpB0opcyd4QSO6nmwcBc4TGh/gmwdVOXNqbiW5fLuMPaUskrNU8X7qGA700yFH1D
	F/rVJsMoN1MUXk30xDu0TRuJFxS7FB+eUuXWNO5JLoMEtKGvap8vQziAVvbvhbHk
	0iRzxstlwXn+99MIpLD9MfUwVEdFOq+ZU6weYe2zvDNOSCpq4aK/OSR/XDMURHlF
	hCkNN9t+o7b3XWWRdqbBIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795016641; x=
	1795103041; bh=2KZXnkNfCltL6Moc4oPNbXGMPcQsDQhA/ArB9jtZRKw=; b=T
	UHhzL/7pdOYCOBe3H4vMa0HJSwU3s5bVtcJFZOLbwNmYg0Loni2qqAuxKRr/2AkN
	JGlHOLxQsQXirO7OyHdaHRfz6+aDl0HhXE+v74SFi8ONdrEZw04dmyrxq8/a2plr
	pKCahpQP/Cwtmka3HiSadIiQR22ykCRzElrk1U8htM4gg/vcXDdJ+hiDwXZTVgy1
	NwQnofwXamc2Vc4ztgR3BZP6rjjhgmMfUGH9U0dfbqufJQIJWHUdezItF6nIZGUA
	+yFBk1QwGgjo54xlzHL53h7qI2ZWoHAIvmK0x0vQSveiXqNlTRbxKkEiufwWF5v2
	s8AgdDTQ6Ye/zfIPirIWg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795016641; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:dgmLxG9CdStPYW+sPX81LoxKhm7/h5rHR/Tb2KAHqMT0Kfb
	0uQ8SlDJhrfWNIg16+nl6ON/JLveTeFGzt38IK2Oyjw3eznrfcl1El6h0ZqXdNNY
	k/mp+s6iIqRebesnS2xLww5JjjTTcrlS0lqnHg63vuVCC2gN3oRD2NtgReB9Cy+u
	OwsEJ6zxWzjj5eYpZFS6ROBJDfAodGZZnXdrbT+WYiPr4CKh/OWAErnHz1w7/KkK
	U3tB2sWU1amWgk57EGDu4Xf9p9N06R7KXwRAxjC/4lYs9u/IKzrZuZxfdaElceql
	lThoYVb/Jb1gMctFeJ8bkt5E7oTRkQoN9XaMFug==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NxTdO0H9+a0zvIWI2EKmj+IUIhVFQwjxHd926W7+mbg=:ABFqtTFbwi2DUeOOrdztNN9j0zg05RHHqN9y5SbLcSc=;
X-ME-Sender: <xms:wcf9ap2RCODtgnauEQXfhIEXYvODBVrYICdQUJhx2YAjh5A7YF6Ypw>
    <xme:wcf9aq7hw1SvggDJXrRUypouhI4XwnDHF3bmrvZO1PPTFGkQZsR22yIk9ECDbZvCo
    y0-m3UnHuOcJdUgI-SAFBSTTTP51zCwr7Fovw7BhqttC_w-gnQRa9ja>
X-ME-Proxy-Cause: dmFkZTEd/ThqfEfmNprrF9n3ouyy2yi7XElNsFtTWoPkXlxEdearKZlSQBLdbdnX/jPG/l
    EuvqlvsQAoVGKXpxek8kr+FahT5iXzDNkbBIzLA4NLHHMH8JwCJC4/xEzaD3Vf2NR7WUDt
    nOsubDjbo9qg2KDVTchOB5TrCz9hLMO5i/rVFZ0eZ0yxttOc38S3kZp8w7wYu5JMhg4Sl6
    oqKcAFUx4NQiyeYrHdT+Y3NxgUVzESilYFUGhmYRRRezh2zmCYvn4yFR4S5Ml/V9GdbdH+
    xxpAceR7NcD/wOsqePhv7qPkfymlOjDcimc4a+MJ4zjSqXeH1a6EB8z8rMJViKxxq7YPti
    JUvcI0qXS+Vjfg0j/qPZTMCl8ewtxYywJZfQuxH3NNPe174QEMzbQW/ow9qnx+JByUTNIa
    wgAfS68CZ/CLZwSAmfN/RB5h/oQ8F3FlfKmbh+BSnbP5Z9JpmirUebMrlZATLAor17TSGF
    9rOUxRih/iLpt9j/qm1ns6WE+FdhJz7veGyvv4gwGWp1UqPWJBDDr0jew8c9UsDxIISs8g
    9Ir6Ti7D6hEGzG0QZiiJf63/JrGG45Q//g/Iy5F+WiyZ2mP6J3RUw+NAiD+ZvDCCBkkCf1
    45EfIE8kFxgJuSpxca/eShG224S21iZ1u1YmscsxpErTktk6nO0C74Bn+rbQ
X-ME-Proxy: <xmx:wcf9auX4XiO6s58n5n80nfRrCC5jdT_2s6mHeY9dvOm7mdHP-DyeqQ>
    <xmx:wcf9aljWWftSjtERltT5ZItBfNB3qmTgspWj1b448DW2vLeQveHhvA>
    <xmx:wcf9ahbK-7Khg2dlSNSwtmCXF3F12aJI5XGvZT9bIbSjkjVc6_YqmQ>
    <xmx:wcf9aqrT2ssZRTV40wzRXOZTQC9FZIug3o0xYzuBIy517tE_4Z9oaA>
    <xmx:wcf9amIG5cyoG9HtlsulgdDT2__5s7zOvA4vV4wJrYgbuUOmf7xfn7Q3>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id E2DD02C00085; Wed, 18 Nov 2026 10:44:00 -0500 (EST)
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
X-ThreadId: A5c9k4FhzC7c
Date: Wed, 18 Nov 2026 10:43:40 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Rafael J Wysocki" <rafael.j.wysocki@intel.com>,
 "Mario Limonciello" <superm1@kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>
Message-Id: <6dae8141-cd07-4c4c-a432-f5e84e5b6821@app.fastmail.com>
In-Reply-To: <20261118110255.2946563-1-daniel.lezcano@oss.qualcomm.com>
References: <20261118110255.2946563-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: [PATCH] platform profile: Restrict the core prompt to COMPILE_TEST
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 18, 2026, at 6:02 AM, Daniel Lezcano wrote:
> All platform profile providers select PLATFORM_PROFILE, so users do not
> need to enable the core explicitly.
>
> Only show its prompt when COMPILE_TEST is enabled. This avoids exposing
> the option in normal configurations while allowing the architecture-independent
> core to be build-tested without a provider.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/platform/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 7270f24a3b6e..1cf87904afc3 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config PLATFORM_PROFILE
> -	tristate "Platform profile support"
> +	tristate "Platform profile support" if COMPILE_TEST
>  	help
>  	  Provide a common sysfs interface for selecting platform power,
>  	  performance and cooling profiles. Platform-specific provider drivers
> -- 
> 2.43.0
Looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
