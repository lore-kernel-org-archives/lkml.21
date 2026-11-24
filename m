Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491498;
	b=iwFgckiKGu2b/FA/u7hdVTEb9HEPIxyCPtvnqu517vMuV9CUdLzI1KffVk18Q17pIEGT
	 Yhq1P8TrbNmkR8PDei3c4VNfH40IsLyHm5XV7eUChFluaUtns2yhu6BJ8GEOzzic4A2Xa
	 YtKWa1LmjYPLKjh74PM+uJigwpmKJqL5Gel+BgeYXn+pl3HksKrwKI6nY9lIaNm8snFXw
	 hfu/iS6R7O8ux8dbg26YHyf4S1RXhHRM/rvpi+95ugq0hVb2rt6hCtY7w5/AdVnUvL77i
	 ku30vm/Uon/qnERkkWkcqpGdbftkzWN1+OC5X4Q29/bPz5gyfIREYaau7OhkV3cHmpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=23WFpbkk9+U88u4Kg5/nJhlO5TeXk427D7xW5ikMlQs=;
	b=pM/vT5YO7Yfwcsat2Iq5M0jPAxvGNfE8B0wv8Mc0IpKjxXxBXMnDpQS/gBwFwX2jByiD
	 UMouCbxlYNP3dJAmqjnBrdrGbC53BYFSHViMSVKKU+oAR8bJK5VVe7yMaHtZKmy0M4QN1
	 OSKO7ZkL7PqToaqySN4GVJDGQPvbF5FVWqoGqJcYsdEOpa1zx8icUJk7n8YM7smj8kEKg
	 WjiDuToFLYxxcDCaAleMW0EeZRgDjkktSrigfvCL20YsnTWdSq9et9KoHpB/t5iGVgqgC
	 35b2P4Ku5ewU3h94AoYeEQ7Ba/q9ZQ76MpRvSPhJckvyD+Jtfa6wlP4zPzGPLT9mrjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ku5aLrvP;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1459606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1459606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ku5aLrvP
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso2664501a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491497; x=1796096297; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=23WFpbkk9+U88u4Kg5/nJhlO5TeXk427D7xW5ikMlQs=;
        b=Ku5aLrvP9phrP9bXjiBFMawcdxtMoArwVagFmynW5E4mJSWbBEnhdZXn54Kiard5Mu
         VNZQZgUUtN30jCOBppPq56jGX2vK520+FokqWXFIy8/8RySf6ftZ33UNQfuSfIQ3BfFJ
         TYh+RoASYZq5APEodgI5gH3sv1Mv0gic9KQ8GMSDjuUJQEcv+JNRWtx7FP6R+ZOJ96sG
         QB/5rwMVBpxLLexg4oczTrH/Bj7YuM4sPO2Hxf5fdNA6ftkwFwF85ACievajeGcMABbf
         7jgRs2QnGWZGot/++6ChC+6CZ6iidKQjqhQUeFzzi9+2Yu/3PZ1Sjhc54CDyFu1SP/SA
         yq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491497; x=1796096297;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23WFpbkk9+U88u4Kg5/nJhlO5TeXk427D7xW5ikMlQs=;
        b=RfSpZkQpLvqBwIYFh1qspJvG/yjkeDXfWYGDV2005f2QMNscRARZ0PP0szBNp2ne/8
         88pPBGANK9IGb7/PtbjKL2tkcfqxyJrtRZabTrYP6Fn+XWdwi41C392GEwmLuU+I/ryt
         5jh3q6OYkQfjCsF+WGV8TxqZer9sMMUuoo1y82z87tqJa5tPgxJQAhp/v6goRSH0JDbW
         s2lCJWlPWo/9pESz2d4cHtcOibwvh12ZXeXIkykF/0k8WN7tK8MV9AKzs/Z3Z96ZoT5q
         mQMnf2pfu3ZGZHDDAz1Ok8T1V3V3STE9CK3pH9PXzmFeC0iC4K8Kr3L9iLfPZXJ5srpr
         XU6Q==
X-Forwarded-Encrypted: i=1; AL+hErGHHw82hMMG33qLrAawnoFFBTUZ8nVN8Zk+vXzIg7dEv86r4EIcWhFyJ3Avs2yzJ2j5wfGsCj/TyMbnezQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xzraF2K8wP4rxLf0qVBePJNNeRJPCJmzblmZgEYe8DX/Qqkr3
	/jheSKZtjCoxXrzY02C9u06tdwPT4ROBj85/5SZ0kyASub5rDZSNSa7Q
X-Gm-Gg: AZFdTZez6VrAIwAIYmcQJ+Rd0kpt2dO7XFfxEcgCX2vpGx0aWTZRI4wadIJ9eWleWoM
	65JloGw0pPgWbCttjExJF9ZWqEyvRoojtvnzPvgNFH3laFYgkMLSgM75wkCwvBR4ImS9Polux2w
	Imzzs8KxneDfrq2+hgZxWSY0WlnuYwlZsl5SJxnDbYq+zrnb/POTLxuz0zuLc+7f5FyzChOeX+Z
	QYz9nJkJkyh0xSaQlIM1HHdFNkasPXLp8pJyXO4ILMLdDix8rZ9fWRCgIqjQQT1MAaxTb+35IlT
	164HcdlncALus6nnIuo2eOTZ81bW7hzvA+yAmt2zg/31dx6LHeObFPPCS2UUq0CqBRoMEYqz2wn
	1J553bI6fD+O3jHiUjiuPRs7yguQTgQSIWiBvcJC42g8ddSITk3gv/v34bBRrwIGx/cjg4tYPhl
	kxhUh4lzXPkqyio1fJhpzG6cK9KVVaToF+0X3OZmK44kk8kzYAwCaznxqrAuwJHuyq8RzSnUQWR
	ARkRT8abWy/Wt3UpOjna+JzmfnpAQ3yaFcj0oNtANnZ2j5Fer1kFZ4DMEqnNIGae3KxyK9NIm+t
	paNzC7oXmaPSIcAR/OSppitZV4/4T584DoTJ5rJP4OUFRyn3vJ5PEbOdB45l0XCjLbfRmqlvp2Y
	kmKlH7mok8Jc2zO8uZ22vSHpUfnmlzyFdSkk=
X-Received: by 2002:a17:90b:442d:b0:3b3:fc9e:561f with SMTP id 98e67ed59e1d1-3b41c852ce6mr13016956a91.8.1795491497124;
        Mon, 23 Nov 2026 19:38:17 -0800 (PST)
Received: from localhost ([153.61.198.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm10165247a91.9.2026.11.23.19.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:38:16 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 03:38:16 +0000
Message-Id: <DN34M6EHQVZC.3ON9G7JB6VVGQ@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <song@kernel.org>, <jolsa@kernel.org>,
 <rostedt@goodmis.org>, <mhiramat@kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: reject override_return programs on
 uprobe_multi links
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sechang Lim" <rhkrqnwk98@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20261119164152.3678373-1-rhkrqnwk98@gmail.com>
References: <20261119164152.3678373-1-rhkrqnwk98@gmail.com>
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

On Thu, Nov 19, 2026 at 08:41 AM Sechang Lim <rhkrqnwk98@gmail.com> wrote:
> bpf_override_return() changes pt_regs->ip to the kernel's
> just_return_func for kprobe error injection. Perf uprobes reject
> programs using this helper, but uprobe_multi links accept them even
> though their pt_regs belong to a user task. When the probe runs, the
> task returns to user mode with a kernel address as its instruction
> pointer, faults, and exposes that address in its signal frame.

That's not a bug. The prog needs CAP_BPF + CAP_PERFMON.

pw-bot: cr
