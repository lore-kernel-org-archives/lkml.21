Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795087319;
	b=PQBeQowFaLKamkYn74aYfsQ6ZH4UPts0o87FbvdD0eHnjRygVhUjZTBl7EUJuJmdE66S
	 cuJgg0C3WfuC4XBVXzJqKHQdyMb9MXde1c59nellnuRgeC1A6WwF9v4hfOhZlTMn+dFiW
	 yj0WlUHs1ubwEsoN4hHtghXxG+hx0mx+18zFOlBSvIsttjbsIeh/osd7lRjL30PXprQGh
	 a8s9kzB3x3zl3ysZdsa13/4z/6oyMpKORWPjS9uJ7UqBnveB5M8w4hZ172sOHUppEixU5
	 xiJ2yBz/fQ7BM1nVRoC0azVQlWkAixS5fbwr4NJfr3SdCsn2+MbLPXQGIQRvuA9dxzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=e7QbyMAcdTPueERTIe2W8rC7FaSuEijLUH0VfDQBIQI=;
	b=Jt2SNArjyL1mEXfCWKPbyS6OdWhxsp0bHlJ4UkQswiWHhit3BtBQt61Gmwj4bAp+82KO
	 ISbNTdpnf1C15tap1xnZCEg2YmnkUtm9pHPYNYitVL8BqdGAYaDhr5wEsVvrQUTCVUbhL
	 BKRlmGKiJq5Bbv7qMmlW7OX2x2xtwPyhyXgGlyGnYjz4qciCSFv3+Uh1fp2yaU8NUaawn
	 3vdgL8Fgy/eFg+XZ2SgMohQAUtAk3NUpg2GFhi/sJmKsjSoQn8D71BLBEbOUAl+sH8fP6
	 bL71K+ls43kTZ+XNcWqERaqfFCLCYzcS9aysQTbRmz6cv+TSASgeEcrQo8iPAHL+UWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Z4mols3g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB89606A330
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECB89606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=Z4mols3g
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac847f9d78so170401a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:21:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795087318; cv=none;
        d=google.com; s=arc-20260327;
        b=E3DocYaz5QsbEOZJedmyxtGvwDxdLuzBZBfAZS1Y/+QY+9Z+aqbAd0/Z9WiKUJxj7E
         c53ebcg9KFoa+QM8ExZHQhsRs1IS0DY7QnwBw1thxEcRzuAeLxnAVxdaGg156eJPLBTu
         0VRB/goQa5BuTe3jETDk+F0+KvdKV/1w5+T1tZepWuLNyNUpHlKDCwfS8qwfEq+0GLNg
         HAqBdJbb91qv5hyhOnE5e2O33Fgg89Vr3LukZHmFVhJa8LH0HkVrU/27D8I3noLkq9Wv
         eCeCyn0OUWw3OMdXIjz2WPd7HyO7Txl579+PxHuANxxXLXUEVVq76gqGkU2i7WgR5Rzo
         3aVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e7QbyMAcdTPueERTIe2W8rC7FaSuEijLUH0VfDQBIQI=;
        fh=VRGXpYt/APEc37b2++Qa5E+1JGR0Y57Ge08iw2WtR/8=;
        b=duhcmzcTIQn4+ekiAgtC7Sc5kPzniqZQhmCUle4GA5jrZsuljrCRkfQIs3OFaTgugp
         6rCheQjghCYt1/DSEcKJlALSFvj4Ue8qvMSv/Y9qhq/3QXGu3i1yFn0HcTH6S+aLSl9v
         MuUG+V3chU86xNbxVrtjnrYSYuGZzxL4xOkb/lNxr9bVniguTRDfNlG1edR14IsJ2rcc
         pundpSTksmcs8LEWdZFmG5b5dIomKjvPgIRvpdEtBzLJo8MqhbOTFc6RlnyDB+Q9OxZq
         eXiV9p8BeAh+bXDkuxPbukEYTdvt1O1Oq8AW5Jpw7LTSjri+WGh2tRE7TEPBlEicqHLM
         iSqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795087318; x=1795692118; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7QbyMAcdTPueERTIe2W8rC7FaSuEijLUH0VfDQBIQI=;
        b=Z4mols3gn9bqimDi52cguSw/2T0WTaWDVxdxz6zcyZXyPgg4sGM6Q+/r5Aj7Rzapp4
         h4quJH7omFkk7iE4D1JVrPEgmWV4GrtURSbA15/kDOpfGZpA58rouU/VUzeMHkx1S+F7
         Hz9s26xztX/RE7p9nVIAfXB7l4QoNZ8jWho+SKI9PJDvV8FShCDPYBBuiOZ3HvFMBFhO
         v3hpLPm3gIQEI07GGdkMFokdCQWvgs1JkPg/mR2mEUTp972OXoxMqhkZvLvtSKmLROjZ
         b2Ss1p4URUlPL5cH7XnchQ8UvXl/BfSjp0iGlBz6WajH/WD0dm7i8pvOrVqQJWga0A5w
         J7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795087318; x=1795692118;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e7QbyMAcdTPueERTIe2W8rC7FaSuEijLUH0VfDQBIQI=;
        b=XZY5YM5JE9+8+4fYqLZbJGtI7lOO/rr+G9g2q48hb+r4xs3b8FweSyl1nYZJUCMunV
         EAC8ghXIEE95oueGWFDNLpcPSKkU2WUOmz6RZnZAXj5Q9AfL3b/xtmb8Vlr49oSPDqSA
         VzWVu7s1kHkLfgdaVOGbiwdlz+t6Mo+/ib1j3kGglIDegIUiCwTwyMXlmdziRkJRaznA
         LPPj58JKD1PxeHrXe4S2pZ2uBFIHL+o6QQ9HdyK2PkWOnscLtMKdbOL9cFK9GIZo+W3O
         SBUZE0Kn+J1/pobK6+IlXWOWcgjsDUy+h/zKKzkKFbElhZWvAt/W3r69UHahB7l+qyWO
         oagQ==
X-Forwarded-Encrypted: i=1; AL+hErE62slRqxU33u3ch4MxzKzZEr/E1QnKmygT6OMt1TbPHWC2JG34E9tgVsmtxQ4wZWa04JxH27eeyK3F7/c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lN0puTPg7cDFRDKDCj9eZgsw6b1EuQhnIflraclXx3DTGl1gy
	PLPDqFNeyCJeNMItQG/Aygb4SSm7PlSNQIEC4ETCcrO5HkIcvJk0c2IUgK8UKYhAIPHegsXKthD
	xfWPulVq/fWaT3L3U215LKSPgX4di9KvmKgzxjunzmA==
X-Gm-Gg: AZFdTZdqePMr1kEXN0TWEmRM+Azr2hFNCi2iz1WFBWSzvx9hm7i5K1ywxXVdFoa9q7w
	fMb28J9/viMzaVEpIORUO4vcZQotCqbknytLLd8Asa8hDBg+gW2WxvdX6o68m0AOPB6vvk3MDIz
	4sKzorP/HeafnVe5QTii5/ZUuZwfKkBsOPyf11CdtwYK8GAjQBPEfAlLmG+CggzvNQs6BoyYvfj
	HSR8y7adTOPwnZYvSb3C65D/8sQo5+61FPoqAuTTEd6SzewVX2T7rs6fx7nDH+fZEGdHe6TqKyN
	6Tz66JqxRi1hFQhPhvO6Dm3WhZto1HIrjDMXi0MdeHDwIsSIIorTAjdfNqk8Ht8s4tvwD/ey5G+
	vuNIcKqK/1O765JACiKZ28IX8OK74CtT7/W1DFYo+xhDmLYyumKFAu5E=
X-Received: by 2002:a17:90b:4c11:b0:3b0:9e2c:9b55 with SMTP id
 98e67ed59e1d1-3b3d06bcc48mr9840688a91.2.1795087318201; Thu, 19 Nov 2026
 03:21:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-bpf-preempt-v2-r2-v3-0-586376ec3672@sentinelone.com>
 <9a47ede3-24fa-4fa3-8d7e-50f221de0929@linux.dev> <CAPnbwjpmRCR3F4V3StUz=702AdWZzHHZjP68GepnYdYykjoC8g@mail.gmail.com>
In-Reply-To: <CAPnbwjpmRCR3F4V3StUz=702AdWZzHHZjP68GepnYdYykjoC8g@mail.gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 19 Nov 2026 13:22:00 +0200
X-Gm-Features: AclHuK9_wchn9jrgtgMQTEmt7b1vm1t-1CBFRs79WS1-atFN5hx7C0543m1ETUI
Message-ID: <CAPnbwjrQcd5R0aqNKeJV3wWuMcTTsxsamxpKVpKY7Za2xKB1gA@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v3 0/4] bpf: Check recursion per
 task for preemptible programs
To: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Martin Kelly <martin.kelly@crowdstrike.com>, 
	Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>, tyler.wilson@crowdstrike.com
Content-Type: text/plain; charset="UTF-8"

Thanks for testing, JP.

> fexit (marked)                61      135

Marked programs take the same per-CPU counter as before, so I expect no
change there. How many runs are behind these numbers, and how much do
they vary from run to run?
