Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794971978;
	b=EbQnF7w2p29fBn+nL0SxaiCCtyGHzmKNh3J2ZYDhU7/C07DbRzOB0auglCBrmIVFKC8U
	 TdYYzj/flk16xTUPlrBiPm2knmwgXHI53o90jh8xYDKW2EhA6CU0Xh8g58MNVIux7kKQv
	 +pUk26m5EmgOo4x3ywneq6SUbKckiJ7SKYImBk1235fG3ZY2vKx69pYz5CTKizDZQ2XrS
	 mxQv7G27LzSyDOJx7gjG8IenaBopVQ54z/P0BZNJQ8mwJwz12VQgRS/xwguuWNJc9luBK
	 yEopIvyaAwLjaluZhWb7HVnZCGpxmBzOIi4SuqtC7xFoYXqtCGx/DIu+zgaxlsPufwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794971978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=jHnNDDFVc/Jbb9T25AViGkeUZ2CVD8Ckp6mVqsJ9Za0=;
	b=b+Y1VewBj4U2pUfNp8u5bOBcBSar7lnG5fnzH3YuvnJVHWMBg4oYYpLbTuZ467h2XEcM
	 FJ3vrtuMaJY9E5DTK2/vTCNfYEPyfKLJ25X+ZDz8krGhMPUknIwVxEopDpxIuKNnKAy4+
	 RzKUSpjT5YGHA8B8CKb93KTABxXATL3THS5EKbeOywdISyvBF2HQoHRgMf1HOklMvZft+
	 I7qo8CrbPwPLSO8AUm6sD918OFsrINYDepw8Ls2EJ87IlbTMI38t0DDA8gUaL6vpOGA0I
	 /ko7pqs90U5eNU015e9iaKJeoINmgSih0T9Rs+DDOEEeHzm4zK4HHJm+E+FVmZ/ATlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IHPgSOSv;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF1B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEF1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IHPgSOSv
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1050457c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794971977; x=1795576777; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHnNDDFVc/Jbb9T25AViGkeUZ2CVD8Ckp6mVqsJ9Za0=;
        b=IHPgSOSvoRuAo/I0Af2c8wKF52CYYV2YHZLiWb/pLM/7QBgH0uUjDTVhqDWOLJNhRz
         yWdj3MtyZxCcl6X0lZ9pUwqLxOeLi8Tn8D859hBa7l2sWsRQThv0GxTKLlj1HKNMwG+O
         MRsk9N8lP8QsjOCiB10jF6X44c0TybLM2XBDKe4uzunRjDUaudexTxM2PEeGp+eI8sJg
         Bom1GxrbfZeOvFkqHaNBb+HextiC42fXTQqH462ireGpSn1+YRsQ0DFc8y4EtoW/RVAs
         PJ3D2NNsWgH6zXA/ebLOZmDOV8rE90JK25vYV4eI30yZ8Ahf/CXMq+RN+8FLpZ66AiwM
         2JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794971977; x=1795576777;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHnNDDFVc/Jbb9T25AViGkeUZ2CVD8Ckp6mVqsJ9Za0=;
        b=QBFeI/3SlXUp1l2kJNK4/l2b4n6RRxqUDErxUzIqwBywB76dS4AwukrLlCJVkDGWPv
         mICDcYSsu28vgz0N2uRnuRK0LgD8kEVDDLDjhXg8Y8Kk+mT8b4T44ANFM+9YRCuHb+3B
         R26srC4IBw/2btWVcgPvcgZWPQMWR58gRkBLheNKQqkqI1B3KJnE3Ts+Lyuv2lR7Nvq5
         4M9OAq+Odhh3y/kmA98EMnQKjSI0kf+Z/VHEJF3RwpQ70Cm74X+m1vHqct73IUMfjm3S
         XVOm+jXDcrGSjTfbZW4BajULby1BHWxryDQPzdQpyFteRs/qM1EBYWAl+lQnWgx0wCD2
         qUgQ==
X-Forwarded-Encrypted: i=1; AL+hErFi4J+onaT5V/QUCDYU7Q3KYOUnMd10+OH33M615IaqeIRzCg2zW1qvLhWC8rclWU6jhOYZIoDAz50urG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tDAIy4rlSR1Iwew9mGUS8IG+/kd6c79ERvidAyZVRCNSnVRk9
	c6mLKS8TaCCM63EW3QyzhCACe32CBiojyk9E6VORnvBRNs19xVH7B6PWbleQULt1Nwmpnc2HCVY
	Nma5k6UCBVB2WetvEM12sHfHIdoTE8Q==
X-Received: from dloo22-n2.prod.google.com ([2002:a05:7023:a56:20b0:1a1:ce17:436b])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:2204:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b543c25a69mr1958847c88.27.1794971976348;
 Tue, 17 Nov 2026 19:19:36 -0800 (PST)
Date: Wed, 18 Nov 2026 03:19:35 GMT
In-Reply-To: <av0L2-OtxcWpQ09m@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <auwOBaRtM9p_Wxfx@google.com> <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
 <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
 <avVVRYkIAQnLC_Yu@google.com> <18e8fb5c1c4d127f.3137322e32332e3235332e313736.289d37.0000sendgmr@google.com>
 <CAO9r8zOtL4t5pwQOE=SAWeg=k2TkhtNXgV6CJJGNTwuTebKpBQ@mail.gmail.com>
 <18e8fc17375582a2.3137322e32332e3235332e313736.2a6db6.0000sendgmr@google.com> <av0L2-OtxcWpQ09m@google.com>
Message-ID: <18e9058097a70f62.3137322e32332e3235332e313736.3e9981.0000sendgmr@google.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
From: Chris Wiseman <chriswiseman@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Brian Geffon <bgeffon@google.com>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 18, 2026 at 11:25 AM Sergey Senozhatsky <senozhatsky@chromium.org> wrote:
>
> On (26/11/18 00:27), Chris Wiseman wrote:
> > Nhat / Johannes / Sergey - good with a 2-patch series that just removes
> > the zsmalloc shrinker and adds the unlocked zs_can_compact() pre-check
> > for manual zram compaction?
>
> If there is no shrinker now then does unlocked zs_can_compact() matter
> that much?  I assume zs_can_compact() is now called only from external
> code, so it's not expected to be executed nearly as often as before, or
> is there some other reason to make it unlocked?

Ha, fair enough - started this whole thread trying to shave 70 us off
the shrinker and somehow talked ourselves into deleting the whole thing.
Definitely not worth adding lockless reads just for the occasional
manual zram compact.

Happy to drop the pre-check and just send a single patch removing the
zsmalloc shrinker once Nhat and Johannes are good with it.
