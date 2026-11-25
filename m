Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626328;
	b=MFNJKhWKzXvEwtLvmTc32LZh5qu5QQMoHpJ/eUpxhpIxRjyN6xEpkKTq51UPJgOmjsI8
	 8xWK/rcZBy/kO3qHumxZEVjldDVeGYC+coKkpslNM7cMyaLvaqlBmhUO7IhD60sVkwXqN
	 Tfsff46hMBimE5mym1BKjzZp7RZLLap/diihqpjbWpLzC4n+5QGguzT7taZALbf07SIK4
	 9yElkcSfxaab3WqSabxwOnTqhxgimB6LQzMx+pcRIZVZHELIa7Y/4LeSIbmEf38ZP38tQ
	 sx655kyz8OLQhUTVZV0dQ/JAgpKwneQ3Atb1wB3uMBLyuiQdEA74DknG2RhKRLna1GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626328;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=vYg7t8XZKNyEMUQyJABYzZaiqQSY5nMkUX9IFZmor98=;
	b=JGvokiw5XZ4UjCvu9GCVcy8b7IPkAWcw0laugG6g/xAl5gChhS00BItTk8SezRV4XebB
	 grbcxyEWvzD7T/x1E4U+pfwMpqllJUptZaJIXKot9q7Cy3ZUHRQLRzRm+lvqkt0eml2pf
	 HPMCbsMex5vPbnWtz73h1GIBRdUTNjafcpPVO8MtERDvNN2V0M5fImSPFAhf/mG32/wBY
	 pWSQG3Ck7z+Y4PfeNkpGgf1zEBwiDxuR80PMHwxjn8zsL6F0PBHHzfHJxAyxxKpSRzDFe
	 +kENXPdYCPOBl+aXrdsoxwGERaancOFdHDBX1uRsoqaTe76SyVAXxD6uHlgklP/LQaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=IVyJQrsC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B1hYWHCS;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA21606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA21606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=IVyJQrsC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B1hYWHCS
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 434B4EC0C0E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:05:26 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 25 Nov 2026 12:05:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795626324;
	 x=1795712724; bh=vYg7t8XZKNyEMUQyJABYzZaiqQSY5nMkUX9IFZmor98=; b=
	IVyJQrsC9F/cjwCbtBulgCYs7L41lVu8WGDaZVbFaqKmbE4efT0iC3NVuO8Hcn2z
	N9lbOvlOsVx2eH8Qqwwodb/DV3V7UiTuueKKZUTcaI9fO6sQNyL05k255WJtoiST
	lEiiqgST7hBbHKuYzPwxMYeUjAx6pMTx7yOoN6sYJPul8ZUYGoYe+SrBbZLM9Suk
	mVTHpmIA40XS4eJNjfikXWQ01Fh1U4Kp7RozLrEEQUzdYzQnhcGjJhtS0G3zAQ20
	SuXzVvhUl8uj8z1en2vGwAvqYqV76n2oqRx9cQ/HTWCVvoVAyRhPNNLyKhKu3VoV
	AOUs1eaOFXf65LJ9JsHiYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795626324; x=
	1795712724; bh=vYg7t8XZKNyEMUQyJABYzZaiqQSY5nMkUX9IFZmor98=; b=B
	1hYWHCStz4kLnQ3C7rwmsa1M8MdsAQkcpa7aSPbhyXY9IgVBReFezYIfYZypqwGQ
	o0DTw0NC4Bx4vvWg6tHSIYqu2Wzxh4oSufjq/+B1yqVnwe5RtX2ONphXEtznq9im
	gR4wnP0apiOdZsjl9dfZpRzFzvSGDhb8MXhze1LAFgleCtPz5mIP1pwgAQM51Wcw
	EF3XmfCh/0GJ08Hy0SXbpYjL/wKcMAcpdbgC777vIt4gAc9wMKcTCtDcFpchdFNF
	p4VGGN6tmnGNSjM3sg/QmMbDP5lZoz0a84XOXDfSZiYMe+inc7AvJtROIRxArBzX
	l53DEXhKRqWvuvykHGwGA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795626324; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:fYBLec5s2O4rG+kfZfKNuWXdhOx1aco3qiuxrfiXD5hTHvN
	WlL4PaUOGmWZAYK+5sfTT7Po56/3iKwLD9aPlEZSq1ecvbctpZQzSapb4kLr0K6q
	d6bt0daeA71wHDnokdG9peo6HL8nsJ7LI7Tl2Vf+G+cY4NTj3in/VCQgsdw5QbNn
	nYHVKKxXs+XIjltlJpBOPpOn8yGOpRhVULEQ/ajJRmR4YTKbT9yKGEbjSmRxp0W5
	VYLERZGTPbTlEicVFmPYueF+m5Rbpt7Q0ocv9Nf5zEoTKjZwP0ryX7cDJmGMFn1U
	X1fV7sJmahAzFk9UMQsuVDUyheRkUeCIWymuuPQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:vf0C0P39GDISTxoRyvbJ5KXwF/Dr1TLEJqkWUNhREpw=:tg15kuPTnEV/RD4OLr2bGgyTaArD+70sWO/1H+nyKvU=;
X-ME-Sender: <xms:UxUHa8yIbZC86I_9a6Dfs8iJJZyXp9jyqoVpPpvZCsE6VHoPXTjtNg>
    <xme:UxUHa7FaKcdH8huw0e9CPy2SuT0eS3vAq-8NbjVaHk_UZ34bXPklE2mho5JTyQ3ut
    9YVaSrYsI5Tfgx51YvrSHTx_LGPTpjvYQWdf3s-ZekGKDpnyaiSs_U>
X-ME-Proxy-Cause: dmFkZTEvR+FRy8c0wMCrQQh8GBLA4oaTOB5xTnLxGAErxA2jnLKOxR+uOtsOIjm/nifizJ
    hw6y4pkrCuja5R2fbGn+X1kFXFNTGWPVoIpmiHcteplnWVSUQ8GPOCk+62YzCALjphtxCq
    osWFcHYC4uFdPbsv1KfablBeAQ5K/7Zx9aeOMNzVI2k8vxQsdPN1TqS708GPn78Bq+lFt6
    AOugrqSHB9cbzEUHcl4ErxuAF4A9F0IDeToURjCyhSN5+DHbaSHhbsHFtDTprFK6VxMAvw
    wL7/zRrduTH2f3btmKhAe4Hv2fYloLpUjdmyJ5ud0xV+bjEdjll6HToxv2kDEXKIuq3WDc
    KxXcgsCvPgBqiji/A3Ub0sgWYRJKw49tNRwUopDnF1EAtWYJJfVF2rj6/YKV3xXkx4pN0x
    gvLIycftTkNbn0eb+5GTdM2UOjNBvj6ox9SkWC2gRpasmUk96/jZ7R3XjJ/7UVwxb4w663
    q6YYAg7/Lpa9fp+TBxE87tmoX1m1BmS2716QZODGWnGTlwWoa3sNsfUuLhhOV9RuFRPatW
    pdCCuRcMEvv8YZeFr7Zwn+UF7Th+h8ebB0KErWS4/3/Vkyc3pUEISTHot8+Fazlkw719bq
    hnX0F5u8UnejsJG99qiOkUfV+VCrA9kcB/VatFDRN75KUbxyBrHAuEXUoCFA
X-ME-Proxy: <xmx:UxUHa4RYV4cqKc9rnizJUr7-HPYq481bA57qZU3EnEz5sbr8H-9TEg>
    <xmx:UxUHa41J3FsaYFwRP99imQwKHblCl-KiIADgSLXq_961GolaW0ubLA>
    <xmx:UxUHawfX-Xa06NcnhUrPH017KR745GeRUZFV7GZpxJufl3tcx4zReQ>
    <xmx:UxUHa4NPB0VcwjdCeMebiSvSxzETcEVvfZJe7csKRrkQ3lullM8LHA>
    <xmx:VBUHa3czGJQuQSd3AmAz0x9hgMsnqLKxT-bqCmR-nnKYE-uQIUR4tFMT>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 263902C00085; Wed, 25 Nov 2026 12:05:23 -0500 (EST)
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
X-ThreadId: AfY4cavotJas
Date: Wed, 25 Nov 2026 12:05:02 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Tom Hu" <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Rong Zhang" <i@rong.moe>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 xiaoying_hu@126.com
Message-Id: <49ade1c5-073e-40c5-b163-6866d051bfca@app.fastmail.com>
In-Reply-To: <20261125125252.38003-1-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
 <20261125125252.38003-1-huxiaoying@kylinos.cn>
Subject: Re: [PATCH 2/2] platform/x86: thinkpad_acpi: Only check charge_start against a
 known charge_stop
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, Nov 25, 2026, at 7:52 AM, Tom Hu wrote:
> Hi Rong, Mark,
>
> Thanks for the reviews.
>
> On 2026-11-24, Rong Zhang wrote:
>> A random thought: perhaps initializing charge_stop with 100 could make
>> the code cleaner?
> Good idea, Since charge_start is already limited to [0, 99] earlier in 
> the 
> store path, defaulting charge_stop to 100 when GET_STOP is not 
> available makes 
> the existing `value > charge_stop` check a no-op for such machines, and 
> the extra 
> stop_support condition is not needed. 
>
> The v2 I'm about to send.
>
>
> On 2026-11-24, Mark Pearson wrote:
>> Have you seen this happen on any actual HW?
> Not on hardware I have access to;  I agree a  firmware exposing 
> GET_START but not GET_STOP 
> is unusual, so the patch is mostly hardening, but the current behaviour 
> (rejecting every charge_start > 0) 
> is wrong either way, so I think it is worth fixing.
>
Yep - just wanted to check. I'd go and ask the FW to be fixed if it was being seen on real HW ;)

Mark
