Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051789;
	b=s/dk0CUl6+LQWd3ZLy553cU5Y2MJh3mttLVgWa0WCEwZXQMzi3nn5evYh+tNFmIRQqN5
	 6sffqq5/hEW0Mu5EbJXCfGrByALvEZEJxVAlNsohCV0rBJQ+qgtfdTlwQzqD1NCdFBLzx
	 X/jfDTPbRz+rd9OUlmwou2vsOJ+UOijD4xeMZ+rgyU3EYP1ss+SpSytWL8LKAu+VC7ScB
	 wx7NsHHSuaQVXxwPTRt86O+z8+VAbI/KGDcCjmQcZLVJiTavS9G0PRzJI620sjyeCp0Wp
	 r+N/ILTGJSG/JAYGPG5foERA6dNt2C1RAXQdrLpuzUqEOpY1U4O8tG+A+p4Cxy4hNMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IMUfFg2iR1Z91GxSjPkov61aiB2ViYWc3Z9M9ZmX54Q=;
	b=qCEwHKflOjnZeI/EmvIRATiu6xi4KTMXnSyR/0u8/han1BSjPnE5pnptJOZF7ZBXh58U
	 vC1a0clLC04RT7DXYoe+OV+nhNihFUEJqaJ17trPcsaPizbFBcQca5D5bDun4QM36+ECA
	 6MIbmKDxqf3xkUE125AWX9NC8IN3kNUeePCRfswjBEQOX3zYib/cu9LRYrEtfAZdRA65Q
	 3pmeyqFxdq+FzsEZF/JFN40/h8Y4O5I6uVETVWvABlJLz4AmoZ3l2sclcJpioQnnZbJHZ
	 J4VVtPDR74osv5aNMoIZhsk+h9rbydl5S0sQUCkIax/a5Y4wAEpYUSfM7GUUVe2wbZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=X6RUl5nX;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C80606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C80606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=X6RUl5nX
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8b20b2538so1161975a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795051787; x=1795656587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMUfFg2iR1Z91GxSjPkov61aiB2ViYWc3Z9M9ZmX54Q=;
        b=X6RUl5nXPwSwt5c/kUdF+d/qAIPpu4B78KXEgoYgO1Ifwmp9Un0wXT9O03brHfdkj0
         Iw/NgiWtHQkg9OjzyksdTG/Yk3SubNSObINPdaZ1LH3tMW9lWXcM2a5r0nkclDrg2smC
         Zb0YGB4IT7dNKxmFRti4PmVmxBxhrgJIsbGdXjpReO5gHaAFEaHL7kPg6Eg7L+Kh2w1f
         9UmlkTUkG7mvaMEWNHvsqbuMBWDQO8hWN6c3xb4rEMyQKIx7BNQiPLSzNI0tNGSeJsfo
         60BiL735Nn8IsGlBj2912I24qTnwkLODMQpnOlSR6NzHZK8QstcQRJPAG1XWTsTRcE5b
         m+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051787; x=1795656587;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMUfFg2iR1Z91GxSjPkov61aiB2ViYWc3Z9M9ZmX54Q=;
        b=eBeD8qYEgJFWszsbvSCSTrzURuWXCPTBZt436HlDuTeS1siguvRVmR+5DT2XekQXZj
         4PjHyQR4B5WWUNSFo+DypB2eHVWZnDcaF7uhGAk5DYT1YE8LKdPkHgmFzOEQodyS/nDi
         FBNBZdyUFugcKqOWl2hcXUMo54CkmdYum+lIE+y4DITJhi73SPtquIMQ8MybdWx3Sqoc
         Bf/hRQfFC3OPheI8XuQr+7SwCOsMnYV2ecO6KdiRXjf7ta1tFE2D7ZTuHIE3LEC6vfy5
         gTLSR5ARNlFLsmRwL01Iw87eq4ovy095GW13KI9IyNSVPJSEB3wi1MV8twHv6yxA59l8
         0rhg==
X-Forwarded-Encrypted: i=1; AL+hErFBEFV9mH0ppEhdWaA48tpj5SRZEgxNQLta6Grt0G+xTNhJV+cgiTPRfqulPrBgEsjCmELxX+adSgQV2Ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z+x6Ag38FZsTuioFqLewIceLVV0anK9aqF6WxgIsDbHmGv5ho9t
	avGrPZj7pAwbFbglTJRMQ8sgQOCPa1ubx/2Z1izLcbPL1qogiryynJgoiYB18+Xc5Do=
X-Gm-Gg: AYBFou1jOLlRJbCE3vVsHsrXAGRhz+n/piF2WaHkRW/QxPtVUGtVXmJc2zndMEOVPha
	IQXTh08xGeAWIkgR3E2Av8w3pvykhcP0FDEeX4UfDqfjpYaVpiiNauPqNnk/c+yryGZW111Z4hu
	Zmtz2iyZp9jYw8eQCEPZDPdY7AUfDdmNaFhaoKmQ5KEm3nOybPu/WB5tTtVIl2p4fzXzozM7EbR
	tMcWauxLCj9hP09VfQ3ANlZUXouz3EA/0IASmxRhmoxaJfaXuz3UiJinhN35LdYWrgbeXnpfPyB
	x/WsGGURJgw1Hwohw/XeBxOcvMiOmMF4zYzO/UikI7Drq/qWOTaXSNdS+Y3b5yEa5cGN9lQ1YI2
	awM4beE3JdVC0PlebtuAP+SeQyGPMtIqQ3o6PWP7ESxtoYtXt+fY/he9YfN2CasOWH9X5/61HWP
	7d0PoLlVrND4rxFdMnM9b3Wp2C0F1zWrRt3uvhOxnC+h3c6cWEqXN+vAzD4M3xdGVAqvohDbzvg
	EVtNzfFmiWd6WtIq9ngXI47kQ3T/w353ZZBQaPqVzY3+0DqbDAd0ZcT6F8l5QoJR3lZ3XJosfFP
	E+WrgLR08xqIcwp/icu9hsa+nAaV3vZB4tpJfA5CJh9K9UOA2RQ0BCEqbQ==
X-Received: by 2002:a05:6402:c4e2:10b0:6b8:afbd:64e6 with SMTP id 4fb4d7f45d1cf-6b8afbd6722mr1777470a12.42.1795051787085;
        Wed, 18 Nov 2026 17:29:47 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a1eb813sm1711016a12.26.2026.11.18.17.29.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 17:29:45 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: Hangbin Liu <hangbin.liu@linux.dev>,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Thu, 19 Nov 2026 01:29:40 +0000
Message-ID: <20261119012940.32838-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com> <20261119003003.40482-1-emmaonana18@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Omokefe,

On Thu, 19 Nov 2026 01:29:59 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Changes v3 -> v4:
> - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
>   lines within 80 columns (thanks Tianyi for the review).
> - Add patch 3 deriving the invalid tx value from the kernel maximum.

Sorry for being annoying, but I see three problems with how v4 was
sent:

1. Patch 3 lost its subject prefix. It went out as "[PATCH] selftests:
   net: veth: derive invalid-tx test value from kernel max", so
   patchwork put it in a series of its own [1].

2. Patch 3 should come first. Patch 1 makes a chk_channels() failure
   fail the script, and from then on the nproc + 1 check can fail on
   a correct kernel. With the fix first, no commit in the series
   reports a false failure.

3. v4 was posted as a reply to my review of v3. A new version should
   start a new thread, and its change log should link the previous
   postings [2].

[1] https://patchwork.kernel.org/series/1215530/
[2] https://docs.kernel.org/process/maintainer-netdev.html#resending-after-review

Cheers,
Tianyi
