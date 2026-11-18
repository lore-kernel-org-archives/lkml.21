Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794968721;
	b=49Y/oG0yRzUDjjjzvRG0MVX5N+HMDEjgy8c2WaC3kQ0/cPUIpmX2GgEyS6d5V+PutVZ+
	 USfLT8GYzTkHJUFIxWsmc0HK7Xx9ewQ7nzv0o1CB+SDABK0LeVMAaD5ekmByWkW5zJQEu
	 7bO3g8VYSRenRhUkqXfysMnHoVxGJsa8SqwH3hyE3f1tpplLr8Am88ywdPGkbN0LjgbSZ
	 3i9Ch24xp4kmu/SLgk4IZ7TjbRvhgIO9taDLVTkm+IDFtxbQzxi/df8OKW06vnB0Ktsst
	 3DKgp2/D8vOMId7glaR0ULnBsOzppb7ML6ARpk4e+QkE+fcpb1OX7gxMXhH/62KnXTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794968721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=k08219NPaAzfFl1HhQIM7zNHjNoNeWmKDuXHg52dSl4=;
	b=RNdnS2OJ4HVPonQdn2TvLhUQaNJwnRqv0qmt+dGr1mZAHmyA0bgSWQpeUwtwkTsX2mDY
	 NtNoysCYgeM0LIkao8FRAmqDDPwURmsAxK5egOjdJm4c3LA4zhx4bvQqP7N9v5J45hZ6U
	 Z0Q4VOd2Fb/K3fIS7J1mJc1S7IfT3KgJcGRClKVmIskBPdXIpxyQ3wPx2MKmC81ZKh7vp
	 +cRyZ+K5EBEX47FJ31OoW0nlCu7IypsoXmqwwIMhHzw2bP9cBbcMkf/ZRe4W4KSCladw1
	 VrrxVpU4TmrakiEUF6YNdANWgUmhYDiS0MmCmErP87IoLkOttFSQ58n4mFzm5rL4jkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HHOmmz5+;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A1B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 02:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24A1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HHOmmz5+
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-14394530ec6so790660c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 18:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794968720; x=1795573520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k08219NPaAzfFl1HhQIM7zNHjNoNeWmKDuXHg52dSl4=;
        b=HHOmmz5+xRBZJlSZQpMAPI+v2ZpHjRmeYsaIdtlDn5tA6/dprGqI/OQt3QD/EYtPcJ
         KggKS3ubsoOcwjaPgTZU73cTdvj31ZEgntjIPyZBbMb2Rps+JbO0G8a34T3VKZ6Le4PV
         22kt7wosnnxIPUZt+Bbw+Fsu3buq8fByeM5Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794968720; x=1795573520;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k08219NPaAzfFl1HhQIM7zNHjNoNeWmKDuXHg52dSl4=;
        b=FnywMq54PzlBxqnMG5WYjzAF09pi4+oWEtI650lpF1r5bOCd8KVDtTMjVhfReg8cm2
         AUeHuSQcy8Y5m+R2UuK62V63OqC/bMwKJx6LpepsuSiSwAPfVMHNMD6FEuYQsyHVaZq0
         yfrVQd3PU4xUrpJTatGcD54XemplJmSdLx3RR7D5X2S9PfLE4GSJCDIYq+1RQlvUwx1P
         MhS8LHwhPnFLTJg2+woTJ8oovtS3dVUwS1RYkTLoJgtw+6aLucC3XcPZOz50MpwzWWan
         1rXJXJpndxk88acTg+uL5o1l/MGm2ncTHogNo0XHFIswZlWbF8DvKIxkEueaN1VoLRiv
         yr8Q==
X-Forwarded-Encrypted: i=1; AL+hErFQfeiSrF2YdJD+JdaKV1J6gOG1zB8coY1Xekhm3S1LjIkyOXVLjdByUX0f979PpMOrHfts2AvFl9bC23k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LG5C1/NVRbllN79ilgkHzG9cD0BIDJlRlMGPR4tt9WpREDGKF
	sJ0jr3kAQWZcGl8mq5MQDgFZ2cVUZLNEmbNkBiJENX0unoGE9ZydGihyr7T2i9gWDQ==
X-Gm-Gg: AYBFou3u+YIgGlwUjA0fnVyC9Qu9t/lprUFjxfXzxibVT6GIX8Gpbl/UpPKhApjcLNB
	APNoIJgt5R+oc8Q6enecFuMpmc1Mg0w7xYeUCP/dIusvq5IyM/MGcvbYzI83VYa+oBkvhO4iJZl
	aNTFKw8mB/XiLR69Pco1s43jG6SHebNzPppAFezicKIRBNjq8smpNkfUVFrIhejS/O8v2bZdcp5
	iIFenR2Tn1cFiKcX6s2eecaBMh3EV0rz+LiYElgURCMJEp/tZojGvAxPYWen1M8j0Y5DpR9hrUA
	BEWo6UXKLsdkSB6useL0AChOdX8iXXlgBUrWSNSgsLt1mcfTh2L/YOCpbOol2LjPh0R227bj1EB
	elVyFojZPfB0nyXr0NCXj+YpITrM80my4MoR9Ti1fkiVpeTDaFUAVdhm6Yku9FxyjfmOn8XZTZt
	Vhf0oYNOKbDcLh590Opy3h60xTDm9OmZ/ky4L3wG9nJPQqKaW9NODupZFHreOB85PtMBjAVDDHM
	2dOWJyy4LelXP90ajjsIftkakYn1cPbS02nqsypgoxOw91mYvsZElCNM4P+RPjYGFJNo+61vfUV
	3LBeH+Hic9TJJ++xmfFVJvA9y3e/3LZaXPc75epdlroECbdTbFdNoC6gCyI1M3VOTLfv/JLXg3C
	0y5SbLfUjf2VW4nPw
X-Received: by 2002:a05:7022:ef12:b0:160:90a3:ca8c with SMTP id a92af1059eb24-1b543bb7249mr1435023c88.7.1794968720115;
        Tue, 17 Nov 2026 18:25:20 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:cdce:1079:e29c:bb93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63059e3sm3191810eec.5.2026.11.17.18.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 18:25:19 -0800 (PST)
Date: Wed, 18 Nov 2026 11:25:15 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Chris Wiseman <chriswiseman@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Xueyuan Chen <xueyuan.chen21@gmail.com>, Xueyuan Chen <xueyuan.chen@vivo.com>, 
	Barry Song <baohua@kernel.org>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction
 budget-aware
Message-ID: <av0L2-OtxcWpQ09m@google.com>
References: <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com>
 <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
 <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
 <avVVRYkIAQnLC_Yu@google.com>
 <18e8fb5c1c4d127f.3137322e32332e3235332e313736.289d37.0000sendgmr@google.com>
 <CAO9r8zOtL4t5pwQOE=SAWeg=k2TkhtNXgV6CJJGNTwuTebKpBQ@mail.gmail.com>
 <18e8fc17375582a2.3137322e32332e3235332e313736.2a6db6.0000sendgmr@google.com>
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
In-Reply-To: <18e8fc17375582a2.3137322e32332e3235332e313736.2a6db6.0000sendgmr@google.com>

On (26/11/18 00:27), Chris Wiseman wrote:
> Nhat / Johannes / Sergey - good with a 2-patch series that just removes
> the zsmalloc shrinker and adds the unlocked zs_can_compact() pre-check
> for manual zram compaction?

If there is no shrinker now then does unlocked zs_can_compact() matter
that much?  I assume zs_can_compact() is now called only from external
code, so it's not expected to be executed nearly as often as before, or
is there some other reason to make it unlocked?
