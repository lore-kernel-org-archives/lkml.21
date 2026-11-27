Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795793204;
	b=hfLXTeG5ZcPqYAb5NO3wwN/bv1fSPnCak5wGVW+0oMdzfzzRm+9FMWUqajHHEwlWhLTW
	 nJpDuJmbBUOHzv3K2PTJvbDE30OITcohERv4IN6qIm0Z2pRoqF7bscLu491rfpknQUEFJ
	 NfuridGyX41mPWE7o5g6MV5KS2u+MZh7L4gnzRWo00G1BVHIIHRMNBQX+Jm8ziTS2pcUs
	 pd5kjliWYXxKDeME8Axn87DXBGTEu7/0bLD+Vl5AQu8yP98GlX8NJYxD+TdX2VjkboPXz
	 RRNXuKEDTPgzNq8Ki803lNmha0WQe2+6BEbrmFinsCFWFy8YRTEtmps3tjpXF5nPF1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
	b=zcMArP8o6xIISLeKbwoF9lSwoBpaJysoUKt7HILrlkdNvbDGUueCllE45aMspcS7W+5k
	 x+6iHk48DUj2UKYWyJvw1b8QGiKKLfiphBfOM6xdrf5V6xixLQoSX+wjDe2ahNcFdNIE8
	 F+LqFPxHeiwXUFx9UIy+Kl9EqsCUMaOa27IAAzqEpk3XjeZp+DfhusS/hR1KkPt8nCbDd
	 +lNhH0KdAXDrtFmI2lgHsVI6yF0a+Kkph1XORviV274tif3YJ6WOWVDHf6J3iPnhNP1CA
	 rsw9D9bP5M9nKaggP5tHW2Vc3KH0bzUofSLfQpVDXKLox+EhD/0WlxzbO7IntuWSi9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C8606A323
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 15:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E6C8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=n94mAkyJ
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b51389f58cso88865337b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 07:26:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795793203; cv=none;
        d=google.com; s=arc-20260327;
        b=pc7QNCiD7Wi92BMGk67DUMQr7N+FjQPTMhXlHFgJV4VnHRW2oqtfWTGl46OYpmHHvr
         rxsx1LLq7Johs01NEFSrCNt73w47gRaYsE94NvQCNl6FlTRQxJXQqxW8YbYP9oo0vXW8
         hXF88KoM8QvA3BKIapCqAZ7n+kX80V9gzW2qOqDw5b4F3Ymae/NACyS/bGK+x+wXSIKr
         56TF3KQbMQg4GEQRgGAswY4629G8ZIQomZtetyVX2L+N0N0dLGCuvEDwSUaVkx2tAa71
         F06yD909TUWDyCf938EYOcE6AEJigkt3NYhE7dYhN0VZZ+eyyEFIzLxsqcqvgeSKuBgL
         u8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        fh=U+LhMD0WLciHenXzJqt9sJKKZq4Sj+FbNkbd6TI6wp4=;
        b=UKROgVXjYzTSzcrxXvG+f8qA/3PM6hcoVRTG6KBOhPhc1bw/HbiuNeeCet2oD5t883
         bxeO7D3UIk7A1082VSFqeaQJGD+WghzRTs4H2Af/wi7A1dCLFH8E+pfr6qtASdE0U+aC
         aZT5wAMdaOAP1s/PugBhF7yLvL5Sw9wg2EsaPwCbvld5kG1j8wS8o1xn5yoSVTeB98r3
         1aZfw9H477+vHAxBnpF4iSJ8iO7Oh5Ka0PWN40MOajELLBlRNzujKzQeBsPXDYLNxRyZ
         aJ/DAtj+kUv/oo6lF7vX0VuBDtBqqxSvbUhjSXeJL4S/U2Z98i9m76sGGdlRIRNGdOb2
         rO0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795793203; x=1796398003; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=n94mAkyJOfvvvFdqyDtEpzjXrweT8JaZWeLZ+JYOiBFDDuYaMPknPGxHUMwIf2p4QI
         XbOKYuOKTdVMFxaHokKbNXTGDBUktL/B8JSyE7b6YdHb/W74KbvW6rbiCZmnIQlF/i8I
         ALou6ktP1I5Zbs41mBTFycRR8rPWR02G+g/k6UH6l6DD/aedUb053tQ5jkZ91GKvmJIw
         67G0iRK3SJp9Ne0ESx6cqkBNNWwucbSzu7o0e1KmDO5YpJZRB7LNyeyOHGcjxEYRPjwa
         qp45YwL1Q5w8yIJrLzHHQk7QAC0knp49PvcDTYRwISeZGMmOYrkYRgoOL+1gkc/Fe8L+
         ufMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793203; x=1796398003;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cNaFNq+h0C98G3vTstsz5kW6XsnAXUPToskRbu44xM=;
        b=iZS0NDG/JrZhavMc4OTDoawcgPkgDomdIEWEL8k695fGkunxrHPFPlq7CMKuSFHAwp
         nJsWLcbNRpeWNX2HNdd3I6FvPZqgI7SirEKyEdrTp1Sq096HXn4hdsLnBWVT6RhYW2sQ
         YIelUUJyslAeAOFxM4hosq4ajXNgOb/d0KQUrGRIxmmFXuqCz6ahY4FMnUNXu/N73GC7
         sHRq3ixZahR8d3+KcApZl18dgsK2fFzpMtAoqbvRqtEp/4Wkj5VPEVa/ZvLouETvNo/J
         3NVB8BrzM7UPEOVKezRjW5ElhZnNF2o/O2tClgM9HNI9g6Q5VN32nrrU4LVhvDi2sB+s
         jSVQ==
X-Forwarded-Encrypted: i=1; AL+hErHN/F3q7T09w4f6WQMpn/qYVITPPupVY/KuzJA3172VZ2Gqys2wRf3Sb8C9AnD4bJ/GUKXxF1U/o8yQHyY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BNtaz/S32Yf5llmhmlWpzT6H5fnEGEvZPWJk3RBarVdLDdDy6
	r2hYSv8hMEtePyd93M7kj3yaQPYACu/Ka4oqLoQP19PYwF2zh1J/2V4bfXHziWGCiZqFWp7lIa9
	jEk6s0F173cYkyPiuXlhkX3l6hGzF08VIHVP19W8r
X-Gm-Gg: AZFdTZcfbIObi7rKzhEYe1ivcORmXeIV2H/+2L/JIARKo1VVIjImMFyCK77Y7twptZb
	M3hD3bfRQCrXcwmwFyQBxALe79FulE7Tn3apxa0Pj09EduZL61gHhTkVMTeyTyuqnNY598LWbfK
	BElX35qKOwu5DRqzZ57UpfprqDYOdOq+05fw1ZFVNynH7mHODC2eX9FUEuoz7bZfkB4H/0ZXZ+l
	vOvPsmiDFhyFMlA2F99pZsYWQa5IwXj4IBogRZsAWLgvI1+fMpw2U4JwfsLkDBPG4j6aY9brPU9
	Z91zXak6YPGdV5YN9rX3CmpMo6RfKYKGUMxpe0eyppv8rV7p/rweTdekBNZqaaiQO+3Aj8YOeow
	ndCTGNN25NKiaSOgWwSRZUHOh6PoOHpBMNqqATqqFpvhv3ewcjYL+0kdbqy5QyEgEqQ3eZqY/jM
	DusX0WiVkBlFeMPz0YxZX8gCGqZvyRCw+k7Xgkj9tyY9iySj1+vu9763gDgYlFgoV1+N3e0+SOv
	uVWpGwkC5nxw8hFiRJ8ZE24w6pEAv5X5i1pQ2oznOJjkkuh4D6yC30+aQvWyQAcNqQqVAHy/zjV
	nGSp04IijElw5FHDWgbMtEMZ01FRzlR34gZf65Y0vmzpxxMh04BIW2+s9EM6lolrt6gR0H0OnXG
	/kHSXIQp2fXn9nabK/5dkloyVrC917tW4
X-Received: by 2002:a05:690c:698e:b0:8b3:45b:a4f3 with SMTP id
 00721157ae682-8b5204ed736mr106681927b3.83.1795793203488; Fri, 27 Nov 2026
 07:26:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795284858.git.julius@bairaktaris.de> <7c74b2076dc7dee1d481d39a135e0946d5e04145.1795284858.git.julius@bairaktaris.de>
 <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
In-Reply-To: <34e77fff-c57b-4ed0-9035-b9682ad3914e@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Fri, 27 Nov 2026 15:26:08 +0000
X-Gm-Features: Aa3M54pxMqgZ_s-9JbfNek_3dyGz87LXsEraMMuneoiDkKTrHn3sKg0m5hARvDM
Message-ID: <CAC1t37L_+P72w+gNcrdphB7xkBmCQp5PQRFpcu1zqM1m-2Am+A@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] net: keep the TCP fixed-ID flags on the header
 they describe
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, willemb@google.com, horms@kernel.org, andrew+netdev@lunn.ch, 
	dsahern@kernel.org, idosch@nvidia.com, ncardwell@google.com, 
	kuniyu@google.com, steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, andy.moreton@amd.com, 
	alex.austin@amd.com, linux-net-drivers@amd.com, saeedm@nvidia.com, 
	tariqt@nvidia.com, mbloch@nvidia.com, leon@kernel.org, 
	linux-rdma@vger.kernel.org, alexei.starovoitov@gmail.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, sdf@fomichev.me, izaiahsun@gmail.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	shuah@kernel.org, bpf@vger.kernel.org, ipsec@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Ack.

Thanks for looking into this!

Julius
