Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795798341;
	b=r49SPR7ubvmSjS1ykqyqyInenwCqYvkj+X1cifq/6Nb2QXb9PtbDu3U6hhhOKqshyO1v
	 9bkpT3g2UCkmPVdcl8JmDRw/u+q+cLLTsOAT+1Z28ppgmbMAENm/BvwC40viQK1AKNlG3
	 l/TaUCfBYfmZnRlMQt/kJ7jImeYPXYc+YhIPdIZIFR+Wav47ZUOIVCsgOB/4/7QQZPcJn
	 vAEGJhIxyjFVnikipEYfWFJo+l6mBuh31pXPG6SuH0VoDOepsd6Gfyr90YbYw01BwZxjH
	 jYQG4NE04I3PQLcpfFHqGf3X0yGCR03Sb5HPjrMPhUdhZKt0guWO6AYwfKB8iDQbB8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795798341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EDMWVesK5h/G+OAeuVJlhdz6opzFKvO3nN9e5kJXKQ4=;
	b=4VBTRMaRvllTUX5bglqyT56B4iWv4VpL/NYDvPXolHlvQjeWavK9xsHGE+39YEbnkYXz
	 hMmxDfMSefoy2CLxIGJQE4WbazbITheAGrG7VYfZ6eSRihSMWA65dbYkGE0Gbl7yDkGSK
	 FYzSQNULi7D2vMBLvklTjh9iG6puzdhYN3ZV1nPpeGG0ul/Xz7/QWcdgULkVDd+nEbj/I
	 xY5Qcq0UKNiEZy51Wp0LPizLtpxowI5x1Yos1WKkZJXc5LNPR2UGLk3KhiDBeT9IGLsi5
	 PTNL2F6KsFEQ6Z6abY46RTPorDKivPefc+adkYcshi34wIL3SuPVDz7ZqQGjlckWjYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHn3Qg18;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2743D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2743D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UHn3Qg18
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso44476875e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795798339; x=1796403139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EDMWVesK5h/G+OAeuVJlhdz6opzFKvO3nN9e5kJXKQ4=;
        b=UHn3Qg180o3Y0JkGA9NcjQcC29XNgx52gvObAzf2SoIIts2HX2yJYkQk1KyjktYYnL
         rXhMaABPQ0BjnCdhYKiDApZRTF5tlNKj9YJDxPIzShc0ICBdDZnHJ7fbktYnJIm6G5e1
         eRPybXXHTqoG1D8zXT1LkbFUJKQ0KKsdjLO3mwST21i0uLbbmGzuDH7AggQEfcLgClPZ
         zweE2rXq6vutZJ17n7cFtOG8gZm559+hiN1qyIjuoqp+wQ+ICoupHXmvCnIXrDS7g1AD
         tGrs9xWGNtra8dvGxtF1mZXyVObfn8rlNBXU2II95T+A0kM3R1Yen+hQwB+L2TTZ6QOp
         RDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798339; x=1796403139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EDMWVesK5h/G+OAeuVJlhdz6opzFKvO3nN9e5kJXKQ4=;
        b=cEqMijz3bWaPBVVPL13h+XY7nlfTZRmp/qgQSI9lslGAWmXNSlL52MhFbaMUs5XOBe
         2s8PzB2GMp9FiyCFHkG+ImR3ShPuD84PvSpEddTAIgTw+1PbqGosHIhJMfJYgHMGNXjF
         7Bc4oVv+6rtr1GbZbrL4wTNAwKVBtdnq1Jov7voBmFblfGashDgUgFJ0c60X02vGQjgy
         mbIlrmMq6G25WLgIVffbAgdI6lUAq/3u2hDMpJv4Zh1glpk/rKfX73GEpRQW74lc+INR
         k6GTptF0lT0NVND0PbDi4VGpa7yDShV00oNRG8aWu8FUJ8iQZC3yUFW+3idlkmuj1QRb
         h8Lg==
X-Forwarded-Encrypted: i=1; AL+hErF8SbLjUnX5TPdRTmMZ4RMUeHzm7EbnNsAY6y9ZYg+Syn8MQg9XT7t4yArULFGBlGfArh8RYGctBaMd9Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F3RIebtf3vxrLcZabZLwROLeas6JV/+bLV06zDhH22fniCYXa
	28cof+Smt21X2JYVHPlYVkwGywNTYN7Bjj/rFyjY2vWxLaciCylzHOBQ
X-Gm-Gg: AZFdTZcfNVSW0agZHEkLlof1Ztbspnkuta1S18tN2oRvXDKy0XprYvYupzdwEhBJ2Xx
	6UKPl5RnusnouHZqhJ0p8fYpZSRzbzAXtrOmGdShr/R/y/+0hrsxWY6NpNa319zu8OYKzKgPwDH
	S4yMUTTt+xYbT7akLF5ASdwFcDpsA61/awlLG+R7cHsY/3zYgiZRY8iQcVy38jPNZyEi1n1YG0b
	vjIui/2dn9NGL+z5zvRZrFgFIOlLHIWB9rfvaF/wzk2XFFP9LhzcRXqrLFJ5+LlbItk96gtLYjf
	eBz74rkvlBRV8mQ/Pqy5GCWiReHez/706AzB7ZnrGqRVeEm3Pd2n5b6pnfOy9/bbT0YeGUqIKHm
	XzleRRBR4bHNh8Ddr4bM3JDMyVfzHdJgENMCnbeszR3/rIohXao/5zET/H+8X9cuhIzXVOJzLEB
	aIOaUvY3s/i8Xa8/PUuzTXlYb1mi/FBuCLfyIJrENQG6vst3ukPtrQmgp3ryEnx7ObaNkhe/3mN
	5c6qUzaS5LivGC5gXQvCjbaj4+79faYwVZhyRRa7G+CwwCWKmVb14za2iZYMwD6Zr0WBr1to6w2
	OFw5bffQRHsrja2vMzjh/gDKYR138C9l9PJ+986yEeet6QaVOW/PY5iGuVj/OCAb9Va3BL7DnaT
	AygWMuOsfEzemQuoYZTZY9xlJxApW4eUlAYhN9anN1s6/gRjx5K5LINsRxIkc2NbNXpV2BDWXKw
	==
X-Received: by 2002:a05:600c:8486:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb8880606fmr516863545e9.12.1795798339356;
        Fri, 27 Nov 2026 08:52:19 -0800 (PST)
Received: from othello.home (103.153.90.146.dyn.plus.net. [146.90.153.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm696593655e9.10.2026.11.27.08.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:52:18 -0800 (PST)
From: Cassio Neri <cassio.neri@gmail.com>
To: thomas.weissschuh@linutronix.de
Cc: jstultz@google.com,
	tglx@kernel.org,
	sboyd@kernel.org,
	mlichvar@redhat.com,
	alexandre.belloni@bootlin.com,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	cassio.neri@gmail.com
Subject: Re: [PATCH v2 1/4] time: Avoid 64-bit by 64-bit division in time64_to_tm()
Date: Fri, 27 Nov 2026 16:52:30 +0000
Message-ID: <20261127165230.40533-1-cassio.neri@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260903-time-time64-to-tm-v1-1-660be972adfc@linutronix.de>
References: <20260903-time-time64-to-tm-v1-1-660be972adfc@linutronix.de>
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

I agree this is a good change.
