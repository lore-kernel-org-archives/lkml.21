Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795088156;
	b=egywogtliYuPb4zb1ZCtsEx0Wah/8+T3P3f8m04pqQTrOAjr3xlrJmEYoD+MfWBn832S
	 NN5pfNGf4tPuKpiJ49yOVSXiuxDQlB/q+J1MLj50CnbBQiRxNx+w9x20tBleRiGYyN61U
	 /Q1gCeEzlSw4eHDh1E2+oMjA79rG+aV2vbX2MEGNQ+6fmPb3YieqHOXxIYTVqp14UmcYr
	 +DV0yVRxPPNxiTmd9uSTu4hG8vLowyk0CG32MIqZGy7sHlX9Bniu48VeZBNpa1iREevl3
	 AKiGZk9QYJqH6mx1MgNn24he3qhQYAphsUwkgHPGwbMukg92K9zwhXyQ2I4sQNsP5gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m7U6M/EGmEZmxU1yvdQ7vVBYlQ+ST0xMHMaAKZhcHEc=;
	b=mzGQ6bFF6WA4jQZZFvh3Stssuhz93pyOWUVXR5A8U4DTJraH4LYNtNZCQff0ciZw25RF
	 rgp9w0FxvVYWUrkqnp6qHayrppYn9AiqbPLJGBmf5C6HOuEa0fl07dfssydfvYGXTjb6a
	 Ns/RUkWARlIhhOx2PF/Lg44m/PoI4eZfP1FQTlT44/M3rLEgx2Zh5MIC7MQapznqW3W9X
	 9/Y43clZQ9XSBFc2OarGRqwvDnExoDtG6hKbTzoBweqmuULGdi5pcKlTCN7Es1BmNts9N
	 uZKYpp0IS0NHyBLdY94t1jG6QzqM3pwGdZQbWg2wjcFiEP2uXyL36Xt3ywL+M/l29ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=QcPl93oW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743C606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0743C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=QcPl93oW
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8bddb1172a4so240761b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795088155; cv=none;
        d=google.com; s=arc-20260327;
        b=Vq6NWgNu2iWvG3s7zxCqlLTTmWvM8ZIa4E2Swzwk70iRle1jqOT3W6yFi4VmnOlPLh
         brltZQiWfy1I4lD4Fq8EGiDfp3yTlYLnZjOOvQUvAsp/fn67ZYlta80dPaxMnf+Y8lra
         rXgRlvDDI0XJ8U5efvdmkJ8gOepEMyGw2OpX+9TGlQAOLimpE3BKwo4F4jiaWFcfSXd9
         LEUzf6yxFRUf+6DH8ER1bm6qgn2GCFh3yPW6iDGmaTYN8jHHpfngeCeYqmId7Llqdrm3
         m5m+wj+FSIekClj4pw/w0MlgAcMxlFtsPjPFpyYg/1PuEg/6yOQBxSf1pzw2Hh0adpGE
         z8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m7U6M/EGmEZmxU1yvdQ7vVBYlQ+ST0xMHMaAKZhcHEc=;
        fh=LMb/W5eoDReGXbOit+9SQE4t6O8KFAe8TEhksBMNjrs=;
        b=j+pQ/mOCVKcEZiNcCgBQw+4aO2GcQu27+0fveyO6dc9lQ+boSRdbbyA3wCzdWV/+e1
         dgKbOCJn4mGy6Yq97D0hFZEfRcrLAUJbVFHdEjVoTdMlm99j1UAqac8heTzK3SK95IIH
         susxDaZGUQegCcS2SQaV8B2Cn+okaBIRCYvNr9Ui2/51Mj6TdYuF0/4sgX1B/C96cke6
         2CyS8fR1DIUvghIg87CaN9tBpFXzZHRd9XzZLQ7klKHv/XIqdfpbOTaeolLZC/LElaj0
         3Ad7NLFj8PawYYfSDxFWd5ss2fA8mq6ED2fV9dhnn8oBjO/MApJxOW2Au56fqxDI9I5Q
         uduw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1795088155; x=1795692955; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7U6M/EGmEZmxU1yvdQ7vVBYlQ+ST0xMHMaAKZhcHEc=;
        b=QcPl93oWLhCfA6leBBUG94g8wJ2Az2pfkebXkNqWqxr2f/4hbVCjDTxj4Wsgb4iD0r
         nGkRNlVXyaMag+N4sHAeLhHr4fFYUg51fIfhQLYNgG9/GzgqFiZ/4fjhrEe09ii5oSWk
         t8jvmiKoPyt6+LI7wNnxBX1bCvgbLK6ZjrZQ8f04aTDbIsVzjFvDiJfWdqNiN7iZqfVZ
         Z0SX1IEAeCCU8Nlb7V0FyKQBiCaDad+dj9zl3js/OW3CO7QzEZkdeWlSdf6r+naAIr/A
         FCCOZPjt4r6600Vq04BoxThCNOBtD+fxBkHJ75npg5p3lqF+E5+ObmkVKmoawWEJNj0V
         BfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088155; x=1795692955;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m7U6M/EGmEZmxU1yvdQ7vVBYlQ+ST0xMHMaAKZhcHEc=;
        b=P+FFg6gSdxtZjzZD7FXIk1y8xsJeU4aexJpYR/zjWcwtZ73tY+t9hJ334Kf4K4wcoe
         beCHl9D8/SUKpiVa2S8xJxWVXOWMfLJUiqWZDw3D6QRndSXDYyHvGGh3jE8M20Aza2C0
         QlPa0iXo0GFs2mTfcjtSFOtliEpLL7HyBJTcjhF3+S7Eb2hiKUjrMIZyuvsyBPShQTjZ
         U318CNVODmoEM8vspKhuyXwV3BVPMA3FYM/bBkgQHN2mH2fWzliOTJtTup57ncyfiKmq
         4OnK/1WpTWVY6zdAUhLu3EyMvLhWDRtxMBSDyICN+HZCZIFg9XSsvFIDeHvQVJDkgjCj
         MUOQ==
X-Forwarded-Encrypted: i=1; AL+hErHeJvMfHbIprWA6MXhNJoAsRuLcXulVq+O3X/+9IhVf6eR4RjkJ5j5znETFQJtzSHrCSNt3RdGFVnOxA1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z83Kk1vCgnDE3pCK1DRYZrUvz1H8WDkSaaW4m5ZlOnFC69AMMR1
	6ioKusdlsInMMuBc5n88UnkW+7dm4uW87JDVhOB9+LkHT8gKyf4w/QZit4b2rIklPQSXg7VeAi8
	zOldbC15EnmledNT4Q+RSbtkMA2oLNOqQITR0vLc/bQ==
X-Gm-Gg: AZFdTZfT9WyRJvmsjkp9tBNsmCooZF8VaEMpiFXuW479lyxcDtUfjonvS/2xZfjWRvC
	NL7viNyq1kwEorLGmjPJrZ+2cJjQ0+3JEa22Iiud4BhMB8J/kO6H1KMdvK4AH6S5xfy4Tazxbwg
	9v6zW7gVpvMya/NSsVDrxv8QZd5D433tnJ7OyNfbchJuC1z2HjmxRePfe3f0ZlkF5yFSng/SA3s
	cGGTeDeNxOM+qKIP6VfptvMHxREeDHBK+RkQzxqZ35qn6tSxitcNsM3JcCeGvBD+4RExIrBbscU
	Vide9j1QWwU+3MP67r1ODPjrE8i98sXiiesNQk67r65VSb3HW4IAG4HaE00AQHCXcoAy6H9wYNz
	W+vK1ESKKoQpLElOCDXx30vgtmSzXDqqH1C3Toaa+Yl5HjiPL6Y9OOOU=
X-Received: by 2002:a17:902:e888:b0:2ed:29a5:782d with SMTP id
 d9443c01a7336-2eff72e15f0mr91673755ad.2.1795088155325; Thu, 19 Nov 2026
 03:35:55 -0800 (PST)
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
 <20261117-bpf-preempt-v2-r2-v3-3-586376ec3672@sentinelone.com> <8fa7eb35-950f-49c4-b60a-c00b52cc6e4d@linux.dev>
In-Reply-To: <8fa7eb35-950f-49c4-b60a-c00b52cc6e4d@linux.dev>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Thu, 19 Nov 2026 13:35:56 +0200
X-Gm-Features: AclHuK_P4lCX2n9SuYxSAwroQnE6rqvhil-JFhCxhFnQsc1M0KgmmeelNAQBEi4
Message-ID: <CAPnbwjpaTwDH1GqV0Mxtc6VOL7feWTBrQwaMD5bzq1kzDmE3vQ@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH bpf-next v3 3/4] bpf: Check program
 recursion per task via bpf_ctx
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

> Was a limit on chain length considered?

My proposal in the v1 thread had a cap of 8. If it turns out to be
needed, I can add one.

> did you try the array-based approach mentioned and compare perf?

Not measured. I asked in the v2 thread whether it is worth doing.
I can measure an array against it and post the numbers.
