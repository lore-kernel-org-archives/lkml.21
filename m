Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795148336;
	b=IcArTM8tO7cg0PGtHirT5kz+9lhagl7+UeWUduUMLggucLSoRtGtW6HvYZNIJRV0fT6Q
	 6Y8SVKetxQc+Yk4qaEmJxgKBiunWtpAWZ33z7s1/LfiNfYoJEbN+Yi37KWZeAY6A6/Oit
	 yh1FoLLCCjvywQQm2D7NbGKF2WSoar0BHI+bL3ZGkngaJJ8/5VkGLuopGoo10znvTQi7L
	 l2gk4Mbr19Pfv1PaxuBzgh1T9E4iIyj7/VJ9dEBnZ36K0nmGbGsvQrJ13oYUbZI4TiMnx
	 OT/EiBZSPqV1eBfVzP32CH0dX0nWD3O/uSUrOcIegitkh1FEIxnh8thygb1dmlaSCeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795148336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=GoctuigbNiAnWryXvwISlMEIatHJNqn5fsJYaXm74a4=;
	b=EIy4/s94ismwbPLS0maoVk57JYWqRGQORNf83SbEvNv3v6UGWpkIUPaUBGNU/EFiESoq
	 NIK4VAUxo7F+lWbljayjvo5iflkkBysnj+fFPNwMlgMxazHknSGldmTAlDe/R9t5Eacv2
	 ONS7cBnxqoM5ZvvjiQumvT+dDpXCnY7QDTBSWvvJzcskrt9AFO88taDdGwJ2jGNajTqh/
	 FaLKXavFlk0K5YzedDMKVo93HaaIFt84OD7d6HarWlTer1HklkjlK0WBhWCVXKGRTK/MK
	 Q/e3MdTbh4F502pqQLopUatu9xljM77huEnt9rtrzMGfNjZ7gtiSpl+RS0TffEeZ2Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=R79rMX9j;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B11606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B11606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=R79rMX9j
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-382c3c9671fso620940eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1795148335; x=1795753135; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoctuigbNiAnWryXvwISlMEIatHJNqn5fsJYaXm74a4=;
        b=R79rMX9jAIbY3l24RYhsHohcbTEPZTYKkHbGMYGnZ/bWlF/zc/5Kh7Slr16XUR0HTn
         JajM6CowSPGaG8/xcG9KzpcInnmAKlIgIuBemo+kt1KVGURcpXqP4dY0Rdz/9RR/8gv7
         G49fanF1+dccAI4lbUHP6vPzONYh8+iRYnXrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795148335; x=1795753135;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GoctuigbNiAnWryXvwISlMEIatHJNqn5fsJYaXm74a4=;
        b=nR/SUFnznW32LXXkv6LilvcWY1ugTLndMa0mbnyBJJpb7h3LNa1pjjOP4AiPXOYKGT
         H9yIsgg0PwGTVjsZjeA6ViJV56fYKZvoEAS940QDMNOuOw76s+vJFGA7VQkNIMcLjcVY
         njqVgCoGy7iHafZcyjlfm1sbn77NYmby8/QGzEchOIEcrWQFqBJh3BDl2EmXc6Y/mJeI
         nd1hBG/9YNwemk1ylMxLAiofmxjTCXZY3K9/qOugv6jX5DjqjXYYxXu6AxfzbuekbWjU
         co4GPQKzjnDl2QfDhP3IH6vvu1a+j/2CeI8SlZSTG9tr2TbZrvpN9UZoi/9hTLSfF9b+
         OHtw==
X-Forwarded-Encrypted: i=1; AL+hErE47WNJIm0wuU/Y6+ge700GeFZswziCF4kQWLczN0o4MaXr0LDwk6zcUSoW43fKwOGhbBRqtmNUm1uid9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t5mJs46vscRAHrH44yXQZBaxwsT0UQpSit5Jn8BTRP4ZdnVVO
	TqGt/F+8VyFOCj8MkE83ENEY8nM1J3XGKupdi2KFZ8e/+eEWOHjViZRD6QHzoCUjUQs=
X-Gm-Gg: AZFdTZc1BYJbgTl/DnquF6XhXXz+qshaGEiS37ARcYMgJQj81llAdN2jncNzpG1d0XD
	WCfofOcYf+KvSnstclTTzJLuUitC6XjGVkaBe8fONveHDfV6MZF3YoprQyDQTuIxcr0d4wksjhY
	xninIVWsWYxx+yGh/wYRQvOW2Iwaruhecad9mySkMPSzdnnrogGLKfY1O5QJ7fvH0Oga8ivI4Yx
	1osUTaWfKGDj7835eE/Duawy3YnVzBdodY+6tXCBl1KkQqAuI8Hy9MpieVIIseAwp9GUZPi4EPt
	4cVyurwK7ufwwHZa8AlKhjh8Rl97qU3DYFRQeX8I7QDUOJN25cQ3am4liTGZ+Dww+EqBB+Q/gP2
	YoIvGH9nMNoHi7IGCZH8agz1VnZ6Cr5iduUIleki1hcjEpoTxKOa/wyO5OV8lQz8uJP/X6/54/J
	sttgpZX7U+dk8qcGVeBbmuoXCefcifvtUxSe4RQauKo9oDDo7TVeB4FFBLzNgpwOMI7aXT8iZPf
	Iv3yFKyJRaGAglCoJetF/Pu7YQtNpbmh9PB4zzTTREZpUFZHdikiteK+XzEYaYWGcMGV1blOZk+
	iI8vAyMwOiMMNYpD9gObKIAhkwWGiwFBV7oUTJaNinZFR99oze1vPb8PYDS0tmIXB6n4eaYbIKE
	wbvPznZfNPFdN
X-Received: by 2002:a05:693c:8042:b0:379:8df3:d2c9 with SMTP id 5a478bee46e88-3856f14ca78mr1581379eec.13.1795148334620;
        Thu, 19 Nov 2026 20:18:54 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm4115021eec.4.2026.11.19.20.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 20:18:54 -0800 (PST)
Date: Fri, 20 Nov 2026 13:18:34 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Philipp Stanner <phasta@kernel.org>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
	Oded Gabbay <ogabbay@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Gyeyoung Baek <gye976@gmail.com>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] drm/sched: Add drm_sched_entity_get_runtime()
Message-ID: <av_KEmPdB76gKak0@rock-5b-plus>
References: <20261112171144.3151554-1-sidong.yang@furiosa.ai>
 <20261112171144.3151554-2-sidong.yang@furiosa.ai>
 <34494226eb920bdbd7f3257ef6f9b20f4e8ffd6a.camel@mailbox.org>
 <1b78ef4b-011e-4174-800e-425c94fddf3a@igalia.com>
 <48d9790a8f1d2ca7281907f1c32d7e7759e9eb77.camel@mailbox.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48d9790a8f1d2ca7281907f1c32d7e7759e9eb77.camel@mailbox.org>

On Thu, Nov 19, 2026 at 08:23:39AM +0100, Philipp Stanner wrote:
> On Wed, 2026-11-18 at 14:39 -0300, Maíra Canal wrote:
> > Maybe we could name it drm_sched_entity_get_runtime_ns()?
>
> Both fine by me. All no big deal.
>
> Acked-by: Philipp Stanner <phasta@kernel.org>

Thanks all. I'll rename it to drm_sched_entity_get_runtime_ns() in v6.

Thanks,
Sidong
