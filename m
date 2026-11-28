Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795833215;
	b=mIPSDNeQ84+TFhzSIlhTZZ+5h6TAx1LKUoPaOZ/siaO2HqCOXXS48rM/lvOBKDv2dj++
	 XXjf5t2/tu8pYfW6xUwtOBV6c5Bq5cUBbnhVssDqRzVObkf8U6o/pWJvzHe5eZbEFbSdF
	 J/rNKjatVGe2V4nGiMtSPMeqfAAXoQGAy8j/N2u5PuLpDDGDhZWG7pnhUL71iJFovz6GQ
	 WpdA7MhMDvb65MuhgYMQk21qBC7cJwm5kN/MPf++gQijHKAvWP157eeEfyqOSbOPx+t1k
	 rCKNhcssTNP3N/drD+Gf1+IUM1a6Pu2CCUl4zG+PrXUXCIgeWiry/Ftl3L98Dl+DlCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795833215;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=PSI/nLFxYSbRJK1yAtZse7jfYwGBG9msuHYmXC1mtEU=;
	b=q/NkttSXR9PZoIbnV53NYE51S1/J7iI31k5wmTf4x8ywhCU9A729yph56VO/J9VDzbkK
	 PaC1Bwm56s9id9JGRDiLN20Fr+crQkkTDH+Sc9MyeganPSNaPKd7X6pZmAAasAQ1RO2AF
	 6kaH+fopVb/LPNpKRoZFn5tosXi8Es6MDRemxLO7nZCI/cBGIIIwb/wAE0O1v5Gu+Hqa8
	 S+k868+s91CBUPIjSE8Ar1oLX4QEEDYQzltSOur7RdeOkXYCGrbWFZbo+OA16qoREBdMT
	 1wSjEoAQoDYEuUheuyIlVXt3woOF9uogZhCLoNiazRHarXxUEnxsSp70h7L87P5HKzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=ZBKidjKx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=t1UIlEgr;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6B1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 02:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=ZBKidjKx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=t1UIlEgr
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6B6D21400354
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:33:33 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Fri, 27 Nov 2026 21:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795833212;
	 x=1795919612; bh=PSI/nLFxYSbRJK1yAtZse7jfYwGBG9msuHYmXC1mtEU=; b=
	ZBKidjKx3eA5G6QgnVFV9Zksi7sopQMXL2Gk2jGqI9MF5I3snhgiReb+SnYl5XnO
	gTvog25zGNKprI15bqB1W9gQC58zAN6bRrvAYMzkbDKIrmbz4GhwEuVIhWJHOMTi
	WrtrXtFL2jSLXh39gHeyC2vv2+oa9cOJKWO4bgI1Gex8dovYHA3O8n+k6Sln4dYf
	Z1cHQnG1avYa68zMMBibE4RgcbbafCgHOZI3yFmB4gTBFKaPg982MvlES6UsK+RM
	8JhvY1QD9uC1GQpH8xExN4L/WVA6whOSEtZS4k1dgMsMNDS8CfrHRPZRfI3aNMcd
	8yi2RdKGrJGiEahrL0ZcWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795833212; x=
	1795919612; bh=PSI/nLFxYSbRJK1yAtZse7jfYwGBG9msuHYmXC1mtEU=; b=t
	1UIlEgrDqT21T+9PAahayLjxx4b97P8TscaYNhb+RVyfJ68P52JFxHvjL2mVTzhW
	yOTF4AWwATuyD9z31kI7aXwumwth32KvGg1CnXWJ3FIcExoAa6FtDO5ykAmz1cis
	laZUgIet2njblZNXZi7Ka1QMqYr4p8E78QtxsFvvuYhaNv+UGDCG3E7PhMHpNUAo
	X68uLsmbbOVNHYbdBYevDUnlXw2j4ozx3Iaq37WhuS97bDGB1U59Kcwu7fESOfTS
	hb4iGR9LudHukSS1ARD5se7A/wzr1tGQYmbbN3U0dfGqWVxLPTUhLILQeDwz+AYX
	J1mpwydfhpwlPGVKnHR9Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795833212; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:AW1gjxbaCd5ZrXgnH5rCIi1Sn7fqoHVcM64sAxpfQjF12K5
	CpxI5WV2H3jj9DeMNDNcKmHsDRu270HDbXfxMLT/2GeIAlBeVFEqmsmsq4+JrKjZ
	D8Z69Y0C2N1O9vDrlqpB5bRk7sIspcW4TVUPUCrEQBvbVhUvM5lHPwVqkEqz2ivb
	YEtjqvnVF97+6P8z3MPxURsB9V6eg7i1jlR+56g8DIbq5InGmABlEvu/PwQptItd
	iNqpPFqlRCsck5KaWOkkPU3zuk9adfw8H4sRotC51mqC9K9j22fNDPWfhxRvFloR
	YkOOHBIcpVJVN0D45dTnElU9LgzBYZ6IhPBGHBg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:lBeh1tJFHNJj3dC39zm6eNlwXag/aRES3/ZjqNvr/Sw=:WYD20Vz6rVujFgM/NbQreaHSe8ZpueAJZFcCX4XUjFE=;
X-ME-Sender: <xms:ez0Ka6ufo34kBXAhn7Q5FuqCSWbgDaJIgrBOVM4AZ35FIWg7-ID_Sw>
    <xme:ez0Ka6RxUURUyo96nciWUfCd7N9m3ltnAvWAkxqyOYfWLeiP6A1X1ihMCY3HyuJ__
    Kx49XH3ld5Pb4rINVQDNIeC1ij3mdGvoBeHcB3zlCtUhoUD2K4_8Vxj>
X-ME-Proxy-Cause: dmFkZTGSFT9LCcaN3SJpvNQvvh5imKz0ByM9cmRSUirYALsqrsjaZNG+cxZdTbWRuHMTAq
    AJCzV0lfWrVRle6hjbVDhWvBIcr/98dmipjNO3rydu5laMylbaLzbtYWDA4v4h4l5O83m6
    aIlS4dN+Udwz4/mv1Fgwj0sYDOIeUqZFJr+SsgZdUPB14uHqqpGG8080QPAD2aED9tzlAw
    a9jNPF71XhjTqlKlrtxA14P2YyhE7PSSZ9fohZsW9h12jBCMTeMgMDCrcnoLizJDZ/oclY
    F/AUIn28sQBwn0W/y3sGyoAocosm/ERZn7CfJ996RirHn9oAUf+dhfS/y320FSqvJzJOfd
    tWMkkFRBX76qSGV5p0/i/xlSzq3n8A3QpHfxtvWTz+GrQ+AlEBwBitk3f56JmO34KzmAzj
    EcUDRgbMtgF19aVldndWYwxv5O5/vmqEujSj9vGTLBFPkkiNBtYf5LsbJBK25YJaiYj+YU
    EDFcqJq0pu4qARy7nSVS2BunkHDuXUuYoze4wtnqB0IIeDUYBtznVkwql04kNazffTtl/j
    6S2rJhffGzNhpjP5jg60RRzSOOGFTqvnNRW+BroVKZ9qyd/LQOyMCHz8YMr7GVpXdyTNnH
    j6WB8iIJYlAnMwL6w/2Ulsg4eBGOCnNTY2tXqubURcYrgLMGXn72zU3KPFpA
X-ME-Proxy: <xmx:ez0Ka8brg1fMZdXcnJTwGB3G8XNo61bCWmTy-j2Nm8kuaaFbu3jR4A>
    <xmx:ez0Ka-QttPK_dq49zQx4AxvpK0P-ehXWZ0w6iC80Xxo6JDlMAwTagQ>
    <xmx:ez0Ka_T0NOGVMXO2bF8vXSafxbqnxnNGB7GULC2BqRBTpJfXlnoVrw>
    <xmx:ez0KaySuMGZgvgjV4K8G696uSdp0Xc-zVjlETqm2EiQlbZWnYqJQ0g>
    <xmx:fD0Ka4DzloZ_KpTgSCGyFqD87nhSGvo0g7m8J5PhgvvNLaIR0Uo9am1t>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 408CF2C00085; Fri, 27 Nov 2026 21:33:31 -0500 (EST)
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
X-ThreadId: AhK4IBiDdJJ-
Date: Fri, 27 Nov 2026 21:33:11 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <25933253-59d6-4e1f-86c2-a8ae60a4cf82@app.fastmail.com>
In-Reply-To: <2026112733-bobtail-undoing-be7f@gregkh>
References: <mpearson-lenovo@squebb.ca>
 <20261104205654.3518943-1-mpearson-lenovo@squebb.ca>
 <9f5f0a57-dde5-44c9-ade6-96d1b8648ebb@app.fastmail.com>
 <2026112733-bobtail-undoing-be7f@gregkh>
Subject: Re: [PATCH v2] usb: typec: ucsi: Retry if notification enable timesout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Greg,

On Fri, Nov 27, 2026, at 3:47 PM, Greg KH wrote:
> On Fri, Nov 27, 2026 at 03:42:39PM -0500, Mark Pearson wrote:
>> On Wed, Nov 4, 2026, at 3:56 PM, Mark Pearson wrote:
>> > Found on Thinkpad E14 G8.
>> > When UCSI notifications are enabled the FW does not ack the enablement
>> > itself. Future commands will be acked correctly.
>> >
>> > If this happens try enablement again and confirm acks are working
>> > correctly.
>> >
>> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> > Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> > ---
>> > Changes in v2:
>> >  - No functional change. Rebased as requested
>> >  = Added Heikki's review tag
>> >
>> >  drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
>> >  1 file changed, 6 insertions(+)
>> >
>> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
>> > index 5aab8ab9f013..6633ad6658f2 100644
>> > --- a/drivers/usb/typec/ucsi/ucsi.c
>> > +++ b/drivers/usb/typec/ucsi/ucsi.c
>> > @@ -2095,6 +2095,12 @@ static int ucsi_init(struct ucsi *ucsi)
>> >  	ntfy = UCSI_ENABLE_NTFY_CMD_COMPLETE | UCSI_ENABLE_NTFY_ERROR;
>> >  	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
>> >  	ret = ucsi_send_command(ucsi, command, NULL, 0);
>> > +	/*
>> > +	 * Some FW may not ack the notification enable the first time.
>> > +	 * If this happens, repeat to confirm it is actually working
>> > +	 */
>> > +	if (ret == -ETIMEDOUT)
>> > +		ret = ucsi_send_command(ucsi, command, NULL, 0);
>> >  	if (ret < 0)
>> >  		goto err_reset;
>> > 
>> > -- 
>> > 2.43.0
>> 
>> Can I float this back to the top of the mailing list please. I don't believe any issues have been identified and the initial version was posted back in July. This does fix an issue seen on platforms that are being sold with Linux preloaded and Linux users are using - it's real.
>> 
>> I can see Dell and HP fixes being pulled in quickly - what am I doing wrong on my side?
>
> I have 1000+ pending USB patches to review/apply still.  Please be
> patient for things that are just normal feature additions like this.
>
Ack - understood. I get it and my note was poorly phrased. My apologies.
I just wanted to understand if I'm doing something wrong - there were other patches in ucsi_acpi that landed after mine and went straight through and I didn't know why.

Looking at them again (e.g  8c51ea6 and b0baaf6) - I believe it's because they're tagging stable. I didn't realise it was OK to use the stable tag for patches that addressed FW issues (i.e. not correcting something that was previously wrong in the kernel itself - I normally only use stable for regressions).

Should I repost my patch with stable tag used? I don't want to jump the queue or cause extra workload - but I am addressing a real problem for real users on real hardware.

Mark

