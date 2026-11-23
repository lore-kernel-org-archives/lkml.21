Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443368;
	b=tf9XuZKSrOTWZl/c3cAeB89CMEMeEkE+S0QYCTFgStDtvwd+lBOhzEiliX/vE6nybtz6
	 EQSJD982B3qZOOXlfqk6NITBLgF0YL6byjFpzC9AmcVn3vkJW4KJaiDvdAFZ4N0pjEGbJ
	 huTHGPw6DWz5Su9+HqcHd90HjkrUtcRjjw5tYpC7sNboHOPM4f2LrRpN1uE8r/YBxeXLx
	 o7H3l08hKog6+MUSzLtsFieG7AA2rvuFq9J9oS8/TWkb9qK05YJqU0hatFvToVfhAViFv
	 DBstXBvlDTMQCU2pmfjQZbFy1cyg9M/Rib9O8Us7vBIHFgn4jGSiX+54pICKZWk+6Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zfh0a6qWB7cgYhlh/JVDBYrhyvShnRR27oz/yTBM+wI=;
	b=wRsmGzHukUCai+yKrviRGzxSm3HPcX5DNDhko2dDbrG/C1jykm7Ry9iK5iHEdDn11gE0
	 XvbJyaav9WHDL50uZhQcmO2Xc/zxRmqgQM6aZspNoHcWUaS+62R620gO469LW6+6aqv/z
	 M2bD1bqwViRnSpgla9BFqufwEUR5tEufmds22xUsYrkWtu2YautzmEZ73QSX750sX8+DY
	 RUsz3O/JnQzmno2P+Fs4gtragitO5wK1XWZPd3F4lXzGc9Iy/3BbuswslNP3a3IU4oxdP
	 hp6bQVo1+gMosEFSbnn4dke+hZG++K2kQv9tdJ5n9xuLx7VJrOUYzsOLoM82B8SWjYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MzQ3w9nU;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A310606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A310606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=MzQ3w9nU
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2078813f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795443367; x=1796048167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zfh0a6qWB7cgYhlh/JVDBYrhyvShnRR27oz/yTBM+wI=;
        b=MzQ3w9nUw2sUyJnn/xbL3lFnkOFDs10fQ939b1r9lh3GObb6YW0PbtbT/rdjeJ4rmx
         WqEZhQyPqHwQC6iJ2D06RqjGMiDjPGz2ndgRMGNbdLktctaNAa+Vyj3hZv6GTYbcMIoL
         9idjx98FhZGu2zcC/Xro2yLz7tAulmBVYILxyScBaaBn4fepRtuAXY3joaRDNfuHXkq3
         Qtle4B4BdgjgO34ulYlM/LfdtfEiRrwIiytmyNcfZMbXLq3flUVQw49XdxkFS44h2lw+
         /idJvNMYlizMxO+MngmekHSGiaLc5am23Jeu+LvaGV//bAcJTBCyb3o6XyKKYbFYqFLx
         pBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443367; x=1796048167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zfh0a6qWB7cgYhlh/JVDBYrhyvShnRR27oz/yTBM+wI=;
        b=RkZnG3mWVkfJ7XIR80ArQu8eGQnR5xze4XBDGWkbzuklzg3+TkM+KX9iQA90QhoiEa
         YNnP/PlQ6qfWbsm5jxLg//KBsHhmYcWhEz3KLgTbKWJNDvwl01DEucOTXlFHQCyEzCVq
         z+aCdi47UB3dGEN8Z1rJwfmqMPe0xC0FvRe2TOiLVNqc1J26tS5PLzSBl9YqSm8KPQ+0
         P8H3O1nwOr6M3MGwaSnlfCe9VmddSFKCFBPbqrfkVFBs7iFzFNtjVBMlHUeMDLRjQn/z
         pQ0AFEDjan6yzXDJRQuXna0RBoS/BqxhiB4pNOQG9kDchWT1Ay5kM2XApGefe3QjXWfR
         XeQQ==
X-Forwarded-Encrypted: i=1; AL+hErH5gkHmzfztfRXXQG+tkawKGGf6pQqGvb6YrJ4Sb1XwX1vZdKJ8bhDdHRF7oYY+mg2Tqe1dFISw7aygy1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dIIXB9A3TmRnpFigrlMcju6k3EN4Ca4CT+6UZ/INn6A6ai5K4
	p7bzOqRvPO6IgNwcwyGGZ6dhDtTBow3NVFw4l911FWn2F+9ExOCGizABvtOJJintw7I=
X-Gm-Gg: AZFdTZeQq9xrfNYAGPSg1pk+3SchEbSKNMyP9zrA2eikyExflrih8kyz0NeRP0vPFAi
	GqeKtpzUcY0KibKAOtjV530OXEh5HNSlL7bbhA4rRrJxboRsrkfolQuvoa7Zwqs2nKxEbXuYDTr
	pgbBp5mBilliAxa4rmoyCXxhRTH3lMCytizBJxo/4p4MVJgpG4+nF3zmqIvIe51fWAyxARGHNzj
	Ht/+zrf/Qz8Qf87ktT9e7S9TVAfoEy6zlPdlLqAE12hhGGUYWPqEng35jLWsXwsIknKtvxXL91L
	f87ujwT2LCgCJw7TDJh+Iv5l4GBLYvhCh2BUDyh35NFCNUlioZN0RQ2N9Xdrnm2HC7FsXkdolhX
	8oIU5VntLUpX/gPD8Y2j/ncyUEZfWEwtdjrRSeYrgp4i0qS6h03KQ/ioevD7GM882gfcOZlVLdO
	FVwzjGfg1gDBOgyTg/j8AtJMDHAwb6rMiAi9isRFZ4QI9exrRe5149JEhAR1t+wUYnaTrMHgCpt
	kaITruQGqNgGuIVA/k4LLGWyqF3CMyfv+4Q9QoYHPFLrn9vqclmm1fUT/RBhAKJE39tdPdmNsXR
	hEixc1Yb37LfDZb8PtOXowU4cIgQoXc=
X-Received: by 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr15920212f8f.47.1795443366598;
        Mon, 23 Nov 2026 06:16:06 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm21672571f8f.40.2026.11.23.06.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:16:06 -0800 (PST)
Date: Mon, 23 Nov 2026 15:16:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] selftests/livepatch: build and run the tests
 outside the running kernel
Message-ID: <awRKo4D-H2sHFfwR@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
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
Content-Disposition: inline
In-Reply-To: <20261110161050.2451750-1-sashal@kernel.org>

On Tue 2026-11-10 11:10:46, Sasha Levin wrote:
> The livepatch selftests build their test modules against the running
> kernel and skip every test without its devel files, so they do not
> work when built for one kernel and run on another, as CI systems do.
> In KernelCI, 36 of 69 kselftest builds of mainline fail to compile the
> modules because the kernel lacks CONFIG_LIVEPATCH, and where the
> modules do build, the installed tests skip themselves.
> 
> - Patch 1 skips the modules and tests when livepatch is not enabled.
> - Patch 2 lets "make clean" remove the modules without a kernel build
>   directory.
> - Patch 3 builds the modules against the kernel in O= or KBUILD_OUTPUT.
> - Patch 4 runs the tests with the installed modules, without the devel
>   files.
> 
> Tested on x86_64 against kernels built with O= and in place, a kernel
> without livepatch and the Debian headers. The modules build and clean
> in every case, and the installed tests pass 8/8 in a VM without devel
> files, where they were all skipped before.

My only open problem is the "O=<kernel> KDIR=<kernel>" parameters
mentions in the commit message in the 2nd patch. They do not work
for me.

Otherwise, this patchset looks ready for linux-next.

I am going to push it (with removing the problematic parameters from
the commit message) by the end of this week unless anyone complains
in the meantime.

Best Regards,
Petr
