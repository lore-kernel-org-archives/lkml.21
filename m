Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826017;
	b=bA6xFxo1bqB2bXP1YxiL5LxX+4/gD84ZMTYAfGGpN5WeAREo9wEBwlfoALDKcEQyZnud
	 l2cxHFmrPPRydqtQ0oRxFtqNqoWTr9E9IkTVDofjMSIf0FO2wkt+0nblfgLUVlQ+Pj0+q
	 E/KA4XY1Ub8+ITCLtvy2y/wzO76nf4LzK6rbRrL2nB2R9ThvaXu0cBACXl1bFeRuHYGnh
	 hJB1z7xuUD2excM78PbjCujnLlXfwPDrvfQb9lP+YKQvTBO/YTyOUWDd8qdc2mC5i6dj5
	 FfJwRPWdcH3Utz9EQ0Z+ydHEYl+4Mkyh0oBNZZ9VraE2j9KSqFJckc/scgJJF3yqTVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
	b=tHqTL8soqG4xqnpvIEXhsPxG1CEGDBuS0PbyihBlHJwMMm90yuYCfasC78X2o0aQocR2
	 7eXin1aq6q+y+NK3d5Ff1wtae12nq6HfZ3xiQrnsoORF4OYJeRyOXGlZR630u6JDBORzR
	 CSRQa+FsKHICoik+lh68EB26zJVGoISJtA8BmS+mYpMg1Shw8aQgunGUxteM+7Uf3LzQT
	 0YMa2dYBJvr4iNizObhKzvZDvApIi9xRc+Y3U4IZ6tsH8FKGs2FcUbkCR3R+s4GEkezpT
	 G7gAhnRRMsg2HhTk7WqsZrB+AF7jSkb2eeW5NN8KdLZvQK2gU2glFITvAVu6QrpEcUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtEfMRUf;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16930606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16930606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VtEfMRUf
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso4946094a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795826016; x=1796430816; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
        b=VtEfMRUfZ3zyteX9vboA7JB9ZusTTGvzZOPMC/5Zmc5unjfrfu1V+L9VEVEdpbLwwm
         +pH3uXa35kaCWPzE4JrKggHljzEp5AKNSP0EWh2laOQZ91sB1pFNt1rAH+CwrZpzhuqU
         Kz4Yv+dgt/w/cahpmYsq9vgnZgcCuqTU/we5LM1IYaT2PqzE0NCasYG0QurDtaguHiiQ
         HNsHiqpCOkedaEj4y3PfBloCVIuAhjA/qv/S7hHqOrH6KRZG7IC/OIWrKVXyIGeyzv53
         ZWM8Du6OSmMvh3h18mCQ2AM5367yKk5sLJv4e8+DYrWAnMLRvrmH44wJXi8+qQT/8J92
         neyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826016; x=1796430816;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mu5WLrjeCPu8S4oqgwQ27bq4kiYqk+zhWBIQ00PCvk8=;
        b=KvLRsCXDaZH6xmCAksREJzX8JR546TYCauaBkSCTjCLJg95NNnvrzTgVdEWSGDsVec
         ofWcnw5QPxxAPriGcOczFnIPzpVzsWXIWziYAT40O+f2aPjijdnba+P+gfhvlkgyr8Eg
         oFb1/Zsqc7BjMr6QRwSYeTBuiXTgTporFxsQHvl/hiSv5m+xLgLSqotOCk+NxW0Ot0Qu
         TUod+b4LVNbjExaSLpsOUg7QxqCwJendovpBhyqtqt7CfOvArslRbJ+EvC3R8RtRrf4D
         pYIlSlWkaX8fIP6acZ2Lz8NOC5EJ+BA0m75xQnJi6nClxQkH6FGJRVnoB7FQfgq+rv6x
         Q5XA==
X-Forwarded-Encrypted: i=1; AL+hErF7Z24rGqwpZ7q5VT3GVFjtgcW7dEPOWAHoW5s+W6bEG1PGzT8oUAENG2LpteJi+coyOQGI56JkLtWd2KQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95cAGq9vHrtGpczunBM9bCqd4IHLOlKPK6fCWRs05R6SGKYFjh
	ALfW/L+yMYwjMSuqsxYOdru5edI4/N1sLoAB31JMSEl6g6Ed1tLLQUBf
X-Gm-Gg: AZFdTZfxqWw1P9m89Yeexn6FHP+mQ1JV5rKzBXL2Rr95e/ADcUerWBelNBUKM6swnXV
	IrOa1//18Xe5/QMBu7pn2GJjcwkDZat/Hksfre8XD0y+aw4KFTu6XgHpZGJNhT10b6yxOJ+X39p
	vQVRZ7XjQAHEFeVz3Ne0w64qvBtWzo//INiACcRZtPUNz7frtsmVg/33NdJAgOyYpeRISu8K/ID
	5E+177nyZYyAmxjg1z9qSRjrbGlUI7L2gHW5GPme9nKjDxV3MDjCYxQr13zVISQRzYnCd8FYe/t
	J0qKlnBR2lNjjJdCBmYJKbzAGD+ZqV12CfXkBK67mkLY0HeeHDPAeqU8pPTqPgCgO62JhVLvQQC
	/0lcjpLb4m9yMFuRUi4qlzBepmmWGcotmTV4iEZVtAVUCz4o9237MDK6KW82KhNeusf7JNWEVMN
	B3Qxnv9oZkjBPwwutN/wgBgSRvFJ9uwhq3EYnTNNy746ufxPEs9UFkSWlUuVtXRi7wc7a8qtQtF
	CC3z56DOz4IahYsXsVtZ1IYsPME2ctWDScvqDjB6yvjnH0YhBeAEStycjdMW3lPZLeu1UCXHISR
	z+kZpKCTaM8lzfzmEW6x74LVIQwfy8ydYuiMBqyxJolGGoq/8aO3N0+rPFZahsSm6Qh3a0RSk++
	6AP5TyFzICCW7Ks6mtNWTZOUI0pDuCN+kbg==
X-Received: by 2002:a17:90b:4b85:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b41c7c2384mr26668854a91.8.1795826016052;
        Fri, 27 Nov 2026 16:33:36 -0800 (PST)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm30793634a91.9.2026.11.27.16.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:33:35 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 00:33:35 +0000
Message-Id: <DN6F6Y9I0QD7.1B49UETL2EKDJ@gmail.com>
Cc: "Kees Cook" <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>,
 "Will Drewry" <wad@chromium.org>, "Daniel Borkmann" <daniel@iogearbox.net>,
 "Stanislav Fomichev" <sdf@fomichev.me>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Jens
 Axboe" <axboe@kernel.dk>
Subject: Re: [RFC PATCH 0/3] Introduce a classic BPF filter cache for
 seccomp
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <io-uring@vger.kernel.org>,
 <netdev@vger.kernel.org>
In-Reply-To: <5b1c03a4-f910-4f97-af3e-1b8c328dd1ba@huaweicloud.com>
References: <cover.1795139109.git.xukuohai@huaweicloud.com> <DN0AIFQ82CFP.34SDTH6ZFZC1G@gmail.com> <309b8e49-2f9c-4a2f-9b40-8e7e7cce3455@huaweicloud.com> <DN5F4EBDNESC.3UOJRTCXCL4HI@gmail.com> <5b1c03a4-f910-4f97-af3e-1b8c328dd1ba@huaweicloud.com>
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

On Fri, Nov 27, 2026 at 07:15 AM Xu Kuohai <xukuohai@huaweicloud.com> wrote:
> The free path is dominated by bpf_arch_text_invalidate(), which sends IPIs
> to all CPUs and waits for completion. The wait happens after put_cpu(), so
> the task is preemptible. If the task is preempted, other lock waiters remain
> blocked until it is scheduled back and releases the lock. This can extend
> the lock hold time to seconds.

> After moving bpf_arch_text_invalidate() out of pack_mutex, the p99 VM
> startup latency drops from 2.79 s to 170 ms under the same workload.

Awesome!

btw every free still sends these IPIs.
We can probably remove them.

aarch64_insn_set() can do caches_clean_inval_pou() only
like aarch64_insn_patch_text_nosync().
bpf_arch_text_invalidate() is its only caller and nothing runs in
the freed chunks.

It can be a separate patch, of course.
