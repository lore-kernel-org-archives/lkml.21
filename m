Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655876;
	b=38r21WlgMKPMY8HmsiCZxWa1KB51HIAXQMft6ZD4Q2zmxXqT0juXhx6I6ODVqm43f/sS
	 YKOhX3Y0+tm3D668CvBZ0FTQavy6oS9BaHkRL+u9HDpL6DuSj/bEF+mLLG4hlvM7+fWbj
	 ypMkgU1svAvLNfvh7KHnJR1+rJNXrBIefDwYfEZRZKzkKOAoJQKYORsEiI8/UWWVXTH6l
	 w96xwpSVwsYbD/tnb2mlCnFl9IDtj6jtY/4rCZSH+dsmpaRb86jDmJenD4WxMWsbmzh5V
	 ukulqV1ylIM1oy4LMtlBybIanK6fabmzgg7Fj1jRaep20etpvL26TkJRbbeSvDoNtig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=+aRJH0s7CUutYvHA8qpdJ21NjF0/4sgc7Z7eUI52Igw=;
	b=5ItaTPFiaAPoOIOLaNdJv6NRP0lRvzNgRUZFIoTxEinrJoCQ41/Ta/oTebOxUsKqC3CL
	 c/g1Yxkk1QEkShOEMbI9cSnHo72ZadyjL1vPYP1naxWHe9srBMkSEucy55AGs2TyiQX4V
	 w8GbmhNP+qLDL8Uz5WCS75NTbDJ9xjx0/hKNQKT+gVdVVy70kdQzdVeX92LyXNbaJTFl6
	 fKa5cqG+8LpwLYjAzy3EbgBKOIPKesFyqLeRhSS8k3zZLkyAGruCSSh5X8b5ExW0vVg17
	 3nJH1z9wZKA98DtuoTm8rVNcpeZVH1Pet9zFrEVHmbQcQXLYAKG9+X0oSLBoL0BWT1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLdBEdct;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876C3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876C3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLdBEdct
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so3037969a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655876; x=1796260676; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+aRJH0s7CUutYvHA8qpdJ21NjF0/4sgc7Z7eUI52Igw=;
        b=tLdBEdct4R7KMIr1y6Ok0/2ZlIjjp7rkHalVCrhS6hjqp/7dcPKVKAD6f/7rM8vAxo
         w+Q4F3mc/RrCWwQAh6JnKtc8gwxxK4lODMxLm8X0kt3ozpw2NtU7wDpxLIwGfWW6aIJX
         SROhBVcRYkvOrRM2ekfUs6v/FiBdEeRwu1HY4nibEdzrCRIVvQraBgD2jXr5/AvOMLko
         AkxoZOMOf3QZqxcclimv/B3zxJSNUugBKMn3Wz2GN4vvoDTvi/DTcy4p4DTpmEWULF//
         VMAYYjFlwaGwfc4auW45j96nABYQAT6bB3pFXkwtGwdA85JJQ38eJkVLIyk9s2IBQl00
         +8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655876; x=1796260676;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+aRJH0s7CUutYvHA8qpdJ21NjF0/4sgc7Z7eUI52Igw=;
        b=nAvvPXw2mjGgOjQDUiE6mgstqSWZxqo1osILpOk27q5g7MzG9FK6S5aoTNIxDFYOO3
         2/YW7izUXK3fdYwjb2Cvhigo7L6vT+yRIinXBFu8muFlvIJgKXgC4fipxDFmSVddfyP6
         fCQvrk9LxGs9Fv9A61ysaeXSmh4V09hlQvwL8pgVdlpnWOLBx9F8hMwH0UvXIiCT7e56
         eBOsWDlG+sd5vhlv6pnDXMhcYK079iz952vSU+RrLCMu4Mzf9FWAJhMqKaClAYzOrfSJ
         Ws5s3CRkjf+cs60tvBrhQI4rDkpLQuhhp+vUgZy//q3gPjPmcGXi0m92ip1eq8wKCyU8
         bNkg==
X-Forwarded-Encrypted: i=1; AL+hErEJ8l3PK0ZrslIXxUJpJmQacrWMHRoRKKpQxZjIa5dR0JNOsTI9HCX9LPruvmy7FxqGuE5G2Rn1WuJammY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9x7xXZ99Fw3Za2kkyepWTbWW/GEG1FPVPzobYarosZtOL70s9Z
	0qUBHWT/TN3Rmg1e14+ay6vy38aHKL6GAi7QlYUNziuqzDRCIFWnMFkH
X-Gm-Gg: AZFdTZdO6B0nvncnyEv97EWQxSrsPiAOEOb2Pl3BzhbpHmxM8wN0wAdT3URHL5BJvLj
	nW4FmyPPOphtk511pKsBzEgo8VnughLbXiVj7og3Aen2gjvlM1JO5+BnSvnT3q4ZvCtfvYpzIGZ
	Y5hjMGlHl7hYEXMrfyLmltjOnYDwD8iGn/0/6ml6VDCH+vytI/wus8QJGn53kfiWC1apRbD0zeu
	w2C2ZSXYYBCUf9FOjVC1YY0yZrjaICi5BoGfz21X4xTox00kbw7MjFvNsOiRCj9tgYX/OIjXcir
	cssr6hbi7ZB8+VcyxXKg/wBGV6h2yTa/a66VgOLHCnlveUvt7aaSZ6f8z5ipzcJuB+hqYTCbUZr
	hRKOM1qK3UDjn2UVriMCbuHUC2/aWXwIFJyMZ/h7FTIQUsOR1w9aNeaHCJQTVvYMwGF6CQtrFB9
	bfFr5FcdZ77sstFqSRLJUeXQGoY7fhpaopvQG3b+gp/AENIFySLYv9aGnR9INEL5m+VHuW1N38+
	2hNn0p+VqugMr9SJecr9c5w4mfGqSlEcenaqu+RnU1lLQKXrnqRMTnhfLum0IHjLn6vygSlmjGe
	lLDQMGQ6RT3ARXLYNohAHin+n4WhvvUoefl+VY75p/A9usjFQMRz3LxmdmLVqGNkdj69zN+oOxL
	OZC3kf39yX5k5+OkiVy1ovcWN8Pk4P4l7Gw==
X-Received: by 2002:a17:90a:d44f:b0:3ac:8897:7ba5 with SMTP id 98e67ed59e1d1-3b41c98ec99mr18155731a91.59.1795655875720;
        Wed, 25 Nov 2026 17:17:55 -0800 (PST)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm29921315a91.8.2026.11.25.17.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:17:55 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 01:17:54 +0000
Message-Id: <DN4QVSWEI27E.32PRRHCUBAZFK@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
Cc: <bpf@vger.kernel.org>, <loongarch@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v1] selftests/bpf: Restrict JIT tests to 64-bit
 LoongArch
In-Reply-To: <20261125103208.15242-1-yangtiezhu@loongson.cn>
References: <20261125103208.15242-1-yangtiezhu@loongson.cn>
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

On Wed, Nov 25, 2026 at 02:32 AM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> Now that 32-bit LoongArch support has been added to the kernel while the
> eBPF JIT remains 64-bit only (HAVE_EBPF_JIT depends on 64BIT), limit the
> BPF JIT-specific test cases and architecture macros to 64-bit LoongArch.

Most of them are not JIT-specific.
The interpreter runs sdiv, bswap, movsx and gotol.
The default build of test_progs fails against such a kernel anyway.
dummy_st_ops_success.c takes struct bpf_dummy_ops from vmlinux.h,
and that struct is under CONFIG_BPF_JIT.
raw_tp and kprobe progs can't load there either:

  select HAVE_PERF_EVENTS if 64BIT

> This is a cleanup patch, inspired by Sashiko AI review:
> https://lore.kernel.org/bpf/sashiko-outbox-228693@kernel.org/

That comment is about the new guard in bpf_insn_array.c.
Nothing is broken. I don't think we need this patch.
Pls don't change 16 files because a bot said so.

pw-bot: cr
