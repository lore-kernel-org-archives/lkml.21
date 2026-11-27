Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781091;
	b=hupnG8NK8bORzgFeZxZ64IOUqdbVdHLhq8WLBwNq30ssaGf+EB6vlTi+8NFvadF0+ep4
	 2jogsNa7DSNW76MLmLXKGjUTws1+mTPlKeV4UPWpmxesHi1hrBHuIRHhXZ7SBS9wYaSgc
	 herVc8/eKLSAVImYptmoVDAVSAUw2abk7M9LnIQphCYhWmW/Xhr41HzjU3gPCFz7HsuMB
	 JEf0dqb8dwT7kf02+EcdUjEaixdiz5ClstWDMGenHazD4z6iLdeMolYdJwcLmeBhqCSDk
	 VMKZj+jBqYPC5tPra8/VKmQweaQ6mzQbSEyFg0tHXto8dTVf9TFQDB2He2n2FrqAutw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b4JpyJqTqKs/ooTkoGf0tRzxzjeh27dYY7H58le2fz8=;
	b=4rVQfgFI43XcBqP+HVqPQfmr9uWUqUvNG25ZC3Ke9j794ne6lpfOSRqYol/ASZG+QSCA
	 6Xh76L0Cxn7bZkScmrdJyz6mUjcaNpyIXV/Wh25oh+tvDCZksuAVg6s0CZOkCjXv5ZgkX
	 Q+hZOBu04OdwCleH45bm0v3UZWppCv85kWQ8OnBSMgKAy6VSwr8aJUFviLPj54Jw3T+Wd
	 kajq8+eVwoOlCQm+MJ5nJFY8nx7f1pI3sbWp/Ze/ycqN22npGvJxBm99uPO/mDgWROadi
	 mGxhp9rWbtZN/yhyWGrB1C9wDtWpvkTixfySZBmQlAV5msH5XT/3fesH3CDYrFNTc4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCtU435f;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68012606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 12:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68012606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCtU435f
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386cf1041cdso5022404eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 04:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795781090; x=1796385890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4JpyJqTqKs/ooTkoGf0tRzxzjeh27dYY7H58le2fz8=;
        b=yCtU435flzWsWwMU+oeDP+3ORZa2d/JM3SIU3HK02vqChz4DmlzINMbWe6LT+Jpa2M
         TlPTLk6BocuOCfh12Tq6JLW0nnz+TfL71fZScQTpx9fBk6GcshTMSoWI7tULPqx90czk
         L+tQtr7C99Y28+PzyT2bpqa3pOE0V+cCnCOql/jWRuFFrbO51CUlvbZGW7BoXo3pkgEz
         kg+nSv+VDpJEGKOZmT5BbmwcOn6fAiK6xAc1m0rrxcfVlhltFy+nqFxtzk/HFDxDlXHm
         7aa2TKAnybTJJOUYoDQcTpd/ZlHfKZJb5KpW2qMLZLuAEN1PWbKrjBRCA/J/RAsCBf8w
         QU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781090; x=1796385890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4JpyJqTqKs/ooTkoGf0tRzxzjeh27dYY7H58le2fz8=;
        b=VWTCTpIHpB/b1UskVIn+b9TgV31e0+eRstVcQmIIN/wVkjFQb2E9biUtwgoJV7HSLQ
         6wm+wOiiXwLG8iYzA5mb3kP5DDs7Mq+In78hGOEHKurb7KzIGUXEqERwUeZZ7QhwMEv6
         8xFd4O/4YzGgTVS3FG+yYzOm5V/lVmwqmD3YfqMFwORI83Nt9K+Q1KAVgIsCGpF8O9wF
         cvIJrCSQExm13Yw6wTi7tjXpnHBAuUiC21Hep/dVX1sIvfQWmV5+/Vr43HeHFEhtzhA6
         rHajvt6ejiaSW1cRrw2KiI8mpf6aro0A6pdfT8skVKxkIu6KYJh47TSwAhl13sCKHm8T
         6FpA==
X-Forwarded-Encrypted: i=1; AL+hErHBF6acMNNEn4oyul2TDAUd1OFqvrYoR5W1ryp91HTY8UUkcdDRqnDP6c0CqSt/J3vKF6qiheVUCy5RngQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EHVeFKBbphGevD4uKDjMlsQkVQTi6NoYuQied77GkITdOjM/q
	UH4Kuc4wK2dciEOUCrlQ7bfD8ld6hoZN7kSeNqrDkPZe2ILLm6dBErYz
X-Gm-Gg: AZFdTZfmkQH5pMR0rb6WL7wCJCCngLNw9QQ+FW/53AUS5OA8QzTrtekskUVOwA926a7
	+hsdc6VkrJY2czv7bG5rUfYmM0Q7rLMAYdlm9mo1RXyO+lw5wx24mtYHU0n+YuNjfTcP3FxGhs5
	QHh2YIiBqzoNZaEfjqPVzln7uGkuDoouLLscysQmoF0OY+Cg4FCGBpQbfRC+HDNyPaMxKQTcvMx
	HeOjh2epaDJLHPk/n/TRAFNuVbQnMpRs41UgwK/fDcQ9S6n5hxVaiU4R18/MrgiO2SEt2LUf2VH
	YjOnAiuu4XDVqJLFB6hmrnCRIncAgEZiRtAjaKwSH19wHHzLCAYB4qnbpHdryz0Xn9lk0B8j0t1
	+0Ah2GcbPSc5hLmN8gN0PJwKkRHDZWfLhwCg+1AsL/2YGnR8VVEWuXj+G/rRCiHYENCgRL1NtvM
	6+usVwAdDvHeRRZ5lmPIPPWch4hbH3mSp6WCuxKrk1Ozk8I7Y96oq4PzuSn68xj+JPv1OMb1pBd
	OyuMNWj4wxFlY6hc2b0ru9xW5iHh01AhSg6LYemaDTAYGC/f6mjkJ1JVbxtSTGuSiFWR1Y+ULU6
	Zw1bZTlQCz0yQRPR5s8GBvn0I0dGbUKoUXDQrpxxOj8=
X-Received: by 2002:a05:7301:fc04:b0:386:ea31:7123 with SMTP id 5a478bee46e88-386ea318008mr2846416eec.25.1795781090329;
        Fri, 27 Nov 2026 04:04:50 -0800 (PST)
Received: from deepak-80tv ([2405:201:a40c:e0d8:ae82:1cfd:7bfd:2676])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm81729565eec.26.2026.11.27.04.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:04:49 -0800 (PST)
From: Deepak Pandey <deepak.os.system@gmail.com>
To: 847807867@qq.com
Cc: agk@redhat.com,
	bmarzins@redhat.com,
	dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mpatocka@redhat.com,
	snitzer@kernel.org,
	syzbot+1eda626824b6334f5ad3@syzkaller.appspotmail.com,
	Deepak Pandey <deepak.os.system@gmail.com>
Subject: Re: [PATCH] dm snap: clear pointers in alloc_area() error paths
Date: Fri, 27 Nov 2026 17:34:34 +0530
Message-ID: <20261127120434.746380-1-deepak.os.system@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <tencent_D498CB0489BB9C74184B927C7393282E9806@qq.com>
References: <tencent_D498CB0489BB9C74184B927C7393282E9806@qq.com>
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

On Fri, Nov 27, 2026 at 09:58:00AM +0000, Shuai Liu wrote:
> alloc_area() vfrees ps->zero_area and ps->area on allocation failure
> but leaves the dangling pointers.  When the snapshot constructor then
> calls free_area() as part of teardown, it vfrees the same buffers
> again, triggering a WARNING in vfree().
>
> Set those pointers to NULL after vfree().  vfree(NULL) is a no-op,
> so free_area() is safe to call multiple times.

I reproduced this issue locally using the syzbot reproducer in QEMU and
verified that this patch resolves the double vfree() warning on -ENOMEM.

Tested-by: Deepak Pandey <deepak.os.system@gmail.com>
