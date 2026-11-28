Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795887590;
	b=FYmmJtpUM+2qPs/JelZTuftfoAWtHKWYWAs8BC5CfZflBYm2o/ovT7orxO990Ix1dPmH
	 EyZUtLyoS9Iz2j5lczKdhlyLC8v7mXN51yrlVFwCfuvYZx+VKD1B4198w9V5BjKBG/oEm
	 eXV8V9B3KVXOGIZ8dNeHBrob4hYmgmpKKaOAHQd4iD0d9iduCZGuNPwReLdMbrHlJ4mJg
	 RQePL+rRYTVXlxT7oKVJJD8V90iTG3uFKIXyLg86Tzx2L03b5wSk+HzBd4HEll5kHnOgc
	 UDnvCMOaQPNdXwyC8x4VH2e5diyQRZutmY4/Qtdd7DIyItjkQwvjV0xhD+fA0IP7SOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795887590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Subject:From:To:Cc:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=DPsvdnhtcQ/tR4f8xsM9lCoZbg2vyp43Jjo6UrqTse8=;
	b=0iHGIHlUraoRkqKfuJGZwQFYXH1hbZQsotAu8GjcLkKZtXsCAnx3/RvVgBngahrLyrwk
	 HMP870abiF6SwjJ+Aiw5LgQ2LRD336SZz97cv1rSkfQghf84gkQUpvrl1ac/W3LFmTbj9
	 UdRS+dRTamv8b18n9+jiDolQeov1BhI2e+P6SK3ymicXzdssb37wb7kjr43SseT8wpiuK
	 4HtCdUQ6/Oj2YxgPPYUKkRMbBoGahL9Oown+wM1MwdEYJ4qTcrSS83PeWBPJb6allnaqb
	 kuCmHgd7Hz94c4/JHsFyVDv+8K1EyugOTcjDV9MlA1OvYbWKnTITh7RKdKbTuZiIKhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/ipviWc";
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F05606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 17:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/ipviWc
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so6103074a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 09:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795887589; x=1796492389; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPsvdnhtcQ/tR4f8xsM9lCoZbg2vyp43Jjo6UrqTse8=;
        b=i/ipviWcrQbf050UlNPYi8iFBOOLA44Z0qvA0fkZVlHK6U73/wnwLXMG7+FjBvOzJD
         ebdm2E0c9GDzkERZE9mIevqSjmb8gFI3P6mZCv1m5pZjVuIVa3Zxt9n9uNXcdEhGSSGS
         S5NW7xaYgsssrGF4ZAtlf083GtHZeaOIeT5KqlWiubDQzp4K/npPRToo0UTOppjhGZSM
         N1MAcVJwYy96KdaxcMH95GL3hEWmRP6fSZdxb53ddyqUjHxId42GG4u2461y6avayZws
         6YvhV2P898BIgTptvTv1yIe/bYerm6GVSP5y3+fuEVEiImTvsOBJe9q+MUEsfG/QyNxp
         eFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795887589; x=1796492389;
        h=mime-version:content-transfer-encoding:references:in-reply-to:cc:to
         :from:subject:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPsvdnhtcQ/tR4f8xsM9lCoZbg2vyp43Jjo6UrqTse8=;
        b=xdtWpa8iCpUTmfRZtJQ+t1hkMwIHY7iW10CIwq6tFzHuv2PPfaGHoqselUyT5zWAnC
         GvMfZo30ZmN49wAdrIVVe5SwZE7AENh6FwPBlP3iH9Nmn6e4f3Wn7QDZLCtOeBAk3NL3
         Rg497ht12serii9Jm/nCmqLMDnrNKlz68TW00PEY24I9KO1KtxFQOnl6nLwSVjGemoQD
         qAQ+Aox6WV1TcdOv1BD0h3ssKlknKkOd8tLkXE935pqbSM6saXiD9t3zHlI8U7lzfQ8B
         7uI5weJxdbKBsBhx8TSlul08ItCBi62bdM/JYqGaxhk3dSW5thpRqIVlFasDaR5gqDPn
         +r2w==
X-Forwarded-Encrypted: i=1; AL+hErFwcwpTIXsiVi3dAZ9AtFnEuhEjR5ViSwDAhFjthIq0xazddJq+5lAlm7/lxKD0iGFcGBJCyvIOoOrl2hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/97whJ5HQBlsF7Pw1vduM3sbpsLhYwuW49X510K1GMXezP9jE
	EeQuoqOY9kclf1u/dc8pdl+jsiFzD1gwa+O2xcH5IMltCjHPFhsWrujD
X-Gm-Gg: AZFdTZc2Rpc/6Al+kfiFeMXZQPbEV1zkmd0BMJyo+MCCnhkmi27fUqssEP4Dh3gEHTQ
	bQdLGRFqVAv9UK4t46rXJz+EpEd6CvoJNPirkwkF8tjk0pd5zZiwsloI/x+NOzmw/tprzpbFSAC
	0+Iu9f8vLGJEq5CNGCV5t64gEzFnGPvsLci25m+VRtMQb4QcDHivAdwRZABuOBDrP6vvihIrBFr
	EsfaS6MFwEfdw4Mr1IEg3w+wGbeLEQScN0lupb1RmL6ewPyqWN4E61pTyiiwV7aeeejR8t/XHGN
	ukFzRD2/jNTEz0aa5TEu6W9RwzKZnWQ0KHuBrr0f6M0GKD7KbZf2K40JX25MX1fof3tG746PCR4
	xyao+Rpp6vsXPZvz1Lth04p5IwgC6n7GLf+j3gL6cO8Dq4ivUDh65t2NDF8G9A5VYF/Tox1nAih
	77kh+QF9ZcHS8nKQ3L4Nergg1TesPGg4LHb2YbTYG0lRyG2XKyqGb2ebL0yEiLIey1ztGHTvpwa
	4UMGlFfjEmMOBgljrvwiFQRIF1Qkq4/2vScXfG2eN65AjeHF6o9OAECARwvoqMD6Q+KQ2FmA2CS
	jrnPsEJtV2Ia4G00vDddE6dmdwImRCfvCSRvXiMXz/wp3FcA2iOepsNDtPTQNA6uD4GhqH6Ygc6
	yDCtgpf0jg5J5lJ6//jU82sSnmFuN5APj7A==
X-Received: by 2002:a17:90b:2701:b0:3aa:fdad:7d6e with SMTP id 98e67ed59e1d1-3b41c8d9224mr27424178a91.10.1795887589397;
        Sat, 28 Nov 2026 09:39:49 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm46725942a91.4.2026.11.28.09.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 09:39:49 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 17:39:48 +0000
Message-Id: <DN710OLH9HHX.1ZTIKOGZ6L7LG@gmail.com>
Subject: Re: [PATCH v4] rcu: Mark rcu_read_unlock_special() notrace
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sechang Lim" <rhkrqnwk98@gmail.com>, "Paul E. McKenney"
 <paulmck@kernel.org>, "Frederic Weisbecker" <frederic@kernel.org>, "Neeraj
 Upadhyay" <neeraj.upadhyay@kernel.org>, "Joel Fernandes"
 <jfern@kernel.org>, "Josh Triplett" <josh@joshtriplett.org>, "Boqun Feng"
 <boqun@kernel.org>, "Uladzislau Rezki" <urezki@gmail.com>
Cc: "Steven Rostedt" <rostedt@goodmis.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Lai Jiangshan" <jiangshanlai@gmail.com>,
 "Zqiang" <qiang.zhang@linux.dev>, "Puranjay Mohan" <puranjay@kernel.org>,
 "Bradley Morgan" <bradley.morgan@linux.dev>, <rcu@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20261128061955.174288-1-rhkrqnwk98@gmail.com>
References: <20261128061955.174288-1-rhkrqnwk98@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 10:19 PM Sechang Lim <rhkrqnwk98@gmail.com> wrote:
> Mark rcu_read_unlock_special() notrace. rcu_unlock_needs_exp_handling()
> also runs with .s set, so mark it notrace too.

Paul, Joel,
pls take it via rcu tree.

Acked-by: Alexei Starovoitov <ast@kernel.org>
