Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795621357;
	b=nGQaHgzJYTvgsCxAIXHE1Rfcyf1gwSlXg9fpwxLV+SupjTOk3ZQg5mg5gEDL9jUXnaVV
	 L8xkGyTA9fHHtFclLUsEp7nfc7ln9ZM/3/+DShQ3qx8FYfK4r3LP71qog80Hh127l4FJU
	 bXVkvZpE9km6ZKUjDImghd2rNNjhSGIYe6ufa4/i2vhjHorkkAOCXebiHhdKqf84DjuBt
	 QE/Sfy42/Xvd8x2MsGu9SP8VV2clFCxdFKuz43FSbxWr2gwMrFI/GtTftTw0yjhZipfuQ
	 P4w6TVIozIh8OIoah1Z9P2+AxXO0a1fXFHDsFEyW54Ymrn1TTq+Gkmf+gkS5/KgbD9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795621357;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2T/CNl+UqumwvNGn7wZeKbRuxVWx59FkRSs8vRgInCU=;
	b=jIgWUXiltr1RtbVq0evnG3LAjU6brgAHDTVgLcVeqqE0W2jclrgWWeHxoKeJ+9dX5qca
	 /kxJcPRjMOiiFlWaIaoBtZgo71/vTWLwIR3QQ0DL1l/ZhGCZBhYc0AaLa69WvPAZ7gjHR
	 6/YU/rX1dJ4iU5QvZ2+EZxJw+B186LBw+t/SWn4Wa98Nd9cYi5e9jXc8LSwSROINHaEVi
	 gHqfUp2dIE91gFnLvlCLORsiLLdMrQHPhdSW7lPd8tSer5T3j8MrDMmnrgsyPEL1lrC9X
	 Jq8g38VIOeR4kx/e0TyrErmscjUE7/VS7k6cycicdcwxbYHGIl6PPQ2CxYRsNLDipbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeweavers.com;
	spf=pass smtp.mailfrom=codeweavers.com;
	dkim=pass header.d=codeweavers.com header.i=@codeweavers.com header.a=rsa-sha256 header.s=fm2 header.b=AjoxTdgG;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Gj+EhfIr;
	arc=none smtp.remote-ip=103.168.172.152
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F188606B398
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F188606B398
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeweavers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeweavers.com header.i=@codeweavers.com header.a=rsa-sha256 header.s=fm2 header.b=AjoxTdgG;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Gj+EhfIr
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 25197140041B
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:42:36 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Wed, 25 Nov 2026 10:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codeweavers.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1795621355; x=1795707755; bh=2T/CNl+UqumwvNGn7wZeKbRuxVWx59Fk
	RSs8vRgInCU=; b=AjoxTdgGPHaDL9l16VUtI4gx9tx7CQUl87yzskUeP0A64LDj
	WQjyUM66d20pTXoEVYZaGNBfKcIRyNIsgyZZCmSUotZE0A50M+DU4TO7PxJMqOrL
	+14QJbXmt4UFwA9JadchEVMth33IXQUsbdruKC8ZAIa8efH8wzKnRIj7oYzEI4Sk
	xjikiCGrGrg4rjmo4k8hgSNB0lnoz/BmD6f6vSylelje+R7sgHv141ddAj0KNoqd
	p1O9LAwLPSCjaYLD0eGWVuvTuZRHPdGsMI9Cbb9KCGMdEtWbz4p8L2lhP5phkqCL
	1VxEtEN/wvqjzN2BZVPTQF3TCCPzKwot2SNgqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795621355; x=
	1795707755; bh=2T/CNl+UqumwvNGn7wZeKbRuxVWx59FkRSs8vRgInCU=; b=G
	j+EhfIr9LLm6txXSplVxyNJkXsC4CCwc19fSErFnaVM2weJZ0BmtrOtJh6wbFmen
	ZvD5PyiIjn5zhxrOpiJpJDTvU34zNYo8fZzpK4uAIKTT7yo+wNkmy0d/H5tkMAeB
	9Z+2Q9xADOwvpZN6rqy5QI5l9VyCtxAgV364YqJU0lmgp61TrUg2netTQv0ewyeB
	wNXCk3+aI47Kw65e1YlOcWMdxQ/WPGZMgkQxGsX9lW1CG7jUJscOiQeFUCjxNyfz
	GPFJDAMSWYDYA0wsJWVjklam28cxj9IcCamuxG3xsVRDNF/vGnirjXSkFsFBmziJ
	OR+FdT9qsPzdAy1iftOsg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=codeweavers.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795621355; d=codeweavers.com;
	mf=PHBnb2ZtYW5AY29kZXdlYXZlcnMuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:QHgEq+KnKsybfHsB5WRbqxMW4kjZs6z0yIqp1jdHL5FDP4l
	PcjrUak6Xs6dtj6QkTlXGMY9vvXD37inPRKPumk08ll+YmLkTrteh/qT2e6tQPSt
	uvpfMOpVYDga2Tgq4qShaT+b84yZGr98oiAvghphFPo9cYZRGrcjMN2tZvWLcvCD
	K2KFzqa+2gkan0R7SyYVng3WElGZ/zYfwUEyf0aCTmt3rttiexMoq1nAXFiGOouq
	6ZCJu0P/iaOuBeN3qPVaThqmUMnt2dF8xq27Vb2yPsfFZwZAZISCfcB5mBHrAdM2
	EJYnKW27lSYb0s1Cuo8RVap+IyD+ij3dhc9d/OQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:cURZaRvm/M8WwMrBFfNYD1L7u23Qg1bJk6LkPT6yGKQ=:BN7VufvdK5J1/sbSPUTxr3OBpK0PKvBepcG2DpCD8Gg=;
X-ME-Sender: <xms:6gEHa1QAkayTti6HN0OFfKwQPGa1BPrrw7NsCd8Ycad6ZkTZlWtcag>
    <xme:6gEHaxbbbXleaagPBv9QS7P2HcxhSTLsTzSn4wvpUU9MelJhCxT3Q7ELLKiwKXWb3
    LN8PGyoyjXgZnAprTA6y9AsINUd9Y3trAn1CqLKD2WH4rKPQDXea53O>
X-ME-Received: <xmr:6gEHa6W6_cwg73WM5HPDf4C14jQG1HYUnno3zkvCX1BnvH5FVR6tuXe7MmuxUxG3er6N5g>
X-ME-Proxy-Cause: dmFkZTGjFUdAYxBm6lDleXbMn4poc217ZkkD9OM2CkIIK084tWBA7U1ZgeqN08eo6tVNuL
    r501i6BzagUXxew9r5JxbFRq4TIRdwnfQYxVWkm5ItSmC5YLFXaQUKe82FwnNqC2VxIZ+w
    l2e3a1oWHqatq4QS4gJPBFqY0gm8oudgxkmeM4oHS4hko6Fhoqr+yQH93UfiYf+DQyuLWe
    30QGi8b02LSuSsPSU2YbIgoRvqak0WoW5K3o/d3DQKLe3ouPDjA88fxBjCbYKEAddqKKTS
    ZaaLdAKckBujouTeX1OBIgaR/lKLovufedImVZlI/RtpI5pnABEtXXQqs6V0KRIeUEhEN3
    6VUfRlwJ7yxVYhG2HCcvYIOLMEewK79qNmI0Iqh/y/fK7Q09jB1WeiOfZIOfxLwOV6UYXc
    YjKWRlyn68x1eBAADUxE7O8T78YMMArUDfic/x93udRjiZklQlS3wUPEZutfREMIJ23HN8
    DomeXjXrM/MxUyG7NJcydROEmZIj+vdtTwWCznglKNrpSoqV1N4k6H9jWtYwSMA6Ef4yOa
    ZiHu4QFfTXmFAigjLWOytp7rdB4PAnEEuZj2du8t2nT3C/bqnxWUL7hOtiUEWLRWKivfTy
    +9NhWklXTBbUVT/IKK/IL3q/iGXHDYnbiR5JthHCYbR1D3mKOganPw6HcYHg
X-ME-Proxy: <xmx:6gEHa-WpWhNX6-A7HRJiJSbjiqLRGZ17LDLI03RPubv8V5Cfs8rkaQ>
    <xmx:6gEHa886zMrdApuIWSFxFqdr1gtuE0DCJwPYC5CKzpXYdMvqYVXghA>
    <xmx:6gEHa7oFMojoasLO2H-NHaF9fx3PvttC_wPpNZbLd9HoekjsEfMCZA>
    <xmx:6gEHa4c3qg0G6F9lADUgyJBcjO6u6kf8lx8F72n6rPx8hnI1cunh0g>
    <xmx:6wEHa3W51IMKQEfcQ47UTrm1c3gRInrKQQiTEbgBUlhm6XGxnozb0ZWT>
Feedback-ID: ie0f64b70:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 10:42:31 -0500 (EST)
Message-ID: <0308f0ef-9989-4a9b-aaa4-2a3169ac1f02@codeweavers.com>
Date: Wed, 25 Nov 2026 09:42:28 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mm: fix soft-dirty false positives in mprotect() of
 large folios
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Shivank Garg <shivankg@amd.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Dev Jain <dev.jain@arm.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Peter Xu <peterx@redhat.com>, Shuah Khan <shuah@kernel.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <emmir@google.com>,
 Andrei Vagin <avagin@gmail.com>, Bharata B Rao <bharata@amd.com>,
 Daniel Wade <danjwade95@gmail.com>, Yin Tirui <yintirui@gmail.com>,
 Muhammad Usama Anjum <usama.anjum@arm.com>,
 wine-devel <wine-devel@winehq.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261125-b4-mm-soft-dirty-fixes-v1-0-538e3cdb618c@amd.com>
 <380e029a-2d9a-43ee-9048-c4b490c11f41@kernel.org>
Content-Language: en-GB
From: Paul Gofman <pgofman@codeweavers.com>
In-Reply-To: <380e029a-2d9a-43ee-9048-c4b490c11f41@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 07:43, David Hildenbrand (Arm) wrote:
> On 11/25/26 14:32, Shivank Garg wrote:
>> mprotect() handles the PTEs of a large folio as one batch, and marks the
>> whole batch dirty with pte_mkdirty() if any of its PTEs is dirty.  On
>> x86, powerpc, riscv and s390, pte_mkdirty() also sets the soft-dirty
>> bit, so after clear_refs, mprotect() marks unwritten pages soft-dirty.
>> With 64K mTHP on x86-64, all 240 unwritten pages of a 1MiB region are
>> reported soft-dirty; with my fix, none are.
> Why do we care? Just over-indicate soft-dirty. It's valid, and the whole feature
> is full of holes and buggy as hell.
>
Do I understand correctly that these issues only affect the old soft 
dirty feature and not UFFD WP async (UFFD_FEATURE_WP_ASYNC)? 
Over-indicating written pages with the newer UFFD support is not 
expected and Wine usage of the feature requires that. But I guess it is 
not what is concerned here?

