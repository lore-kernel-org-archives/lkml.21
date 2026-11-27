Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795815676;
	b=2UL60zNrX7oYwxBi2ss9s/q4XOF5f8XZJ9LBmyF6pRqzSf+9VrJFNQn2+X97lcdvt21B
	 ij59Cr/JS3H2uitX5ZSqqafF3lj5YLmVOc0RkQQMtzFEJFG1MVc41yeAzXq05hTfss2vx
	 J2WCi5//9ZOKAv48nGWjO3En6hu6X5ARmcGYa2aFZ68vYSCXcAjFfxe68+QrF+/rlFO9f
	 kKa/Nw3zZRhUaGSqPtWMfy6AVOwTkd+4Gs7d5gRMMOBG2gzLsonVa2/lMehru+4g+WyKN
	 eMvNWUUNr5bFy8+CMw1WmgtPIrVSgqryV1h1tTNKEmFPvi37N1E2zc7RtaApHO4apsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795815676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
	b=UMScrkyykP4V0Z695XXUxlnN+9evumzqRQCeEg3BrdE7Tp8ZEFasmm6QB/s9PdrRf23m
	 He6EmPILL0PRJcJ6VeDHY7kLvBM9ibPbrQO1Scf3akKslZvVTRRygXbVnQHhjNJtuH09r
	 jjo8Dxfzn9E94cgrH/ocOXOBXQ2/3JCU6saf3WBalhMPiCGQQeGJsBOftzR31xQ1ReOP8
	 stemiYzF2Zzc6rzi8NGiLL1W0pH3/r06psqexRzYb4LwpI0UGIOBlF0fTlL6ujfAYmVQc
	 MtJcvO9iwrSBtEo2ZNztpQLKfF11NWyod+uyg/il4QQUnLGYPOrFviM6H/pEcK51ExA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlJzjc+L;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8CC606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 21:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8CC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlJzjc+L
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso83007925e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795815674; x=1796420474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
        b=rlJzjc+LyIk9Bk0QS6P/I8TDEexyuBC3YqrMNuS8l9ecZxXqzecIXHrsa2+jjLCIkd
         AvdgA+lDcovhfWDGGXxDDTraLo/z7WixYN6CS0WFtDPjvWLKrdb2LmuL8SVsyVcmcUAE
         w7uKvqNGQ6fgCtW1/YqXftDsvKWqzLc/etNTUBIImSolgJ458EFpxfvonhxlMSH2he0w
         gpZYXR2cdjzW3qoLBTUFALao2MhHDceARIdwR8T5fNHKRhO5CZKehhou/RRtD33QzCTW
         J9VxQgQTSkBjmppRZyAfVgxgVnOD9jDbF3HW5K6gfIlLPnr/76nWxRQFxdk3GCbefAfK
         3+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795815674; x=1796420474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GNjJtSmgBzeJqa75AyMuB1FfpMIGeExfgQrDDeRI15s=;
        b=ioSGwpYwzWmTN4a4X/8ZeDHmvtlWn4mhKPUciqqJRPgms9RphXS6s064APRSpFXmFa
         bgj2JKVXets8Syacb/WRrR25f50Q7/ZG84PJ3Dai0AD1wxZtuOE9irdlrO6rOQFWeJSZ
         oCNqafgzj8GVZoqxqro/dZDC3Dac6KT5lusb1i00uAN2TyzJRsiH31gKVPudxv1UkoSA
         5r4addufMOo59c5P75CC8X2/E7xDQAuju37S3WDmaq8XZeRXMk4Wxwqijgg8QZkHVfga
         tV4cIv0ofYlw1hI/fYQWfdjDqZQP3ASZwD/0Ggv8Ie5kCUQr8xLKAk0LlXQdMft2Sv5I
         vAtw==
X-Forwarded-Encrypted: i=1; AL+hErHGKD4yCDN8DsF7gQs4wCNPRZKdL30/dZy4OvhxAyW5Whby9DPBqHMkqek7g+Q2cPF+unrIXKIFjfNt4NU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wvaKvbpbN0YWX9FAUQZZQY/do4H2eBNyPfJBhR58FrC2oQNQn
	S5iGQ8L9PfRBv38ss9UobvnBUOYdSQE3tIteaswpw6+6cSO21fiXyId2
X-Gm-Gg: AZFdTZeigPVCYBMi/99PYJZqhBXQhFlpNk/puBPNESzHh1QshQYw6TqyGPlYRalTMvV
	FcIlS/nQeQr/UaG7K4oEPhp+EijW9sySnVNfANyQVNXfLBR1p7D1J2IIWwgKokB4LOix6scBmlJ
	onLSVKNbeRKE2g7jXxPjKoSy5IdSAVyDIPBROcdjWxFZa3qnTkD5Vs4ZWrGAHcyiw2xIz7QNT2t
	Yd5utFx2RggSt/8jxvMxQO8GJ43feYftISC49J53plzsSkBg3NRlE8qO8Awrsil2Of8mfIu2Hid
	PD6j4bRaaGLUS13egQ7rGIbUpXiqwUVWdFRCN6KbSJ0fOlWuOSdOpLZjpqqI96AjZRpS6DTEDKD
	MMfoviFkkR3ApevYR239HQEyF51YhJCf8hgdC+34zJwopIdkG600cTKAdYDfooetRUEppbchyUW
	9YM6P1U7MZbyQD/Sov1gEKUI6YroRFg0XCagtolmbEk1usuv9AolBVA1ZF1aHyQrPaw0AMa+A/E
	xlFo9g5BUyY1SkU10ZQr04ayAB5OPeta0usLWpxFt5YsckJI8+RYYMPeTUeWIBDt7ASRsbTKeE0
	/DnlZltabFglol+RZzlSVf5aXQ==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr518939935e9.11.1795815674386;
        Fri, 27 Nov 2026 13:41:14 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bbb97e5356sm37714445e9.4.2026.11.27.13.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 13:41:13 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: jarkko@kernel.org
Cc: aleksa@amutable.com,
	alex@amutable.com,
	alexei.starovoitov@gmail.com,
	arnd@arndb.de,
	bpf@vger.kernel.org,
	brauner@kernel.org,
	containers@lists.linux.dev,
	corbet@lwn.net,
	dhowells@redhat.com,
	ebiggers@kernel.org,
	giuseppe@scrivano.org,
	hughd@google.com,
	jack@suse.cz,
	jlayton@kernel.org,
	josef@toxicpanda.com,
	kees@kernel.org,
	kpsingh@kernel.org,
	lennart@poettering.net,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org,
	luto@amacapital.net,
	neal@gompa.dev,
	oleg@redhat.com,
	paul@paul-moore.com,
	ptikhomirov@virtuozzo.com,
	sergeh@kernel.org,
	skhan@linuxfoundation.org,
	viro@zeniv.linux.org.uk,
	zygmunt.krynicki@canonical.com
Subject: Re: [RFC PATCH v7 00/26] userland: Userland containers
Date: Sat, 28 Nov 2026 00:41:03 +0300
Message-ID: <20261127214103.542291-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <awOQDOel_72Xwjm7@kernel.org>
References: <awOQDOel_72Xwjm7@kernel.org>
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

Jarkko Sakkinen <jarkko@kernel.org>:
> I personally think that "getting in" should not be a goal in the first
> place. I care more about that whaever gets in has a high bar of
> quality enough. It can be something different than this but
> when I read the LWN article about Cells I was alarmed enough
> so that I had to do this and prove my point.

I think that Bacik's patchset has better chances than yours.
I think so, because (as Bacik said) it was tested in Anthropic, and also
because Brauner reacted positively:
https://lore.kernel.org/all/20261021-zeitig-niemals-clubmitglieder-b3973fcebd38@brauner/ .

So I suggest reading Bacik's patchset and say what you don't like about it.
You will have chance to influence Bacik's proposal before it will be merged.

(Note: I am not kernel developer.)

-- 
Askar Safin
