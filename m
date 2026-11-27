Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795747610;
	b=4XBIrBavlH0uwfTmj/Sz/FvJD9XVgIRqe49MvbQImq9VUZ9pNlzuQ+1Y0TJTcGpJCjxp
	 y/0PdqBRZ7DUV9vIU28fQ4zddYOY6umsfPYkt0vTd9TlXZRt3RAGxNabCnFbNkzEkbQNw
	 mx3G/lcycrNjEEBjK8OLZE+sGUmTuRZbRY7OJ123i7DADkuWp5ECZ+pwNOuQSGH1DUHut
	 kv79lanRnW07le8yoLBKptzePgzjVBDdO4TiUo5TXw8SXsk01lU3C7l9vXqblgw/Ehmqn
	 3XYNmltCFc3csk30aI+L29NvdBVaNtQE68jfsvG0bA5Tb3nzWk1p8dpfJ2Gld6Zwl0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795747610;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ihCObR2mra9FuNmfpfhXt4Dermd4tKoKZUNYmDE2jAA=;
	b=FFsD7Asv/25lmqNqrhQPM6MzTtwHa/mgxECKAaTtlmWcV+p1IsCgk8GQ07RW95NMmLwV
	 DO5D4z19OFtQYzvKNIYR2dcnCawnTqh7f9+aL2sBI1xrf/ktoJm+vo1GpY0kKAuHBNkga
	 Co7BWSYJbg3KCI6H57WtMAGMcJFlSskhhZ58Y0VNKagcU2qbD5HL9iM0gMB0ZgqwU8fHS
	 u9rHkBMbYUXYRI+x1Cfrro3jRixzNXL+E4W0NNWLa7wjXBm5+hv0UML2nvdjDbyo5R6O8
	 gJZ3A40AuDOxXmnmupmEh06m+puwUPji5kK5X+Tzo1OxTE1wJw4yKpLCSuAMaFN2J9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XGb8fX86;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BxhspKGA;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3490606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3490606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XGb8fX86;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BxhspKGA
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id F271D1D0054D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 21:46:48 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 21:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795747608;
	 x=1795834008; bh=ihCObR2mra9FuNmfpfhXt4Dermd4tKoKZUNYmDE2jAA=; b=
	XGb8fX86tu/DEPSdzTQel+Acb5q6HLhVCE2FAYfu5qAWebFmaLRt58Dbta5xuvQ0
	BaDIbFBLomiCa6swhJ/4Jx6XYwM+J6i4fvRl1yaeXHq78OwtuCp7UPBcX17Je7Ao
	8qRI/OXbb5xjuOcKfnA34Cx5VZ0q7MtqRXLSdxmtB1IAqG6BRVg1vsA1vLzAhyTZ
	UAfNX162OgcdONB7mxkxSTZQvFW2B2TobyGbCxIxm2XJVboxJRZPNZbcG/S3tRMR
	r9/zE0IHzgcwUc70MruvJy6aec4CpCOvC5DikV0orBMZCmwX5zuWzXmXxZtYnKLF
	T+5yYlDuhBAh3j6mXUwBNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795747608; x=
	1795834008; bh=ihCObR2mra9FuNmfpfhXt4Dermd4tKoKZUNYmDE2jAA=; b=B
	xhspKGA+zLocQrmQuaF6knEaypiBQxUKG7AggvOzfMLP59Mm2PAIZHjHBdwJOPBp
	amEJ1mw4w+QkrKMWqncJHCVOeKWqkr5/dzDG0q9ebdNbsZ5E5uLOvr+5FVNEMNHl
	CeOjhhZD7QjW/L4rrVNe8/+jdbNorvgMHdy2CeDO1FX0dZynQ84Zh/OAv4V/BLwY
	3+fbugJDL0XXPAyJfGxtN0gLBs/9OHdceyxbqUrqGQYa3+t1xDHw6D8KjOM0BJnC
	VfuOINoLwbdaUSiAsWVR5XHUuPuS81RFSM2Diw7gEy1i0EnpLTSPMj1+GSWCbMW0
	ObExafi77bwwJKfcyDNoQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795747608; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:L311Gibi4TI7Zbcndl23u8atRpUyuI3G+4PqvNL8Jl/5KJX
	e//nHeeslg8ci35z7nHji6IB3iKcRgexaB4ssOD9J4jBxagiR6rDzghK/0RkxCzN
	e9s8w1dwRt8JjVXzp6WNoGb0Dxr3NU2avnNAgt0Mbc+UAUy6vhaR3WFgRcQY/977
	lISLJjk1gALLyAunUev08w4BrLfAABHddau6GfyaaRaeeJqt+mWc0Bj82H45yerz
	nqV8nXgKrVbw5J6qKANU3MD07DgBi+T64enalYR8tWMxlWtt9cM5/PDbIIpoS/5P
	GZvH0gS2XeY5B3JcUE/M739Z3aKX1WfirbevLpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:xutYyhZjfCKSrNC6YTROdpPYT7yKFvn7JXXWF+QWwbw=:w1NFlrNXAXbybpbQGmneKBQeYJeZcgm9m5T3o71rdO8=;
X-ME-Sender: <xms:GO8Ia_ZCtii1NiYrw6jDAi21WJb62qj01H9DJir6ODnCnrAVf6rJAQ>
    <xme:GO8Ia5NaGgD0c5tSotGMoIqsEKQKutPfbBKAF8BbN5Srp_L2HxGEk3UpvVAqtXDfl
    UeTlnnEtGXAGRGB3WBSoZ15twESTigzXXJ-MtSbr9Q1ywTnFbM7LkfGUg>
X-ME-Proxy-Cause: dmFkZTGrpnrouRNRyg+zHWV48DwqeDsilOJ8pAFkZiF/8F9UkChqMp7bKskU5dvTMlW2iD
    KuwFMcX/Crmf5vLK+P8Fjo9e8EMaS0xORg/O4BHVHvyWwdiIxMP59Gr0cDsDyrNE6UOTkj
    y3IOLDeO6zngMr4SuEPgwyUkqeM8EH6betbrvegoT4KgSuvmJPHoA6a9rmB8XefXePxkoI
    6LWSOW6HM8PdyDycfRiB23Q689Y9hqHEB+Tp0rCMwvTc5hKrLZvbDADbaiNMUndLQrzt+t
    7Uog3KuOA0bXLYK9Y+WpUzUg8f5ql/kNw/vb8vAA2tiPzg06LGH/ypfhAU7yh77Lk5V1PK
    C6sXMma6idToTXqfuHeRfgzhnyjMOaF9eNqNFOM1kBk3S4oo15w9is9hMOcXnRTzPOlBeH
    6xQgaRUkwqvz+VBC6L5IVHCHQ/M9qUzw/WfF8CNHRUWgjaL8oOzmRQ9b3vS6/FTtqpRUac
    mYXHswLs1LcU2mW1cTva+WWq1Lr5nLudlJ7AMuoyjx0iCCvK1gfOCERPenY0h4vmbIDQe0
    Fruowy4U4sfLGu9vSNVq5Qx3/QMefZqXDQluXKJxOFOzeMb3tIPBrZjqKavdoAKn6WXQ9I
    Q9Aoa/uDZYEGInjZTrRAT047UB/QfDglUjJd/0Ewh1jHIgwPHk2+jtVsDlZg
X-ME-Proxy: <xmx:GO8Ia0GgDtyBfu7AtcqYJKYtdre9LBFpvtMtDUGAzh9YDhYxuuUaUw>
    <xmx:GO8IazUZI8nYpXmOTS2a-HRiB83WZJG_mafz1WKHcpCSIuSUsYjB-Q>
    <xmx:GO8Ia4_CM_NwwhIpf2aFEunNvMKxf-DptfgMLuO6i-E8mfEJwQKmBg>
    <xmx:GO8Ia45hHC6VxZ1_B-Moszwe2tc8OSmpH2ZwMjWlwqK3Hz09FRNQIA>
    <xmx:GO8Ia--MpWvjwCD-lIncbC1tppWOKvRBCsD0MkIAfHWvqVDXaEA-ttqn>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id A8BC22C00085; Thu, 26 Nov 2026 21:46:48 -0500 (EST)
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
X-ThreadId: AbopNpkFqpps
Date: Thu, 26 Nov 2026 21:46:28 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <d396d007-ac7c-4cf4-bdda-03104cee924b@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-2-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-2-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 2/8] platform/x86: thinkpad_acpi: drop dead -ENXIO check in
 hotkey_init()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> hotkey_mask_set() only ever returns 0 or -EIO, never -ENXIO. Simplify
> the error check on its return value in hotkey_init() accordingly.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index a586113ab1a7..659a2c5d1982 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -3572,7 +3572,7 @@ static int __init hotkey_init(struct 
> ibm_init_struct *iibm)
>  				       | hotkey_driver_mask)
>  				      & ~hotkey_source_mask);
>  	}
> -	if (res < 0 && res != -ENXIO) {
> +	if (res) {
>  		hotkey_exit();
>  		return res;
>  	}
>
> -- 
> 2.56.1.839.g22a8290db9-goog

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
