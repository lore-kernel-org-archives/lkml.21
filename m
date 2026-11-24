Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557003;
	b=bXTSa4JWZtGH2f9VztMsaOyHR4v4J8fVoaKGlBWb7h4f479F2nPCo1Jo3NJByMmEIhf2
	 rDv8pvBYpb7ryZcxVmJn6HLQ1RiyoBvK9vjY2dY5Sv0KetirpAiiGG9CKzalBiBuXV0w4
	 tD4eg7murO+uEJOOrxOx8MWstRK0zqaJuyfYNnSqRSDRK1ALHOPh+wYzCqVLHNFOOKMrO
	 5Js1EQGxMXHigoNYDOaUt+e1hC0wVrrhFOYVaX6oQeC+TeDb7lvjreGBUl9PFspqu9f3S
	 ftmDDEyDOpe8gnYvdbrr+QY0Gl8goOJ+oUtXj5RZ5tyOELkmaVTR6WPYBdkAeNRRs+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
	b=nKYiAJsGIxVzTOUC7+MlUqkVlhjT0t1orytW5aj/I0W0vpKCtxdxxY7HFfRU2qNMZYED
	 gFzMjncQkNVnwB25WGkK7c7bEWdODHxRYjMM0EDTcgVl2yd4KIpekblP8rStRW5QeL/gk
	 n+ptPgKrPD3YOkpaehVgJsHyUb5JzCOKi6KoAXU/3j14mJk3LoiUNnPClLVSSOwveOFvE
	 jYpsKZCgwuh7QzHFyBI8OPXdmou1WhCtu28oahKMm3w6CRsUjZbrwQ3gmRY6c6gehHV7E
	 YpB7BLQPDJgMPXPssmKpP0l6HSbUkTfPdcigyMNzjfbZN6cxHrF/xfBhUoaDC5pWGoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fp1Mhntr;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F81606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99F81606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fp1Mhntr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a35df85cc8so382663f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557002; x=1796161802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
        b=fp1MhntrLogHIUip4FbRNJKgWHj0LrTc8fZZovGtzElIDsO9y0NOAIL6mqq35lixzC
         AwmfPCM/wLJd1kp/v46CitnfBIH12MWpgZr8aJZ9uK+eZz24zYRUlwADwEaNNft/PSYD
         9Y2ieWJ9h6JfkronDg3awtzO/DkFNEG/2dQYe0sR5it+ERZ6uT+LJMmO5GbLUh93nefu
         VUlqC7eFCZ98QJQFZoO90yVKuuRukiBGyhi8yzXNZ4YJ931B5azsQqNPH7C2UEj6hM+h
         lazIEN1nFiHKmHlrjcWublPnYkeXVLNeH9Ts3DJMUTc40lD0CuzsuBG/fbJno8piySZQ
         pfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557002; x=1796161802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
        b=kosLZEDSMiWIh7JhvM8IesmEQm4zYGdHwDtLmLC3ji0j7gI7/rO9zG4rDuGTO2glBp
         qFnuYjwND68WyqLGM0HO4kF/PxSEvt5DRZyG3GG83UUcgmuaRS9IupYkuyUwS17fBANh
         /8K1YSV4xiGh53HDIyx1OHD73yt9ZHKcjeP1DTyB/8oifRoH9mTpoZMQlgFHMHPXizYP
         FSM5iLSgYi/n47jB9NkBrrffdk56MaS+OycI74Uo34QKW0dBE1l72tmmMalMg533fQRj
         ftn6ntOEuSDdJKdCgi9ZHTOygiPajkIuigERUTeElKsMdcjWcmYBNubn4dv0U+7FLFbm
         734g==
X-Forwarded-Encrypted: i=1; AL+hErFzVvhHa8hQEphI3eeG5ZoPvOIv+q12pwXdTqxTR6Y6e6jnEQaM/1/Fn221ZG1N2tgKZUETqoDpCgAomj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7W6EkFVflMomuLJ4iIaxTXFF8jYGl3zO+TlIGAshjtvnD80A5
	LI3u3WK+NCOKrjWzUVroP9QLm1LlTYTM6HJOYjPFe9nMieCeaZZhYQP0
X-Gm-Gg: AZFdTZfb0NWohEkyhrRSnC9w9uVOddnvEYUAmMNHR7JtocqBztzWb9Zqq1WgWW+4pOt
	qfxz8Slt6KbMEWezEonBw4z0/b+D7QnyBTSOGpCS7+EXymDqtsv91oUvVtdg1ImQ3ds6Ldp08IU
	OImL6oCLw9lGakZNszbJZ9GhRIbKxh42C2L+9yAtt5aEjvQsA9RPW45hD8wmGhM5EEp6SNfn/Gr
	E2QxL6zq2l6qUkWjyOD2mrQdEwWqWfpUqErCunEpoTVzkkcEN8wkr1Otf3zQJnPtUceEQ+N9ayN
	9EwP4+m8WVx7SY13DWI/Y9T5BnnkgqcL4NSNapUMIDOAC1qOmeyaHijrDOqFo8kKNPKozZmhkxW
	pwnbiMW5UYyGQZyTzj5VGQ+1joUPj8+7JQ+AqIotZnbSlSS/rNXOVgf3DMsnc6a5i+4IynD0lA8
	voOKpF6XIn9EH7DxMJpz9Aprb+BLJXBujUuK6ctYt5vh1QjKWMahXT0z68TvNY0xjCjGX7i6edp
	nSBXM/GV+QuQx47UtDDTWXDLGlkNhTQWCaKohbZTjQeaJDddEf7viAL1P2seXocPo66218nJc8J
	Yd2v1YuZc7cN0BFECXeFMtBBZI6+hq6Xsgyp9eAQ9cq88ez9Yd0khAjwqEtO5TTm0rQ+Y2oj+Qg
	d0YPF8gF427r7DfQ=
X-Received: by 2002:a05:6000:2310:b0:491:2367:1dca with SMTP id ffacd0b85a97d-4b3fd477a9amr13343648f8f.3.1795557001928;
        Tue, 24 Nov 2026 13:50:01 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29188507f8f.0.2026.11.24.13.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:01 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: hangbin.liu@linux.dev
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Tue, 24 Nov 2026 22:49:47 +0100
Message-ID: <20261124214947.13846-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123054754.GI10218@Liu-laptop>
References: <20261123054754.GI10218@Liu-laptop>
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

On Mon, 23 Nov 2026 13:47:54 +0800 Hangbin Liu wrote:
> An "e" here?

Thanks for catching it. Fixed in v2.
https://lore.kernel.org/all/20261124214736.13398-1-emmaonana18@gmail.com/

Omokefe

