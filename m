Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748594;
	b=rGS21MILSCg2TH0RaTka26dWgMpcuuJhkQdLSqzsrGgS26INh4bGJJCFekCUiCNTd3Hq
	 VtQ7XAn3aDr74or1gqngNqbdjzCG7hcau1hAOwfqsf7f8gRZ3+pU1Oln9RscrPsFtCu3I
	 PRd/CU0oIneUBZxInUIOsQFLSbsiGFEHZayzFkSJuuZdAgT7YXl8K+iZAeeoliIKXJR5L
	 RdU1BMkEXRnZsWlGX9oyUIcNiBPJDS699DvzeJCtCzLQD7RwOq6QXIff0lYjGVdpg6Q17
	 K1d8gXkaj6t5U3LdPX7eD6YcyB6Icwcl7KyBUtI6VFStcSmG9FHXWDl9lEnmgILROyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748594;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=FBqo3Flow9BgWRpN3dhWd//EyokTFL865YA0BpF89bI=;
	b=nNDPJwF/IJ4mBye+vWBGibOOmkkizGx6pATR1eKBQpnheya304B/1sUUeamEgDKiBcQ+
	 0MNOBrVrwLgDlFw1tfb2X5eEeTVHasUAPP9A+UEf++5fkUAbE2LeEJBrLFt0SoC42eSH4
	 4Ce4scBnvzfbBOAJTjFZMC6QTGoaqI82O6dkFI1Bj1ItDSN77ovFFGbTHOG/18Xyt7WUf
	 hKE9pT/9VZtU4NJf8xFmDKBFaDacMuDN7meH9lmY3yVWCvjeuFeOMI26dBzN8lVT+gY2+
	 Wqfzq4FGBMiw/ziH8dAPlCpL/9InsCN6MVb+/TeHJAHDjkGpB0wUsytTugy9x3wfuOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=flRnwApf;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="k/0MiHmO";
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C4606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 03:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B54C4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=flRnwApf;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=k/0MiHmO
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 05B197A054B
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 22:03:13 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 22:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795748592;
	 x=1795834992; bh=FBqo3Flow9BgWRpN3dhWd//EyokTFL865YA0BpF89bI=; b=
	flRnwApfLy5dzupqfhru6Y6p+j59rUkcR2MkC2VJaVOolJ3MMq2FaEydvIYH3fLJ
	TR+cZKlKcjtjA+e3uvJmESgIP3t7UuKwLGiUPx2BzMh4bIR89H8BMg3syQ257BVP
	LAZg6eQfezzBgOhb3lDPcxR1YujwxtB4S4lTtrYw19DyVyOC5t3hLJ9YjfZTAZoU
	TH4x/g3B+QZvsJEbZCm+KobVC1PV6apMRptHdeq+eMOE1Bd2v1uaVUcKuHPig9A3
	22KUJls3AwshT5k8FgRneBOPvwgMI7umSzWtMS57Xl5Z9v5/wtGjjP6sNFasNRNu
	JX5hcGXbiWbLXGCXoRCoWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795748592; x=
	1795834992; bh=FBqo3Flow9BgWRpN3dhWd//EyokTFL865YA0BpF89bI=; b=k
	/0MiHmOoRZaULlK4AE7tQmrAMmOZasjH4PA7aqqqQH/OGqezcqneHhAxhJlPdXJC
	LO7S69EBsBCGl9W4phe5xuXBAaxt7KUX1LqUEFiycdyuD0Ir3KZIaS9Gx694Msul
	NZu+CPzJycklSdG8grkjAUR1Kiwv0hfLsGb838pyl64M1Sh0ew51MbRPZ74n1R8x
	mRUTGjBhcoi7RAmDP1Brx54aXZS9wv8c+B5TU7bK1QlF3CN5mgtjw5zKaUjE9uWu
	oJ5XLeUntRll/VO4PxepbysH9m3msmGJ0oBVJzhOSWf2OOlgJioT9mx+mzrFys21
	nJINq5LZ70LZZK7VZXilw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795748592; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:DkGW3FNRUJgJbi17+VNfu39tVeM9SvvLmcERP9kNEhzgoix
	L5qC7W/8k9eF+nQqN42AWodk0dB8Nm2UGgyNvRs1lT8M6wrTXWEBUGuUT32Ef+3E
	LfWEWBy97oBBTeqJ45l+DEErQf+7+YLDwJuFU/X0FyLzbLZjTmd9opbCobbOAkBz
	A+gWf9/12efAKQEb9Woqtg9xWx5jXbCi1hvyEBnzzFoJulpxAIeRHnfVELz1U957
	58SskNxKz7d0sFDCQJyV6uxLVLI+tnaPj70tPN6n5XK5I59iAO8rIKLyXHh31oJa
	VdYMwuuwDP84rmoGLI7poSj1DfjQPO6jHb6iFmg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:YQFJ3UQc98QcOcovphtGcTL00gVpnzoEwcC/a7VIL1U=:Me7gqOg8byBDYer1Ls67fIRqKG8HSM4S3Z92veK9bHs=;
X-ME-Sender: <xms:8PIIa86j4YHHcX8LqUyiFuiGthKmc4I28x46nkqvJC9gisrcevLYhw>
    <xme:8PIIa4umtIeR9EDuJjig4yhrBprBWXJ-oYUVJUaNW445vgGDOV-GFFGb9sGoGdv7w
    6KJ9FBhTeYUA7qdfuEvbNR3kA2Y3C1y_hLApyJRITpYit2EtKBZ2CAa>
X-ME-Proxy-Cause: dmFkZTGeNU4s2ltmy0/JStbItP0zFxqukrbljaR7Gd2quVcy8hG0PvjvSgVB2pVt+U7a96
    LKbXKcmYTNeOhheRUl9e9cYsYsHGrzkjUVLAkypMeA/tGbwlr5OEqvLNDJW49G9cyuTaD3
    J0JaRfpso/kA+/rpoBd6tPnGVdPtQzwcRjiDVcVGVYRXNwdzFnVMIdqE0+/fjJ30j7Gxbt
    MbDXqyHSQsSEsfqFm1TNR+AlYgiLZ4l1aYFlhs7cApvSBLPK8MGp3q2FS0mm1I3NuY4bOk
    22LrZ4Fj5WyXWOrzQaIgeu8S+PA0NmWeR/1xm6PN/RuqMpCGVY29u7y9AdgqDmc7GhQRRd
    Hcbl7VtSb9UG/Hctxe8KVM0a5w2DDH8v3Q7XGKB53n4emFlxl9Dy0w2HSTjMo6kzo5eiOy
    Kxq4SnPEJhaL73/XBDrNVP3saulzDmSB1H3h6rC0WxlFYzFC/h9cnGS3qGjjMa96whfpkr
    RjTUunTspWXwH+HoepNL0F2NJ1nZQ4ydDVhwli/YlvC3wKwiBKSQDvSHIB1ThCwxDo8/l+
    eKJUzvdjHNSPce9MD7vtijk320xN+vqQcp2etc3qaK6/a3gDTCQ49ttqmf733BAaLYVYy0
    7jUsDtiH27dhpeTSJ+FZkTXNLAIl5MB9MdnxaKwGAiRll26IC6fWeQeaPQiw
X-ME-Proxy: <xmx:8PIIa9kgGMj2IB7AO1CpNDfGBKBJa29P2-mNH0unbfKorj5Rt6AvlQ>
    <xmx:8PIIa-1p1y4U25FVfIhw71Bp91t0utvcy5OTCxIZ-plzbR4ytF5EQg>
    <xmx:8PIIa-dwHzsWr7rIhMJq9lrs7DQbn3MngyQf69zvJ-q5KGTKs6NyPg>
    <xmx:8PIIawatOJW0bcM-5AVW_whI6cfgcdHL4gfLTvu1tW06z2sAu6Fx0w>
    <xmx:8PIIa3iF_iRZVtmiL4qFdoFglAIPLLjHGxn6y8enHk-ashg_L6F4u-xC>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 87C7D2C00085; Thu, 26 Nov 2026 22:03:12 -0500 (EST)
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
X-ThreadId: A3oaNUYVHPkg
Date: Thu, 26 Nov 2026 22:02:52 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <7da7d3df-84a2-494a-bdd2-539b4b0b9387@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-7-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-7-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 7/8] platform/x86: thinkpad_acpi: remove unused hotkey_poll_active
 flag
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> Drop the unused hotkey_poll_active bitfield from tp_features, which has
> never been referenced since it was introduced.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 0ebaea0ab96b..898d919d697a 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -377,7 +377,6 @@ static struct {
>  	u32 mixer_no_level_control:1;
>  	u32 battery_force_primary:1;
>  	u32 platform_drv_registered:1;
> -	u32 hotkey_poll_active:1;
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
>  	u32 trackpoint_doubletap_enable:1;
>
> -- 
> 2.56.1.839.g22a8290db9-goog

Looks good.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
