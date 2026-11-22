Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348502;
	b=BJE0eRoeTGHOok+e5W63E4vQnuLX6SQ7YnB35NzZLN5ppBreqhU373B6Md2S7xCBmB8e
	 mKIsbhcQNcPRe4NmTfvYIsRD1uSm/2vuCZcWTBUoxc8zNGpvro3NmQTz7Ny0iUb7NVqv2
	 e6lTNj8rbUea5lSVbTUDLMqjYx/eyQi7irWVzTA+xBiYwmo1G1yFeAizPQ2a+jL/DT2Ek
	 k5xe3ueIIGyeVdpGpaLzKoEHSNa6AJNj8tS82PQeUlaK3BLC6WHLLuyGoPunP+1Gs/poG
	 xuyWWJMh6dwJis/Cg98f0rXQinYrl/1uwesjIoF0U7nzXDmbAb9qIGa6dvU1jvwotcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8c6qVyqNZ0SqHcZpSnANumyjBAiFjdYDHk+HUxi2Enk=;
	b=fvatBbkjRit14N7ifoCYqOnzBsEsRopwQS6n9OdFTdjU1tn7b6d2UcnTuIXThbEnIzjU
	 /1NjPjD7gtbbXOcs4qc9u/jg9d69NFssoMk4kV6sp4UYDLac/8HhK0GTVzZUS8o0FfKMe
	 JWdEQiOPSgP6W+iDa9exSdwzfus8K1rPqrbFJCGPlLNm8gEdVReZZ9F4Ak2PI9HL6JeTq
	 kCh755BEfttwfuXEesx1riYrSaa8uAuZTLJxpRsKrJNmgBYizqQIEioSbGAhQqbmwLJUU
	 N6c1IVVa+gO74imAKaw9utcZCmKdTd3J3jGuvDfAnKqw0X24sD54/lEUQ2EoljMTK2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zdk7RKsm;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8640606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8640606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zdk7RKsm
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1318569f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 03:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795348500; x=1795953300; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8c6qVyqNZ0SqHcZpSnANumyjBAiFjdYDHk+HUxi2Enk=;
        b=Zdk7RKsmohrx5k/Al/SkovQbicu1EKXI37wI5NynMo18Bejrr9QqTge3LQUQFo4NaJ
         QShG2NRTlhn/pNf25M0pWVJck94Kex/RP6CnG8t+3Kzl7yc2Jo89ONSbSqPw/K2XgINc
         kyGcGB48KSKmJjUd+3HnNauJKhZJtQscJM2p+uPICSuBOQscn0vA3DS2YqdDXgnCIlXf
         eD3TL9LlSjCG1+MPO/RUF8otTJL1Dq7lCfFelnFxSHd9+ijeDWBdCouZxwAD/Wbqp7cD
         35PLtNOXBbDyWokVwrcgFG7sYlGWvNZtD9Hj7BblPU1I7FakYLUJ1YuJ52qDUVZUY7ha
         YMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348500; x=1795953300;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8c6qVyqNZ0SqHcZpSnANumyjBAiFjdYDHk+HUxi2Enk=;
        b=Nw/y4K8BR/YM/ZiqcgN6RCYiy7rKfgjCYfjV459zt9AAwql18MmcD49CnTW050uNZr
         xzehD5PebyBfyNqA9PEo90Qr/kFHBjQdnsRJqHsgJVvDnIrm/SfqlrRa6eUqnF2Qh5SP
         0jVuROg1rRb7AB+MAoxsQq0ZZN8qDFrFZL8ph5nhBrZTPX7iHhJAXnu8/m3bYO2RT2jE
         HGW28MioBrMbDxd7ww84cxLYdToz7KtCEpGKoqqzaYO8bGW2QuT5HfueKNw5YpnelTgB
         nqbWdjJ+ec84MpA6LkUyKVBUYwHldSU7Uk19rPxpsbsA8tvOc+atppjD4VB1+NHVGZeC
         Kb6A==
X-Forwarded-Encrypted: i=1; AL+hErESpPd3OuIhCta6ydXJQqRWwVfuxBJJq7kKsVV/4bXD8linaPW/Wei0kWcaM6jjJ0oTfzKXcaF4TyPPMpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8z0G6BzAvSBeiVF1JSyIYghJ2wqTFjBsVEWG7ZvF8Nep+y792S
	zckTdkdaQ7lE+OsnM5QEFzLf2rypLL/lUXCBqCACTE+RLpJURTE3b8MU
X-Gm-Gg: AZFdTZfdc20Bu+XYSZLP0HMlzTNXUwK9LTR+N7BHGX1YAqUgM4YyoG/BxNRYkRSlIOY
	o8kMkzdaS3yORVYIw/jFyemQVlI7HM/F7wHfDZbht0whBeDQeNNmEW3FFbwS5pG4fnCAP7IIR/R
	qxgyzMMoQLnNMZxbFNg3w5G8B1wjuA2jTkGX3WJuLm9VPdAEdkUP0BpvpN4EKVGCGJUlpJ1VoP6
	kjY7fatLVHhUMaLO9aGo4C25PWOw2rwxeoe0EyVeoWcs6nsVAbj6g1BHM4PEEQJe9GNWAbOVmWU
	sDSDiiTiAHpUZZXTfBY2wKbti9CVVXWB5OIxY3rHtTtVupqP2bInr6ImPEQ2W53JTwyDdH6RVgJ
	OonPOd2p9x4iJ5jlDwc4o2vp4at3dzHx/MBRmUHpGyDCD87MTNiqP8fd0KbaCHfeHbBDQqtnkCR
	pSebQmvDlJkc/z+nIj2E/3SwOEs8ezRhIdPmIcJaRrfQXYD+aESYFrHOezBQpAJAaRdGm8cAUu9
	MqRTcFfLqgjTzwiz188ko0LkpqeI9BvRGWBvbQbIMmyTryRPdTiYXXo5F4vehjCn13pObR/iF6T
	pqEtlusD4i70V68v4zcXw7a2yF3PvP5nVqQ2vl+wFsp+2x6PEjkFLaK/I7d5QQJ6bQ==
X-Received: by 2002:a05:600c:6092:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4bb8892bb67mr166647795e9.19.1795348500044;
        Sun, 22 Nov 2026 03:55:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm168516455e9.2.2026.11.22.03.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:54:59 -0800 (PST)
Date: Sun, 22 Nov 2026 11:54:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Cc: jim.cromie@gmail.com, Arnd Bergmann <arnd@arndb.de>, Jason Baron
 <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Andrew
 Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/6] vmlinux.lds.h: drop unused HEADERED_SECTION* macros
Message-ID: <20261122115458.1da4b8e9@pumpkin>
In-Reply-To: <20261121-vmlinux-lds-v1-2-49818f3f5cc0@gmail.com>
References: <20261121-vmlinux-lds-v1-0-49818f3f5cc0@gmail.com>
	<20261121-vmlinux-lds-v1-2-49818f3f5cc0@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Nov 2026 15:49:20 -0700
Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org> wrote:

> From: Jim Cromie <jim.cromie@gmail.com>
> 
> These macros are unused, no point in carrying them any more.
> 
> NB: these macros were just moved to bounded_sections.lds.h, from
> vmlinux.lds.h, which is the known entity, and therefore more
> meaningful in the 1-line summary, so thats what I used as the topic.

Maybe remove them first?

David

> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  include/asm-generic/bounded_sections.lds.h | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/include/asm-generic/bounded_sections.lds.h b/include/asm-generic/bounded_sections.lds.h
> index 8c29293ca7fb..268cdc34389b 100644
> --- a/include/asm-generic/bounded_sections.lds.h
> +++ b/include/asm-generic/bounded_sections.lds.h
> @@ -18,19 +18,4 @@
>  
>  #define BOUNDED_SECTION(_sec)	 BOUNDED_SECTION_BY(_sec, _sec)
>  
> -#define HEADERED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
> -	_HDR_##_label_	= .;						\
> -	KEEP(*(.gnu.linkonce.##_sec_))					\
> -	BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)
> -
> -#define HEADERED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_, _HDR_) \
> -	_label_##_HDR_ = .;						\
> -	KEEP(*(.gnu.linkonce.##_sec_))					\
> -	BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)
> -
> -#define HEADERED_SECTION_BY(_sec_, _label_)				\
> -	HEADERED_SECTION_PRE_LABEL(_sec_, _label_, __start, __stop)
> -
> -#define HEADERED_SECTION(_sec)	 HEADERED_SECTION_BY(_sec, _sec)
> -
>  #endif /* _ASM_GENERIC_BOUNDED_SECTIONS_H */
> 

