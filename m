Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040367;
	b=fS98IBGPFlbfEaLDfCaRSJ4J9eZlYvGsd8grWQkbrymYCpkkLdCAaKnsj1sPQwYaKS+P
	 KhqgER7VbKwqAIIGsvNtiCrwmwMd9b+H/2olXamrKkuWYfVLpP0SDRHNqHSF6snJrKFP6
	 f2csFyYHjCQl6huCEFRGJjbuNwqyvJA1yjcd9bcepw4H4nVai1ydhrwhzMDOZLBH7Xk2V
	 CC8Gont1sLWirGSx8WlpCsvgWPB2TKV4WaawELPCQt8+vw7ASPqjVdlE9VVYBT8mZsgC4
	 ka4I6kpBvarK/2f0D8dTCXMh3H2/17cxqqQHwmcm/uHT2h8zHKD0aAYc+qu8hLm3aKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040367;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Saif4cKv00ffpND23nTvvBrJe/ed1Rbg9Rb81plP9Ko=;
	b=ORURzk9SxqWqMXW0T5WBY+75JhYA3IHAqkNMwLSZE749/YL53xZ4rBphypvoROPFod03
	 UgKFvN7OgzNgdXFuMVExl+ncm/b0+29hYb9M2t/xqELP+fNV3OO4TbEYTqzYQvmPiWyYG
	 NJEbwPiVvZCY4kLoNp3NkEB8X/Fb7BcuKfzfPAMw+oQFf/v4CItQBc7yFKiBY59A8ThEE
	 1CYqwf9ppVlEhnBok2K4gyxBsmlOEMKLqwughBF/waUXQxv7vW3N9JoiBa9+VefLIVvRq
	 SuPDTpQdFlwv0ksVD0A6lDvrYV1jrpFLx473gdyFa7DwhrJAuSqg0oKBc31kAkBkQQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=BplHR8R9;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fYl5dvtN;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A92606A339
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A92606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=BplHR8R9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fYl5dvtN
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 64D141400187
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:19:25 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 17:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795040364;
	 x=1795126764; bh=Saif4cKv00ffpND23nTvvBrJe/ed1Rbg9Rb81plP9Ko=; b=
	BplHR8R9LbEA9XuuuCVcqlNnIDttK5O+QI2PaHNdyWD1GrETNBYCi8ayaPFFLvUi
	Xbr03kM5qSRD1roQ6D6c6qRApOpHjOTvSSP6R8uo0oqHyoSL7Ol1qfLqXePcT9IF
	6Kmq+KUz3p40Rls3JJUQ/aaHMqc/enAPpJEgDpZJOc0UmiBcxABwuDzlYYcLi35A
	BgOonIeJkjnbkp2QZ7kMjMDs7Uberp9fgopk7Uh3RRhfTX/a2KJ2cY/k/cG+5REK
	OUBYQt94hTQ0YWSTKPxh/t4yPdv+9VNcLbELNdfGQU5jTvrgDSKLs9WVZ4tOnIt/
	rS/2EW2WkOm8ogHzETIF7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795040364; x=
	1795126764; bh=Saif4cKv00ffpND23nTvvBrJe/ed1Rbg9Rb81plP9Ko=; b=f
	Yl5dvtNhU2jX9n1P6E1EMMWtJ0xEH7SEaYB4jpkFGLBQ0VAANdRNU176f3PKkGYz
	nFTMyCjVBugHiERPkl0q4m272f2WNLBAHanbCtXDQ+nJVAdloBe+lAQQo8/1e8Vv
	/3mmdkCGexjl9TrOZ43Cg0PjBIEGTYDkdONM5d1OTohjCyXDS8F/O6h1fV8Ql8hc
	Tl5cKjtE4ggPL9bpsjOLsulYQT0250iXi1o6SfkWaJmQlYrh7Bpl05FyvzfunHs4
	uI1Fusl0LOQ8Jvxbv+e2JY1NA3szjyl2T9yk3Vu+tyZBvSDcCb6enN5RcElIgJUj
	KhSjCCo5xMg+3p6HrWjpw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795040364; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:GBAtocjIiXNafcXdGeboawDYJCDTs4Qtk72nh8hO8ZupBoL
	qqH4F3YikO+oyRg4WLo/7NsgjQmjwuf7I/98GbXChFzH32Rg9F4Gnm4PHK/B+dUI
	NTaHCD09a2OvwHSYZbE2yywnLf+BofDQexXtEAxxr/OuYWv3cxw2dYzEq9Xx3TZN
	IDOo1uGRCvUCWFAdT+YczrczyHYxg8amgtdMPn5Ix+WOLHt956piAg3GPdb2thAz
	vCK6M8iWNjqSbUOJeJDWC7/QsFABJzmogj6vLz727ZrdTZb9Mgy7C5HrPVUzAFeJ
	AxvhtbKB0qd4c1vRcIy0dTbXKnzUyfMYhIBV3dQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:CNMWllhLU56LvSEKJq4pArMkikw8298SvSK1FTl2iiM=:/M96hGl7GrTfBNqFLZcFl0i5ESCWa+XzwFgV5k8YpjA=;
X-ME-Sender: <xms:ayT-asmsgcXGjJnNRZ0b3TNQipaUQ8Dm4lrIV9-lmKckxBoyEYZt4A>
    <xme:ayT-amr7TQwKGsvQEcifD8NhaYkAqd6lm8DW480lEI_BQ33ZHVv9f_4SWZr9-3xL0
    WGd12Rac7531VORGdKloBymr0KUSHfcFkd2pN_DtixNQbdXmzdGqfcR>
X-ME-Proxy-Cause: dmFkZTFWt8bfmFuYtse/eLptiYM7vHOvBQljDG1SHsfQ8Ze6TWaitm4FKy8zKU6VLH1cYQ
    MeWHsGVnVbk997mz0zBUJSfjren8SaO7JT488JJnBy4pFJh5Q6U9Lv982kLDGaomZ58zqt
    ePUC5b9xJTCjPy52XcDlknyj00P2ef4P/ripKF7He3vIPd5DghenWdmECnnc+020rxTLrQ
    yHeLUnqqZXcqKK4aJYUnD36BuZg0S7NVA1gAQwl3bDsa6aW0al/Y21danSDdS6pfulvmzg
    ZJKoJTeSMxinudfTE4s/Up9agUtTOORAqLu+yIaBlcYrb7HhyUxmlLx3EmtaSXxmE4wrd8
    T8QcvkXQUSNhMhE88l3MfJZ839vCEBTPSgAlKzHbqE8Itd0fuNSftXlkKm1DqqVkHOOEz7
    1kctoMIsJLXRt1OHHUkg0i295eIpWtTQn+bTzGq/Thz7wUNb++YyqKXm/n9ONCIBx3j8H7
    wbj9Sfrz+zDi6ocedRXQxgwMFEZ+QZnuwtESOYII9OukCm36aQTdamXBqBHoVqMkDBF0Mu
    HzockE8ZNaPVjv8vSznwT7rxOK+vn3cA9NsRCWEBWgOe+HazPG8sgvabIvIEVcRKw6zPUz
    KjdI06nhnPW+4ExwRpfqHr6Th1/Pi8mUwFEzpeUrj87MdQn4d0yj9m1INKrQ
X-ME-Proxy: <xmx:ayT-alUKx5XylAjhzynMPZcSKnZ1eRMhtqsFAd1QyKgr0OqI75rbSA>
    <xmx:ayT-aoKkFwhORdFqkk82-FNQNZ2NB44vIdO7WvyZi1OdY1sHQa0wtg>
    <xmx:ayT-alCs05qt3kAdFYkuePu0vYDXhnmGKN-Y-Cdt87dRXO2Fl_xEQA>
    <xmx:ayT-aofzPGBwqGWsesZBNSHqsGd7Q9fiZGGkLli_uRZQhDIDmjSbDw>
    <xmx:bCT-aueqHAMtUebZo8ykEMv1OtVnYNlxPt4u1RYBwEcS3PVfGS3WPYjj>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 785512C0008E; Wed, 18 Nov 2026 17:19:23 -0500 (EST)
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
X-ThreadId: A-2-hzlSmXEJ
Date: Wed, 18 Nov 2026 17:19:03 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Armin Wolf" <W_Armin@gmx.de>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <8d411491-3b83-4399-8a6b-1afa18cb0d4d@app.fastmail.com>
In-Reply-To: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
Subject: Re: [PATCH 0/5] platform/x86: lenovo-wmi-other: Refine firmware_attributes
 interface
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Rong,

On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
> The driver declares `.no_singleton = true' but stores device-specific
> data to statically allocated tunable_attr_01 variables. This makes the
> driver depend on the frigile fact that no device in wild has more than

minor typo: frigile/fragile

> one LENOVO_OTHER_MODE WMI devices.
>
> The series moves tunable_attr_01.device to the firmware_attributes
> device's drvdata and introcdces a tunable_attr_01_ctx array to struct

minor typo: introcdeces/introduces

> to store c[dv]_mode_id. In this manner, all statically allocated
> variables relevant to our firmware_attributes interface are constified.
>
> This also eliminates all attribute-specific callbacks by moving their
> data into a newly-introduced container struct capdata01_attr, so that
> all remaining attribute callbacks becomes generic and are shared among
> different attributes, which shrinks the module size by 42.7%.
>
> To further follow the common practice of sysfs attributes, all attribute
> groups are now created and removed at once using sysfs_create_groups()
> and sysfs_remove_groups() by providing an is_visible() callback.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Rong Zhang (5):
>       platform/x86: lenovo-wmi-other: Retrieve private data from 
> firmware_attributes device
>       platform/x86: lenovo-wmi-other: Eliminate attribute-specific 
> callbacks
>       platform/x86: lenovo-wmi-other: Factor out tunable_attr_01 
> definition into a macro
>       platform/x86: lenovo-wmi-other: Properly implement no_singleton 
> driver
>       platform/x86: lenovo-wmi-other: Hide unsupported attributes using 
> is_visible() callback
>
>  drivers/platform/x86/lenovo/wmi-other.c | 566 +++++++++++++++-----------------
>  1 file changed, 259 insertions(+), 307 deletions(-)
> ---
> base-commit: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
> change-id: 2c0ec814-lwmi-no-singleton-a3f945179a50
>
> Thanks,
> Rong
