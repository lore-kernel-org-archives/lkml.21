Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795115213;
	b=cb0JJHyZEfbjuGxvUWRCKVuiE0oS5cNtQatkqTMNJw5imIORC09A4F3coZXnMhMCXhxF
	 DfXy0x+bJMEj7qBTp3neyOFixs37Nn6q1Rd8pcyXki6kfHSgOIKe1KVHW1ybO6x9Tx0kw
	 Pf4An9qQ3RMHObGnjjFoNeAdGz2YwJdDF/bZ0+zsSIrO2QNvXqJqktg2FukLnGW1x37+b
	 gDRH2zH9UQ5cU244sNut6rfNq/+l+HDLlvWum7WiAb0FXpcfbVd+w17OQgZ028mQ+9A3i
	 +gEiLE2OgA8uZS/T3E3uK71q9da3BtwaLNw7f4HwceGG3h4g5oDbd1lMUPvJzKylbWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795115213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version;
	bh=7UOIM1gt/HSVdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=;
	b=S6u9jA4LaG7h21YS5VwnsVNdt3R64uM7WKsXU4sj9oY6SFsL6ocJZFEUfvAG13xiXr32
	 GA1mI+pn6VMsZfze3bv9LkWuoiEdwMU6GN0VsadDZr78Z4olouZrCyszHQd8jq97FWwCQ
	 6sNrK5w3wP/1F2kTD1Rrb1TE1dM2z2856/HYS63sLq2sW5TTMbx5Q05VTzJNVI8LWAEc7
	 JfN+Q9DFvz06R5MEEk28JcPuUObSLyTjv4DV80060/8H4t5Mi49ged0MSLm3uKhSEqPPq
	 w90YI3cn7+vqRgncStTMLqK/BMtId1O/QBLXPWjUysfz9IqgvU3RYhUSDuAsL9yU6Mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=FBS35DIl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CAD606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31CAD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=FBS35DIl
Received: from pps.filterd (m0528007.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJJ1476194186
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:06:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=7UOIM1gt/HS
	VdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=; b=FBS35DIlYfrNJvTrsnesOsZXjHu
	lShjNbOKcW+4QM1K1aoLTP70qi5tI7RMA2vJwjdT6wVGEM7qbKX7TUCyPn8NYLdN
	w/Nmgi7S2w/MYm2sVSnArpTHYuEgihfprYzgxh5FAlxnM/HsEAdC+iDwpQq8j91D
	5DK3IC6Dq31TEkxovREk9wTM61Ha2trluzl8SPTq3cr+nOiKpROIb3P0l+g+1hNI
	smTrP6XALq2srV1GF94pDR8lBaW/PKZS8xaGmG9b1Y7jfx5W/ycFnN2Xpwp1lGoY
	cjMfYJ9bQqoSqzD9oUEWt7ktQ7AHIi2ub6t9g2Aqv8VWarmC2C4NrUY8Bhg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j1x1amset-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:06:52 -0800 (PST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso154965a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795115212; cv=none;
        d=google.com; s=arc-20260327;
        b=bQEoA5N0vq4rCiwgZ5tSEMOEbtkNfq5KAVEj07amkZQeJZDj5mzPfaMGvlMMaR/fe9
         N5KA17/Sy2KCN5fHpSzCZsS53puR7LSfchXOIZyRk/QXYbjy/w4nf4/CbGfa/mUxJc4s
         bQ2AcAjkbuG4egZ5VatyCuJ6FwjzKFh3CSMTDdoklA0jey50gnVarZGGl3RKJNh7JMfK
         4IzKOC3K4fjz9hiu3jypYZyjLhPXZHAR43KFNmiitpyDAfIFIxY6OffrR7qh66PuXhUf
         nwG5YpMs5WtQDbWET/0Wci7TWP7hZ81ZDqNKN7mH6arO4A6Ofr7aeT4XD3/kH/0XrUsN
         heEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=7UOIM1gt/HSVdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=;
        fh=wACGxXfpUCEMVUsPZ9RMiu+RaWsAnBaQOU6EieT6CWU=;
        b=QzrOgFErXYIYzHCPR9oBmE6y1IT09mB1X3/rzM34Up3sRsLhsdixiTr23flXkFL4oE
         Z2NRZ79RjO5UHZ2soENai2QFnUTgES5lfkvs2TRf1NuVT2LrrWcF4lWLodHhZxMtlTyA
         YSiUZwfWILlfePjuUl7CmHlUVN7a5tNtOjoL92w2BIkoTIJMClcTJjlpV3XqK0Zussi1
         GRKN5vbihUS79Z158897wuJaJc2/hIgy+vn2H65JitefmVvZJtYbAezQAkEtnmp69P/O
         GvgAs5Hwl57xMBJOp6hcP7O9kSu4/mjOHJ93VO3vnb06oADXfkMXeaqFNF0ZB1deM2y/
         f7iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115212; x=1795720012;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UOIM1gt/HSVdU/4mq+KVCxj8c2UYFHGAIGtG4eIqGw=;
        b=BJcCS5gZ59tN3T6O/q9Wvzw7Ox4uGUtcO/ruWfAosZh6dcqlGpmuO/Y5FzePBpVd3V
         WfITeNLXQ5+TjzA6qYOCt3r/Ef7yPxU+h0yz8WPqTi9UWh9DegaS6fJDhSQJG/eJ0Z0j
         KtKG4RzD0SOMdW557HFrFCS32+dPb8tNlQ1Z6sLlMB1ro/SAOl0j2CIkck0kcghcB+Cr
         s20638WjBIg+7/YdbzFK4+B+wkg2KnQX18k/G71oW30DHBcVQHfF0JFBUXPSxkeCa1Sf
         Nm3sDvf7ZNFELHhP2uJMhaE75f6OlzUb1OuQOuRM5NX1pehfDpVJmQyq3uRo8qAey3yS
         lJBg==
X-Forwarded-Encrypted: i=1; AL+hErHO1rsDOjrX8PBHTTBNK9MJGPMmeZN/LTi87ElDacXKauqo/99I8EV2tlsmdhklXuN0lK68F4DOrSf6brs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MlXqhmKBxD1tlyARJyKDr9ZwYzS2mU+CMaftnjea9XX0JZdCy
	gl2AWUaTAKJ2WZI4ASkgVrP/hHhbRe1ArMsgqjL3fNlfsdoWeLKJ+fSfb+U4bGNLqzYf0ALOz5z
	1fbtFXziIxJmXhUJARh1A1j/GWpneTBpy9j/msQHuuIY0hI5lIwvM1SDUP/QKi3AwrEAI2Y0MqD
	oGrvrvlviVPCQYDZcqtjdn24t/o0jXaunML7rOXuc=
X-Gm-Gg: AZFdTZfF2wgJKkQDTpjAc6DpSF+bUrF0OLVnd0hTOvsEhmRb8MuQ9wLQS9PRyhLZyKq
	92utfXthjoEbDoou25fCLHJljC+BkUIVwonHMDlGsKiqxd8DtDnsrG3RKYDa+DSLNexEw9gkbD7
	b8Mlkj1VTBIGaS88xN9WkkFNrouZsobde/QAOYTpFBhQ+BPPL4NVbABpMNmpvKREmjuIhipbGTV
	JNSCKea+W0IiUBVWHzwO5RXiNRO41PK
X-Received: by 2002:a17:90b:4a06:b0:3a4:9dd7:296f with SMTP id 98e67ed59e1d1-3b41caec8a1mr251311a91.40.1795115211620;
        Thu, 19 Nov 2026 11:06:51 -0800 (PST)
X-Received: by 2002:a17:90b:4a06:b0:3a4:9dd7:296f with SMTP id
 98e67ed59e1d1-3b41caec8a1mr251262a91.40.1795115211062; Thu, 19 Nov 2026
 11:06:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113185553.171059-1-toddfreed@meta.com> <20261113185553.171059-2-toddfreed@meta.com>
 <20261118182729.21bcf5f5@kernel.org>
In-Reply-To: <20261118182729.21bcf5f5@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Thu, 19 Nov 2026 11:06:40 -0800
X-Gm-Features: AclHuK8MIg7IMlCLvugp4MxnFKNBhzqTy9e8on9cRpXBj8Das6tgcuB0baaIcl4
Message-ID: <CADh2yMx3Fw+Xe3E-hwj_bBMG8Cy_0N8-XfoTZXSxDcQgaSgxuA@mail.gmail.com>
Subject: Re: [PATCH net 1/3] net/sched: act_mirred: don't send decrypted skbs
 from egress to ingress
To: Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Daniel Zahka <daniel.zahka@gmail.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Wei Wang <weiwan@google.com>, Jamal Hadi Salim <jhs@mojatatu.com>,
        Jiri Pirko <jiri@resnulli.us>, Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <martin.lau@linux.dev>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Sabrina Dubroca <sd@queasysnail.net>,
        Boris Pismenny <borisp@nvidia.com>, bpf@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3NSBTYWx0ZWRfX6DBwuq3oWoeu
 4Jb4uIrtdUBP7d6vsNaFuyBubOwyLtbDbKkmZrzIathZgbv3C512XpJicltEDGgi7kZOZeRLQku
 GztDrFIhUhWkeeDSRzZyT5yeBP3VrMniSSYFvIdC9JJv6Qbl0OE5t6lNaABivUqNKo7aeyeSUOf
 Zoqw6KCyczA3paJNv9RnyX5y1VA/l2S971S/dSFPOxxw9kXnCxqn131QGuhx6Sxo+iE73nvtYJG
 F3wmQ9B6MJfpnWPHZtCUck6q3F4JEWPeesx2GbncGkuYn9j/VAP0u/BxXxK87PAliHTKL60YhYy
 qT5m/uYJSz+D+XA04QR16JP9OjD1sCHan0gOgv0+0NgYSa3dFYvl/kcRxDMCYTt+uYdpWp5mnlX
 0Tr0VCVFg7cVYD1PfLWRfIboMGN7sMsqLoR17bsRQpv3XSyZgdOQ+f/cNcBv85O+nbjepqdGfKo
 46OdIbuk3sAFuAQLBiA==
X-Proofpoint-GUID: oU_xmlfQa2oGsFlmp1pdTgAgFeFxgwTs
X-Proofpoint-ORIG-GUID: oU_xmlfQa2oGsFlmp1pdTgAgFeFxgwTs
X-Authority-Analysis: v=2.4 cv=OvPaWC/t c=1 sm=1 tr=0 ts=6aff48cc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=4h92JMTCafKA-fb_NiOh:22
 a=jjTLAEkg5ClW6PfqSUgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3NSBTYWx0ZWRfX+jU6JDP5P0eE
 YnHQq/hwfKxnBuWU2cSMB4SmCIXb5RvtSIEriqYv5E0M+njGoHpG2ILeaQ9GShuA4ebPh0KvL7z
 iVMC9ObR0xWOPxleVml/9PuI56Ccagc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01

> > A packet which mirred redirects or mirrors from egress to ingress keeps
> > the bit. On ingress, it then claims to have been decrypted by the device,
> > although it was never encrypted, and its payload, which was to be
> > encrypted before leaving the host, could then be forwarded in cleartext.
>
> I don't get it, TBH. The bit says the data is in cleartext, and as you
> flag we can't forget that. But my understanding was that the only thing
> we have to guarantee about such packet is that never _leaves the host_
> as clear text. Within the host it is clear text, whether its coming in
> or going out. Can you ELI5 what the problem is?

Ok, redirect from egress to ingress can't leak clear text onto the
network. I will drop the mirred and bpf patches.

The clear text leaks have all been fixed in other ways in the net and nf-next
series (extension headers, fragmentation, icmp quoting). This part is
not needed.

-Todd
