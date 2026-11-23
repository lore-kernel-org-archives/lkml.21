Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434137;
	b=4+vCDpTv7BiQY7wCC5qbEGXJMNC2f2Cna4oA0rQEIt5tq3vX2NkoR3qoGxWW2Ee5E7Jl
	 dWEJ9bGtBJZSPBQ+CYdBFiRltLJX7iw8qV/BItNE8ScMeh5u853B+y35f7pxNdE0Bjsqx
	 qvwRYxoLtdYnyQBKPizWco/FGVjL+qmv9hc4qvRswiGMi5fnPB5lUq4c4VBrq3ALmzoDt
	 xtjh+oNc6XbgobRjZJhx1vrDSNjNk91qd3h/9Qb2gufWTiVDWQ59JKAQkkTIRjbb/AHDi
	 1PrNDP0J6mliBLo65LEEhHZpNd/44TFFnB1ZCZn6HFCpvMnliJAQcbiAjTjoleRyIyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ir6z+1QO+ZehukLrcRk3cS0RS9cUAR81T7iwjbCFauE=;
	b=QC/MFMd38wOZml8muyAOOrQNwAtzH3RbceaHcDhujEfcyBsfjVrMhU8ocIYZ4BDXgZYi
	 DTARBPZLUFhMNWSYSS070FGZCBq+Vb6WfjseP6/7WwzftFRLbcTbhaM4ahLD1aPSBG3N+
	 HMDJaVmGm2NzAdPKGfzf9+X0LDElp1XGzCxl55MG7bOz7Kk23U/LIscCJCZjrcaWjFsaG
	 tij2yscxqo9hLsuxxUJmbpK1kCUBN0OGxPcomX3F8ovFRff8fO5k0dmS4xxrpWIyf2Rz+
	 j2yZ461/RhKWOI23p3k9nsNu9hOuh+JMejcKkOwK+ItWBqNIzAvD9KhnkfgkFpBOLsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJCbp4Bz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC61606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FC61606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UJCbp4Bz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso29135635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795434136; x=1796038936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ir6z+1QO+ZehukLrcRk3cS0RS9cUAR81T7iwjbCFauE=;
        b=UJCbp4Bzy1ZHHz/xeg0gqvcKdeVezUb6m0Mo8hJL273XKnukNrQq6GOFSTmBAcjtIX
         s2GCR8GWmHxvC5uOozGY8scUgUfrOwY3kE8bhlboNv5IqSm5yui9SXAymUYKwiGcRWsc
         J6LYhl6L51UcZv8m0kzMHi2MsoLzuS5JL4Q8P/lj4Rh3rfIv7+JUU/zYEdDe7S8tuMXl
         PwVs2ncrraM02QiyFfnunkB4h88mWWkhFQvqLR1D37opDahhfF+iYWsTYetkcqzCG9ns
         U/19A+I4PiRujN03OKyHf9g+Dfcld0t9JK8l+ZULcO/dMujm4FM8SkQE5BXk1aj/U6r3
         8PuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434136; x=1796038936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ir6z+1QO+ZehukLrcRk3cS0RS9cUAR81T7iwjbCFauE=;
        b=A2q+VjjjgC/Uf+NWykgauyI2SgVWUCJsb3fNEeCSIyv4/GO23E4aoZKCviJAmFMa1B
         Kzr7oddKkFPGNR/v5ru752u2GxqyEeSP6e7jTW2PyEWKJgc+hozhSHrP+VetwzLydJVW
         /xNK2QvOXtyP2e4feCadueAdd3rcG3PyPpKx23yJ1TYjMZvmKFT2WUz8jAqmeCELVx6r
         u1Dq5LAJYbBZOLlJ4DtHOF9BJEQ6sAsrGjdanwTnDVud50uh8Ii98xFTZMzQf6N/0UA0
         ms6AzGXvpzNMXvE+uv5nF0K5bqK/mKlREl9WmIDpryj+Z1HDp4btzRd6K5X784Pe2skz
         7pmA==
X-Forwarded-Encrypted: i=1; AL+hErG43P+YeHc5dtT+ELqpMhC9wbhK1sQDzj1g1M7VDMVKTiwZ1tVvRv63do8PkTzB9uy5n/VmQJjyE3ElUSU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++hL7rxHF/fhSTIS4K40HbRqUL22zxP27fwHlaELpBUd/VkjQ1
	Dx6ej26bkO6bPC52GgYuOCVcUDE7L8p0av2imx6MEprYzZsHTW4YYiFSuDnSdqtG
X-Gm-Gg: AZFdTZcUQ4DTMA+PSxbM42OLCZVxatfNXSwV5sUrpYmh0eQbmv504vpe0HStmBdQup4
	l3JrJurnD331NpAu/wqW72B96agdEhDyYOZyH9ycc2JpDllncJLnyCTdJwlVsHSZmOlVrFJHlUT
	nPWdQVFmg8EPSVrgeo5OsxkVHrNpRCCXT0+tscNAOUJqvTBTS63OlnktKVDdvPyLHk1PhpAtlyU
	uhoieb6qCw7EpblOaCvgHToaumpH8aP5Mgk6atLT8URV8i8Oi40lM4eIeJ8BY8MPK3ASpN8ts9Q
	uPJmg7+TJB/jxiCZOY2wTL5+StlGH4hFqExozIE3+uFKwGX1LMgnwKWEM5cuzaIEqtgRXd2nFCe
	flX1ckx4ycWGqLEn2F7PGn5m10dBefOS5pdhytycovIXNMAwMVoik8zSf/WkXedOZfUAIz8U3+Z
	yO7ZxIG2TCz+UZEZWLKNBJtfOmlJ93MxXXHijecUP24eKcC1mY1UEn6s6S6BsEs74x1it8QKgOf
	OeMl9Aq1YAYRfruMEpbAUuGJRzn/C8lAxwsm/dHW3GhzOn0J3WFmS2AgevsFIzPFwgx9TVPZtKJ
	XsLlVi6dDFDBMzl+cEmGc8SurEOS/KuxT0HKWGmVpA==
X-Received: by 2002:a05:600c:a51:b0:4bb:5f43:23bb with SMTP id 5b1f17b1804b1-4bb88828173mr215608255e9.33.1795434135562;
        Mon, 23 Nov 2026 03:42:15 -0800 (PST)
Received: from localhost.localdomain ([102.187.134.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853368d3sm351369625e9.1.2026.11.23.03.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:42:15 -0800 (PST)
From: Mohamed Dawod <mhm.dawod@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	vinicius.gomes@intel.com,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ye.zh-yuan@socionext.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net/sched: cbs: fix 32-bit overflow in transmission time estimate
Date: Mon, 23 Nov 2026 13:42:08 +0200
Message-Id: <20261123114208.2112278-1-mhm.dawod@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261119053357.2033707-1-mhm.dawod@gmail.com>
References: <20261119053357.2033707-1-mhm.dawod@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for the review.

Regarding the two additional findings:

Both issues concerning the signed 64-bit rate conversions in cbs_change() and cbs_set_port_rate() are already addressed by a separate patch series submitted by Jack Wang:

[PATCH net v3] net/sched: cbs: perform rate conversions in signed 64-bit arithmetic
https://lore.kernel.org/netdev/

My patch addresses a separate issue in cbs_dequeue_soft(), where the multiplication of len by NSEC_PER_SEC overflows on 32-bit architectures, resulting in an incorrect packet transmission-time estimate.

I intend to keep these fixes separate to avoid duplicating the changes already covered by Jack Wang's patch series.
